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
    assert_instance_of Array, company.time_sheets
    assert_equal true, company.time_sheets.empty?
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
    assert_equal 2, company.employees
  end

  # def test_it_loads_timesheets
  #   company= Company.new
  #   file_1 = './data/timesheets'
  # end
end