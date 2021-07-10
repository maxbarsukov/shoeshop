class RelatedProduct < ApplicationRecord
  belongs_to :product
  belongs_to :related, class_name: 'Product'
end
