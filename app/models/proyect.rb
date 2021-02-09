class Proyect < ApplicationRecord
    enum status:[:propuesta, :en_progreso, :terminado]
end