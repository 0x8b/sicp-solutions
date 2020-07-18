(define (make-leaf symbol weight)
  (list 'leaf symbol weight))

(define (leaf? object)
  (eq? (car object) 'leaf))

(define (symbol-leaf x)
  (cadr x))

(define (weight-leaf x)
  (caddr x))

(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))

(define (left-branch tree)
  (car tree))

(define (right-branch tree)
  (cadr tree))

(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree))
      (caddr tree)))

(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree)))

(define (decode bits tree)
  (define (decode-1 bits current-branch)
    (if (null? bits)
        '()
        (let ((next-branch (choose-branch (car bits) current-branch)))
          (if (leaf? next-branch)
              (cons (symbol-leaf next-branch)
                    (decode-1 (cdr bits) tree))
              (decode-1 (cdr bits) next-branch)))))

  (decode-1 bits tree))

(define (choose-branch bit branch)
  (cond ((= bit 0) (left-branch branch))
        ((= bit 1) (right-branch branch))
        (else (error "bad bit: CHOOSE-BRANCH" bit))))

(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((< (weight x) (weight (car set))) (cons x set))
        (else (cons (car set)
                    (adjoin-set x (cdr set))))))

(define (make-leaf-set pairs)
  (if (null? pairs)
      '()
      (let ((pair (car pairs)))
        (adjoin-set (make-leaf (car pair)
                               (cadr pair))
                    (make-leaf-set (cdr pairs))))))

; 2.67

(define sample-tree
  (make-code-tree (make-leaf 'A 4)
                  (make-code-tree
                    (make-leaf 'B 2)
                    (make-code-tree
                      (make-leaf 'D 1)
                      (make-leaf 'C 1)))))

(define sample-message '(0 1 1 0 0 1 0 1 0 1 1 1 0))

(decode sample-message sample-tree) ; (a d a b b c a)

; 2.68

(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

(define (encode-symbol symbol tree)
  (if (leaf? tree) '()
    (let ((left (left-branch tree))
          (right (right-branch tree)))
      (cond
        ((memq symbol (symbols left))
         (cons 0 (encode-symbol symbol left)))
        ((memq symbol (symbols right))
         (cons 1 (encode-symbol symbol right)))
        (else (error "bad symbol: ENCODE-SYMBOL" symbol))))))

(let ((encoded (encode '(a d a b b c a) sample-tree)))
  (equal? encoded sample-message)) ; #t

; 2.69

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define (successive-merge set)
  (if (= 1 (length set))
      (car set)
      (successive-merge
        (adjoin-set
          (make-code-tree (car set)
                          (cadr set))
          (cdr (cdr set))))))

(let ((tree (generate-huffman-tree '((A 4) (B 2) (C 1) (D 1)))))
  (equal? tree sample-tree)) ; #t

; 2.70

(define message
  '(get a job
    sha na na na na na na na na
    get a job
    sha na na na na na na na na
    wah yip yip yip yip yip yip yip yip yip
    sha boom))

(let ((alphabet '((a 2) (get 2) (sha 3) (wah 1) (boom 1) (job 2) (na 16) (yip 9)))
      (message '(get a job
                 sha na na na na na na na na
                 get a job
                 sha na na na na na na na na
                 wah yip yip yip yip yip yip yip yip yip
                 sha boom)))
  (let ((tree (generate-huffman-tree alphabet)))
    (let ((encoded (encode message tree)))
      (length encoded)))) ; 84 bits required

; What is the smallest number of bits that would be needed to encde this song
; if we used a fized-length code for the eight-symbol alphabet?
; Ans: 36 * log2(8) = 108 bits

; 2.71

; tree for n=5
;                       ({a b c d e} 31)
;                       |              |
;                 ({a b c d} 15)     (e 16) 1
;                 |            |
;            ({a b c} 7)     (d 8) 01
;            |         |
;        ({a b} 3)   (c 4) 001
;        |       |
; 0000 (a 1)   (b 2) 0001

; How many bits are required to encode the most frequent symbol?
; Ans: 1

; The least frequent symbol?
; Ans: n - 1

(let ((alphabet '((a 1) (b 2) (c 4) (d 8) (e 16)))
      (message '(a b c d e)))
  (let ((tree (generate-huffman-tree alphabet)))
    (encode message tree))) ; (0 0 0 0 0 0 0 1 0 0 1 0 1 1)

; 2.72