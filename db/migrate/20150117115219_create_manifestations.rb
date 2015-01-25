class CreateManifestations < ActiveRecord::Migration
  def change
    create_table :manifestations do |t|
      t.references :tag, index: true
      t.datetime :date
      t.datetime :till_date

      t.timestamps
    end
  end
end
