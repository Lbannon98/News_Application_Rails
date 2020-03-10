require "singleton"

class Profile < ApplicationRecord
  include Singleton

  belongs_to :user

end