class PostsController < ApplicationController
  include ActionController::Live

  def index
    response.headers["Content-Type"] = "text/event-stream"
    loop do
      # you might want to add a \n at the end
      # of every write, for the client to be able use ReadLine or smt
      data = {data: Time.now, id: 42 }.to_json
      response.stream.write data
      sleep 0.1
    end
  ensure
    response.stream.close
  end
end
