# == Schema Information
#
# Table name: packages
#
#  id          :bigint           not null, primary key
#  description :string
#  details     :string
#  expected    :date
#  status      :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#
class Package < ApplicationRecord
end
