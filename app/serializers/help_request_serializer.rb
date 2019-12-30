# frozen_string_literal: true

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
class HelpRequestSerializer < ActiveModel::Serializer
  attributes :id, :requested_date, :description, :title
  belongs_to :clinic
  belongs_to :internment, optional: true
  has_many :comments, as: :commentable
end
