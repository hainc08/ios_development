class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches, :id => false, :primary_key => 'id' do |t|
      t.integer :id, :limit => 8
      t.integer :my_id, :limit => 8
      t.references :user, :limit => 8

      t.timestamps
    end
      execute "ALTER TABLE matches ADD PRIMARY KEY(id)"
      execute "ALTER TABLE matches MODIFY COLUMN id BIGINT AUTO_INCREMENT"
		#execute "ALTER TABLE matches ADD FOREIGN KEY(my_id) REFERENCES user(id)"
		#execute "ALTER TABLE matches ADD FOREIGN KEY(user_id) REFERENCES user(id)"
  end
end
