class TestingController < ApplicationController

  def hello
    render json: {message: "Hello UynnMD, I love you <3"}
  end
end
