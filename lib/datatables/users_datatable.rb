require 'datatables/base_datatable'

module Zenzai
  class UsersDatatable < Zenzai::BaseDatatable

    def initialize(view)
      super(view, User)
    end

    protected

    def data
      resources.map do |resource|
        [
          h(resource.email),
          h(resource.gets_daily_dharma),
          h(resource.confirmed_at.present?),
        ]
      end
    end

    def where_search_parameter
      "email like :search"
    end

    def sort_columns
      %w[email]
    end
  end
end
