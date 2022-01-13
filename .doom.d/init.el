(doom! :completion
       company
       vertico

       :ui
       (popup +defaults)
       doom
       doom-dashboard
       hl-todo
       indent-guides
       modeline
       vc-gutter
       window-select
       workspaces
       zen

       :editor
       file-templates
       fold
       multiple-cursors
       snippets

       :emacs
       (dired +icons +ranger)
       electric
       ibuffer
       vc

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
       (java +lsp)
       (org +pretty +brain)
       (python +lsp)
       (sh +lsp)
       emacs-lisp
       plantuml

       :config
       (default +bindings +smartparens))
