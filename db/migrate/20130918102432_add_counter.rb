class AddCounter < ActiveRecord::Migration
  def up
    add_column :urls, :count, :integer, options: { default: 0 }
  end

  def down
    remove_column :urls, :count
  end  
end
