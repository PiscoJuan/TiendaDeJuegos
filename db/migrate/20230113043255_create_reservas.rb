class CreateReservas < ActiveRecord::Migration[7.0]
  def change
    create_table :reservas do |t|
      t.string :id_videogame

      t.timestamps
    end
  end
end
