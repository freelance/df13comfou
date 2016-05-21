class Cargahora < ActiveRecord::Base
  belongs_to :objetivo
  belongs_to :legajo
  belongs_to :user
end
