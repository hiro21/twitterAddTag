class TwitterViewController < ApplicationController
  def index
	 tmpVals = params[:accountName] 
         #@accountName = tmpVals['accountName']
	 @accountName = session[:username]
	 getTwitter(@accountName)
	 puts @accountName
  end

  private

  def getTwitter(user)
	  option = {"count" => 10}
	  puts user
	  #puts twitter_client.user(user)
	  timelines = twitter_client.user_timeline(user, option)
	  @timelines = Array.new
	  timelines.each do |line|
		  puts line.text
		  @timelines.push(line.text)
	  end
	  #Twitter.user_timeline(user, option).each do |res|
#	  twitter_client.user_timeline(user, option).each do |res|
#		  puts #{res.text}
#	  end
  end

  def twitter_client
	  client = Twitter::REST::Client.new do |config|
		  config.consumer_key = Settings.twetter_consumer_key
		  config.consumer_secret = Settings.twetter_consumer_secret
		  config.access_token = session[:oauth_token]
		  config.access_token_secret = session[:oauth_token_secret]
	  
  	  end
  end
end
