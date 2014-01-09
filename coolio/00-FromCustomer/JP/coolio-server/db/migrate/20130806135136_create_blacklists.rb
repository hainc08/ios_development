class CreateBlacklists < ActiveRecord::Migration
  def change
    create_table :blacklists, :id => false, :primary_key => 'id' do |t|
      t.integer :id, :limit => 8
      t.string :email, :null => false
      t.timestamps
    end
      execute "ALTER TABLE blacklists ADD PRIMARY KEY(id)"
      execute "ALTER TABLE blacklists MODIFY COLUMN id BIGINT AUTO_INCREMENT"
  end
end
