class AddEmailToAdminCourses < ActiveRecord::Migration
  def change
    add_column :admin_courses, :email, :string
    add_column :admin_courses, :batch, :integer
    add_column :admin_courses, :curriculam, :text
    add_column :admin_courses, :phone_no, :integer
  end
end
