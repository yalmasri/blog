class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      t.timestamps

      t.references :post
      t.string :name
    end
  end
end
