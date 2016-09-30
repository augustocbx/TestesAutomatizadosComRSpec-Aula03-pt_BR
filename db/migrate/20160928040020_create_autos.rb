class CreateAutos < ActiveRecord::Migration
  def change
    create_table :autos do |t|
      t.string :classe
      t.string :assunto
      t.text :observacao

      t.timestamps null: false
    end
  end
end
