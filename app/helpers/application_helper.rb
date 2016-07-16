# Application Helper
module ApplicationHelper
    
    def meta_tag(tag, text)
        content_for :"meta_#{tag}", text
    end
    
    def yield_meta_tag(tag, default_text='')
        content_for?(:"meta_#{tag}") ? content_for(:"meta_#{tag}") : default_text
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
