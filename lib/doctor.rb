class Doctor
  attr_accessor :name 
  
  @@all = []
  
  def initialize(name)
    @name = name 
    @@all << self 
  end 
  
  def self.all 
    @@all 
  end 
  
  def new_appointment(patient, date)
    Appointment.new(date, patient, self)
  end 
  
  def appointments 
    Appointment.all.select do |visit|
      visit.doctor == self 
    end 
  end 
  
  def patients 
    self.appointments.collect do |visit|
      visit.patient
    end 
  end 
  
end 