class PrintersController < ApplicationController
  before_action :set_printer, only: %i[ show edit update destroy ]
  before_action :set_organizations, only: [:new, :edit, :create, :update]

  # GET /printers or /printers.json
  def index
    if params[:org_id].present?
      @printers = Printer.where(organization_id: params[:org_id])
    else
      @printers = Printer.all
    end
  end

  # GET /printers/1 or /printers/1.json
  def show
  end

  # GET /printers/new
  def new
    @printer = Printer.new
  end

  # GET /printers/1/edit
  def edit
  end

  # POST /printers or /printers.json
  def create
    @printer = Printer.new(printer_params)

    respond_to do |format|
      if @printer.save
        format.html { redirect_to @printer, notice: "Printer was successfully created." }
        format.json { render :show, status: :created, location: @printer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @printer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /printers/1 or /printers/1.json
  def update
    respond_to do |format|
      if @printer.update(printer_params)
        format.html { redirect_to @printer, notice: "Printer was successfully updated." }
        format.json { render :show, status: :ok, location: @printer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @printer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /printers/1 or /printers/1.json
  def destroy
    @printer.destroy
    respond_to do |format|
      format.html { redirect_to printers_url, notice: "Printer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_printer
      @printer = Printer.find(params[:id])
    end

    def set_organizations
      @organizations = Organization.active
    end

    # Only allow a list of trusted parameters through.
    def printer_params
      params.require(:printer).permit(:name, :description, :organization_id)
    end
end
