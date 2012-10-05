class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.text :address
      t.string :occupation
      t.boolean :administrator

      t.timestamps
    end
  end
end
