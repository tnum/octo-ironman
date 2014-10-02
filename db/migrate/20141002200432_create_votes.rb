class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :value
      t.integer :user_id
      t.integer :post_id
      t.belongs_to :user, index: true
      t.belongs_to :post

      t.timestamps
    end
  end
end
