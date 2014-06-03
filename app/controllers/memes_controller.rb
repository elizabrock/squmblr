require 'unirest'
class MemesController < ApplicationController


  def self.get_meme
    top_text = 'Yeah,'
    bottom_text = 'Hell_Yeah'
    base_image_title = 'Condescending%20Wonka'
    # base_image_title = 'earring'
    path = 'https://ronreiter-meme-generator.p.mashape.com/meme?meme=' + base_image_title + '&top=' + top_text + '&bottom=' + bottom_text + '&font=Impact&font_size=50'
    image_directory = 'app/assets/images/'
    image_file = 'doesitwork.jpg'
    image_path = image_directory + image_file
    response = Unirest::get path,
      headers: {
        'X-Mashape-Authorization' => 'o352LiepNZdiE5TAykdDyZ1RmSyc0BlG',
        'Accept' => 'application/json'
      }
      Rails.logger.debug "\n The response is: ((((((((((((#{response.inspect}))))))))))))"
      IO.write(image_path, response.body.force_encoding("UTF-8"))

    return response
  end
  self.get_meme

end
