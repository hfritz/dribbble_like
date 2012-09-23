require File.dirname(__FILE__) + "/../spec_helper"
describe UsersController do
  render_views
  
  it 'should prepare a new user' do
    get 'new'
    assigns[:user].should be_new_record
  end
  
  it 'should not create a new user' do
    post 'create'
    response.should render_template('new')
  end 
  
  it 'should create a new user and redirect to the user view' do
    User.all.size.should == 0
    post :create, :user => {:email => "email@test.com", :username => "user1", :password => "12345", :password_confirmation => "12345"}
    response.should redirect_to user_url(1)
    User.all.size.should == 1
  end
  
  it 'should create a new user like' do
    u = User.create(:email => "email@test.com", :username => "user1", :password => "12345", :password_confirmation => "12345")
    UserLike.all.size.should be 0
    get 'like_pic', :liked_user_id => 2
    UserLike.all.size.should be 1
  end
    
  
end