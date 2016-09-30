class Auto < ActiveRecord::Base
  validates_presence_of :classe, :assunto, :observacao

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
