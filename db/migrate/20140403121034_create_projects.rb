class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :short_desc
      t.text :long_desc

      t.timestamps
    end
  end
end
