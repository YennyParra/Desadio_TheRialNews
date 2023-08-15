class NewcommentsController < ApplicationController
  before_action :set_newcomment, only: %i[ show edit update destroy ]
  before_action :set_report

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
end