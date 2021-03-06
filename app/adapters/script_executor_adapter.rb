class ScriptExecutorAdapter

  attr_accessor :load_balancer_entities
  attr_accessor :remote_script
  attr_accessor :result

  def initialize(load_balancer_entities,remote_script)
    self.load_balancer_entities = load_balancer_entities
    self.remote_script = remote_script
    self.result = Array.new
  end

  def run()
    self.load_balancer_entities.each do |lb_entity|
      lb_result = OpenStruct.new
      lb_result.load_balancer_entity = lb_entity
      lb_result.remote_script = self.remote_script

      begin
        service = SshRemoteScriptService.new(lb_entity,self.remote_script)
        lb_result.remote_output = service.perform()
        lb_result.success = true
      rescue Exception => ex
        lb_result.error_message = ex.message
        lb_result.success = false
      end

      self.result << lb_result
    end
  end
end