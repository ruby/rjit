require "minitest/autorun"
require_relative "../bin/bindings"
require "fiddle"

class SymbolTest < Minitest::Test
  rjit_dir = File.expand_path('..', __dir__)
  rjit_c_rb = File.join(rjit_dir, 'lib/rjit/c.rb')
  bg = BindingGenerator.generator(rjit_c_rb)
  bg.funcs.each do |func|
    define_method("test_has_address_for_#{func}") do
      handle = Fiddle::Handle::DEFAULT
      assert handle[func], "#{func} should have an address"
    end
  end
end
