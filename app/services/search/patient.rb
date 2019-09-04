# frozen_string_literal: true.

# Module Search
module Search
  # Class Patient
  class Patient < Base
    
    def fetch_data
      @data = if @user.clinic_id
                  @data.where(clinic_id: @user.clinic_id)
              else
                  @data.all
              end
    end

    def filter_data
      if @criteria.present?
        @data = @data.where('LOWER(firstname) LIKE :firstname OR LOWER(lastname) LIKE :lastname', name: "%#{@criteria.try(:downcase)}%")
      else
        @data = @data.all
      end
    end

    private

    def model_class
      ::Patient
    end

  end
end

