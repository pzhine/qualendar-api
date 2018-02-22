class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :location
      t.decimal :duration
      t.boolean :all_day
      t.datetime :starts_at

      t.timestamps null: false
    end
  end
end
