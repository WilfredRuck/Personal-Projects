class AddNotesToPromotions < ActiveRecord::Migration[5.0]
  def change
    add_column :promotions, :notes, :string
  end
end
