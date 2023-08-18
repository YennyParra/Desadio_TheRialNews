class ApplicationController < ActionController::Base

  def authorize_request(kind = nil)
      unless kind.include?(current_pc_user.role)
          redirect_to reports_path, notice: "no esta autorizado para realizar esta accion"
      end
  end     
         

    def after_sign_in_path_for(resource)
      reports_path
    end
end
