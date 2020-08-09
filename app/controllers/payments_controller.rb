class PaymentsController < ApplicationController

  def get_stripe_id
    @teacher = Teacher.find(params[:id])
    session_id = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      customer_email: current_user.email,
      line_items: [{
        name: @teacher.user.fullname,
        description: @teacher.bio,
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

end
