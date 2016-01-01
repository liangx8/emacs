(add-to-list 'load-path "~/.emacs.d/lisp/auto-complete")
(add-to-list 'load-path "~/.emacs.d/lisp/popup")
(add-to-list 'load-path "~/.emacs.d/lisp/go-mode")
(add-to-list 'load-path "~/.emacs.d/lisp/me")




(load "init-auto-complete")
(require 'go-mode-autoloads)
;; to make go-autocomplete work, gocode should be install first.
;; go get -u github.com/nsf/gocode
;; export PATH=$PATH:$GOPATH/bin
(require 'go-autocomplete)

(load "myasm")
(load "mykey")
(setq emacs-load-start-time (current-time))
(setq default-tab-width 4)


