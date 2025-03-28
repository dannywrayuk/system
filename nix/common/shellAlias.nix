{
  ls = "ls -G";
  ":q" = "exit";
  "~" = "cd ~";
  ".." = "cd ..";
  "..." = "cd ../..";
  "...." = "cd ../../..";
  "....." = "cd ../../../..";
  vim = "nvim";
  viml = "nvim -c \"'0\"";
  lofi = "open https://www.youtube.com/watch\?v\=jfKfPfyJRdk";

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
  # Add, Commit, Push
  gacp = "git add --all && echo 'Commit Message:' && read message && git commit -m $message && git push";
  gmb = "git main-branch"; # return the main branch
  grm = "git fetch && git rebase -i origin/\$(gmb)"; # Rebase main from origin 
  gcm = "git checkout \$(gmb)"; # Checkout main branch 
  glg = "git log";
}
