def rb_match(object, path, hash)
  match path, hash
end

def rb_common_routes(rb)
  rb_match rb, 'releases/:project_id',
  :to => 'rb_releases#index', :via => [:get]
  rb_match rb, 'release/:project_id/new',
  :to => 'rb_releases#new', :via => [:get, :post]
  rb_match rb, 'release/:release_id',
  :to => 'rb_releases#show', :via => [:get]
  rb_match rb, 'release/:release_id',
  :to => 'rb_releases#destroy', :via => [:delete]
  rb_match rb, 'release/:release_id/edit',
  :to => 'rb_releases#edit', :via => [:get, :post]
  rb_match rb, 'release/:release_id/shapshot',
  :to => 'rb_releases#snapshot', :via => [:get]

end


resource :rb, :only => :none do |rb|

    # releases
  #  resources :projects do
  #    resources :releases, :only => [:index, :new,:show, :edit, :destroy, :snapshot], :controller => :rb_releases  do
  #      get 'snapshot', :on => :member 
  #      post 'edit', :on => :member
  #      post 'new', :on => :member
  #    end
  #  end

  rb_common_routes rb

  rb_match rb, 'updated_items/:project_id', :to => 'rb_updated_items#show', via: :get

  rb_match rb, 'queries/:project_id', :to => 'rb_queries#show', via: :get
  rb_match rb, 'queries/:project_id/:sprint_id', :to => 'rb_queries#impediments', via: :get

  rb_match rb, 'wikis/:sprint_id', :to => 'rb_wikis#show', via: :get
  rb_match rb, 'wikis/:sprint_id', :to => 'rb_wikis#edit', via: :get

  resources :task, :except => :index, :controller => :rb_tasks
  rb_match rb, 'tasks/:story_id', :to => 'rb_tasks#index', via: :get

  rb_match rb, 'taskboards/:sprint_id',
  :to => 'rb_taskboards#show', via: :get


  rb_match rb, 'staticstics', :to => 'rb_all_projects#statistics', via: :get

  rb_match rb, 'server_variables/sprint/:sprint_id.js',
  :to => 'rb_server_variables#sprint',
  :format => 'js', via: :get
  rb_match rb, 'server_variables/sprint/:sprint_id.js',
  :to => 'rb_server_variables#sprint',
  :format => nil, via: :get
  rb_match rb, 'server_variables.js',
  :to => 'rb_server_variables#index',
  :format => 'js', via: :get
  rb_match rb, 'server_variables.js',
  :to => 'rb_server_variables#index',
  :format => nil, via: :get
  rb_match rb, 'server_variables/project/:project_id.js',
  :to => 'rb_server_variables#project',
  :format => 'js', via: :get
  rb_match rb, 'server_variables/project/:project_id.js',
  :to => 'rb_server_variables#project',
  :format => nil, via: :get

  rb_match rb, 'master_backlog/:project_id', :to => 'rb_master_backlogs#show', via: :get

  rb_match rb, 'master_backlog/:project_id/menu.json', :to => 'rb_master_backlogs#menu', :format => 'json', via: :get

  rb_match rb, 'impediment/create', :to => 'rb_impediments#create', via: :post
  rb_match rb, 'impediment/update/:id', :to => 'rb_impediments#update', via: :post

  rb_match rb, 'sprint/create', :to => 'rb_sprints#create', via: :post
  rb_match rb, 'sprint/:sprint_id/update', :to => 'rb_sprints#update', via: :post
  rb_match rb, 'sprint/:sprint_id/reset', :to => 'rb_sprints#reset', via: :get
  rb_match rb, 'sprint/download/:sprint_id.xml', :to => 'rb_sprints#download', :format => 'xml', via: :get
  rb_match rb, 'sprints/:project_id/close_completed', :to => 'rb_sprints#close_completed', via: :get

  rb_match rb, 'stories/:project_id/:sprint_id.pdf', :to => 'rb_stories#index', :format => 'pdf', via: :get
  rb_match rb, 'stories/:project_id.pdf', :to => 'rb_stories#index', :format => 'pdf', via: :get
  rb_match rb, 'story/create', :to => 'rb_stories#create', via: :post
  rb_match rb, 'story/update/:id', :to => 'rb_stories#update', via: :post

  rb_match rb, 'calendar/:key/:project_id.ics', :to => 'rb_calendars#ical',
  :format => 'xml', via: :get

  rb_match rb, 'burndown/:sprint_id',         :to => 'rb_burndown_charts#show', via: :get
  rb_match rb, 'burndown/:sprint_id/embed',   :to => 'rb_burndown_charts#embedded', via: :get
  rb_match rb, 'burndown/:sprint_id/print',   :to => 'rb_burndown_charts#print', via: :get

  rb_match rb, 'hooks/sidebar/project/:project_id',
  :to => 'rb_hooks_render#view_issues_sidebar', via: :get
  rb_match rb, 'hooks/sidebar/project/:project_id/:sprint_id',
  :to => 'rb_hooks_render#view_issues_sidebar', via: :get

end

