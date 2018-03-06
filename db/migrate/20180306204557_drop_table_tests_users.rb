class DropTableTestsUsers < ActiveRecord::Migration[5.1]
  def change
    drop_table :tests_users, if_exists: true
  end
end
