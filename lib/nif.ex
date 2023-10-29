defmodule Nif do
  @on_load :init

  alias ZigBuilderDemo.Utils

  def init do
    # Workaround for mac
    lib = "./priv/libnif"
    Utils.load_lib(lib)
    :ok = :erlang.load_nif(String.to_charlist(lib), 0)
  end

  def sum(_, _) do
    exit(:nif_library_not_loaded)
  end
end
