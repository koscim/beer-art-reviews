require 'rails_helper'
require 'spec_helper'

RSpec.describe Review, type: :model do
  it { should have_valid(:feels).when("Johnny") }
  it { should_not have_valid(:feels).when(nil, "") }

  it { should have_valid(:user_id).when(4) }
  it { should_not have_valid(:user_id).when(nil, "") }

  it { should have_valid(:art_label_id).when(4) }
  it { should_not have_valid(:art_label_id).when(nil, "") }
end
