class CreateSectionEdits < ActiveRecord::Migration
  def up
    create_table :section_edits do |t|
      t.references :section, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :summary

      t.timestamps null: false
    end
  end

  def down
    drop_table :section_edits
  end
  
end
