class AlterTableAutos < ActiveRecord::Migration
  def change
    remove_column :autos, :classe, :string
    remove_column :autos, :assunto, :string

    change_table :autos do |t|
      t.integer :classe_id
      t.integer :assunto_id
    end
  end
end
