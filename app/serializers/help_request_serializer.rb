# frozen_string_literal: true

# == Schema Information
#
# Table name: help_requests
#
#  id             :bigint           not null, primary key
#  requested_date :date
#  type           :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  internment_id  :bigint
#
class HelpRequestSerializer < ActiveModel::Serializer
  attributes :id, :requested_date, :type
  belongs_to :internment
end
