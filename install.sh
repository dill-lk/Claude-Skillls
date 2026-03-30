#!/usr/bin/env bash
# =============================================================================
# Claude-Skillls Installer
# https://github.com/dill-lk/Claude-Skillls
#
# Downloads all Claude Code skill files from the library and saves them
# locally so Claude Code can read and use them in any project.
#
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/dill-lk/Claude-Skillls/main/install.sh | bash
#
#   Or with options:
#   bash install.sh --dir ~/.claude/skills --append-claude-md
# =============================================================================

set -euo pipefail

# ---------------------------------------------------------------------------
# Configuration
# ---------------------------------------------------------------------------
REPO_RAW="https://raw.githubusercontent.com/dill-lk/Claude-Skillls/main"
DEFAULT_SKILLS_DIR="${HOME}/.claude/skills"
APPEND_CLAUDE_MD=false
SKILLS_DIR=""

SKILLS=(
  "code-generation"
  "debugging"
  "refactoring"
  "testing"
  "documentation"
  "api-design"
  "database"
  "security"
  "performance"
  "devops"
)

# ---------------------------------------------------------------------------
# Colours
# ---------------------------------------------------------------------------
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
BOLD='\033[1m'
RESET='\033[0m'

# ---------------------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------------------
info()    { echo -e "${CYAN}[info]${RESET}  $*"; }
success() { echo -e "${GREEN}[ok]${RESET}    $*"; }
warn()    { echo -e "${YELLOW}[warn]${RESET}  $*"; }
error()   { echo -e "${RED}[error]${RESET} $*" >&2; }
die()     { error "$*"; exit 1; }

check_dependency() {
  if ! command -v "$1" &>/dev/null; then
    die "Required dependency '$1' is not installed. Please install it and re-run."
  fi
}

# ---------------------------------------------------------------------------
# Argument parsing
# ---------------------------------------------------------------------------
parse_args() {
  while [[ $# -gt 0 ]]; do
    case "$1" in
      --dir)
        SKILLS_DIR="$2"
        shift 2
        ;;
      --append-claude-md)
        APPEND_CLAUDE_MD=true
        shift
        ;;
      --help|-h)
        echo ""
        echo "${BOLD}Claude-Skillls Installer${RESET}"
        echo ""
        echo "Usage: bash install.sh [options]"
        echo ""
        echo "Options:"
        echo "  --dir <path>        Directory to save skills (default: ~/.claude/skills)"
        echo "  --append-claude-md  Also append skill references to ./CLAUDE.md"
        echo "  --help              Show this help"
        echo ""
        exit 0
        ;;
      *)
        warn "Unknown argument: $1 (ignored)"
        shift
        ;;
    esac
  done

  SKILLS_DIR="${SKILLS_DIR:-$DEFAULT_SKILLS_DIR}"
}

# ---------------------------------------------------------------------------
# Download a single skill
# ---------------------------------------------------------------------------
download_skill() {
  local skill="$1"
  local url="${REPO_RAW}/${skill}/claude.skill.md"
  local dest="${SKILLS_DIR}/${skill}.md"

  if curl -fsSL "$url" -o "$dest" 2>/dev/null; then
    success "Downloaded  ${skill}"
  else
    warn "Failed to download ${skill} from ${url}"
    return 1
  fi
}

# ---------------------------------------------------------------------------
# Append skill references to CLAUDE.md
# ---------------------------------------------------------------------------
append_to_claude_md() {
  local claude_md="./CLAUDE.md"
  local block_start="<!-- claude-skillls:start -->"
  local block_end="<!-- claude-skillls:end -->"

  # Remove existing block if present
  if grep -q "$block_start" "$claude_md" 2>/dev/null; then
    warn "Existing claude-skillls block found in CLAUDE.md — replacing it."
    # Use a temp file to replace the block
    local tmpfile
    tmpfile=$(mktemp)
    awk "/$block_start/{skip=1} /$block_end/{skip=0; next} !skip" "$claude_md" > "$tmpfile"
    mv "$tmpfile" "$claude_md"
  fi

  {
    echo ""
    echo "$block_start"
    echo "## Claude Code Skills"
    echo ""
    echo "The following skill reference files are available in \`${SKILLS_DIR}/\`."
    echo "Read the relevant file before starting a task in that area."
    echo ""
    for skill in "${SKILLS[@]}"; do
      echo "- **${skill}**: \`${SKILLS_DIR}/${skill}.md\`"
    done
    echo ""
    echo "$block_end"
  } >> "$claude_md"

  success "Appended skill references to ${claude_md}"
}

# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------
main() {
  parse_args "$@"

  echo ""
  echo -e "${BOLD}╔══════════════════════════════════════╗${RESET}"
  echo -e "${BOLD}║      Claude-Skillls Installer        ║${RESET}"
  echo -e "${BOLD}╚══════════════════════════════════════╝${RESET}"
  echo ""

  check_dependency curl

  info "Installing ${#SKILLS[@]} skills to: ${SKILLS_DIR}"
  echo ""

  mkdir -p "$SKILLS_DIR"

  local failed=0
  for skill in "${SKILLS[@]}"; do
    download_skill "$skill" || ((failed++)) || true
  done

  echo ""

  if [[ $failed -gt 0 ]]; then
    warn "${failed} skill(s) failed to download. Check your internet connection and try again."
  else
    success "All ${#SKILLS[@]} skills installed successfully!"
  fi

  if [[ "$APPEND_CLAUDE_MD" == true ]]; then
    echo ""
    info "Appending skill references to CLAUDE.md …"
    append_to_claude_md
  fi

  echo ""
  echo -e "${BOLD}Next steps:${RESET}"
  echo ""
  echo "  1. Skills are saved in: ${SKILLS_DIR}"
  echo ""
  echo "  2. Tell Claude Code to use a skill:"
  echo "     \"Read ${SKILLS_DIR}/debugging.md and help me debug this issue.\""
  echo ""
  echo "  3. Or add to your project CLAUDE.md:"
  echo "     bash install.sh --append-claude-md"
  echo ""
  echo "  See: https://github.com/dill-lk/Claude-Skillls for full documentation."
  echo ""
}

main "$@"
