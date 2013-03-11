class HyperlinksController < ApplicationController
  def destroy
    @hyperlink = Hyperlink.find(params[:id])
    @repbodyid = @hyperlink.repbody_id
    @hyperlink.destroy
    
    respond_to do |format|
      format.html { redirect_to edit_user_repbody_path(current_user.id, @repbodyid) }
      format.json { head :no_content }
    end
  end
end
