module Todo
  module FileStore
    def self.load(path)
      List.new.tap do |list|
        if path.exist?
          path.each_line do |line|
            list << line.chomp if line =~ /\S/
          end
        end
      end
    end
  end
end
