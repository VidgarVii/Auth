# frozen_string_literal: true

describe AuthRoutes, type: :routes do
  describe 'POST api/v1/user' do
    context 'valid params' do
      before do
        post '/v1/users', { "user": { "name": 'name',
                                      "email": 'mail@mail.tu',
                                      "password": 'password',
                                      "password_confirmation": 'password' } }.to_json
      end

      it { expect(last_response).to be_created }
    end

    context 'invalid params' do
      before { post '/v1/users', { user: { name: '1' } }.to_json }

      it 'when bad request' do
        expect(last_response.status).to eq 422
      end

      it 'when return errors' do
        expect(JSON.parse(last_response.body)).to be_has_key('errors')
      end
    end
  end
end
