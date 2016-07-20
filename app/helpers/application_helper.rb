# Application Helper
module ApplicationHelper
    
    def meta_name(name, text)
        content_for :"meta_#{name}", text
    end
    
    def yield_meta_name(name, default_text='')
        content_for?(:"meta_#{name}") ? content_for(:"meta_#{name}") : default_text
    end
        
    
    def full_title(page_title = '')
        base_title = "Dictio"
        if page_title.empty?
            base_title
        else
            base_title + " | " + page_title
        end
    end
end
