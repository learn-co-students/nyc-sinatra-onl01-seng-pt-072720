class LandmarksController < ApplicationController
  get '/landmarks/new' do
    erb :'landmarks/new'
  end 

  post '/landmarks' do 
    @landmark = Landmark.create(params[:landmark])
    erb :"landmarks/#{@landmark.id}"
  end 

  get '/landmarks' do
    erb :'landmarks/index'
  end 

  get '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :'landmarks/show'
  end 

  get '/landmarks/:id/edit' do 
    @landmark = find_by_id(params[:id])
    erb :'landmarks/edit'
  end 
end
