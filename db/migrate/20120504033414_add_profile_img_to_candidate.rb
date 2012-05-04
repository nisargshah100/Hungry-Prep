class AddProfileImgToCandidate < ActiveRecord::Migration
  def change
    add_column :candidates, :profile_img, :string
  end
end
