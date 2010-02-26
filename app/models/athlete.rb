class Athlete < User
has_and_belongs_to_many :coaches
has_many :log_entries
end
