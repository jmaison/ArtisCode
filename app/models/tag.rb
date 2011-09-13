class Tag < ActiveRecord::Base
   belongs_to  :user, :dependent => :destroy            
   # has_attached_file :image, 
	#				:styles => { :medium => "300x300>", :thumb => "100x100>" }
    validates :data,:presence => true
    validates :url, :presence => true,
                    :length => { :minimum => 5 , :message => "http" }
end
