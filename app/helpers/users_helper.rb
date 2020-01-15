module UsersHelper

    def reviews_posted(user) 
        "has posted " + pluralize(user.reviews.count, 'reviews') + "."
    end 

end 