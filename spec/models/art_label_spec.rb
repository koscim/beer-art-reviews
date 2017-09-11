require 'rails_helper'
require 'spec_helper'

RSpec.describe ArtLabel, type: :model do
  it { should have_valid(:name).when("Johnny") }
  it { should_not have_valid(:name).when(nil, "") }

  it { should have_valid(:brewery).when("Smith") }
  it { should_not have_valid(:brewery).when(nil, "") }

end
