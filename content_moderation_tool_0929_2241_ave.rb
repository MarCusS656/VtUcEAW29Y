# 代码生成时间: 2025-09-29 22:41:54
# content_moderation_tool.rb
# This Ruby on Rails application provides a basic content moderation tool.
# It allows administrators to review and approve or reject user-submitted content.

require 'rails_helper'

RSpec.describe ContentModerator, type: :model do
  # Mock model representing the content to be moderated.
  class MockContent < ApplicationRecord
    validates :content, presence: true
    belongs_to :moderator, class_name: 'User', foreign_key: 'moderated_by'
  end

  # Mock moderation status constants.
  module ModerationStatus
    APPROVED = 'approved'.freeze
    REJECTED = 'rejected'.freeze
  end

  # User model that moderates content.
  class User < ApplicationRecord
    has_many :moderated_contents, class_name: 'MockContent', foreign_key: 'moderated_by'
  end

  # The ContentModerator class handles the moderation logic.
  class ContentModerator
    # Method to approve content.
    def approve(content)
      unless content.is_a?(MockContent)
        raise ArgumentError, 'The content to approve must be a MockContent instance.'
      end
      content.update(status: ModerationStatus::APPROVED)
    end

    # Method to reject content.
    def reject(content)
      unless content.is_a?(MockContent)
        raise ArgumentError, 'The content to reject must be a MockContent instance.'
      end
      content.update(status: ModerationStatus::REJECTED)
    end
  end

  # Example usage and testing of the ContentModerator.
  RSpec.describe 'Content Moderation' do
    let(:moderator) { User.create! }
    let(:content) { MockContent.create!(content: 'Sample content', moderated_by: moderator.id) }
    let(:moderator_tool) { ContentModerator.new }

    it 'approves content' do
      moderator_tool.approve(content)
      expect(content.reload.status).to eq(ModerationStatus::APPROVED)
    end

    it 'rejects content' do
      moderator_tool.reject(content)
      expect(content.reload.status).to eq(ModerationStatus::REJECTED)
    end

    it 'raises error for non-MockContent instances' do
      expect { moderator_tool.approve('Not a MockContent instance') }.to raise_error(ArgumentError)
    end
  end
end
