;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "beewangruichao"
      user-mail-address "beewangruichao@didiglobal.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "Monaco" :size 14)
      doom-variable-pitch-font (font-spec :family "Monaco" :size 14))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(load-theme 'acme t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/.doom.d")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.

;; Least keymaps.
(map! :n  "C-i"   'better-jumper-jump-forward
      :n  "zh"    'evil-scroll-left
      :n  "zl"    'evil-scroll-right
      :n  "C-w -" 'evil-window-decrease-height
      :n  "[g"    'flycheck-previous-error
      :n  "]g"    'flycheck-next-error
      :nv "C-="   'lsp-format-region
      :nv "RET"   'er/expand-region
      ;; :nv "C--"   'align-regexp ;; invalid?
      :i "C-n" 'company-complete-common
      :i "C-p" 'company-select-previous-or-abort

      :leader
      :n "w/"    'evil-window-vsplit
      :n "w-"    'evil-window-split
      :n "<SPC>" 'execute-extended-command
      :n "'"     '+vterm/toggle
      :n "/"     '+default/search-project-for-symbol-at-point
      :n "="     '+treemacs/toggle
      :n "cm"    'lsp-ui-imenu
      )

(when (featurep! :ui workspace)
  (map! :n  "ZQ"    '+workspace/close-window-or-workspace

        :leader
        :n "wt"    '+workspace/new

        :n "0" '+workspace/switch-to-final
        :n "1" '+workspace/switch-to-0
        :n "2" '+workspace/switch-to-1
        :n "3" '+workspace/switch-to-2
        :n "4" '+workspace/switch-to-3
        :n "5" '+workspace/switch-to-4
        :n "6" '+workspace/switch-to-5
        :n "7" '+workspace/switch-to-6
        :n "8" '+workspace/switch-to-7
        :n "9" '+workspace/switch-to-8))

;; A transparent Ema!
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(set-frame-parameter (selected-frame) 'alpha '(90 75))

;; Company
;; Don't popup company, except I call.
(setq! company-idle-delay 0
       company-selection-wrap-around t
       lsp-completion-enable t)
(after! prog-mode
  (global-company-mode 1)
  (set-company-backend! 'prog-mode
    'company-dabbrev
    'company-keywords
    'company-yasnippet
    'company-files
    'company-capf))

;; Dashboard:
(defun doom-dashboard-widget-banner ()
  ;; Replace it to get my own dashboard!
  (let ((point (point)))
    (mapc (lambda (line)
            (insert (propertize (+doom-dashboard--center +doom-dashboard--width line)
                                'face 'doom-dashboard-banner) " ")
            (insert "\n"))
          '("     #######    ##  ##     ##                   ##        #######                 "
            "     #######    ##  ##     ##                   ##        #######                 "
            "    ##    ##       ##   # ##   #  #####       ## #       ##      ## ## ##   ##### "
            "   ##    ##   ##  ##  #  ##  #  ##   ##       ##        ####    ### ##  # ##   ## "
            "  #######    ##  ####   ####   ##   ##     ## ##       ##      ##  ##  # ##   ##  "
            "  #######    ##  ####   ####   ##   ##     ## ##       ##      ##  ##  # ##   ##  "
            " ##    ##   ##  ##  #  ##  #  ##   ##    ##   ## #    ##      ##  ##  # ##   ##   "
            "##     ## #### ##   # ##   #  #### #    ##   ###     ####### ##      #  #### #    "
            "                                        ####  ##                                  "
            "                                        ####  ##                                  "))
    (when (and (display-graphic-p)
               (stringp fancy-splash-image)
               (file-readable-p fancy-splash-image))
      (let ((image (create-image (fancy-splash-image-file))))
        (add-text-properties
         point (point) `(display ,image rear-nonsticky (display)))
        (save-excursion
          (goto-char point)
          (insert (make-string
                   (truncate
                    (max 0 (+ 1 (/ (- +doom-dashboard--width
                                      (car (image-size image nil)))
                                   2))))
                   ? ))))
      (insert (make-string (or (cdr +doom-dashboard-banner-padding) 0)
                           ?\n)))))

(setq! initial-scratch-message ";; Simple, Poetic, Pithy
;; Don’t communicate by sharing memory, share memory by communicating.
;; Concurrency is not parallelism.
;; Channels orchestrate; mutexes serialize.
;; The bigger the interface, the weaker the abstraction.
;; Make the zero value useful.
;; interface{} says nothing.
;; Gofmt’s style is no one’s favorite, yet gofmt is everyone’s favorite.
;; A little copying is better than a little dependency.
;; Syscall must always be guarded with build tags.
;; Cgo must always be guarded with build tags.
;; Cgo is not Go.
;; With the unsafe package there are no guarantees.
;; Clear is better than clever.
;; Reflection is never clear.
;; Errors are values.
;; Don’t just check errors, handle them gracefully.
;; Design the architecture, name the components, document the details.
;; Documentation is for users.
;; Don’t panic.
")

;; Format:
;;
;; Cancel format for PHP.
(setq! +format-on-save-enabled-modes
       '(not emacs-lisp-mode  ; elisp's mechanisms are good enough
             sql-mode         ; sqlformat is currently broken
             tex-mode         ; latexindent is broken
             latex-mode

             ;; My own configuration:
             php-mode)        ; The best language doesn't need format!
       )

;; LeetCode:
(setq! leetcode-directory "~/Code/src/git.xiaojukeji.com/beewangruichao/docs/leetcode"
       leetcode-prefer-language "golang"
       leetcode-save-solutions t)

;; LSP:
(setq! lsp-enable-file-watchers   nil
       lsp-ui-sideline-show-hover t)

;; Magit:
(setq! magit-blame-styles
       '((margin
          (margin-format    . ("%a %s%f" " %C" " %H"))
          (margin-width     . 42)
          (margin-face      . magit-blame-margin)
          (margin-body-face . (magit-blame-dimmed)))
         (headings
          (heading-format   . "%-20a %C %s\n"))
         (highlight
          (highlight-face   . magit-blame-highlight))
         (lines
          (show-lines       . t)
          (show-message     . t))))

;; Mouse:
(xterm-mouse-mode -1)

;; Modeline:
(when (featurep! :ui modeline)
  (setq! doom-modeline-height 0
         doom-modeline-icon nil))

;; Org mode:
(after! org
  (setq! org-todo-keywords '((sequence "TODO(t)" "PLANING(p)" "INPROGRESS(i)" "BLOCK(b)" "|" "DONE(d)" "CANCELLED(c)"))
         org-todo-keyword-faces '(("TODO" :foreground "#7c7c75" :weight normal: underline t)
                                  ("PLANING" :foreground "#b0c4de" :weight normal: underline t)
                                  ("INPROGRESS" :foreground "#0098dd" :weight normal: underline t)
                                  ("BLOCK" :foreground "#9f7efe" :weight normal: underline t)
                                  ("DONE" :foreground "#50a14f" :weight normal: underline t)
                                  ("CANCELLED" :foreground "#ff6480" :weight normal: underline t))
         org-log-done 'time))

;; PlantUML:
;; Enable plantuml-mode for PlantUML files
(add-to-list 'auto-mode-alist '("\\.puml\\'" . plantuml-mode))
