require 'CSV'
require './lib/project'
require './lib/time_sheet'
require './lib/employee'
require './lib/errors'

class Company
  attr_reader :employees, :projects, :time_sheets

  def initialize
    @employees = []
    @projects = []
    @time_sheets = []
  end

  def load_employees(filename)
    lines = CSV.readlines(filename)
      lines.each do |line|
        if line.count != 5
          raise BadDataError
          return {:success => false, :error => 'bad data'}
        else
          return {:success => true, :error => nil}
        end
      end 
    # require 'pry'; binding.pry
  end
end
