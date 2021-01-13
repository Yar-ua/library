module SaveLoadHelper
  def save_file(file_name)
    File.open(file_name, 'w') { |file| file.write(to_yaml) }
  end

  def load_file(file_name)
    YAML.safe_load(File.open(file_name), [Library, Author, Book, Reader, Order, Date], [], true)
  end
end
