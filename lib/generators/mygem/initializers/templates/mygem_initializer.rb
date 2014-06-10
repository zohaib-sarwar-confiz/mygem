#N1::Application.config.middleware.use Mygem::Rack,
#  :subscribe_me => { :options => ["process_action.action_controller", "sql.active_record"],
#                     :enabled_environments => ["development", "production"]}