require('luasnip.session.snippet_collection').clear_snippets 'python'

local ls = require 'luasnip'

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require('luasnip.extras.fmt').fmt

ls.add_snippets('python', {
  s('env', { t '#!/usr/bin/env python3' }),
  s(
    'pwn_normal',
    fmt(
      [[
    #!/usr/bin/env python3

    from pwn import *

    io = process('{}')

    payload = '{}'

    io.interactive()
  ]],
      { i(1, 'path to process'), i(2, 'payload') }
    )
  ),
  s(
    'pwn_prolgue',
    fmt(
      [[
  #!/usr/bin/env python3

  from pwn import *

  def conn():
    if args.REMOTE:
      context.update(arch='amd64', os='linux')
      p = remote('{}', {})
    else:
      p = process('{}')
      context.binary = p.elf
    context.terminal = ['tmux', 'split-window']
    return p

  p = conn()

  p.interactive()
  ]],
      { i(1, 'remote address'), i(2, 'remote port'), i(3, 'path to process') }
    )
  ),
  -- TODO: add gdb command snip, which require edit multiple place at same time.
})
