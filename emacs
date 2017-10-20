;; Global keys for using Org-mode
;; Read the tutorial at http://orgmode.org/worg/org-tutorials/orgtutorial_dto.html
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;; directory for all Org-mode files
(setq org-agenda-files (list "~/org/" "~/org/papers/"))

;; Set same TODO list for all. Individually it should be:
;;#+SEQ_TODO:   TODO(t) WAITING(w!/!) LATER(l) | DONE(d) CANCELED(c@)
(setq org-todo-keywords
 '((sequence "TODO(t)" "WAITING(w!/!)" "LATER(l)" "|" "DONE(d)" "CANCELED(c@)")))

;; Use 2 spaces when indenting CSS instead of the default 4
(setq css-indent-offset 2)


;; Asymptote mode
;; if "asy" is not on path, use:
;;(add-to-list 'load-path "ASYDIR")
;; for compiling with C-c C-c
(autoload 'asy-mode "asy-mode.el" "Asymptote major mode." t)
(autoload 'lasy-mode "asy-mode.el" "hybrid Asymptote/Latex major mode." t)
(autoload 'asy-insinuate-latex "asy-mode.el" "Asymptote insinuate LaTeX." t)
(add-to-list 'auto-mode-alist '("\\.asy$" . asy-mode))


;; Set color theme (generated using M-x customize-theme)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes (quote (tango-dark))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; Add .emacs.d/elisp to Emacs load path
(add-to-list 'load-path "~/.emacs.d/elisp/")


;; Use taskjuggler-mode.el by Stefan Kamphausen http://www.skamphausen.de/cgi-bin/ska/taskjuggler-mode
(require 'taskjuggler-mode)
;; Activate the Taskjuggler exporter in Org-mode (requires emacs-org-mode installed in Parabola GNU/Linux)
(require 'ox-taskjuggler)
;; Convert between OrgMode and FreeMind mindmapping files
(require 'ox-freemind)
