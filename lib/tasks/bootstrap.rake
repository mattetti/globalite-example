desc 'Bootstrap the app'
task :bootstrap => ['db:create', 'db:migrate'] do
  p "The demo app is ready to be used!"
  p "type script/server to start it"
end