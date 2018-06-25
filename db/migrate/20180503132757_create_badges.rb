class CreateBadges < ActiveRecord::Migration[5.1]
  def change
    create_table :badges do |t|
      t.string :name
      t.string :image_file
      t.string :rule_type
      t.string :rule_value

      t.timestamps
    end
  end
end
