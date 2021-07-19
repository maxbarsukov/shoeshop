RailsAdmin.config do |config|
  # This is necessary in order to avoid issues when in development
  # The way that RailsAdmin patches in the "include Pundit" is not
  # working well with  the auto-reloading, and so, we specify
  # a controller which explicitly already does "include Pundit"
  config.parent_controller = "::ApplicationController"

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == CancanCan ==
  # config.authorize_with :cancancan

  ## == Pundit ==
  config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

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

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  # config.parent_controller = '::ApplicationController'
end

module RailsAdmin
  module Extensions
    module Pundit
      class AuthorizationAdapter
        def authorize(action, abstract_model = nil, model_object = nil)
          record = model_object || abstract_model&.model
          if action && !policy(record).send(*action_for_pundit(action))
            raise ::Pundit::NotAuthorizedError.new("not allowed to #{action} this #{record}")
          end
          @controller.instance_variable_set(:@_pundit_policy_authorized, true)
        end

        def authorized?(action, abstract_model = nil, model_object = nil)
          record = model_object || abstract_model&.model
          policy(record).send(*action_for_pundit(action)) if action
        end

        def action_for_pundit(action)
          [:rails_admin?, action]
        end
      end
    end
  end
end
