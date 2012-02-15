;; PACKAGES
;;--------------------------------------------------

(add-to-list 'load-path "/Users/raghu/.emacs.d")
;; (add-to-list 'load-path "~/emacs")

(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; THIS IS A HACK. WHAT THE FUCK.
(defvar color-themes nil)

(defvar my-packages '(color-theme
                      color-theme-solarized
                      color-theme-wombat
                      color-theme-railscasts
                      color-theme-tango
                      starter-kit
                      starter-kit-lisp
                      starter-kit-bindings
                      starter-kit-ruby
                      starter-kit-eshell
                      go-mode
                      js2-mode
                      clojure-mode
                      clojure-test-mode
                      clojurescript-mode)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; ENVIRONMENT
;;--------------------------------------------------

;; fix the PATH variable
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (shell-command-to-string "$SHELL -i -c 'echo $PATH'")))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(if window-system (set-exec-path-from-shell-PATH))

;; dir to store all extra extensions
(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))

(setq vendor-dir (concat dotfiles-dir "/vendor"))

;; add my vendor dir to load path
(add-to-list 'load-path vendor-dir)

;; CODING STYLES
;;--------------------------------------------------

;; smooth-scrolling stops that annoying jump when moving around
(require 'smooth-scrolling)

;; makes sexps flash when you eval them!
(require 'highlight)
(require 'eval-sexp-fu)

;; use inconsolata
(set-face-attribute 'default nil
                    :family "Inconsolata"
                    :height 160)

;; show line numbers
;; (global-linum-mode t)

;; tabs are 2 spaces
;; (setq-default tab-width 2)
;; (setq-default indent-tabs-mode nil)

;; solarized
;; (eval-after-load 'color-theme
;;   (progn
;;     (require 'color-theme-solarized)
;;     (color-theme-solarized-light)))

(eval-after-load 'color-theme
  (progn
    (require 'color-theme-wombat)
    (color-theme-wombat)))

;; OSX SPECIFIC THINGS
;;--------------------------------------------------

;; fix the command key to be meta
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

;; KEYBINDINGS
;;--------------------------------------------------

(global-set-key [f6] 'magit-status)
(global-set-key [f7] 'ns-toggle-fullscreen)

;; steve yegges's suggested keybindings
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)

(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
;;(global-set-key "\C-c\C-k" 'kill-region)

(global-set-key [f5] 'call-last-kbd-macro)

;; My customizations begin

;; (autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(setq js2-basic-offset 4)
(setq js2-use-font-lock-faces t)

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "/Users/raghu/.emacs.d/ac-dict")
(ac-config-default)

(setq rsense-home (expand-file-name "~/.emacs.d/rsense-0.3"))
(add-to-list 'load-path (concat rsense-home "/etc"))
(add-to-list 'load-path "/Users/raghu/.emacs.d/rsense-0.3/etc")
(require 'rsense)

;; (set-frame-position (selected-frame) 0 20)
(add-to-list 'default-frame-alist '(height . 55))
;; (add-to-list 'default-frame-alist '(width . 200))

(load-file "~/.emacs.d/cedet/common/cedet.el")
(global-ede-mode t)
(semantic-load-enable-code-helpers)
(add-to-list 'load-path "~/.emacs.d/ecb")
(require 'semantic-ia)
(require 'ecb)
(require 'ecb-autoloads)

;;;; Ruby mode
(add-hook 'ruby-mode-hook (lambda ()
			    (define-key ruby-mode-map (kbd "<f1>") 'ri)
			    (define-key ruby-mode-map (kbd "M-C-i") 'ri-ruby-complete-symbol)
			    (define-key ruby-mode-map (kbd "<f4>") 'ri-ruby-show-args)
			    (define-key ruby-mode-map (kbd "C-c C-c") 'xmp)
			    (define-key ruby-mode-map (kbd "C-;") 'comment-dwim)
			    (define-key ruby-mode-map (kbd "C-c C-.") 'ac-complete-rsense)
			    ))

(defadvice comment-dwim (around xmp-hack activate)
  ""
  (if (and (eq last-command 'comment-dwim)
           ;; TODO =>check
           )
      (insert "=>")
    ad-do-it))
;; (progn (ad-disable-advice 'comment-dwim 'around 'xmp-hack) (ad-update 'comment-dwim)) 

(defun xmp ()
  (interactive)
  (let ((line (what-line))
        (col  (current-column)))
    (shell-command-on-region 1 (point-max) (xmp-command) t t)
    (goto-line line)
    (move-to-column col)))

(defun xmp-command ()
  (cond ((save-excursion
           (goto-char 1)
           (search-forward "< Test::Unit::TestCase" nil t))
         "ruby -S xmpfilter.rb --unittest")
        ((save-excursion
           (goto-char 1)
           (re-search-forward "^context.+do$" nil t))
         "ruby -S /Users/raghu/code/xmpfilter-0.3.1/xmpfilter.rb --spec")
        (t
         "ruby -S /Users/raghu/code/xmpfilter-0.3.1/xmpfilter.rb")))

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ecb-layout-window-sizes (quote (("raghu-left3-dir-pref" (0.23255813953488372 . 0.3829787234042553) (0.23255813953488372 . 0.2978723404255319) (0.23255813953488372 . 0.2978723404255319)))))
 '(ecb-layout-name "raghu-left3-dir-pref")
 '(ecb-maximize-ecb-window-after-selection nil)
 '(ecb-options-version "2.40")
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--C-mouse-1))
 '(ecb-source-path (quote (("/Users/raghu/code/tehelka" "tehelka") ("/Users/raghu/code/tmp/thk" "thk") ("/Users/raghu/code/ib/brewcharts" "brewcharts") ("/" "/") ("/Users/raghu/Sites/brewcharts" "brewcharts"))))
 '(ecb-tip-of-the-day nil))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

;; My functions

(defun my-move-line-up ()
  (interactive)
  (move-beginning-of-line nil)
  (kill-line 1)
  (forward-line -1)
  (yank nil)
  (forward-line -1))

(defun my-move-line-down ()
  (interactive)
  (move-beginning-of-line nil)
  (kill-line 1)
  (forward-line 1)
  (yank nil)
  (forward-line -1))
  
(global-set-key (kbd "<M-up>") 'my-move-line-up)
(global-set-key (kbd "<M-down>") 'my-move-line-down)
