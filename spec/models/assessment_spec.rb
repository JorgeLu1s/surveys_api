require 'rails_helper'

RSpec.describe Assessment, type: :model do
  it { should belong_to(:survey) }
  it { should belong_to(:user) }
end
