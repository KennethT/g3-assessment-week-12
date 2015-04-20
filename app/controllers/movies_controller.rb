class MoviesController < ApplicationController

  def index
    @movies = Movie.order(year: :desc)
  end

  def new
    @movie = Movie.new
  end

  def create
   @movie = Movie.new(movie_params)

   if @movie.save
     redirect_to '/'
   else
     render 'new'
   end
 end

 private

 def movie_params
   params.require(:movie).permit(:name, :year, :synopsis, :id)
 end


end
