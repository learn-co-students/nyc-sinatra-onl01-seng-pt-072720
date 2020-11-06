class FiguresController < ApplicationController
  
  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end
  
  get '/figures/new' do
    erb :'/figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'/figures/edit'
  end

  post '/figures/:id' do
    
    @figure = Figure.find_or_create_by(name: params[:figure][:name])

      if params[:figure][:title_ids]
        params[:figure][:title_ids].each {|t_id| @figure.titles << Title.find(t_id)} unless params[:figure][:title_ids].empty?
      end
      @figure.titles << Title.find_or_create_by(name: params[:title][:name]) unless params[:title][:name].empty?

      if params[:figure][:landmark_ids]
        params[:figure][:landmark_ids].each {|l_id| @figure.landmarks << Landmark.find(l_id)} unless params[:figure][:landmark_ids].empty?
      end
      @figure.landmarks << Landmark.find_or_create_by(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed]) unless params[:landmark][:name].empty?
    
    
    params[:id] = @figure.id
    # binding.pry
    redirect "/figures/#{@figure.id}"
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    # binding.pry

    @figure.update(name: params[:figure][:name])

    @figure.titles.clear
    @figure.landmarks.clear

    if params[:figure][:title_ids]
      params[:figure][:title_ids].each {|t_id| @figure.titles << Title.find(t_id)} unless params[:figure][:title_ids].empty?
    end
    @figure.titles << Title.find_or_create_by(name: params[:title][:name]) unless params[:title][:name].empty?

    if params[:figure][:landmark_ids]
      params[:figure][:landmark_ids].each {|l_id| @figure.landmarks << Landmark.find(l_id)} unless params[:figure][:landmark_ids].empty?
    end
    @figure.landmarks << Landmark.find_or_create_by(name: params[:landmark][:name], year_completed: params[:landmark][:year_completed]) unless params[:landmark][:name].empty?
  
  
    params[:id] = @figure.id
    # binding.pry
    redirect "/figures/#{@figure.id}"
  end
end

