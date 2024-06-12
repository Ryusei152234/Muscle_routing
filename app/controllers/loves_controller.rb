class LovesController < ApplicationController
   

        def create
          loves = current_user.loves.create(blog_id: params[:blog_id]) #user_idとblog_idの二つを代入
          redirect_back(fallback_location: root_path)
        end
      
        def destroy
          loves = Loves.find_by(blog_id: params[:blog_id], user_id: current_user.id)
          loves.destroy
          redirect_back(fallback_location: root_path)
        end
      

end
