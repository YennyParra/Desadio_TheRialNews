class NewcommentsController < ApplicationController
  before_action :set_newcomment, only: %i[ show edit update destroy ]
  before_action :set_report
  before_action :authenticate_pc_user!, except: %i[index show]
  before_action :newcomment_permission, only: %i[ edit destroy]
  before_action only: [:create, :new ] do
    authorize_request(["normal_pc_user"])
  end

  before_action only: [:edit, :update, :destroy] do
    authorize_request(["admin"])
  end

  # GET /newcomments or /newcomments.json
  def index
    @newcomments = @report.newcomments
    end

  # GET /newcomments/1 or /newcomments/1.json
  def show
  end

  # GET /newcomments/new
  def new
    @newcomment = @report.newcomments.new
  end

  # GET /newcomments/1/edit
  def edit
  end

  # POST /newcomments or /newcomments.json
  def create
    @newcomment = @report.newcomments.new(newcomment_params)
    @newcomment.user = current_pc_user

    respond_to do |format|
      if @newcomment.save
        format.html { redirect_to report_newcomment_path(@report.id,@newcomment.id), notice: "Newcomment was successfully created." }
        format.json { render :show, status: :created, location: @newcomment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @newcomment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /newcomments/1 or /newcomments/1.json
  def update
    respond_to do |format|
      if @newcomment.update(newcomment_params)
        format.html { redirect_to newcomment_url(@newcomment), notice: "Newcomment was successfully updated." }
        format.json { render :show, status: :ok, location: @newcomment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @newcomment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /newcomments/1 or /newcomments/1.json
  def destroy
    @newcomment.destroy

    respond_to do |format|
      format.html { redirect_to newcomments_url, notice: "Newcomment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_newcomment
      @newcomment = Newcomment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def newcomment_params
      params.require(:newcomment).permit(:body, :pc_user_id, :report_id)
    end
    def set_report
      @report =Report.find(params[:report_id])
  end
  def newcomment_permission
    unless @newcomment.pc_user_id == current_pc_user.id || current_pc_user.role !=2
      redirect_to report_newcomment_path(@report.id), notice: 'You are not allowed to perform this action'
    end    
  end
end