class CreateRemoteScripts < ActiveRecord::Migration[6.1]
  def change
    create_table :remote_scripts do |t|

      t.timestamps
      t.string :name
      t.text   :content
    end
  end
end