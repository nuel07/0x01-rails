class Article < ApplicationRecord
    include Visible
    # model association with the comments model, meaning, one article can have
    # many comments. The dependent option makes sure that if an article is deleted
    # all its associated comments are deleted as well
    has_many :comments, dependent: :destroy

    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 }
end
