class ErrorController < ApplicationController
  
  def handle404
    render :template => "error/404.html", :status => 404
  end  

end
