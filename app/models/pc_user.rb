class PcUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :reports
  has_many :newcomments
  enum :role, [:normal_pc_user, :author, :admin]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
end
