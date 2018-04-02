class AddColumnsToBanks < ActiveRecord::Migration[5.1]
  def change
    add_column :banks, :instituteType, :string
    add_column :banks, :country, :string
    add_column :banks, :serviceName, :string
    add_column :banks, :loginIdCaption, :string
    add_column :banks, :passwordCaption, :string
    add_column :banks, :serviceType, :string
    add_column :banks, :securityCodeCaption, :string
  end
end
