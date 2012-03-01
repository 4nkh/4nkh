def sign_in user_session
  visit login_path
  fill_in "Username", :with => user_session[:username]
  fill_in "Password", :with => user_session[:password]
  click_button "Sign in"
end