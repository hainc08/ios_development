class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats, :id => false, :primary_key => 'id' do |t|
      t.integer :id, :limit => 8
      t.integer :my_id, :limit => 8
      t.text :message
      t.string :pict
      t.references :user, :limit => 8
      t.timestamps
    end
      execute "ALTER TABLE chats ADD PRIMARY KEY(id)"
      execute "ALTER TABLE chats MODIFY COLUMN id BIGINT AUTO_INCREMENT"
		#execute "ALTER TABLE chats ADD FOREIGN KEY(my_id) REFERENCES user(id)"
		#execute "ALTER TABLE chats ADD FOREIGN KEY(user_id) REFERENCES user(id)"
  end
end
