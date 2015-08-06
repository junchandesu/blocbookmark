class IncomingController < ApplicationController

  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    # Take a look at these in your server logs
    # to get a sense of what you're dealing with.
    # puts "INCOMING PARAMS HERE: #{params}"

    # # You put the message-splitting and business
    # # magic here. 


    #  # Find the user by using params[:sender]
    #  sender = params[:sender]
    #  # Find the topic by using params[:subject]
    #  subject = params[:subject]
    #  # Assign the url to a variable after retreiving it from params["body-plain"]
    #  url = params["body-plain"]
    #  # Check if user is nil, if so, create and save a new user
    #  @user = User.find_by(params[:sender])
    #  if @user.nil
    #     @user = User.new(name: "sender", email: sender, password: "helloworld") 
    #     @user.save_confirmation!
    #     @user.save
    #  end
    #  # Check if the topic is nil, if so, create and save a new topic
    #  @topic = Topic.find_by(params[:subject])
    #  if @topic.nil
    #   @topic = Topic.create(user: @user, title: suject) 
    #  # Now that you're sure you have a valid user and topic, build and save a new bookmark
    #   @bookmark = Bookmark.create(url: url, topic: @topic)
    #  end
    # Assuming all went well. 

    @user = User.where(email: params['sender']).first
    @topic = Topic.where(title: params[:subject]).first_or_create

    if @user
        @topic.bookmarks.create(url: params['stripped-text'], user: @user)
    end
    head 200
  end
end