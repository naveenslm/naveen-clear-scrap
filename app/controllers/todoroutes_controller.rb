class TodoroutesController < ApplicationController
  before_action :set_todoroute, only: [:show, :edit, :update, :destroy]

  # GET /todoroutes
  # GET /todoroutes.json
  def index
    @todoroutes = Todoroute.all
  end

  # GET /todoroutes/1
  # GET /todoroutes/1.json
  def show
  end

  # GET /todoroutes/new
  def new
    @todoroute = Todoroute.new
  end

  # GET /todoroutes/1/edit
  def edit
  end

  # POST /todoroutes
  # POST /todoroutes.json
  def create
    @todoroute = Todoroute.new(todoroute_params)

    respond_to do |format|
      if @todoroute.save
        format.html { redirect_to @todoroute, notice: 'Todoroute was successfully created.' }
        format.json { render :show, status: :created, location: @todoroute }
      else
        format.html { render :new }
        format.json { render json: @todoroute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /todoroutes/1
  # PATCH/PUT /todoroutes/1.json
  def update
    respond_to do |format|
      if @todoroute.update(todoroute_params)
        format.html { redirect_to @todoroute, notice: 'Todoroute was successfully updated.' }
        format.json { render :show, status: :ok, location: @todoroute }
      else
        format.html { render :edit }
        format.json { render json: @todoroute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todoroutes/1
  # DELETE /todoroutes/1.json
  def destroy
    @todoroute.destroy
    respond_to do |format|
      format.html { redirect_to todoroutes_url, notice: 'Todoroute was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todoroute
      @todoroute = Todoroute.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todoroute_params
      params.require(:todoroute).permit(:from, :to, :rou_id)
    end
end
