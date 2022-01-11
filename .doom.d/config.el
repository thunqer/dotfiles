;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Emacs builtin configuration

(map! "C-s" '+default/search-buffer
      "C-c k" 'kill-current-buffer
      "C-c s p b" 'switch-to-prev-buffer)
(setq! display-line-numbers-type t
       mac-command-modifier 'meta)
(add-hook! 'emacs-startup-hook 'toggle-frame-fullscreen)

;; Doom core configuration

(setq! doom-leader-alt-key "C-d"
       doom-localleader-alt-key "C-d l")

;; Doom module configuration

;;; lang

;;;; java

(after! lsp-java
  (setq! lsp-java-vmargs
         (list
          "-noverify"
          "-Xmx1G"
          "-XX:+UseG1GC"
          "-XX:+UseStringDeduplication"
          (concat "-javaagent:" (getenv "HOME") "/dotfiles/lib/lombok.jar"))))

;;;; plantuml

(with-eval-after-load 'org
  (org-babel-do-load-languages 'org-babel-load-languages '((plantuml . t)))
  (setq! org-startup-with-inline-images t))
(add-hook! 'org-mode-hook 'wordsmith-mode)

;;; tools

;;;; lsp

(after! lsp-mode
  (setq! lsp-enable-file-watchers nil))

;;;; vterm

(after! vterm
  (setq! vterm-shell "/bin/zsh"))

;;; ui

;;;; doom
(use-package! doom-themes
  :config
  (setq! doom-font (font-spec :family "Iosevka" :size 16)
         doom-variable-pitch-font (font-spec :family "Iosevka" :size 12)
         doom-theme 'doom-nord
         doom-treemacs-theme 'doom-colors)
  (custom-theme-set-faces! 'doom-nord
    '(font-lock-type-face :weight bold)
    '(font-lock-function-name-face :weight bold)
    '(font-lock-variable-name-face :foreground "#88C0D0" :inherit italic)
    '(font-lock-comment-face :foreground "#505966" :inherit italic)
    '(font-lock-builtin-face :foreground "#81a1c1" :weight bold)
    '(font-lock-keyword-face :foreground "#81a1c1" :weight bold :inherit italic)))

;;;; modeline
(use-package! doom-modeline
  :config
  (setq! doom-modeline-height 40))

;;;; vc-gutter
(after! git-gutter
  (add-hook! 'magit-post-stage-hook 'git-gutter:update-all-windows)
  (add-hook! 'magit-post-unstage-hook 'git-gutter:update-all-windows))
