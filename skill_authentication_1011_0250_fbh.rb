# 代码生成时间: 2025-10-11 02:50:27
# skill_authentication.rb
# This is a simple Ruby on Rails application for a skill authentication platform.

# Load Rails environment
require_relative 'config/environment'

# Define the Skill model for storing skills
class Skill < ApplicationRecord
  # Validations ensure that each skill has a name and a description
  validates :name, presence: true
  validates :description, presence: true
end

# Define the User model for storing users
class User < ApplicationRecord
  # Validations ensure that each user has a name, email, and password
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
end

# Define the SkillAuthentication controller
class SkillAuthenticationController < ApplicationController
  # GET /skills
  def index
    # Fetch all skills from the database
    @skills = Skill.all
    render json: @skills
  end

  # POST /skills
  def create
    # Create a new skill from the given parameters
    skill = Skill.new(skill_params)
    if skill.save
      render json: skill, status: :created, location: skill
    else
      render json: skill.errors, status: :unprocessable_entity
    end
  end

  # PUT /skills/:id
  def update
    # Find the skill with the given id and update it
    skill = Skill.find(params[:id])
    if skill.update(skill_params)
      render json: skill
    else
      render json: skill.errors, status: :unprocessable_entity
    end
  end

  # DELETE /skills/:id
  def destroy
    # Find the skill with the given id and destroy it
    skill = Skill.find(params[:id])
    skill.destroy
    head :no_content
  end

  private
  # Only allow a list of trusted parameters through
  def skill_params
    params.require(:skill).permit(:name, :description)
  end
end

# Define the UserAuthentication controller
class UserAuthenticationController < ApplicationController
  # POST /users
  def create
    # Create a new user from the given parameters
    user = User.new(user_params)
    if user.save
      render json: user, status: :created, location: user
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  private
  # Only allow a list of trusted parameters through
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
