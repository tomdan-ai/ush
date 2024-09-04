class AddStudentRegNumberToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :student_reg_number, :string
    add_index :users, :student_reg_number, unique: true
  end
end
