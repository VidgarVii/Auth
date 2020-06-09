# frozen_string_literal: true

describe UserSessions::ValidateAuhtorizationUser do
  subject { described_class.call(session_params: session_params) }

  let!(:user) { create :user, password: 'password', password_confirmation: 'password' }

  context 'when valid parameters' do
    let(:session_params) { { email: user.email, password: 'password' } }

    it 'be succeeds' do
      is_expected.to be_a_success
    end

    it 'exists context with user' do
      expect(subject.user).to be_a(User)
    end
  end

  context 'when invalid parameters' do
    let(:session_params) { { email: user.email, password: 'pas' } }

    it 'fails' do
      is_expected.to be_a_failure
    end
  end
end
