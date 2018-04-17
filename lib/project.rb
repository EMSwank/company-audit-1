class Project
  attr_reader :project_id, :name, :start_date, :end_date

  def initialize(data)
    @project_id = data[:project_id]
    @name = data[:name]
    @start_date = data[:start_date]
    @end_date = data[:end_date]
  end
end
