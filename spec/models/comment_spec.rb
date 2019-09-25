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

require 'rails_helper'

RSpec.describe Comment, type: :model do
  let!(:user) { FactoryBot.create(:user) }
  let!(:patient) { FactoryBot.create(:patient) }
  let(:comment) { described_class.new(body: 'Texto', comment_date: '20-02-2019', user: user, commentable: patient) }

  context 'do validation tests' do
    let(:comment) { build(:comment) }
    it 'ensures body presence' do
      comment.body = nil
      expect(comment.valid?).to eq(false)
    end
    it 'ensures comment date presence' do
      comment.comment_date = nil
      expect(comment.valid?).to eq(false)
    end
    it 'should save successfully' do
      comment = patient.comments << Comment.new(body: 'Texto', comment_date: '20-02-2019', user: user)
      expect(comment.save).to eq(true)
    end
  end
  context 'testing user relation' do
    it 'belongs to user' do
      assc = Comment.reflect_on_association(:user)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
