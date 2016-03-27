
require 'usagewatch'

class Usage

  def initialize(config)
    @config = config
    @cpu = cpuload
  end

  def monitor
    loop do
      @cpu = cpuload
      yield
      sleep 1
    end
  end

  def to_s
    "CPU: #{@cpu}%      "
  end

private

  def cpuload
    cpu = Usagewatch.uw_cpuused.round
    cpu < 10 ? " #{cpu}" : cpu
  end

  def memused
    Usagewatch.uw_memused
  end

end

# if __FILE__ == $PROGRAM_NAME
#   clock = Clock.new
#   clock.monitor { puts clock }
# end



