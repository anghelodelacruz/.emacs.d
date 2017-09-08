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
(setq org-agenda-files (list "~/Documents/GitHub/themathguy.github.io/"))
(setq org-todo-keywords
       '((sequence "TODO" "NEXT" "WAITING" "INACTIVE" "|" "DONE" "CANCELLED")))

(setq org-src-fontify-natively t)

(use-package evil
	:ensure t
	:config
	(evil-mode))

(use-package company
	:ensure t
	:config
	(company-mode))
(add-hook 'after-init-hook 'global-company-mode)	
(setq company-idle-delay t)

(use-package helm
	:ensure t)
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(helm-autoresize-mode t)

(use-package projectile
	:ensure t
	:config
	(projectile-mode))

(use-package helm-projectile
	:ensure t
	:config
	(helm-projectile-on))

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

(defun set-frame-size-according-to-resolution ()
  (interactive)
  (if window-system
  (progn
    ;; use 120 char wide window for largeish displays
    ;; and smaller 80 column windows for smaller displays
    ;; pick whatever numbers make sense for you
    (if (> (x-display-pixel-width) 1280)
           (add-to-list 'default-frame-alist (cons 'width 120))
           (add-to-list 'default-frame-alist (cons 'width 80)))
    ;; for the height, subtract a couple hundred pixels
    ;; from the screen height (for panels, menubars and
    ;; whatnot), then divide by the height of a char to
    ;; get the height we want
    (add-to-list 'default-frame-alist 
         (cons 'height (/ (- (x-display-pixel-height) 0)
                             (frame-char-height)))))))

(set-frame-size-according-to-resolution)

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
