class CreateAlerts < ActiveRecord::Migration
  def change
    create_table :alerts, :id => false, :primary_key => 'id' do |t|
      t.integer :id, :limit => 8
      t.text :message, :null => false
      t.references :user, :limit => 8
      t.timestamps
    end
      execute "ALTER TABLE alerts ADD PRIMARY KEY(id)"
      execute "ALTER TABLE alerts MODIFY COLUMN id BIGINT AUTO_INCREMENT"
  end
end
