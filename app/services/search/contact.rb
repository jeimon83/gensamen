# frozen_string_literal: true.

# Module Search
module Search
  # Class Contact
  class Contact < Base

    def filter_data
      @data = @data.by_clinic(@clinic_id) if @clinic_id.present?
      @data = @data.where(patient_id: @patient_id) if @patient_id.present?
      
      return if @criteria.blank?
      
      @data = @data.where('LOWER(contacts.firstname) LIKE :criteria OR '\
                          'LOWER(contacts.lastname) LIKE :criteria', criteria: "%#{@criteria}%")
    end

    private

    def model_class
      ::Contact
    end

  end
end

