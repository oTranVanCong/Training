class Task < ActiveRecord::Base
  # Model association reference here: http://guides.rubyonrails.org/association_basics.html
  belongs_to :project
  before_save -> { self.active = 0 if active.blank? }
end
