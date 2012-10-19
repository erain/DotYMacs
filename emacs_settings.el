(setq visible-bell t)

(setq inhibit-startup-message t)
(setq inhibit-splash-screen t)

;; I hate tabs!
(setq-default indent-tabs-mode nil)

;; highlight current line:
(global-hl-line-mode nil)		


(setq mouse-yank-at-point t)

(setq kill-ring-max 200)

(setq fill-column 60)

(setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
(setq sentence-end-double-space nil)

(setq enable-recursive-minibuffers t)

(setq scroll-margin 3
      scroll-conservatively 10000)

(show-paren-mode t)
(setq show-paren-style 'parentheses)

(setq frame-title-format "emacs@%b")

(auto-image-file-mode)

(put 'set-goal-column 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'LaTeX-hide-environment 'disabled nil)

(setq user-full-name "Yi Yu   ")
(setq user-mail-address "YiYu@Ymail.com")

(setq dired-recursive-copies 'top)
(setq dired-recursive-deletes 'top)

;; To make system copy work with Emacs paste and Emacs copy work with system paste
(setq x-select-enable-clipboard t)

;; wheel mouse scroll enabled:
(mouse-wheel-mode t)

;; scrolling, cursor, tool-bar
;; (scroll-bar-mode nil)
(blink-cursor-mode nil)
(setq transient-mark-mode t)
(tool-bar-mode -1)

;; display column numbers in status bar:
(column-number-mode 't)

;;display time in status bar:
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(display-time)

;; battery mode:
;; (require 'battery)
;; (setq battery-mode-line-format " [%L %p%% %dC]")
;; (display-battery-mode)

;; let us use Home/End for buffer (while C-a, C-e for line:)
;; (global-set-key [home] 'beginning-of-buffer)
;; (global-set-key [end] 'end-of-buffer)

;; setting color syntax highlighting:
(autoload 'font-lock "loading font-lock" t)
(global-font-lock-mode t)
(setq-default font-lock-auto-fontify t)
