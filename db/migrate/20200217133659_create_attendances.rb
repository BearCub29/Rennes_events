class CreateAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :attendances do |t|
      t.string :strip_customer_id

      t.timestamps
    end
    add_reference :attendances, :user, foreign_key: true
    add_reference :attendances, :event, foreign_key: true
  end
end
