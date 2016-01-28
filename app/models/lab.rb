class Lab < ActiveRecord::Base
	

	
  	
  	has_many :projects
  	accepts_nested_attributes_for :projects, reject_if: :all_blank, allow_destroy: true

  	has_many :publications
  	accepts_nested_attributes_for :publications, reject_if: :all_blank, allow_destroy: true

  	validates :title, :location, :webpage, :lab_capacity, :director, :req, :suggested, :year, :category, :description, :email, presence: true
  	

  	belongs_to :user

    #Searches through all the text in title and description
    def self.search(filter)
      if filter
        where('description LIKE ? OR title LIKE ? OR director LIKE?', "%#{filter}%","%#{filter}%","%#{filter}%") 
      else
        scoped
      end
    end

    




end
