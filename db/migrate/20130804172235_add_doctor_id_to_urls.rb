class AddDoctorIdToUrls < ActiveRecord::Migration
  def change
    add_column :urls, :doctor_id, :integer
  end
end
