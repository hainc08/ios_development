class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices, :id => false, :primary_key => 'id' do |t|
      t.integer :id, :limit => 8
      t.text :deviceId
      t.integer :os, :null => false, :default => 0
      t.integer :my_id, :limit => 8
      t.timestamps
    end
      execute "ALTER TABLE devices ADD PRIMARY KEY(id)"
      execute "ALTER TABLE devices MODIFY COLUMN id BIGINT AUTO_INCREMENT"
		#execute "ALTER TABLE devices ADD FOREIGN KEY(user_id) REFERENCES user(id)"    
  end
end
