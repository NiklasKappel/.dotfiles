function gl --wraps='git log --oneline --graph --all' --description 'alias gl=git log --oneline --graph --all'
  git log --all --graph --oneline $argv

end
