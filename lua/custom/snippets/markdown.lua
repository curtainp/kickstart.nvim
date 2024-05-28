require('luasnip.session.snippet_collection').clear_snippets 'markdown'

local ls = require 'luasnip'

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require('luasnip.extras.fmt').fmt

ls.add_snippets('markdown', {
  s(
    'code',
    fmt(
      [[``` {}
{}
```]],
      { i(1, 'language'), i(2, 'code here') }
    )
  ),
  s('c', fmt([[`{}`]], i(1))),
  s('b', fmt([[**{}**]], i(1))),
  s('i', fmt([[*{}*]], i(1))),
  s('bq', fmt([[> {}]], i(1))),
  s(
    'line',
    fmt(
      [[---

{}]],
      i(1)
    )
  ),
})
