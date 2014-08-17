def copy_file(backup_folder, folder, file, ext)
  if not system("cp \"#{folder}/#{file}\" \"#{backup_folder}/#{ext}/#{file}.#{ext}\"")
    puts "Error: #{$?}."
  else
    puts "Copied #{ext} file."
  end
end
def parse_file(backup_folder, folder, file)
  File.open("#{folder}/#{file}") do |f|
    buffer = f.read(10)
    if not buffer.nil?
      case buffer
      when /PNG|Exif/ then copy_file(backup_folder, folder, file, "png")
      when /JFIF/ then copy_file(backup_folder, folder, file, "jpg")
      when /ftypqt/ then copy_file(backup_folder, folder, file, "mov")
      when /SQLite/ then copy_file(backup_folder, folder, file, "sqlite")
      end
    end
  end
end
def extract(backup_folder, folder, max_file_size=25000)
  ["png", "jpg", "mov", "sqlite"].each do |ext|
    dir = "#{backup_folder}/#{ext}"
    Dir.mkdir(dir) unless Dir.exist?(dir)
  end
  Dir.entries(folder).each do |file|
    parse_file(backup_folder, folder, file) unless %w(. .. .DS_STORE).include? file
  end
end
extract(ARGV[1], ARGV[0])

