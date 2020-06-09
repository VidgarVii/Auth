
describe Users::CreateService do
  subject { described_class.call(user_params: params) }

  context 'valid parameters' do
    let(:params) do
      {"name": "name", "email": "mail@mail.tu", "password": "password", "password_confirmation": "password" }
    end

    it 'creates a new user' do
      expect { subject }.to change(User, :count).by(1)
    end

    it "succeeds" do
      is_expected.to be_a_success
    end
  end

  context 'invalid parameters' do
    let(:params) do
      { "name": "name", "email": "mail@mail.tu", "password": "password", "password_confirmation": "pas" }
    end

    it 'does not create user' do
      expect { subject }.not_to change(User, :count)
    end

    it "fails" do
      is_expected.to be_a_failure
    end
  end
end
