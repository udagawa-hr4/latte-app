class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.string :title,        null: false
      t.text :text,           null: false
      t.timestamps
      t.references :user,     null: false, foreign_key: true

    end
  end
end
