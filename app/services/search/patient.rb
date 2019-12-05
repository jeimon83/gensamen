# frozen_string_literal: true.

# Module Search
module Search
  # Class Patient
  class Patient < Base

    def filter_data
      @data = @data.by_clinic(@clinic_id) if @clinic_id.present?

      return if @criteria.blank?

      @data = @data.where('LOWER(patients.firstname) LIKE :criteria OR '\
                          'LOWER(patients.lastname) LIKE :criteria', criteria: "%#{@criteria}%")
    end

    private

    def model_class
      ::Patient
    end

  end
end

