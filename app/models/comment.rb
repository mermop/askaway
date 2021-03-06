# == Schema Information
#
# Table name: comments
#
#  id          :integer          not null, primary key
#  question_id :integer
#  user_id     :integer
#  body        :text
#  created_at  :datetime
#  updated_at  :datetime
#

class Comment < ActiveRecord::Base
  include ProfanityFilter

  belongs_to :question, touch: true, counter_cache: true
  belongs_to :user
  validates :body, presence: true
end
