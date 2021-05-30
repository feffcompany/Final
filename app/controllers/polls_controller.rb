class PollsController < ApplicationController
  before_action :set_poll, only: %i[ show edit update destroy ]
  
  before_action :ensure_current_user_is_owner, only: [:destroy, :update, :edit]

  # GET /polls or /polls.json
  def index
    @polls = Poll.all
  end

  # GET /polls/1 or /polls/1.json
  def show
  end

  # GET /polls/new
  def new
    @poll = Poll.new
  end

  # GET /polls/1/edit
  def edit
  end

  # POST /polls or /polls.json
  def create
    @poll = Poll.new(poll_params)
    @poll.owner = current_user

    respond_to do |format|
      if @poll.save
        format.html { redirect_to @poll, notice: "poll was successfully created." }
        format.json { render :show, status: :created, location: @poll }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @poll.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /polls/1 or /polls/1.json
  def update
    respond_to do |format|
      if @poll.update(poll_params)
        format.html { redirect_to @poll, notice: "poll was successfully updated." }
        format.json { render :show, status: :ok, location: @poll }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @poll.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /polls/1 or /polls/1.json
  

  def destroy
    @poll.destroy

    respond_to do |format|
      format.html { redirect_back fallback_location: root_url, notice: "poll was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poll
      @poll = Poll.find(params[:id])
    end

    def ensure_current_user_is_owner
      if current_user != @poll.owner
        redirect_back fallback_location: root_url, alert: "You're not authorized for that."
      end
    end

    # Only allow a list of trusted parameters through.
    def poll_params
      params.require(:poll).permit(:image, :comments_count, :likes_count, :caption, :owner_id)
    end
end