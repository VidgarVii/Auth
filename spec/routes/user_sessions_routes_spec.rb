# frozen_string_literal: true

describe UserSessionRoutes, type: :routes do
  let(:user) { create :user, password: 'password' }

  describe 'POST /' do
    context 'valid params' do
      before do
        post '/', { email: user.email, password: 'password' }.to_json
      end

      it { expect(last_response).to be_created }
      it { expect(response_body).to be_has_key('meta') }
    end

    context 'invalid params' do
      before do
        post '/', { email: 'mail@mail.tu', password: 'pass' }.to_json
      end

      it { expect(last_response.status).to eq 401 }
      it { expect(response_body).to be_has_key('errors') }
    end
  end
end
