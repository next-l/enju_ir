require_dependency "enju_ir/application_controller"

module EnjuIr
  class CollectionsController < ApplicationController
    before_action :set_collection, only: [:show, :edit, :update, :destroy]

    # GET /collections
    def index
      authorize Collection
      @collections = Collection.page(params[:page])
    end

    # GET /collections/1
    def show
    end

    # GET /collections/new
    def new
      authorize Collection
      @collection = Collection.new
    end

    # GET /collections/1/edit
    def edit
    end

    # POST /collections
    def create
      authorize Collection
      @collection = Collection.new(collection_params)
      @collection.user = current_user

      if @collection.save
        redirect_to @collection, notice: 'Collection was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /collections/1
    def update
      if @collection.update(collection_params)
        redirect_to @collection, notice: 'Collection was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /collections/1
    def destroy
      @collection.destroy
      redirect_to collections_url, notice: 'Collection was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_collection
        @collection = Collection.find(params[:id])
        authorize @collection
      end

      # Only allow a trusted parameter "white list" through.
      def collection_params
        params.require(:collection).permit(:title)
      end
  end
end
