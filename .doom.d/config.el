;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Emacs builtin configuration

(map! "C-s" '+default/search-buffer
      "C-c k" 'kill-current-buffer
      "C-c s p b" 'switch-to-prev-buffer
      "C-c C-r" 'revert-buffer
      "C-M-v" 'scroll-other-window
      "C-M-c" 'scroll-other-window-down
      "C-'" 'goto-line)
(setq! display-line-numbers-type t
       mac-command-modifier 'meta)
(add-hook! 'emacs-startup-hook 'toggle-frame-fullscreen)

;; Doom core configuration

(use-package! projectile
  :bind
  ("C-c p ." . projectile-add-known-project)
  ("C-c p /" . projectile-remove-known-project))
(setq! doom-leader-alt-key "C-d"
       doom-localleader-alt-key "C-d l")

;; Doom module configuration

;;; editor

;;;; snippets

(after! yasnippet
  (map! "C-c l i" 'yas-insert-snippet))

;;; emacs

;;;; dired

(use-package! ranger
  :after dired
  :bind
  ("C-c f d" . ranger)
  :config
  (setq ranger-show-literal t
        ranger-parent-depth 0))

;;; lang

;;;; haskell

(setq-hook! 'haskell-mode-hook +format-with-lsp nil)
(add-hook 'haskell-mode-hook #'format-all-mode)

;;;; java

(after! lsp-java
  (setq! lsp-java-vmargs
         (list
          "-noverify"
          "-Xmx1G"
          "-XX:+UseG1GC"
          "-XX:+UseStringDeduplication"
          (concat "-javaagent:" (getenv "HOME") "/dotfiles/lib/lombok.jar"))))

;;;; python

(use-package! pyvenv
  :after-call python-mode-hook
  :bind
  (:map python-mode-map
   ("C-c l p e a" . pyvenv-activate)))
(use-package! poetry
  :after-call python-mode-hook
  :bind
  (:map python-mode-map
   ("C-c l p p" . poetry)))
(setq-hook! 'python-mode-hook +format-with-lsp nil) ; use the :format module instead of lsp
(add-hook 'python-mode-hook #'format-all-mode)

;;;; org

(with-eval-after-load 'org
  (org-babel-do-load-languages 'org-babel-load-languages '((plantuml . t)))
  (setq! org-startup-with-inline-images t))
(add-hook 'org-mode-hook (lambda() (company-mode -1)))

(use-package! org-brain
  :after-call org-mode-hook
  :config
  (map! "C-c o b" 'org-brain-visualize))

;;; tools

;;;; lsp

(after! lsp-mode
  (setq! lsp-enable-file-watchers nil))

;;;; tmux

(global-set-key (kbd "C-;") '+tmux/run)

;;;; vterm

(after! vterm
  (setq! vterm-shell "/bin/zsh")
  (add-hook 'vterm-mode-hook (lambda() (centaur-tabs-mode -1))))

;;; ui

;;;; doom

; assuming this gets loaded fast anyway so no point in deferring
(use-package! doom-themes
  :config
  (setq! doom-font (font-spec :family "Iosevka" :size 16)
         doom-variable-pitch-font (font-spec :family "Iosevka" :size 12)
         doom-theme 'doom-nord
         doom-nord-region-highlight 'frost))
(custom-theme-set-faces! 'doom-nord
  '(font-lock-variable-name-face :foreground "#f28482" :weight bold)
  '(font-lock-comment-face :foreground "#51587a" :inherit italic)
  '(font-lock-function-name-face :foreground "#88C0D0" :weight bold)
  '(font-lock-type-face :foreground "#8FBCBB" :weight bold)
  '(line-number :foreground "#51587a")
  '(ivy-current-match :inherit region))

;;;; magit

(after! magit
  (add-hook 'text-mode-hook (lambda() (company-mode -1))))

;;;; modeline

(setq! +modeline-height 35)
; sometimes the modeline overflows to the right :/
(custom-set-faces!
  '(mode-line :family "Iosevka" :height .85)
  '(mode-line-inactive :family "Iosevka" :height .85))

;;;; tabs

; same as doom-themes - no point in trying to defer
(use-package! centaur-tabs
  :bind
  (("C-9" . centaur-tabs-backward)
   ("C-0" . centaur-tabs-forward)
   ("C-c \\" . centaur-tabs-toggle-groups))
  :config
  (centaur-tabs-group-by-projectile-project)
  (setq centaur-tabs-height 35
        centaur-tabs-gray-out-icons nil
        centaur-tabs-set-bar 'under
        x-underline-at-descent-line t
        centaur-tabs-set-close-button nil
        centaur-tabs-show-count t))

;;;; vc-gutter

(after! git-gutter
  (add-hook! 'magit-post-stage-hook 'git-gutter:update-all-windows)
  (add-hook! 'magit-post-unstage-hook 'git-gutter:update-all-windows))
