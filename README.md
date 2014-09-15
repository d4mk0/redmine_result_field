Redmine Result Field Plugin
==
This plug-in gives you the ability to effortlessly create a result field for your application redmine

Version
--
0.0.1

Installation
--
```sh
cd /path/to/redmine/plugins
git clone https://github.com/d4mk0/redmine_result_field.git
cd /path/to/redmine && RAILS_ENV=production bundle exec rake redmine:result_field:seed
```
Setup your result field on tab Administration -> Custom Fields -> Result.
Also u can remove this field on *Custom Fields* tab.

Using without plugin installation
--
Open your console

```sh
cd /path/to/redmine/plugins && RAILS_ENV=production bundle exec rails c
```
and run this command
```sh
IssueCustomField.create(
        name: 'Result',
        field_format: 'list',
        possible_values: %w(None Done),
        is_filter: true,
        is_for_all: true,
        searchable: true,
        tracker_ids: Tracker.pluck(:id)
      )
```
