# frozen_string_literal: true

class User < Sequel::Model
  NAME_FORMAT = %r{\A\w+\z}

  plugin :secure_password

  def validate
    super

    validates_presence :email
    validates_presence :name
    validates_format NAME_FORMAT, :name
  end
end
