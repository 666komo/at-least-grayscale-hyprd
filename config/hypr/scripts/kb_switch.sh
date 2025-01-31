current_layout=$(hyprctl devices | grep -m 1 'active keymap' | awk '{gsub("active keymap: ", ""); gsub(/[ \t]+/, ""); print;}')

if [ "$current_layout" = "English(US)" ]; then
    hyprctl keyword input:kb_variant dvorak
else
    hyprctl keyword input:kb_variant ""
fi

