# frozen_string_literal: true

# == Schema Information
#
# Table name: configs
#
#  id         :bigint           not null, primary key
#  checklist  :json
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


# Config Serializer
class ConfigSerializer < ActiveModel::Serializer
  attributes :id, :checklist
end
