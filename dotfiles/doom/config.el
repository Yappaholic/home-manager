;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
(setq doom-font (font-spec
                 :family "JetBrainsMono Nerd Font"
                 :size 18))
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-gruvbox)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

(setq default-frame-alist '((undecorated . t)))
(scroll-bar-mode -1)

;; Odin language
(add-to-list 'auto-mode-alist '("\\.odin\\'" . odin-ts-mode))
(after! lsp-mode
  (add-to-list 'lsp-language-id-configuration '(odin-ts-mode . "odin"))

  (lsp-register-client
   (make-lsp-client :new-connection (lsp-stdio-connection "ols")
                    :major-modes '(odin-ts-mode)
                    :server-id 'ols
                    :multi-root t))

  )
(add-hook 'odin-ts-mode-hook #'lsp!)
(set-formatter! 'odinfmt '("odinfmt" filepath) :modes '(odin-ts-mode))

;; Harpoon config
(map! :leader "C-SPC" 'harpoon-quick-menu-hydra)
(map! :n "C-s" 'harpoon-add-file)

;; And the vanilla commands
(map! :leader "j c" 'harpoon-clear)
(map! :leader "j f" 'harpoon-toggle-file)
(map! :leader "1" 'harpoon-go-to-1)
(map! :leader "2" 'harpoon-go-to-2)
(map! :leader "3" 'harpoon-go-to-3)
(map! :leader "4" 'harpoon-go-to-4)
(map! :leader "5" 'harpoon-go-to-5)
(map! :leader "6" 'harpoon-go-to-6)
(map! :leader "7" 'harpoon-go-to-7)
(map! :leader "8" 'harpoon-go-to-8)
(map! :leader "9" 'harpoon-go-to-9)


;; JSON Schemas
(defvar lsp-json--schema-associations
  `(:/*.css-data.json ["https://raw.githubusercontent.com/Microsoft/vscode-css-languageservice/master/docs/customData.schema.json"]
    :/package.json ["http://json.schemastore.org/package"]
    :/*.html-data.json ["https://raw.githubusercontent.com/Microsoft/vscode-html-languageservice/master/docs/customData.schema.json"]
    :/*.schema.json ["http://json-schema.org/draft-07/schema#"]
    :/bower.json ["http://json.schemastore.org/bower"]
    :/composer.json ["http://json.schemastore.org/composer"]
    :/tsconfig.json ["http://json.schemastore.org/tsconfig"]
    :/tsconfig.*.json ["http://json.schemastore.org/tsconfig"]
    :/typings.json ["http://json.schemastore.org/typings"]
    :/.bowerrc ["http://json.schemastore.org/bowerrc"]
    :/.babelrc ["http://json.schemastore.org/babelrc"]
    :/.babelrc.json ["http://json.schemastore.org/babelrc"]
    :/babel.config.json ["http://json.schemastore.org/babelrc"]
    :/jsconfig.json ["http://json.schemastore.org/jsconfig"]
    :/jsconfig.*.json ["http://json.schemastore.org/jsconfig"]
    :/project.json ["http://json.schemastore.org/project"]
    :/omnisharp.json ["http://json.schemastore.org/omnisharp"]
    :/.eslintrc.json ["http://json.schemastore.org/eslintrc"]
    :/.eslintrc ["http://json.schemastore.org/eslintrc"])
  "Default json schemas.")
;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
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
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
