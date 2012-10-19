(require 'cl) ; a rare necessary use of REQUIRE

(package-initialize)

;; load something not in the default folder
(setq load-path (cons (expand-file-name "~/.emacs.d/") load-path)  )

(load "~/.emacs.d/emacs_settings.el")
(load "~/.emacs.d/emacs_enhance.el")
(load "~/.emacs.d/languages.el")

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
