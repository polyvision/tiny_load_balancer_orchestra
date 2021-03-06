class System::RemoteScriptsController < ApplicationController
  def index
    @remote_scripts = RemoteScript.order(name: :desc)    
  end

  def new
    @remote_script = RemoteScript.new
  end

  def create
    @remote_script = RemoteScript.new(strong_params_remote_script)
    @remote_script.save!
    redirect_to action: 'index'    
  end

  def edit
    @remote_script = RemoteScript.find(params[:id])
  end

  def update
    @remote_script = RemoteScript.find(params[:id])
    @remote_script.update(strong_params_remote_script)
    redirect_to action: 'index'
  end

  def destroy
    @remote_script = RemoteScript.find(params[:id])
    @remote_script.destroy
    redirect_to action: 'index'
  end

  private

  def strong_params_remote_script
    params.require(:remote_script).permit(:name,:content)
  end
end
