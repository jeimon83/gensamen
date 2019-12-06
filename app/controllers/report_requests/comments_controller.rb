class ReportRequests::CommentsController < CommentsController
	before_action :set_commentable

	private

	def set_commentable
		@commentable = ReportRequest.find(params[:report_request_id])
	end
end