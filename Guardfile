directories %w(src data) \
 .select{|d| Dir.exists?(d) ? d : UI.warning("Directory #{d} does not exist")}

guard :haml, input: 'src/views', output: 'docs', run_at_start: true do
  watch(/^.+(\.html\.haml)$/)
end

guard 'sass', input: 'src', output: 'public' do
  watch(%r{^styles/(.+\.s[ac]ss)$})
end
