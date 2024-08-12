# spec/controllers/currency_converter_engine/api/v1/conversion_controller_spec.rb
require 'rails_helper'

RSpec.describe CurrencyConverterEngine::Api::V1::ConversionController, type: :controller do
  routes { CurrencyConverterEngine::Engine.routes }  # Asegura que las rutas del engine son usadas

  describe 'GET #convert' do
    let(:valid_params) do
      { from_currency: "USD", to_currency: "EUR,GBP", amount: 100 }
    end

    let(:query_params_builder) { double(CurrencyConverterEngine::QueryParamsBuilder) }
    let(:conversion_service) { double(CurrencyConverterEngine::ConversionService) }
    let(:result) { double(success?: true, data: { conversions: { "EUR" => 84.0, "GBP" => 74.0 } }) }

    before do
      allow(CurrencyConverterEngine::QueryParamsBuilder).to receive(:call).and_return(query_params_builder)
      allow(CurrencyConverterEngine::ConversionService).to receive(:call).and_return(result)
    end

    context 'when the request is successful' do
      it 'returns a successful response' do
        get :convert, params: valid_params, format: :json

        expect(response).to have_http_status(:ok)
        expect(response.body).to eq(Oj.dump(result.data))
      end
    end

    context 'when the request has missing parameters' do
      it 'returns a bad request error' do
        get :convert, params: { from_currency: "USD" }, format: :json

        expect(response).to have_http_status(:bad_request)
        expect(response.body).to include('Missing required parameters')
      end
    end

    context 'when the conversion fails' do
      let(:result) { double(success?: false, data: { error: "Error fetching conversion rates" }) }

      it 'returns an error response' do
        get :convert, params: valid_params, format: :json

        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.body).to include("Error fetching conversion rates")
      end
    end
  end
end



