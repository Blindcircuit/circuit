class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.integer :user_id, null: false  #유저의 닉네임
      t.integer :track_id, null: false # 트랙의 아이디
      t.integer :car_id, null: false # 주행 자동차
      t.string :laptime, null: false  #주행시간 최대 8자리로 기록 00"00'00 8자리 스트링으로 받는다.
      t.string :track_status, null: false, default: "맑음" #노면 상태
      t.date :recorddate, null: false # 기록날짜
      t.timestamps null: false
    end
  end
end
