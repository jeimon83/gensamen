# frozen_string_literal: true.

# Module Search
module Search
  # Class User
  class User < Base

    def filter_data
      @data = @data.by_clinic(@clinic_id) if @clinic_id.present?

      return if @criteria.blank?
      
      @data = @data.where('LOWER(users.email) LIKE :criteria OR '\
                          'LOWER(users.first_name) LIKE :criteria OR '\
                          'LOWER(users.last_name) LIKE :criteria', criteria: "%#{@criteria}%")
    end

    private

    def model_class
      ::User
    end

  end
end
