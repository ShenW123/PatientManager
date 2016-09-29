class EncountersController < ApplicationController
  before_action :set_encounter, only: [:show, :edit, :update, :destroy]

  # GET /encounters
  # GET /encounters.json
  def index
    @encounters = Encounter.all
  end

  # GET /encounters/1
  # GET /encounters/1.json
  def show
    @back_url = Patient.find_by(mrn: @encounter.patient_mrn)
  end

  # GET /encounters/new
  def new
    @back_url = URI(request.referer || '').path
    @encounter = Encounter.new
  end

  # GET /encounters/1/edit
  def edit
    @back_url = Patient.find_by(mrn: @encounter.patient_mrn)
  end

  # POST /encounters
  # POST /encounters.json
  def create
    @encounter = Encounter.new(encounter_params)
    # Design Choice: When creating new Encounter, go to Patient Show with same MRN as new Encounter
    respond_to do |format|
      if @encounter.save
        @back_url = Patient.find_by(mrn: @encounter.patient_mrn)
        format.html { redirect_to @back_url, notice: 'Encounter was successfully created.' }
        format.json { render :show, status: :created, location: @back_url }
      else
        format.html { render :new }
        format.json { render json: @encounter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /encounters/1
  # PATCH/PUT /encounters/1.json
  def update
      respond_to do |format|
      # return the first user named David
      @back_url = Patient.find_by(mrn: @encounter.patient_mrn)
      #get can't just use patient_url. It will utilize the same id value
      if @encounter.update(encounter_params)
        #get patient id
        format.html { redirect_to @back_url, notice: 'Encounter was successfully updated.' }
        format.json { render :show, status: :ok, location: @back_url }
      else
        format.html { render :edit }
        format.json { render json: @encounter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /encounters/1
  # DELETE /encounters/1.json
  def destroy
    @back_url = Patient.find_by(mrn: @encounter.patient_mrn)
    @encounter.destroy
    respond_to do |format|
      format.html { redirect_to @back_url, notice: 'Encounter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_encounter
      @encounter = Encounter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def encounter_params
      params.require(:encounter).permit(:patient_mrn, :visit_number, :admitted_at, :discharged_at, :location, :room, :bed)
    end
end
