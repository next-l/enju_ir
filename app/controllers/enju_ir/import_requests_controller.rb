require_dependency "enju_ir/application_controller"

module EnjuIr
  class ImportRequestsController < ApplicationController
    before_action :set_import_request, only: [:show, :edit, :update, :destroy]

    # GET /import_requests
    def index
      @import_requests = ImportRequest.all
    end

    # GET /import_requests/1
    def show
    end

    # GET /import_requests/new
    def new
      @import_request = ImportRequest.new(doi_string: params[:doi])
    end

    # GET /import_requests/1/edit
    def edit
    end

    # POST /import_requests
    def create
      @import_request = ImportRequest.new(import_request_params)
      @import_request.user = current_user
      @import_request.doi_record = DoiRecord.find_by(body: @import_request.doi_string.to_s.downcase)

      if @import_request.save
        redirect_to @import_request, notice: 'Import request was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /import_requests/1
    def update
      if @import_request.update(import_request_params)
        redirect_to @import_request, notice: 'Import request was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /import_requests/1
    def destroy
      @import_request.destroy
      redirect_to import_requests_url, notice: 'Import request was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_import_request
        @import_request = ImportRequest.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def import_request_params
        params.require(:import_request).permit(:doi_string)
      end

      def filtered_params
        params.permit([:q, :format, :page])
      end

      helper_method :filtered_params
  end
end
