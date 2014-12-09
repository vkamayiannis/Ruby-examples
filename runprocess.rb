#In order to run the following arguments must be passed:
# -t interval : -t inteval : The interval in seconds used to check if the process runs
# -p processname: The process name to check if is running
# -e executable: The executable to run if the process defined is not running

require 'win32ole'

INTERVALARGUMENT = "-t"
PROCESSARGUMENT = "-p"
EXECUTABLEARGUMENT = "-e"

class InvalidFileName < StandardError
end

def check_if_executable_exists(file)
  filexists = false
  path = File.dirname(file)
  if path == "." #check if there is no path in parameter. If not search in the PATH variable
    ENV['PATH'].split(';').each {|folder| filexists = true if File.exists?(folder+'/' + file)}
  else
    filexists if File.exists?(file)
  end
  filexists
end

def run_process(pr, ex, int = 10)
  wmi = WIN32OLE.connect("winmgmts://")
  shell = WIN32OLE.new('Shell.Application')

  while true
    active = false
    processes = wmi.ExecQuery("select * from win32_process")

    processes.each do |i|
      if i.name.upcase == pr.upcase
        active = true
      end
    end
    if not active
      shell.ShellExecute(ex)
    end
    sleep int
  end
end

if ARGV.find_index(INTERVALARGUMENT)
  pos = ARGV.find_index(INTERVALARGUMENT) + 1
  if (ARGV[pos] != INTERVALARGUMENT) && (ARGV[pos] != PROCESSARGUMENT) && (ARGV[pos] != EXECUTABLEARGUMENT)
    interval = ARGV[pos].to_i
  end
end
if ARGV.find_index(PROCESSARGUMENT)
  pos = ARGV.find_index(PROCESSARGUMENT) + 1
  if (ARGV[pos] != INTERVALARGUMENT) && (ARGV[pos] != PROCESSARGUMENT) && (ARGV[pos] != EXECUTABLEARGUMENT)
    process = ARGV[pos]
  end
end

if ARGV.find_index(EXECUTABLEARGUMENT)
  pos = ARGV.find_index(EXECUTABLEARGUMENT) + 1
  if (ARGV[pos] != INTERVALARGUMENT) && (ARGV[pos] != PROCESSARGUMENT) && (ARGV[pos] != EXECUTABLEARGUMENT)
  executable = ARGV[pos]
  if !check_if_executable_exists(executable)
    raise InvalidFileName.new("Invalid executable")
  end
end
end

if interval && process && executable
  run_process(process, executable, interval)
else
  puts "Run with arguments"
  puts "-t inteval : The interval in seconds used to check if the process runs"
  puts "-p processname: The process name to check if is running"
  puts "-e executable: The executable to run if the process defined is not running"
end