class Comment < ApplicationRecord
  belongs_to :article
  broadcasts_to :article
  # after_create_commit { CommentBroadcastJob.perform_later(self) }
end
