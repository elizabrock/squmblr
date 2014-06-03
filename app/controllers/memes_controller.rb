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

  def new
    @meme = Meme.new
  end

  def create
    @meme = current_user.memes.build(meme_params)
    image = params[:meme][:image].path
    get_meme(image)
    if @meme.save
      redirect_to memes_path, notice: "Your meme has been created"
    else
      render "new"
    end
  end

  def get_meme(image)

    Rails.logger.debug "\n THE MEME IS: #{@meme.inspect}\n THE IMAGE IS: #{image}\n"

    upload_image(image)

    Rails.logger.debug "\n BACK TO GET_MEME \n"

    top_text = @meme.top_text
    bottom_text = @meme.bottom_text
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

  def upload_image(image)


    # Corresponds with API from:
    # https://www.mashape.com/ronreiter/meme-generator#!endpoint-Get-images

    path = "https://ronreiter-meme-generator.p.mashape.com/images"
    response = Unirest::post path,
      headers: {
        "X-Mashape-Authorization" => "o352LiepNZdiE5TAykdDyZ1RmSyc0BlG",
        "Accept" => "application/json"
      },
      parameters: {
        "image" => File.new(image, 'rb')
      }

    Rails.logger.debug "\n UPLOAD IMAGE RESPONSE: #{response.inspect} \n"

  end

  private

  def meme_params
    params.require(:meme).permit(:top_text, :bottom_text)
  end
end
