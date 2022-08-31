;; BASIC CONFIG EMACS
;; Welcome Message
(setq inhibit-startup-message t)

;; ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Remove unnecesary stuff
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode -10)

;; Remove the menu bar
(menu-bar-mode -1)

;; Set visible bell
(setq visible-bell t)

;; Font Config
(set-face-attribute 'default nil :font "Iosevka:antialias=subpixel" :height 130)
;;Set fixed face
(set-face-attribute 'fixed-pitch nil :font "Iosevka" :weight 'regular :height 150)
;; Set variable face
(set-face-attribute 'variable-pitch nil :font "IBM Plex Sans" :weight 'regular :height 150)

;; Load Themes
(load-theme 'doom-horizon t)

;;---------------------------------------------------------------------

;; PACKAGES FOR EMACS
;; Initialize packages sources
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			("org" . "https://orgmode.org/elpa/")
			("elpa" . "https://elpa.gnu.org/packages/")))


(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Initialize use-package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package command-log-mode)

;; MAIN PACKAGES
;; Ivy - for replace find command
(use-package counsel
  :bind (("M-x" . counsel-M-x)
	 ("C-x b" . counsel-ibuffer)
	 ("C-x C-f" . counsel-find-file)
	 :map minibuffer-local-map
	 ("C-r" . counsel-minibuffer-history)))

(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
	 :map ivy-minibuffer-map
	 ("TAB" . ivy-alt-done)
	 ("C-l" . ivy-alt-done)
	 ("C-j" . ivy-next-line)
	 ("C-k" . ivy-previous-line)
	 :map ivy-switch-buffer-map
	 ("C-k" . ivy-previous-line)
	 ("C-l" . ivy-done)
	 ("C-d" . ivy-switch-buffer-kill)
	 :map ivy-reverse-i-search-map
	 ("C-k" . ivy-previous-line)
	 ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

;; Ivy rich for more info about commands on emacs
(use-package ivy-rich
  :init
  (ivy-rich-mode 1))
;;-----------------------------------------------------

;; KEYBINDINGS
;; General package
(use-package general
 :config
 (general-create-definer rune/leader-keys
     :keymaps '(normal insert visual emacs)
     :prefix "SPC"
     :global-prefix "C-SPC")

 (rune/leader-keys
    "t" '(:ignore t :which-key "toggles")
    "tt" '(counsel-load-theme :which-key "Choose Theme")
    "tv" '(eval-buffer :which-key "Eval Buffer")
    "tc" '(comment-region :which-key "Comment Region")
    "tu" '(uncomment-region :which-key "Uncomment Region")))

;; VIM BINDINGS FOR EMACS
;; Evil Mode
(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

  ;;Use visual line motions
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)
  (evil-set-initial-state 'message-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

;; Evil Collection
(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

;; Hidra
(use-package hydra)
(defhydra hydra-text-scale (:timeout 5)
  "Scale Text"
  ("j" text-scale-increase "in")
  ("k" text-scale-decrease "out")
  ("f" nil "finished" :exit t))

(rune/leader-keys
  "ts" '(hydra-text-scale/body :which-key "Scale Text"))
;;_____________________________________________________________________

;;THEMES AND UI CONFIG
;; Doom modeline
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom (doom-modeline-height 30))

;; Doom Themes
(use-package doom-themes)

;; Which key package
(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 1))

;; Enable number row
(column-number-mode)
(global-display-line-numbers-mode)

;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
                term-mode-hook
                eshell-mode-hook
		lsp-treemacs-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; Use delimiter rainbow
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

;; Helpful package
(use-package helpful
  :custom
  (counsel-describe-function-funtion #'helpful-callable)
  (counsel-describe-variable-funtion #'helpful-variable)
  :bind
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . heplful-key))

;;------------------------------------------------------------

;; ORG MODE 
(defun ogm/org-mode-setup ()
  (org-indent-mode)
  (variable-pitch-mode 1)
  (visual-line-mode 1))

(use-package org
  :hook (org-mode . ogm/org-mode-setup)
  :config
  (setq org-ellipsis " ..."
	org-hide-emphasis-markers t)

  ;;ORG AGENDA
  (setq org-agenda-start-with-log-mode t)
  (setq org-log-done 'time)
  (setq org-log-into-drawer t)
  (setq org-agenda-files
	'("~/Documents/task.org"
	  "~/Documents/birthdays.org"))

  (setq org-todo-keywords
	'((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)"))))
  

;;Org Bullets
(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

;; Correct heading font
(require 'org-faces)
(with-eval-after-load 'org-faces
(dolist (face '((org-level-1 . 1.2)
		(org-level-2 . 1.1)
		(org-level-3 . 1.05)
		(org-level-4 . 1.0)
		(org-level-5 . 1.1)
		(org-level-6 . 1.1)
		(org-level-7 . 1.1)
		(org-level-8 . 1.1)))
  (set-face-attribute (car face) nil :font "IBM Plex Sans" :weight 'medium :height (cdr face)))

;; Ensure the correct fonts for the ORGMODE
(set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch)
(set-face-attribute 'org-code nil :inherit '(shadow fixed-pitch))
(set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch))
(set-face-attribute 'org-table nil :inherit 'fixed-pitch)
(set-face-attribute 'org-special-keyword nil :inherit'(font-lock-comment-face fixed-pitch))
(set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
(set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch))

;; Change the - for . on lists
(font-lock-add-keywords 'org-mode
			'(("^ *\\([-]\\) "
			   (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "."))))))

;; To center the content org-mode 
(defun ogm/org-mode-visual-fill()
  (setq visual-fill-column-width 100
	visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

(use-package visual-fill-column
  :hook (org-mode . ogm/org-mode-visual-fill))


;; ORG BABEL
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (python . t)))

(setq org-confirm-babel-evaluate nil)
(push '("conf-unix" . conf-unix) org-src-lang-modes)

;; Estructure templates
(require 'org-tempo)
(add-to-list 'org-structure-template-alist '("sh". "src shell"))
(add-to-list 'org-structure-template-alist '("el". "src emacs-lisp"))
(add-to-list 'org-structure-template-alist '("py". "src python"))

;; Auto-tangle 
(defun ogm/org-babel-tangle-config ()
  (when (string-equal (buffer-file-name)
		      (expand-file-name "~/Documents/Org\ Files/emacs.org"))
    ;;Dinamic Scoping
    (let ((org-confirm-babel-evaluate nil))
      (org-babel-tangle))))

(add-hook 'org-mode-hook (lambda () (add-hook 'after-save-hook #'ogm/org-babel-tangle-config)))


;;-------------------------------------------------------------------------

;; PROJECTILE AND MAGIT
;; Setup projectile
(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :custom ((projectile-completion-system 'ivy))
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  (when (file-directory-p "~/Documents")
    (setq projectile-project-search-path '("~/Documents")))
  (setq projectile-switch-project-action #'projectile-dired))

;; If you need more help
(use-package counsel-projectile
  :config (counsel-projectile-mode))

;; Magit - git version control
(use-package magit
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

;;-------------------------------------------------------------------------

;; LSP-MODE - LANGUAGE SERVER PROTOCOL 
;; UI SETUP FROM CODE MODES
(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode)
  :custom
  (lsp-ui-doc-position 'bottom))

(defun efs/lsp-mode-setup ()
  (setq lsp-headeline-breadcrumb-segments '(path-up-to-project file symbols))
  (lsp-headeline-breadcrumb-mode)
  :hook (lsp-mode . efs/lsp-mode-setup))

(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :init
  (setq lsp-keymap-prefix "C-c l")
  :config
  (lsp-enable-which-key-integration t))

(use-package lsp-treemacs
  :after lsp)

;; COMMENT CODE
(use-package evil-nerd-commenter
  :bind ("M-/" . evilnc-comment-or-uncomment-lines))

;; TYPESCRIPT SERVER
(use-package typescript-mode
  :mode "\\.ts\\'"
  :hook (typescript-mode . lsp-deferred)
  :config
  (setq typescript-indented-level 2))

;; MS PYTHON SERVER
 (use-package lsp-python-ms
   :ensure t
   :init (setq lsp-python-ms-auto-install-server t)
   :hook (python-mode . (lambda ()
              (require 'lsp-python-ms)
              (lsp-deferred))))

;; COMPANY FOR BETTER COMPLETION SYSTEM
(use-package company
  :after lsp-mode
  :hook (lsp-mode . company-mode)
  :bind(:map company-active-map
	     ("<tab>" . company-complete-selection)
	     ("<return>" . company-select-next))
       (:map lsp-mode-map
	     ("<tab>" . company-indent-or-complete-common))
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.0))

;; COMPANY BOX - JUST BEAUTIFUL
(use-package company-box
  :hook (company-mode . company-box-mode))

;;--------------------------------------------------------------

;; MARKDOWN
(use-package markdown-mode
  :mode "\\.md\\'"
  :config
  (setq markdown-command "marked")
  (defun dw/set-markdown-header-font-sizes ()
    (dolist (face '((markdown-header-face-1 . 1.2)
                    (markdown-header-face-2 . 1.1)
                    (markdown-header-face-3 . 1.0)
                    (markdown-header-face-4 . 1.0)
                    (markdown-header-face-5 . 1.0)))
      (set-face-attribute (car face) nil :weight 'normal :height (cdr face))))

  (defun dw/markdown-mode-hook ()
    (dw/set-markdown-header-font-sizes))

  (add-hook 'markdown-mode-hook 'dw/markdown-mode-hook))

;;--------------------------------------------------------------

;; YASnippet
(use-package yasnippet)

(add-to-list 'load-path
	     "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)

;;--------------------------------------------------------------

;; OX-REVEAL
(use-package ox-reveal)
 
;; Start Emacs on full screen mode
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("7eea50883f10e5c6ad6f81e153c640b3a288cd8dc1d26e4696f7d40f754cc703" default))
 '(global-command-log-mode t)
 '(initial-frame-alist '((fullscreen . fullscreen)))
 '(ivy-mode t)
 '(org-agenda-files nil)
 '(package-selected-packages
   '(yasnippet-snippets yasnippet toc-org company-box company javascript-mode lsp-python-ms evil-nerd-commenter lsp-treemacs typescript-mode evil-magit magit counsel-projectile python-mode lsp-mode lsp lps lps-mode projectile visual-fill-column org-bullets hydra hidra evil-collection evil general doom-themes helpful ivy-rich rainbow-delimiters which-key doom-modeline counsel command-log-mode use-package)))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

