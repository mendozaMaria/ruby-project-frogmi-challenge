class CreateComments < ActiveRecord::Migration[6.0]
    def change
      create_table :comments do |t|
        t.belongs_to :earthquake
        t.string :author
        t.text :content
        t.timestamps
      end
    end
  end