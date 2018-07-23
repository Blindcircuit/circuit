class CircuitController < ApplicationController

  def index
  end

  def record
    @yongin=Record.where(track_id: 1).order(laptime: :ASC).page(params[:page]).per(10)
    @yeongam=Record.where(track_id: 3).order(laptime: :ASC).page(params[:page]).per(10)
    @inje=Record.where(track_id: 2).order(laptime: :ASC).page(params[:page]).per(10)
  end

end
