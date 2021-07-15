# == Schema Information
#
# Table name: brands
#
#  id          :bigint           not null, primary key
#  title       :string
#  bytitle     :string
#  img         :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Brand < ApplicationRecord
  validates :title,       presence: true
  validates :description, presence: true
end
