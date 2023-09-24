syntax keyword OrgKeyword Contents
syntax keyword OrgKeyword Mantra
syntax keyword OrgKeyword HabitTracker
syntax keyword OrgKeyword Todo
syntax keyword OrgKeyword Chunk
syntax keyword OrgKeyword Heap
syntax keyword OrgKeyword Art
syntax keyword OrgKeyword Problems
syntax keyword OrgKeyword DailyLog

" \zs and \ze are zero-width lookbehind and lookahead statements
syntax match OrgBlock     "\[\zs.*\ze\]"
syntax match OrgDuration  "(\d\+\w\+)"
syntax match OrgRating    "(\d\+\/\d\+)"
syntax match OrgDate      "\d\+\.\d\+\.\d\+"
syntax match OrgTag       "#\w\+"
syntax match OrgTimestamp "\d\+:\d\+.\{-}\d\+:\d\+"

highlight link OrgKeyword   Todo
highlight link OrgBlock     Type
highlight link OrgDuration  Keyword
highlight link OrgRating    Error
highlight link OrgDate      Float
highlight link OrgTag       Label
highlight link OrgTimestamp Tag
