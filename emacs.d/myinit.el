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

;(defun goenv ()
;  "setup gocode environment"
;  (interactive)
;  (setenv "GOROOT" "/opt/go")
;  (setenv "GOPATH" (concat (getenv "HOME") "/gopath")))


(load "myasm")
(load "mykey")
(load "intel-hex-mode")
(setq emacs-load-start-time (current-time))
(setq default-tab-width 4)
;; highline current line
(require 'hl-line)
(global-hl-line-mode t)

(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(display-time-mode t)
;; 取消自动保存
(auto-save-mode 0)
(show-paren-mode 1)
;(global-set-key [f3] 'isearch-forward)
