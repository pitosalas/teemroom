class DeletemesController < ApplicationController
  before_action :set_deleteme, only: [:show, :edit, :update, :destroy]

  # GET /deletemes
  # GET /deletemes.json
  def index
    @deletemes = Deleteme.all
  end

  # GET /deletemes/1
  # GET /deletemes/1.json
  def show
  end

  # GET /deletemes/new
  def new
    @deleteme = Deleteme.new
  end

  # GET /deletemes/1/edit
  def edit
  end

  # POST /deletemes
  # POST /deletemes.json
  def create
    @deleteme = Deleteme.new(deleteme_params)

    respond_to do |format|
      if @deleteme.save
        format.html { redirect_to @deleteme, notice: 'Deleteme was successfully created.' }
        format.json { render :show, status: :created, location: @deleteme }
      else
        format.html { render :new }
        format.json { render json: @deleteme.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /deletemes/1
  # PATCH/PUT /deletemes/1.json
  def update
    respond_to do |format|
      if @deleteme.update(deleteme_params)
        format.html { redirect_to @deleteme, notice: 'Deleteme was successfully updated.' }
        format.json { render :show, status: :ok, location: @deleteme }
      else
        format.html { render :edit }
        format.json { render json: @deleteme.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deletemes/1
  # DELETE /deletemes/1.json
  def destroy
    @deleteme.destroy
    respond_to do |format|
      format.html { redirect_to deletemes_url, notice: 'Deleteme was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deleteme
      @deleteme = Deleteme.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def deleteme_params
      params.require(:deleteme).permit(:a)
    end
end
