require '../quote_handler'
describe 'quote_controller' do
  before do
    allow(HTTParty).to receive(:get).and_return(tradier_response)
    allow(JSON).to receive(:parse)
  end

  it 'gets security quotes' do
    let(:trader_response) { instance_double(HTTParty::Response, body: tradier_response_body) }
    let(:tradier_response_body) { {securities: { security: {symbol: "AAPL" } } } }

    event = { queryStringParameters: {symbol: 'AAPL'}}
    context = {}

    response = lambdaHandler(event: event, context: context)
    expected = TODO
    expect(response).to equal(expected)
  end

  it 'fetches from the correct endpoint' do
    expect(HTTParty).to have_received(:get).with(github_url)
  end

  it 'parses the tradier response' do
    expect(JSON).to have_received(:parse).with(tradier_response_body)
  end
end