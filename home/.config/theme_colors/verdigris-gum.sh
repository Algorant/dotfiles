# Verdigris theme for gum (charmbracelet/gum v2).
#
# Canonical gum port of the Verdigris palette. Source it from bash or zsh:
#   source ~/.config/theme_colors/verdigris-gum.sh
# Scriptify handoff scripts carry an inline copy so they stay self-contained
# (~/.pi/agent/skills/scriptify/sample.sh). Update both copies together.
#
# fzf is themed separately through FZF_DEFAULT_OPTS in ~/.config/zsh/.zshrc.
# The key-hint footer of gum prompts is hard-coded gray inside gum and has no flag.

# Palette. Roles match ~/.pi/agent/themes/verdigris.json.
V_FG='#ebdbb2'      # vellum: prompts, items, body text
V_MUTED='#928374'   # gray: placeholders, notes, unselected button text
V_PANEL='#2c2f30'   # panel: unselected button background
V_BG='#1d2021'      # background: text on filled buttons
V_FERN='#8ec07c'    # fern: cursor, focused button, selections, success
V_PATINA='#689d6a'  # patina: banner frame
V_AQUA='#83a598'    # aqua: headers, step titles, spinner, info
V_OCHRE='#e6bf86'   # ochre: warnings, destructive-action frame
V_MOSS='#70764a'    # moss: summary frame
V_ERR='#e36f63'     # error: failures only

# gum confirm
export GUM_CONFIRM_PROMPT_FOREGROUND=$V_FG
export GUM_CONFIRM_SELECTED_FOREGROUND=$V_BG GUM_CONFIRM_SELECTED_BACKGROUND=$V_FERN
export GUM_CONFIRM_UNSELECTED_FOREGROUND=$V_MUTED GUM_CONFIRM_UNSELECTED_BACKGROUND=$V_PANEL

# gum choose (single and --no-limit)
export GUM_CHOOSE_CURSOR='› ' GUM_CHOOSE_CURSOR_FOREGROUND=$V_FERN
export GUM_CHOOSE_HEADER_FOREGROUND=$V_AQUA GUM_CHOOSE_ITEM_FOREGROUND=$V_FG
export GUM_CHOOSE_SELECTED_FOREGROUND=$V_FERN
export GUM_CHOOSE_CURSOR_PREFIX='○ ' GUM_CHOOSE_SELECTED_PREFIX='● ' GUM_CHOOSE_UNSELECTED_PREFIX='○ '

# gum input (plain and --password)
export GUM_INPUT_PROMPT='› ' GUM_INPUT_PROMPT_FOREGROUND=$V_FERN GUM_INPUT_CURSOR_FOREGROUND=$V_FERN
export GUM_INPUT_HEADER_FOREGROUND=$V_AQUA GUM_INPUT_PLACEHOLDER_FOREGROUND=$V_MUTED

# gum spin
export GUM_SPIN_SPINNER=minidot GUM_SPIN_SPINNER_FOREGROUND=$V_AQUA GUM_SPIN_TITLE_FOREGROUND=$V_FG
