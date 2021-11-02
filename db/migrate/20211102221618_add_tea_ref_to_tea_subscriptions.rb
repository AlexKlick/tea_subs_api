class AddTeaRefToTeaSubscriptions < ActiveRecord::Migration[5.2]
  def change
    add_reference :tea_subscriptions, :tea, foreign_key: true
  end
end
