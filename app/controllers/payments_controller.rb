class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:webhooks]

  # Creates a session for a Stripe Payment
  def get_stripe_id
    @teacher = Teacher.find(params[:id])
    session_id = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      customer_email: current_user.email,
      line_items: [{
        name: @teacher.user.fullname,
        amount: @teacher.price * 100,
        currency: 'aud',
        quantity: 1,
      }],
      payment_intent_data: {
        metadata: {
          user_id: current_user.id,
          teacher_id: @teacher.id
        }
      },
      success_url: "#{root_url}payments/success?userId=#{current_user.id}&teacherId=#{@teacher.id}",
      cancel_url: "#{root_url}"
    ).id
    render :json => {id: session_id, stripe_public_key: Rails.application.credentials.dig(:stripe, :public_key)}
  end

  # Lets the user know the payment was successful and redirects to their Student view
  def success
    flash[:notice] = "Payment made successfully"

    redirect_to student_view_path
  end

  # Receives information from the webhook
  def webhooks
    payment_id = params[:data][:object][:payment_intent]
    payment = Stripe::PaymentIntent.retrieve(payment_id)
    teacher_id = payment.metadata.teacher_id
    user_id = payment.metadata.user_id

    head 200

    # Creates a booking based on the webhook information. The booking will then show up in the respective views of the teacher and student
    Booking.create(
      user_id: user_id,
      teacher_id: teacher_id
    )

  end
end
