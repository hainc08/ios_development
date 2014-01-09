class CreateInfos < ActiveRecord::Migration
  def change
    create_table :infos, :id => false, :primary_key => 'id' do |t|
      t.integer :id, :limit => 8
      t.text :message, :null => false

      t.timestamps
    end
      execute "ALTER TABLE infos ADD PRIMARY KEY(id)"
      execute "ALTER TABLE infos MODIFY COLUMN id BIGINT AUTO_INCREMENT"
  end
end
