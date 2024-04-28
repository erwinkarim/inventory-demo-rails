class UsersController < ApplicationController
  def generate
    logger.debug 'generate normal user'
    user = User.create({
      email: Faker::Internet.email,
    });
    user.update(password: 'password123')
    user.save!

    redirect_back_or_to settings_path
  end

  def update
    logger.debug 'update user'
    logger.debug 'new_password:' + params[:user][:new_password]
    logger.debug 'confirm_password:' + params[:user][:confirm_password]

    # can only update password for now
    if(params[:user][:new_password] != '' && params[:user][:new_password] == params[:user][:confirm_password]) then
      logger.debug 'should update password'
      user = User.find(params[:id])
      if(user.update(password: params[:user][:new_password])) then
        logger.debug 'password updated'
      else
        logger.debug 'failed to update password'
      end
    else
      logger.debug 'passwords does not match'
    end

    redirect_back_or_to settings_path
  end

  def show
    logger.debug 'show user'
    @user = User.find(params[:id])

    render 'show', layout: 'application'
  end

  def destroy
    logger.debug 'should delete user'
    user = User.find(params[:id])
    if(!user.nil?) then 
      user.destroy!
    end

    redirect_back_or_to settings_path
  end

end
