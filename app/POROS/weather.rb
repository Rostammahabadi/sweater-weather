class Weather
  attr_reader :current, :daily, :hourly
  def initialize(data)
    @current = {}
    @daily = []
    @hourly = []
    create_current(data)
    create_daily(data)
    create_hourly(data)
  end

  private

  def create_current(data)
    current[:datetime] = data[:current][:dt]
    current[:temp_high] = data[:daily].first[:temp][:max] #
    current[:temp_low] = data[:daily].first[:temp][:min] #
    current[:uvi] = data[:current][:uvi]
    current[:humidity] = data[:current][:humidity]
    current[:visibility] = data[:current][:visibility]
    current[:feels_like] = data[:current][:feels_like]
    current[:sunrise] = data[:current][:sunrise]
    current[:sunset] = data[:current][:sunset]
    current[:description] = data[:current][:weather].first[:description]
  end

  def create_daily(data)
    data[:daily][0..5].each do |day|
      hsh = {}
      hsh[:description] = day[:weather].first[:description]
      hsh[:rain] = day[:rain]
      hsh[:temp_max] = day[:temp][:max]
      hsh[:temp_low] = day[:temp][:min]
      hsh[:datetime] = day[:dt]
      @daily << hsh
    end
  end

  def create_hourly(data)
    data[:hourly][0..7].each do |hour|
      hsh = {}
      hsh[:datetime] = hour[:dt]
      hsh[:description] = hour[:weather].first[:description]
      hsh[:temp] = hour[:temp]
      @hourly << hsh
    end
  end

  def id
    "1"
  end
end
