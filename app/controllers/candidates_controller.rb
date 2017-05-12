class CandidatesController < ApplicationController

  # GET /candidates
  def index
    @candidates = Candidate.where("name LIKE ?", "'%#{params[:search]}%'")
  end

  # GET /candidates/1
  def show
    @candidate = Candidate.find(params[:id])
  end

  # GET /candidates/new
  def new
    @candidate = Candidate.new
  end

  # GET /candidates/1/edit
  def edit
    @candidate = Candidate.find(params[:id])
  end

  # POST /candidates
  def create
    @candidate = Candidate.new(candidate_params)
    if @candidate.save
      redirect_to candidates_path, notice: 'Candidat ajouté avec succès.'
    else
      render :new
    end
  end

  # PATCH/PUT /candidates/1
  def update
    @candidate = Candidate.find(params[:id])
    if @candidate.update(candidate_params)
      redirect_to candidates_path, notice: 'Candidat mis à jour avec succès.'
    else
      render :edit
    end
  end

  # DELETE /candidates/1
  def destroy
    @candidate = Candidate.find(params[:id])
    @candidate.destroy
    redirect_to candidates_path, notice: 'Candidate supprimé avec succès.'
  end

  private

  def candidate_params
    params.require(:candidate).permit(
      :name,
      :votes
    )
  end

end
