class MypageController < ApplicationController

  def show
    #값이 여러개 뽑을 려면 where, 단수find
    # 데이터 외래키 관계를 가지면 user.records 로 데이터를 가져올 수 있음
    @myrecords=current_user.records.order(recorddate: :desc).page(params[:page]).per(10)

    @bestrecord=[Record.where(user_id: current_user.id, track_id: 1).order(:laptime).first,
                 Record.where(user_id: current_user.id).where(track_id: 2).order(:laptime).first,
                 Record.where(user_id: current_user.id).where(track_id: 3).order(:laptime).first]

  end

  def insert
    @models=Car.all

  end

  def new
    @record = Post.new
  end

  def create
    @record = Record.new(mypage_params)
    respond_to do |format|
      if @record.save
        # 저장이 되었을 경우에 실행
        # flash[:notice] = "글 작성이 완료되었습니다."
        # redirect_to '/'
        format.html { redirect_to '/mypage/show', notice: '기록 저장 완료' }
      else
        # 저장이 실패했을 경우에(validation) 걸렸을 때 실행
        # flash[:alert] = "글 작성이 실패했습니다."
        # redirect_to new_post_path
        format.html { render :new }
        format.json { render json: @record.errors }
      end
    end
  end

  private
  def mypage_params
    params.require(:post).permit(:trackname, :model, :laptime, :track_status, :recorddate)
  end

end
