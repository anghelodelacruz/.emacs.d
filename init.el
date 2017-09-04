

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/"))

(add-to-list 'package-archives
	     '("marmalade" . "https://marmalade-repo.org/packages/")
	     t)

(add-to-list 'package-archives
	     '("gnu" . "https://elpa.gnu.org/packages/")
	     t)

(package-initialize)

(require 'org)
   (require 'ob-tangle)
   (org-babel-load-file (expand-file-name "~/.emacs.d/config.org"))

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
	(package-refresh-contents)
	(package-install 'use-package))

(setq custom-file "~/.emacs.d/package-selected-packages.el")
(load custom-file)
