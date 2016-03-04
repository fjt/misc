(script-fu-register
 "script-fu-shiftlayers"
 "shift layers"
 "moge"
 "FUJITA Yuji (yuji@turnstone.jp)"
 "FUJITA Yuji"
 "2015/06/07"
 "*"
 SF-VALUE "horiz offset" "0.0"
 SF-VALUE "vert offset" "0.0"
)
(script-fu-menu-register "script-fu-shiftlayers" "<Image>/Layer/shift layer")

(define (script-fu-shiftlayers hs vs)
  (shift-them hs vs 0)
  (gimp-displays-flush))

(define (layer-length) (car (gimp-image-get-layers (aref (cadr (gimp-image-list)) 0))))



(define (shift-them hs vs pt)
  (if (< pt (layer-length))
      (and
       (gimp-layer-set-offsets
	(aref (cadr (gimp-image-get-layers (aref (cadr (gimp-image-list)) 0))) pt)
	(* hs pt)
	(* vs pt))
       (shift-them hs vs (+ pt 1)))))
