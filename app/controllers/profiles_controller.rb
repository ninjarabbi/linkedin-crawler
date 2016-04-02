class ProfilesController < ApplicationController

  # require 'uri'
  require 'open-uri'
  require 'nokogiri'

  before_action :parse_url, only: :create
  respond_to :json

  def create
    if @url
      page = Nokogiri::HTML(open(@url, &:read))
      p = Profile.build_profile(page)

      respond_with p

    else
      render file: 'public/422.html', status: :unprocessable_entity, layout: false
    end
  end

  private

  def parse_url
    # TODO verify linkedin url
    if params[:url] =~ URI::regexp
      @url = params[:url]
    end

  end
end
