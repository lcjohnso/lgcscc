class M33bricksController < ApplicationController
  before_action :login_required

	layout 'lgcscc'

  def index
    @m33bricks = M33brick.all
  end

  def show
    @m33brick = M33brick.find(params[:id])
    @sclusters = @m33brick.m33objects.all.order(viewfrac: :desc)
  end

  def csort
    @m33brick = M33brick.find(params[:id])
    clusters = @m33brick.m33objects.all
    @sclusters = clusters.sort_by{ |c| c.viewfrac*(c.cfrac) }.reverse
  end

  def gsort
    @m33brick = M33brick.find(params[:id])
    galaxies = @m33brick.m33objects.all
    @sclusters = galaxies.sort_by{ |c| c.viewfrac*(c.gfrac) }.reverse
  end

end
