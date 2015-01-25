# web user interface controller
class WuiController < ApplicationController
  def home
    @manlist = Manifestation.all
  end
end
