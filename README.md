# Tube

Tube charging system. Exploring processes in Elixir.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `tube` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:tube, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc) and published on [HexDocs](https://hexdocs.pm). Once published, the docs can be found at [https://hexdocs.pm/tube](https://hexdocs.pm/tube).

## Notes

### Compilation

```sh
mix compile
mix escript.build
```

### Run tests

```sh
mix test
```

### Run code

```sh
./tube
```

### Run console

```sh
iex -S mix
```



### Questions

* would I have a separate Registry for every "type" of stored thing?
* do I pass that registry around?
* when do I use `Agent` and when do I use `GenServer`?
* are supervisors really necessary in the beginning?