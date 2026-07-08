# a called to `_pure_prompt_new_line` is triggered by an event
function fish_prompt
    set --global --export last_pipestatus $pipestatus # save for __fish_print_pipestatus
    set --global --export __fish_last_status $status # export for __fish_print_pipestatus

    _pure_print_prompt_rows # manage default vs. compact prompt
    _pure_place_iterm2_prompt_mark # place iTerm shell integration mark
    echo -e -n (_pure_prompt) # print prompt
    echo -e -n (_pure_prompt_ending) # reset colors and end prompt

    set _pure_fresh_session false
end
