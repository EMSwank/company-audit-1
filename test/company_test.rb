require './test/test_helper'
require './lib/company'
require './modules/date_handler'

class CompanyTest < Minitest::Test
  def test_instantiation
    company = Company.new

    assert_equal Company, company.class
  end

  def test_attributes
    company = Company.new

    assert_instance_of Array, company.employees
    assert_equal true, company.employees.empty?
    assert_instance_of Array, company.projects
    assert_equal true, company.projects.empty?
    assert_instance_of Array, company.timesheets
    assert_equal true, company.timesheets.empty?
  end

  def test_it_loads_employees
    company= Company.new
    file_1 = './data/employees.csv'
    file_2 = './data/bad_employees.csv'

    assert_equal 2, company.load_employees(file_1).count
    assert_equal ({:success => true, :error => nil}), company.load_employees(file_1)
    assert_raises BadDataError do
      company.load_employees(file_2)
    end
    assert_equal 2, company.employees.count
    assert_instance_of Employee, company.add_employees
  end

  def test_it_loads_timesheets
    company= Company.new
    file_1 = './data/timesheets.csv'
    file_2 = './data/bad_timesheets.csv'

    assert_equal 2, company.load_timesheets(file_1).count
    assert_equal ({:success => true, :error => nil}), company.load_timesheets(file_1)
    assert_equal 2, company.timesheets.count
  end
end
