
;; auctex configuration
(setq load-path (cons (expand-file-name "~/.emacs.d/elpa/auctex-11.86/") load-path)  )

(setenv "PATH" (concat "/usr/texbin:/usr/local/bin:" (getenv "PATH")))
(setq exec-path (append '("/usr/texbin" "/usr/local/bin") exec-path))
(load "auctex-autoloads.el" nil t t)
(load "preview.el" nil t t)

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)

;; Set the tex engine
(setq Tex-engine 'xetex)

;; PDFLatex
(setq TeX-PDF-mode t)

