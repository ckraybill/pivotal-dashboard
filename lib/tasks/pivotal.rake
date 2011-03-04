namespace :pivotal do
  desc "Updates pivotal projects and stories"
  task(:update => :environment) do
    PIVOTAL_PROJECTS.each do |project_id|
      pivotal_project = PivotalTracker::Project.find(project_id)
      Project.create_or_update(pivotal_project)
      Story.create_or_update_all_from_pivotal(pivotal_project)
    end
  end
end
