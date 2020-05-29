class DropCreators < ActiveRecord::Migration[5.2]
  def change
    drop_table :creators
  end
end
