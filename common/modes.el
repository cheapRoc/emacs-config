;;;; modes --- minor and major mode loading
;;

;;;;
;; minor
;;

(require 'magit)
(require 'ack)
(require 'rainbow-mode)
(require 'textmate)
(require 'jekyll)
(require 'scala-mode-auto)
(require 'gist)
(textmate-mode)

;;;;
;; major - autoloads
;;

(if (boundp 'erlang-tools)
    (progn
      (autoload 'erlang-mode "erlang.el" "" t)
      (add-to-list 'auto-mode-alist '("\\.erl$" . erlang-mode))))

(add-to-list 'auto-mode-alist '("COMMIT_EDITMSG$" . diff-mode))

(autoload 'markdown-mode "markdown-mode.el" "" t)
(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))

(autoload 'feature-mode "feature-mode" "" t)
(add-to-list 'auto-mode-alist '("\\.feature$" . feature-mode))

(autoload 'haml-mode "haml-mode" "" t)
(add-to-list 'auto-mode-alist '("\\.haml$" . haml-mode))

(autoload 'sass-mode "sass-mode" "" t)
(add-to-list 'auto-mode-alist '("\\.sass$" . sass-mode))

(autoload 'yaml-mode "yaml-mode" "" t)
(add-to-list 'auto-mode-alist '("\\.ya?ml$" . yaml-mode))

(autoload 'js2-mode "js2" "" t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.j$" . objc-mode))

(add-to-list 'auto-mode-alist '("\\.m$" . objc-mode))
(add-to-list 'auto-mode-alist '("\\.h$" . objc-mode))

(autoload 'espresso-mode "espresso")

(autoload 'coffee-mode "coffee-mode")
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))

(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-hook 'eshell-mode-hook 'ansi-color-for-comint-mode-on)

(autoload 'cheat "cheat" "" t)
(autoload 'lisppaste-paste-region "lisppaste" "" t)

(autoload 'treetop-mode "treetop-mode")
(add-to-list 'auto-mode-alist '("\\.tt$" . treetop-mode))

(autoload 'paredit-mode "paredit"
  "Minor mode for pseudo-structurally editing Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       (lambda () (paredit-mode +1)))
(add-hook 'lisp-mode-hook             (lambda () (paredit-mode +1)))
(add-hook 'lisp-interaction-mode-hook (lambda () (paredit-mode +1)))
(add-hook 'nu-mode-hook               (lambda () (enable-paredit-mode)))

(require 'sws-mode)
(require 'jade-mode)
(add-to-list 'auto-mode-alist '("\\.styl$" . sws-mode))
(add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))

(add-to-list 'auto-mode-alist '("\\.scss$" . css-mode))

(require 'nu)

;;;;
;; coffee-script
;;

(defun coffee-custom ()
  "coffee-mode-hook"
  (set (make-local-variable 'tab-width) 2))

(add-hook 'coffee-mode-hook
          '(lambda() (coffee-custom)))

;;;;
;; ibuffer
;;

(require 'ibuffer)

(setq ibuffer-saved-filter-groups
      '(("defaults"
         ("cocoa" (filename . "\\Cocoa"))
         ("tj" (filename . "\\tj"))
         ("el" (filename . "\\elocal.*"))
         ("opinion-trac" (filename . "\\opinion-trac"))
         ("mhh" (filename . "\\mhh"))
         ("conhar" (filename . "\\conhar"))
         ("cardboard" (filename . "\\cardboard"))
         ("crimescheme" (filename . "\\cheapRoc\.github\.com"))
	 ("conf" (or (filename . "\.emacs\.d")
                     (filename . "emacs-config")))
	 ("org" (or (mode . org-mode)
		    (filename . "OrgMode")))
	 ("irc" (mode . erc-mode))
         ("emacs" (or
                 (name . "^\\*scratch\\*$")
                 (name . "^\\*Messages\\*$")))
         ("db" (or (name . "\\*SQL\\*")
                   (filename . "\*sql\*")))
	 ("help" (or (name . "\*Help\*")
		     (name . "\*Apropos\*")
		     (name . "\*info\*"))))))

(add-hook 'ibuffer-mode-hook 
	  '(lambda ()
             (ibuffer-auto-mode 1)
             (setq ibuffer-expert 1)
             (setq ibuffer-show-empty-filter-groups nil)
	     (ibuffer-switch-to-saved-filter-groups "defaults")))

;;;;
;; yasnippet
;;

(require 'yasnippet)
(setq yas/root-directory (concat dotfiles-dir "snippets"))
(yas/load-directory yas/root-directory)
(yas/global-mode)
(yas/initialize)

(hl-line-mode)

(provide 'modes)
;;; modes.el eof
