class AddTeaToTeaSubscription < ActiveRecord::Migration[5.2]
  def change
    add_column :tea_subscriptions, :tea_external_id, :string
  end
end
