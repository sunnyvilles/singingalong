class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

    	t.string "username" , :limit =>25
    	t.string "email" , :limit => 100 , :null => false
    	t.string "password" 
    	t.string "salt" , :limit => 40

      t.timestamps
    end
    add_index("users" , "username")
  end
end
