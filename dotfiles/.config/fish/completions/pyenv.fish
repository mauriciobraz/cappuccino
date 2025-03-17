function __pyenv_needs_command
  set command (commandline -opc)

  if [ (count $command) -eq 1 -a $command[1] = 'pyenv' ]
    return 0
  end

  return 1
end

function __pyenv_using_command
  set command (commandline -opc)

  if [ (count $command) -gt 1 ]
      if [ $argv[1] = $command[2] ]
      return 0
    end
  end

  return 1
end

complete -f -c pyenv -n '__pyenv_needs_command' -a '(pyenv commands)'

for command in (pyenv commands)
  complete -f -c pyenv -n "__pyenv_using_command $command" -a "(pyenv completions $command)"
end
