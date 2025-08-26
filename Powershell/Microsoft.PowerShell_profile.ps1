$env:POWERSHELL_UPDATECHECK = 'Off'
$ENV:TERM = "xterm-256color"
#$ENV:TERM = "wezterm"

# Starship config
$ENV:STARSHIP_CONFIG = "$HOME/.config/.starship.toml"
# $Env:KOMOREBI_CONFIG_HOME = "$HOME/.config/komorebi"
ENV:STARSHIP_CACHE = "$HOME/AppData/Local/Temp"

Invoke-Expression (&starship init powershell)

# Neovim path
function nvim_path { cd "$HOME/AppData/Local/nvim" }
function nvide { neovide --opengl . } # https://github.com/neovide/neovide

# For exit terminal
function ex{ exit }

New-Alias v nvim
New-Alias ee ex
New-Alias c cls
New-Alias vide nvide
New-Alias cdnvim nvim_path
New-Alias which Get-Command

# Prevent conflict with built-in aliases
Remove-Alias ls -Force -ErrorAction SilentlyContinue
Remove-Alias cat -Force -ErrorAction SilentlyContinue

# Require bat & lsd :-
# - https://github.com/sharkdp/bat
# - https://github.com/lsd-rs/lsd
function cat-bat { bat --style=plain @args }
function ls-lsd { lsd --group-dirs first @args }
function ll-lsd { ls-lsd --long @args }
function lt-lsd { ls-lsd --tree --depth=2 @args }
function la-lsd { ls-lsd --almost-all @args }
function l-lsd { ll-lsd --almost-all @args }
function llm-lsd { ll-lsd --timesort @args }
function llt-lsd { ll-lsd --tree --depth=2 @args }
function llat-lsd { l-lsd --tree --depth=2 @args }
function lm-lsd { l-lsd --timesort @args }

New-Alias -Name l -Value l-lsd
New-Alias -Name ls -Value ls-lsd
New-Alias -Name ll -Value ll-lsd
New-Alias -Name la -Value la-lsd
New-Alias -Name lm -Value lm-lsd
New-Alias -Name llm -Value llm-lsd
New-Alias -Name llt -Value llt-lsd
New-Alias -Name llat -Value llat-lsd
New-Alias -Name cat -Value cat-bat

Set-PSReadLineKeyHandler -Key 'Ctrl+ ' -Function AcceptSuggestion
