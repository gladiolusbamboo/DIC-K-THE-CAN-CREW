class AddIpAddressToSearchLogs < ActiveRecord::Migration[5.1]
  def change
    add_column :search_logs, :ip_address, :string
  end
end
