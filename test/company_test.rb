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
end
