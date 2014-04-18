class PictureManager

  attr_reader :answer, :picture, :filename, :lines

  def initialize(filename)
    @filename = filename
    @picture = []
    file_open
    @answer = @picture.shift.chomp.gsub("'", "")
    @lines = @picture.length
  end

  def file_open
    File.foreach(@filename) do |line|
      @picture << line
    end
  end

end
