class Task < ActiveRecord::Base
	#attr_accessible :name, :points, :description 
	
	belongs_to :user
	has_many :task_instances, :dependent => :destroy
	
	#validates :name, :presence => true
	#validates :created_by_id, :presence => true
	#validates :points, :presence => true
	#validates :status, :presence => true
	
	default_scope :order => 'tasks.created_at DESC'
	
end
