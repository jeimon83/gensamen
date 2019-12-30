# == Schema Information
#
# Table name: help_requests
#
#  id             :bigint           not null, primary key
#  requested_date :date
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  internment_id  :bigint
#  clinic_id      :bigint
#  description    :text
#  title          :string
#

class HelpRequest < ApplicationRecord
  validates :requested_date, presence: true
  belongs_to :clinic, optional: true
  belongs_to :internment, optional: true
  has_many :comments, as: :commentable
  has_many_attached :documents

end
