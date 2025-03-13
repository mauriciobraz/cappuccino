function __fish_howdy_disable_options
    echo 0
    echo 1
    echo true
    echo false
end

function __fish_howdy_set_options
    echo core.abort_if_lid_closed
    echo core.abort_if_ssh
    echo core.detection_notice
    echo core.disabled
    echo core.no_confirmation
    echo core.suppress_unknown
    echo core.timeout_notice
    echo core.use_cnn
    echo core.workaround
    echo debug.end_report
    echo debug.gtk_stdout
    echo debug.verbose_stamps
    echo snapshots.save_failed
    echo snapshots.save_successful
    echo video.certainty
    echo video.dark_threshold
    echo video.device_format
    echo video.device_fps
    echo video.device_path
    echo video.exposure
    echo video.force_mjpeg
    echo video.frame_height
    echo video.frame_width
    echo video.max_height
    echo video.recording_plugin
    echo video.rotate
    echo video.timeout
    echo video.warn_no_device
end

function __fish_howdy_commands
    echo add
    echo clear
    echo config
    echo disable
    echo list
    echo remove
    echo set
    echo snapshot
    echo test
    echo version
end

# Global options
complete -c howdy -n "__fish_use_subcommand" -l plain -d 'Print machine-friendly output.'
complete -c howdy -n "__fish_use_subcommand" -s U -l user -d 'Set the user account to use.' -a 'commandlines --users'
complete -c howdy -n "__fish_use_subcommand" -s h -l help -d 'Show this help message and exit.'
complete -c howdy -n "__fish_use_subcommand" -s y -d 'Skip all questions.'

# Main
complete -c howdy -f -n "not __fish_use_subcommand" -a "(__fish_howdy_commands)" -d 'The command option to execute.'

# Sub
complete -c howdy -x -n "set_command howdy add" -a "(__fish_default)" -d 'Optional label for the new model (string)'
complete -c howdy -x -n "set_command howdy clear" -a "(__fish_default)"
complete -c howdy -x -n "set_command howdy config" -a "(__fish_default)"
complete -c howdy -x -n "set_command howdy disable" -a "(__fish_howdy_disable_options)" -d 'Set to 0 (enable), 1 (disable), true, or false'
complete -c howdy -x -n "set_command howdy list" -a "(__fish_default)"
complete -c howdy -x -n "set_command howdy remove" -a "(__fish_default)" -d 'ID of the model to remove (integer)'
complete -c howdy -x -n "set_command howdy set" -a "(__fish_howdy_set_options)" -d 'Config option to set'
complete -c howdy -x -n "set_command howdy set" -r -n 2 -a "(__fish_default)" -d 'Value to set the config option to'
complete -c howdy -x -n "set_command howdy snapshot" -a "(__fish_default)"
complete -c howdy -x -n "set_command howdy test" -a "(__fish_default)"
complete -c howdy -x -n "set_command howdy version" -a "(__fish_default)"
