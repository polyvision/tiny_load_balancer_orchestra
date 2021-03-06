class LoadBalancerEntitySshKeyPath < ActiveRecord::Migration[6.1]
  def change
    add_column :load_balancer_entities, :ssh_key_path, :string
  end
end
