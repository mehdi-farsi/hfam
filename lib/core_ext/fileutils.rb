module FileUtils
  def self.hidden_file?(path_to_file)
    path_to_file[0] == '.'
  end
end