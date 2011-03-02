module WelcomeHelper
  def build_state(feed)
    build_successful?(feed) ? 'good' : 'bad'
  end
  
  def build_status(feed)
    build_successful?(feed) ? 'Current build is good' : 'Houston, we have a problem'
  end
  
  def icon_url(story)
    case story.story_type
      when 'chore' then 'https://cdn1-pivotaltracker.pantherssl.com/images/v6/application/stories_view/icons/chore.png'
      when 'feature' then 'https://cdn1-pivotaltracker.pantherssl.com/images/v6/application/stories_view/icons/feature.png'
      when 'bug' then 'https://cdn1-pivotaltracker.pantherssl.com/images/v6/application/stories_view/icons/bug.png'
    end
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
