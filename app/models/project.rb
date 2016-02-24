class Project < ActiveRecord::Base
  # Model association reference here: http://guides.rubyonrails.org/association_basics.html
  has_many :tasks, dependent: :destroy
  before_save -> { self.active = 0 if active.blank? }
end
