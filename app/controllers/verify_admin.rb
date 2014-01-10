module Zenzai
  module VerifyAdmin
    def verify_admin
      unless current_user.is_admin?
        flash[:error] = "You must be an admin to access this page"
        redirect_to root_path
      end
    end
  end
end
