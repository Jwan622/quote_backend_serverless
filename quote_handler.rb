require 'json'

def lambdaHandler(event:, context:)
  puts "IT IS RUNNING"
  {
    statusCode: 200,
    body: {
      message: 'Go Serverless v1.0! Your function executed successfully!',
      input: event
    }.to_json
  }
    # include TradierRequest

  quote.to_json

end

def quote
  endpoint = endpoint_for_symbol(params['symbol'])
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
