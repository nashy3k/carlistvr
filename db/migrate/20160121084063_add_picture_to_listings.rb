class AddPictureToListings < ActiveRecord::Migration
  def change
    add_column :listings, :picture, :string
    add_column	:listings, :pic_bonnet, :string
    add_column	:listings,	:pic_boot,	:string
  end
end