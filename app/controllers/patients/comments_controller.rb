class Patients::CommentsController < CommentsController
	before_action :set_commentable

	private

	def set_commentable
		@commentable = Patient.find(params[:patient_id])
	end
end