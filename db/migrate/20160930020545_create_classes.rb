class CreateClasses < ActiveRecord::Migration
  def change
    create_table :classes do |t|
      t.string :nome, null: false
      t.timestamps null: false
    end
  end
end
