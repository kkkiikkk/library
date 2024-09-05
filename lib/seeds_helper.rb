# frozen_string_literal: true

module SeedsHelper
  class << self
    def create_book!(image, attributes = {})
      Book.create!({
        name: attributes[:name],
        description: attributes[:description],
        author: attributes[:author],
        status: attributes[:status],
        image: image
      })
    end
  end
end
