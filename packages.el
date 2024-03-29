;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; To install a package with Doom you must declare them here, run 'doom sync' on
;; the command line, then restart Emacs for the changes to take effect.
;; Alternatively, use M-x doom/reload.

;; Doom's packages are pinned to a specific commit and updated from release to
;; release. The `unpin!' macro allows you to unpin single packages...
;(unpin! pinned-package)
;; ...or multiple packages
;(unpin! pinned-package another-pinned-package)
;; ...Or *all* packages (NOT RECOMMENDED; will likely break things)
;(unpin! t)


;; To install SOME-PACKAGE from MELPA, ELPA or emacsmirror:
;(package! some-package)
(package! php-cs-fixer)

;; To install a package directly from a particular repo, you'll need to specify
;; a `:recipe'. You'll find documentation on what `:recipe' accepts here:
;; https://github.com/raxod502/straight.el#the-recipe-format
;(package! another-package
;  :recipe (:host github :repo "username/repo"))

;; If the package you are trying to install does not contain a PACKAGENAME.el
;; file, or is located in a subdirectory of the repo, you'll need to specify
;; `:files' in the `:recipe':
;(package! this-package
;  :recipe (:host github :repo "username/repo"
;           :files ("some-file.el" "src/lisp/*.el")))
(package! phpactor
  :recipe (:host github :repo "emacs-php/phpactor.el"
           :files ("*.el" "composer.json" "composer.lock" (:exclude "*test.el"))))

;; If you'd like to disable a package included with Doom, for whatever reason,
;; you can do so here with the `:disable' property:
;; dotspacemacs-excluded-packages '(helm-c-yasnippet eshell-z eshell-prompt-extras
;; esh-help evil-nerd-commenter evil-tutor restart-emacs open-junk-file password-generator
;; highlight-numbers lorem-ipsum google-translate highlight-indentation golden-ratio
;; fancy-battery evil-cleverparens doom-modeline all-the-icons org-bullets multi-term
;; magit-svn gnuplot winum uuidgen ws-butler writeroom-mode memoize visual-fill-column)
;;
;; TODO: fill the list!
(package! evil-nerd-commenter :disable t)
(package! multiple-cursors :disable t)
(package! emacs-memoize :disable t)
(package! doom-snippets :disable t)
(package! acme-theme)

;; You can override the recipe of a built in package without having to specify
;; all the properties for `:recipe'. These will inherit the rest of its recipe
;; from Doom or MELPA/ELPA/Emacsmirror:
;(package! builtin-package :recipe (:nonrecursive t))
;(package! builtin-package-2 :recipe (:repo "myfork/package"))

;; Specify a `:branch' to install a package from a particular branch or tag.
;; This is required for some packages whose default branch isn't 'master' (which
;; our package manager can't deal with; see raxod502/straight.el#279)
;(package! builtin-package :recipe (:branch "develop"))
