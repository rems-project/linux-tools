die() {
  print -u2 -- "\x1b[1;31mERROR\x1b[22;31m: $*\x1b[0m"
  exit 1
}

# using the homebrew clang
# CLANG=/opt/homebrew/opt/llvm@12/bin/clang-12
if [[ $OSTYPE == darwin* && -f /opt/homebrew/opt/llvm/bin/clang ]]; then
  # if on macos, use the homebrew clang when present
  CONFIG_CLANG=/opt/homebrew/opt/llvm/bin/clang
elif (( $+commands[clang] )); then
  CONFIG_CLANG="$commands[clang]"
else
  die "no suitable clang was found"
fi

if [[ $OSTYPE == linux* && $CPUTYPE == aarch64 ]]; then
  CONFIG_CROSS_COMPILE_PREFIX=""
elif [[ $$OSTYPE == darwin* ]]; then
  CONFIG_CROSS_COMPILE_PREFIX=aarch64-none-elf-
else
  die "cross compile prefix needed"
fi
