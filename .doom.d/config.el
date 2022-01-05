;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Emacs builtin configuration

(map! "C-s" '+default/search-buffer
      "C-c k" 'kill-current-buffer
      "C-c s p b" 'switch-to-prev-buffer)
(setq! display-line-numbers-type t
      mac-command-modifier 'meta)

;; Doom core configuration

(setq! doom-leader-alt-key "C-d"
      doom-localleader-alt-key "C-d l")

;; Doom module configuration

;;; ui

;;;; doom
(use-package! doom-themes
  :config
  (setq! doom-font (font-spec :family "Iosevka" :size 16)
         doom-variable-pitch-font (font-spec :family "Iosevka" :size 12)
         doom-theme 'doom-tokyo-night
         doom-treemacs-theme 'doom-colors))
(custom-theme-set-faces! 'doom-tokyo-night
  '(font-lock-function-name-face :foreground "#D6BA73" :weight bold)
  ;'(font-lock-function-name-face :foreground "#d55d92" :weight bold)
  '(font-lock-string-face :foreground "#545775")
  '(font-lock-comment-face :foreground "#292D3E" :inherit italic)
  '(font-lock-variable-name-face :foreground "#574AE2" :weight bold)
  '(font-lock-type-face :foreground "#0e9594" :weight bold)
  '(font-lock-keyword-face :foreground "#476C9B" :weight bold)
  '(font-lock-builtin-face :foreground "#476C9B" :inherit italic)
  '(font-lock-warning-face :foreground "#DA667B")
  '(font-lock-constant-face :foreground "#5887FF")
  '(fill-column-indicator :foreground "#13141c")
  '(treemacs-root-face :inherit font-lock-variable-name-face)
  '(doom-themes-treemacs-root-face :inherit font-lock-variable-name-face))

;;;; modeline
(use-package! doom-modeline
  :config
  (setq! doom-modeline-height 40))

;;;; vc-gutter
(use-package! git-gutter
  :config
  (add-hook! 'magit-post-stage-hook 'git-gutter:update-all-windows)
  (add-hook! 'magit-post-unstage-hook 'git-gutter:update-all-windows))

