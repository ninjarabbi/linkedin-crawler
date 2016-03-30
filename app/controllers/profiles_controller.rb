class ProfilesController < ApplicationController

  require 'uri'
  require 'open-uri'

  before_action :parse_url, only: :create

  def create
    if @url
      source = open(@url, &:read)

      render json: source
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
