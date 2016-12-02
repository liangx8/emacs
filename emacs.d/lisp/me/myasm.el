; arm asm mode defintion

(defvar myasm-mode-syntax-table nil "AVR Assembler 的语法？？？")
(setq myasm-mode-syntax-table
	  (let ( (synTable (make-syntax-table)))
		(modify-syntax-entry ?\; "<" synTable)
		(modify-syntax-entry ?\n ">" synTable)
		synTable))
(define-derived-mode myasm-mode prog-mode "myasm")							 

(setq asm-constants-regexp "\\_<\\([0-9][0-9a-fA-F]*[hH]\\|[0-9]+\\|[01]+b\\|0[xX][0-9a-fA-F]+\\|0[bB][01]+\\)\\_>")
(setq asm-label-regexp "^[_a-zA-Z].*:")
(setq arm-asm-keywords
	  '("ldr" "nop" "mov" "add" "mrs" "strb" "orr" "bic" "bl" "beq" "moveq" "cmp" "bx" "b" "ands" "msr" "subs" "strb" "ldrb" "mcr" "mrc" "str" "and" "bne"))
(setq arm-asm-keywords-regexp (regexp-opt arm-asm-keywords 'symbols))
(setq arm-registers-regexp "\\_<\\([rR][0-9]+\\|pc\\|lr\\|dp\\)\\_>")
(setq arm-direct-regexp "\\.\\w*")
(setq arm-asm-keywords nil)

(setq arm-font-lock-keywords `((,arm-asm-keywords-regexp . font-lock-keyword-face)
							   (,asm-label-regexp . font-lock-function-name-face)
							   (,arm-registers-regexp . font-lock-variable-name-face)
							   (,arm-direct-regexp . font-lock-keyword-face)
							   (,asm-constants-regexp . font-lock-constant-face)))

(define-derived-mode arm-asm-mode myasm-mode "arm"
  "Major mode for editing ARM assembler language"
  (setq font-lock-defaults '(arm-font-lock-keywords))
  (setq mode-name "ARM assembler")
  (setq arm-registers-regexp nil)
  (setq arm-asm-comment-regexp nil)
  (setq arm-direct-regexp nil)

  (provide 'arm-asm-mode))
; 8051 mode definition
(setq msc51-keywords
	  '("add" "addc" "subb" "inc" "dec" "mul" "div" "da" "anl" "orl" "xrl" "rl" "rlc" "rr" "rrc" "swap" "mov" "clr" "cpl" "movc" "movx" "push" "pop" "xch" "xchd" "setb" "jc" "jnc" "jb" "jnb" "jbc" "acall" "lcall" "ret" "reti" "ljmp" "sjmp" "ajmp" "jmp" "jz" "jnz"  "cjne" "djnz" "nop"))
(setq msc51-keywords-regexp (regexp-opt msc51-keywords 'symbols))
(setq msc51-registers-regexp "\\_<\\([rR][0-9]+\\|[ab]\\|dptr\\|dp[hl]\\)\\_>")
;(setq msc51-direct-regexp "\\_<\\(\\.?equ\\|\\.?org\\|\\.?equ\\)\\_>")


(setq msc51-keywords nil); clear memory
(setq msc51-font-lock-keywords `((,msc51-keywords-regexp . font-lock-type-face)
								 (,asm-label-regexp . font-lock-function-name-face)
								 (,msc51-registers-regexp . font-lock-variable-name-face)
								 (,asm-constants-regexp . font-lock-constant-face)))

(define-derived-mode msc51-mode myasm-mode "msc51"
  "Major mode for editing MSC 51 assembler language"
  (setq font-lock-defaults '(msc51-font-lock-keywords))
  (setq mode-name "MSC 8051")
  (setq msc51-keywords-regexp nil)
  (setq msc51-registers-regexp nil)
  (provide 'msc51-mode)
  )
; avr mode definition
(setq avr-keywords
	  '("mov" "ldi" "lds" "ld" "add" "adc" "sub" "subi" "sbci" "com" "ser" "rjmp" "rcall" "lsl" "rsl" "movw" "xor" "lpm" "ijmp" "adiw" "and" "andi" "bld" "asr" "bclr" "brbc" "brbs" "brcc" "brcs" "breq" "brne" "brts" "brtc" "ret" "reti" "clr" "cbr" "cbi" "out"  "in" "inc" "dec" "sbrc" "sbrs" "sbic" "sbis" "sts" "st" "cpi" "cp" "cpc" "rol" "ror" "lsr" "sbr" "sbi" "sbc" "nop" "sei" "set" "clt" "cli" "pop"))
(setq avr-keywords-regexp (regexp-opt avr-keywords 'symbols))
(setq avr-registers-regexp "\\_<\\([rR][0-9]+\\|[XxYyZz][lLhH]?\\)\\_>")
;(setq avr-keywords nil); clear memory
(setq avr-font-lock-keywords `((,avr-keywords-regexp . font-lock-type-face)
							   (,asm-label-regexp . font-lock-function-name-face)
							   (,avr-registers-regexp . font-lock-variable-name-face)
							   (,asm-constants-regexp . font-lock-constant-face)))

(define-derived-mode avr-mode myasm-mode "avr"
  "Major mode for editing ATMEL assembler language"
  (setq font-lock-defaults '(avr-font-lock-keywords))
  (setq mode-name "AVR asm")
  (setq avr-keywords-regexp nil)
  (setq avr-registers-regexp nil)
  (setq asm-constants-regexp nil)
  (setq asm-label-regexp nil)
  (define-key map ".equ" 'delete-horizontal-space)
  (define-key map "equ" 'work)
  (provide 'avr-mode)
  )
; parse compiler error list
(eval-after-load 'compile
  '(progn
     (add-to-list 'compilation-error-regexp-alist-alist
				  '(mcs51-err "^\\(.+\\)(\\([0-9]+\\),\\([0-9]+\\)): .*" 1 2 3))
     (add-to-list 'compilation-error-regexp-alist 'mcs51-err)
     (add-to-list 'compilation-error-regexp-alist-alist
				  '(avrasm-err "^\\(.+\\)(\\([0-9]+\\)) ?: [Ee]rror .*" 1 2 nil))
     (add-to-list 'compilation-error-regexp-alist 'avrasm-err)
;     (add-to-list 'compilation-error-regexp-alist-alist
;				  '(avra-err "^\\(.+\\)(\\([0-9]+\\)) : Error .*" 1 2 nil))
;     (add-to-list 'compilation-error-regexp-alist 'avra-err)
     (add-to-list 'compilation-error-regexp-alist-alist
				  '(avrasm-info "^\\(.+\\)(\\([0-9]+\\)): [^Error].*" 1 2 nil 0)) ; info
     (add-to-list 'compilation-error-regexp-alist 'avrasm-info)))


; 参考 http://ergoemacs.org/emacs/elisp_keyword_completion.html
(defun asm-complete-symbol ()
  "Perform keyword completion on word before cursor."
  (interactive)
  (let ((posEnd (point))
        (meat (thing-at-point 'symbol))
        maxMatchResult)

    ;; when nil, set it to empty string, so user can see all lang's keywords.
    ;; if not done, try-completion on nil result lisp error.
    (when (not meat) (setq meat ""))
    (setq maxMatchResult (try-completion meat avr-keywords))

    (cond ((eq maxMatchResult t))
          ((null maxMatchResult)
           (message "Can't find completion for `%s'" meat)
           (ding))
          ((not (string= meat maxMatchResult))
           (delete-region (- posEnd (length meat)) posEnd)
           (insert maxMatchResult))
          (t (message "Making completion list ...")
             (with-output-to-temp-buffer "*Completions*"
               (display-completion-list
                (all-completions meat avr-keywords)
                meat))
             (message "Making completion list ...%s" "done")))
    )
  )

(add-hook 'asm-mode-hook
		  (lambda nil
			(setq tab-stop-list
							'(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120))))


