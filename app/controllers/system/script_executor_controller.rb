class System::ScriptExecutorController < SystemController
  def index
    @load_balancer_entities = LoadBalancerEntity.order(name: :desc)
    @remote_scripts = RemoteScript.order(name: :desc)
  end

  def execute
    load_balancer_entites = LoadBalancerEntity.where(id: params[:selected_lb_ids])
    remote_script = RemoteScript.where(id: params[:remote_script_id]).first
    
    @script_executor_adapter = ScriptExecutorAdapter.new(load_balancer_entites,remote_script)
    @script_executor_adapter.run()
  end
end
