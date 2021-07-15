# == Schema Information
#
# Table name: authorizations
#
#  id         :bigint           not null, primary key
#  user_id    :bigint
#  provider   :string
#  uid        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Authorization < ApplicationRecord
  belongs_to :user
end
