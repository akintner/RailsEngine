class ApplicationRecord < ActiveRecord::Base
  extend ModelHelpers
  self.abstract_class = true
end
