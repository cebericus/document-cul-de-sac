class Doc < ActiveRecord::Base
  scopify
  
  def document_file=( document_data )
    self.filename       = document_data.original_filename
    self.content_type   = document_data.content_type.chomp
    self.binary_content = document_data.read
  end
  
end
