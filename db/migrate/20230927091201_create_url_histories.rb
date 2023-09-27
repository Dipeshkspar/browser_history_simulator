class CreateUrlHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :url_histories do |t|
      t.string :url

      t.timestamps
    end
  end
end
