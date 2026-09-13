# Verdigris Markdown Sample

Lorem ipsum dolor sit amet, **consectetur adipiscing elit**, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. `Inline code` should stand
out without becoming neon.

## Palette Intent

- Frequent colors: moss, fern, aqua, teal, desaturated blue.
- Sparse accents: yellow, orange, red, purple.
- Background: warm dark, gruvbox-adjacent, but cooler and greener.

> Blockquotes should feel calm and readable. They are a good place to check
> dim foreground contrast and punctuation colors.

### Code Fence

```lua
local colors = {
  green = "#a7c080",
  teal = "#7fbbb3",
  warning = "#d8a657",
  error = "#e67e80",
}

if colors.green then
  print("verdant")
end
```

### Table

| Role | Color family | Frequency |
| --- | --- | --- |
| Strings | moss/green | high |
| Functions | teal | high |
| Warnings | yellow | low |
| Errors | red | low |

[Example link](https://neovim.io/) and some trailing prose for wrapping tests.
