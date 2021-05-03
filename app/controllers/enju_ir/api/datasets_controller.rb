require_dependency "enju_ir/application_controller"

module EnjuIr
  class Api::DatasetsController < ActionController::API
    before_action :authenticate_user!

    def create
      @dataset = EnjuIr::Dataset.new(dataset_params[:attributes])

      if @dataset.save
        render json: @dataset, status: :created, location: @dataset
      else
        render json: @dataset.errors, status: :unprocessable_entity
      end
    end

    private

    def dataset_params
      params.require(:data).permit!
    end
  end
end
