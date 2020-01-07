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

class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :commentable_type, :commentable_id, :comment_date, :user

  def user
    {
      id: self.object.user.id,
      email: self.object.user.email,
      full_name: self.object.user.full_name
    }
  end
end
