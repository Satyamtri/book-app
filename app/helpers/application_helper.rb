module ApplicationHelper

    def all_categories 
        Category.all
    end 

    def all_lineitems 
        current_user.orders.last.lineitems
    end

end
