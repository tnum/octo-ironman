# class Product
#   include Paginate

# Product.paginate

module Paginate
  extend ActiveSupport::Concern

  included do
    def self.paginate(options = {})
      per_page = options[:per_page] || 10
      page = options[:page] || 1

      self.limit(per_page).offset(page * 10)
    end
  end

end


