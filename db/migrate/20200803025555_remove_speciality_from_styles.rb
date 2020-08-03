class RemoveSpecialityFromStyles < ActiveRecord::Migration[6.0]
  def change
    remove_column :styles, :speciality, :boolean
  end
end
