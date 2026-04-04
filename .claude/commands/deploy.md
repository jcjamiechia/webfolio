Build and deploy the portfolio website to GitHub Pages.

Follow these steps in order:

1. **Build the Flutter web app** by running:
   ```
   flutter build web --release --base-href "/"
   ```
   If the build fails, show the error to the user and stop.

2. **Copy build output to docs/** by running:
   ```
   cp -r build/web/* docs/
   ```

3. **Stage all changes** (including new assets, updated code, and the docs/ folder) by running:
   ```
   git add -A
   ```

4. **Check if there are changes to commit** by running `git status`. If there are no changes, tell the user "Nothing to deploy — site is already up to date." and stop.

5. **Commit with a deploy message** by running:
   ```
   git commit -m "Deploy site update"
   ```

6. **Push to GitHub** by running:
   ```
   git push origin main
   ```

7. After a successful push, tell the user:
   - The site has been deployed
   - It will be live at: https://jcjamiechia.github.io/webfolio/
   - It may take 1-2 minutes for GitHub Pages to update
