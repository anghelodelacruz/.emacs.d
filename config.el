(tool-bar-mode -1)
(scroll-bar-mode -1)
;; (menu-bar-mode -1)

(setq create-lcokfiles nil)

(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)

(use-package try
	:ensure t)

(use-package which-key
	:ensure t 
	:config
	(which-key-mode))

(use-package dashboard
	:config
	(dashboard-setup-startup-hook))

(global-set-key "\C-ca" 'org-agenda)
(setq org-agenda-files (list "~/Documents/GitHub/cse3521-website-master/themathguy.github.io/"))
(setq org-todo-keywords
       '((sequence "TODO" "NEXT" "WAITING" "INACTIVE" "|" "DONE" "CANCELLED")))

(setq org-src-fontify-natively t)

(use-package evil
	:ensure t
	:config
	(evil-mode))

(use-package helm
	:ensure t)
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(helm-autoresize-mode t)

(use-package solaire-mode
	:ensure t
	:config
	(solaire-mode))
;; brighten buffers (that represent real files)
(add-hook 'after-change-major-mode-hook #'turn-on-solaire-mode)
;; To enable solaire-mode unconditionally for certain modes:
(add-hook 'ediff-prepare-buffer-hook #'solaire-mode)

;; ...if you use auto-revert-mode:
(add-hook 'after-revert-hook #'turn-on-solaire-mode)

;; highlight the minibuffer when it is activated:
(add-hook 'minibuffer-setup-hook #'solaire-mode-in-minibuffer)

(set-frame-parameter (selected-frame) 'alpha 80)

(defun transparency (value)
  "Sets the transparency of the frame window. 0=transparent/100=opaque"
  (interactive "nTransparency Value 0 - 100 opaque:")
  (set-frame-parameter (selected-frame) 'alpha value))

(use-package doom-themes
	:ensure t)
(load-theme 'doom-one t)
(doom-themes-org-config)
(doom-themes-visual-bell-config)
(setq frame-title-format "emacs")
