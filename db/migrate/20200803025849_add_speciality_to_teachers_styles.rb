class AddSpecialityToTeachersStyles < ActiveRecord::Migration[6.0]
  def change
    add_column :teachers_styles, :speciality, :boolean, default: "false"
  end
end
