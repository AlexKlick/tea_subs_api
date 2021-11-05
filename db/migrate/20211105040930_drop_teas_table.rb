class DropTeasTable < ActiveRecord::Migration[5.2]
  def up
    drop_table :teas , force: :cascade
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
