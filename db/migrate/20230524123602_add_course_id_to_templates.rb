class AddCourseIdToTemplates < ActiveRecord::Migration[7.0]
  def change
    add_reference :templates, :course, null: false, foreign_key: true
  end
end
