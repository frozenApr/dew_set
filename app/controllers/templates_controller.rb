# require 'high_voltage/pages_controller'

class TemplatesController < ApplicationController
  include HighVoltage::StaticPage

  layout false
end
