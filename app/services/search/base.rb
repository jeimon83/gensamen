# frozen_string_literal: true.

# Module Search
module Search
  # Class Patient
  class Patient
    attr_reader :page, :per_page, :criteria, :data, :metadata

    def initialize(current_user, clinic_id, options = {})
      @paginate = options.fetch(:paginate, true)
      @page     = options.fetch(:page, 1).to_i
      @per_page = options.fetch(:limit, 10).to_i
      @criteria = options.fetch(:criteria, nil)

      @data     = model_class
      @metadata = {}
      
      @user = current_user
      @clinic = clinic_id
    end

    def run
      fetch_data
      filter_data
      paginate
    end

    def fetch_data
      
    end

    def filter_data
      raise NotImplementedError
    end

    def paginate
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

