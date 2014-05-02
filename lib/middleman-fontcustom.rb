require "middleman-core"
require_relative "middleman-fontcustom/version"

::Middleman::Extensions.register(:fontcustom) do
  require_relative "middleman-fontcustom/extension"
  ::Middleman::FontcustomExtension
end
