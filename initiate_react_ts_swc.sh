#!/bin/bash

project_name=react-debounce
github_username=MSanjaySharma
github_default_branch_name=main
git_name=sanjay
git_email=sanjay98.sharma@gmail.com
git clone git@github.com:$github_username/$project_name.git
cd "${project_name}"

########################################################################
# GIT
git config user.name "$git_name"
git config user.email "$git_email"
git switch --orphan $github_default_branch_name
git commit --allow-empty -m "initial-commit"
git push origin $github_default_branch_name
git checkout -b "initial-setup"

########################################################################
# VITE SETUP - react typescript SWC

npm create vite@latest . -- --template react-swc-ts
npm install

########################################################################
# ESLINT

npm install eslint-config-prettier --save-dev
npm install eslint eslint-plugin-react --save-dev

eslint_config='
module.exports = {
  root: true,
  env: { browser: true, es2020: true },
  extends: [
    "eslint:recommended",
    "plugin:@typescript-eslint/recommended-type-checked",
    "plugin:react-hooks/recommended",
    "plugin:react/recommended",
    "plugin:react/jsx-runtime",
    "prettier",
  ],
  ignorePatterns: ["dist", ".eslintrc.cjs"],
  parserOptions: {
    ecmaVersion: "latest",
    sourceType: "module",
    project: ["./tsconfig.json", "./tsconfig.node.json"],
    tsconfigRootDir: __dirname,
   },
  parser: "@typescript-eslint/parser",
  plugins: ["react-refresh"],
  rules: {
    "react-refresh/only-export-components": [
      "warn",
      { allowConstantExport: true },
    ],
  },
};
'
echo "$eslint_config" >.eslintrc.cjs

########################################################################
# PRETTIER
npm install prettier --save-dev

prettier_config='
{
  "trailingComma": "es5",
  "singleQuote": false
}
'

echo "$prettier_config" >.prettierrc.json

########################################################################
# public folder
cd public

rm vite.svg

base_svg='
<svg width="800px" height="800px" viewBox="0 0 1024 1024" class="icon"  version="1.1" xmlns="http://www.w3.org/2000/svg">
  <path d="M509.8 139.7l190.5 109.6 0.2 196.5 173.2 99.7 0.2 219.8-190.2 110.1-172.4-99.2-171.5 99.2-190.5-109.6-0.2-219.9 170.7-98.8-0.3-197.3z" fill="#FFFFFF" />
  <path d="M520 527.5V365l-10 5.8-10-5.8v162.2l10.3 5.9zM339.5 666.9l-10-5.7v162.1l10.3 5.9 9.7-5.6V661.2zM693.4 823.6V661.2l-2 1.1c-1.6 0.9-3.3 1.3-5 1.3-3.5 0-6.8-1.8-8.7-5-2.5-4.3-1.4-9.6 2.2-12.7-3.8 1.4-6.6 5.1-6.6 9.4v167.9l10.3 5.9 9.8-5.5z" fill="#06F3FF" />
  <path d="M825.1 563.7l8.4 4.8c-1.9-3.1-5.1-4.8-8.4-4.8zM833.7 568.9v9.5c1.6-2.9 1.7-6.5 0-9.5zM656.7 628.5l-8.7-5c-4.8-2.8-10.9-1.1-13.7 3.7-2.8 4.8-1.1 10.9 3.7 13.7l8.7 5c1.6 0.9 3.3 1.3 5 1.3 3.5 0 6.8-1.8 8.7-5 2.7-4.8 1.1-10.9-3.7-13.7zM613.3 603.6l-8.7-5c-4.8-2.8-10.9-1.1-13.7 3.7-2.8 4.8-1.1 10.9 3.7 13.7l8.7 5c1.6 0.9 3.3 1.3 5 1.3 3.5 0 6.8-1.8 8.7-5 2.8-4.8 1.1-10.9-3.7-13.7z" fill="#005BFF" />
  <path d="M833.6 568.7c0-0.1-0.1-0.1-0.1-0.2l-8.4-4.8c-1.8 0-3.5 0.4-5.2 1.3l-8.7 5c-4.8 2.8-6.4 8.9-3.7 13.7 1.9 3.2 5.2 5 8.7 5 1.7 0 3.4-0.4 5-1.3l8.7-5c1.7-1 2.9-2.3 3.8-3.9V569c0-0.2-0.1-0.3-0.1-0.3zM690 640l-8.7 5c-0.5 0.3-1 0.6-1.4 1-3.7 3.1-4.7 8.4-2.2 12.7 1.9 3.2 5.2 5 8.7 5 1.7 0 3.4-0.4 5-1.3l2-1.1 6.7-3.9c4.8-2.8 6.4-8.9 3.7-13.7-2.9-4.8-9-6.5-13.8-3.7zM570 578.7l-8.7-5c-4.8-2.8-10.9-1.1-13.7 3.7-2.8 4.8-1.1 10.9 3.7 13.7l8.7 5c1.6 0.9 3.3 1.3 5 1.3 3.5 0 6.8-1.8 8.7-5 2.7-4.8 1-11-3.7-13.7zM776.6 590l-8.7 5c-4.8 2.8-6.4 8.9-3.7 13.7 1.9 3.2 5.2 5 8.7 5 1.7 0 3.4-0.4 5-1.3l8.7-5c4.8-2.8 6.4-8.9 3.7-13.7-2.8-4.8-8.9-6.5-13.7-3.7zM733.3 615l-8.7 5c-4.8 2.8-6.4 8.9-3.7 13.7 1.9 3.2 5.2 5 8.7 5 1.7 0 3.4-0.4 5-1.3l8.7-5c4.8-2.8 6.4-8.9 3.7-13.7-2.8-4.8-8.9-6.5-13.7-3.7z" fill="#005BFF" />
  <path d="M873.7 545.5l-173.2-99.7-0.2-196.5-190.5-109.6-190.3 110.1 0.2 197.3L149 546l0.3 219.8 190.5 109.7 171.4-99.3 172.4 99.3 190.2-110.1-0.1-219.9zM509.8 185.9l140.4 80.8-140.3 81L369.5 267l140.3-81.1zM339.3 482l140.4 80.8-140.3 81L199 563.1 339.3 482z m10.2 341.6l-9.7 5.6-10.3-5.9-140.2-80.7-0.2-162.1 140.4 80.7 10 5.8 10-5.8 140.4-81 0.2 162.1-140.6 81.3z m160.8-290.5l-10.3-5.9-140.2-80.7-0.2-162.1L500 365l10 5.8 10-5.8 140.4-81 0.2 162.1L520 527.5l-9.7 5.6z m323.6 209.1l-140.6 81.4-9.7 5.6-10.3-5.9-140.2-80.7L533 569l150.3-87 141.9 81.7c3.3 0.1 6.6 1.8 8.4 4.8l0.2 0.1v0.3c1.7 3.1 1.6 6.7 0 9.5l0.1 163.8z" fill="#005BFF" />
</svg>
'
echo "$base_svg" >base.svg

cd ..

########################################################################
# README
readme="
### $project_name
"

echo "$readme" >README.md

########################################################################
# index.html
indexHTML="
<!doctype html>
<html lang=\"en\">
  <head>
    <meta charset=\"UTF-8\" />
    <link rel=\"icon\" type=\"image/svg+xml\" href=\"/base.svg\" />
    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />
    <title>$project_name</title>
  </head>
  <body>
    <div id=\"root\"></div>
    <script type=\"module\" src=\"/src/main.tsx\"></script>
  </body>
</html>
"
echo "$indexHTML" >index.html

########################################################################
# SRC
cd src

rm -rf assets
rm App.css

indexCss="
body {
  font-family: Inter, system-ui, Avenir, Helvetica, Arial, sans-serif;
  margin: 0;
  padding: 0;
  background-color: #f0f0f0;

  font-synthesis: none;
  text-rendering: optimizeLegibility;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  -webkit-text-size-adjust: 100%;
}
"
echo "$indexCss" >index.css

appComponent='
import baseLogo from "/base.svg";
import "./App.css";

function App() {
  return (
    <div className="center-container">
      <div>
        <a href="https://react.dev" rel="noreferrer" target="_blank">
          <img src={baseLogo} className="logo" alt="Base logo" />
        </a>
      </div>
      <h1>GXP</h1>
    </div>
  );
}

export default App;
'
echo "$appComponent" >App.tsx

appCss='
.center-container {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  height: 100vh;
}

.logo {
  width: 200px;
  height: 200px;
}
'
echo "$appCss" >App.css

cd ..
########################################################################
# .lintstagedrc.json # https://github.com/okonet/lint-staged#configuration
lintstagedrcConfig='
{
  "*.{js,jsx,json,yml,yaml,html,md,css}": ["prettier --write"],
  "*.{ts,tsx}": ["eslint --cache --fix", "prettier --write"]
}
'
echo "$lintstagedrcConfig" >.lintstagedrc.json
echo ".eslintcache" >>.gitignore

########################################################################
# precommit hooks husky + lint-staged
npx husky install
# npm set-script prepare "husky install" # npm set-script command requires at least npm v7.x
npm pkg set scripts.prepare="husky install"
npx husky add .husky/pre-commit "npx lint-staged"

########################################################################
# run prettier
npx prettier --write .
