;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Emacs builtin configuration

(map! "C-s" '+default/search-buffer
      "C-c k" 'kill-current-buffer
      "C-c s p b" 'switch-to-prev-buffer
      "C-c C-r" 'revert-buffer
      "C-M-v" 'scroll-other-window
      "C-M-c" 'scroll-other-window-down)
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

;;;; org

(with-eval-after-load 'org
  (org-babel-do-load-languages 'org-babel-load-languages '((plantuml . t)))
  (setq! org-startup-with-inline-images t))
(add-hook! 'org-mode-hook 'wordsmith-mode)
(add-hook 'org-mode-hook (lambda() (company-mode -1)))

(use-package! org-brain
  :config
  (map! "C-c o b" 'org-brain-visualize))


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
         doom-nord-region-highlight 'frost)
  (custom-theme-set-faces! 'doom-nord
    '(font-lock-type-face :weight bold)
    '(font-lock-function-name-face :weight bold)
    '(font-lock-variable-name-face :foreground "#88C0D0" :inherit italic)
    '(font-lock-comment-face :foreground "#505966" :inherit italic)
    '(font-lock-builtin-face :foreground "#81a1c1" :weight bold)
    '(font-lock-keyword-face :foreground "#81a1c1" :weight bold :inherit italic)))

;;;; magit

; TODO figure out why company freezes sometimes
; not technically magit, but magit-commit takes you to a Text buffer and company freezes sometimes
(after! magit
  (add-hook 'text-mode-hook (lambda() (company-mode -1))))

;;;; modeline

(setq! +modeline-height 35)
; sometimes the modeline overflows to the right :/
(custom-set-faces!
  '(mode-line :family "Iosevka" :height .91)
  '(mode-line-inactive :family "Iosevka" :height .91))

;;;; tabs

(use-package! centaur-tabs
  :bind
  (("C-9" . centaur-tabs-backward)
   ("C-0" . centaur-tabs-forward)
   ("C-8" . centaur-tabs-switch-group))
  :config
  (centaur-tabs-group-by-projectile-project)
  (setq centaur-tabs-height 35
        centaur-tabs-gray-out-icons nil
        centaur-tabs-set-bar 'under
        x-underline-at-descent-line t
        centaur-tabs-set-close-button nil))

;;;; vc-gutter

(after! git-gutter
  (add-hook! 'magit-post-stage-hook 'git-gutter:update-all-windows)
  (add-hook! 'magit-post-unstage-hook 'git-gutter:update-all-windows))
