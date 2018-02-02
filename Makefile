default:
	mix compile
	mix escript.build

test:
	mix test

console:
	iex -S mix
