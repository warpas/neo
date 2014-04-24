class AddImgcodeToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :imgcode, :string
  end
end
