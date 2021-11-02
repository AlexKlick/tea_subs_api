class CreateTeaSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :tea_subscriptions do |t|
      t.string :title
      t.float :price
      t.string :status
      t.string :frequency

      t.timestamps
    end
  end
end
