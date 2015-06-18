module Enterprise::ContactHelper

  def render_enterprise_contact_gender(contact)
    contact.gender ? '先生' : '女士'
  end
end
