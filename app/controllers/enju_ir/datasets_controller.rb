require_dependency "enju_ir/application_controller"

module EnjuIr
  class DatasetsController < ApplicationController
    before_action :set_dataset, only: [:show, :edit, :update, :destroy]

    # GET /datasets
    def index
      @datasets = Dataset.page(params[:page])
    end

    # GET /datasets/1
    def show
    end

    # GET /datasets/new
    def new
      @dataset = Dataset.new(doi_string: params[:doi])
    end

    # GET /datasets/1/edit
    def edit
    end

    # POST /datasets
    def create
      @dataset = Dataset.new(dataset_params)
      doi_record = DoiRecord.find_by(body: @dataset.doi_string.to_s.downcase)
      @dataset.manifestation = doi_record&.manifestation
      @dataset.user = current_user

      if @dataset.save
        attach
        redirect_to @dataset, notice: 'Dataset was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /datasets/1
    def update
      if @dataset.update(dataset_params)
        redirect_to @dataset, notice: 'Dataset was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /datasets/1
    def destroy
      @dataset.destroy
      redirect_to datasets_url, notice: 'Dataset was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_dataset
        @dataset = Dataset.find(params[:id])
        authorize @dataset
      end

      # Only allow a trusted parameter "white list" through.
      def dataset_params
        params.require(:dataset).permit(:title, :doi_string, :uploaded_files)
      end

      def filtered_params
        params.permit([:q, :format, :page])
      end

      def attach
        params[:dataset][:uploaded_files].each do |file|
          fileset = @dataset.enju_ir_filesets.new
          fileset.attachment.attach(file)
          fileset.save!
        end
      end

      helper_method :filtered_params
  end
end
