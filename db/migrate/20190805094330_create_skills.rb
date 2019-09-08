class CreateSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :skills,:options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.string :skill_name, null: false
      t.integer :user_id, null: false
      t.integer :category_id, null: false
      t.timestamps
    end
  end
end
