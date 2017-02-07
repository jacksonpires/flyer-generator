class AboutController < ApplicationController
  def clear
    Flyer.where(address1: '').delete_all
    render text: "OK!"
  end
end
