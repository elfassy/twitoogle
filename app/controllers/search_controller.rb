class SearchController < ApplicationController
  
  def index
    session[:oldest_id] = nil
    @example_page = true
  end

  def new
    fetch
  end

  def fetch
    @example_page = params[:q].blank?
    
    if !@example_page

      options = {
        entities: false,
        lang: I18n.locale,
        result_type: "mixed", 
        count: 20
      }
      ##
      # https://dev.twitter.com/docs/working-with-timelines
      # https://dev.twitter.com/docs/api/1.1/get/search/tweets
      # |_ max_id: Returns results with an ID less than (that is, older than) or equal to the specified ID.
      # |_ since_id: Returns results with an ID greater than (that is, more recent than) the specified ID, starting with latest results. 
      oldest_id = session[:oldest_id].blank? ? nil : session[:oldest_id]
      options.merge!(max_id: oldest_id - 1 ) if params[:d] == "older" && oldest_id

      begin
        @twitter_posts = Twitter.search(params[:q], options).results
      rescue => error
        flash[:error] = "Seems like we're having some difficulty connecting to Twitter. Please try again in a few minutes."
        Rails.logger.warn("Twitter Error: #{error}")
      end

      session[:oldest_id] = @twitter_posts.nil? || @twitter_posts.empty? ? nil : @twitter_posts.last.id 

    else
      @twitter_posts = nil
    end  

    respond_to do |format|  
      format.html { render :index } 
      format.js  
    end  
  end
end
