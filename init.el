(require 'cl) ; a rare necessary use of REQUIRE

(load "~/.emacs.d/emacs_settings.el")
(load "~/.emacs.d/emacs_enhance.el")
(load "~/.emacs.d/languages.el")


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








