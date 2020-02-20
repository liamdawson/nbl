function with_extended_build_paths
  if command -v brew >/dev/null 2>&1
    brew list openssl >/dev/null 2>&1 && set -x LIBRARY_PATH $LIBRARY_PATH (brew --prefix openssl)/lib/
    brew list mysql@5.6 >/dev/null 2>&1 && set -x PATH (brew --prefix mysql@5.6)/bin/ $PATH
  end

  echo
  echo "LIBRARY_PATH: $LIBRARY_PATH"
  echo "PATH: $PATH"
  echo "running: $argv"
  echo
  
  $argv
end
