# == Schema Information
#
# Table name: autos
#
#  id         :integer          not null, primary key
#  observacao :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  classe_id  :integer
#  assunto_id :integer
#

class Auto < ActiveRecord::Base
  validates_presence_of :observacao

  belongs_to :classe
  belongs_to :assunto


  before_save :validate_fields

  def validate_fields
    if self.classe == 'Nova'
      self.errors.add(:classe, 'Classe não pode ser nova na alteração')
    end
    if self.assunto == 'Férias'
      self.errors.add(:assunto, 'Assunto não pode ser ferias na alteração')
    end
    return self.errors.count == 0
  end
end
