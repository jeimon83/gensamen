class AuthorizeObject
  prepend SimpleCommand

  def initialize(current_user, object)
    @user = current_user
    @object = object
  end

  def call
    return true unless @user.clinic_id.present?

    @user.clinic_id == @object.clinic_id
  end
  
end
