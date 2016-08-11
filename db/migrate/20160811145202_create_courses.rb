class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.timestamp :starts_time
      t.timestamp :ends_time
      t.integer :user_id
      t.string :name

      t.timestamps
    end
  end
end
