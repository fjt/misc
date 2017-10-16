(defun web-mode-dom-xpath-list (&optional pos)
  "html path list"
  (interactive)
  (unless pos (setq pos (point)))
  (save-excursion
    (goto-char pos)
    (let (path)
      (while (web-mode-element-parent)
        (setq path (cons (get-text-property (point) 'tag-name) path))
        )
      (reverse path)
      )))

(defun web-mode-element-split ()
  (interactive)
  (save-excursion
    (let* ((pos (point))
	   (tag (car (web-mode-dom-xpath-list)))
	   )
      (web-mode-insert-text-at-pos (concat "<" tag ">") pos)
      (web-mode-insert-text-at-pos (concat "</" tag ">"  "\n") pos))))


(add-hook 'web-mode-hook (lambda ()     (define-key web-mode-map (kbd "C-c C-e C-m") 'web-mode-element-split)))
