if ENV["redis://rediscloud:BiwpLqWkbE8TSPgk@redis-17704.c6.eu-west-1-1.ec2.cloud.redislabs.com:17704"]
    $redis = Redis.new(:url => ENV["redis://rediscloud:BiwpLqWkbE8TSPgk@redis-17704.c6.eu-west-1-1.ec2.cloud.redislabs.com:17704"])
end
