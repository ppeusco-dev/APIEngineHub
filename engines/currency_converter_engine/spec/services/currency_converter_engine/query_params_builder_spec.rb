# spec/services/currency_converter_engine/query_params_builder_spec.rb
require 'rails_helper'

RSpec.describe CurrencyConverterEngine::QueryParamsBuilder, type: :service do
  let(:valid_params) do
    {
      from_currency: "USD",
      to_currencies: ["EUR", "GBP"],
      amount: 100,
      api_key: "test_api_key"
    }
  end

  context 'when parameters are valid' do
    it 'returns a success response with the correct query params' do
      builder = described_class.new(**valid_params)  # Utiliza ** para expandir el hash en los parámetros requeridos
      result = builder.call

      expect(result.success?).to be(true)
      expect(result.data).to eq({
        base: "USD",
        symbols: "EUR,GBP",
        access_key: "test_api_key"
      })
    end
  end

  context 'when parameters are invalid' do
    it 'returns a failure response' do
      invalid_params = valid_params.merge(from_currency: nil)
      builder = described_class.new(**invalid_params)  # Utiliza ** para expandir el hash en los parámetros requeridos
      result = builder.call

      expect(result.success?).to be(false)
      expect(result.data[:error]).to eq("Invalid parameters")
    end
  end
end

