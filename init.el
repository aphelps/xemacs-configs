;; End of Options Menu Settings

;;(setq load-path (cons "/home/usr/amp/cc-mode-5.31.3" load-path))

;; 
;; Adam's custom changes
;;

;; Enable cscope
;; Uncomment this next line for MacOS
;;(load-file "/opt/local/share/emacs/site-lisp/xcscope.el")
(require 'xcscope)

(load "~/.xemacs/my-c-style")

;; Use cscope on java files
(add-hook 'java-mode-hook (function cscope:hook))

(add-hook 'text-mode-hook 'text-mode-hook-identify)
(add-hook 'text-mode-hook 
          '(lambda () (auto-fill-mode 0)))

(setq line-number-mode t)
(setq column-number-mode t)

;; Scroll with mouse wheel
(define-key global-map 'button4
  '(lambda (&rest args)
    (interactive) 
    (let ((curwin (selected-window)))
      (select-window (car (mouse-pixel-position)))
      (scroll-down 5)
      (select-window curwin)
)))
(define-key global-map [(shift button4)]
  '(lambda (&rest args)
    (interactive) 
    (let ((curwin (selected-window)))
      (select-window (car (mouse-pixel-position)))
      (scroll-down 1)
      (select-window curwin)
)))
(define-key global-map [(control button4)]
  '(lambda (&rest args)
    (interactive) 
    (let ((curwin (selected-window)))
      (select-window (car (mouse-pixel-position)))
      (scroll-down)
      (select-window curwin)
)))

(define-key global-map 'button5
  '(lambda (&rest args)
    (interactive) 
    (let ((curwin (selected-window)))
      (select-window (car (mouse-pixel-position)))
      (scroll-up 5)
      (select-window curwin)
)))
(define-key global-map [(shift button5)]
  '(lambda (&rest args)
    (interactive) 
    (let ((curwin (selected-window)))
      (select-window (car (mouse-pixel-position)))
      (scroll-up 1)
      (select-window curwin)
)))
(define-key global-map [(control button5)]
  '(lambda (&rest args)
    (interactive) 
    (let ((curwin (selected-window)))
      (select-window (car (mouse-pixel-position)))
      (scroll-up)
      (select-window curwin)
)))

;; Add function to revert all buffers to saved
(defun revert-all-buffers ()
  (interactive)
  (let ((current-buffer (buffer-name)))
    (loop for buf in (buffer-list)
          do
          (unless (null (buffer-file-name buf))
            (switch-to-buffer (buffer-name buf))
            (revert-buffer nil t)))
    (switch-to-buffer current-buffer)
    (message "All buffers reverted!")))

;; Force maximum syntax highlighting to be enabled
(require 'font-lock)
(setq-default font-lock-maximum-decoration t)

;; Convert a list of files into a preload list and then load on startup
(shell-command "~/.xemacs/preload.sh")
(load "~/.xemacs/preload")

;; Start with a second frame
(make-frame)
