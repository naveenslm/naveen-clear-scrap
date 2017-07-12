require Rails.root.join('app/rails_admin/collection', 'rails_admin_routesupload.rb')
require Rails.root.join('app/rails_admin/collection', 'rails_admin_sync.rb')
RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true
module RailsAdmin
    module Config
      module Actions
        class Routesupload < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)
       end
       class Sync < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)
       end
      end
    end
  end
  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
    routesupload
    sync
    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
