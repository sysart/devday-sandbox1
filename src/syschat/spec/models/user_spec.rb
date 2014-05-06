require "spec_helper"

def create_user(name, email, password) 
	lindeman = User.create!(name: name, email: email, password: password )
end

describe User do  

  before(:each) do
    @lindeman = create_user("Andy Lindeman", "any.lindeman@ruby.org", "secret")
  end

  it "is not authenticated when providing invalid password" do
    expect(User.authenticate("any.lindeman@ruby.org", "xxx")).to be_nil
  end

  it "can be authenticated using email and password" do
    expect(User.authenticate("any.lindeman@ruby.org", "secret")).to eq(@lindeman)
  end

  it "cannot be created twice with same email address" do 
  	expect{create_user("Andy2" , "any.lindeman@ruby.org", "foo")}.to raise_error(/Email has already been taken/)
  end

  it "does not store password as plain text" do 
  	expect(User.find_by_email("any.lindeman@ruby.org").password).to be_nil
  end
end