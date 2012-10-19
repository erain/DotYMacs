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


