class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :name
      t.string :email
      t.string :password_hashes
      t.timestamps
    end
  end
end
