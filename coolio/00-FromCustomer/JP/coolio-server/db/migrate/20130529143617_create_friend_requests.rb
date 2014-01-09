class CreateFriendRequests < ActiveRecord::Migration
  def change
    create_table :friend_requests, :id => false, :primary_key => 'id' do |t|
      t.integer :id, :limit => 8
      t.integer :my_id, :limit => 8
      t.references :user, :limit => 8
      t.timestamps
    end
      execute "ALTER TABLE friend_requests ADD PRIMARY KEY(id)"
      execute "ALTER TABLE friend_requests MODIFY COLUMN id BIGINT AUTO_INCREMENT"
  #execute "ALTER TABLE friend_requests ADD FOREIGN KEY(my_id) REFERENCES users(id)"
  #execute "ALTER TABLE friend_requests ADD FOREIGN KEY(user_id) REFERENCES users(id)"
  end
end
