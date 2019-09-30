path = Path.join(["#{:code.priv_dir(:menu)}", "repo", "seeds"])

Code.require_file("meb.exs", path)
Code.require_file("stol.exs", path)
Code.require_file("example.exs", path)
