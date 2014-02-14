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
          resource.email,
          resource.gets_daily_dharma.to_s,
          resource.confirmed_at.present?.to_s,
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
