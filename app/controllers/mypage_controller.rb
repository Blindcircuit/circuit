class MypageController < ApplicationController

  def show
    #값이 여러개 뽑을 려면 where, 단수find
    # 데이터 외래키 관계를 가지면 user.records 로 데이터를 가져올 수 있음
    @myrecords=current_user.records
    @bestrecord
  end
end
