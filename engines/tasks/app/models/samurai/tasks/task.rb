module Samurai::Tasks
  class Task < ActiveRecord::Base
    belongs_to :user
    belongs_to :contact
  end
end