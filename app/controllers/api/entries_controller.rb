module Api
  class EntriesController < ApplicationController
    before_action :set_entry, only: :create

    def create
      if @entry.save
        render status: :created, json: { source_entry: @entry }
      else
        render status: :not_acceptable, json: { errors: @entry.errors }
      end
    end

    private

    def entry_params
      params.require(:entry).permit(
        :bk_organization_id,
        :source_uuid,
        :transactions_summarized_count,
        :summarized_net_sales,
        :journal_entry_template,
        :json_diff,
        :connection_id,
        :short_summary,
        :source_raw_data,
        :apify_run_url,
        :bk_external_id,
        :status,
        post_raw_data: {},
      )
    end

    def set_entry
      @entry ||= Entry.new(entry_params)
    end
  end
end
