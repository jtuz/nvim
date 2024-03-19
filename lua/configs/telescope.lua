return {
  defaults = {
    preview = {
      timeout = 750,
    },
    layout_strategy = "vertical",
    layout_config = {
      horizontal = {
        prompt_position = "bottom",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = true,
        prompt_position = "top",
        width = 0.7,
        height = 0.95,
        preview_height = 0.6,
        preview_cutoff = 40,
      },
    },
  },
}
