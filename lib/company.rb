class Company
  attr_reader :employees, :projects, :time_sheets

  def initialize
    @employees = []
    @projects = []
    @time_sheets = []
  end

  def load_employees(filename)

  end
end
