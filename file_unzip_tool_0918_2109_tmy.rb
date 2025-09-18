# 代码生成时间: 2025-09-18 21:09:49
# 文件解压工具类
class FileUnzipTool
  # 解压文件至指定目录
  #
  # @param file_path [String] 压缩文件的路径
  # @param output_dir [String] 解压后文件的输出目录
  #
  # @return [Boolean] 解压成功返回true，失败返回false
  def self.unzip_file(file_path, output_dir)
    # 检查文件路径是否存在
    unless File.exist?(file_path)
      puts "Error: File does not exist at path #{file_path}"
      return false
    end

    # 检查输出目录是否存在，如果不存在则创建
    unless Dir.exist?(output_dir)
      puts "Output directory does not exist, creating...
      FileUtils.mkdir_p(output_dir)
    end

    begin
      # 解压文件
      Zip::File.open(file_path) do |zip_file|
        zip_file.each do |entry|
          # 获取解压后文件的完整路径
          extract_path = File.join(output_dir, entry.name)
          # 解压文件
          zip_file.extract(entry, extract_path)
        end
      end
      true
    rescue Zip::Error => e
      puts "Error: An error occurred while unzipping the file - #{e.message}"
      false
    end
  end
end

# 示例用法
if __FILE__ == $0
  # 设置压缩文件路径和输出目录
  file_path = 'path/to/your/zipfile.zip'
  output_dir = 'path/to/your/output/directory'
  
  # 调用解压方法
  success = FileUnzipTool.unzip_file(file_path, output_dir)
  
  # 输出结果
  if success
    puts "File successfully unzipped to #{output_dir}"
  else
    puts "Failed to unzip the file"
  end
end