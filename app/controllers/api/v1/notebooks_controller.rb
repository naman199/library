class Api::V1::NotebooksController < ApplicationController
  before_action :set_notebook, only: [:show, :update, :destroy]
  before_action :get_notebook, only: [:external_books]
  before_action :filter_notebook, only: [:external_books]

  # GET /notebooks
  def index
    @notebooks = Notebook.all
    json_response(@notebooks)
  end

  def external_books
    json_response(@notebooks)
  end

  # GET /notebooks/1
  def show
    json_response(@notebook)
  end

  # POST /notebooks
  def create
    @notebook = Notebook.new(notebook_params)

    if @notebook.save!
      json_response("book" => @notebook)
    else
      json_response({}, :unprocessable_entity, 422, 'Notebook has not created')
    end
  end

  # PATCH/PUT /notebooks/1
  def update
    if @notebook.update(notebook_params)
      json_response(@notebook)
    else
      json_response({},:unprocessable_entity, 422, 'Notebook has not updated')
    end
  end

  # DELETE /notebooks/1
  def destroy
    @notebook.destroy
    json_response(@notebook, :success, 204, "The Book #{@notebook.name} was deleted successfully")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notebook
      @notebook = Notebook.find(params[:id])
    end

    def get_notebook
      @notebooks = HTTParty.get("https://www.anapioficeandfire.com/api/books?name=#{params[:name]}").parsed_response
    end

    # Only allow a trusted parameter "white list" through.
    def notebook_params
      params.require(:notebook).permit(:name, :isbn, :country, :number_of_pages, :publisher, :release_date, authors: [])
    end

    def filter_notebook
      @notebooks = @notebooks.map { |hs| hs.except("povCharacters", "mediaType", "characters") }
    end
end
