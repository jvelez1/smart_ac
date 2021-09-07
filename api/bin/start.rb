require_relative '../config/environment'
require 'securerandom'
require 'mongoid'
Mongoid.load!('../api/config/mongoid.yml', 'development')

if User.first
	return 
else
	user = User.new(first_name: 'David', second_name: 'Rios', email: 'david@smartac.com', password: '123456789')
	user.save!
end

rand_date = -> { Time.at(Random.rand((Time.now - (60*60*24)).to_f..Time.now.to_f)) }
rand_serial = -> { SecureRandom.hex }

(1..10).each do |v|
	device = {
		"devices" => {
			"serial" => rand_serial.call,
			"secret" => rand_serial.call,
			"firmware_version" => "V0.0.#{v}",
			"registration_date" => rand_date.call 
		}
	}
	result = DeviceCreator.new(device).call
end

device = Device.first

even_type = ["TEMPERATURE", "AIR_HUMIDITY", "CARBON_MONOXIDE"]
event_measurement = [ 'CELCIUS', 'PORCENTAGE' 'PPM']
event_value = [ -> {rand(15..45)},  -> {rand(40..70)}, -> {rand(5..10)}]


device_events = (1..30).map do |_|
	type = rand(0..2)
	{
		"type" => even_type[type],
		"value" => event_value[type].call,
		"measurement" => event_measurement[type],
		"event_time" => rand_date.call,
		"status" => 'OK'
	}
end

device_events_with_notification = (1..6).map do |_|
	type = rand(0..2)
	{
		"type" => even_type[type],
		"value" => event_value[type].call,
		"measurement" => event_measurement[type],
		"event_time" => rand_date.call,
		"status" => 'Required revision'
	}
end

result = DeviceEventCreator.new(device, { "device_events" => [device_events + device_events_with_notification].flatten }).call
