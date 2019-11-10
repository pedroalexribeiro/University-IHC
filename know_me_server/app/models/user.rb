# frozen_string_literal: true

# Class User
class User < ActiveModel::Serializer
  has_secure_password
end
