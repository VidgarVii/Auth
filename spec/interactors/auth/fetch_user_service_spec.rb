# frozen_string_literal: true

describe Auth::FetchUserService do
  subject { described_class.call(uuid: uuid) }

  let!(:user_session) { create :user_session }

  context 'when valid parameters' do
    let(:uuid) { user_session.uuid }

    it 'be succeeds' do
      is_expected.to be_a_success
    end

    it 'exists context with user' do
      expect(subject.user).to be_a(User)
    end
  end

  context 'when invalid parameters' do
    let(:uuid) { nil }

    it 'fails' do
      is_expected.to be_a_failure
    end
  end
end
