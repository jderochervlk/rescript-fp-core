import { defineConfig } from 'vite'
import rescript from '@jihchi/vite-plugin-rescript'

export default defineConfig({
  test: {
     include: "./test/*.mjs",
     reporters: ["basic"],
     bail: 1,
     coverage: {
      reporter: ["json-summary", "json"]
     }
  },
  plugins: [
    rescript(),
  ],
})