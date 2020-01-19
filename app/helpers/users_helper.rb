module UsersHelper

    def reviews_posted(user) 
        "has posted " + pluralize(user.reviews.count, 'review') + "."
    end 

end 