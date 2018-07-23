class CircuitController < ApplicationController

  def index
  end

  def record
    if params[:track] && params[:brand] && params[:model]
      #쿼리조건
      @yongin=Record.where(track_id: params[:track], car_id: params[:car]).order(laptime: :ASC).page(params[:page]).per(10)
    else
      #기본 보여주는 값
      @yongin = Record.where(track_id: 1).order(laptime: :ASC).group_by(&:user_id).map{|key, val| val.first}
      @yongin = Kaminari.paginate_array(@yongin).page(params[:page]).per(10)

      @yeongam = Record.where(track_id: 3).order(laptime: :ASC).group_by(&:user_id).map{|key, val| val.first}
      @yeongam = Kaminari.paginate_array(@yeongam).page(params[:page]).per(10)

      @inje = Record.where(track_id: 2).order(laptime: :ASC).group_by(&:user_id).map{|key, val| val.first}
      @inje = Kaminari.paginate_array(@inje).page(params[:page]).per(10)
    end
    @tracks=Track.all
    @brands=Car.select(:brand).distinct

    if params[:brand] !=nil
    @models=Car.select(brand: params[:brand])
    end

  end
  def menu
    @models=Car.select(brand: params[:brand]).distinct
  end
end
