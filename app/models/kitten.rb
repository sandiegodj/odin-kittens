class Kitten < ActiveRecord::Base
  validates :name, presence: true
  validates :age, presence: true
  validates :cuteness, presence: true
  validates :softness, presence: true


  def as_json(options={})
      super(:only => [:name, :age, :cuteness, :softness])
  end
end
