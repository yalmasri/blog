class CreateAccessTokens < ActiveRecord::Migration[6.0]
  def change
    create_table :access_tokens, id: :uuid do |t|
      t.timestamps

      t.references :owner, polymorphic: true, index: true
      t.string :token, null: false, index: true
      t.datetime :expires_in, null: false
    end
  end
end
