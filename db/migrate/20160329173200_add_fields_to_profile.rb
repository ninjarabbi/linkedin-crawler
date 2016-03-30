class AddFieldsToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :name, :string
    add_column :profiles, :title, :string
    add_column :profiles, :position, :string
    add_column :profiles, :summary, :string
  end
end
