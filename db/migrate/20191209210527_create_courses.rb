class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :class_time
      t.string :description
      t.integer :user_id
      t.string :day_of_the_week
      t.string :teacher

      t.timestamps
    end
  end
end
