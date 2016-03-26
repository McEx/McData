defmodule McData.Protocol do

  versions_protocol = McData.Versions.versions
  |> Enum.map(fn version ->
    proto = McData.Versions.version_file({version, :protocol})
    {version, proto}
  end)
  |> Enum.into(%{})

  def protocol_data do
    protocol_data(McData.Util.default_version)
  end
  Enum.map(versions_protocol, fn {version, data} ->
    def protocol_data(unquote(version)), do: unquote(Macro.escape(data))
  end)

end
