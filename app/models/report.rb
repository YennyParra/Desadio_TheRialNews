class Report < ApplicationRecord
  belongs_to :pc_user
  has_many :reports
  has_many :newsComments

end
