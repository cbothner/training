class TraineesController < ApplicationController
  before_action :set_trainee, only: [:show, :edit, :update, :destroy]

  # GET /trainees
  # GET /trainees.json
  def index
    @trainees = Trainee.all.sort_by(&:created_at)
  end

  def coordinator
    @trainees = Trainee.all.sort_by(&:created_at)
  end

  # GET /trainees/1
  # GET /trainees/1.json
  def show
  end

  # GET /trainees/new
  def new
    @trainee = Trainee.new
  end

  # GET /trainees/1/edit
  def edit
  end

  # POST /trainees
  # POST /trainees.json
  def create
    @trainee = Trainee.new(trainee_params)

    respond_to do |format|
      if @trainee.save
        format.html { redirect_to @trainee, notice: 'Trainee was successfully created.' }
        format.json { render action: 'show', status: :created, location: @trainee }
      else
        format.html { render action: 'new' }
        format.json { render json: @trainee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trainees/1
  # PATCH/PUT /trainees/1.json
  def update
    respond_to do |format|
      if @trainee.update(trainee_params)
        format.html { redirect_to @trainee, notice: 'Trainee was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @trainee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trainees/1
  # DELETE /trainees/1.json
  def destroy
    @trainee.destroy
    respond_to do |format|
      format.html { redirect_to trainees_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trainee
      @trainee = Trainee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trainee_params
      params.require(:trainee).permit(:name, :umid, :phone, :email, :status, :dept, :experience, :referral, :interests, :statement, :stage1, :demotape, :stage2, :apprenticeship_freeform1, :apprenticeship_freeform2, :apprenticeship_specialty1, :apprenticeship_specialty2, :broadcasters_exam)
    end
end
