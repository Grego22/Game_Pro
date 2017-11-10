class CreateCatergories < ActiveRecord::Migration[5.1]
  def change
    create_table :catergories do |t|
      t.string :name

      t.timestamps
    end
  end
end
