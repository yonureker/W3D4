# == Schema Information
#
# Table name: questions
#
#  id         :bigint           not null, primary key
#  text       :string           not null
#  poll_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ApplicationRecord
  validates :poll_id, presence: true
  validates :text, presence: true, uniqueness: true

  belongs_to :poll,
    primary_key: :id,
    foreign_key: :poll_id,
    class_name: :Poll
  
  has_many :answer_choices,
    primary_key: :id,  
    foreign_key: :question_id,
    class_name: :AnswerChoice

  has_many :responses,
    through: :answer_choices,
    source: :responses
  
#  def results
#     result_hash = {}
#     self.answer_choices.each { |choice| result_hash[choice.text] = choice.responses.count}
#     result_hash
#   end 

  # def results
  #   result_hash = Hash.new(0)
  #   results = self.answer_choices.includes(:responses)
  #   results.each do |choice|
  #     result_hash[choice.text] = choice.responses.length
  #   end
  #   result_hash
  # end

  def results
    results = 
      SELECT 
        answer_choices.*, COUNT(answer_choices.responses)
      FROM
        answer_choices
      JOIN
        questions ON answer_choices.question_id = questions.id
      
  end
end
