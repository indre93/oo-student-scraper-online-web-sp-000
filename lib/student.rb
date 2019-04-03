require 'pry'

class Student

  attr_accessor :name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url

  @@all = []

  def initialize(students_hash)
    students_hash.each do |key, value|
      self.send("#{key}=", value)
    end
    @@all << self
  end

  def self.create_from_collection(students_array)
    @@all
    binding.pry
  end

  def add_student_attributes(attributes_hash)

  end

  def self.all
    @@all
  end
end
