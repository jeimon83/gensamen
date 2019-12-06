class Internments::CommentsController < CommentsController
	before_action :set_commentable

	private

	def set_commentable
		@commentable = Internment.find(params[:internment_id])
	end
end