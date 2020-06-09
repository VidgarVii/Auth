describe UserSessions::CreateUserSession do
  subject { described_class.call(user: user) }

  let(:user) { create :user }

  context 'when valid parameters' do
    it 'be succeeds' do
      is_expected.to be_a_success
    end

    it 'exists context with user' do
      expect(subject.user_session).to be_a(UserSession)
    end
  end
end
