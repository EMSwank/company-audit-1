require 'CSV'
require './lib/project'
require './lib/time_sheet'
require './lib/employee'
require './lib/errors'

class Company
  attr_reader :employees, :projects, :timesheets

  def initialize
    @employees = []
    @projects = []
    @timesheets = []
  end

  def load_employees(filename)
    lines = CSV.readlines(filename)
      lines.each do |line|
        raise BadDataError if line.count != 5
        if line.count != 5
          return {:success => false, :error => 'bad data'}
        end
        employees << line
        return {:success => true, :error => nil}
      end
  end

  def load_timesheets(filename)
    lines = CSV.readlines(filename)
    lines.each do |line|
      raise BadDataError if line.count != 4 || line.include?(nil)
      if line.count != 4

        return {:success => false, :error => 'bad data'}
      end
      timesheets << line
      return {:success => true, :error => nil}
    end
  end

end
