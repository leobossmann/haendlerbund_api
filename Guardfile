guard :rspec do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/haendlerbund_api/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
end

