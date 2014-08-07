class CreateLogins < ActiveRecord::Migration
  def change
    create_table :logins do |t|
      t.string :token
      t.belongs_to :user
      t.timestamps
    end
  end
end
