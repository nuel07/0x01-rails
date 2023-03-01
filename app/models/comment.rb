class Comment < ApplicationRecord
  include Visible
  # model association, meaning, each comment belongs to one article
  belongs_to :article
end
