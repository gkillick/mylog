class Coach < User
  has_and_belongs_to_many :athletes
end
