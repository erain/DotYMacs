(require 'cl) ; a rare necessary use of REQUIRE

(setq visible-bell t)

(setq inhibit-startup-message t)
(setq inhibit-splash-screen t)

;; I hate tabs!
(setq-default indent-tabs-mode nil)

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

(mapc
 (function (lambda (setting)
	     (setq auto-mode-alist
		   (cons setting auto-mode-alist))))
 '(("\\.xml$".  sgml-mode)
   ("\\\.bash" . sh-mode)
   ("\\.rdf$".  sgml-mode)
   ("\\.session" . emacs-lisp-mode)
   ("\\.l$" . c-mode)
   ("\\.css$" . css-mode)
   ("\\.cfm$" . html-mode)
   ("gnus" . emacs-lisp-mode)
   ("\\.idl$" . idl-mode)
   ("\\.m$" . octave-mode)
   ("\\.md$" . markdown-mode)))

(setq user-full-name "Yi Yu   ")
(setq user-mail-address "YiYu@Ymail.com")

(setq dired-recursive-copies 'top)
(setq dired-recursive-deletes 'top)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-PDF-mode t)
 '(TeX-source-correlate-method (quote synctex))
 '(TeX-source-correlate-mode t)
 '(TeX-source-correlate-start-server t)
 '(TeX-view-program-list (quote (("Preview" "open %o"))))
 '(TeX-view-program-selection (quote (((output-dvi style-pstricks) "dvips and gv") (output-dvi "xdvi") (output-pdf "Preview") (output-html "xdg-open"))))
 '(column-number-mode t)
 '(show-paren-mode t)
 '(weblogger-config-alist (quote ( ("erain9" "http://erain9.wordpress.com/xmlrpc.php" "erain9" "" "21697997") )))
 )


;; To make system copy work with Emacs paste and Emacs copy work with system paste
(setq x-select-enable-clipboard t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Here is my configuration
;; I know what exactly I am doing in the following :-)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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

;; highlight current line:
(global-hl-line-mode nil)		

;; Flyspell configuration
(setq flyspell-issue-welcome-flag nil) ;; fix flyspell problem
(setq-default ispell-program-name "/usr/local/bin/aspell")
(setq-default ispell-list-command "list")


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
;; (require 'font-lock)
(autoload 'font-lock "loading font-lock" t)
(global-font-lock-mode t)
(setq-default font-lock-auto-fontify t)

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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Haskell Mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq load-path (cons (expand-file-name "~/.emacs.d/haskellmode-emacs") load-path)  )

;; (add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
;; (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;; (add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;; (add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)

(setq auto-mode-alist
      (append auto-mode-alist
              '(("\\.[hg]s$"  . haskell-mode)
                ("\\.hic?$"     . haskell-mode)
                ("\\.hsc$"     . haskell-mode)
		("\\.chs$"    . haskell-mode)
                ("\\.l[hg]s$" . literate-haskell-mode))))
(autoload 'haskell-mode "haskell-mode"
  "Major mode for editing Haskell scripts." t)
(autoload 'literate-haskell-mode "haskell-mode"
  "Major mode for editing literate Haskell scripts." t)

;; adding the following lines according to which modules you want to use:
;; (require 'inf-haskell)
(autoload 'inf-haskell "loading inf-haskell" t)

(add-hook 'haskell-mode-hook 'turn-on-font-lock)
;; (add-hook 'haskell-mode-hook 'turn-off-haskell-decl-scan)
;; (add-hook 'haskell-mode-hook 'turn-off-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;; (add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)
;; (add-hook 'haskell-mode-hook 'turn-on-haskell-hugs)
(add-hook 'haskell-mode-hook 'turn-on-haskell-ghci)
(add-hook 'haskell-mode-hook 
	  (function
	   (lambda ()
	     (setq haskell-program-name "ghci")
	     (setq haskell-ghci-program-name "ghci6"))))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Python
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;======= Code folding =======
(add-hook 'python-mode-hook 'my-python-outline-hook)
;; this gets called by outline to deteremine the level. Just use the length of the whitespace
(defun py-outline-level ()
  (let (buffer-invisibility-spec)
    (save-excursion
      (skip-chars-forward "    ")
      (current-column))))
;; this get called after python mode is enabled
(defun my-python-outline-hook ()
  ;; outline uses this regexp to find headers. I match lines with no indent and indented "class"
  ;; and "def" lines.
  (setq outline-regexp "[^ \t]\\|[ \t]*\\(def\\|class\\) ")
  ;;  enable our level computation
  (setq outline-level 'py-outline-level)
  ;; do not use their \C-c@ prefix, too hard to type. Note this overides some bindings.
  (setq outline-minor-mode-prefix "\C-t")
  ;; turn on outline mode
  (outline-minor-mode t)
  ;; initially hide all but the headers
  ;; (hide-body)
  ;; make paren matches visible
  (show-paren-mode 1)
  )


;;; paredit for clojure mode
;;; (require 'paredit) if you didn't install via package.el

(defun turn-on-paredit () (paredit-mode 1))
(add-hook 'clojure-mode-hook 'turn-on-paredit)


;;; Wordpress settings
(setq weblogger-save-password t)


;;; Twittering-Mode setting
;; (add-to-list 'load-path "~/.emacs.d/twittering-mode/")
;; (require 'twittering-mode)


;;; multi-web-mode
(setq load-path (cons (expand-file-name "~/.emacs.d/multi-web-mode/") load-path)  )
(require 'multi-web-mode)
;; (autoload 'multi-web-mode  "loading multi-web-mode" t)
;; (when
;;     (load
;;      (expand-file-name "~/.emacs.d/multi-web-mode/multi-web-mode.el"))
;;   (package-initialize))
(setq mweb-default-major-mode 'html-mode)
(setq mweb-tags '((php-mode "<\\?php\\|<\\? \\|<\\?=" "\\?>")
		  (espresso-mode "<script +\\(type=\"text/javascript\"\\|language=\"javascript\"\\)[^>]*>" "</script>")
		  (css-mode "<style +type=\"text/css\"[^>]*>" "</style>")))
(setq mweb-filename-extensions '("php" "htm" "html" "ctp" "phtml" "php4" "php5"))
(multi-web-global-mode 1)



;;; espresso-mode for javascript
(autoload #'espresso-mode "espresso" "Start espresso-mode" t)
(add-to-list 'auto-mode-alist '("\\.js$" . espresso-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . espresso-mode))


;;; tuareg mode for ocaml file
(setq load-path (cons (expand-file-name "~/.emacs.d/tuareg-mode/") load-path)  )
(setq auto-mode-alist (cons '("\\.ml\\w?" . tuareg-mode) auto-mode-alist))
(autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)
(autoload 'camldebug "camldebug" "Run the Caml debugger" t)
(setq tuareg-default-indent 4)
(setq tuareg-with-indent 2)
(setq tuareg-|-extra-unindent 2)
;; utop part
;; (autoload 'utop "utop" "Toplevel for OCaml" t)
;; (autoload 'utop-eval-region "utop" "Toplevel for OCaml" t)
;; (autoload 'utop-eval-phrase "utop" "Toplevel for OCaml" t)
;; (autoload 'utop-eval-buffer "utop" "Toplevel for OCaml" t)

;; (defun tuareg-utop-hook ()
;;   (local-set-key "\M-\C-x" 'utop-eval-phrase)
;;   (local-set-key "\C-x\C-e" 'utop-eval-phrase)
;;   (local-set-key "\C-c\C-e" 'utop-eval-phrase)
;;   (local-set-key "\C-c\C-r" 'utop-eval-region)
;;   (local-set-key "\C-c\C-b" 'utop-eval-buffer))

;; (add-hook 'tuareg-mode-hook 'tuareg-utop-hook)



;;; slime mode for common-lisp
;; (setq load-path (cons (expand-file-name "~/.emacs.d/slime/") load-path))
;; (require 'slime)
;; (add-hook 'inferior-lisp-mode-hook (lambda () (inferior-slime-mode t)))
;; (setq inferior-lisp-program "/usr/bin/sbcl")
;; (slime-setup '(slime-fancy))



;;; ActionScript-Mode
;; (when
;;     (load
;;      (expand-file-name "~/.emacs.d/actionscript-mode.el"))
;;   (package-initialize))
;; (add-to-list 'auto-mode-alist '("\\.as$" . actionscript-mode))



;;; PHP-Mode
(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))
(add-hook 'php-mode-hook
	  '(lambda () (define-abbrev php-mode-abbrev-table "ex" "extends")))
(defun clean-php-mode ()
  (interactive)
  (php-mode)
  (setq c-basic-offset 2) ; 2 tabs indenting
  (setq indent-tabs-mode nil)
  (setq fill-column 78)
  (c-set-offset 'case-label '+)
  (c-set-offset 'arglist-close 'c-lineup-arglist-operators))
(c-set-offset 'arglist-intro '+) ; for FAPI arrays and DBTNG
(c-set-offset 'arglist-cont-nonempty 'c-lineup-math) ; for DBTNG fields and values



;;; C++ mode
(defun my-c-mode-common-hook ()
  ;; my customizations for all of c-mode, c++-mode, objc-mode, java-mode
  (c-set-offset 'substatement-open 0)
  ;; other customizations can go here
  (setq c-default-style "linux")		  ;; the default code style
  (setq c++-tab-always-indent t)
  (setq c-basic-offset 4)                  ;; Default is 2
  (setq c-indent-level 4)                  ;; Default is 2
  (setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60))
  (setq tab-width 4)
  (setq indent-tabs-mode t)  ; use spaces only if nil
  )
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)



;; For auctex configuration
(setq latex-configuration "~/.emacs.d/latex.el")
;; (load latex-configuration 'noerror)
(autoload 'latex-configuration "loading latex configuration" t)



;; For yasnippet
(require 'yasnippet-bundle)
;; (autoload 'yasnippet-bundle "loading yasnippetp-bundle" t)



;; Scala mode configuration
(setq load-path (cons (expand-file-name "~/.emacs.d/scala-mode/") load-path)  )
;; (require 'scala-mode-auto)
(autoload 'scala-mode-auto "loading scala-mode" t)
(add-hook 'scala-mode-hook
	  '(lambda ()
	     (yas/minor-mode-on)
	     ))
(setq yas/my-directory "~/.emacs.d/scala-mode/contrib/yasnippet/snippets")
(yas/load-directory yas/my-directory)



;; Lua mode configuration
;; This mode is clone from GitHub
(setq load-path (cons (expand-file-name "~/.emacs.d/lua-mode/") load-path)  )
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))
(setq lua-indent-level 2)
(setq lua-electric-flag nil)
(defun lua-abbrev-mode-off () (abbrev-mode 0))
(add-hook 'lua-mode-hook 'lua-abbrev-mode-off)
(setq save-abbrevs nil)   ;; is this still needed?



;; For MarkDown Mode
;; Although I still don't know what it is...
(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)
(setq auto-mode-alist
      (cons '("\\.text" . markdown-mode) auto-mode-alist))



;; C#-mode
(autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)
(setq auto-mode-alist
      (append '(("\\.cs$" . csharp-mode)) auto-mode-alist))



;; Clojure Mode
(setq load-path (cons (expand-file-name "~/.emacs.d/clojure-mode/") load-path)  )
;; major mode from <https://github.com/technomancy/clojure-mode>
(autoload 'clojure-mode "clojure-mode" "Major mode for editing clojure code" t)
(defun turn-on-paredit () (paredit-mode 1))
(add-hook 'clojure-mode-hook 'turn-on-paredit)



;; scheme mode
(add-to-list 'auto-mode-alist '("\\.scm$" . scheme-mode))


;;; Common Lisp
;; (setq inferior-lisp-program "sbcl")
;; (load (expand-file-name "~/quicklisp/slime-helper.el"))

(autoload 'run-prolog "prolog" "Start a Prolog sub-process." t)
(autoload 'prolog-mode "prolog" "Major mode for editing Prolog programs." t)
(autoload 'mercury-mode "prolog" "Major mode for editing Mercury programs." t)
(setq auto-mode-alist (append '(("\\.pl$" . prolog-mode))
;; (setq prolog-system 'swi)  ; optional, the system you are using;
;;                            ; see `prolog-system' below for possible values
                               auto-mode-alist))




;; Twittering Mode
;; (require 'twittering-mode)
(autoload 'twittering-mode "loading twittering mode" t)
(setq twittering-use-master-password t)




;; ;; ibus-el: For using ibus under emacs in Ubuntu
;; (require 'ibus)
;; ;; Turn on ibus-mode automatically after loading .emacs
;; (add-hook 'after-init-hook 'ibus-mode-on)
;; ;; Use C-SPC for Set Mark command
;; (ibus-define-common-key ?\C-\s nil)
;; ;; Use C-/ for Undo command
;; (ibus-define-common-key ?\C-/ nil)
;; ;; Use S-SPC toggle ibus
;; (ibus-define-common-key ?\S-\s nil)
;; (global-set-key (kbd "S-SPC") 'ibus-toggle)
;; ;; Use C-x M-i toggle ibus mode.
;; (global-set-key (kbd "C-x M-i") 'ibus-mode)


;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
;; (when
;;     (load
;;      (expand-file-name "~/.emacs.d/elpa/package.el"))
;;   (package-initialize))


