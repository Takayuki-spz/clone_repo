class AddStudyTimeToMicroposts < ActiveRecord::Migration[7.0]
  def change
    add_column :microposts, :study_time_hour, :integer
    add_column :microposts, :study_time_minute, :integer
  end
end
