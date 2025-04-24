import { defineConfig, globalIgnores } from "eslint/config";

import globals from "globals";
import js from "@eslint/js";
import pluginReact from "eslint-plugin-react";
import tseslint from "typescript-eslint";

export default defineConfig([
  globalIgnores([
    'dist/',
    'build/',
    '.vscode/',
    '.history/',
    'coverage/',
    'node_modules/',
    "*.config.js", 
    "vendor/"
  ]),
  { files: ["**/*.{ts,jsx,tsx}"], plugins: { js }, extends: ["js/recommended"] },
  { files: ["**/*.{ts,jsx,tsx}"], 
    settings: {
      react: {
        version: "detect",
      },
    },
    languageOptions: { globals: globals.browser } },
  tseslint.configs.recommended,
  pluginReact.configs.flat.recommended,
  pluginReact.configs.flat['jsx-runtime']
]);