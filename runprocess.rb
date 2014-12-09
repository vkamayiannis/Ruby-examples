require 'win32ole'
class ArgumentError < StandardError
end

INTERVALARGUMENT = "-t"
PROCESSARGUMENT = "-p"
EXECUTABLEARGUMENT = "-e"

if ARGV.find_index(INTERVALARGUMENT)
  pos = ARGV.find_index(INTERVALARGUMENT) + 1
  if (ARGV[pos] != INTERVALARGUMENT) && (ARGV[pos] != PROCESSARGUMENT) && (ARGV[pos] != EXECUTABLEARGUMENT)
    interval = ARGV[pos].to_i
  else
    raise ArgumentError.new("Invalid arguments")
  end
end
if ARGV.find_index(PROCESSARGUMENT)
  pos = ARGV.find_index(PROCESSARGUMENT) + 1
  if (ARGV[pos] != INTERVALARGUMENT) && (ARGV[pos] != PROCESSARGUMENT) && (ARGV[pos] != EXECUTABLEARGUMENT)
    process = ARGV[pos]
  else
    raise ArgumentError.new("Invalid arguments")
  end
end

if ARGV.find_index(EXECUTABLEARGUMENT)
  pos = ARGV.find_index(EXECUTABLEARGUMENT) + 1
  if (ARGV[pos] != INTERVALARGUMENT) && (ARGV[pos] != PROCESSARGUMENT) && (ARGV[pos] != EXECUTABLEARGUMENT)
    executable = ARGV[pos]
  else
    raise ArgumentError.new("Invalid arguments")
  end
end

wmi = WIN32OLE.connect("winmgmts://")
shell = WIN32OLE.new('Shell.Application')

while true
  active = false
  processes = wmi.ExecQuery("select * from win32_process")

  processes.each do |i|
    if i.name.upcase == process.upcase
      active = true
    end
  end
  if not active
    shell.ShellExecute(executable)
  end
  sleep interval
end