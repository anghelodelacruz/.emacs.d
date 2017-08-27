
(tool-bar-mode -1)
(scroll-bar-mode -1)
;; (menu-bar-mode -1)

(set-default 'cursor-type 'hbar)

(setq org-src-fontify-natively t)

(setq create-lcokfiles nil)

(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)

(org-babel-do-load-languages
   'org-babel-load-languages
      '((calc . t)))

(ido-mode)

(column-number-mode)

(show-paren-mode)
(setq show-paren-delay 0)
(require 'paren)
(set-face-background 'show-paren-match "VioletRed4")

(global-hl-line-mode 0)
(set-face-foreground 'highlight nil)
(set-face-background hl-line-face "VioletRed3")
(set-face-attribute hl-line-face nil :underline nil)

(winner-mode t)

(defun zone-choose (pgm)
    "Choose a PGM to run for `zone'."
    (interactive
     (list
      (completing-read
       "Program: "
       (mapcar 'symbol-name zone-programs))))
    (let ((zone-programs (list (intern pgm))))
      (zone)))

(windmove-default-keybindings)

(global-set-key (kbd "M-p") 'ace-window)

(add-to-list 'load-path "/full/path/where/ace-jump-mode.el/in/")
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)
;; you can select the key you prefer to
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

(require 'evil)
(evil-mode 1)

(global-set-key "\C-ca" 'org-agenda)

(setq org-todo-keywords
       '((sequence "TODO" "NEXT" "WAITING" "INACTIVE" "|" "DONE" "CANCELLED")))

(add-to-list 'load-path "/some/path/neotree")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(setq neo-theme (if (display-graphic-p) 'ascii 'arrow))
(setq-default neo-show-hidden-files t)

(package-initialize)

(load-theme 'misterioso)

(setq frame-title-format "emacs")
