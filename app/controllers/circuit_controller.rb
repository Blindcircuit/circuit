class CircuitController < ApplicationController

  def index
  end

  def record
    if params[:track_id] && params[:car_id]

      if params[:track_id] == "1"

        @yongin = Record.where(track_id: 1, car_id: params[:car_id]).order(laptime: :ASC).group_by(&:user_id).map{|key, val| val.first}
        @yongin = Kaminari.paginate_array(@yongin).page(params[:page]).per(10)

        @yeongam = Record.where(track_id: 2).order(laptime: :ASC).group_by(&:user_id).map{|key, val| val.first}
        @yeongam = Kaminari.paginate_array(@yeongam).page(params[:page]).per(10)

        @inje = Record.where(track_id: 3).order(laptime: :ASC).group_by(&:user_id).map{|key, val| val.first}
        @inje = Kaminari.paginate_array(@inje).page(params[:page]).per(10)
      elsif params[:track_id] =="2"
        @yongin = Record.where(track_id: 1).order(laptime: :ASC).group_by(&:user_id).map{|key, val| val.first}
        @yongin = Kaminari.paginate_array(@yongin).page(params[:page]).per(10)

        @yeongam = Record.where(track_id: 2, car_id: params[:car_id]).order(laptime: :ASC).group_by(&:user_id).map{|key, val| val.first}
        @yeongam = Kaminari.paginate_array(@yeongam).page(params[:page]).per(10)

        @inje = Record.where(track_id: 3).order(laptime: :ASC).group_by(&:user_id).map{|key, val| val.first}
        @inje = Kaminari.paginate_array(@inje).page(params[:page]).per(10)
      else
        @yongin = Record.where(track_id: 1).order(laptime: :ASC).group_by(&:user_id).map{|key, val| val.first}
        @yongin = Kaminari.paginate_array(@yongin).page(params[:page]).per(10)

        @yeongam = Record.where(track_id: 2).order(laptime: :ASC).group_by(&:user_id).map{|key, val| val.first}
        @yeongam = Kaminari.paginate_array(@yeongam).page(params[:page]).per(10)

        @inje = Record.where(track_id: 3, car_id: params[:car_id]).order(laptime: :ASC).group_by(&:user_id).map{|key, val| val.first}
        @inje = Kaminari.paginate_array(@inje).page(params[:page]).per(10)
      end
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
    @brands=Car.all

    # if params[:brand] !=nil
    # @models=Car.select(brand: params[:brand])
    # end

  end
  def menu
    @models=Car.select(brand: params[:brand]).distinct
  end
end
