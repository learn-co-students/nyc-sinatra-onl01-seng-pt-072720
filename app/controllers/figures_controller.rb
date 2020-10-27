class FiguresController < ApplicationController
  get '/figures/new' do
    erb :'figures/new'
  end 

  post '/figures' do 
    # binding.pry 
    @figure = Figure.create(params[:figure])
    
    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end 
        
    # binding.pry
    if !params[:landmark][:name].empty? && !params[:landmark][:year_completed].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end 
    @figure.landmarks << params[:landmarks]

    redirect to "/figures/#{@figure.id}"
  end 
end
# if !params[:figure].keys.include?("title_ids")
#   params[:figure]["title_ids"] = [] 
# end 

# if !params[:figure].keys.include?("landmark_ids")
#   params[:figure]["landmark_ids"] = [] 
# end 