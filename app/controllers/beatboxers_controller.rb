class BeatboxersController < ApplicationController
  skip_before_action :require_login, only: [:index, :show]

  def index
  end

  def new
  end

  def show
  end

  def edit
  end

  def destroy
  end

  def create
  end

  def update
  end
end
