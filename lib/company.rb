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
          {:success => false, :error => 'bad data'}
        else
          employees << line
          # require 'pry'; binding.pry
          {:success => true, :error => nil}
        end
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
