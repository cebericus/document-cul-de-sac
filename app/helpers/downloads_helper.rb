module DownloadsHelper
  
  def icon( doc )
    icon_elements = Hash.new
    
    case doc.content_type
      when "application/pdf"
        icon_elements = {
          icon: 'pdf.png',
          alt: 'Pdf' 
        }
      
      when "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
         icon_elements = {
          icon: 'docx.png',
          alt:  'docx' 
        }
        
      else
        icon_elements = {
          icon: 'default.png',
          alt:  'Default type'
        }
    end
    
    icon_elements[:size] = '64x64'        
    return icon_elements
  end
   
end
