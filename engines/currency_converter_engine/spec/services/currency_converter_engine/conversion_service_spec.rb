# spec/services/currency_converter_engine/conversion_service_spec.rb
require 'rails_helper'

RSpec.describe CurrencyConverterEngine::ConversionService, type: :service do
  let(:from_currency) { 'USD' }
  let(:to_currencies) { ['EUR', 'GBP'] }
  let(:amount) { 100 }
  let(:api_key) { 'test_key' }
  let(:query_params_builder) do
    CurrencyConverterEngine::QueryParamsBuilder.new(
      from_currency: from_currency,
      to_currencies: to_currencies,
      amount: amount,
      api_key: api_key
    )
  end

  let(:service) { described_class.new(query_params_builder) }

  describe '#call' do
    context 'when the API request is successful' do
      it 'returns the correct conversion rates' do
        response_body = { "rates" => { "EUR" => 0.85, "GBP" => 0.75 } }

        allow_any_instance_of(HttpWrapper::Client).to receive(:get).and_return(
          OpenStruct.new(success?: true, body: Oj.dump(response_body))
        )

        result = service.call

        expect(result.success?).to be true
        expect(result.data[:conversions]).to eq({ "EUR" => 85.0, "GBP" => 75.0 })
      end
    end

    context 'when the API request fails' do
      it 'returns a failure response' do
        allow_any_instance_of(HttpWrapper::Client).to receive(:get).and_return(
          OpenStruct.new(success?: false, status: 500)
        )

        result = service.call

        expect(result.success?).to be false
        expect(result.data).to eq({ error: "Error fetching conversion rates: 500" }) # Ajuste aquí
      end
    end
  end
end

