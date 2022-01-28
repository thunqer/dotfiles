(doom! :completion
       (company +childframe)
       (ivy +fuzzy +prescient +childframe +icons)

       :ui
       (popup +defaults)
       doom
       hl-todo
       indent-guides
       (modeline +light)
       vc-gutter
       window-select
       zen
       tabs

       :editor
       file-templates
       fold
       format
       multiple-cursors
       snippets

       :emacs
       (dired +icons +ranger)
       electric
       ibuffer

       :term
       vterm

       :checkers
       syntax

       :tools
       (debugger +lsp)
       (eval +overlay)
       lookup
       lsp
       magit
       pdf
       tmux

       :os
       (:if IS-MAC macos)
       tty

       :lang
       (haskell +lsp)
       (java +lsp)
       (org +pretty +brain)
       (python +lsp +pyright +poetry)
       (sh +lsp)
       emacs-lisp
       javascript
       json
       plantuml
       yaml

       :config
       (default +bindings +smartparens))
