class Enterprise::ContactsController < ApplicationController
  def index
    @contacts = EnterpriseContact.all
  end

  def new
    @contact = EnterpriseContact.new
  end

  def create
    @contact = current_enterprise.contacts.build(contact_params)
    respond_to do |format|
      if @contact.save
        format.html{
          flash[:success] = '企业联系人添加成功'
          redirect_to enterprise_contacts_path
        }
        format.js
      else
        format.html {  render :new }
        format.js
      end
    end
  end

  def destroy
    @contact = current_enterprise.contacts.find(params[:id])
    @contact.destroy
    flash[:success] = '企业联系人删除成功'
    redirect_to enterprise_contacts_path
  end

  private
    def contact_params
        params.require(:enterprise_contact).permit(:name, :body)
    end
end
