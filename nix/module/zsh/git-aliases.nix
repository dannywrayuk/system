{
  g = "git"; # Git 
  gs = "git status"; # Status 
  gss = "git status -s -b"; # Status short form 
  ga = "git add"; # Add 
  gdp = "git stash -u && git stash drop";
  gaa = "git add --all"; # Add all 
  gc = "git commit"; # Commit 
  gl = "git pull"; # Pull 
  gp = "git push"; # Push 
  gpf = "git push --force"; # Force push 
  gco = "git checkout"; # Checkout 
  gcb = "git checkout -b"; # Checkout new branch 
  gcp = "git -C $PROJ_DIR clone"; # Clone repo into project directory 
  gnuke = "git clean -xdfi"; # Clear all untracked files (interactive) 
  gacp = "git add --all && echo 'Commit Message:' && read message && git commit -m $message && git push"; # Add, Commit, Push
  ggdr = "git rev-parse --abbrev-ref origin/HEAD"; # Get main branch (with remote) 
  ggd = "ggdr | cut -c8-"; # Get main branch 
  grm = "git fetch && git rebase -i \$(ggdr)"; # Rebase main from origin 
  gcm = "git checkout \$(ggd)"; # Checkout main branch 
  glg = "git log";
} 
