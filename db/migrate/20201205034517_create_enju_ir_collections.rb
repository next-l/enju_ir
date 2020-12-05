class CreateEnjuIrCollections < ActiveRecord::Migration[5.2]
  def change
    create_table :enju_ir_collections, id: :uuid do |t|
      t.jsonb :title_translations, default: {}, null: false
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
