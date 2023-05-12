class CreateCreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :create_courses do |t|
      t.string :title
      t.text :script
      t.timestamps
    end
  end
end
