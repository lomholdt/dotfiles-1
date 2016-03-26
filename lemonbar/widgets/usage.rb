
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
    "#{@cpu}% cpu    "
  end

private

  def cpuload
    Usagewatch.uw_cpuused
  end

  def memused
    Usagewatch.uw_memused
  end

end

# if __FILE__ == $PROGRAM_NAME
#   clock = Clock.new
#   clock.monitor { puts clock }
# end



