module WelcomeHelper
  def build_state(feed)
    build_successful?(feed) ? 'good' : 'bad'
  end
  
  def build_status(feed)
    build_successful?(feed) ? 'Current build is good' : 'Houston, we have a problem'
  end
  
  def icon_url(story)
    base_url = 'https://cdn1-pivotaltracker.pantherssl.com/images/v7/application/stories_view/icons'
    icon = case story.story_type
      when 'chore' then 'chore.png'
      when 'feature' then 'feature.png'
      when 'bug' then 'bug.png'
      when 'release' then 'release.png'
    end
    "#{base_url}/#{icon}"
  end
  
  def story_class(story)
    case story.current_state
      when 'accepted', 'delivered', 'finished' then 'done'
      when 'started' then 'started'
      else ''
    end
  end
  
  private
    def build_successful?(feed)
      feed.entries.first.title.include?('success')
    end
end
