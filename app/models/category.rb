# == Schema Information
#
# Table name: categories
#
#  id          :bigint           not null, primary key
#  title       :string
#  bytitle     :string
#  keywords    :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  ancestry    :string
#
class Category < ApplicationRecord
  has_ancestry
  has_many :products
end
