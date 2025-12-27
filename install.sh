#!/bin/bash
#
# No Wheel Inventions - Installation Script
# Installs slash commands and agents to Claude Code user-level configuration
#

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLAUDE_DIR="${HOME}/.claude"
COMMANDS_DIR="${CLAUDE_DIR}/commands/DevUtils"
AGENTS_DIR="${CLAUDE_DIR}/agents"

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}╔════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║     No Wheel Inventions - Installation Script      ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════════════════╝${NC}"
echo ""

# Create directories if they don't exist
echo -e "${YELLOW}Creating directories...${NC}"
mkdir -p "${COMMANDS_DIR}"
mkdir -p "${AGENTS_DIR}"
echo -e "${GREEN}✓ Directories created/verified${NC}"

# Copy slash commands
echo ""
echo -e "${YELLOW}Installing slash commands to ${COMMANDS_DIR}...${NC}"
for cmd in "${SCRIPT_DIR}/slash-commands"/*.md; do
    if [ -f "$cmd" ]; then
        filename=$(basename "$cmd")
        cp "$cmd" "${COMMANDS_DIR}/${filename}"
        echo -e "  ${GREEN}✓${NC} Installed: ${filename}"
    fi
done

# Copy agents
echo ""
echo -e "${YELLOW}Installing agents to ${AGENTS_DIR}...${NC}"
for agent in "${SCRIPT_DIR}/agents"/*.md; do
    if [ -f "$agent" ]; then
        filename=$(basename "$agent")
        cp "$agent" "${AGENTS_DIR}/${filename}"
        echo -e "  ${GREEN}✓${NC} Installed: ${filename}"
    fi
done

echo ""
echo -e "${GREEN}════════════════════════════════════════════════════${NC}"
echo -e "${GREEN}Installation complete!${NC}"
echo ""
echo -e "Slash commands installed to: ${BLUE}${COMMANDS_DIR}${NC}"
echo -e "Agents installed to: ${BLUE}${AGENTS_DIR}${NC}"
echo ""
echo -e "Usage in Claude Code:"
echo -e "  ${YELLOW}/DevUtils:starting-instruction${NC} - Set philosophy at project start"
echo -e "  ${YELLOW}/DevUtils:retrospective${NC}        - Review existing codebase"
echo -e "  ${YELLOW}/DevUtils:dependency-audit${NC}     - Audit dependencies"
echo -e "  ${YELLOW}/DevUtils:template-check${NC}       - Check for templates before building"
echo ""
echo -e "Agent available: ${YELLOW}stack-integration${NC}"
echo ""
