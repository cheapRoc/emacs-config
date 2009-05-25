;;; justin.el --- very misc
;;

(server-start)
(prefer-coding-system 'utf-8)
(setq show-trailing-whitespace "t")

;;
;; display time and battery life
;;

(display-time-mode)
(display-battery-mode)

;;
;; major and minor modes
;;

(require 'modes)

;;
;; w3m browser
;;

(setq w3m-command "/usr/local/bin/w3m")
(require 'w3m-load)

;;
;; color themes
;;

(require 'color-theme)
(color-theme-initialize)

(when (window-system) (color-theme-blulight))
;;(when (not (window-system)) (color-theme-something))

(provide 'justin)
;; justin.el eof