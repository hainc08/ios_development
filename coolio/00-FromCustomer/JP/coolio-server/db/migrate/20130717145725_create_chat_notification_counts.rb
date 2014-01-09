class CreateChatNotificationCounts < ActiveRecord::Migration
  def change
    create_table :chat_notification_counts, :id => false, :primary_key => 'id' do |t|
	  	t.integer :id, :limit => 8
	  	t.integer :my_id, :limit =>8
			t.integer :countValue, :default => 0
  		t.references :user, :limit => 8

      t.timestamps
    end
      execute "ALTER TABLE chat_notification_counts ADD PRIMARY KEY(id)"
      execute "ALTER TABLE chat_notification_counts MODIFY COLUMN id BIGINT AUTO_INCREMENT"
  end
end
