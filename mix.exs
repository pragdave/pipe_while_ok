defmodule PipeWhileOk.Mixfile do
  use Mix.Project

  @description File.read!("README.md")
  
  def project do
    [
      app:         :pipe_while_ok,
      version:     "0.0.1",
      elixir:      ">= 1.0.0",
      deps:        []
      description: @description,
      package:     package,
    ]
  end

  def application, do: []

  defp package do
    [
      files:        [ "lib", "mix.exs", "README.md", "LICENSE.md" ],
      contributors: [ "Dave Thomas <dave@pragprog.org>"],
      licenses:     [ "MIT. See LICENSE.md" ],
      links:        %{
                       "GitHub" => "https://github.com/pragdave/pipe_while_ok",
                    }
    ]
  end
    
end
