class CreateArticlebrews < ActiveRecord::Migration[7.0]
  def change
    create_table :articlebrews do |t|
      t.string :install
      t.string :imagemagick

      t.timestamps
    end
  end
end
