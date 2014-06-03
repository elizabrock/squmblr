require 'unirest'
class MemesController < ApplicationController
  def new
    @meme = Meme.new
  end
  def index
    @memes = Meme.all
  end
  def show
    @meme = Meme.find(params[:id])
  end
  
  def create
    @meme = current_user.memes.build(meme_params)
    if @meme.save
      get_meme(meme)
      redirect_to memes_path, notice: "Your memeble has been created!"
    else
      flash[:alert] =  "Your memeble could not be created."
      render :new
    end
  end

  def self.get_meme
    @top_text = 'Yeah,'
    @bottom_text = 'Hell_Yeah'
    base_image_title = 'Condescending%20Wonka'
    path = 'https://ronreiter-meme-generator.p.mashape.com/meme?meme=' + base_image_title + '&top=' + top_text + '&bottom=' + bottom_text + '&font=Impact&font_size=50'
    image_directory = 'app/assets/images/'
    image_file = 'doesitwork.jpg'
    image_path = image_directory + image_file
    response = Unirest::get path,
      headers: {
        'X-Mashape-Authorization' => 'o352LiepNZdiE5TAykdDyZ1RmSyc0BlG',
        'Accept' => 'application/json'
      }
      IO.write(image_path, response.body.force_encoding("UTF-8"))
  end

  def meme_params
    params.require(:meme).permit(:top_text, :bottom_text)
  end
end