class AddProfileImgToUsers < ActiveRecord::Migration
  def change
    add_column :users, :profile_img, :string, default: 'https://cdn.pixabay.com/photo/2014/12/17/14/20/summer-anemone-571531_960_720.jpg'
  end
end
