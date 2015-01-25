# web user interface controller
class WuiController < ApplicationController
  def home
    @taglist = Tag.joins(:manifestations)
  end
end
