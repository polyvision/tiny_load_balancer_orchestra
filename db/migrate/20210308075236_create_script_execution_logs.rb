class CreateScriptExecutionLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :script_execution_logs do |t|

      t.timestamps
      t.integer :load_balancer_entity_id, index: true
      t.integer :remote_script_id, index: true
      t.text    :content
      t.integer :executed_by, index: true
      t.datetime :executed_at
    end
  end
end