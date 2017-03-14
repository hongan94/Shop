class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :header
      t.text :body

      t.timestamps
    end

    create_table :comments_users, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :comment, index: true
    end
  end
end
