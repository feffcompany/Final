# == Schema Information
#
# Table name: votes
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  poll_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  selection1 :integer
#  selection2 :integer
#

class Vote < ApplicationRecord

    
belongs_to :user
belongs_to :poll
    
validates :user_id, :presence => true
validates :poll_id, :presence => true
validates :poll_id, :uniqueness => { :scope => [:user_id], :message => "already liked" }    

end