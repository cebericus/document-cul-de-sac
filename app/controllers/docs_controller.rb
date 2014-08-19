class DocsController < ApplicationController
  before_action :_check_admin_rights, 
            only: [:new, :edit, :create, :update, :destroy]
  before_action :require_user, only: [:download]
  before_action :_set_doc, only: [:show, :edit, :update, :destroy]
  helper_method :download, :layout
  layout :layout
  
  #TODO: selectable docs to be displayed in client section
  # GET /docs
  def index
    @docs = Doc.all
  end

  # GET /docs/1
  def show
  end

  # GET /docs/new
  def new
    @doc = Doc.new
  end

  # GET /docs/1/edit
  def edit
  end

  # POST /docs
  def create
    @doc = Doc.new(_doc_params)

    if @doc.save
      redirect_to @doc, notice: 'Document was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /docs/1
  def update
    if @doc.update(_doc_params)
      redirect_to @doc, notice: 'Document was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /docs/1
  def destroy
    @doc.destroy
    redirect_to docs_url, notice: 'Document was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def _set_doc
      @doc = Doc.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def _doc_params
      params.require(:doc).permit(:document_file, 
                                  :filename, 
                                  :description, 
                                  :binary_content, 
                                  :content_type)
    end
         
    def download(filename, filetype)
      send_file filename, type: filetype
    end
end
