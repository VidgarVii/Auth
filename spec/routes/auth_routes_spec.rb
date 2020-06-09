# frozen_string_literal: true

describe AuthRoutes, type: :routes do
  describe 'POST /v1/auth' do
    let(:user_session) { create :user_session }

    before do
      allow(JwtEncoder).to receive(:decode).and_return('uuid': token)
    end

    context 'valid params' do
      let(:token) { user_session.uuid }

      before do
        post '/'
      end

      it { expect(last_response).to be_ok }
    end

    context 'invalid params' do
      let(:token) { 'fake token' }

      before do
        post '/'
      end

      it { expect(last_response.status).to eq 403 }
    end
  end
end
