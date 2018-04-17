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

  def add_employees
    @employees.each do |employee|
      Employee.new(:employee_id => employee[0],
                   :name => employee[1],
                   :role => employee[2],
                   :start_date => employee[3],
                   :end_date => employee[4])
      end 
    require 'pry'; binding.pry

  end

  def load_timesheets(filename)
    lines = CSV.readlines(filename)
    lines.each do |line|
      raise BadDataError if line.count != 4 || line.include?(nil)
      if line.count != 4
        return {:success => false, :error => 'bad data'}
      else
      timesheets << line
      return {:success => true, :error => nil}
    end
    end
  end

  def find_employee_by_id(employee_id)

  end
end
