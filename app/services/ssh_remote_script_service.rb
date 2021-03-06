require 'net/ssh'

# SshRemoteScriptService.new(LoadBalancerEntity.find(4),RemoteScript.first).perform
class SshRemoteScriptService
  attr_accessor :load_balancer_entity, :remote_script

  def initialize(load_balancer_entity,remote_script)
    self.load_balancer_entity = load_balancer_entity
    self.remote_script = remote_script
  end

  def perform
    output = ""
    
    ssh_options = {
      non_interactive: true,
      host_key: "ssh-rsa",
      keys: [ self.load_balancer_entity.ssh_key_path ]
    }
    
    output <<  "login to #{self.load_balancer_entity.ssh_user_name}@#{self.load_balancer_entity.ip}\n"
    Net::SSH.start(self.load_balancer_entity.ip, self.load_balancer_entity.ssh_user_name, ssh_options) do |ssh|
      self.remote_script.content.each_line do |line|
        line = line.gsub("\r","")
        line = line.gsub("\n","")
        
        output << "remote cmd: #{line}" << "\n"
        t_output = ssh.exec!(line)
        output << t_output
      end
    end
    
    return output
  end # end of perform
end