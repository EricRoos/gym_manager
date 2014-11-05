class MembersController < ApplicationController
  before_action :set_member, only: [:show, :edit, :update, :destroy]

  # GET /members
  # GET /members.json
  def index
    @gym = Gym.includes(:members).find(params[:gym_id])
    @members = @gym.members
  end

  # GET /members/1
  # GET /members/1.json
  def show
    @gym = @member.gym
    @transactions = @member.transactions
  end

  # GET /members/new
  def new
    @member = Member.new
    if params[:gym_id]
      @gym = Gym.find(params[:gym_id])
    end
  end

  # GET /members/1/edit
  def edit
    @member = Member.includes(:gym).find(params[:id])
    if @member.gym
      @gym = @member.gym
    end
  end

  # POST /members
  # POST /members.json
  def create
    @member = Member.new(member_params)
    @gym = @member.gym
    respond_to do |format|
      if @member.save
        @gym = @member.gym
        format.html { redirect_to gym_member_path(@gym,@member), notice: 'Member was successfully created.' }
        format.json { render :show, status: :created, location: @member }
      else
        format.html { render :new }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /members/1
  # PATCH/PUT /members/1.json
  def update
    respond_to do |format|
      if @member.update(member_params)
        @gym = @member.gym
        format.html { redirect_to @gym, notice: 'Member was successfully updated.' }
        format.json { render :show, status: :ok, location: @member }
      else
        format.html { render :edit }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @gym = @member.gym
    @member.destroy
    respond_to do |format|
      format.html { redirect_to @gym, notice: 'Member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def member_params
      params.require(:member).permit(:name, :email, :gym_id)
    end
end
