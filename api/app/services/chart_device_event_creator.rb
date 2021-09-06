class ChartDeviceEventCreator < ApplicationService
  def initialize(params)
    @params = params
    puts @params
  end

  def call
    events = DeviceEvent.where(:created_at => (Time.now - 10.minutes..Time.now)).to_a
    # Improve this with mongoid group
    events.group_by(&:type).map do |label, grouped|
      {
        label: label,
        input_labels: grouped.map(&:created_at),
        data: grouped.map(&:value)
      }
    end
  end

  private

  attr_reader :params
end
