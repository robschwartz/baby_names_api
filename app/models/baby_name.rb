class BabyName < ApplicationRecord
  belongs_to :list
  
  validates_uniqueness_of :name, :scope => :list_id, :case_sensitive => false

  before_save :remove_white_space

  private

  def remove_white_space
    self.name.strip!
  end

end
