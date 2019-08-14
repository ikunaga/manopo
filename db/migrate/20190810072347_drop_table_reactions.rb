class DropTableReactions < ActiveRecord::Migration[5.2]
  def change
  	drop_table :reactions
  end
end
