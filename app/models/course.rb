# == Schema Information
#
# Table name: courses
#
#  id              :integer          not null, primary key
#  class_time      :string
#  day_of_the_week :string
#  description     :string
#  name            :string
#  teacher         :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :integer
#

class Course < ApplicationRecord
end
