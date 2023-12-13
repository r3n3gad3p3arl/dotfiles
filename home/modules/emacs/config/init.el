(add-hook 'prog-mode-hook #'display-line-numbers-mode)
(add-hook 'prog-mode-hook #'hl-line-mode)

(setopt global-auto-revert-non-file-buffers t)
(global-auto-revert-mode)

(savehist-mode)
(recentf-mode)

(electric-pair-mode)

(setopt indent-tabs-mode nil)
(setopt kill-do-not-save-duplicates t)

(setopt treesit-language-source-alist
        '((python "https://github.com/tree-sitter/tree-sitter-python")
          (nix "https://github.com/nix-community/tree-sitter-nix")))

(dolist (lang treesit-language-source-alist)
  (unless (treesit-language-available-p (car lang))
    (treesit-install-language-grammar (car lang))))

(set-face-attribute 'default nil :font "JetBrains Mono" :height 105)
(set-face-attribute 'fixed-pitch nil :font "JetBrains Mono" :height 105)
(set-face-attribute 'variable-pitch nil :font "Lexend" :height 105)

(use-package doom-themes
  :config
  (load-theme 'doom-tomorrow-night t)
  (doom-themes-org-config))

(use-package doom-modeline
  :init (doom-modeline-mode))

(use-package general
  :after evil
  :config
  (general-evil-setup)
  (general-mmap "SPC" nil)
  (general-create-definer meow/leader
    :states 'normal
    :prefix "SPC")
  (meow/leader
    "" nil
    "." 'find-file
    "fe" '(lambda () (interactive) (find-file (expand-file-name "~/.config/nixos/home/modules/emacs/config/init.el")))
    "," 'switch-to-buffer
    "<" 'switch-to-buffer-other-window
    "b[" 'previous-buffer
    "b]" 'next-buffer
    "bk" 'kill-current-buffer
    "bn" 'evil-buffer-new
    "bl" 'evil-switch-to-windows-last-buffer
    "wk" 'delete-window
    "hk" 'describe-key
    "hs" 'describe-symbol
    "hf" 'describe-function
    "hv" 'describe-variable
    "hp" 'describe-package
    "si" 'imenu))

(use-package evil
  :init (evil-mode)
  :custom
  (evil-want-keybinding nil)
  (evil-want-C-i-jump nil)
  (evil-want-Y-yank-to-eol t)
  (evil-undo-system 'undo-redo))
  
(use-package evil-collection
  :after evil
  :init (evil-collection-init))

(use-package evil-nerd-commenter
  :after evil
  :init (evilnc-default-hotkeys))

(use-package nerd-icons)

(use-package nerd-icons-completion
  :after marginalia
  :init (nerd-icons-completion-mode)
  :hook (marginalia-mode-hook . nerd-icons-completion-marginalia-setup))

(use-package nerd-icons-corfu
  :after corfu
  :init (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))

(use-package vertico
  :init
  (defun crm-indicator (args)
    (cons (format "[CRM%s] %s"
                  (replace-regexp-in-string
                   "\\`\\[.*?]\\*\\|\\[.*?]\\*\\'" ""
                   crm-separator)
                  (car args))
          (cdr args)))
  (advice-add #'completing-read-multiple :filter-args #'crm-indicator)
  (vertico-mode)
  :custom (vertico-cycle t))

(use-package vertico-directory
  :after vertico)

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles partial-completion)))))

(use-package marginalia
  :init (marginalia-mode)
  :general (minibuffer-local-map "M-A" 'marginalia-cycle))

(use-package embark
  :general ("C-." 'embark-act
            "M-." 'embark-dwim
            [remap describe-bindings] 'embark-bindings)
           (general-nmap
             "C-." nil
             "M-." nil)
  :custom (prefix-help-command #'embark-prefix-help-command)
  :hook (eldoc-documentation-functions . embark-eldoc-first-target))

(use-package embark-consult
  :hook (embark-collect-mode . consult-preview-at-point-mode))

(use-package consult
  :general ([remap switch-to-buffer] 'consult-buffer
            [remap switch-to-buffer-other-window] 'consult-buffer-other-window
            [remap imenu] 'consult-imenu)
           (minibuffer-local-map "C-r" 'consult-history)
           (meow/leader
             "sl" 'consult-line
             "sg" 'consult-ripgrep
             "sf" 'consult-fd
             "t" 'consult-theme))

(use-package corfu
  :init
  (global-corfu-mode)
  :custom
  (corfu-cycle t)
  (corfu-preselect 'prompt)
  (corfu-auto t)
  (tab-always-indent 'complete)
  :general (corfu-map
            "TAB" 'corfu-next
            [tab] 'corfu-next
            "S-TAB" 'corfu-previous
            [backtab] 'corfu-previous))

(use-package cape
  :init
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-elisp-block))

(use-package yasnippet
  :init (yas-global-mode)
  :config (add-to-list 'completion-at-point-functions #'yasnippet-capf))

(use-package eglot
  :hook ((nix-mode nix-ts-mode python-mode python-ts-mode lua-mode) . eglot-ensure)
  :config (add-to-list 'eglot-server-programs '(nix-ts-mode "nixd")))

(use-package flyspell
  :hook ((text-mode . flyspell-mode)
         (prog-mode . flyspell-prog-mode)))

(use-package vterm
  :general (meow/leader
             "ot" 'vterm
             "oT" 'vterm-other-window))

(use-package nix-mode
  :mode "\\.nix\\'")

(use-package nix-ts-mode
  :init (add-to-list 'major-mode-remap-alist '(nix-mode . nix-ts-mode)))

(use-package python
  :init (add-to-list 'major-mode-remap-alist '(python-mode . python-ts-mode)))

(use-package org
  :hook (org-mode . visual-line-mode)
  :custom
  (org-return-follows-link t)
  (org-hide-emphasis-markers t)
  (org-startup-indented t)
  (org-pretty-entities t)
  (org-startup-with-inline-images t)
  (org-image-actual-width '(300))
  :config
  (set-face-attribute 'org-document-title nil :height 1.3)
  (set-face-attribute 'org-level-1 nil :height 1.3)
  (set-face-attribute 'org-level-2 nil :height 1.1)
  (set-face-attribute 'org-level-3 nil :height 1.1)
  (set-face-attribute 'org-level-4 nil :height 1.1)
  (set-face-attribute 'org-level-5 nil :height 1.1)
  (set-face-attribute 'org-level-6 nil :height 1.1)
  (set-face-attribute 'org-level-7 nil :height 1.1)
  (set-face-attribute 'org-level-8 nil :height 1.1))

(use-package org-appear
  :hook (org-mode . org-appear-mode)
  :custom
  (org-appear-autolinks t)
  (org-appear-autosubmarkers t)
  (org-appear-autoentities t))

(use-package olivetti
  :hook (org-mode . olivetti-mode))

(use-package mixed-pitch
  :hook (org-mode . mixed-pitch-mode)
  :config
  (add-to-list 'mixed-pitch-fixed-pitch-faces 'org-date)
  (add-to-list 'mixed-pitch-fixed-pitch-faces 'org-footnote)
  (add-to-list 'mixed-pitch-fixed-pitch-faces 'org-special-keyword)
  (add-to-list 'mixed-pitch-fixed-pitch-faces 'org-property-value)
  (add-to-list 'mixed-pitch-fixed-pitch-faces 'org-ref-cite-face)
  (add-to-list 'mixed-pitch-fixed-pitch-faces 'org-tag)
  (add-to-list 'mixed-pitch-fixed-pitch-faces 'org-todo)
  (add-to-list 'mixed-pitch-fixed-pitch-faces 'org-done)
  (add-to-list 'mixed-pitch-fixed-pitch-faces 'font-lock-comment-face))
