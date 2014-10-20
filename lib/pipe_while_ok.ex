defmodule PipeWhileOk do

  defmacro __using__(_) do
    quote do
      import  unquote(__MODULE__)
    end
  end

  @doc File.read!("README.md")

  defmacro pipe_while_ok(do: pipes) do
    _pipe_while_ok(pipes)
  end

  defp _pipe_while_ok(pipes) do
    [{h,_}|t] = Macro.unpipe(pipes)
    Enum.reduce t, h, &(reduce_matching(&1, &2))
  end

  defp reduce_matching({next_function, pos}, acc) do
    quote do
      case unquote(acc) do
        {:ok, val} -> unquote(Macro.pipe(quote(do: val), next_function, pos))
        error      -> error
      end
    end
  end

end
