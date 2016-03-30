class ProfilesController < ApplicationController

  # require 'uri'
  require 'open-uri'
  require 'nokogiri'

  before_action :parse_url, only: :create

  def create
    if @url
      page = Nokogiri::HTML(open(@url, &:read))

      render json: {
          title: page.css(".profile-overview-content .title").text,
          name: page.css("#name").text,
          position: page.css(".org a").text,
          summary: page.css("#summary .description").text
      }

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
