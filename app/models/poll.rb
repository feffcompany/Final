# == Schema Information
#
# Table name: polls
#
#  id         :integer          not null, primary key
#  caption    :string
#  owner_id   :integer
#  location   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  image1     :string
#  image2     :string
#

class Poll < ApplicationRecord
    
    
  def poster
    return User.where({ :id => self.owner_id }).at(0)
  end
 
# mount_uploader :image1, ImageUploader 
# mount_uploader :image2, ImageUploader     
    
belongs_to :owner, :class_name => "User"
has_many :votes, :dependent => :destroy
belongs_to :image1, :class_name => "Images1", :foreign_key => "images1_id"
belongs_to :image2, :class_name => "Images2", :foreign_key => "images2_id"
    
has_many :fans, :through => :votes, :source => :user
has_many :followers, :through => :owner, :source => :following
has_many :fan_followers, :through => :fans, :source => :following
    
validates :owner_id, :presence => true    
    
end
