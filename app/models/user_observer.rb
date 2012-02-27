class UserObserver < ActiveRecord::Observer
  def after_create(user)
    user.build_profile
    user.save
  end
end
