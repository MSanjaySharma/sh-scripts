#!/bin/bash

project_repo_name=react-debounce

npm install gh-pages --save-dev

# npm set-script predeploy "npm run build" # npm set-script command requires at least npm v7.x
# npm set-script deploy "gh-pages -d dist" # npm set-script command requires at least npm v7.x
npm pkg set scripts.predeploy="npm run build"
npm pkg set scripts.deploy="gh-pages -d dist"

########################################################################
# vite.config.jsonf update
viteConfig="
import { defineConfig } from "vite";
import react from "@vitejs/plugin-react-swc";

// https://vitejs.dev/config/
export default defineConfig({
  base: "/$project_repo_name",
  plugins: [react()],
});

"
echo "$viteConfig" >vite.config.json