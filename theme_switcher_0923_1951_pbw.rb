# 代码生成时间: 2025-09-23 19:51:45
# theme_switcher.rb
# This Ruby on Rails program allows users to switch between themes.

# Define a class to handle theme switching
class ThemeSwitcher
  # Define the themes available
  THEMES = %w[light dark].freeze
  
  # The current theme attribute
  attr_accessor :current_theme
  
  # Initialize the ThemeSwitcher with the default theme
  def initialize
    @current_theme = 'light' # default theme
  end

  # Method to switch to a different theme if it's valid
  def switch_theme(new_theme)
    if THEMES.include?(new_theme)
      @current_theme = new_theme
      puts "Theme switched to #{@current_theme} successfully."
    else
      raise ArgumentError, "Invalid theme: #{new_theme}. Please choose from #{THEMES.join(', ')}."
    end
  end
end

# Example usage
begin
  theme_switcher = ThemeSwitcher.new
  puts "Current theme is: #{theme_switcher.current_theme}"
  
  # User input for switching theme (this would be replaced with real user input in a Rails app)
  user_theme_choice = 'dark'
  theme_switcher.switch_theme(user_theme_choice)
  puts "Theme switched to: #{theme_switcher.current_theme}"

rescue ArgumentError => e
  puts e.message
end