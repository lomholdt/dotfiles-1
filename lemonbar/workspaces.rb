require 'i3ipc'

i3 = I3Ipc::Connection.new
workspaces = i3.workspaces

workspace_icons = '%{F#CCCCCC}'
workspaces.each do |w|
  workspace_icons += w.focused ? "\uf111 " : "\uf1db "
end

puts "#{workspace_icons}%{F#FFFFFF}"

i3.close
