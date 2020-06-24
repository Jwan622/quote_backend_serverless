require '../quote_handler'
describe 'quote_controller' do
  it 'gets quotes' do
    event = { queryStringParameters: {symbol: 'AAPL'}}
    context = {}

    response = lambdaHandler(event: event, context: context)
    expected = "blee bloo"

    expect(response).to equal(expected)
  end

end