class CreateMasterpasswords < ActiveRecord::Migration
  def change
    create_table :masterpasswords, :id => false, :primary_key => 'id' do |t|
		  t.integer :id, :limit => 8
		  t.string :masterpassword, :null => false
		  t.references :user, :limit => 8

      t.timestamps
    end
      execute "ALTER TABLE masterpasswords ADD PRIMARY KEY(id)"
      execute "ALTER TABLE masterpasswords MODIFY COLUMN id BIGINT AUTO_INCREMENT"
  end
end
