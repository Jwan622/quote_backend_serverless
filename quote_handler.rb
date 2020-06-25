require 'json'
require 'httparty'

def lambdaHandler(event:, context:)
  puts "IT IS RUNNING"
  puts "event: #{event}"
  {
    statusCode: 200,
    body: {
      message: 'Go Serverless v1.0! Your function executed successfully!',
      input: quote
    }.to_json
  }
end

def quote
  endpoint = endpoint_for_symbol('AAPL')
  response = raw_response(endpoint)
  parse_quote(response)
end

def parse_quote(body)
  securities = JSON.parse(body).fetch('securities').fetch('security')
  if securities.kind_of?(Array)
    securities
  else
    [securities]
  end
end

def endpoint_for_symbol(symbol)
  "#{base_url}/v1/markets/lookup?q=#{symbol}&types=stock"
end

def raw_response(endpoint)
  response = HTTParty.get(endpoint, headers: {
    'Authorization' => "Bearer #{client_id}",
    'Accept' => 'application/json'
  })

  response.body
end

def client_id
  # ENV.fetch('CLIENT_ID')
  "LIsuGWypUAO8GV8dSgo3h8usZ7cr"
end

def base_url
  "https://sandbox.tradier.com"
end
