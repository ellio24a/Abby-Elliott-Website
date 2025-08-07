#!/bin/bash

cd ~/Desktop/Portfolio

declare -a RENAME_RULES=(
  "cs.html computer-science.html"
  "Endgrain-CB.html endgrain-cutting-board.html"
  "Oak-Purpleheart-CB.html oak-purpleheart-cutting-board.html"
  "Purpleheart-CB.html purpleheart-cutting-board.html"
  "Zebra-Mahogany-CB.html zebra-mahogany-cutting-board.html"
  "Wood-rings.html wood-rings.html"
  "Metal-rings.html metal-rings.html"
  "Woodworking.html woodworking.html"
  "Simon.html simon-project.html"
)

for rule in "${RENAME_RULES[@]}"; do
  old=$(echo $rule | awk '{print $1}')
  new=$(echo $rule | awk '{print $2}')

  if [[ -f "$old" ]]; then
    mv "$old" "$new"
    echo "Renamed $old → $new"

    for file in *.html; do
      sed -i '' "s|$old|$new|g" "$file"
    done
  else
    echo "⚠️  $old not found, skipping."
  fi
done

echo "✅ All done!"

