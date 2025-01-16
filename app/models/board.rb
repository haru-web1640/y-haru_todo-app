# == Schema Information
#
# Table name: boards
#
#  id          :bigint           not null, primary key
#  discription :text
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Board < ApplicationRecord
end
