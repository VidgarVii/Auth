class NewUserContract < ApplicationContract
  EMAIL_PATTERN = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  params do
    required(:user).hash do
      required(:email).filled(:string)
      required(:name).filled(:string)
      required(:password).filled(min_size?: 6)
      required(:password_confirmation).filled(min_size?: 6)
    end
  end

  rule(user: :email) do
    key.failure(:invalid) unless EMAIL_PATTERN.match?(value)
  end

  rule(user: :name) do
    key.failure(:invalid) unless User::NAME_FORMAT.match?(value)
  end

  rule(user: :password) do
    key.failure(:confirmate) unless value == values.data[:user][:password_confirmation]
  end
end
