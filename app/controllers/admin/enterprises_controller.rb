class Admin::EnterprisesController < ApplicationController
  def index
    @enterprises = Enterprise.all
  end
end
