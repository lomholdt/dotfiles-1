require 'date'
require 'i3ipc'
require 'usagewatch'


#"  $(Workspaces) %{r}cpu $(cpuload)%    mem $(memused)%  $(volume)  $(Battery)     $(Clock)   "
class Lemonbar

  def initialize
    puts "   #{workspaces} #{right} #{cpuload}   #{memused}   #{battery}   #{clock}    "
  end

  def cpuload
    usw = Usagewatch
    "#{usw.uw_cpuused}% cpu"
  end

  def memused
    usw = Usagewatch
    "#{usw.uw_memused}% mem"
  end

  def volume
  end

  def battery
    percent=`echo $(acpi --battery | cut -d, -f2)`
    bat = percent.sub("%", "").to_i

    icon = case
    when bat > 90 then "\uf240"
    when bat > 75 then "\uf241"
    when bat > 50 then "\uf242"
    when bat > 25 then "\uf243"
    else "\uf244"
    end

    "#{bat}%  #{icon}"
  end

  def clock
   DateTime.now.strftime( "%a %b %d   %l:%M")
  end

  # Directions
  def right
    "%{r}"
  end

  def workspaces
    i3 = I3Ipc::Connection.new
    workspaces = i3.workspaces
    workspace_icons = '%{F#CCCCCC}'
    workspaces.each do |w|
      workspace_icons += w.focused ? "\uf111 " : "\uf1db "
    end
    i3.close
    "#{workspace_icons}%{F#FFFFFF}"
  end
end

Lemonbar.new
