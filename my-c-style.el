;; This establishes custom emacs CC mode rules
;; 
;; Customization instructions found here:
;; http://cc-mode.sourceforge.net/html-manual/Style-Variables.html
;;
;;

(defconst my-c-style
      '((c-tab-always-indent        . t)
        (c-comment-only-line-offset . 0)
        (c-hanging-braces-alist     . ((substatement-open after)
				       (inline-open after)
				       (class-open after)
                                       (brace-list-open)))
        (c-hanging-colons-alist     . ((member-init-intro before)
                                       (inher-intro)
                                       (case-label after)
                                       (label after)
                                       (access-label after)))
        (c-cleanup-list             . (scope-operator
                                       empty-defun-braces
                                       defun-close-semi))
        (c-offsets-alist            . ((arglist-close . c-lineup-arglist)
                                       (substatement-open . 0)
                                       (case-label        . 4)
                                       (block-open        . 0)
                                       (inline-open        . 0)
                                       (inline-close        . 0)
                                       (knr-argdecl-intro . -)))
        (c-echo-syntactic-information-p . t)
        )
        "My C Programming Style")

;; Customizations for all modes in CC Mode.
(defun my-c-mode-common-hook ()
        ;; add my personal style and set it for the current buffer
        (c-add-style "PERSONAL" my-c-style t)
        ;; offset customizations not in my-c-style
        (c-set-offset 'member-init-intro '++)
        ;; other customizations
        (setq tab-width 4
        ;; this will make sure spaces are used instead of tabs
                indent-tabs-mode nil)
        (setq c-basic-offset 4)

        ;;
        ;; we like auto-newline and hungry-delete
        (c-toggle-auto-hungry-state 1)
        ;;
        ;; keybindings for all supported languages.  We can put these in
        ;; c-mode-base-map because c-mode-map, c++-mode-map, objc-mode-map,
        ;; java-mode-map, idl-mode-map, and pike-mode-map inherit from it.
        ;;
        (define-key c-mode-base-map "\C-m" 'newline-and-indent)
)

;; For straight-C
(defun my-c-mode-hook ()
       (setq tab-width 8
        ;; this will make sure spaces are used instead of tabs
                indent-tabs-mode nil)
        (setq c-basic-offset 2)
)

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
(add-hook 'c-mode-hook 'my-c-mode-hook)

(global-set-key [f2]  'undo)
(global-set-key "\M-g" 'goto-line)
(global-set-key "\C-]" 'find-tag)
(global-set-key "\C-t" `pop-tag-mark)
(setq-default make-backup-files nil)
