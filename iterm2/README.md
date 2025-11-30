# iTerm2 Configuration

## Installation

### Option 1: Import Profile Manually
1. Open iTerm2
2. Go to Settings → Profiles
3. Click "Other Actions" → "Import JSON Profiles"
4. Select `iterm2-profile.json` from this directory

### Option 2: Dynamic Profiles (Auto-sync)
The profile in `DynamicProfiles/` will automatically be loaded by iTerm2.

1. Create symlink for dynamic profiles:
```bash
ln -sf ~/dotfiles/iterm2/DynamicProfiles/* ~/Library/Application\ Support/iTerm2/DynamicProfiles/
```

2. Restart iTerm2 and the profile will appear in your profiles list

### Option 3: Full Preferences Sync
To sync ALL iTerm2 settings (not just profiles):

1. In iTerm2, go to Settings → General → Preferences
2. Check "Load preferences from a custom folder or URL"
3. Set the folder to: `~/dotfiles/iterm2/preferences`

## Files

- `iterm2-profile.json` - Main terminal profile with colors, fonts, etc.
- `DynamicProfiles/` - Auto-loaded profiles
- `preferences/` - Full iTerm2 preferences (optional)