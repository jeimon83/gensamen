# frozen_string_literal: true.

# Contact Search Service
class Search::Contact
  attr_reader :page, :per_page, :criteria, :data, :metadata

  def initialize(current_user, patient_id, options = {})
    @paginate = options.fetch(:paginate, true)
    @page     = options.fetch(:page, 1).to_i
    @per_page = options.fetch(:limit, 10).to_i
    @criteria = options.fetch(:criteria, nil)

    @data     = ::Contact
    @metadata = {}
  end

  def run
    search
    paginate if @paginate
  end

  def search
    if @criteria.present?
      @data = @data.where('LOWER(firstname) LIKE :name OR LOWER(lastname) LIKE :name', { name: "%#{@criteria.try(:downcase)}%" })
    else
      @data = @data.all
    end
  end

  def paginate
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
