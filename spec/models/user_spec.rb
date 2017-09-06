require 'rails_helper'
require 'spec_helper'

RSpec.describe User, type: :model do
  it { should have_valid(:name).when("Johnny") }
  it { should_not have_valid(:name).when(nil, "") }
end
