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
    @back_url = URI(request.referer || '').path
    if @back_url.nil?
      @back_url = encounters_url
    end
  end

  # GET /encounters/new
  def new
    # TODO: This goes back to Encounters Index, if you make an error in input, then click back. Ask what's the best way of handling this kind of situation
    @back_url = URI(request.referer || '').path
    if @back_url.nil?
      @back_url = encounters_url
    end
    @encounter = Encounter.new
  end

  # GET /encounters/1/edit
  def edit
    @back_url = Patient.find_by(mrn: @encounter.patient_mrn)
    if @back_url.nil?
      @back_url = encounters_url
    end
  end

  # POST /encounters
  # POST /encounters.json
  def create
    @encounter = Encounter.new(encounter_params)
    # Design Choice: When creating new Encounter, go to Patient Show with same MRN as new Encounter
    respond_to do |format|
      if @encounter.save
        @back_url = Patient.find_by(mrn: @encounter.patient_mrn)
        # Need to decide whether or not to Create the Encounter anyways? Might be better to still create it, but remind them that the Patient Isn't found
        if @back_url.nil?
          @back_url = encounters_url
        end

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
      @back_url = Patient.find_by(mrn: @encounter.patient_mrn)
      # Upon Editing a record that doesn't have a patient, then return to the Encounters Index
      if @back_url.nil?
        @back_url = encounters_url
      end

      if @encounter.update(encounter_params)
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
    if @back_url.nil?
      @back_url = encounters_url
    end
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
