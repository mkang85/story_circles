class CreateCircles < ActiveRecord::Migration[5.2]
  def change
    create_table :circles do |t|
      t.string :you
      t.string :need
      t.string :go
      t.string :search
      t.string :find
      t.string :take
      t.string :return
      t.string :change
      t.integer :user_id
    end
  end
end
