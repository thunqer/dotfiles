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
       lookup
       lsp
       magit
       tmux

       :os
       (:if IS-MAC macos)
       tty

       :lang
       (python +lsp)
       (sh +lsp)
       emacs-lisp
       (java +lsp)

       :config
       (default +bindings +smartparens))
