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
      if argv.empty?
        list.each_with_index do |item, i|
          out.puts "#{i + 1}. #{item.text}"
        end
      elsif argv.first =~ /^-d(\d+)$/
        index = $1.to_i - 1
        list.delete_at(index)
        dump
      else
        list << argv.join(' ')
        dump
      end
    end

    private
      def dump
        Todo::FileStore.dump(list, path)
      end

      def list
        @list ||= Todo::FileStore.load(path)
      end
  end
end
