class Caja < ActiveRecord::Base
  belongs_to :user
  belongs_to :monedas
  belongs_to :billetes
end
