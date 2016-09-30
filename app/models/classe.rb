# == Schema Information
#
# Table name: classes
#
#  id         :integer          not null, primary key
#  nome       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Classe < ActiveRecord::Base
end
