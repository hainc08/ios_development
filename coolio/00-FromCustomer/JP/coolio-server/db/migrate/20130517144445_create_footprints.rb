class CreateFootprints < ActiveRecord::Migration
  def change
    create_table :footprints, :id => false, :primary_key => 'id' do |t|
      t.integer :id, :limit => 8
      t.integer :my_id, :limit => 8
      t.references :user, :limit => 8
      t.timestamps
    end
      execute "ALTER TABLE footprints ADD PRIMARY KEY(id)"
      execute "ALTER TABLE footprints MODIFY COLUMN id BIGINT AUTO_INCREMENT"
      #execute "ALTER TABLE footprints ADD FOREIGN KEY(my_id) REFERENCES user(id)"
      #execute "ALTER TABLE footprints ADD FOREIGN KEY(user_id) REFERENCES user(id)"
  end
end
