# == Schema Information
#
# Table name: assuntos
#
#  id         :integer          not null, primary key
#  nome       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Assunto < ActiveRecord::Base

  has_many :autos

  validates_presence_of :nome, message: 'é obrigatório'

  validate :checa_autos_relacionados, on: :update
  before_destroy :checa_autos_relacionados

  def checa_autos_relacionados
    if !self.autos.empty?
      self.errors.add(:autos, 'este assunto contém autos, portanto, não pode ser alterado')
      return false
    end
  end
end
