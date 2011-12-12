;; add to ~/.emacs.d/init.el if you aren't already using Marmalade.
(setq load-path (cons (expand-file-name "~/.emacs.d/elpa/") load-path)  )
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)
