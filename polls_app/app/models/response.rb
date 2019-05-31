# == Schema Information
#
# Table name: responses
#
#  id               :bigint           not null, primary key
#  respondent_id    :integer          not null
#  answer_choice_id :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Response < ApplicationRecord
  validates :respondent_id, :answer_choice_id, presence: true
  validate :respondent_already_answered?
  validate :own_poll?

  belongs_to :respondent,
    primary_key: :id,  
    foreign_key: :respondent_id,
    class_name: :User

  belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: :AnswerChoice

  has_one :question,
    through: :answer_choice,
    source: :question

  def sibling_responses
    self.question.responses.where.not(id: self.id)
  end

  def respondent_already_answered?
    if Response.exists?(respondent_id: self.respondent_id)
      errors[:response] << 'already answered'
    end
  end

  def own_poll?
    if self.question.poll.author_id == self.respondent_id
      errors[:response] << 'can\'t answer own poll!!'
    end
  end
end
