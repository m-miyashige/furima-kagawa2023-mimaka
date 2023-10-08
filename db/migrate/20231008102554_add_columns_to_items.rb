class AddColumnsToItems < ActiveRecord::Migration[7.0]
  def change
    add_column    :items, :name,                   :string,     null: false
    add_column    :items, :info,                   :text,       null: false
    add_column    :items, :category_id,            :integer,    null: false
    add_column    :items, :sales_status_id,        :integer,    null: false
    add_column    :items, :shipping_fee_status_id, :integer,    null: false
    add_column    :items, :prefecture_id,          :integer,    null: false
    add_column    :items, :scheduled_delivery_id,  :integer,    null: false
    add_column    :items, :price,                  :integer,    null: false
    add_reference :items, :user, foreign_key: true, null: false
  end
end
