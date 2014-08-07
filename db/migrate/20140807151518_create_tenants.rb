class CreateTenants < ActiveRecord::Migration
  def change
    create_table :tenants do |t|
      t.string :title
      t.text :description
      t.string :logo

      t.timestamps
    end
  end
end
