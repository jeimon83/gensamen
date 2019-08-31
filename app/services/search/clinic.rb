# frozen_string_literal: true

# Clinic Search Service
class Search::Clinic
  attr_reader :page, :per_page, :criteria, :data, :metadata

  def initialize(current_user, options = {})
    @paginate = options.fetch(:paginate, true)
    @page     = options.fetch(:page, 1).to_i
    @per_page = options.fetch(:limit, 10).to_i
    @criteria = options.fetch(:criteria, nil)

    @data     = ::Clinic
    @metadata = {}

    @user = current_user
  end

  def run
    fetch_data unless @user.admin? & @user.clinic_id.nil?
    search
    #paginate
  end

  def fetch_data
    @data = @data.find_by(id: @user.clinic_id)
  end

  def search
    #if @criteria.present?
    #  @data = @data.where('LOWER(name) LIKE :name OR LOWER(cuit) LIKE :cuit', name: "%#{@criteria.try(:downcase)}%")
    #else
      #@data
    #end
  end

  def paginate
    return unless @paginate

    @data     = @data.paginate(page: @page, per_page: @per_page)
    @metadata = {
      current_page:   @data.current_page,
      per_page:       @data.per_page,
      offset:         @data.offset,
      total_entries:  @data.total_entries,
      total_pages:    @data.total_pages,
      previous_page:  @data.previous_page,
      next_page:      @data.next_page
    } 
  end
end
