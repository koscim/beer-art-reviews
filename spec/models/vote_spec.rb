require 'rails_helper'
require 'spec_helper'

RSpec.describe Vote, type: :model do
  it { should have_valid(:user_id).when(1) }
  it { should_not have_valid(:user_id).when(nil, "") }

  it { should have_valid(:review_id).when(4) }
  it { should_not have_valid(:review_id).when(nil, "") }

  it { should have_valid(:vote_number).when(4) }
  it { should_not have_valid(:vote_number).when(nil, "") }
end
