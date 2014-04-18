require_relative '../picture_manager'
require_relative '../picture'

class PictureImporter

  def self.import
    columns = [:answer, :location, :lines]
    gamecards = []

    path = "#{File.dirname(__FILE__)}/../pictures/*.txt"
    Dir.glob(path).each do |file|
      picture_data = []
      picture = PictureManager.new(file)
      picture_data << picture.answer
      picture_data << "#{picture.filename}"
      picture_data << picture.lines
      Picture.create!(Hash[columns.zip(picture_data)])
    end

  end

end