;; Global keys for using Org-mode
;; Read the tutorial at http://orgmode.org/worg/org-tutorials/orgtutorial_dto.html

;; Load the MELPA package library
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)

;; Make new buffers split the window vertically instead of horizontally
(setq split-height-threshold nil)
(setq split-width-threshold 80)

;; Word wrap
(setq-default word-wrap t)

(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
;; The below is so that PDF-files or others can be opened with \C-o in org-mode
;; It makes xdg-open work in eshell. See
;;  https://askubuntu.com/questions/646631/emacs-doesnot-work-with-xdg-open
;; and
;;  https://emacs.stackexchange.com/questions/19344/why-does-xdg-open-not-work-in-eshell
;; WARNING: it might break other things. Some have mentioned gnuplot.
(setq process-connection-type nil)

;; directory for all Org-mode files
(setq org-agenda-files (list "~/org/" "~/org/papers/"))

;; Show done recurring tasks in org-mode log (agenda, then press l)
(setq org-agenda-log-mode-items '(closed clock state))

;; Let the agenda always show 7 days in advance instead of the current week
(setq org-agenda-start-on-weekday nil)
(setq org-agenda-span 7)

;; Make sure org-latex uses the OT1 font encoding instead of OT. The
;; latter has licensing issues in Parabola GNU/Linux. If the defaults
;; of "org-latex-default-packages-alist" should ever change, then run
;; "M-x apropos RET org-latex-default-packages-alist" and read them
;; from there. Also, to preview a LaTeX formula when using X, run C-c
;; C-x C-l.
(with-eval-after-load 'org
  (setq org-latex-default-packages-alist
	'(("AUTO" "inputenc" t)
	  ("OT1" "fontenc" t)
	  ("" "fixltx2e" nil)
	  ("" "graphicx" t)
	  ("" "longtable" nil)
	  ("" "float" nil)
	  ("" "wrapfig" nil)
	  ("" "rotating" nil)
	  ("normalem" "ulem" t)
	  ("" "amsmath" t)
	  ("" "textcomp" t)
	  ("" "marvosym" t)
	  ("" "wasysym" t)
	  ("" "amssymb" t)
	  ("" "hyperref" nil)
	  "\\tolerance=1000")
	)
  )
;; Make the formulas larger when previewing:
;;(with-eval-after-load 'org
;;  (setq org-format-latex-options (plist-put org-format-latex-options :scale 1.5))
;;  )


;; Load emacs speaks statistics
;;(add-to-list 'load-path "/usr/share/emacs/site-lisp/ess")
;;(require 'ess-site)

;; Allow executing "GNU calc" code blocks in org-mode
(org-babel-do-load-languages
 'org-babel-load-languages
 '((calc . t)
   (octave . t)
   (R . t)
   (python . t)))
;; Make the keyboard sortcut "< s TAB" create a code block that also
;; exports the results when exporting.
(add-to-list 'org-structure-template-alist
  '("s" "#+BEGIN_SRC ? :exports both\n\n#+END_SRC"))
;; Add syntax highlighting in code blocks
(setq org-src-fontify-natively t)
;; Use tab to indent inside code blocks
(setq org-src-tab-acts-natively t)


;; Tell emacs to opem .m-files in the Octave-mode
(add-to-list 'auto-mode-alist '("\\.m\\'" . octave-mode))


;; Firstly, make C-x C-m always compile. Secondly make the compilation
;; always run "make -k", unless a prefix argument has been given,
;; e.g. C-u C-x C-m.
(global-set-key "\C-x\C-m" 'compile)
(setq compilation-read-command nil)

;; Tell emacs to use the current emacs cursor position for pasting,
;; instead of first moving to the mouse cursor position and then
;; pasting.
(setq mouse-yank-at-point t)


;; Tell emacs to align at equal sign in bibtex files. Do the aligning
;; ourself with C-c C-q.
(setq bibtex-align-at-equal-sign t)


;; Set same TODO list for all. Individually it should be:
;;#+SEQ_TODO:   TODO(t) WAITING(w!/!) LATER(l) | DONE(d) CANCELLED(c@)
(setq org-todo-keywords
 '((sequence "TODO(t)" "WAITING(w!/!)" "LATER(l)" "|" "DONE(d)" "CANCELLED(c@)")))

;; Never use tabs, always use spaces for indenting
(setq indent-tabs-mode nil)
;; Use 2 spaces when indenting CSS, JS and shell instead of the default 4
(setq css-indent-offset 2)
(setq js-indent-level 2)
(setq sh-indentation 2)


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
 '(custom-enabled-themes (quote (tango-dark)))
 '(package-selected-packages (quote (markdown-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Set markdown-command to run pandoc
(setq markdown-command "pandoc")
;; Use HTML5 and UTF-8 for markdown export to html
(eval-after-load "markdown-mode"
  '(defalias 'markdown-add-xhtml-header-and-footer 'as/markdown-add-xhtml-header-and-footer))

(defun as/markdown-add-xhtml-header-and-footer (title)
  "Wrap XHTML header and footer with given TITLE around current buffer."
  (goto-char (point-min))
  (insert "<!DOCTYPE html5>\n"
	  "<html>\n"
	  "<head>\n<title>")
  (insert title)
  (insert "</title>\n")
  (insert "<meta charset=\"utf-8\" />\n")
  (when (> (length markdown-css-paths) 0)
    (insert (mapconcat 'markdown-stylesheet-link-string markdown-css-paths "\n")))
  (insert "\n</head>\n\n"
	  "<body>\n\n")
  (goto-char (point-max))
  (insert "\n"
	  "</body>\n"
	  "</html>\n"))

;; Emacs-magit
(require 'magit)
;; Make C-x g show the magit status
(define-key global-map "\C-xg" 'magit-status)
