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



;; Helm-Bibtex
;; See https://github.com/tmalsburg/helm-bibtex
(autoload 'helm-bibtex "helm-bibtex" "" t)
(setq bibtex-completion-bibliography
      '("~/Documents/bibliography/references.bib"))
(setq bibtex-completion-library-path
      '("~/Documents/bibliography/bibtex-pdfs"))
(setq bibtex-completion-pdf-field "File")
(setq bibtex-completion-notes-path "~/Documents/bibliography/notes.org")
(setq bibtex-completion-additional-search-fields '(keywords tags))
(setq bibtex-completion-pdf-symbol "⌘")
(setq bibtex-completion-notes-symbol "✎")
;; Requires a newer version of bibtex-completion!
;; (setq bibtex-completion-pdf-extension '(".pdf" ".djvu"))
(setq while-no-input-ignore-events '())
;; See this also:
;; https://github.com/tmalsburg/helm-bibtex#create-a-bibtex-file-containing-only-specific-entries
(require 'helm)
(require 'helm-config)
(global-set-key (kbd "<apps>") 'helm-command-prefix)
(define-key helm-command-map "b" 'helm-bibtex)
(define-key helm-command-map "B" 'helm-bibtex-with-local-bibliography)
(define-key helm-command-map "n" 'helm-bibtex-with-notes)
(define-key helm-command-map (kbd "<apps>") 'helm-resume)
;; org-ref config
(setq reftex-default-bibliography '("~/Documents/bibliography/references.bib"))
(setq org-ref-bibliography-notes "~/Documents/bibliography/notes.org"
      org-ref-default-bibliography '("~/Documents/bibliography/references.bib")
      org-ref-pdf-directory "~/Documents/bibliography/bibtex-pdfs/")

(require 'doi-utils)
(require 'org-ref-isbn)
(require 'org-ref-pubmed)
(require 'org-ref-arxiv)
(require 'x2bib)
;; Open pdf's as org-mode does (see above).
(setq bibtex-completion-pdf-open-function 'org-open-file)
;; Journal abbreviations
(add-to-list 'org-ref-bibtex-journal-abbreviations
  '("IUMJ" "Indiana University Mathematics Journal" "Indiana Univ. Math. J."))
;; Sci-hub
(defun sci-hub-pdf-url (doi)
  "Get url to the pdf from SCI-HUB"
  (setq *doi-utils-pdf-url* (concat "https://sci-hub.se/" doi) ;captcha
        *doi-utils-waiting* t
        )
  ;; try to find PDF url (if it exists)
  (url-retrieve (concat "https://sci-hub.se/" doi)
            (lambda (status)
              (goto-char (point-min))
              (while (search-forward-regexp "\\(https://\\|//sci-hub.se/downloads\\).+download=true'" nil t)
                (let ((foundurl (match-string 0)))
                  (message foundurl)
                  (if (string-match "https:" foundurl)
                  (setq *doi-utils-pdf-url* foundurl)
                (setq *doi-utils-pdf-url* (concat "https:" foundurl))))
                (setq *doi-utils-waiting* nil))))
  (while *doi-utils-waiting* (sleep-for 0.1))
  *doi-utils-pdf-url*)
(defun doi-utils-get-bibtex-entry-pdf (&optional arg)
  "Download pdf for entry at point if the pdf does not already exist locally.
The entry must have a doi. The pdf will be saved to
`org-ref-pdf-directory', by the name %s.pdf where %s is the
bibtex label.  Files will not be overwritten.  The pdf will be
checked to make sure it is a pdf, and not some html failure
page. You must have permission to access the pdf. We open the pdf
at the end if `doi-utils-open-pdf-after-download' is non-nil.

With one prefix ARG, directly get the pdf from a file (through
`read-file-name') instead of looking up a DOI. With a double
prefix ARG, directly get the pdf from an open buffer (through
`read-buffer-to-switch') instead. These two alternative methods
work even if the entry has no DOI, and the pdf file is not
checked."
  (interactive "P")
  (save-excursion
    (bibtex-beginning-of-entry)
    (let ( ;; get doi, removing http://dx.doi.org/ if it is there.
	  (doi (replace-regexp-in-string
		"https?://\\(dx.\\)?.doi.org/" ""
		(bibtex-autokey-get-field "doi")))
	  (key (cdr (assoc "=key=" (bibtex-parse-entry))))
	  (pdf-url)
	  (pdf-file))
      (setq pdf-file (concat
		      (if org-ref-pdf-directory
			  (file-name-as-directory org-ref-pdf-directory)
			(read-directory-name "PDF directory: " "."))
		      key ".pdf"))
      ;; now get file if needed.
      (unless (file-exists-p pdf-file)
	(cond
	 ((and (not arg)
	       doi
	       (if (doi-utils-get-pdf-url doi)
		   (setq pdf-url (doi-utils-get-pdf-url doi))
		 (setq pdf-url "https://www.sciencedirect.com/science/article/")))
	  (url-copy-file pdf-url pdf-file)        
	  ;; now check if we got a pdf
	  (if (org-ref-pdf-p pdf-file)
	      (message "%s saved" pdf-file)
	    (delete-file pdf-file)
	    ;; sci-hub fallback option
	    (setq pdf-url (sci-hub-pdf-url doi))
	    (url-copy-file pdf-url pdf-file)
	    ;; now check if we got a pdf
	    (if (org-ref-pdf-p pdf-file)
		(message "%s saved" pdf-file)
	      (delete-file pdf-file)
	      (message "No pdf was downloaded.") ; SH captcha
	      (browse-url pdf-url))))
	 ;; End of sci-hub fallback option
	 ((equal arg '(4))
	  (copy-file (expand-file-name (read-file-name "Pdf file: " nil nil t))
		     pdf-file))
	 ((equal arg '(16))
	  (with-current-buffer (read-buffer-to-switch "Pdf buffer: ")
	    (write-file pdf-file)))
	 (t
	  (message "We don't have a recipe for this journal.")))
	(when (and doi-utils-open-pdf-after-download (file-exists-p pdf-file))
	  (org-open-file pdf-file))))))


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
 '(org-file-apps
   (quote
    ((auto-mode . emacs)
     ("\\.mm\\'" . default)
     ("\\.x?html?\\'" . default)
     ("\\.pdf\\'" . "xdg-open %s"))))
 '(package-selected-packages (quote (bibtex-completion org-ref markdown-mode))))
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
