module ApplicationHelper

    def all_categories 
        Category.all
    end 

    def all_lineitems 
        current_user.orders.last.lineitems
    end
    
    def all_languages 
        Language.all
    end 

    def all_quantity 
        current_user.orders.last.lineitems
    end 
    
end
