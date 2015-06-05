class AddShopToEnterpriseProfile < ActiveRecord::Migration
  def change
    add_column :enterprise_profiles, :shop, :string, limit: 20
    add_column :enterprise_profiles, :intro, :text
  end
end
