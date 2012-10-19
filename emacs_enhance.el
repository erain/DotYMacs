;; load something not in the default folder
;; (setq load-path (cons (expand-file-name "~/some-folder") load-path)  )
(setq load-path (cons (expand-file-name "~/.emacs.d/") load-path)  )

(setq load-path (cons (expand-file-name "~/.emacs.d/color-theme") load-path)  )
;; (autoload 'color-theme "loading color theme" t)
(require 'color-theme)
(color-theme-initialize)
(load-file "~/.emacs.d/color-theme/themes/color-theme-blackboard.el")
;; (color-theme-arjen)
;; (color-theme-hober)
(color-theme-gruber-darker)
;;;;
;; solarized theme for emacs
;;;
;; (setq load-path (cons (expand-file-name "~/.emacs.d/color-theme/themes/emacs-color-theme-solarized/") load-path)  )
;; (autoload 'color-theme-solarized "color-theme-solarized" t)
;; (require 'color-theme-solarized)
;; (color-theme-solarized-dark)
;; (color-theme-solarized-light)



;; Flyspell configuration
(setq flyspell-issue-welcome-flag nil) ;; fix flyspell problem
(setq-default ispell-program-name "/usr/local/bin/aspell")
(setq-default ispell-list-command "list")


;; Author: WANG Ying
;; About Paste: Meta-y
(global-set-key [(meta ?/)] 'hippie-expand)
(setq hippie-expand-try-functions-list 
      '(try-expand-dabbrev
	try-expand-dabbrev-visible
	try-expand-dabbrev-all-buffers
	try-expand-dabbrev-from-kill
	try-complete-file-name-partially
	try-complete-file-name
	try-expand-all-abbrevs
	try-expand-list
	try-expand-line
	try-complete-lisp-symbol-partially
	try-complete-lisp-symbol))

;; Author: WAMG Ying
;; Match the parentheses
;; When press % on a parenthese, then go to the matching parenthese
;; Otherwise input an parenthese
(global-set-key "%" 'match-paren)
(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
	((looking-at "\\s\)") (forward-char 1) (backward-list 1))
	(t (self-insert-command (or arg 1)))))

;; Author: WANG Ying
;; go-to-char
;; When you press C-c a x, then you go to the next 'x'
(defun wy-go-to-char (n char)
  "Move forward to Nth occurence of CHAR.Typing `wy-go-to-char-key' again will move forwad to the next Nth occurence of CHAR."
  (interactive "p\ncGo to char: ")
  (search-forward (string char) nil nil n)
  (while (char-equal (read-char)
		     char)
    (search-forward (string char) nil nil n))
  (setq unread-command-events (list last-input-event)))
(define-key global-map (kbd "C-c a") 'wy-go-to-char)


;; IDO:
;; (require 'ido)
(autoload 'ido "loading ido" t)
(ido-mode t)
(setq ido-enable-flex-matching t)


;; save desktop:
;; (desktop-save-mode 1)

;; ibuffer:
;; (require 'ibuffer)
(autoload 'ibuffer "loading ibuffer" t)
(setq ibuffer-default-sorting-mode 'major-mode)
(setq ibuffer-always-show-last-buffer t)
(setq ibuffer-view-ibuffer t)
(global-set-key (kbd "C-x C-b") 'ibuffer-other-window)

;; backup files:
(setq backup-by-copying t    ; don't clobber symlinks
      backup-directory-alist
      '(("." . "~/.saves")))            ; don't litter my fs tree
(setq version-control t)
(setq kept-new-versions 3)
(setq delete-old-versions t)
(setq kept-old-versions 2)
(setq dired-kept-versions 1)

;; instead of save desktop, rather save last editing place in files,
;; as well as minibuffer:
(require 'saveplace)
;; (setq-default save-place t)
(autoload 'saveplace "loading saveplace" t)
(savehist-mode t)

;; change the prefix of outline-minor-mode
(setq outline-minor-mode-prefix [(control o)])


