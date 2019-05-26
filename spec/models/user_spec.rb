require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(username: 'test', email: 'test@survey.com', password: 'secret') }

  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
end
