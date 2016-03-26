defmodule McData.Versions do

  @versions McData.Util.read_data({:common, :versions})
  def versions, do: @versions

  def version_file({version, name}) when version in @versions do
    McData.Util.read_data({version, name})
  end

end
