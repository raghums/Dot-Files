;; .emacs.d/init.el
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

;; initialize the package infrastructure
(package-initialize)

;; If there are no archived package contents, refresh them
(when (not package-archive-contents)
  (package-refresh-contents))

;; Manage packages using 'use-package'
(eval-when-compile
  (require 'use-package))

;; I use the :bind variant to define bindings, so require bind-key.
(require 'bind-key)

;; ===================================
;; Basic Customization
;; ===================================

;; Hide the startup message
(setq inhibit-startup-message t)    

;; auto-save files in the temp directory.
(setq auto-save-file-name-transforms (\` ((".*" (\, temporary-file-directory) t))))
(setq backup-directory-alist (\` ((".*" \, temporary-file-directory))))

;; Maximize the emacs window on start
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;; Enable line numbers globally
(global-linum-mode t)

;; ====================================
;; Map mac command key to meta
;; ====================================
;;; I prefer cmd key for meta
(setq mac-option-key-is-meta nil
      mac-command-key-is-meta t
      mac-command-modifier 'meta
      mac-option-modifier 'none)

;; ====================================
;; Development Setup
;; ====================================

(require 'subr-x) ;; gets rid of "symbol's function defn is void - string-trim"

(use-package better-defaults
  :ensure t)

(use-package ivy
  :ensure t
  :config
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) ")
  (ivy-mode 1))

(use-package projectile
  :ensure t
  :config
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-mode +1))

(use-package elpy
  :ensure t
  :init
  (elpy-enable)
  :config
  (setq elpy-rpc-virtualenv-path "/Users/raghu/.virtualenvs/elpy"))

(use-package blacken
  :ensure t
  :hook (elpy-mode . blacken-mode)
  :config
  )

(use-package flycheck
  :ensure t
  :hook (elpy-mode . flycheck-mode)
  :config
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (setq flycheck-python-flake8-executable "python3")
  (setq flycheck-python-pycompile-executable "python3")
  (setq flycheck-python-pylint-executable "python3"))

(use-package material-theme
  :ensure t
  :config
  (load-theme 'material t))

(use-package yasnippet-snippets
  :ensure t)

;; User-Defined init.el ends here

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

