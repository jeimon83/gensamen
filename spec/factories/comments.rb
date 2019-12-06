# == Schema Information
#
# Table name: comments
#
#  id               :bigint           not null, primary key
#  body             :text
#  commentable_type :string           not null
#  commentable_id   :bigint           not null
#  comment_date     :date
#  user_id          :bigint           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

FactoryBot.define do
  factory :comment, class: Comment do
    body { 'MyText' }
    commentable { nil }
    comment_date { "2019-09-25" }
    user { nil }
  end
end
