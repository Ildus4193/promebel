class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :catalog_links

  def catalog_links
    @catalog_links = Category.all
  end
end
