class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name
			t.belongs_to :tenant

			t.timestamps
    end
		
		create_table :roles_users, id: false do |t|
      t.belongs_to :user	
			t.belongs_to :role	
    end
  end
end
