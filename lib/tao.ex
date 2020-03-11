defmodule Tao do
  @moduledoc """
  Documentation for `Tao`.

  """

  @doc """
  Starts the Tao API framework
  """
  
  #todo @spec
  def init(%{scheme: :https, host: _host, port: port}) do
    Tao.Serve.https(port)
  end
end
