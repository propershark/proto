require 'redcarpet'
require 'rouge'
require 'rouge/plugins/redcarpet'

module Ext
  class RougeRenderer < Redcarpet::Render::HTML
    include Rouge::Plugins::Redcarpet # yep, that's it.
  end
end
