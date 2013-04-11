module Todo
  module FileStore
    def self.dump(list, path)
      File.open(path, 'w') do |f|
        list.items.each do |item|
          f.puts item.text
        end
      end
    end

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
