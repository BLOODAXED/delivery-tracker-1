# == Schema Information
#
# Table name: packages
#
#  id          :bigint           not null, primary key
#  description :string
#  details     :string
#  expected    :datetime
#  status      :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Package < ApplicationRecord
end
