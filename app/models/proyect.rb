class Proyect < ApplicationRecord
    enum state:[:propuesta, :en_progreso, :terminado]
end