class CreateFlyers < ActiveRecord::Migration[5.0]
  def change
    create_table :flyers do |t|
      t.date :event_date
      t.time :event_time
      t.string :address1
      t.string :address2

      t.timestamps
    end
  end
end
