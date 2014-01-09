class CreateNotificationCounts < ActiveRecord::Migration
  def change
    create_table :notification_counts, :id => false, :primary_key => 'id' do |t|
	  	t.integer :id, :limit => 8
			t.integer :friendRequestCount, :default => 0
			t.integer :matchCount, :default => 0
			t.integer :footPrintCount, :default => 0
			t.integer :alertCount, :default => 0
			t.integer :infomationCount, :default => 0
  		t.integer :my_id, :limit => 8
      t.timestamps
    end
      execute "ALTER TABLE notification_counts ADD PRIMARY KEY(id)"
      execute "ALTER TABLE notification_counts MODIFY COLUMN id BIGINT AUTO_INCREMENT"
  end
end
