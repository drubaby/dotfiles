#!/bin/bash

echo "Setting up iTerm2 configuration..."

# Check for common fonts
check_font() {
    if system_profiler SPFontsDataType | grep -q "$1"; then
        echo "✓ Found: $1"
        return 0
    else
        echo "✗ Missing: $1"
        return 1
    fi
}

echo ""
echo "Checking installed fonts..."
echo "========================="

# Built-in macOS fonts (should always be available)
check_font "Monaco"
check_font "Menlo"
check_font "SF Mono"

echo ""
echo "Checking Nerd Fonts (for better terminal icons)..."
echo "========================="

# Popular Nerd Fonts
FOUND_NERD_FONT=false
if check_font "Hack Nerd Font"; then
    FOUND_NERD_FONT=true
fi
if check_font "JetBrainsMono Nerd Font"; then
    FOUND_NERD_FONT=true
fi
if check_font "FiraCode Nerd Font"; then
    FOUND_NERD_FONT=true
fi
if check_font "MesloLGS NF"; then
    FOUND_NERD_FONT=true
fi

if [ "$FOUND_NERD_FONT" = false ]; then
    echo ""
    echo "No Nerd Fonts found. These provide better icons for terminals."
    echo "Install with Homebrew:"
    echo ""
    echo "  brew tap homebrew/cask-fonts"
    echo "  brew install --cask font-hack-nerd-font"
    echo "  # or"
    echo "  brew install --cask font-jetbrains-mono-nerd-font"
    echo "  # or"
    echo "  brew install --cask font-fira-code-nerd-font"
    echo ""
    read -p "Install font-hack-nerd-font now? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        brew tap homebrew/cask-fonts
        brew install --cask font-hack-nerd-font
    fi
fi

echo ""
echo "Setting up iTerm2 dynamic profiles..."
echo "========================="

DYNAMIC_PROFILES_DIR="$HOME/Library/Application Support/iTerm2/DynamicProfiles"

# Create directory if it doesn't exist
mkdir -p "$DYNAMIC_PROFILES_DIR"

# Link or copy profile
if [ -f "iterm2-profile.json" ]; then
    echo "Found iterm2-profile.json"
    cp iterm2-profile.json "$DYNAMIC_PROFILES_DIR/dotfiles-profile.json"
    echo "✓ Installed custom profile"
else
    echo "No custom profile found. Use iterm2-profile-template.json as a starting point."
    echo "To export your current profile:"
    echo "  1. Open iTerm2"
    echo "  2. Settings → Profiles → Select your profile"
    echo "  3. Other Actions → Save Profile as JSON"
    echo "  4. Save as iterm2-profile.json in this directory"
fi

echo ""
echo "Setup complete!"
echo ""
echo "Next steps:"
echo "1. Restart iTerm2 to load dynamic profiles"
echo "2. Go to Profiles and select 'Dotfiles Default' profile"
echo "3. Optionally set it as the default profile"