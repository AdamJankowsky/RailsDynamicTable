class CreateBricks < ActiveRecord::Migration[5.0]
  def change
    create_table :bricks do |t|
      t.string :type

      t.timestamps
    end
  end
end
