return {
  -- rust-analyzer auto-attaches; trim RAM: no cargo check on save, no build-script expansion, no cache priming, 2 threads, small caches
  {
    "mrcjkb/rustaceanvim",
    optional = true,
    opts = {
      server = {
        default_settings = {
          ["rust-analyzer"] = {
            checkOnSave = false,
            procMacro = { enable = true },
            lru = { capacity = 32 },
            files = { watcher = "server" },
            cachePriming = { enable = false },
            numThreads = 2,
            cargo = { buildScripts = { enable = false }, allTargets = false },
          },
        },
      },
    },
  },
}
