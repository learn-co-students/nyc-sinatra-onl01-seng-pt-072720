class FiguresController < ApplicationController
  get '/figures/new' do
    erb :'figures/new'
  end 

  post '/figures' do 
    # binding.pry 
    @figure = Figure.create(params[:figure])
    if !params[:title][:name].empty?
      @title = Title.create(params[:title])
      @figure.title_ids << params[:title][:id]
    end 

    if !params[:landmark][:name].empty? && !params[:landmark][:year_completed].empty?
      @landmark = Landmark.create(params[:landmark])
      @figure.landmark_ids << params[:landmarks]
    end 

    redirect to "/figures/#{@figure.id}"
  end 
end
# if !params[:figure].keys.include?("title_ids")
#   params[:figure]["title_ids"] = [] 
# end 

# if !params[:figure].keys.include?("landmark_ids")
#   params[:figure]["landmark_ids"] = [] 
# end 