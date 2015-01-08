Eye.application 'zsnapper' do
  working_dir '/root/zsnapper/lib/node_modules/zsnapper'
  stdall '/var/log/eye/zsnapper-stdall.log' # stdout,err logs for processes by default
  trigger :flapping, times: 10, within: 1.minute, retry_in: 3.minutes
  check :cpu, every: 10.seconds, below: 100, times: 3 # global check for all processes

  process :zsnapper do
    pid_file '/var/run/zsnapper-eye.pid'
    start_command '/root/start_zsnapper.sh'

    daemonize true
    start_timeout 10.seconds
    stop_timeout 5.seconds

  end

end
