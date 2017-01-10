;; Global keys for using Org-mode
;; Read the tutorial at http://orgmode.org/worg/org-tutorials/orgtutorial_dto.html
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;; directory for all Org-mode files
(setq org-agenda-files (list "~/org/"))
