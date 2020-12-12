# Puma can serve each request in a thread from an internal thread pool.
# The `threads` method setting takes two numbers: a minimum and maximum.
# Any libraries that use thread pools should be configured to match
# the maximum value specified for Puma. Default is set to 5 threads for minimum
# and maximum; this matches the default thread size of Active Record.
#
threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
threads threads_count, threads_count
port        ENV.fetch("PORT") { 3000 }
app_dir = File.expand_path("../..", __FILE__)
environment "production"

bind "unix:///home/deployer/authentication_service/apps/shared/tmp/sockets/puma.sock"
pidfile '/home/deployer/authentication_service/apps/shared/tmp/pids/puma.pid'
state_path '/home/deployer/authentication_service/apps/shared/tmp/pids/puma.state'
workers ENV.fetch("WEB_CONCURRENCY") { 2 }

plugin :tmp_restart
