class System::LoadBalancerEntitiesController < SystemController
  def index
    @load_balancers = LoadBalancerEntity.order(name: :desc)    
  end

  def new
    @load_balancer = LoadBalancerEntity.new
  end

  def create
    @load_balancer = LoadBalancerEntity.new(strong_params_load_balancer)
    @load_balancer.save!
    redirect_to action: 'index'    
  end

  def edit
    @load_balancer = LoadBalancerEntity.find(params[:id])
  end

  def update
    @load_balancer = LoadBalancerEntity.find(params[:id])
    @load_balancer.update(strong_params_load_balancer)
    redirect_to action: 'index'
  end

  def destroy
    @load_balancer = LoadBalancerEntity.find(params[:id])
    @load_balancer.destroy
    redirect_to action: 'index'
  end

  private

  def strong_params_load_balancer
    params.require(:load_balancer_entity).permit(:name,:ip,:ssh_user_name,:ssh_port, :ssh_key_path)
  end
end
