class ResourcesController < ApplicationController
  load_and_authorize_resource except: :index
  authorize_resource only: :index
  before_action :set_resource, only: [:show, :edit, :update, :destroy]

  # GET /resources
  # GET /resources.json
  def index
    query = @q = params[:q]
    if query.blank?
      query = '*:*'
    end
    page = params[:page] || 1
    result = Resource.search(query, body: {from: (page.to_i - 1) * 10})
    @resources = Kaminari.paginate_array(
      result.results, total_count: result.total_count
    ).page(page.to_i)
  end

  # GET /resources/1
  # GET /resources/1.json
  def show
    respond_to do |format|
      format.html
      format.json { render json: @resource }
      format.nt { send_data(@resource.dump(:ntriples), type: 'text/plain', disposition: 'inline')  }
    end
  end

  # GET /resources/new
  def new
    @resource = Resource.new
  end

  # GET /resources/1/edit
  def edit
  end

  # POST /resources
  # POST /resources.json
  def create
    @resource = Resource.new(resource_params)
    @resource.attachment.content = params[:resource][:attachment]
    @resource.thumbnail.content = params[:resource][:thumbnail]

    respond_to do |format|
      if @resource.save
        format.html { redirect_to @resource, notice: t('controller.successfully_created', model: t('activemodel.models.resource')) }
        format.json { render :show, status: :created, location: @resource }
      else
        format.html { render :new }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resources/1
  # PATCH/PUT /resources/1.json
  def update
    @resource.attachment.content = params[:resource][:attachment]
    @resource.thumbnail.content = params[:resource][:thumbnail]
    respond_to do |format|
      if @resource.update(resource_params)
        format.html { redirect_to @resource, notice: t('controller.successfully_updated', model: t('activemodel.models.resource')) }
        format.json { render :show, status: :ok, location: @resource }
      else
        format.html { render :edit }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resources/1
  # DELETE /resources/1.json
  def destroy
    @resource.destroy
    respond_to do |format|
      format.html { redirect_to resources_url, notice: t('controller.successfully_deleted', model: t('activemodel.models.resource')) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resource
      @resource = Resource.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resource_params
      params.require(:resource).permit(
        :title, :date_of_publication, :author, :publisher, :subject
      )
    end
end
