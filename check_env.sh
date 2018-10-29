RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

function check {
  echo -n "$1 ["
  which "$1" > /dev/null
  if [ "$?" != "0" ]; then
    echo -e "${RED}✗${NC}] ... RUN ${YELLOW}$2${NC}\n"
  else
    echo -e "${GREEN}✓${NC}]"
  fi
}

check "fzf" "go get github.com/junegunn/fzf"
check "ag" "brew install ag / apt-get install silversearcher-ag"
