defmodule Tao.Serve do
  @moduledoc """
  `Tao.Serve` runs a server to accept tcp/ip requests.  
  
  # to https:// and wss://
  # Note: Toa serve does not allow http by design. (see security)

  runs on Erlang VM.

  see: 
  """
  @moduledoc since: "0.1.0" 


  @doc """
  https

  It requires a 4 digit port assigned 
  ## Examples

    Tao.Serve.https(5000)
    
    This uses elixir recursion to initiate a life cyle of listening, accepting, and responding to incoming requests.

    See: video

  """
  
  @typedoc """
  A 4 digit port address, ie: 4000
  """
  @type port :: integer
  @spec https(port) :: integer
  def https(port), do: https(port, listen(port))
  def https(port, {:ok, lsocket}), do: https(port, {:ok, lsocket}, accept(lsocket))
  def https(port, {:ok, lsocket}, {:ok, socket}), do: https(port, {:ok, lsocket}, {:ok, socket}, recieve(socket))
  def https(port, {:ok, lsocket}, {:ok, socket}, {:ok, data}) do
     
    #TODO -> perform
    respose = data

    send(socket, data)

    #go back and wait for another request
    #TODO - spawn?
    #TEACH -> this is why you doen't need redis
    https(port, {:ok, lsocket}, {:ok, socket})
  end
  def https(port, {:error, error_msg}), do: {:error, error_msg}
  def https(port, _listen, {:error, error_msg}), do: {:error, error_msg}
  def https(port, _listen, _accept, {:error, error_msg}), do: {:error, error_msg}
  def https(port, _), do: {:error, "an error occured in Tao.Serve.https"}

  #inputs: port
  defp accept(lsocket) do
    IO.inspect("ACCEPT")
    #{inspect lsocket}
    :gen_tcp.accept(lsocket)
  end

  defp listen(port) do
    IO.inspect("LISTEN")
    #{inspect port}
    :gen_tcp.listen(port, listen_options())
  end

  @doc """
  listen_options
  options for passing into :gen_tcp.listen
  see: 
  """
  defp listen_options do
    [
      :binary,
      packet: :line,
      active: false,
      reuseaddr: true
    ]
  end

  defp recieve(socket) do
    IO.inspect("RECIEVE")
    #{inspect socket}
    #TODO: https://elixir-lang.org/getting-started/mix-otp/task-and-gen-tcp.html  ( http://erlang.org/doc/man/gen_tcp.html#listen-2 )
    :gen_tcp.recv(socket, 0)
   
  end

  defp send(socket, data) do
    IO.inspect("SEND")
    #{inspect data}
    :gen_tcp.accept(socket, data)
  end

end