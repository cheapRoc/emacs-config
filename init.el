;;;; init.el, mah emacs booting god of doom
;;

;;;;
;; system locations
;;

;; TODO: Move to defining everything based on the host env. (getenv "ERLANGPATH")

(setq dotfiles-dir (file-name-directory (or (buffer-file-name) load-file-name))
      system-specific-config (concat dotfiles-dir system-name ".el")
      user-specific-config (concat dotfiles-dir user-login-name ".el")
      vendor-dir (concat dotfiles-dir "vendor")
      common-dir (concat dotfiles-dir "common")
      packages-dir (concat dotfiles-dir "packages")
      erlang-dir "/usr/local/Cellar/erlang/R14B03")

(if (file-exists-p "/usr/local/bin")
    (setq local-bin "/usr/local/bin"))

(if (file-exists-p "/opt/local/bin")
    (setq port-bin "/opt/local/bin"))

(if (file-exists-p "/opt/local/lib/mysql5/bin")
    (setq mysql-bin "/opt/local/lib/mysql5/bin"))

(if (file-exists-p erlang-dir)
    (progn
      (setq erlang-bin (concat erlang-dir "/bin"))
      (setq erlang-tools (concat erlang-dir "/lib/erlang/lib/tools-2.6.6.4/emacs"))))

;;;;
;; build load/exec-path
;;

(add-to-list 'load-path dotfiles-dir)
(add-to-list 'load-path common-dir)
(add-to-list 'load-path vendor-dir)
(add-to-list 'load-path packages-dir)
(add-to-list 'load-path (concat vendor-dir "/slime"))
(add-to-list 'load-path (concat vendor-dir "/yasnippet"))
(add-to-list 'load-path (concat vendor-dir "/rainbow-mode"))
(add-to-list 'load-path (concat vendor-dir "/color-theme"))
(add-to-list 'load-path (concat vendor-dir "/cucumber.el"))
(add-to-list 'load-path (concat vendor-dir "/cucumber.el/cucumber.el"))
(add-to-list 'load-path (concat vendor-dir "/textmate.el"))
(add-to-list 'load-path (concat vendor-dir "/coffee-mode"))
(add-to-list 'load-path (concat vendor-dir "/treetop-mode.el"))
(add-to-list 'load-path (concat vendor-dir "/scala"))
(add-to-list 'load-path erlang-tools)

;;;;
;; build exec-path
;;

(if (boundp 'local-bin)
    (add-to-list 'exec-path local-bin))

(if (boundp 'port-bin)
    (add-to-list 'exec-path port-bin))

(if (boundp 'mysql-bin)
    (add-to-list 'exec-path mysql-bin))

(if (boundp 'erlang-bin)
    (add-to-list 'exec-path erlang-bin))

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
(require 'lisp-env)
(require 'org-env)
(require 'js-env)
(require 'peepopen)

;;;;
;; user/system specific
;;

(if (file-exists-p system-specific-config)
    (load system-specific-config))

(if (file-exists-p user-specific-config)
    (load user-specific-config))

 ;; '(default ((t (:stipple nil :background "#eeeeee" :foreground "#000000" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 110 :width normal :foundry "apple" :family "Menlo"))))

;;;;
;; customize settings
;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-default nil)
 '(blink-cursor-mode t)
 '(coffee-tab-width 2)
 '(column-number-mode t)
 '(dired-at-point-require-prefix nil)
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
 '(ffap-dired-wildcards "[*?][^/]*\\'")
 '(file-name-at-point-functions nil)
 '(fringe-mode 0 nil (fringe))
 '(ido-create-new-buffer (quote always))
 '(ido-enable-flex-matching t)
 '(ido-max-prospects 10)
 '(ido-mode (quote both) nil (ido))
 '(ido-use-filename-at-point nil)
 '(indent-tabs-mode nil)
 '(js2-missing-semi-one-line-override t)
 '(js2-strict-missing-semi-warning nil)
 '(line-spacing 1)
 '(longlines-auto-wrap nil)
 '(menu-bar-mode t)
 '(ns-alternate-modifier (quote meta))
 '(ns-antialias-text nil)
 '(ns-command-modifier (quote super))
 '(ns-control-modifier (quote control))
 '(ns-function-modifier (quote none))
 '(ns-use-qd-smoothing nil)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(speedbar-vc-do-check nil)
 '(standard-indent 2)
 '(tab-always-indent (quote always))
 '(tab-width 4)
 '(truncate-lines nil)
 '(truncate-partial-width-windows nil)
 '(yas/prompt-functions (quote (yas/ido-prompt yas/completing-prompt yas/x-prompt yas/dropdown-prompt yas/no-prompt))))

(provide 'init)
;;; init.el eof

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#191717" :foreground "#eeeeee" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "apple" :family "Andale_Mono"))))
 '(twitter-time-stamp-face ((t (:background "lightBlue" :foreground "Black" :slant italic))))
 '(twitter-user-name-face ((t (:background "lightBlue" :foreground "black" :weight bold)))))

(put 'upcase-region 'disabled nil)

(put 'downcase-region 'disabled nil)

(put 'narrow-to-region 'disabled nil)
