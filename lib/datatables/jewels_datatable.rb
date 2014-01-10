require 'presenters/jewel_presenter'

module Zenzai
  class JewelsDatatable
    delegate :params, :h, :link_to, :edit_jewel_path, :to => :@view

    def initialize(view)
      @view = view
    end

    def as_json(options = {})
      {
        sEcho: params[:sEcho].to_i,
        iTotalRecords: Jewel.count,
        iTotalDisplayRecords: jewels.total_entries,
        aaData: data
      }
    end

    private

    def data
      jewels.map do |jewel|
        presenter = Zenzai::JewelPresenter.new(jewel)
        [
          h(presenter.source),
          h(presenter.trim_citation(20)),
          h(presenter.trim_quote(20)),
          h(presenter.trim_comment(20)),
          link_to("Edit", edit_jewel_path(jewel)),
          #link_to("Edit"),
        ]
      end
    end

    def jewels
      @jewels ||= fetch_jewels
    end

    def fetch_jewels
      jewels = Jewel.order("#{sort_column} #{sort_direction}")
      jewels = jewels.page(page).per_page(per_page)
      if params[:sSearch].present?
        jewels = jewels.where("source like :search or citation like :search or quote like :search or comment like :search", search: "%#{params[:sSearch]}%")
      end
      jewels
    end

    def page
      params[:iDisplayStart].to_i/per_page + 1
    end

    def per_page
      params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
    end

    def sort_column
      columns = %w[source citation quote comment]
      columns[params[:iSortCol_0].to_i]
    end

    def sort_direction
      params[:sSortDir_0] == "desc" ? "desc" : "asc"
    end
  end
end
