class HomeController < ApplicationController
  def index

  end

  def test
    respond_to do |f|
      f.js
    end
  end
end
