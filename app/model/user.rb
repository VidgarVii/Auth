# frozen_string_literal: true

class User < Sequel::Model
  plugin :secure_password
  plugin :association_dependencies #, include_validations: false

  NAME_FORMAT = %r{\A\w+\z}

  one_to_many :sessions, class: :UserSession
  add_association_dependencies sessions: :delete

  def validate
    super

    validates_presence :email
    validates_presence :password if new?
    validates_presence :name
    validates_format NAME_FORMAT, :name
  end
end
