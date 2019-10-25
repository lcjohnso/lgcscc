class M33objectsController < ApplicationController
  before_action :login_required

	layout 'phatcc'

  def show
    @m33object = M33object.find(params[:id])
    @m33brick = M33brick.find(@m33object.m33brick_id)

    sm33objects = @m33brick.m33objects.all.order(viewfrac: :desc)
    @iclst = sm33objects.index(@m33object)
    if @m33object != sm33objects.last
  	   @nm33object = sm33objects[@iclst+1]
    end

    if @m33object != sm33objects.first
 	     @pm33object = sm33objects[@iclst-1]
    end
  end

  def cshow
    @m33object = M33object.find(params[:id])
    @m33brick = M33brick.find(@m33object.m33brick_id)

    clusters = @m33brick.m33objects.all
    sm33objects = clusters.sort_by{ |c| c.viewfrac*(c.cfrac) }.reverse
    @iclst = sm33objects.index(@m33object)
    if @m33object != sm33objects.last
      @nm33object = sm33objects[@iclst+1]
    end
    if @m33object != sm33objects.first
      @pm33object = sm33objects[@iclst-1]
    end
  end

  def gshow
    @m33object = M33object.find(params[:id])
    @m33brick = Apbrick.find(@m33object.m33brick_id)

    galaxies = @m33brick.m33objects.all
    sm33objects = galaxies.sort_by{ |c| c.viewfrac*(c.gfrac) }.reverse
    @iclst = sm33objects.index(@m33object)
    if @m33object != sm33objects.last
      @nm33object = sm33objects[@iclst+1]
    end
    if @m33object != sm33objects.first
      @pm33object = sm33objects[@iclst-1]
    end
  end

end
