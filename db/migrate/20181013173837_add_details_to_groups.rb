class AddDetailsToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :detail, :text
  end
end
