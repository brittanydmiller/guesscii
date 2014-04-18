# picture

# answer, compare user input to answer => true/false


# file manager


# class FileManager


class PictureDisplay

  def initialize(filename)
    @filename = filename
    @picture = []
    @counter = 0
    file_open
    @increment = @picture.length/5
    @stop = @increment
  end

  def file_open
    File.foreach(@filename) do |line|
      @picture << line
    end
  end

  def show_more
    while @counter <= @stop
      puts @picture[@counter]
      @counter += 1
    end
    @counter = @stop + 1
    @stop += @increment
  end





end

panda = PictureDisplay.new('panda.txt')

panda.show_more
panda.show_more