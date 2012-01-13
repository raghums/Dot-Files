(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(abbrev-mode nil)
 '(ecb-layout-name "raghu-left3-dir-pref")
 '(ecb-layout-window-sizes (quote (("raghu-left3-dir-pref" (0.205 . 0.38) (0.205 . 0.3) (0.205 . 0.3)))))
 '(ecb-maximize-ecb-window-after-selection nil)
 '(ecb-options-version "2.40")
 '(ecb-primary-secondary-mouse-buttons (quote mouse-1--C-mouse-1))
 '(ecb-source-path (quote (("/Users/raghu/code/tehelka" "tehelka") ("/Users/raghu/code/tmp/thk" "thk") ("/Users/raghu/code/ib/brewcharts" "brewcharts") ("/" "/") ("/Users/raghu/Sites/brewcharts" "brewcharts"))))
 '(ecb-tip-of-the-day nil)
 '(frame-title-format "%f" t)
 '(ido-everywhere t)
 '(ido-mode (quote (quote both)) nil (ido))
 '(markdown-command "markdown | smartypants")
 '(menu-bar-mode nil)
 '(nxml-slash-auto-complete-flag t)
 '(org-agenda-files (quote ("~/code/ib/bc/scripts/todos.org" "~/org/chores.org")))
 '(org-babel-load-languages (quote ((emacs-lisp . t) (ditaa . t) (ruby . t))))
 '(org-modules (quote (org-bbdb org-bibtex org-docview org-gnus org-info org-jsinfo org-habit org-irc org-mew org-mhe org-rmail org-vm org-wl org-w3m)))
 '(ruby-electric-expand-delimiters-list (quote (123)))
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(tramp-default-user "raghuram")
 '(transient-mark-mode 1)
 '(weblogger-config-alist (quote (("Wordpress" "http://raghums.wordpress.com/xmlrpc.php" "raghums" "" "11366796")))))

(add-to-list 'load-path "/Users/raghu/emacs/color-theme-6.6.0")
(require 'color-theme)

(add-to-list 'load-path "~/emacs")
(require 'idle-highlight)

(require 'deft)
;; (setq deft-extension "txt") (setq deft-directory "~/Dropbox/notes")
;; (setq deft-text-mode 'markdown-mode)

(require 'zenburn)
(zenburn)

;; (add-to-list 'load-path "/Users/raghu/emacs/org-mode/lisp")
(require 'org-install)
;; (setq org-todo-keywords '((sequence "TODO(t)" "STARTED(s)" "WAITING(w)" "|" "DONE(d)" "CANCELED(c)")))
(setq org-todo-keywords '((sequence "TODO(t)" "IN_PROGRESS" "WAITING(w@/!)" "|" "DONE(d!)" "CANCELED(c@)")))
(setq org-clock-persist 'history)
;;(org-clock-persistence-insinuate)
;; (setq org-tag-alist '(("/Users/raghu/code/tmp/thk/todos.org" . "home(h) work(w)")))
(setq org-log-done 'time)
;;(setq org-log-done 'note)
(setq org-mobile-directory "~/Dropbox/MobileOrg")

(setq remember-annotation-functions '(org-remember-annotation))
(setq remember-handler-functions '(org-remember-handler))
(add-hook 'remember-mode-hook 'org-remember-apply-template)
;; (org-remember-insinuate)
(setq org-directory "~/org/")
(setq org-default-notes-file (concat org-directory "/notes.org"))
(global-set-key "\C-cr" 'org-remember)

(setq org-remember-templates 
      '(("Todo" ?t "* TODO %?\n %i\n %a" "~/org/TODO.org" "Tasks") 
	("Journal" ?j "* %U %?\n\n %i\n %a" "~/org/JOURNAL.org") 
	("Idea" ?i "* %^{Title}\n %i\n %a" "~/org/JOURNAL.org" "New Ideas")))



(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(setq js2-basic-offset 4)
(setq js2-use-font-lock-faces t)


(require 'xml-rpc)
(require 'weblogger)

(set-frame-position (selected-frame) 0 20)
(add-to-list 'default-frame-alist '(height . 55))
(add-to-list 'default-frame-alist '(width . 200))

(add-to-list 'load-path "/Users/raghu/emacs/markdown-mode")
(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)
(setq auto-mode-alist
      (cons '("\\.md" . markdown-mode) auto-mode-alist))

(require 'markdown-mode)

(require 'rvm)
(require 'rcodetools)
;;(rvm-use-default) ;; use rvm's default ruby for the current Emacs session

;(autoload 'rtf-mode "rtf-mode" "RTF mode" t)
;(add-to-list 'auto-mode-alist '("\\.rtf$" . rtf-mode))
 
(load-file "~/emacs/cedet/common/cedet.el")
(global-ede-mode t)
(semantic-load-enable-code-helpers)
(require 'semantic-ia)
(add-to-list 'load-path "~/emacs/ecb")
(require 'ecb)
(require 'ecb-autoloads)

;; Overwrite Ruby mode already loaded in emacs 23
(autoload 'ruby-mode "ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))

(autoload 'run-ruby "inf-ruby" "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby" "Set local key defs for inf-ruby in ruby-mode")
(add-hook 'ruby-mode-hook '(lambda ()(inf-ruby-keys)))

;; just load ruby electric
;;(require 'ruby-electric)

(require 'anything)

;; (setq ri-ruby-script "/Users/raghu/emacs/ri-emacs/ri-emacs.rb")
;; (autoload 'ri "/Users/raghu/emacs/ri-emacs/ri-ruby.el" nil t)
;; (load-file "~/emacs/ri-emacs/ri-ruby.el")
(require 'yari)


(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "/Users/raghu/emacs/ac-dict")
(ac-config-default)

(setq rsense-home (expand-file-name "~/code/rsense-0.3"))
(add-to-list 'load-path (concat rsense-home "/etc"))
(add-to-list 'load-path "/Users/raghu/code/rsense-0.3/etc")
(require 'rsense)

;; ;; Rinari
;; ;;(add-to-list 'load-path "~/emacs/rinari")
;; ;;(require 'rinari)
;; (require 'haml-mode)
;; (require 'sass-mode)
;; ;; (require 'scss-mode)
;; ;; (setq exec-path (cons (expand-file-name "/usr/bin/sass") exec-path))

;; ;; test case mode
;; (require 'fringe-helper)
;; (require 'flymake)
;; (autoload 'test-case-mode "test-case-mode" nil t)
;; (autoload 'enable-test-case-mode-if-test "test-case-mode")
;; (autoload 'test-case-find-all-tests "test-case-mode" nil t)
;; (autoload 'test-case-compilation-finish-run-all "test-case-mode")
;; (add-hook 'find-file-hook 'enable-test-case-mode-if-test)
;; (add-hook 'compilation-finish-functions 'test-case-compilation-finish-run-all)

;; ;; tempo snippets
;; (add-hook 'compilation-finish-functions 'test-case-compilation-finish-run-all)


;; ;; windows numbering
;; (require 'window-numbering)
;; (window-numbering-mode 1)
;; (custom-set-faces
;;   ;; custom-set-faces was added by Custom.
;;   ;; If you edit it by hand, you could mess it up, so be careful.
;;   ;; Your init file should contain only one such instance.
;;   ;; If there is more than one, they won't work right.
;;  )

(add-hook 'ruby-mode-hook (lambda ()
			    (define-key ruby-mode-map (kbd "<f1>") 'ri)
			    (define-key ruby-mode-map (kbd "M-C-i") 'ri-ruby-complete-symbol)
			    (define-key ruby-mode-map (kbd "<f4>") 'ri-ruby-show-args)
			    (define-key ruby-mode-map (kbd "C-c C-c") 'xmp)
			    (define-key ruby-mode-map (kbd "C-;") 'comment-dwim)
			    (define-key ruby-mode-map (kbd "C-c C-.") 'ac-complete-rsense)
			    ))

;; Save all backup file in this directory.
(setq backup-directory-alist (quote ((".*" . "~/emacs/backups/"))))


(server-start)
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(require 'rect-mark)
(global-set-key (kbd "C-x r C-SPC") 'rm-set-mark)
(global-set-key (kbd "C-x r C-x") 'rm-exchange-point-and-mark)
(global-set-key (kbd "C-x r C-w") 'rm-kill-region)
(global-set-key (kbd "C-x r M-w") 'rm-kill-ring-save)
(global-set-key (kbd "C-x r i") 'string-insert-rectangle)
(autoload 'rm-set-mark "rect-mark"
  "Set mark for rectangle." t)
(autoload 'rm-exchange-point-and-mark "rect-mark"
  "Exchange point and mark for rectangle." t)
(autoload 'rm-kill-region "rect-mark"
  "Kill a rectangular region and save it in the kill ring." t)
(autoload 'rm-kill-ring-save "rect-mark"
  "Copy a rectangular region to the kill ring." t)
(put 'downcase-region 'disabled nil)

(put 'narrow-to-defun 'disabled nil)

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
