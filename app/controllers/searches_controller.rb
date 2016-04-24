class SearchesController < ApplicationController
	def new
		@search = Search.new
	end

	def create
		@appID = params[:search][:appID]
		if app_id_type(@appID) == "Apple App Store"
			if apple_store_app_exists?(@appID)
				results = @response["results"].first
				@wanted_attributes = results.slice("artistId", "trackCensoredName", "sellerName", "version", "releaseNotes", "currentVersionReleaseDate")
				render 'show'
			else
				app_not_found
			end
		elsif app_id_type(@appID) == "Google Play Store"
			if play_store_app_exists?(@appID)
				@wanted_attributes = @response.as_json.slice("app_id", "title", "developer", "current_version", "whats_new", "updated")
				render 'show'
			else
				app_not_found
			end
		end
	end

	def show
		if @appID == nil
			redirect_to root_path
		end
	end

	private

		def app_id_type(appID)
			if appID.to_i.to_s == appID
				return @store = "Apple App Store"
			else
				return @store = "Google Play Store"
			end
		end

		def play_store_app_exists?(appID)
	  	begin
	  		!!@response = MarketBot::Android::App.new(appID).update
	  	rescue
	    	return false
	  	end
	  end

  	def apple_store_app_exists?(appID)
			lookup_results = Net::HTTP.get(URI("https://itunes.apple.com/lookup?id=#{appID}"))
			@response = JSON.parse(lookup_results)
  		if @response["resultCount"] == 0
  			return false
  		else
  			return true
  		end
  	end

  	def app_not_found
  		@error = "We could not find this app on the #{@store}"
			@search = Search.new
			render 'new'
		end

end

