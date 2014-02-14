require 'presenters/jewel_presenter'
require 'datatables/base_datatable'

module Zenzai
  class JewelsDatatable < Zenzai::BaseDatatable
    delegate :link_to, :edit_jewel_path, :to => :@view

    def initialize(view)
      super(view, Jewel)
    end

    private

    def data
      resources.map do |jewel|
        presenter = Zenzai::JewelPresenter.new(jewel)
        [
          presenter.source,
          presenter.trim_citation(20),
          presenter.trim_quote(20),
          presenter.trim_comment(20),
          link_to("Edit", edit_jewel_path(jewel)),
        ]
      end
    end

    def where_search_parameter
        "source like :search or citation like :search or quote like :search or comment like :search"
    end

    def sort_columns
      %w[source citation quote comment]
    end
  end
end
