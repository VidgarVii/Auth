describe 'Application', type: :request do
  describe 'GET api/v1/user' do
    before { get 'api/v1/user' }

    it 'when success' do
      expect(last_response).to be_ok
    end
  end

  describe 'POST api/v1/user' do
    context 'valid params' do
      before { post 'api/v1/user', "{\"title\":\"dsf\",\"description\":\"asd\",\"city\":\"Che\",\"user_id\":5}" }

      it 'when success' do
        expect(last_response).to be_ok
      end

      it 'when return ad object' do
        expect(JSON.parse(last_response.body)).to be_has_key('ad')
      end
    end

    context 'invalid params' do
      before { post 'api/v1/user', "{\"test\":\"test\"}" }

      it 'when bad request' do
        expect(last_response.status).to eq 400
      end

      it 'when return errors' do
        expect(JSON.parse(last_response.body)).to be_has_key('errors')
      end
    end
  end
end
