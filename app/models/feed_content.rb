class FeedContent < ActiveRecord::Base
  belongs_to :content, polymorphic: true
  belongs_to :group
end
