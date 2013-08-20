class Chngeisadmindefaultfalse < ActiveRecord::Migration
def change
    change_column :users, :isAdmin, :boolean, default: false
  end
end
