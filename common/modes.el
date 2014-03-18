;;;; modes --- minor and major mode loading
;;

;;;;
;; minor
;;

(require 'textmate)
(require 'rainbow-mode)
(require 'gist)
(textmate-mode)

;;;;
;; major - autoloads
;;

(if (boundp 'erlang-tools)
    (progn
      (autoload 'erlang-mode "erlang" "" t)
      (autoload 'elixir-mode "elixir-mode" "" t)
      (add-to-list 'auto-mode-alist '("\\.erl$" . erlang-mode))
      (add-to-list 'auto-mode-alist  '("\\.exs?$" . elixir-mode))))

(add-to-list 'auto-mode-alist '("COMMIT_EDITMSG$" . diff-mode))

(autoload 'markdown-mode "markdown-mode.el" "" t)
(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))

(autoload 'feature-mode "feature-mode" "" t)
(add-to-list 'auto-mode-alist '("\\.feature$" . feature-mode))

(autoload 'yaml-mode "yaml-mode" "" t)
(add-to-list 'auto-mode-alist '("\\.ya?ml$" . yaml-mode))

(autoload 'js-mode "js" "" t)
(add-to-list 'auto-mode-alist '("\\.js$" . js-mode))

(add-to-list 'auto-mode-alist '("\\.m$" . objc-mode))
(add-to-list 'auto-mode-alist '("\\.h$" . objc-mode))

(autoload 'haml-mode "haml-mode" "" t)
(add-to-list 'auto-mode-alist '("\\.haml$" . haml-mode))

(autoload 'sass-mode "sass-mode" "" t)
(add-to-list 'auto-mode-alist '("\\.sass$" . sass-mode))

(autoload 'sws-mode "sws-mode" "" t)
(autoload 'jade-mode "jade-mode" "" t)
(add-to-list 'auto-mode-alist '("\\.styl$" . sws-mode))
(add-to-list 'auto-mode-alist '("\\.jade$" . jade-mode))
(add-to-list 'auto-mode-alist '("\\.scss$" . css-mode))
(add-to-list 'auto-mode-alist '("\\.css$" . css-mode))

(autoload 'handlebars-mode "handlebars-mode")
(add-to-list 'auto-mode-alist '("\\.(hbs|handlebars)$" . handlebars-mode))

(autoload 'coffee-mode "coffee-mode")
(add-to-list 'auto-mode-alist '("\\.coffee\..*$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))

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
(add-hook 'clojure-mode               (lambda () (enable-paredit-mode)))

(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-hook 'eshell-mode-hook 'ansi-color-for-comint-mode-on)

;;
;; ws-trim setup
;;
(add-hook 'after-init-hook
          (lambda ()
            (global-ws-trim-mode t)
            (set-default 'ws-trim-level 2)
            (setq ws-trim-global-modes '(guess (not message-mode eshell-mode)))))

;;
;; cosmetics for diffs and magit
;;
(eval-after-load 'diff-mode
  '(progn
     (set-face-foreground 'diff-added "green4")
     (set-face-foreground 'diff-removed "red3")))

(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "green3")
     (set-face-foreground 'magit-diff-del "red3")))

;;(require 'nu)

;;;;
;; coffee-script
;;

(defun coffee-custom ()
  "coffee-mode-hook"
  (set (make-local-variable 'tab-width) 2))

(add-hook 'coffee-mode-hook
          '(lambda() (coffee-custom)))

;;;;
;; ack-and-a-half
;;
(defalias 'ack 'ack-and-a-half)
(defalias 'ack-same 'ack-and-a-half-same)
(defalias 'ack-find-file 'ack-and-a-half-find-file)
(defalias 'ack-find-file-same 'ack-and-a-half-find-file-same)

;;;;
;; ibuffer
;;

(require 'ibuffer)

(setq ibuffer-saved-filter-groups
      '(("defaults"
         ("cocoa" (filename . "\\Cocoa"))
         ("conhar" (filename . "\\conhar"))
         ("conf" (or (filename . "\.emacs\.d")
                     (filename . "emacs-config")))
         ("org" (or (mode . org-mode)
                    (filename . "OrgMode")))
         ("irc" (mode . erc-mode))
         ("emacs" (or (name . "^\\*scratch\\*$")
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

(add-hook 'after-init-hook
          '(lambda ()
             (require 'yasnippet)
             (yas-load-directory (concat dotfiles-dir "snippets"))
             (yas-global-mode)))

;;(hl-line-mode)

(provide 'modes)
;;; modes.el eof
