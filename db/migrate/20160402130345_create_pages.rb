class CreatePages < ActiveRecord::Migration
  def up
    create_table :pages do |t|
      t.references :subject, index: true, foreign_key: true
      t.string :name
      t.string :permalink
      t.integer :position
      t.boolean :visible, :default => false
      #t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :pages, :permalink
  end

  def down
    drop_table :pages
  end

end
