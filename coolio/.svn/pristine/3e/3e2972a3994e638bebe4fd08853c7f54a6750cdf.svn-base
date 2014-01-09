class CreateSilentMatches < ActiveRecord::Migration
  def change
    create_table :silent_matches, :id => false, :primary_key => 'id' do |t|
      t.integer :id, :limit => 8
      t.integer :my_id, :limit => 8
      t.references :user, :limit => 8
      t.timestamps
    end
    execute "ALTER TABLE silent_matches ADD PRIMARY KEY(id)"
    execute "ALTER TABLE silent_matches MODIFY COLUMN id BIGINT AUTO_INCREMENT"
  end
end
