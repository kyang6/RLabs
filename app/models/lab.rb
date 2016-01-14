class Lab < ActiveRecord::Base
	has_attached_file :image, styles: { :medium => "400x400#", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  	
  	has_many :projects
  	accepts_nested_attributes_for :projects, reject_if: :all_blank, allow_destroy: true

  	has_many :publications
  	accepts_nested_attributes_for :publications, reject_if: :all_blank, allow_destroy: true

  	validates :title, :description, :location, :email, presence: true

  	belongs_to :user
end
