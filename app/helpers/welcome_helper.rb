module WelcomeHelper
  def build_state(feed)
    build_successful?(feed) ? 'good' : 'bad'
  end
  
  def build_status(feed)
    build_successful?(feed) ? 'Current build is good' : 'Houston, we have a problem'
  end
  
  def icon_url(story)
    case story.story_type
      when 'chore' then 'https://www.pivotaltracker.com/images/v3/icons/stories_view/chore_icon.png'
      when 'feature' then 'https://www.pivotaltracker.com/images/v3/icons/stories_view/feature_icon.png'
      when 'bug' then 'https://www.pivotaltracker.com/images/v3/icons/stories_view/bug_icon.png'
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
