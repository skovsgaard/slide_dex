SlideDex
========

An Elixir server, which takes a list of markdown strings, then compiles them and serves a slide show of the resulting static files.

I hope to library-ize this soon to the point where it can be included as a dependency instead of this, hence the (tentative).

## Usage (tentative)

`git clone` this repo

Edit the list returned by `SlideDex.Slides.slides/0` so that each list entry is a markdown string, e.g.

```markdown
# I'm a header

I'm just the content on the slide
```

Run `mix deps.get`, then `iex -S mix` and then from within IEx:

```elixir
{:ok, server} = SlideDex.start
```
