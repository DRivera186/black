class ChangeNameColumnToAlias < ActiveRecord::Migration
  def change
  	rename_column :users, :first_name, :name
  	rename_column :users, :last_name, :alias


  end
end
