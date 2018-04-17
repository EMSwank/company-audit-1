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
        raise BadDataError if line.count != 5
        if line.count != 5
          raise BadDataError
          return {:success => false, :error => 'bad data'}
        end
          employees << line
          return {:success => true, :error => nil}
          # require 'pry'; binding.pry
      end
  end

  def load_timesheets(filename)
    lines = CSV.readlines(filename)
    lines.each do |line|
      if line.count != 4
        return {:success => false, :error => 'bad data'}
        raise BadDataError
      else
        return {:success => true, :error => nil}
      end
    end
  end
end
