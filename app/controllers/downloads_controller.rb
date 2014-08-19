class DownloadsController < ApplicationController
  helper DownloadsHelper
  
  def index
    @docs = Doc.all
  end
  
  def download
    doc = Doc.find(params[:id])
    send_data doc.binary_content, 
              filename: doc.filename, 
              type: doc.content_type 
  end

end
