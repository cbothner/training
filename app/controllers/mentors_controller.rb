class MentorsController < ApplicationController
  before_filter :authenticate, except: [:show]
  before_action :set_mentor, only: [:show, :edit, :update, :destroy]

  # GET /mentors
  # GET /mentors.json
  def index
    @mentors = Mentor.all.sort_by(&:created_at).reverse
  end

  # GET /mentors/1
  # GET /mentors/1.json
  def show
  end

  # GET /mentors/new
  def new
    @mentor = Mentor.new
  end

  # GET /mentors/1/edit
  def edit
  end

  # POST /mentors
  # POST /mentors.json
  def create
    @mentor = Mentor.new(mentor_params)
    @mentor.active = true

    respond_to do |format|
      if @mentor.save
        flash[:notice] = 'Got it! Welcome to WCBN'
        format.html { redirect_to action: 'new' }
        format.json { render action: 'show', status: :created, location: @mentor }
      else
        format.html { render action: 'new' }
        format.json { render json: @mentor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mentors/1
  # PATCH/PUT /mentors/1.json
  def update
    respond_to do |format|
      if @mentor.update(mentor_params)
        format.html { redirect_to @mentor, notice: 'Mentor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @mentor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mentors/1
  # DELETE /mentors/1.json
  def destroy
    @mentor.destroy
    respond_to do |format|
      format.html { redirect_to mentors_url }
      format.json { head :no_content }
    end
  end

  def authenticate
    authenticate_or_request_with_http_basic('Training Database') do |username, password|
      username == ENV['http_basic_username'] && password == ENV['http_basic_password']
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mentor
      @mentor = Mentor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mentor_params
      params.require(:mentor).permit(:active, :name, :phone, :email, :weekday, :start, :end)
    end
end
