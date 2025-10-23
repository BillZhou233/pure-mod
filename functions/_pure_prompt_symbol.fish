function _pure_prompt_symbol \
    --description 'Print prompt symbol'

    set --local prompt_symbol (_pure_get_prompt_symbol)
    set --local symbol_color_success (_pure_set_color $pure_color_prompt_on_success)
    set --local symbol_color_error (_pure_set_color $pure_color_prompt_on_error)
    set --local symbol_color_sep (_pure_set_color $pure_color_prompt_on_error_sep)

    set -l last_status
    if set -q __fish_last_status
        set last_status $__fish_last_status
    else
        set last_status $last_pipestatus[-1] # default to $pipestatus[-1]
    end

    set --local symbol_color $symbol_color_success # default pure symbol color
    if not contains $last_status 0 141
        set symbol_color $symbol_color_error # different pure symbol color when previous command failed

        if set --query pure_separate_prompt_on_error; and test "$pure_separate_prompt_on_error" = true
            set --local prompt_status (__fish_print_pipestatus "" "" "|" "$ymbol_color_sep" "$symbol_color_error" $last_pipestatus)
            set symbol_color "$prompt_status $symbol_color_success"
        end
    end

    echo "$symbol_color$prompt_symbol"
end
