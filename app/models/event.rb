class Event < ApplicationRecord
  validates :start_date, :duration, :title, :description, :price, :location, presence: :true
  validate :cant_be_past
  validate :duration_5_pos
  validates :duration, presence: true, numericality: { greater_than: 0 } 
  validates :title, presence: true, length: { in: 5..140}
  validates :description, presence: true, length: { in: 20..1000}
  validate :price_validation
 
  
  has_many :users, through: :attendance
  has_many :attendances
  belongs_to :user 

  def end_date
    start_date + duration * 60
  end

  private 
  
  def cant_be_past
    if start_date.nil?
      errors.add(:start_date, "Doit être rempli ;)") 
    else
      errors.add(:start_date, "La date est déjà passé :(") if start_date < Time.now
    end
  end
  
  def duration_5_pos
    if duration.nil?
      errors.add(:duration, "Doit être rempli ;)") 
    else
      errors.add(:duration, "Ca doit être un multiple de 5 ;)") unless duration % 5 == 0
      errors.add(:duration, "0 c'est trop cours ;)") unless duration > 0
    end
  end

  def price_validation
    if price.nil?
      errors.add(:price, "Doit être rempli ;)") 
    else
      errors.add(:price, "La gratuité n'est pas dispo ici, minimum 1€") if price < 1
      errors.add(:price, "Besoin d'argent?! Moins de 1000€ STP!!!") if price > 1000
    end
  end

end
