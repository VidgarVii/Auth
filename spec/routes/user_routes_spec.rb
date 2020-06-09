# frozen_string_literal: true

describe UserRoutes, type: :routes do
  describe 'POST /v1/signup' do
    context 'valid params' do
      before do
        post '/', { "user": { "name": 'name',
                                      "email": 'mail@mail.tu',
                                      "password": 'password',
                                      "password_confirmation": 'password' } }.to_json
      end

      it { expect(last_response).to be_created }
      it { expect(User.last.email).to eq 'mail@mail.tu' }
    end

    context 'invalid params' do
      before { post '/', { user: { name: '1' } }.to_json }

      it { expect(last_response.status).to eq 422 }
      it { expect(response_body).to be_has_key('errors') }
    end
  end
end
