# frozen_string_literal: true.

# Module Search
module Search
  # Class Base
  class Base
    attr_reader :page, :per_page, :criteria, :data, :metadata

    def initialize(current_user, options = {})
      @user = current_user

      raise ArgumentError unless @user

      @clinic_id  = options[:clinic_id]
      @patient_id = options[:patient_id]

      @paginate = options.fetch(:paginate, true)
      @page     = options.fetch(:page, 1).to_i
      @per_page = options.fetch(:limit, 10).to_i

      @criteria = options.fetch(:criteria, nil)
      @criteria = @criteria.downcase.strip if @criteria.present?

      @data     = model_class
      @metadata = {}
    end

    def run
      fetch_data
      filter_data
      order_data
      paginate_data
    end
    
    def fetch_data
      @data = if @user.clinic_id
          @data.by_clinic(@user.clinic_id)
        else
          @data.all
        end
    end

    def filter_data
      raise NotImplementedError
    end

    def order_data
      @data = @data.order(updated_at: :desc)
    end

    def paginate_data
      return unless @paginate

      @data     = @data.paginate(page: @page, per_page: @per_page)
      @metadata = {
        current_page: @data.current_page,
        per_page: @data.per_page,
        offset: @data.offset,
        total_entries: @data.total_entries,
        total_pages: @data.total_pages,
        previous_page: @data.previous_page,
        next_page: @data.next_page
      }
    end
  end
end

