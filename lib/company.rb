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
        add_employees(line)
        return {:success => true, :error => nil}
      end
  end

  def add_employees(line)
      employee = Employee.new(:employee_id => line[0],
                   :name => line[1],
                   :role => line[2],
                   :start_date => line[3],
                   :end_date => line[4])
      employees << employee


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
     employees.find {|emp| emp.employee_id == employee_id}
  end
end
