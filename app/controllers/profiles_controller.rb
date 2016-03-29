class ProfilesController < ApplicationController

  require 'uri'
  require 'open-uri'

    def create
    if params[:url] =~ URI::regexp
      source = open(params[:url], &:read)

      render :json => source


    else
      render :file => 'public/422.html', :status => :unprocessable_entity, :layout => false
    end
  end

end
