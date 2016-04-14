defmodule McData.Util do

  def default_version, do: Application.get_env!(:mc_data, :version)

  def mc_data_repo_root do
    to_string(:code.priv_dir(:mc_data)) <> "/minecraft-data"
  end

  def mc_data_root, do: mc_data_repo_root <> "/data"

  def mc_data_ver_root(version) when is_atom(version), do: mc_data_ver_root(to_string(version))
  def mc_data_ver_root(version) when is_binary(version), do: "#{mc_data_root}/#{version}"

  def mc_data_ver_file(version, name) when is_atom(name), do: mc_data_ver_file(version, to_string(name))
  def mc_data_ver_file(version, name) when is_binary(name), do: "#{mc_data_ver_root(version)}/#{name}.json"

  def read_data({version, name}) do
    path = mc_data_ver_file(version, name)
    {:ok, raw_contents} =  File.read(path)
    {:ok, contents} = Poison.Parser.parse(raw_contents)
    contents
  end

end
