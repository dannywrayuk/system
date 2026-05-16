function pm () {
  GIT_ROOT=$(git rev-parse --show-toplevel 2> /dev/null)
  # package-lock.json exists in root, forward args onto npm
  if [ -f "$GIT_ROOT/package-lock.json" ]; then
    (npm "$@")
    # yarn-lock.json exists in root, forward args onto yarn
  elif [ -f "$GIT_ROOT/yarn-lock.json" ]; then
    (yarn "$@")
    # pnpm-lock.yaml exists in root, forward args onto pnpm
  elif [ -f "$GIT_ROOT/pnpm-lock.yaml" ]; then
    (pnpm "$@")
  else
    echo "No recognized package manager lock file found in git root."
  fi
}
