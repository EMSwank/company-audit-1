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
        add_timesheets(line)
        return {:success => true, :error => nil}
      end
    end
  end

  def load_projects(filename)
  lines = CSV.readlines(filename)
  lines.each do |line|
    raise BadDataError if line.count != 4 || line.include?(nil)
    if line.count != 4
      return {:success => false, :error => 'bad data'}
    else
      add_projects(line)
      return {:success => true, :error => nil}
    end
  end
  end

  def add_timesheets(line)
      timesheet = Timesheet.new(:employee_id => line[0],
                   :project_id => line[1],
                   :date => line[3],
                   :minutes => line[4])
      timesheets << timesheet
  end


  def add_projects(line)
      project = Project.new(:project_id => line[0],
                   :name => line[1],
                   :start_date => line[3],
                   :end_date => line[4])
      projects << project
  end


  def find_employee_by_id(employee_id)
     employees.find {|employee| employee.employee_id == employee_id}
  end

  def find_by_project_id(project_id)
    projects.find {|project| project.project_id == project_id}
  end
end
