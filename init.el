;;;; init.el, mah emacs booting god of doom
;;

;;;;
;; system locations
;;

(setq dotfiles-dir (file-name-directory (or (buffer-file-name) load-file-name))
      system-specific-config (concat dotfiles-dir system-name ".el")
      user-specific-config (concat dotfiles-dir user-login-name ".el")
      vendor-dir (concat dotfiles-dir "vendor")
      common-dir (concat dotfiles-dir "common")
      packages-dir (concat dotfiles-dir "packages")
      erlang-dir "/usr/local/lib/erlang"
      local-bin "/usr/local/bin")

;;;;
;; build load/exec-path
;;

(add-to-list 'load-path dotfiles-dir)
(add-to-list 'load-path common-dir)
(add-to-list 'load-path vendor-dir)
(add-to-list 'load-path packages-dir)
(add-to-list 'load-path (concat erlang-dir "/lib/tools-2.6.1/emacs"))
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/w3m")
(add-to-list 'load-path (concat vendor-dir "/color-theme"))
(add-to-list 'load-path (concat vendor-dir "/cucumber.el/cucumber.el"))
(add-to-list 'load-path (concat vendor-dir "/textmate.el"))
(add-to-list 'exec-path (concat erlang-dir "/bin"))

;;;;
;; build exec-path
;;

(setq exec-path (cons "/usr/local/bin" exec-path))

;;;;
;; static loads
;;

(require 'cl)
(require 'saveplace)
(require 'ffap)
(require 'uniquify)
(require 'ansi-color)
(require 'recentf)
(require 'unbound)

(require 'lisp-helpers)
(require 'defuns)
(require 'bindings)
(require 'mac-bindings)
(require 'misc)
(require 'registers)
(require 'eshell-defaults)
(require 'ruby-env)

;;;;
;; user/system specific
;;

(if (file-exists-p system-specific-config)
    (load system-specific-config))

(if (file-exists-p user-specific-config)
    (load user-specific-config))

;;;;
;; customize settings
;;

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(blink-cursor-mode t)
 '(column-number-mode t)
 '(display-battery-mode t)
 '(display-time-mode t)
 '(erc-email-userid "justin")
 '(erc-header-line-face-method nil)
 '(erc-hide-prompt t)
 '(erc-input-line-position -1)
 '(erc-join-buffer (quote bury))
 '(erc-kill-buffer-on-part t)
 '(erc-kill-queries-on-quit t)
 '(erc-kill-server-buffer-on-quit t)
 '(erc-nick "cheapRoc")
 '(erc-prompt ">")
 '(erc-user-full-name "justinwr")
 '(eshell-kill-on-exit t)
 '(eshell-scroll-to-bottom-on-input nil)
 '(eshell-term-name "xterm-color")
 '(eshell-visual-commands (quote ("tail" "ssh" "vi" "screen" "top" "less" "more" "lynx" "ncftp" "pine" "tin" "trn" "elm")))
 '(fringe-mode 0 nil (fringe))
 '(indent-tabs-mode nil)
 '(js2-auto-indent-flag t)
 '(js2-bounce-indent-flag t)
 '(js2-enter-indents-newline nil)
 '(js2-missing-semi-one-line-override t)
 '(js2-strict-missing-semi-warning nil)
 '(line-spacing 1)
 '(menu-bar-mode t)
 '(ns-alternate-modifier (quote meta))
 '(ns-antialias-text t)
 '(ns-command-modifier (quote super))
 '(ns-control-modifier (quote control))
 '(ns-function-modifier (quote none))
 '(ns-use-qd-smoothing nil)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(speedbar-vc-do-check nil)
 '(standard-indent 2)
 '(tab-always-indent (quote always))
 '(yas/prompt-functions (quote (yas/ido-prompt yas/completing-prompt yas/x-prompt yas/dropdown-prompt yas/no-prompt))))

(provide 'init)
;;; init.el eof

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#111111" :foreground "#eeeeec" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight bold :height 110 :width normal :foundry "apple" :family "Bitstream_Vera_Sans_Mono")))))

(put 'upcase-region 'disabled nil)

(put 'downcase-region 'disabled nil)

(put 'narrow-to-region 'disabled nil)
