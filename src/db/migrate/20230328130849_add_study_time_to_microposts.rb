class AddStudyTimeToMicroposts < ActiveRecord::Migration[7.0]
  def change
    add_column :microposts, :study_time_hours, :integer
    add_column :microposts, :study_time_minutes, :integer
  end
end
