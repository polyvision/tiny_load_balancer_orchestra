class CreateLoadBalancers < ActiveRecord::Migration[6.1]
  def change
    create_table :load_balancer_entities do |t|

      t.timestamps
      t.string :name
      t.string :ip
      t.string :ssh_user_name
      t.integer :ssh_port
    end
  end
end