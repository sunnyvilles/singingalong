class CreateAdminCourses < ActiveRecord::Migration
  def change
    create_table :admin_courses do |t|
      t.string :course_type
      t.string :title
      t.date :start_date
      t.date :end_date
      t.time :timing
      t.string :venue
      t.text :description
      t.decimal :fees
      t.decimal :discounts

      t.timestamps
    end
  end
end
