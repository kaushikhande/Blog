class CreateBanks < ActiveRecord::Migration[5.1]
  def change
    create_table :banks do |t|
      t.string :name, null: false
      t.string :shortname
      t.string :type
      t.string :external_id, null: false

      t.timestamps null: false
    end
  end
end
