(require 'evil)

(define-key evil-motion-state-map "n" 'evil-backward-char)
(define-key evil-motion-state-map "e" 'evil-next-line)
(define-key evil-motion-state-map "i" 'evil-previous-line)
(define-key evil-motion-state-map "o" 'evil-forward-char)

(evil-add-hjkl-bindings evil-normal-state-map)
(evil-add-hjkl-bindings evil-visual-state-map)

(define-key evil-window-map "n" 'evil-window-left)
(define-key evil-window-map "e" 'evil-window-down)
(define-key evil-window-map "i" 'evil-window-up)
(define-key evil-window-map "o" 'evil-window-right)

(define-key evil-window-map "\C-n" 'evil-window-left)
(define-key evil-window-map "\C-e" 'evil-window-down)
(define-key evil-window-map "\C-i" 'evil-window-up)
(define-key evil-window-map "\C-o" 'evil-window-right)

(define-key evil-normal-state-map "t" 'evil-search-next)
(define-key evil-normal-state-map "T" 'evil-search-previous)

(define-key evil-normal-state-map "h" 'evil-insert)
(define-key evil-normal-state-map "y" 'evil-open-below)
(define-key evil-normal-state-map "Y" 'evil-open-above)

(define-key evil-visual-state-map "h" evil-inner-text-objects-map)
(define-key evil-operator-state-map "h" evil-inner-text-objects-map)

(define-key evil-insert-state-map (kbd "RET") 'comment-indent-new-line)

(define-key evil-normal-state-map "k" 'evil-yank)
(define-key evil-visual-state-map "k" 'evil-yank)
(define-key evil-normal-state-map "m" 'evil-paste-after)
(define-key evil-normal-state-map "M" 'evil-paste-before)

(define-key evil-visual-state-map "j" 'surround-region)

(define-key evil-visual-state-map "." 'er/expand-region)

(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")

(defun comment-dwim-toggle (&optional arg)
  (interactive "*P")
  (comment-normalize-vars)
  (if (and (not (region-active-p)) (not (looking-at "\s*$")))
      (comment-or-uncomment-region (line-beginning-position) (line-end-position))
    (comment-dwim arg)))
(evil-leader/set-key "c" 'comment-dwim-toggle)

(evil-leader/set-key "p" 'ido-find-file)
(evil-leader/set-key "b" 'ido-switch-buffer)

;; Tags
(evil-leader/set-key "tf" 'find-tag)
(evil-leader/set-key "tb" 'pop-tag-mark)

;; Autocomplete
(eval-after-load 'auto-complete
  '(define-key ac-completing-map (kbd "ESC") 'evil-normal-state))

(evil-leader/set-key "fe" 'flycheck-next-error)
(evil-leader/set-key "fi" 'flycheck-previous-error)

;; Multiple-Cursors Bindings
(evil-leader/set-key "mc" 'mc/mark-all-like-this-dwim)

(provide 'init-keymap)