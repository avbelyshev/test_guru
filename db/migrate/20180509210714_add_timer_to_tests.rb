class AddTimerToTests < ActiveRecord::Migration[5.1]
  def change
    add_column :tests, :passage_time, :integer
  end
end
