class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string	:title
      t.text		:description
      t.datetime :start_time
			t.integer	:duration
			t.string	:location

      t.timestamps
    end
  end
end
