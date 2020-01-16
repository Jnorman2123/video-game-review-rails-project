class ConsolesGame < ApplicationRecord
    belongs_to :game 
    belongs_to :console
end
