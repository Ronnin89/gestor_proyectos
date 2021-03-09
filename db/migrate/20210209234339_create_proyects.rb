class CreateProyects < ActiveRecord::Migration[5.2]
  def change
    create_table :proyects do |t|
      t.string :name
      t.string :description
      t.integer :state, default: 0
      t.date :initial_date
      t.date :finish_date

      t.timestamps
    end
  end
end
