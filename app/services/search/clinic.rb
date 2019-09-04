# frozen_string_literal: true

# Module Search
module Search
  # Class Clinic
  class Clinic < Base
    
    def fetch_data
      @data = if @user.clinic_id
                @data.where(id: @user.clinic_id)
              elsif @user.admin?
                @data.all
              else
                @data.none
              end
    end

    def filter_data
      @data = if @criteria.present?
        @data.where('LOWER(name) LIKE :name OR LOWER(cuit) LIKE :cuit', name: "%#{@criteria.try(:downcase)}%")
      else
        @data.all
      end
    end
    
    private

    def model_class
      ::Clinic
    end 

  end
end
