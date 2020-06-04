class NewUserContract < ApplicationContract
  EMAIL_PATTERN = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  params do
    required(:email).filled(:string)
    required(:name).filled(:string)
    required(:password).filled(min_size?: 6)
    required(:password_confirmation).filled(min_size?: 6)
  end

  rule(:email) do
    key.failure(:invalid) unless EMAIL_PATTERN.match?(value)
  end

  rule(:name) do
    key.failure(:invalid) unless User::NAME_FORMAT.match?(value)
  end

  rule(:password) do
    key.failure(:confirmate) unless value == :password_confirmation
  end
end
