require_dependency "enju_ir/application_controller"

module EnjuIr
  class FilesetsController < ApplicationController
    before_action :set_fileset, only: [:show, :edit, :update, :destroy]

    # GET /filesets
    def index
      @filesets = Fileset.all
    end

    # GET /filesets/1
    def show
    end

    # GET /filesets/new
    def new
      @fileset = Fileset.new
    end

    # GET /filesets/1/edit
    def edit
    end

    # POST /filesets
    def create
      @fileset = Fileset.new(fileset_params)

      if @fileset.save
        redirect_to @fileset, notice: 'Fileset was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /filesets/1
    def update
      if @fileset.update(fileset_params)
        redirect_to @fileset, notice: 'Fileset was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /filesets/1
    def destroy
      @fileset.destroy
      redirect_to filesets_url, notice: 'Fileset was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_fileset
        @fileset = Fileset.find(params[:id])
        authorize @fileset
      end

      # Only allow a trusted parameter "white list" through.
      def fileset_params
        params.require(:fileset).permit(:enju_ir_dataset_id)
      end
  end
end
