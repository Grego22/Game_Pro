class AddCatergoryIdToGames < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :catergory_id, :integer
  end
end
