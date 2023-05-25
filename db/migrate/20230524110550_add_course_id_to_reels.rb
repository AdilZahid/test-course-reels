class AddCourseIdToReels < ActiveRecord::Migration[7.0]
  def change
    add_column :reels, :course_id, :integer
  end
end
