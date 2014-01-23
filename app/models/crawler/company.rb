class Crawler::Company < ActiveRecord::Base
  # self.establish_connection(Rails.configuration.database_configuration["development"])
  self.table_name = :crawler_companies


end
