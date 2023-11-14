(add-hook 'prog-mode-hook #'display-line-numbers-mode)
(add-hook 'prog-mode-hook #'hl-line-mode)

(setopt global-auto-revert-non-file-buffers t)
(global-auto-revert-mode)

(savehist-mode)
(recentf-mode)

(electric-pair-mode)

(setopt indent-tabs-mode nil)
(setopt kill-do-not-save-duplicates t)

(set-face-attribute 'default nil :font "JetBrains Mono" :height 100)
(set-face-attribute 'fixed-pitch nil :font "JetBrains Mono" :height 100)
(set-face-attribute 'variable-pitch nil :font "Lexend" :height 100)

(use-package doom-themes
  :config
  (load-theme 'doom-tomorrow-night t)
  (doom-themes-org-config))

(use-package nerd-icons)

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
    "si" 'imenu
    "t" 'vterm
    "T" 'vterm-other-window))

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

(use-package nerd-icons-completion
  :after marginalia
  :init (nerd-icons-completion-mode)
  :hook (marginalia-mode-hook . nerd-icons-completion-marginalia-setup))

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

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

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
            [remap imenu] 'consult-imenu
            [remap goto-line] 'consult-goto-line
            [remap yank-pop] 'consult-yank-pop)
           (minibuffer-local-map "C-r" 'consult-history))

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

(use-package eglot
  :hook ((nix-mode python-mode lua-mode) . eglot-ensure))

(use-package nix-mode
  :mode "\\.nix\\'")

(use-package vterm)
