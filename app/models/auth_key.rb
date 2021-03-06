require 'utils'
class AuthKey < ActiveRecord::Base
  include Utils
  attr_accessible :name, :user_id, :value, :actived

  validates_presence_of :value, :user_id, message: 'cannot be blank.'
  validates_uniqueness_of :value, message: 'must be unique.'
  belongs_to :user

  def self.create_key_for(user)
    token = Devise.friendly_token
    if user.auth_keys.include? token
      token = Devise.friendly_token
    end
    AuthKey.create value: token, user_id: user.id
  end

  def active
    update_attributes actived: true
  end
end
