# frozen_string_literal: true

# Module Search
module Search
  # Class Internment
  class Internment < Base

    def filter_data
      @data = @data.by_clinic(@clinic_id) if @clinic_id.present?
      @data = @data.where(patient_id: @patient_id) if @patient_id.present?
      
      puts "****** Data: #{@data}"
      @data.each do |d|
        puts "datos: #{d.clinic_id}"
      end
      return if @criteria.blank?

      @data = @data.where('LOWER(type) LIKE :criteria', criteria: "%#{@criteria}%")
    end

    private

    def model_class
      ::Internment
    end

  end
end
