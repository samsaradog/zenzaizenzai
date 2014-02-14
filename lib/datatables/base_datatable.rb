module Zenzai
  class BaseDatatable
    delegate :params, :to => :@view

    def initialize(view, klass)
      @view = view
      @klass = klass
    end

    def as_json(options = {})
      {
        sEcho: params[:sEcho].to_i,
        iTotalRecords: @klass.count,
        iTotalDisplayRecords: resources.total_entries,
        aaData: data
      }
    end

    protected

    def resources
      @resources ||= fetch_resources
    end

    def fetch_resources
      resources = @klass.order("#{sort_column} #{sort_direction}")
      resources = resources.page(page).per_page(per_page)
      if params[:sSearch].present?
        resources = resources.where(where_search_parameter, search: "%#{params[:sSearch]}%")
      end
      resources
    end

    def page
      params[:iDisplayStart].to_i/per_page + 1
    end

    def per_page
      params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
    end

    #same except sort columns
    def sort_column
      columns = sort_columns
      columns[params[:iSortCol_0].to_i]
    end

    def sort_direction
      params[:sSortDir_0] == "desc" ? "desc" : "asc"
    end
  end
end
