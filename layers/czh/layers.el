(configuration-layer/declare-layers
 '(
   (colors :variables
           colors-colorize-identifiers 'all
           colors-enable-nyan-cat-progress-bar t)
   ;; gtags
   lua
   php
   python
   ;; latex
   react
   html
   javascript
   ivy
   (auto-completion :variables
                    auto-completion-enable-snippets-in-popup t)
   better-defaults
   emacs-lisp
   git
   markdown
   org
   treemacs
   ;; (shell :variables
   ;;        shell-default-height 30
   ;;        shell-default-position 'bottom)
   ;; spell-checking
   (syntax-checking :variables
                    syntax-checking-enable-tooltips nil
                    syntax-checking-use-original-bitmaps nil)
   ;; version-control
   ))
