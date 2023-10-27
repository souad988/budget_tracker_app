require 'rails_helper'

RSpec.describe 'Pages', type: :request do
  describe 'GET /root' do
    it 'renders a successful response' do
      get '/'
      expect(response).to be_successful
    end
  end
end
