# frozen_string_literal: true

# Module Search
module Search
  # Class Clinic
  class Clinic < Base

    def filter_data
      @data = @data.by_clinic(@clinic_id) if @clinic_id.present?

      return if @criteria.blank?

      @data = @data.where('LOWER(name) LIKE :criteria OR '\
                          'LOWER(cuit) LIKE :criteria', criteria: "%#{@criteria}%")
    end
    
    private

    def model_class
      ::Clinic
    end 

  end
end
