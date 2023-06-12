Sidekiq.configure_server do |config|
  config.on(:startup) do
    schedule_file = "config/schedule.yml"

    if File.exist?(schedule_file) && Sidekiq.server?
      # Remove all jobs from Cron queue
      Sidekiq::Cron::Job.destroy_all!

      # Reload from schedule.yml (this does not remove existing jobs before loading)
      Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
    end
  end
end
  