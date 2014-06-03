require 'unirest'
class MemesController < ApplicationController
  def index
    @memes = Meme.all
  end
  def show
    @meme = Meme.find(params[:id])
  end

  def new
    @meme = Meme.new
  end

  def create
    @meme = current_user.memes.build(meme_params)
    image = params[:meme][:image].path
    #image_name = image.split("/tmp/")[1]
    uploaded_io = params[:meme][:image]
    image_name = uploaded_io.original_filename
    File.open(Rails.root.join('public', 'uploads', image_name), 'wb') do |file|
      file.write(uploaded_io.read)
    end

    Rails.logger.debug "\n THIS IS THE PARAMETERS: #{params} \n"
    Rails.logger.debug "\n THIS IS THE IMAGE NAME: #{image_name} \n"

    upload_image(image)
    get_meme(image_name)
    if @meme.save
      redirect_to memes_path, notice: "Your meme has been created"
    else
      render "new"
    end
  end

  def get_meme(image_name)

    top_text = @meme.top_text
    bottom_text = @meme.bottom_text
    #
    #base_image_title = 'Condescending%20Wonka'
    #
    path = 'https://ronreiter-meme-generator.p.mashape.com/meme?meme=' + image_name + '&top=' + top_text + '&bottom=' + bottom_text + '&font=Impact&font_size=50'


    Rails.logger.debug "\n GET MEME PATH IS: #{path}\n"


    image_directory = 'app/assets/images/'
    image_file = 'doesitwork.jpg'

    image_path = image_directory + image_file
    response = Unirest::get path,
      headers: {
        'X-Mashape-Authorization' => 'o352LiepNZdiE5TAykdDyZ1RmSyc0BlG',
        'Accept' => 'application/json'
      }
      IO.write(image_path, response.body.force_encoding("UTF-8"))

      Rails.logger.debug "\n GET MEME RESPONSE: #{response.inspect}\n"

  end

  def upload_image(image)

    #image = "app/assets/images/stratocaster3.jpg"

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


    Rails.logger.debug "\n UPLOAD IMAGE, RESPONSE IS: #{response.inspect} \n"

  end

  private

  def meme_params
    params.require(:meme).permit(:top_text, :bottom_text)
  end
end
