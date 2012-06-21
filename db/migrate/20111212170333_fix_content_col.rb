class FixContentCol < ActiveRecord::Migration
  def up
    rename_column :updates, :conten_id, :content_id
  end

  def down
  end
end
