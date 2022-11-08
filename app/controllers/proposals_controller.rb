class ProposalsController < ApplicationController
  def index
    @proposal = Proposal.where(product_id: params[:product_id])   
  end

  def new
    @proposal = Proposal.new(product_id: params[:product_id])

  end

  def show
    @proposal = Proposal.find(params[:id])
  end


  def view
    @proposal = Proposal.with_proposal(current_user_id: current_user.id,productid:params[:product_id])    
  end

  def create
    proposal =Proposal.new(offer_params)
    check_exist_offer(proposal.product_id)
    proposal.user_id= current_user.id
    if proposal.save
      UserMailer.proposal(current_user, proposal).deliver_now 
      redirect_to root_path
    else
      render :new
    end
  end

  def proposal  
   @proposal = Proposal.where(product_id: params[:product_id])  
  end

  private

   def offer_params
    params.require(:proposal).permit(:product_id, :amount)
   end

   def check_exist_offer(product_id)
      proposal= Proposal.find_by( product_id: product_id ,user_id: current_user.id)
      proposal.destroy if proposal
   end
end
