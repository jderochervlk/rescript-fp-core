import { defineConfig } from 'vite'
import rescript from '@jihchi/vite-plugin-rescript'

export default defineConfig({
  test: {
     include: "./test/*.mjs",
     reporters: ["tap-flat"]
  },
  plugins: [
    rescript(),
  ],
})