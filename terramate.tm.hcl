terramate {
  config {
    git {
      default_remote = "origin"
      default_branch = "main"

      check_untracked   = false
      check_uncommitted = false
      check_remote      = false
    }

    # run {
    #   env {
    #     TF_PLUGIN_CACHE_DIR = "${terramate.root.path.fs.absolute}/.tf_plugin_cache_dir"
    #   }
    # }
  }
}
