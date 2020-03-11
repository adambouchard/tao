defmodule TaoTest do
  use ExUnit.Case
  doctest Tao

  test "greets the world" do
    assert Tao.hello() == :world
  end
end
