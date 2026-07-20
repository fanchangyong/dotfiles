#!/usr/bin/env bash
# Claude Code statusLine: working directory, model, context window, cost, limits.
# Reads Claude Code's JSON payload on stdin. Full schema includes:
#   cwd, workspace{current_dir,project_dir}, model{id,display_name}, version,
#   cost{total_cost_usd,total_duration_ms,total_lines_added,...},
#   context_window{used_percentage,total_input_tokens,context_window_size,...},
#   rate_limits{five_hour,seven_day}, effort, fast_mode, vim, thinking

input=$(cat)

Yellow='\033[0;33m'
Cyan='\033[0;36m'
Purple='\033[0;35m'
Green='\033[0;32m'
Grey='\033[0;90m'
Color_Off='\033[0m'

# Pull every field in one jq pass; `// empty` leaves the var blank if absent
eval "$(printf '%s' "$input" | jq -r '
    @sh "dir=\(.workspace.current_dir // .cwd // "")",
    @sh "model=\(.model.display_name // "")",
    @sh "ctx_pct=\(.context_window.used_percentage // "")",
    @sh "ctx_used=\(.context_window.total_input_tokens // "")",
    @sh "ctx_size=\(.context_window.context_window_size // "")",
    @sh "lim5=\(.rate_limits.five_hour.used_percentage // "")",
    @sh "lim5_reset=\(.rate_limits.five_hour.resets_at // "")",
    @sh "lim7=\(.rate_limits.seven_day.used_percentage // "")",
    @sh "lim7_reset=\(.rate_limits.seven_day.resets_at // "")"
')"

# Branch name, or short SHA when detached; empty outside a repo. Resolved from
# the real path, so this must run before $dir is abbreviated to ~.
branch=$(git -C "$dir" --no-optional-locks symbolic-ref --quiet --short HEAD 2>/dev/null \
    || git -C "$dir" --no-optional-locks rev-parse --short HEAD 2>/dev/null)

# Abbreviate $HOME to ~ the way a shell prompt would
dir=${dir/#$HOME/\~}

# Render token counts compactly: 27916 -> 28k, 1000000 -> 1.0M
human() {
    awk -v n="$1" 'BEGIN {
        if (n >= 1000000) printf "%.1fM", n / 1000000
        else if (n >= 1000) printf "%.0fk", n / 1000
        else printf "%d", n
    }'
}

# Time until a window rolls over, as a compact "2.4d" / "4.1h" / "35m"
until_reset() {
    local secs=$(( $1 - $(date +%s) ))
    [ "$secs" -le 0 ] && return
    if [ "$secs" -ge 86400 ]; then awk -v s="$secs" 'BEGIN { printf "%.1fd", s / 86400 }'
    elif [ "$secs" -ge 3600 ]; then awk -v s="$secs" 'BEGIN { printf "%.1fh", s / 3600 }'
    else printf '%dm' $(( (secs + 59) / 60 ))
    fi
}

sep="${Grey} · "
out="${Yellow}${dir}"
[ -n "$branch" ] && out+=" ${Green}(${branch})"
[ -n "$model" ] && out+="${sep}${Purple}${model}"
[ -n "$ctx_pct" ] && out+="${sep}${Cyan}${ctx_pct}% ctx ${Grey}($(human "$ctx_used")/$(human "$ctx_size"))"
if [ -n "$lim5" ] && [ -n "$lim7" ]; then
    left5=$([ -n "$lim5_reset" ] && until_reset "$lim5_reset")
    left7=$([ -n "$lim7_reset" ] && until_reset "$lim7_reset")
    out+="${sep}${Grey}${lim5}%${left5:+ ($left5)} / ${lim7}%${left7:+ ($left7)} limits"
fi

printf "%b" "${out}${Color_Off}"
