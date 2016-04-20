class AdminsController < ApplicationController
  before_action :authenticate_super_user!

  def index

  end




end