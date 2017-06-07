class FixColumnNameInBrick < ActiveRecord::Migration[5.0]
  def change
    rename_column :bricks, :type, :type_of_brick
  end
end
