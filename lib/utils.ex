defmodule ZigBuilderDemo.Utils do
  @moduledoc """
    Mac specific fix, since as zig builder outputs shared libraries with .dylib extension
    and erlang nif doesn't support it.
  """
  def load_lib(file_path) do
    dylib_file = "#{file_path}.dylib"
    so_file = "#{file_path}.so"

    if File.exists?(dylib_file) do
      File.cp(dylib_file, so_file)
    end
  end
end
