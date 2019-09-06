# frozen_string_literal: true.

# Module Search
module Search
  # Class Internment
  class Internment < Base
    
    def fetch_data
      @data = if @user.clinic_id
                  @data.by_clinic(@user.clinic_id)
              else
                  @data.by_clinic(@clinic_id)
              end
    end

    def filter_data
      @data = @data.where(patient_id: @patient_id) if @patient_id.present?

      if @criteria.present?
        @data = @data.where('LOWER(firstname) LIKE :firstname OR LOWER(lastname) LIKE :lastname', name: "%#{@criteria.try(:downcase)}%")
      else
        @data = @data.all
      end
    end

    private

    def model_class
      ::Internment
    end

  end
end
