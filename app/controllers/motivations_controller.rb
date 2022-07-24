class MotivationsController < ApplicationController
  before_action :set_current_user
  before_action :set_motivation, only: %i[ show edit update destroy ]

  # GET /motivations or /motivations.json
  def index
    @motivations = Current.user.motivations.all
  end

  # GET /motivations/1 or /motivations/1.json
  def show
  end

  # GET /motivations/new
  def new
    @motivation = Current.user.motivations.build
  end

  # GET /motivations/1/edit
  def edit
  end

  # POST /motivations or /motivations.json
  def create
    @motivation = Current.user.motivations.build(motivation_params)

    respond_to do |format|
      if @motivation.save
        format.html { redirect_to motivation_url(@motivation), notice: "Goal was successfully created." }
        format.json { render :show, status: :created, location: @motivation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @motivation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /motivations/1 or /motivations/1.json
  def update
    respond_to do |format|
      if @motivation.update(motivation_params)
        format.html { redirect_to motivation_url(@motivation), notice: "Goal was successfully updated." }
        format.json { render :show, status: :ok, location: @motivation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @motivation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /motivations/1 or /motivations/1.json
  def destroy
    @motivation.destroy

    respond_to do |format|
      format.html { redirect_to motivations_url, notice: "Congratulations on completing this goal! Keep it up!." }
      format.json { head :no_content }
    end
  end

  private
    def set_current_user
      if session[:user_id]
          Current.user = User.find_by(id: session[:user_id])
        else 
          redirect_to sign_in_path, alert: "You must be signed in to do that." if Current.user.nil? 
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_motivation
      @motivation = Current.user.motivations.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def motivation_params
      params.require(:motivation).permit(:goal, :reward)
    end
end
