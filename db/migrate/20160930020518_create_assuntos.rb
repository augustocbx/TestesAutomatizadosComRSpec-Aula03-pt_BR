class CreateAssuntos < ActiveRecord::Migration
  def change
    create_table :assuntos do |t|
      t.string :nome, null: false
      t.timestamps null: false
    end
  end
end
