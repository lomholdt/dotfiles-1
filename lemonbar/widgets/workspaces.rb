require 'i3ipc'

class Workspaces

  def initialize(config)
    @config = config
    @i3 = I3Ipc::Connection.new
    i3ws = @i3.workspaces
    @workspaces = i3ws.map do |w|
      workspace_from_object w
    end
    #i3.close
    @display = workspace_display
  end

  def monitor(&block)
    i3block = Proc.new do |reply|
      case reply.change
      when "init"
        @workspaces << workspace_from_object(reply.current)
      when "focus"
        @workspaces.each do |w|
          w.focused = reply.current.num == w.num
        end
      when "empty"
        @workspaces.select!{ |w| w.num != reply.current.num }
      when "urgent"
      end
      @display = workspace_display
      block.call
    end
    pid = @i3.subscribe 'workspace', i3block
    pid.join
  end

  def to_s
    @display
  end

private

  def workspace_display
    "   #{workspace_icons}%{F#FFFFFF}"
  end

  def workspace_from_object(obj)
    OpenStruct.new({
      name: obj.name,
      num: obj.num,
      focused: obj.focused
    })
  end

  def workspace_icons
    workspace_icons = '%{F#CCCCCC}'
    @workspaces.each do |w|
      workspace_icons += w.focused ? "\uf111  " : "\uf1db  "
    end
    workspace_icons
  end

end

if __FILE__ == $PROGRAM_NAME
  ws = Workspaces.new({})
  ws.monitor { puts ws }
end
