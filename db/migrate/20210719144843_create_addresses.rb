class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :postal,   null: false
      t.integer    :area_id,    null: false
      t.string     :municipality
      t.string     :address
      t.string     :building
      t.integer    :phone,   null: false
      t.references :order,      null: false, foreign_key: true
      t.timestamps
    end
  end
end
