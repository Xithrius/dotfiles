(defun xithrius/base ()
  
  (setq inhibit-startup-message t)
  (setq require-final-newline t)

  (scroll-bar-mode -1)
  (tool-bar-mode -1)
  (menu-bar-mode -1)
  (tooltip-mode -1)

  (column-number-mode)
  
  (add-hook 'prog-mode-hook 'display-line-numbers-mode)

  (set-face-attribute 'default nil :font "Fira Code:antialias=subpixel:size=13")

  (global-set-key (kbd "<escape>") 'keyboard-escape-quit)

)

(defun xithrius/packages ()
  
  (require 'package)

  (setq package-archives
	'(("melpa" . "https://melpa.org/packages/")
	  ("org" . "https://orgmode.org/elpa/")
	  ("elpa" . "https://elpa.gnu.org/packages/")))

  (package-initialize)
  (unless package-archive-contents
    (package-refresh-contents))

  (unless (package-installed-p 'use-package)
    (package-install 'use-package))

  (eval-when-compile
    (require 'use-package)
    (setq use-package-always-ensure t))

  (require 'diminish)
  (require 'bind-key)

  (diminish 'eldoc-mode)
  (diminish 'auto-revert-mode)

  (xithrius/packages/utils)
  (xithrius/packages/tools)
  (xithrius/packages/themes)

)


(defun xithrius/packages/utils ()

  (use-package evil
    :ensure t
    :init
    (setq evil-want-keybinding nil)
    (setq evil-undo-system 'undo-tree)
    :config
    (evil-mode))
    (evil-set-leader 'normal (kbd "SPC"))
    ;; (evil-define-key 'normal 'global (kbd "<leader>:") 'eval-expression)
    ;; (evil-define-key 'normal 'global (kbd "<leader>;") 'execute-extended-command)
    ;;(evil-define-key 'insert 'global (kbd "M-i") 'evil-force-normal-state)
    ;;(evil-define-key 'normal 'global (kbd "M-i") 'evil-insert))

  (use-package evil-collection
    :after evil
    :demand
    :config (evil-collection-init))

  (use-package evil-snipe
    :diminish evil-snipe-local-mode
    :ensure t
    :after evil
    :init
    (setq evil-snipe-scope 'visible))
    :config
    (evil-snipe-mode 1)

  (use-package dashboard
    :ensure t
    :config
    (dashboard-setup-startup-hook))

  (use-package elcord
    :config (elcord-mode))

)


(defun xithrius/packages/tools ()

  (use-package projectile
    :diminish
    :demand
    :bind ("C-c p" . projectile-command-map)
    :config (projectile-mode +1))

  (use-package magit
    :bind ("C-c g" . magit)
    :config
    (setq git-commit-summary-max-length 50)
    (setq fill-column 72))

  (use-package vterm
    :ensure t)

  (use-package flycheck
    :diminish
    :demand
    :ensure t
    :bind
    ("M-n" . 'flycheck-next-error)
    ("M-p" . 'flycheck-previous-error)
    ("M-l" . 'flycheck-list-errors)
    :init
    (global-flycheck-mode))

  (use-package company
    :diminish
    :ensure t
    :bind ("C-SPC" . 'company-complete)
    :init (global-company-mode))

  (use-package yasnippet
    :ensure t
    :init
    (setq yas-snippet-dirs '("~/.emacs.d/snippets")))

  (use-package lsp-mode
    :init
    (setq lsp-keymap-prefix "C-c v")
    :hook
    (python-mode . lsp)
    (lsp-mode . lsp-enable-which-key-integration)
    :commands lsp)

  (use-package lsp-ui
    :after lsp-mode)

  (use-package lsp-pyright
    :after lsp-mode
    :hook (python-mode . (lambda ()
			   (require 'lsp-pyright)
			   (lsp))))
  (use-package poetry
    :ensure t)
)

(defun xithrius/packages/themes ()

  (use-package base16-theme
    :config (load-theme 'base16-horizon-dark t))

  (use-package emojify
    :hook (after-init . global-emojify-mode))

  (use-package visual-fill-column
    :hook (org-mode . +xithrius/setup-org-filled))

  (use-package ample-theme
    :init
    (load-theme 'ample t t)
    (load-theme 'ample-flat t t)
    (load-theme 'ample-light t t)
    :defer t
    :ensure t)
)


(xithrius/base)
(xithrius/packages)

