; (a, b)
; (c, d)
; width of (a, b): e = 1/2 * (b - a)
; width of (c, d): f = 1/2 * (d - c)
; sum of (a, b) and (c, d): g = (a + c, b + d)
; width of g: h = 1/2 * (b + d - (a + c))         = 1/2 * (b + d - a - c)
; sum of e and f: 1/2 * ((b - a) + (d - c))       = 1/2 * (b + d - a - c)

; a = (-2, 2) -> width equal to 2
; b = (-3, 3) -> width equal to 3
; a * b = (-6, 6) -> width equal to 6
; c = (0, 4) -> width equal to 2, same as a
; d = (0, 6) -> width equal to 3, same as b
; c * d = (0, 24) -> width equal to 12
