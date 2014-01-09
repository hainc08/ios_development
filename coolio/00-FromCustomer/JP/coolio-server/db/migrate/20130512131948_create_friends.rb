class CreateFriends < ActiveRecord::Migration
	def change
	create_table :friends, :id => false, :primary_key => 'id' do |t|
		t.integer :id, :limit => 8
		t.integer :my_id, :limit => 8
		t.references :user, :limit => 8
		t.timestamps
	end
      execute "ALTER TABLE friends ADD PRIMARY KEY(id)"
      execute "ALTER TABLE friends MODIFY COLUMN id BIGINT AUTO_INCREMENT"
		#execute "ALTER TABLE friends ADD FOREIGN KEY(my_id) REFERENCES user(id)"
		#execute "ALTER TABLE friends ADD FOREIGN KEY(user_id) REFERENCES user(id)"
	end
end
