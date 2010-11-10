require 'digest'
class User < ActiveRecord::Base
	attr_accessible :name, :email, :password, :password_confirmation
	attr_accessor :password, :group_name
	
	has_many :tasks, :dependent => :destroy
	has_many :task_instances
	has_one :points, :dependent => :destroy
	belongs_to :group
	
	validates :password, :presence => true, 
						 :confirmation => true,
						 :length => { :within => 6..40 }
	
	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :name, :presence => true,
					 :length => { :maximum => 100 }
	validates :email, :presence => true,
					  :format => { :with => email_regex },
					  :uniqueness => { :case_sensitive => false }
	validates :total_points, :presence => true
	
	
	before_save :encrypt_password
	before_save :initialize_points
	
	
	def has_password?(submitted_password)
		encrypted_password == encrypt(submitted_password)
	end
	
	def self.authenticate(email, submitted_password)
		user = find_by_email(email)
		return nil if user.nil?
		return user if user.has_password?(submitted_password)
	end
	
	def self.authenticate_with_salt(id, cookie_salt)
		user = find_by_id(id)
		(user && user.salt == cookie_salt) ? user : nil
	end
	
	def set_group(group_name)
		group = Group.find_by_group_name(group_name)
		if group.present?
			self.group = group
		else
			self.group = Group.create(:group_name => group_name)
			self.toggle!(:admin)
		end
	end 
	
	
	private
	
		def initialize_points
			self.build_points(:points => 0)
		end
		
		def encrypt_password
			self.salt = make_salt if new_record?
			self.encrypted_password = encrypt(password)
		end
		
		def encrypt(string)
			secure_hash("#{salt}--#{string}")
		end
		
		def make_salt
			secure_hash("#{Time.now.utc}--#{password}")
		end
		
		def secure_hash(string)
			Digest::SHA2.hexdigest(string)
		end
	
end
