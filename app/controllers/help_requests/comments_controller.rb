class HelpRequests::CommentsController < CommentsController
	before_action :set_commentable

	private

	def set_commentable
		@commentable = HelpRequest.find(params[:help_request_id])
	end
end