# == Schema Information
#
# Table name: report_requests
#
#  id              :bigint           not null, primary key
#  requested_date  :date
#  type            :string
#  expiration_date :date
#  answer          :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  internment_id   :bigint
#

class ReportRequest < ApplicationRecord
  self.inheritance_column = :_type_disabled
  validates :requested_date, :type, presence: true
  belongs_to :internment
  has_many :comments, as: :commentable
  has_many_attached :documents
end
