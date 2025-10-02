# 代码生成时间: 2025-10-02 20:37:48
# file_decompressor_service.rb
# A service class for decompressing files using Ruby and Rails.

require 'zip'
require 'fileutils'

defmodule FileDecompressorService
  # Decompress a ZIP file to a specified directory.
  #
  # @param zipfile_path [String] The path to the ZIP file to decompress.
  # @param output_directory [String] The directory where to decompress the file.
  #
  # @return [Boolean] True if the operation was successful, False otherwise.
  def self.decompress_zip_file(zipfile_path, output_directory)
    # Check if the file exists.
    unless File.exist?(zipfile_path)
      Rails.logger.error("File not found: #{zipfile_path}")
      return false
    end

    # Ensure the output directory exists or create it.
    FileUtils.mkdir_p(output_directory)

    # Decompress the ZIP file.
    begin
      Zip::File.open(zipfile_path) do |zip_file|
        zip_file.each do |entry|
          # Extract each file from the ZIP archive.
          filepath = File.join(output_directory, entry.name)
          FileUtils.mkdir_p(File.dirname(filepath))
          zip_file.extract(entry, filepath)
        end
      end
      true
    rescue Zip::Error => e
      Rails.logger.error("ZIP error: #{e.message}")
      false
    rescue StandardError => e
      Rails.logger.error("Unexpected error: #{e.message}")
      false
    end
  end
end
