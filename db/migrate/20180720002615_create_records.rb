class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.string :user_nickname  #유저의 닉네임
      t.string :track_id # 트랙의 아이디
      t.string :car # 주행 자동차
      t.string :bestlap  #시간표현
      t.string :track_status #노면상태 기본값 dry
      t.timestamps null: false
    end
  end
end
