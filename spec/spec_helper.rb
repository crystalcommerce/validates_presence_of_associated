require 'rubygems'
require 'activerecord'
require 'spec'
require 'spec/rails/extensions/active_record/base'

require File.dirname(__FILE__) + '/../lib/validates_presence_of_associated'
 
RAILS_ENV="test"

ActiveRecord::Base.configurations = {
  "test" => {
    :adapter => 'sqlite3',
    :database => ":memory:"
  }
}

ActiveRecord::Base.establish_connection
