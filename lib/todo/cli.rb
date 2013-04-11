require 'pathname'

module Todo
  class Cli
    FILENAME = 'TODO'

    attr_reader :argv, :dir, :list, :path, :err, :out

    def initialize(dir, argv, out, err)
      @dir = dir
      @argv = argv
      @out = out
      @err = err
      @path = Pathname.new(File.join(dir, FILENAME))
    end

    def run
      list.each do |item|
        puts item.text
      end
    end

    private
      def list
        @list ||= Todo::FileStore.load(path)
      end
  end
end
