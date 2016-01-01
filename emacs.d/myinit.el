(add-to-list 'load-path "~/.emacs.d/lisp/auto-complete")
(add-to-list 'load-path "~/.emacs.d/lisp/popup")
(add-to-list 'load-path "~/.emacs.d/lisp/go-mode")
(add-to-list 'load-path "~/.emacs.d/lisp/me")




(load "init-auto-complete")
(require 'go-mode-autoloads)
(require 'go-autocomplete)

(load "myasm")
(load "mykey")
(setq emacs-load-start-time (current-time))
(setq default-tab-width 4)


