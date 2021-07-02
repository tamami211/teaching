class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :student_name
      t.string :subject
      t.string :sex
      t.string :grade

      t.timestamps
    end
  end
end
