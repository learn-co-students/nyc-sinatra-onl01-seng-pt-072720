class FiguresController < ApplicationController
  get '/figures' do 
    erb :'figures/index'
  end 

  get '/figures/new' do
    erb :'figures/new'
  end 

  post '/figures' do 
    @figure = Figure.create(params[:figure])
    
    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end 
    
    if !params[:landmark][:name].empty? #!params[:landmark][:year_completed].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end 
    
    redirect to "/figures/#{@figure.id}"
  end 

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    erb :'figures/edit'
  end 

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :'figures/show'
  end 

  patch '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    @figure.update(params[:figure])

    if !params[:landmark][:name].empty? 
      @figure.landmarks << Landmark.create(name: params[:landmark][:name])
    end 
    
    @figure.save 
    
    redirect to "figures/#{@figure.id}"
  end 
end