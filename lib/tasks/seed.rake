# Seed result_field for your issues
# For using 
# Ex: rake redmine:result_field:seed
 
namespace :redmine do
  namespace :result_field do
    def default_possible_values
      %w(None Done)
    end
    
    task seed: :environment do
      p "Seeding result_field as custom_field for all projects."
      
      @field = IssueCustomField.create(
        name: I18n.t('result_field.default_field_name'),
        field_format: 'list',
        possible_values: default_possible_values,
        is_filter: true,
        is_for_all: true,
        searchable: true,
        tracker_ids: Tracker.pluck(:id)
      )
 
      unless @field.new_record?
        p "Field was created by the name #{@field.name}. Setup field on tab Administration -> Custom Fields -> Result"
      else
        p 'Field is not created. See errors below:'
        p @field.errors
      end
    end
  end
end