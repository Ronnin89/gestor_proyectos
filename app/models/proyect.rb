class Proyect < ApplicationRecord
    enum state:[:propuesta, :en_progreso, :terminado]
    validated :name, present: true
    validated :description, present: true
    validated :state, present: true
end