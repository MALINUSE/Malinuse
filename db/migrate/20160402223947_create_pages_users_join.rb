class CreatePagesUsersJoin < ActiveRecord::Migration
  def up
    create_table :pages_users, :id => false do |t|
      t.references :page, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
    end
  end

  def down
    drop_table :pages_users
  end
end
