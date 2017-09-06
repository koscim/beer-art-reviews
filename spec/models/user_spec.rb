require 'rails_helper'
<<<<<<< HEAD
require 'spec_helper'

RSpec.describe User, type: :model do
  it { should have_valid(:name).when("Johnny") }
  it { should_not have_valid(:name).when(nil, "") }
=======

RSpec.describe User, type: :model do

  it { should have_valid(:first_name).when('Roger', 'Dwayne') }
  it { should_not have_valid(:first_name).when('', nil) }

  it { should have_valid(:last_name).when('Grouch', 'Jacobson') }
  it { should_not have_valid(:last_name).when('', nil) }

  it { should have_valid(:username).when('schmoopers104', 'ilovecoding360noscope') }
  it { should_not have_valid(:username).when('', nil) }

  it { should have_valid(:email).when('joeshmoe@gmail.com', 'yourgrandmother@aol.com') }
  it { should_not have_valid(:email).when('joeshmoegmail.com', '', nil, 'joeshmoe@gmailcom') }

  it { should have_valid(:encrypted_password).when('aslk2240agjq23', 'grandmarocks90210', 'password') }
  it { should_not have_valid(:encrypted_password).when('', nil) }

  it { should have_valid(:sign_in_count).when(0, 1, 5, 9001) }
  it { should_not have_valid(:sign_in_count).when(-1, nil) }

  it { should have_valid(:created_at).when(Date.parse('11/11/2017')) }

  it { should have_valid(:updated_at).when(Date.parse('11/11/2017')) }

  it 'has a matching password confirmation for the password' do
    user = User.new
    user.first_name = 'Rodger'
    user.last_name = 'Grouch'
    user.username = 'schmoopers104'
    user.email = 'joeshmoe@gmail.com'
    user.password = 'password'
    user.password_confirmation = 'password'

    expect(user).to be_valid
    expect(user.errors[:password_confirmation]).to be_blank
  end

  it 'gives an error if the password confirmation does not match' do
    user = User.new
    user.password = 'password'
    user.password_confirmation = 'anotherpassword'

    expect(user).to_not be_valid
    expect(user.errors[:password_confirmation]).to_not be_blank
  end

>>>>>>> master
end
