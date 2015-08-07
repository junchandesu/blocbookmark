class IncomingController < ApplicationController

  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_action :verify_authenticity_token, only: [:create]

  def create

    @user = User.where(email: params['sender']).first
    @topic = Topic.where(title: params[:subject]).first_or_create

    if !@user
       @user =  User.new(email: params['sender'], name: params['sender'], password: params['sender'])
       @user.skip_confirmation!
       @user.save!
    end
     @topic.bookmarks.create(url: params['stripped-text'], user: @user)
    head 200
  end
end
