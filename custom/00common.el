(projectile-global-mode)
(global-set-key [(control x) (k)] 'kill-this-buffer)
(setq enh-ruby-program "~/.rvm/rubies/ruby-2.1.5/bin/ruby")
(autoload 'enh-ruby-mode "enh-ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))

(load-theme 'noctilux t )
(setq make-backup-files nil)
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq inhibit-startup-message t)
(setq initial-scratch-message "")
(scroll-bar-mode 0)
(tool-bar-mode 0)
(menu-bar-mode 0)
(fset 'yes-or-no-p 'y-or-n-p)
(show-paren-mode t)
(prefer-coding-system 'utf-8)
(global-set-key (kbd "C-x <up>") 'switch-to-next-buffer)
(global-set-key (kbd "C-x <down>") 'switch-to-prev-buffer)
(global-set-key (kbd "C-x <C-up>") 'switch-to-next-buffer)
(global-set-key (kbd "C-x <C-down>") 'switch-to-prev-buffer)

;;(set-face-attribute 'default (not 'this-frame-only)
;;                    :font "Fira Mono-9")
(add-hook 'enh-ruby-mode-hook
          (lambda () (highlight-indentation-current-column-mode)))
(add-hook 'coffee-mode-hook
          (lambda () (highlight-indentation-current-column-mode)))
(setq projectile-completion-system 'grizzl)

;; A small minor mode to use a big fringe
(defvar bzg-big-fringe-mode nil)
(define-minor-mode bzg-big-fringe-mode
  "Minor mode to hide the mode-line in the current buffer."
  :init-value nil
  :global t
  :variable bzg-big-fringe-mode
  :group 'editing-basics
  (if (not bzg-big-fringe-mode)
      (set-fringe-style nil)
    (set-fringe-mode
     (/ (- (frame-pixel-width)
           (* 150 (frame-char-width)))
        2))))

;; Now activate this global minor mode
(bzg-big-fringe-mode 1)

;; To activate the fringe by default and deactivate it when windows
;; are split vertically, uncomment this:
;; (add-hook 'window-configuration-change-hook
;;           (lambda ()
;;             (if (delq nil
;;                       (let ((fw (frame-width)))
;;                         (mapcar (lambda(w) (< (window-width w) fw))
;;                                 (window-list))))
;;                 (bzg-big-fringe-mode 0)
;;               (bzg-big-fringe-mode 1))))

;; Use a minimal cursor
;; (setq cursor-type 'hbar)


(global-auto-complete-mode t)
(add-to-list 'ac-modes 'enh-ruby-mode)

;;(setq ecb-auto-activate 1)
(setq ecb-layout-name "methodsonlyright")
(global-set-key (kbd "C-x m") 'ecb-goto-window-methods)
