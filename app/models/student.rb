# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string
#  hometown   :string
#  birthday   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'pry'
class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students

  def self.search(params)
    if params.empty?
      return Student.all
    elsif !params.empty?
      return Student.all.select { |student| student.name.downcase.include?(params.downcase) }    
    end
  end

end
