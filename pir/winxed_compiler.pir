# Begin generated code

.namespace [ ]

.sub 'isspace'
        .param string __ARG_1
# Body
# {
.annotate 'file', 'winxedst1.winxed'
.annotate 'line', 13
    iseq $I1, __ARG_1, ' '
    if $I1 goto __label_1
    iseq $I1, __ARG_1, "\n"
  __label_1:
    if $I1 goto __label_0
    iseq $I1, __ARG_1, "\t"
  __label_0:
    .return($I1)
# }
.annotate 'line', 14

.end # isspace


.sub 'isdigit'
        .param string __ARG_1
# Body
# {
.annotate 'line', 18
# predefined indexof
    index $I2, '0123456789', __ARG_1
    isgt $I1, $I2, -1
    .return($I1)
# }
.annotate 'line', 19

.end # isdigit


.sub 'hexdigit'
        .param string __ARG_1
# Body
# {
.annotate 'line', 23
# i: $I1
# predefined indexof
    index $I1, '0123456789abcdef0123456789ABCDEF', __ARG_1
.annotate 'line', 24
    lt $I1, 0, __label_0
    mod $I1, $I1, 16
  __label_0: # endif
.annotate 'line', 25
    .return($I1)
# }
.annotate 'line', 26

.end # hexdigit


.sub 'isidentstart'
        .param string __ARG_1
# Body
# {
.annotate 'line', 33
# predefined indexof
.annotate 'line', 30
    index $I2, 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_', __ARG_1
.annotate 'line', 33
    isgt $I1, $I2, -1
.annotate 'line', 30
    .return($I1)
# }
.annotate 'line', 34

.end # isidentstart


.sub 'isident'
        .param string __ARG_1
# Body
# {
.annotate 'line', 42
# predefined indexof
.annotate 'line', 38
    index $I2, 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_$0123456789', __ARG_1
.annotate 'line', 42
    isgt $I1, $I2, -1
.annotate 'line', 38
    .return($I1)
# }
.annotate 'line', 43

.end # isident

# Constant ERRORinternal evaluated at compile time
# Constant ERRORtokenizer evaluated at compile time
# Constant ERRORparser evaluated at compile time

.sub 'Warn'
        .param string __ARG_1
        .param pmc __ARG_2 :optional
        .param int __ARG_3 :opt_flag
# Body
# {
.annotate 'line', 57
# var stderr: $P1
# predefined getstderr
    getstderr $P1
.annotate 'line', 58
    $P1.'print'('WARNING: ')
.annotate 'line', 59
    $P1.'print'(__ARG_1)
.annotate 'line', 60
    unless __ARG_3 goto __label_0
# {
.annotate 'line', 61
    $P1.'print'(' near ')
.annotate 'line', 62
    $P2 = __ARG_2.'show'()
    $P1.'print'($P2)
# }
  __label_0: # endif
.annotate 'line', 64
    $P1.'print'("\n")
# }
.annotate 'line', 65

.end # Warn


.sub 'InternalError'
        .param string __ARG_1
        .param pmc __ARG_2 :optional
        .param int __ARG_3 :opt_flag
# Body
# {
.annotate 'line', 69
    unless __ARG_3 goto __label_0
# {
.annotate 'line', 70
# desc: $S1
    $P1 = __ARG_2.'show'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 71
    concat $S0, __ARG_1, ' near '
    concat $S0, $S0, $S1
    set __ARG_1, $S0
# }
  __label_0: # endif
.annotate 'line', 73
# predefined Error
    root_new $P1, ['parrot';'Exception']
    $P1['message'] = __ARG_1
    $P1['severity'] = 2
    $P1['type'] = 555
    throw $P1
# }
.annotate 'line', 74

.end # InternalError


.sub 'TokenError'
        .param string __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 78
# predefined string
    getattribute $P2, __ARG_2, 'filename'
    set $S1, $P2
# predefined string
    set $S2, __ARG_3
    concat $S3, __ARG_1, ' in '
    concat $S3, $S3, $S1
    concat $S3, $S3, ' line '
    concat $S3, $S3, $S2
# predefined Error
    root_new $P1, ['parrot';'Exception']
    $P1['message'] = $S3
    $P1['severity'] = 2
    $P1['type'] = 556
    throw $P1
# }
.annotate 'line', 80

.end # TokenError


.sub 'SyntaxError'
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 84
# sline: $S1
    getattribute $P1, __ARG_2, 'line'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 85
# file: $S2
    getattribute $P1, __ARG_2, 'file'
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
  __label_1:
.annotate 'line', 86
# desc: $S3
    $P1 = __ARG_2.'viewable'()
    null $S3
    if_null $P1, __label_2
    set $S3, $P1
  __label_2:
.annotate 'line', 87
    concat $S4, __ARG_1, ' in '
    concat $S4, $S4, $S2
    concat $S4, $S4, ' line '
    concat $S4, $S4, $S1
    concat $S4, $S4, ' near '
    concat $S4, $S4, $S3
# predefined Error
    root_new $P1, ['parrot';'Exception']
    $P1['message'] = $S4
    $P1['severity'] = 2
    $P1['type'] = 557
    throw $P1
# }
.annotate 'line', 89

.end # SyntaxError


.sub 'Expected'
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 93
    concat $S1, "Expected ", __ARG_1
    'SyntaxError'($S1, __ARG_2)
# }
.annotate 'line', 94

.end # Expected


.sub 'ExpectedIdentifier'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 98
    'SyntaxError'("Expected identifier", __ARG_1)
# }
.annotate 'line', 99

.end # ExpectedIdentifier


.sub 'ExpectedOp'
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 103
    concat $S1, "Expected '", __ARG_1
    concat $S1, $S1, "'"
    'SyntaxError'($S1, __ARG_2)
# }
.annotate 'line', 104

.end # ExpectedOp


.sub 'RequireOp'
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 108
    $P1 = __ARG_2.'isop'(__ARG_1)
    isfalse $I1, $P1
    unless $I1 goto __label_0
.annotate 'line', 109
    'ExpectedOp'(__ARG_1, __ARG_2)
  __label_0: # endif
# }
.annotate 'line', 110

.end # RequireOp


.sub 'RequireKeyword'
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 114
    $P1 = __ARG_2.'iskeyword'(__ARG_1)
    isfalse $I1, $P1
    unless $I1 goto __label_0
.annotate 'line', 115
    'ExpectedOp'(__ARG_1, __ARG_2)
  __label_0: # endif
# }
.annotate 'line', 116

.end # RequireKeyword


.sub 'RequireIdentifier'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 120
    $P1 = __ARG_1.'isidentifier'()
    isfalse $I1, $P1
    unless $I1 goto __label_0
.annotate 'line', 121
    'ExpectedIdentifier'(__ARG_1)
  __label_0: # endif
# }
.annotate 'line', 122

.end # RequireIdentifier


.sub 'ExpectOp'
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 126
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 127
    'RequireOp'(__ARG_1, $P1)
# }
.annotate 'line', 128

.end # ExpectOp


.sub 'ExpectKeyword'
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 132
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 133
    'RequireKeyword'(__ARG_1, $P1)
# }
.annotate 'line', 134

.end # ExpectKeyword

.namespace [ 'Token' ]

.sub 'Token' :method
        .param string __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 146
    box $P1, __ARG_1
    setattribute self, 'file', $P1
.annotate 'line', 147
    box $P1, __ARG_2
    setattribute self, 'line', $P1
# }
.annotate 'line', 148

.end # Token


.sub 'get_bool' :method :vtable
# Body
# {
.annotate 'line', 151
    .return(1)
# }
.annotate 'line', 152

.end # get_bool


.sub 'get_integer' :method :vtable
# Body
# {
.annotate 'line', 155
    .return(1)
# }
.annotate 'line', 156

.end # get_integer


.sub 'iseof' :method
# Body
# {
.annotate 'line', 158
    .return(0)
# }

.end # iseof


.sub 'iscomment' :method
# Body
# {
.annotate 'line', 159
    .return(0)
# }

.end # iscomment


.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 160
    .return(0)
# }

.end # isidentifier


.sub 'isint' :method
# Body
# {
.annotate 'line', 161
    .return(0)
# }

.end # isint


.sub 'isfloat' :method
# Body
# {
.annotate 'line', 162
    .return(0)
# }

.end # isfloat


.sub 'isstring' :method
# Body
# {
.annotate 'line', 163
    .return(0)
# }

.end # isstring


.sub 'rawstring' :method
# Body
# {
.annotate 'line', 167
    'InternalError'('Not a literal string', self)
# }
.annotate 'line', 168

.end # rawstring


.sub 'getidentifier' :method
# Body
# {
.annotate 'line', 171
    'ExpectedIdentifier'(self)
# }
.annotate 'line', 172

.end # getidentifier


.sub 'iskeyword' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 173
    .return(0)
# }

.end # iskeyword


.sub 'checkkeyword' :method
# Body
# {
.annotate 'line', 174
    .return(0)
# }

.end # checkkeyword


.sub 'isop' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 175
    .return(0)
# }

.end # isop


.sub 'checkop' :method
# Body
# {
.annotate 'line', 176
    .return('')
# }

.end # checkop


.sub 'viewable' :method
# Body
# {
.annotate 'line', 177
    .return('(unknown)')
# }

.end # viewable


.sub 'show' :method
# Body
# {
.annotate 'line', 180
# r: $S1
    $P1 = self.'viewable'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 181
# predefined string
    getattribute $P1, self, 'file'
    set $S2, $P1
# predefined string
    getattribute $P2, self, 'line'
    set $S3, $P2
    concat $S4, $S1, ' at '
    concat $S4, $S4, $S2
    concat $S4, $S4, ' line '
    concat $S4, $S4, $S3
    .return($S4)
# }
.annotate 'line', 182

.end # show

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Token' ]
.annotate 'line', 142
    addattribute $P0, 'file'
.annotate 'line', 143
    addattribute $P0, 'line'
.end
.namespace [ 'TokenEof' ]

.sub 'TokenEof' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 189
    self.'Token'(__ARG_1, 0)
# }
.annotate 'line', 190

.end # TokenEof


.sub 'get_bool' :method :vtable
# Body
# {
.annotate 'line', 193
    .return(0)
# }
.annotate 'line', 194

.end # get_bool


.sub 'get_integer' :method :vtable
# Body
# {
.annotate 'line', 197
    .return(0)
# }
.annotate 'line', 198

.end # get_integer


.sub 'iseof' :method
# Body
# {
.annotate 'line', 199
    .return(1)
# }

.end # iseof


.sub 'viewable' :method
# Body
# {
.annotate 'line', 200
    .return('(End of file)')
# }

.end # viewable

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TokenEof' ]
.annotate 'line', 185
    get_class $P1, [ 'Token' ]
    addparent $P0, $P1
.end
.namespace [ 'TokenWithVal' ]

.sub 'TokenWithVal' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 208
    self.'Token'(__ARG_1, __ARG_2)
.annotate 'line', 209
    box $P1, __ARG_3
    setattribute self, 'str', $P1
# }
.annotate 'line', 210

.end # TokenWithVal


.sub 'get_string' :method :vtable
# Body
# {
.annotate 'line', 211
    getattribute $P1, self, 'str'
    .return($P1)
# }

.end # get_string


.sub 'viewable' :method
# Body
# {
.annotate 'line', 214
    getattribute $P1, self, 'str'
    .return($P1)
# }
.annotate 'line', 215

.end # viewable

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TokenWithVal' ]
.annotate 'line', 203
    get_class $P1, [ 'Token' ]
    addparent $P0, $P1
.annotate 'line', 205
    addattribute $P0, 'str'
.end
.namespace [ 'TokenComment' ]

.sub 'TokenComment' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 222
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 223

.end # TokenComment


.sub 'iscomment' :method
# Body
# {
.annotate 'line', 224
    .return(1)
# }

.end # iscomment

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TokenComment' ]
.annotate 'line', 218
    get_class $P1, [ 'TokenWithVal' ]
    addparent $P0, $P1
.end
.namespace [ 'TokenOp' ]

.sub 'TokenOp' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 231
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 232

.end # TokenOp


.sub 'isop' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 235
    getattribute $P1, self, 'str'
    set $S1, $P1
    iseq $I1, $S1, __ARG_1
    .return($I1)
# }
.annotate 'line', 236

.end # isop


.sub 'checkop' :method
# Body
# {
# predefined string
.annotate 'line', 239
    getattribute $P1, self, 'str'
    set $S1, $P1
    .return($S1)
# }
.annotate 'line', 240

.end # checkop

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TokenOp' ]
.annotate 'line', 227
    get_class $P1, [ 'TokenWithVal' ]
    addparent $P0, $P1
.end
.namespace [ 'TokenIdentifier' ]

.sub 'TokenIdentifier' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 247
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 248

.end # TokenIdentifier


.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 249
    .return(1)
# }

.end # isidentifier


.sub 'getidentifier' :method
# Body
# {
.annotate 'line', 252
    getattribute $P1, self, 'str'
    .return($P1)
# }
.annotate 'line', 253

.end # getidentifier


.sub 'checkkeyword' :method
# Body
# {
# predefined string
.annotate 'line', 256
    getattribute $P1, self, 'str'
    set $S1, $P1
    .return($S1)
# }
.annotate 'line', 257

.end # checkkeyword


.sub 'iskeyword' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 260
    getattribute $P1, self, 'str'
    set $S1, $P1
    iseq $I1, $S1, __ARG_1
    .return($I1)
# }
.annotate 'line', 261

.end # iskeyword

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TokenIdentifier' ]
.annotate 'line', 243
    get_class $P1, [ 'TokenWithVal' ]
    addparent $P0, $P1
.end
.namespace [ 'TokenString' ]

.sub 'isstring' :method
# Body
# {
.annotate 'line', 266
    .return(1)
# }

.end # isstring


.sub 'rawstring' :method
# Body
# {
.annotate 'line', 269
    getattribute $P1, self, 'str'
    .return($P1)
# }
.annotate 'line', 270

.end # rawstring

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TokenString' ]
.annotate 'line', 264
    get_class $P1, [ 'TokenWithVal' ]
    addparent $P0, $P1
.end
.namespace [ 'TokenQuoted' ]

.sub 'TokenQuoted' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 277
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 278

.end # TokenQuoted


.sub 'get_string' :method :vtable
# Body
# {
# predefined string
.annotate 'line', 281
    getattribute $P1, self, 'str'
    set $S1, $P1
    concat $S2, '"', $S1
    concat $S2, $S2, '"'
    .return($S2)
# }
.annotate 'line', 282

.end # get_string


.sub 'viewable' :method
# Body
# {
# predefined string
.annotate 'line', 285
    getattribute $P1, self, 'str'
    set $S1, $P1
    concat $S2, '"', $S1
    concat $S2, $S2, '"'
    .return($S2)
# }
.annotate 'line', 286

.end # viewable


.sub 'getasquoted' :method
# Body
# {
.annotate 'line', 289
    getattribute $P1, self, 'str'
    .return($P1)
# }
.annotate 'line', 290

.end # getasquoted

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TokenQuoted' ]
.annotate 'line', 273
    get_class $P1, [ 'TokenString' ]
    addparent $P0, $P1
.end
.namespace [ 'TokenSingleQuoted' ]

.sub 'TokenSingleQuoted' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 297
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 298

.end # TokenSingleQuoted


.sub 'get_string' :method :vtable
# Body
# {
# predefined string
.annotate 'line', 301
    getattribute $P1, self, 'str'
    set $S1, $P1
    concat $S2, "'", $S1
    concat $S2, $S2, "'"
    .return($S2)
# }
.annotate 'line', 302

.end # get_string


.sub 'viewable' :method
# Body
# {
# predefined string
.annotate 'line', 305
    getattribute $P1, self, 'str'
    set $S1, $P1
    concat $S2, "'", $S1
    concat $S2, $S2, "'"
    .return($S2)
# }
.annotate 'line', 306

.end # viewable


.sub 'getasquoted' :method
# Body
# {
.annotate 'line', 309
# s: $S1
    set $S1, ''
.annotate 'line', 310
    getattribute $P1, self, 'str'
    iter $P2, $P1
    set $P2, 0
  __label_0: # for iteration
    unless $P2 goto __label_1
    shift $S2, $P2
# {
# switch
.annotate 'line', 311
    set $S3, $S2
    set $S4, '"'
    if $S3 == $S4 goto __label_4
    set $S4, '\'
    if $S3 == $S4 goto __label_5
    set $S4, "'"
    if $S3 == $S4 goto __label_6
    goto __label_3
  __label_4: # case
  __label_5: # case
  __label_6: # case
.annotate 'line', 315
    concat $S0, '\', $S2
    set $S2, $S0
    goto __label_2 # break
  __label_3: # default
  __label_2: # switch end
.annotate 'line', 318
    concat $S1, $S1, $S2
# }
    goto __label_0
  __label_1: # endfor
.annotate 'line', 320
    .return($S1)
# }
.annotate 'line', 321

.end # getasquoted

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TokenSingleQuoted' ]
.annotate 'line', 293
    get_class $P1, [ 'TokenString' ]
    addparent $P0, $P1
.end
.namespace [ 'TokenInteger' ]

.sub 'TokenInteger' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 328
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 329

.end # TokenInteger


.sub 'isint' :method
# Body
# {
.annotate 'line', 330
    .return(1)
# }

.end # isint

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TokenInteger' ]
.annotate 'line', 324
    get_class $P1, [ 'TokenWithVal' ]
    addparent $P0, $P1
.end
.namespace [ 'TokenFloat' ]

.sub 'TokenFloat' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 337
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 338

.end # TokenFloat


.sub 'isfloat' :method
# Body
# {
.annotate 'line', 339
    .return(1)
# }

.end # isfloat

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TokenFloat' ]
.annotate 'line', 333
    get_class $P1, [ 'TokenWithVal' ]
    addparent $P0, $P1
.end
.namespace [ ]

.sub 'getquoted'
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 349
# s: $S1
    set $S1, ''
.annotate 'line', 350
# c: $S2
    null $S2
# for loop
.annotate 'line', 351
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_2: # for condition
    eq $S2, '"', __label_1
# {
# switch
.annotate 'line', 352
    set $S4, $S2
    set $S5, ""
    if $S4 == $S5 goto __label_5
    set $S5, "\n"
    if $S4 == $S5 goto __label_6
    set $S5, '\'
    if $S4 == $S5 goto __label_7
    goto __label_4
  __label_5: # case
  __label_6: # case
.annotate 'line', 355
    'TokenError'('Unterminated string', __ARG_1, __ARG_3)
  __label_7: # case
.annotate 'line', 358
# c2: $S3
    $P2 = __ARG_1.'getchar'()
    null $S3
    if_null $P2, __label_8
    set $S3, $P2
  __label_8:
.annotate 'line', 359
    iseq $I1, $S3, ''
    if $I1 goto __label_10
    iseq $I1, $S3, "\n"
  __label_10:
    unless $I1 goto __label_9
.annotate 'line', 360
    'TokenError'('Unterminated string', __ARG_1, __ARG_3)
  __label_9: # endif
.annotate 'line', 361
    concat $S1, $S1, $S2
    concat $S1, $S1, $S3
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 364
    concat $S1, $S1, $S2
  __label_3: # switch end
# }
  __label_0: # for iteration
.annotate 'line', 351
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_2
  __label_1: # for end
.annotate 'line', 367
    new $P2, [ 'TokenQuoted' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenQuoted'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 368

.end # getquoted


.sub 'getsinglequoted'
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 372
# s: $S1
    set $S1, ''
.annotate 'line', 373
# c: $S2
    null $S2
# for loop
.annotate 'line', 374
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_2: # for condition
    eq $S2, "'", __label_1
# {
.annotate 'line', 375
    iseq $I1, $S2, ""
    if $I1 goto __label_4
    iseq $I1, $S2, "\n"
  __label_4:
    unless $I1 goto __label_3
.annotate 'line', 376
    'TokenError'('Unterminated string', __ARG_1, __ARG_3)
  __label_3: # endif
.annotate 'line', 377
    concat $S1, $S1, $S2
# }
  __label_0: # for iteration
.annotate 'line', 374
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_2
  __label_1: # for end
.annotate 'line', 379
    new $P2, [ 'TokenSingleQuoted' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenSingleQuoted'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 380

.end # getsinglequoted


.sub 'getheredoc'
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 384
# mark: $S1
    set $S1, ''
.annotate 'line', 385
# c: $S2
    null $S2
# for loop
.annotate 'line', 386
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_2: # for condition
    eq $S2, "\n", __label_1
# {
# switch
.annotate 'line', 387
    set $S5, $S2
    set $S6, ''
    if $S5 == $S6 goto __label_5
    set $S6, '"'
    if $S5 == $S6 goto __label_6
    set $S6, '\'
    if $S5 == $S6 goto __label_7
    goto __label_4
  __label_5: # case
.annotate 'line', 389
    'TokenError'('Unterminated heredoc', __ARG_1, __ARG_3)
  __label_6: # case
  __label_7: # case
.annotate 'line', 394
    concat $S0, '\', $S2
    set $S2, $S0
    goto __label_3 # break
  __label_4: # default
  __label_3: # switch end
.annotate 'line', 397
    concat $S0, $S1, $S2
    set $S1, $S0
# }
  __label_0: # for iteration
.annotate 'line', 386
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_2
  __label_1: # for end
.annotate 'line', 399
    concat $S0, $S1, ':>>'
    set $S1, $S0
.annotate 'line', 401
# content: $S3
    set $S3, ''
.annotate 'line', 402
# line: $S4
    null $S4
  __label_8: # do
.annotate 'line', 403
# {
.annotate 'line', 404
    set $S4, ''
# for loop
.annotate 'line', 405
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_13: # for condition
    eq $S2, "\n", __label_12
# {
# switch
.annotate 'line', 406
    set $S5, $S2
    set $S6, ''
    if $S5 == $S6 goto __label_16
    set $S6, '"'
    if $S5 == $S6 goto __label_17
    set $S6, '\'
    if $S5 == $S6 goto __label_18
    goto __label_15
  __label_16: # case
.annotate 'line', 408
    'TokenError'('Unterminated heredoc', __ARG_1, __ARG_3)
  __label_17: # case
  __label_18: # case
.annotate 'line', 411
    concat $S0, '\', $S2
    set $S2, $S0
    goto __label_14 # break
  __label_15: # default
  __label_14: # switch end
.annotate 'line', 414
    concat $S4, $S4, $S2
# }
  __label_11: # for iteration
.annotate 'line', 405
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_13
  __label_12: # for end
.annotate 'line', 416
    eq $S4, $S1, __label_19
.annotate 'line', 417
    concat $S3, $S3, $S4
    concat $S3, $S3, '\n'
  __label_19: # endif
# }
  __label_10: # continue
.annotate 'line', 418
    ne $S4, $S1, __label_8
  __label_9: # enddo
.annotate 'line', 419
    new $P2, [ 'TokenQuoted' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenQuoted'($P3, __ARG_3, $S3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 420

.end # getheredoc


.sub 'getident'
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 424
# s: $S1
    set $S1, __ARG_2
.annotate 'line', 425
# c: $S2
    $P1 = __ARG_1.'getchar'()
    null $S2
    if_null $P1, __label_0
    set $S2, $P1
  __label_0:
  __label_2: # while
.annotate 'line', 426
    $P1 = 'isident'($S2)
    if_null $P1, __label_1
    unless $P1 goto __label_1
# {
.annotate 'line', 427
    concat $S1, $S1, $S2
.annotate 'line', 428
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 430
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 431
    new $P2, [ 'TokenIdentifier' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenIdentifier'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 432

.end # getident


.sub 'getnumber'
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 436
# s: $S1
    null $S1
.annotate 'line', 437
# c: $S2
    set $S2, __ARG_2
  __label_0: # do
.annotate 'line', 438
# {
.annotate 'line', 439
    concat $S1, $S1, $S2
.annotate 'line', 440
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
  __label_2: # continue
.annotate 'line', 441
    $P1 = 'isdigit'($S2)
    if_null $P1, __label_1
    if $P1 goto __label_0
  __label_1: # enddo
.annotate 'line', 442
    iseq $I3, $S1, '0'
    unless $I3 goto __label_4
    iseq $I3, $S2, 'x'
    if $I3 goto __label_5
    iseq $I3, $S2, 'X'
  __label_5:
  __label_4:
    unless $I3 goto __label_3
# {
.annotate 'line', 443
# hexval: $I1
    null $I1
# h: $I2
    null $I2
.annotate 'line', 444
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_7: # while
.annotate 'line', 445
    $P1 = 'hexdigit'($S2)
    set $I2, $P1
    lt $I2, 0, __label_6
# {
.annotate 'line', 446
    mul $I3, $I1, 16
    add $I1, $I3, $I2
.annotate 'line', 447
    concat $S1, $S1, $S2
.annotate 'line', 448
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
    goto __label_7
  __label_6: # endwhile
.annotate 'line', 450
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 451
    set $S1, $I1
.annotate 'line', 452
    new $P2, [ 'TokenInteger' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenInteger'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
  __label_3: # endif
.annotate 'line', 454
    ne $S2, '.', __label_8
# {
  __label_10: # do
.annotate 'line', 455
# {
.annotate 'line', 456
    concat $S1, $S1, $S2
.annotate 'line', 457
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
  __label_12: # continue
.annotate 'line', 458
    $P1 = 'isdigit'($S2)
    if_null $P1, __label_11
    if $P1 goto __label_10
  __label_11: # enddo
.annotate 'line', 459
    iseq $I3, $S2, 'e'
    if $I3 goto __label_14
    iseq $I3, $S2, 'E'
  __label_14:
    unless $I3 goto __label_13
# {
.annotate 'line', 460
    concat $S1, $S1, 'E'
.annotate 'line', 461
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    iseq $I3, $S2, '+'
    if $I3 goto __label_16
    iseq $I3, $S2, '-'
  __label_16:
    unless $I3 goto __label_15
# {
.annotate 'line', 462
    concat $S1, $S1, $S2
.annotate 'line', 463
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
  __label_15: # endif
  __label_18: # while
.annotate 'line', 465
    $P1 = 'isdigit'($S2)
    if_null $P1, __label_17
    unless $P1 goto __label_17
# {
.annotate 'line', 466
    concat $S1, $S1, $S2
.annotate 'line', 467
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
    goto __label_18
  __label_17: # endwhile
# }
  __label_13: # endif
.annotate 'line', 470
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 471
    new $P2, [ 'TokenFloat' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenFloat'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
    goto __label_9
  __label_8: # else
# {
.annotate 'line', 474
    iseq $I3, $S2, 'e'
    if $I3 goto __label_21
    iseq $I3, $S2, 'E'
  __label_21:
    unless $I3 goto __label_19
# {
.annotate 'line', 475
    concat $S1, $S1, 'E'
.annotate 'line', 476
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    iseq $I3, $S2, '+'
    if $I3 goto __label_23
    iseq $I3, $S2, '-'
  __label_23:
    unless $I3 goto __label_22
# {
.annotate 'line', 477
    concat $S1, $S1, $S2
.annotate 'line', 478
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
  __label_22: # endif
  __label_25: # while
.annotate 'line', 480
    $P1 = 'isdigit'($S2)
    if_null $P1, __label_24
    unless $P1 goto __label_24
# {
.annotate 'line', 481
    concat $S1, $S1, $S2
.annotate 'line', 482
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
    goto __label_25
  __label_24: # endwhile
.annotate 'line', 484
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 485
    new $P2, [ 'TokenFloat' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenFloat'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
    goto __label_20
  __label_19: # else
# {
.annotate 'line', 488
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 489
    new $P2, [ 'TokenInteger' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenInteger'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
  __label_20: # endif
# }
  __label_9: # endif
# }
.annotate 'line', 492

.end # getnumber


.sub 'getlinecomment'
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 496
# s: $S1
    set $S1, __ARG_2
.annotate 'line', 497
# c: $S2
    $P1 = __ARG_1.'getchar'()
    null $S2
    if_null $P1, __label_0
    set $S2, $P1
  __label_0:
  __label_2: # while
.annotate 'line', 498
    isne $I1, $S2, ''
    unless $I1 goto __label_3
    isne $I1, $S2, "\n"
  __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 499
    concat $S1, $S1, $S2
.annotate 'line', 500
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 502
    new $P2, [ 'TokenComment' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenComment'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 503

.end # getlinecomment


.sub 'getcomment'
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 507
# s: $S1
    set $S1, __ARG_2
.annotate 'line', 508
# c: $S2
    $P1 = __ARG_1.'getchar'()
    null $S2
    if_null $P1, __label_0
    set $S2, $P1
  __label_0:
  __label_1: # do
.annotate 'line', 509
# {
  __label_5: # while
.annotate 'line', 510
    isne $I1, $S2, ''
    unless $I1 goto __label_6
    isne $I1, $S2, '*'
  __label_6:
    unless $I1 goto __label_4
# {
.annotate 'line', 511
    concat $S1, $S1, $S2
.annotate 'line', 512
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
    goto __label_5
  __label_4: # endwhile
.annotate 'line', 514
    ne $S2, '', __label_7
.annotate 'line', 515
    'TokenError'("Unclosed comment", __ARG_1, __ARG_3)
  __label_7: # endif
.annotate 'line', 516
    concat $S1, $S1, $S2
.annotate 'line', 517
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
.annotate 'line', 518
    ne $S2, '', __label_8
.annotate 'line', 519
    'TokenError'("Unclosed comment", __ARG_1, __ARG_3)
  __label_8: # endif
# }
  __label_3: # continue
.annotate 'line', 520
    ne $S2, '/', __label_1
  __label_2: # enddo
.annotate 'line', 521
    concat $S1, $S1, '/'
.annotate 'line', 522
    new $P2, [ 'TokenComment' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenComment'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 523

.end # getcomment


.sub 'getop'
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 527
# s: $S1
    set $S1, __ARG_2
.annotate 'line', 528
    new $P2, [ 'TokenOp' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenOp'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 529

.end # getop

.namespace [ 'Tokenizer' ]

.sub 'Tokenizer' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 545
.const 'Sub' $P2 = 'getop'
.annotate 'line', 547
    setattribute self, 'h', __ARG_1
.annotate 'line', 548
    box $P3, ''
    setattribute self, 'pending', $P3
.annotate 'line', 549
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'stacked', $P4
.annotate 'line', 550
    box $P3, __ARG_2
    setattribute self, 'filename', $P3
.annotate 'line', 551
    box $P3, 1
    setattribute self, 'line', $P3
.annotate 'line', 552
# var select: $P1
    root_new $P1, ['parrot';'Hash']
.annotate 'line', 553
    root_new $P3, ['parrot';'Hash']
    get_hll_global $P4, 'getident'
    $P3[''] = $P4
    $P3['{'] = $P2
    $P1['$'] = $P3
    get_hll_global $P5, 'getquoted'
    $P1['"'] = $P5
    get_hll_global $P6, 'getsinglequoted'
    $P1["'"] = $P6
.annotate 'line', 556
    root_new $P7, ['parrot';'Hash']
.annotate 'line', 557
    root_new $P8, ['parrot';'Hash']
    $P8[''] = $P2
    $P8['='] = $P2
    $P7['='] = $P8
    $P7[':'] = $P2
    $P1['='] = $P7
.annotate 'line', 560
    root_new $P9, ['parrot';'Hash']
    $P9['+'] = $P2
    $P9['='] = $P2
    $P1['+'] = $P9
.annotate 'line', 561
    root_new $P10, ['parrot';'Hash']
    $P10['-'] = $P2
    $P10['='] = $P2
    $P1['-'] = $P10
.annotate 'line', 562
    root_new $P11, ['parrot';'Hash']
    $P11['='] = $P2
    $P1['*'] = $P11
.annotate 'line', 563
    root_new $P12, ['parrot';'Hash']
    $P12['|'] = $P2
    $P1['|'] = $P12
.annotate 'line', 564
    root_new $P13, ['parrot';'Hash']
    $P13['&'] = $P2
    $P1['&'] = $P13
.annotate 'line', 565
    root_new $P14, ['parrot';'Hash']
.annotate 'line', 566
    root_new $P15, ['parrot';'Hash']
    $P15[''] = $P2
    get_hll_global $P16, 'getheredoc'
    $P15[':'] = $P16
    $P14['<'] = $P15
    $P14['='] = $P2
    $P1['<'] = $P14
.annotate 'line', 569
    root_new $P17, ['parrot';'Hash']
    $P17['>'] = $P2
    $P17['='] = $P2
    $P1['>'] = $P17
.annotate 'line', 570
    root_new $P18, ['parrot';'Hash']
.annotate 'line', 571
    root_new $P19, ['parrot';'Hash']
    $P19[''] = $P2
    $P19['='] = $P2
    $P18['='] = $P19
    $P1['!'] = $P18
.annotate 'line', 573
    root_new $P20, ['parrot';'Hash']
    $P20['%'] = $P2
    $P20['='] = $P2
    $P1['%'] = $P20
.annotate 'line', 574
    root_new $P21, ['parrot';'Hash']
    $P21['='] = $P2
    get_hll_global $P22, 'getlinecomment'
    $P21['/'] = $P22
    get_hll_global $P23, 'getcomment'
    $P21['*'] = $P23
    $P1['/'] = $P21
    get_hll_global $P24, 'getlinecomment'
    $P1['#'] = $P24
.annotate 'line', 577
    setattribute self, 'select', $P1
# }
.annotate 'line', 578

.end # Tokenizer


.sub 'getchar' :method
# Body
# {
.annotate 'line', 581
# var pending: $P1
    getattribute $P1, self, 'pending'
.annotate 'line', 582
# c: $S1
    set $P3, $P1
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
  __label_0:
.annotate 'line', 583
    eq $S1, '', __label_1
.annotate 'line', 584
    assign $P1, ''
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 586
# var h: $P2
    getattribute $P2, self, 'h'
.annotate 'line', 587
    $P3 = $P2.'read'(1)
    set $S1, $P3
.annotate 'line', 588
    ne $S1, "\n", __label_3
# {
.annotate 'line', 589
# l: $I1
    getattribute $P3, self, 'line'
    set $I1, $P3
.annotate 'line', 590
    inc $I1
.annotate 'line', 591
    box $P3, $I1
    setattribute self, 'line', $P3
# }
  __label_3: # endif
# }
  __label_2: # endif
.annotate 'line', 594
    .return($S1)
# }
.annotate 'line', 595

.end # getchar


.sub 'ungetchar' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 598
    getattribute $P1, self, 'pending'
    assign $P1, __ARG_1
# }
.annotate 'line', 599

.end # ungetchar


.sub 'get_token' :method
# Body
# {
.annotate 'line', 602
.const 'Sub' $P4 = 'isspace'
.const 'Sub' $P5 = 'isidentstart'
.const 'Sub' $P6 = 'isdigit'
.const 'Sub' $P7 = 'getop'
.const 'Sub' $P8 = 'getident'
.const 'Sub' $P9 = 'getnumber'
.annotate 'line', 605
    getattribute $P10, self, 'stacked'
    if_null $P10, __label_0
    unless $P10 goto __label_0
# {
.annotate 'line', 606
# var t: $P1
    getattribute $P11, self, 'stacked'
    $P1 = $P11.'pop'()
.annotate 'line', 607
    .return($P1)
# }
  __label_0: # endif
.annotate 'line', 609
# c: $S1
    $P10 = self.'getchar'()
    null $S1
    if_null $P10, __label_1
    set $S1, $P10
  __label_1:
  __label_3: # while
.annotate 'line', 610
    $P10 = $P4($S1)
    if_null $P10, __label_2
    unless $P10 goto __label_2
.annotate 'line', 611
    $P11 = self.'getchar'()
    set $S1, $P11
    goto __label_3
  __label_2: # endwhile
.annotate 'line', 612
# line: $I1
    getattribute $P10, self, 'line'
    set $I1, $P10
.annotate 'line', 613
    ne $S1, '', __label_4
.annotate 'line', 614
    new $P11, [ 'TokenEof' ]
    getattribute $P12, self, 'filename'
    $P11.'TokenEof'($P12)
    set $P10, $P11
    .return($P10)
  __label_4: # endif
.annotate 'line', 615
    $P10 = $P5($S1)
    if_null $P10, __label_5
    unless $P10 goto __label_5
.annotate 'line', 616
    .tailcall $P8(self, $S1, $I1)
  __label_5: # endif
.annotate 'line', 617
    $P10 = $P6($S1)
    if_null $P10, __label_6
    unless $P10 goto __label_6
.annotate 'line', 618
    .tailcall $P9(self, $S1, $I1)
  __label_6: # endif
.annotate 'line', 620
# op: $S2
    set $S2, $S1
.annotate 'line', 621
# var select: $P2
    getattribute $P2, self, 'select'
.annotate 'line', 622
# var current: $P3
    $P3 = $P2[$S1]
  __label_8: # while
.annotate 'line', 624
    isnull $I2, $P3
    not $I2
    unless $I2 goto __label_9
    isa $I2, $P3, 'Hash'
  __label_9:
    unless $I2 goto __label_7
# {
.annotate 'line', 625
    $P10 = self.'getchar'()
    set $S1, $P10
.annotate 'line', 626
    set $P2, $P3
.annotate 'line', 627
    $P3 = $P2[$S1]
.annotate 'line', 628
    unless_null $P3, __label_10
# {
.annotate 'line', 629
    self.'ungetchar'($S1)
.annotate 'line', 630
    $P3 = $P2['']
# }
    goto __label_11
  __label_10: # else
.annotate 'line', 633
    concat $S2, $S2, $S1
  __label_11: # endif
# }
    goto __label_8
  __label_7: # endwhile
.annotate 'line', 635
    if_null $P3, __label_12
    unless $P3 goto __label_12
.annotate 'line', 636
    .tailcall $P3(self, $S2, $I1)
  __label_12: # endif
.annotate 'line', 637
    .tailcall $P7(self, $S2, $I1)
# }
.annotate 'line', 638

.end # get_token


.sub 'get' :method
        .param int __ARG_1 :optional
# Body
# {
.annotate 'line', 641
# var t: $P1
    $P1 = self.'get_token'()
  __label_1: # while
.annotate 'line', 642
    $P2 = $P1.'iseof'()
    isfalse $I1, $P2
    unless $I1 goto __label_3
    not $I1, __ARG_1
  __label_3:
    unless $I1 goto __label_2
    $I1 = $P1.'iscomment'()
  __label_2:
    unless $I1 goto __label_0
.annotate 'line', 643
    $P1 = self.'get_token'()
    goto __label_1
  __label_0: # endwhile
.annotate 'line', 644
    .return($P1)
# }
.annotate 'line', 645

.end # get


.sub 'unget' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 648
    getattribute $P1, self, 'stacked'
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 649

.end # unget

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Tokenizer' ]
.annotate 'line', 537
    addattribute $P0, 'h'
.annotate 'line', 538
    addattribute $P0, 'pending'
.annotate 'line', 539
    addattribute $P0, 'select'
.annotate 'line', 540
    addattribute $P0, 'stacked'
.annotate 'line', 541
    addattribute $P0, 'filename'
.annotate 'line', 542
    addattribute $P0, 'line'
.end
.namespace [ ]
# Constant REGint evaluated at compile time
# Constant REGfloat evaluated at compile time
# Constant REGstring evaluated at compile time
# Constant REGvar evaluated at compile time
# Constant REGarglist evaluated at compile time
# Constant REGany evaluated at compile time
# Constant REGraw1 evaluated at compile time
# Constant REGnone evaluated at compile time

.sub 'typetoregcheck'
        .param string __ARG_1
# Body
# {
# switch
.annotate 'line', 670
    set $S1, __ARG_1
    set $S2, 'int'
    if $S1 == $S2 goto __label_2
    set $S2, 'float'
    if $S1 == $S2 goto __label_3
    set $S2, 'string'
    if $S1 == $S2 goto __label_4
    set $S2, 'var'
    if $S1 == $S2 goto __label_5
    goto __label_1
  __label_2: # case
.annotate 'line', 671
    .return('I')
  __label_3: # case
.annotate 'line', 672
    .return('N')
  __label_4: # case
.annotate 'line', 673
    .return('S')
  __label_5: # case
.annotate 'line', 674
    .return('P')
  __label_1: # default
.annotate 'line', 675
    .return('')
  __label_0: # switch end
# }
.annotate 'line', 677

.end # typetoregcheck


.sub 'typetopirname'
        .param string __ARG_1
# Body
# {
# switch
.annotate 'line', 681
    set $S1, __ARG_1
    set $S2, 'I'
    if $S1 == $S2 goto __label_2
    set $S2, 'N'
    if $S1 == $S2 goto __label_3
    set $S2, 'S'
    if $S1 == $S2 goto __label_4
    set $S2, 'P'
    if $S1 == $S2 goto __label_5
    goto __label_1
  __label_2: # case
.annotate 'line', 682
    .return('int')
  __label_3: # case
.annotate 'line', 683
    .return('num')
  __label_4: # case
.annotate 'line', 684
    .return('string')
  __label_5: # case
.annotate 'line', 685
    .return('pmc')
  __label_1: # default
.annotate 'line', 686
    'InternalError'('Invalid reg type')
  __label_0: # switch end
# }
.annotate 'line', 688

.end # typetopirname

# Constant INDENT evaluated at compile time
# Constant INDENTLABEL evaluated at compile time
.namespace [ 'Emit' ]

.sub 'Emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 708
    setattribute self, 'handle', __ARG_1
.annotate 'line', 709
    box $P1, ''
    setattribute self, 'file', $P1
.annotate 'line', 710
    box $P1, 0
    setattribute self, 'line', $P1
.annotate 'line', 711
    box $P1, 0
    setattribute self, 'pendingf', $P1
.annotate 'line', 712
    box $P1, 0
    setattribute self, 'pendingl', $P1
# }
.annotate 'line', 713

.end # Emit


.sub 'disable_annotations' :method
# Body
# {
.annotate 'line', 716
    box $P1, 1
    setattribute self, 'noan', $P1
# }
.annotate 'line', 717

.end # disable_annotations


.sub 'close' :method
# Body
# {
.annotate 'line', 720
    null $P1
    setattribute self, 'handle', $P1
# }
.annotate 'line', 721

.end # close


.sub 'updateannot' :method
# Body
# {
.annotate 'line', 724
    getattribute $P1, self, 'pendingf'
    if_null $P1, __label_0
    unless $P1 goto __label_0
# {
.annotate 'line', 725
    getattribute $P2, self, 'handle'
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, ".annotate 'file', '"
    push $P3, $P4
.annotate 'line', 727
    getattribute $P5, self, 'file'
.annotate 'line', 725
    push $P3, $P5
    box $P4, "'\n"
    push $P3, $P4
# predefined join
    join $S1, "", $P3
    $P2.'print'($S1)
.annotate 'line', 730
    getattribute $P1, self, 'pendingf'
    assign $P1, 0
# }
  __label_0: # endif
.annotate 'line', 732
    getattribute $P1, self, 'pendingl'
    if_null $P1, __label_1
    unless $P1 goto __label_1
# {
.annotate 'line', 733
    getattribute $P2, self, 'handle'
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, ".annotate 'line', "
    push $P3, $P4
.annotate 'line', 735
    getattribute $P5, self, 'line'
.annotate 'line', 733
    push $P3, $P5
    box $P4, "\n"
    push $P3, $P4
# predefined join
    join $S1, "", $P3
    $P2.'print'($S1)
.annotate 'line', 738
    getattribute $P1, self, 'pendingl'
    assign $P1, 0
# }
  __label_1: # endif
# }
.annotate 'line', 740

.end # updateannot


.sub 'vprint' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 743
    iter $P2, __ARG_1
    set $P2, 0
  __label_0: # for iteration
    unless $P2 goto __label_1
    shift $P1, $P2
.annotate 'line', 744
    getattribute $P3, self, 'handle'
    $P3.'print'($P1)
    goto __label_0
  __label_1: # endfor
# }
.annotate 'line', 745

.end # vprint


.sub 'print' :method
        .param pmc __ARG_1 :slurpy
# Body
# {
.annotate 'line', 748
    self.'updateannot'()
.annotate 'line', 749
    self.'vprint'(__ARG_1)
# }
.annotate 'line', 750

.end # print


.sub 'say' :method
        .param pmc __ARG_1 :slurpy
# Body
# {
.annotate 'line', 753
    self.'updateannot'()
.annotate 'line', 754
    self.'vprint'(__ARG_1)
.annotate 'line', 755
    getattribute $P1, self, 'handle'
    $P1.'print'("\n")
# }
.annotate 'line', 756

.end # say


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 759
    getattribute $P3, self, 'noan'
    unless_null $P3, __label_0
# {
.annotate 'line', 761
# var file: $P1
    getattribute $P1, self, 'file'
.annotate 'line', 762
# var line: $P2
    getattribute $P2, self, 'line'
.annotate 'line', 763
# tfile: $S1
    getattribute $P3, __ARG_1, 'file'
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 764
# tline: $I1
    getattribute $P3, __ARG_1, 'line'
    set $I1, $P3
.annotate 'line', 765
    set $S2, $P1
    eq $S2, $S1, __label_2
# {
.annotate 'line', 766
    assign $P1, $S1
.annotate 'line', 767
    getattribute $P3, self, 'pendingf'
    assign $P3, 1
.annotate 'line', 768
    assign $P2, 0
# }
  __label_2: # endif
.annotate 'line', 770
    set $I2, $P2
    eq $I2, $I1, __label_3
# {
.annotate 'line', 771
    assign $P2, $I1
.annotate 'line', 772
    getattribute $P3, self, 'pendingl'
    assign $P3, 1
# }
  __label_3: # endif
# }
  __label_0: # endif
# }
.annotate 'line', 775

.end # annotate


.sub 'comment' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 778
    self.'updateannot'()
.annotate 'line', 779
    getattribute $P1, self, 'handle'
    concat $S1, '# ', __ARG_1
    concat $S1, $S1, "\n"
    $P1.'print'($S1)
# }
.annotate 'line', 780

.end # comment


.sub 'emitlabel' :method
        .param string __ARG_1
        .param string __ARG_2 :optional
# Body
# {
.annotate 'line', 783
# var handle: $P1
    getattribute $P1, self, 'handle'
.annotate 'line', 784
    $P1.'print'('  ')
.annotate 'line', 785
    $P1.'print'(__ARG_1)
.annotate 'line', 786
    $P1.'print'(':')
.annotate 'line', 787
    if_null __ARG_2, __label_0
# {
.annotate 'line', 788
    concat $S1, ' # ', __ARG_2
    $P1.'print'($S1)
# }
  __label_0: # endif
.annotate 'line', 790
    $P1.'print'("\n")
# }
.annotate 'line', 791

.end # emitlabel


.sub 'emitgoto' :method
        .param string __ARG_1
        .param string __ARG_2 :optional
# Body
# {
.annotate 'line', 794
# var handle: $P1
    getattribute $P1, self, 'handle'
.annotate 'line', 795
    $P1.'print'('    goto ')
.annotate 'line', 796
    $P1.'print'(__ARG_1)
.annotate 'line', 797
    if_null __ARG_2, __label_0
# {
.annotate 'line', 798
    $P1.'print'(' # ')
.annotate 'line', 799
    $P1.'print'(__ARG_2)
# }
  __label_0: # endif
.annotate 'line', 801
    $P1.'print'("\n")
# }
.annotate 'line', 802

.end # emitgoto


.sub 'emitarg1' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 806
    concat $S1, '    ', __ARG_1
    concat $S1, $S1, ' '
    concat $S1, $S1, __ARG_2
    self.'say'($S1)
# }
.annotate 'line', 807

.end # emitarg1


.sub 'emitarg2' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 810
    concat $S1, '    ', __ARG_1
    concat $S1, $S1, ' '
    concat $S1, $S1, __ARG_2
    concat $S1, $S1, ', '
    concat $S1, $S1, __ARG_3
    self.'say'($S1)
# }
.annotate 'line', 811

.end # emitarg2


.sub 'emitcompare' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 814
    concat $S1, '    ', __ARG_1
    concat $S1, $S1, ' '
    concat $S1, $S1, __ARG_2
    concat $S1, $S1, ', '
    concat $S1, $S1, __ARG_3
    concat $S1, $S1, ', '
    concat $S1, $S1, __ARG_4
    self.'say'($S1)
# }
.annotate 'line', 815

.end # emitcompare


.sub 'emitif' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 818
    self.'say'('    if ', __ARG_1, ' goto ', __ARG_2)
# }
.annotate 'line', 819

.end # emitif


.sub 'emitunless' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 822
    self.'say'('    unless ', __ARG_1, ' goto ', __ARG_2)
# }
.annotate 'line', 823

.end # emitunless


.sub 'emitif_null' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 826
    self.'say'('    if_null ', __ARG_1, ', ', __ARG_2)
# }
.annotate 'line', 827

.end # emitif_null


.sub 'emitnull' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 830
    self.'say'("    null ", __ARG_1)
# }
.annotate 'line', 831

.end # emitnull


.sub 'emitinc' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 835
    self.'say'('    inc ', __ARG_1)
# }
.annotate 'line', 836

.end # emitinc


.sub 'emitdec' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 839
    self.'say'('    dec ', __ARG_1)
# }
.annotate 'line', 840

.end # emitdec


.sub 'emitset' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 843
    self.'say'("    set ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 844

.end # emitset


.sub 'emitassign' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 847
    self.'say'("    assign ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 848

.end # emitassign


.sub 'emitbox' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 851
    self.'say'("    box ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 852

.end # emitbox


.sub 'emitunbox' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 855
    self.'say'("    unbox ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 856

.end # emitunbox


.sub 'emitbinop' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 859
    self.'say'('    ', __ARG_1, " ", __ARG_2, ", ", __ARG_3, ", ", __ARG_4)
# }
.annotate 'line', 860

.end # emitbinop


.sub 'emitaddto' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 863
    self.'say'("    add ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 864

.end # emitaddto


.sub 'emitsubto' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 867
    self.'say'("    sub ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 868

.end # emitsubto


.sub 'emitadd' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 871
    self.'say'("    add ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 872

.end # emitadd


.sub 'emitsub' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 875
    self.'say'("    sub ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 876

.end # emitsub


.sub 'emitmul' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 879
    self.'say'("    mul ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 880

.end # emitmul


.sub 'emitdiv' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 883
    self.'say'("    div ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 884

.end # emitdiv


.sub 'emitconcat1' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 887
    self.'say'("    concat ", __ARG_1, ", ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 888

.end # emitconcat1


.sub 'emitconcat' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 891
    self.'say'("    concat ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 892

.end # emitconcat


.sub 'emitrepeat' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 895
    self.'say'("    repeat ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 896

.end # emitrepeat


.sub 'emitprint' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 899
    self.'say'('    print ', __ARG_1)
# }
.annotate 'line', 900

.end # emitprint


.sub 'emitsay' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 903
    self.'say'('    say ', __ARG_1)
# }
.annotate 'line', 904

.end # emitsay


.sub 'emitfind_lex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 907
    concat $S1, "    find_lex ", __ARG_1
    concat $S1, $S1, ", '"
    concat $S1, $S1, __ARG_2
    concat $S1, $S1, "'"
    self.'say'($S1)
# }
.annotate 'line', 908

.end # emitfind_lex

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Emit' ]
.annotate 'line', 699
    addattribute $P0, 'handle'
.annotate 'line', 700
    addattribute $P0, 'file'
.annotate 'line', 701
    addattribute $P0, 'line'
.annotate 'line', 702
    addattribute $P0, 'pendingf'
.annotate 'line', 703
    addattribute $P0, 'pendingl'
.annotate 'line', 704
    addattribute $P0, 'noan'
.end
.namespace [ ]

.sub 'integerValue'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 917
    new $P2, [ 'IntegerLiteral' ]
    $P2.'IntegerLiteral'(__ARG_1, __ARG_2, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 918

.end # integerValue


.sub 'floatValue'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param num __ARG_3
# Body
# {
.annotate 'line', 922
# var t: $P1
    new $P1, [ 'TokenFloat' ]
    getattribute $P2, __ARG_2, 'file'
    getattribute $P3, __ARG_2, 'line'
    $P1.'TokenFloat'($P2, $P3, __ARG_3)
.annotate 'line', 923
    new $P3, [ 'FloatLiteral' ]
    $P3.'FloatLiteral'(__ARG_1, $P1)
    set $P2, $P3
    .return($P2)
# }
.annotate 'line', 924

.end # floatValue


.sub 'floatresult'
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 932
# result: $I1
    iseq $I1, __ARG_1, 'N'
    unless $I1 goto __label_1
    iseq $I1, __ARG_2, 'N'
    if $I1 goto __label_2
    iseq $I1, __ARG_2, 'I'
  __label_2:
  __label_1:
    if $I1 goto __label_0
.annotate 'line', 933
    iseq $I1, __ARG_2, 'N'
    unless $I1 goto __label_3
    iseq $I1, __ARG_1, 'N'
    if $I1 goto __label_4
    iseq $I1, __ARG_1, 'I'
  __label_4:
  __label_3:
  __label_0:
.annotate 'line', 934
    .return($I1)
# }
.annotate 'line', 935

.end # floatresult

# Constant NULL evaluated at compile time
# Constant SELF evaluated at compile time
# Constant VAR_is_volatile evaluated at compile time
# Constant VAR_is_lexical evaluated at compile time
# Constant VAR_is_extern evaluated at compile time
# Constant __DEBUG_PREDEFS evaluated at compile time
# Constant PREDEF_arglist evaluated at compile time
# Constant PREDEF_raw1 evaluated at compile time
.namespace [ 'Predef_frombody' ]

.sub 'Predef_frombody' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 972
# l: $I2
# predefined length
    length $I3, __ARG_2
    sub $I2, $I3, 1
.annotate 'line', 973
# predefined substr
    substr $S1, __ARG_2, $I2, 1
    ne $S1, "\n", __label_0
.annotate 'line', 974
# predefined substr
    substr __ARG_2, __ARG_2, 0, $I2
  __label_0: # endif
.annotate 'line', 975
# predefined split
    split $P1, "\n", __ARG_2
# predefined join
    join $S1, "\n    ", $P1
    concat $S0, '    ', $S1
    set __ARG_2, $S0
.annotate 'line', 976
    box $P1, __ARG_2
    setattribute self, 'body', $P1
.annotate 'line', 977
    box $P1, __ARG_1
    setattribute self, 'typeresult', $P1
# }
.annotate 'line', 978

.end # Predef_frombody


.sub 'invoke' :method :vtable
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 981
# typeresult: $S1
    getattribute $P2, self, 'typeresult'
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
  __label_0:
.annotate 'line', 983
    ne $S1, 'v', __label_1
# {
.annotate 'line', 984
    isnull $I1, __ARG_3
    not $I1
    unless $I1 goto __label_4
    isne $I1, __ARG_3, ''
  __label_4:
    unless $I1 goto __label_3
.annotate 'line', 985
    'SyntaxError'('using return value from void predef')
  __label_3: # endif
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 988
    isnull $I1, __ARG_3
    if $I1 goto __label_6
    iseq $I1, __ARG_3, ''
  __label_6:
    unless $I1 goto __label_5
.annotate 'line', 989
    'InternalError'('Bad result in non void predef')
  __label_5: # endif
# }
  __label_2: # endif
.annotate 'line', 992
# var builder: $P1
    new $P1, [ 'StringBuilder' ]
.annotate 'line', 993
    getattribute $P2, self, 'body'
    $P1.'append_format'($P2, __ARG_3, __ARG_4 :flat)
.annotate 'line', 994
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 995
# predefined string
    set $S2, $P1
    __ARG_1.'say'($S2)
# }
.annotate 'line', 996

.end # invoke

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Predef_frombody' ]
.annotate 'line', 958
    addattribute $P0, 'body'
.annotate 'line', 959
    addattribute $P0, 'typeresult'
.end
.namespace [ 'PredefBase' ]

.sub 'PredefBase' :method
        .param string __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param string __ARG_4
        .param string __ARG_5
        .param string __ARG_6
        .param string __ARG_7
# Body
# {
.annotate 'line', 1017
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 1018
    isa $I2, __ARG_2, 'String'
    unless $I2 goto __label_0
.annotate 'line', 1019
    new $P3, [ 'Predef_frombody' ]
    $P3.'Predef_frombody'(__ARG_3, __ARG_2)
    set $P2, $P3
    setattribute self, 'body', $P2
    goto __label_1
  __label_0: # else
.annotate 'line', 1021
    setattribute self, 'body', __ARG_2
  __label_1: # endif
.annotate 'line', 1022
    box $P1, __ARG_3
    setattribute self, 'typeresult', $P1
.annotate 'line', 1023
# n: $I1
    null $I1
.annotate 'line', 1024
    if_null __ARG_4, __label_2
# {
.annotate 'line', 1025
    box $P1, __ARG_4
    setattribute self, 'type0', $P1
# switch
.annotate 'line', 1026
    set $S1, __ARG_4
    set $S2, '*'
    if $S1 == $S2 goto __label_5
    set $S2, '!'
    if $S1 == $S2 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 1028
    set $I1, -1
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 1031
    set $I1, -2
.annotate 'line', 1032
    if_null __ARG_5, __label_7
.annotate 'line', 1033
    concat $S3, "Invalid predef '", __ARG_1
    concat $S3, $S3, '"'
    'InternalError'($S3)
  __label_7: # endif
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 1036
    set $I1, 1
.annotate 'line', 1037
    if_null __ARG_5, __label_8
# {
.annotate 'line', 1038
    box $P1, __ARG_5
    setattribute self, 'type1', $P1
.annotate 'line', 1039
    inc $I1
# }
  __label_8: # endif
.annotate 'line', 1041
    if_null __ARG_6, __label_9
# {
.annotate 'line', 1042
    box $P1, __ARG_6
    setattribute self, 'type2', $P1
.annotate 'line', 1043
    inc $I1
# }
  __label_9: # endif
.annotate 'line', 1045
    if_null __ARG_7, __label_10
# {
.annotate 'line', 1046
    box $P1, __ARG_7
    setattribute self, 'type3', $P1
.annotate 'line', 1047
    inc $I1
# }
  __label_10: # endif
  __label_3: # switch end
# }
  __label_2: # endif
.annotate 'line', 1051
    box $P1, $I1
    setattribute self, 'nparams', $P1
# }
.annotate 'line', 1052

.end # PredefBase


.sub 'name' :method
# Body
# {
.annotate 'line', 1055
# name: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 1056
    .return($S1)
# }
.annotate 'line', 1057

.end # name


.sub 'result' :method
# Body
# {
.annotate 'line', 1060
    getattribute $P1, self, 'typeresult'
    .return($P1)
# }
.annotate 'line', 1061

.end # result


.sub 'params' :method
# Body
# {
.annotate 'line', 1062
    getattribute $P1, self, 'nparams'
    .return($P1)
# }

.end # params


.sub 'paramtype' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 1065
# type: $S1
    null $S1
# switch
.annotate 'line', 1066
    set $I1, __ARG_1
    null $I2
    if $I1 == $I2 goto __label_2
    set $I2, 1
    if $I1 == $I2 goto __label_3
    set $I2, 2
    if $I1 == $I2 goto __label_4
    set $I2, 3
    if $I1 == $I2 goto __label_5
    goto __label_1
  __label_2: # case
.annotate 'line', 1067
    getattribute $P1, self, 'type0'
    set $S1, $P1
    goto __label_0 # break
  __label_3: # case
.annotate 'line', 1068
    getattribute $P2, self, 'type1'
    set $S1, $P2
    goto __label_0 # break
  __label_4: # case
.annotate 'line', 1069
    getattribute $P3, self, 'type2'
    set $S1, $P3
    goto __label_0 # break
  __label_5: # case
.annotate 'line', 1070
    getattribute $P4, self, 'type3'
    set $S1, $P4
    goto __label_0 # break
  __label_1: # default
.annotate 'line', 1072
    'InternalError'('Invalid predef arg')
  __label_0: # switch end
.annotate 'line', 1074
    .return($S1)
# }
.annotate 'line', 1075

.end # paramtype


.sub 'expand' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 1078
# predefined string
    getattribute $P2, self, 'name'
    set $S2, $P2
    concat $S3, 'predefined ', $S2
    __ARG_1.'comment'($S3)
.annotate 'line', 1079
# typeresult: $S1
    getattribute $P2, self, 'typeresult'
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
  __label_0:
.annotate 'line', 1080
    isne $I1, $S1, 'v'
    unless $I1 goto __label_2
    iseq $I1, __ARG_4, ''
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 1081
    $P2 = __ARG_2.'tempreg'($S1)
    set __ARG_4, $P2
  __label_1: # endif
.annotate 'line', 1082
# var fun: $P1
    getattribute $P1, self, 'body'
.annotate 'line', 1083
    $P1(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
# }
.annotate 'line', 1084

.end # expand

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'PredefBase' ]
.annotate 'line', 1001
    addattribute $P0, 'name'
.annotate 'line', 1002
    addattribute $P0, 'body'
.annotate 'line', 1003
    addattribute $P0, 'typeresult'
.annotate 'line', 1004
    addattribute $P0, 'type0'
.annotate 'line', 1005
    addattribute $P0, 'type1'
.annotate 'line', 1006
    addattribute $P0, 'type2'
.annotate 'line', 1007
    addattribute $P0, 'type3'
.annotate 'line', 1008
    addattribute $P0, 'nparams'
.end
.namespace [ 'PredefFunction' ]

.sub 'PredefFunction' :method
        .param string __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param string __ARG_4 :optional
        .param string __ARG_5 :optional
        .param string __ARG_6 :optional
        .param string __ARG_7 :optional
# Body
# {
.annotate 'line', 1096
    self.'PredefBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7)
# }
.annotate 'line', 1097

.end # PredefFunction

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'PredefFunction' ]
.annotate 'line', 1087
    get_class $P1, [ 'PredefBase' ]
    addparent $P0, $P1
.end
.namespace [ 'PredefFunctionEval' ]

.sub 'PredefFunctionEval' :method
        .param string __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param string __ARG_5 :optional
        .param string __ARG_6 :optional
        .param string __ARG_7 :optional
        .param string __ARG_8 :optional
# Body
# {
.annotate 'line', 1110
    self.'PredefBase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7, __ARG_8)
.annotate 'line', 1111
    setattribute self, 'evalfun', __ARG_2
# }
.annotate 'line', 1112

.end # PredefFunctionEval

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'PredefFunctionEval' ]
.annotate 'line', 1100
    get_class $P1, [ 'PredefBase' ]
    addparent $P0, $P1
.annotate 'line', 1102
    addattribute $P0, 'evalfun'
.end
.namespace [ 'Predef_typecast' ]

.sub 'Predef_typecast' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1120
    box $P1, __ARG_1
    setattribute self, 'type', $P1
# }
.annotate 'line', 1121

.end # Predef_typecast


.sub 'invoke' :method :vtable
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 1124
# type: $S1
    getattribute $P2, self, 'type'
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
  __label_0:
.annotate 'line', 1125
# predefined elements
    elements $I1, __ARG_4
    eq $I1, 1, __label_1
.annotate 'line', 1126
    'InternalError'("Invalid Predef_typecast.invoke call")
  __label_1: # endif
.annotate 'line', 1127
# var rawarg: $P1
    $P1 = __ARG_4[0]
.annotate 'line', 1128
# argtype: $S2
    $P2 = $P1.'checkresult'()
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
# switch-case
.annotate 'line', 1130
    iseq $I1, $S2, $S1
    if $I1 goto __label_5
.annotate 'line', 1131
    isa $I1, $P1, [ 'IndexExpr' ]
    if $I1 goto __label_6
    goto __label_4
  __label_5: # case
  __label_6: # case
.annotate 'line', 1132
    $P1.'emit'(__ARG_1, __ARG_3)
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 1135
# arg: $S3
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P2, __label_7
    set $S3, $P2
  __label_7:
.annotate 'line', 1136
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1138
    ne $S3, 'null', __label_8
.annotate 'line', 1139
    __ARG_1.'emitnull'(__ARG_3)
    goto __label_9
  __label_8: # else
.annotate 'line', 1141
    __ARG_1.'emitset'(__ARG_3, $S3)
  __label_9: # endif
  __label_3: # switch end
# }
.annotate 'line', 1143

.end # invoke

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Predef_typecast' ]
.annotate 'line', 1117
    addattribute $P0, 'type'
.end
.namespace [ ]

.sub 'Predef_say'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 1148
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1149
# n: $I1
# predefined elements
    elements $I3, __ARG_4
    sub $I1, $I3, 1
.annotate 'line', 1150
    lt $I1, 0, __label_0
# {
# for loop
.annotate 'line', 1151
# i: $I2
    null $I2
  __label_4: # for condition
    ge $I2, $I1, __label_3
.annotate 'line', 1152
    $P1 = __ARG_4[$I2]
    __ARG_1.'emitprint'($P1)
  __label_2: # for iteration
.annotate 'line', 1151
    inc $I2
    goto __label_4
  __label_3: # for end
.annotate 'line', 1153
    $P1 = __ARG_4[$I1]
    __ARG_1.'emitsay'($P1)
# }
    goto __label_1
  __label_0: # else
.annotate 'line', 1156
    __ARG_1.'emitsay'("''")
  __label_1: # endif
# }
.annotate 'line', 1157

.end # Predef_say


.sub 'Predef_cry'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 1161
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1162
    __ARG_1.'say'('    ', "getstderr $P0")
.annotate 'line', 1163
# n: $I1
# predefined elements
    elements $I1, __ARG_4
# for loop
.annotate 'line', 1164
# i: $I2
    null $I2
  __label_2: # for condition
    ge $I2, $I1, __label_1
.annotate 'line', 1165
    $P1 = __ARG_4[$I2]
    __ARG_1.'say'('    ', "print $P0, ", $P1)
  __label_0: # for iteration
.annotate 'line', 1164
    inc $I2
    goto __label_2
  __label_1: # for end
.annotate 'line', 1166
    __ARG_1.'say'('    ', "print $P0, \"\\n\"")
# }
.annotate 'line', 1167

.end # Predef_cry


.sub 'Predef_print'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 1171
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1172
# n: $I1
# predefined elements
    elements $I1, __ARG_4
# for loop
.annotate 'line', 1173
# i: $I2
    null $I2
  __label_2: # for condition
    ge $I2, $I1, __label_1
.annotate 'line', 1174
    $P1 = __ARG_4[$I2]
    __ARG_1.'emitprint'($P1)
  __label_0: # for iteration
.annotate 'line', 1173
    inc $I2
    goto __label_2
  __label_1: # for end
# }
.annotate 'line', 1175

.end # Predef_print


.sub 'Predef_invoke'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 1181
# var arg: $P1
    $P1 = __ARG_4[0]
.annotate 'line', 1182
    isa $I2, $P1, [ 'CallExpr' ]
    not $I1, $I2
    unless $I1 goto __label_0
.annotate 'line', 1183
    'SyntaxError'("invoke argument must be callable", __ARG_2)
  __label_0: # endif
.annotate 'line', 1184
    concat $S1, "(", __ARG_3
    concat $S1, $S1, " :call_sig)"
    $P1.'emit'(__ARG_1, $S1)
# }
.annotate 'line', 1185

.end # Predef_invoke


.sub 'predefeval_length' :subid('WSubId_1')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1189
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1190
# s: $S1
    $P2 = $P1.'get_value'()
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
  __label_0:
.annotate 'line', 1191
# predefined length
    length $I1, $S1
    .tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1192

.end # predefeval_length


.sub 'predefeval_bytelength' :subid('WSubId_2')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1196
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1197
# s: $S1
    $P2 = $P1.'get_value'()
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
  __label_0:
.annotate 'line', 1198
# predefined bytelength
    bytelength $I1, $S1
    .tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1199

.end # predefeval_bytelength


.sub 'predefeval_ord' :subid('WSubId_4')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1203
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1204
# s: $S1
    $P2 = $P1.'get_value'()
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
  __label_0:
.annotate 'line', 1205
# predefined ord
    ord $I1, $S1
    .tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1206

.end # predefeval_ord


.sub 'predefeval_ord_n' :subid('WSubId_5')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1210
# var arg: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1211
# s: $S1
    $P3 = $P1.'get_value'()
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
  __label_0:
.annotate 'line', 1212
# var argn: $P2
    $P3 = __ARG_3[1]
    getattribute $P2, $P3, 'arg'
.annotate 'line', 1213
# n: $I1
    getattribute $P3, $P2, 'numval'
    set $I1, $P3
.annotate 'line', 1214
# predefined ord
    ord $I2, $S1, $I1
    .tailcall 'integerValue'(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 1215

.end # predefeval_ord_n


.sub 'predefeval_chr' :subid('WSubId_3')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1219
# var arg: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1221
# n: $I1
    getattribute $P3, $P1, 'numval'
    set $I1, $P3
.annotate 'line', 1222
# s: $S1
# predefined chr
    chr $S0, $I1
    find_encoding $I0, 'utf8'
    trans_encoding $S1, $S0, $I0
.annotate 'line', 1224
# var t: $P2
    new $P2, [ 'TokenQuoted' ]
    getattribute $P3, __ARG_2, 'file'
    getattribute $P4, __ARG_2, 'line'
    $P2.'TokenQuoted'($P3, $P4, $S1)
.annotate 'line', 1225
    new $P4, [ 'StringLiteral' ]
    $P4.'StringLiteral'(__ARG_1, $P2)
    set $P3, $P4
    .return($P3)
# }
.annotate 'line', 1226

.end # predefeval_chr


.sub 'predefeval_substr' :subid('WSubId_6')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1230
# var argstr: $P1
    $P4 = __ARG_3[0]
    getattribute $P1, $P4, 'arg'
.annotate 'line', 1231
# var argpos: $P2
    $P4 = __ARG_3[1]
    getattribute $P2, $P4, 'arg'
.annotate 'line', 1232
# str: $S1
    $P4 = $P1.'get_value'()
    null $S1
    if_null $P4, __label_0
    set $S1, $P4
  __label_0:
.annotate 'line', 1233
# pos: $I1
    getattribute $P4, $P2, 'numval'
    set $I1, $P4
.annotate 'line', 1235
# var t: $P3
    new $P3, [ 'TokenQuoted' ]
    getattribute $P4, __ARG_2, 'file'
    getattribute $P5, __ARG_2, 'line'
# predefined substr
    substr $S2, $S1, $I1
    $P3.'TokenQuoted'($P4, $P5, $S2)
.annotate 'line', 1236
    new $P5, [ 'StringLiteral' ]
    $P5.'StringLiteral'(__ARG_1, $P3)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 1237

.end # predefeval_substr


.sub 'predefeval_substr_l' :subid('WSubId_7')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1241
# var argstr: $P1
    $P5 = __ARG_3[0]
    getattribute $P1, $P5, 'arg'
.annotate 'line', 1242
# var argpos: $P2
    $P5 = __ARG_3[1]
    getattribute $P2, $P5, 'arg'
.annotate 'line', 1243
# var arglen: $P3
    $P5 = __ARG_3[2]
    getattribute $P3, $P5, 'arg'
.annotate 'line', 1244
# str: $S1
    $P5 = $P1.'get_value'()
    null $S1
    if_null $P5, __label_0
    set $S1, $P5
  __label_0:
.annotate 'line', 1245
# pos: $I1
    getattribute $P5, $P2, 'numval'
    set $I1, $P5
.annotate 'line', 1246
# len: $I2
    getattribute $P5, $P3, 'numval'
    set $I2, $P5
.annotate 'line', 1248
# var t: $P4
    new $P4, [ 'TokenQuoted' ]
    getattribute $P5, __ARG_2, 'file'
    getattribute $P6, __ARG_2, 'line'
# predefined substr
    substr $S2, $S1, $I1, $I2
    $P4.'TokenQuoted'($P5, $P6, $S2)
.annotate 'line', 1249
    new $P6, [ 'StringLiteral' ]
    $P6.'StringLiteral'(__ARG_1, $P4)
    set $P5, $P6
    .return($P5)
# }
.annotate 'line', 1250

.end # predefeval_substr_l


.sub 'predefeval_indexof' :subid('WSubId_8')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1254
# var argstrfrom: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1255
# var argstrsearch: $P2
    $P3 = __ARG_3[1]
    getattribute $P2, $P3, 'arg'
.annotate 'line', 1256
# strfrom: $S1
    $P3 = $P1.'get_value'()
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
  __label_0:
.annotate 'line', 1257
# strsearch: $S2
    $P3 = $P2.'get_value'()
    null $S2
    if_null $P3, __label_1
    set $S2, $P3
  __label_1:
.annotate 'line', 1258
# predefined indexof
    index $I1, $S1, $S2
    .tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1259

.end # predefeval_indexof


.sub 'predefeval_indexof_pos' :subid('WSubId_9')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1263
# var argstrfrom: $P1
    $P4 = __ARG_3[0]
    getattribute $P1, $P4, 'arg'
.annotate 'line', 1264
# var argstrsearch: $P2
    $P4 = __ARG_3[1]
    getattribute $P2, $P4, 'arg'
.annotate 'line', 1265
# var argpos: $P3
    $P4 = __ARG_3[2]
    getattribute $P3, $P4, 'arg'
.annotate 'line', 1266
# strfrom: $S1
    $P4 = $P1.'get_value'()
    null $S1
    if_null $P4, __label_0
    set $S1, $P4
  __label_0:
.annotate 'line', 1267
# strsearch: $S2
    $P4 = $P2.'get_value'()
    null $S2
    if_null $P4, __label_1
    set $S2, $P4
  __label_1:
.annotate 'line', 1268
# pos: $I1
    getattribute $P4, $P3, 'numval'
    set $I1, $P4
.annotate 'line', 1269
# predefined indexof
    index $I2, $S1, $S2, $I1
    .tailcall 'integerValue'(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 1270

.end # predefeval_indexof_pos


.sub 'getpredefs'
# Body
# {
.const 'Sub' $P2 = "WSubId_1"
.const 'Sub' $P3 = "WSubId_2"
.const 'Sub' $P4 = "WSubId_3"
.const 'Sub' $P5 = "WSubId_4"
.const 'Sub' $P6 = "WSubId_5"
.const 'Sub' $P7 = "WSubId_6"
.const 'Sub' $P8 = "WSubId_7"
.const 'Sub' $P9 = "WSubId_8"
.const 'Sub' $P10 = "WSubId_9"
.annotate 'line', 1283
.const 'Sub' $P11 = 'Predef_print'
.const 'Sub' $P12 = 'Predef_say'
.const 'Sub' $P13 = 'Predef_cry'
.const 'Sub' $P14 = 'Predef_invoke'
.annotate 'line', 1285
# var predefs: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1286
    new $P17, [ 'PredefFunction' ]
.annotate 'line', 1287
    new $P19, [ 'Predef_typecast' ]
    $P19.'Predef_typecast'('I')
    set $P18, $P19
    $P17.'PredefFunction'('int', $P18, 'I', '!')
    set $P16, $P17
.annotate 'line', 1285
    push $P1, $P16
.annotate 'line', 1290
    new $P21, [ 'PredefFunction' ]
.annotate 'line', 1291
    new $P23, [ 'Predef_typecast' ]
    $P23.'Predef_typecast'('N')
    set $P22, $P23
    $P21.'PredefFunction'('float', $P22, 'N', '!')
    set $P20, $P21
.annotate 'line', 1285
    push $P1, $P20
.annotate 'line', 1294
    new $P25, [ 'PredefFunction' ]
.annotate 'line', 1295
    new $P27, [ 'Predef_typecast' ]
    $P27.'Predef_typecast'('S')
    set $P26, $P27
    $P25.'PredefFunction'('string', $P26, 'S', '!')
    set $P24, $P25
.annotate 'line', 1285
    push $P1, $P24
.annotate 'line', 1298
    new $P29, [ 'PredefFunction' ]
    $P29.'PredefFunction'('die', 'die %1', 'v', 'S')
    set $P28, $P29
.annotate 'line', 1285
    push $P1, $P28
.annotate 'line', 1302
    new $P31, [ 'PredefFunction' ]
    $P31.'PredefFunction'('exit', 'exit %1', 'v', 'I')
    set $P30, $P31
.annotate 'line', 1285
    push $P1, $P30
.annotate 'line', 1306
    new $P33, [ 'PredefFunction' ]
    $P33.'PredefFunction'('time', 'time %0', 'I')
    set $P32, $P33
.annotate 'line', 1285
    push $P1, $P32
.annotate 'line', 1310
    new $P35, [ 'PredefFunction' ]
    $P35.'PredefFunction'('floattime', 'time %0', 'N')
    set $P34, $P35
.annotate 'line', 1285
    push $P1, $P34
.annotate 'line', 1314
    new $P37, [ 'PredefFunction' ]
    $P37.'PredefFunction'('spawnw', 'spawnw %0, %1', 'I', 'P')
    set $P36, $P37
.annotate 'line', 1285
    push $P1, $P36
.annotate 'line', 1318
    new $P39, [ 'PredefFunction' ]
    $P39.'PredefFunction'('getstdin', 'getstdin %0', 'P')
    set $P38, $P39
.annotate 'line', 1285
    push $P1, $P38
.annotate 'line', 1322
    new $P41, [ 'PredefFunction' ]
    $P41.'PredefFunction'('getstdout', 'getstdout %0', 'P')
    set $P40, $P41
.annotate 'line', 1285
    push $P1, $P40
.annotate 'line', 1326
    new $P43, [ 'PredefFunction' ]
    $P43.'PredefFunction'('getstderr', 'getstderr %0', 'P')
    set $P42, $P43
.annotate 'line', 1285
    push $P1, $P42
.annotate 'line', 1330
    new $P45, [ 'PredefFunction' ]
    $P45.'PredefFunction'('open', "root_new %0, ['parrot';'FileHandle']\n%0.'open'(%1)\n", 'P', 'S')
    set $P44, $P45
.annotate 'line', 1285
    push $P1, $P44
.annotate 'line', 1337
    new $P47, [ 'PredefFunction' ]
    $P47.'PredefFunction'('open', "root_new %0, ['parrot';'FileHandle']\n%0.'open'(%1,%2)\n", 'P', 'S', 'S')
    set $P46, $P47
.annotate 'line', 1285
    push $P1, $P46
.annotate 'line', 1344
    new $P49, [ 'PredefFunction' ]
    $P49.'PredefFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n", 'P', 'S')
    set $P48, $P49
.annotate 'line', 1285
    push $P1, $P48
.annotate 'line', 1351
    new $P51, [ 'PredefFunction' ]
    $P51.'PredefFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n", 'P', 'S', 'I')
    set $P50, $P51
.annotate 'line', 1285
    push $P1, $P50
.annotate 'line', 1359
    new $P53, [ 'PredefFunction' ]
    $P53.'PredefFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n%0['type'] = %3\n", 'P', 'S', 'I', 'I')
    set $P52, $P53
.annotate 'line', 1285
    push $P1, $P52
.annotate 'line', 1368
    new $P55, [ 'PredefFunction' ]
    $P55.'PredefFunction'('elements', 'elements %0, %1', 'I', 'P')
    set $P54, $P55
.annotate 'line', 1285
    push $P1, $P54
.annotate 'line', 1372
    new $P57, [ 'PredefFunctionEval' ]
.annotate 'line', 1373
    $P57.'PredefFunctionEval'('length', $P2, 'length %0, %1', 'I', 'S')
    set $P56, $P57
.annotate 'line', 1285
    push $P1, $P56
.annotate 'line', 1377
    new $P59, [ 'PredefFunctionEval' ]
.annotate 'line', 1378
    $P59.'PredefFunctionEval'('bytelength', $P3, 'bytelength %0, %1', 'I', 'S')
    set $P58, $P59
.annotate 'line', 1285
    push $P1, $P58
.annotate 'line', 1382
    new $P61, [ 'PredefFunctionEval' ]
.annotate 'line', 1383
    $P61.'PredefFunctionEval'('chr', $P4, "chr $S0, %1\nfind_encoding $I0, 'utf8'\ntrans_encoding %0, $S0, $I0\n", 'S', 'I')
    set $P60, $P61
.annotate 'line', 1285
    push $P1, $P60
.annotate 'line', 1391
    new $P63, [ 'PredefFunctionEval' ]
.annotate 'line', 1392
    $P63.'PredefFunctionEval'('ord', $P5, 'ord %0, %1', 'I', 'S')
    set $P62, $P63
.annotate 'line', 1285
    push $P1, $P62
.annotate 'line', 1396
    new $P65, [ 'PredefFunctionEval' ]
.annotate 'line', 1397
    $P65.'PredefFunctionEval'('ord', $P6, 'ord %0, %1, %2', 'I', 'S', 'I')
    set $P64, $P65
.annotate 'line', 1285
    push $P1, $P64
.annotate 'line', 1401
    new $P67, [ 'PredefFunctionEval' ]
.annotate 'line', 1402
    $P67.'PredefFunctionEval'('substr', $P7, 'substr %0, %1, %2', 'S', 'S', 'I')
    set $P66, $P67
.annotate 'line', 1285
    push $P1, $P66
.annotate 'line', 1406
    new $P69, [ 'PredefFunctionEval' ]
.annotate 'line', 1407
    $P69.'PredefFunctionEval'('substr', $P8, 'substr %0, %1, %2, %3', 'S', 'S', 'I', 'I')
    set $P68, $P69
.annotate 'line', 1285
    push $P1, $P68
.annotate 'line', 1411
    new $P71, [ 'PredefFunction' ]
    $P71.'PredefFunction'('replace', 'replace %0, %1, %2, %3, %4', 'S', 'S', 'I', 'I', 'S')
    set $P70, $P71
.annotate 'line', 1285
    push $P1, $P70
.annotate 'line', 1415
    new $P73, [ 'PredefFunctionEval' ]
.annotate 'line', 1416
    $P73.'PredefFunctionEval'('indexof', $P9, 'index %0, %1, %2', 'I', 'S', 'S')
    set $P72, $P73
.annotate 'line', 1285
    push $P1, $P72
.annotate 'line', 1420
    new $P75, [ 'PredefFunctionEval' ]
.annotate 'line', 1421
    $P75.'PredefFunctionEval'('indexof', $P10, 'index %0, %1, %2, %3', 'I', 'S', 'S', 'I')
    set $P74, $P75
.annotate 'line', 1285
    push $P1, $P74
.annotate 'line', 1425
    new $P77, [ 'PredefFunction' ]
    $P77.'PredefFunction'('join', 'join %0, %1, %2', 'S', 'S', 'P')
    set $P76, $P77
.annotate 'line', 1285
    push $P1, $P76
.annotate 'line', 1429
    new $P79, [ 'PredefFunction' ]
    $P79.'PredefFunction'('upcase', 'upcase %0, %1', 'S', 'S')
    set $P78, $P79
.annotate 'line', 1285
    push $P1, $P78
.annotate 'line', 1433
    new $P81, [ 'PredefFunction' ]
    $P81.'PredefFunction'('downcase', 'downcase %0, %1', 'S', 'S')
    set $P80, $P81
.annotate 'line', 1285
    push $P1, $P80
.annotate 'line', 1437
    new $P83, [ 'PredefFunction' ]
    $P83.'PredefFunction'('titlecase', 'titlecase %0, %1', 'S', 'S')
    set $P82, $P83
.annotate 'line', 1285
    push $P1, $P82
.annotate 'line', 1441
    new $P85, [ 'PredefFunction' ]
    $P85.'PredefFunction'('split', 'split %0, %1, %2', 'P', 'S', 'S')
    set $P84, $P85
.annotate 'line', 1285
    push $P1, $P84
.annotate 'line', 1445
    new $P87, [ 'PredefFunction' ]
    $P87.'PredefFunction'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n%0 = $P0(%1)\n", 'S', 'S')
    set $P86, $P87
.annotate 'line', 1285
    push $P1, $P86
.annotate 'line', 1452
    new $P89, [ 'PredefFunction' ]
    $P89.'PredefFunction'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n%0 = $P0(%1, %2)\n", 'S', 'S', 'S')
    set $P88, $P89
.annotate 'line', 1285
    push $P1, $P88
.annotate 'line', 1459
    new $P91, [ 'PredefFunction' ]
    $P91.'PredefFunction'('push', 'push %1, %2', 'v', 'P', '?')
    set $P90, $P91
.annotate 'line', 1285
    push $P1, $P90
.annotate 'line', 1463
    new $P93, [ 'PredefFunction' ]
    $P93.'PredefFunction'('sqrt', 'sqrt %0, %1', 'N', 'N')
    set $P92, $P93
.annotate 'line', 1285
    push $P1, $P92
.annotate 'line', 1467
    new $P95, [ 'PredefFunction' ]
    $P95.'PredefFunction'('pow', 'pow %0, %1, %2', 'N', 'N', 'N')
    set $P94, $P95
.annotate 'line', 1285
    push $P1, $P94
.annotate 'line', 1471
    new $P97, [ 'PredefFunction' ]
    $P97.'PredefFunction'('exp', 'exp %0, %1', 'N', 'N')
    set $P96, $P97
.annotate 'line', 1285
    push $P1, $P96
.annotate 'line', 1475
    new $P99, [ 'PredefFunction' ]
    $P99.'PredefFunction'('ln', 'ln %0, %1', 'N', 'N')
    set $P98, $P99
.annotate 'line', 1285
    push $P1, $P98
.annotate 'line', 1479
    new $P101, [ 'PredefFunction' ]
    $P101.'PredefFunction'('sin', 'sin %0, %1', 'N', 'N')
    set $P100, $P101
.annotate 'line', 1285
    push $P1, $P100
.annotate 'line', 1483
    new $P103, [ 'PredefFunction' ]
    $P103.'PredefFunction'('cos', 'cos %0, %1', 'N', 'N')
    set $P102, $P103
.annotate 'line', 1285
    push $P1, $P102
.annotate 'line', 1487
    new $P105, [ 'PredefFunction' ]
    $P105.'PredefFunction'('tan', 'tan %0, %1', 'N', 'N')
    set $P104, $P105
.annotate 'line', 1285
    push $P1, $P104
.annotate 'line', 1491
    new $P107, [ 'PredefFunction' ]
    $P107.'PredefFunction'('asin', 'asin %0, %1', 'N', 'N')
    set $P106, $P107
.annotate 'line', 1285
    push $P1, $P106
.annotate 'line', 1495
    new $P109, [ 'PredefFunction' ]
    $P109.'PredefFunction'('acos', 'acos %0, %1', 'N', 'N')
    set $P108, $P109
.annotate 'line', 1285
    push $P1, $P108
.annotate 'line', 1499
    new $P111, [ 'PredefFunction' ]
    $P111.'PredefFunction'('atan', 'atan %0, %1', 'N', 'N')
    set $P110, $P111
.annotate 'line', 1285
    push $P1, $P110
.annotate 'line', 1503
    new $P113, [ 'PredefFunction' ]
    $P113.'PredefFunction'('atan', 'atan %0, %1, %2', 'N', 'N', 'N')
    set $P112, $P113
.annotate 'line', 1285
    push $P1, $P112
.annotate 'line', 1507
    new $P115, [ 'PredefFunction' ]
    $P115.'PredefFunction'('getinterp', 'getinterp %0', 'P')
    set $P114, $P115
.annotate 'line', 1285
    push $P1, $P114
.annotate 'line', 1511
    new $P117, [ 'PredefFunction' ]
    $P117.'PredefFunction'('get_class', 'get_class %0, %1', 'P', 'S')
    set $P116, $P117
.annotate 'line', 1285
    push $P1, $P116
.annotate 'line', 1515
    new $P119, [ 'PredefFunction' ]
    $P119.'PredefFunction'('typeof', 'typeof %0, %1', 'P', 'P')
    set $P118, $P119
.annotate 'line', 1285
    push $P1, $P118
.annotate 'line', 1519
    new $P121, [ 'PredefFunction' ]
    $P121.'PredefFunction'('getattribute', 'getattribute %0, %1, %2', 'P', 'P', 'S')
    set $P120, $P121
.annotate 'line', 1285
    push $P1, $P120
.annotate 'line', 1523
    new $P123, [ 'PredefFunction' ]
    $P123.'PredefFunction'('find_method', 'find_method %0, %1, %2', 'P', 'P', 'S')
    set $P122, $P123
.annotate 'line', 1285
    push $P1, $P122
.annotate 'line', 1527
    new $P125, [ 'PredefFunction' ]
    $P125.'PredefFunction'('callmethodwithargs', '%0 = %1.%2(%3 :flat)', 'P', 'P', 'P', 'P')
    set $P124, $P125
.annotate 'line', 1285
    push $P1, $P124
.annotate 'line', 1531
    new $P127, [ 'PredefFunction' ]
    $P127.'PredefFunction'('clone', 'clone %0, %1', 'P', 'P')
    set $P126, $P127
.annotate 'line', 1285
    push $P1, $P126
.annotate 'line', 1535
    new $P129, [ 'PredefFunction' ]
    $P129.'PredefFunction'('compreg', 'compreg %0, %1', 'P', 'S')
    set $P128, $P129
.annotate 'line', 1285
    push $P1, $P128
.annotate 'line', 1539
    new $P131, [ 'PredefFunction' ]
    $P131.'PredefFunction'('compreg', 'compreg %1, %2', 'v', 'S', 'P')
    set $P130, $P131
.annotate 'line', 1285
    push $P1, $P130
.annotate 'line', 1543
    new $P133, [ 'PredefFunction' ]
    $P133.'PredefFunction'('load_language', "load_language %1\ncompreg %0, %1\n", 'P', 'S')
    set $P132, $P133
.annotate 'line', 1285
    push $P1, $P132
.annotate 'line', 1550
    new $P135, [ 'PredefFunction' ]
    $P135.'PredefFunction'('load_language', "load_language %1\ncompreg %0, %2\n", 'P', 'S', 'S')
    set $P134, $P135
.annotate 'line', 1285
    push $P1, $P134
.annotate 'line', 1557
    new $P137, [ 'PredefFunction' ]
    $P137.'PredefFunction'('loadlib', 'loadlib %0, %1', 'P', 'S')
    set $P136, $P137
.annotate 'line', 1285
    push $P1, $P136
.annotate 'line', 1561
    new $P139, [ 'PredefFunction' ]
    $P139.'PredefFunction'('load_bytecode', 'load_bytecode %1', 'v', 'S')
    set $P138, $P139
.annotate 'line', 1285
    push $P1, $P138
.annotate 'line', 1565
    new $P141, [ 'PredefFunction' ]
    $P141.'PredefFunction'('dlfunc', 'dlfunc %0, %1, %2, %3', 'P', 'P', 'S', 'S')
    set $P140, $P141
.annotate 'line', 1285
    push $P1, $P140
.annotate 'line', 1569
    new $P143, [ 'PredefFunction' ]
    $P143.'PredefFunction'('sprintf', 'sprintf %0, %1, %2', 'S', 'S', 'P')
    set $P142, $P143
.annotate 'line', 1285
    push $P1, $P142
.annotate 'line', 1573
    new $P145, [ 'PredefFunction' ]
    $P145.'PredefFunction'('sprintf', 'sprintf %0, %1, %2', 'P', 'P', 'P')
    set $P144, $P145
.annotate 'line', 1285
    push $P1, $P144
.annotate 'line', 1577
    new $P147, [ 'PredefFunction' ]
.annotate 'line', 1578
    $P147.'PredefFunction'('print', $P11, 'v', '*')
    set $P146, $P147
.annotate 'line', 1285
    push $P1, $P146
.annotate 'line', 1581
    new $P149, [ 'PredefFunction' ]
.annotate 'line', 1582
    $P149.'PredefFunction'('say', $P12, 'v', '*')
    set $P148, $P149
.annotate 'line', 1285
    push $P1, $P148
.annotate 'line', 1585
    new $P151, [ 'PredefFunction' ]
.annotate 'line', 1586
    $P151.'PredefFunction'('cry', $P13, 'v', '*')
    set $P150, $P151
.annotate 'line', 1285
    push $P1, $P150
.annotate 'line', 1589
    new $P153, [ 'PredefFunction' ]
.annotate 'line', 1590
    $P153.'PredefFunction'('invoke', $P14, 'P', '!')
    set $P152, $P153
.annotate 'line', 1285
    push $P1, $P152
  __label_1: # Infinite loop
.annotate 'line', 1595
    .yield($P1)
    goto __label_1
  __label_0: # Infinite loop end
# }
.annotate 'line', 1596

.end # getpredefs


.sub 'findpredef'
        .param string __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 1600
    $P2 = 'getpredefs'()
    iter $P3, $P2
    set $P3, 0
  __label_0: # for iteration
    unless $P3 goto __label_1
    shift $P1, $P3
.annotate 'line', 1601
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_2
# {
.annotate 'line', 1602
# pargs: $I1
    getattribute $P5, $P1, 'nparams'
    set $I1, $P5
.annotate 'line', 1603
    iseq $I2, $I1, __ARG_2
    if $I2 goto __label_5
.annotate 'line', 1604
    iseq $I2, $I1, -1
  __label_5:
    if $I2 goto __label_4
.annotate 'line', 1605
    iseq $I2, $I1, -2
    unless $I2 goto __label_6
    iseq $I2, __ARG_2, 1
  __label_6:
  __label_4:
    unless $I2 goto __label_3
.annotate 'line', 1606
    .return($P1)
  __label_3: # endif
# }
  __label_2: # endif
    goto __label_0
  __label_1: # endfor
    null $P2
.annotate 'line', 1608
    .return($P2)
# }
.annotate 'line', 1609

.end # findpredef


.sub 'optimize_array'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1617
    if_null __ARG_1, __label_0
# {
.annotate 'line', 1618
# n: $I1
# predefined elements
    elements $I1, __ARG_1
# for loop
.annotate 'line', 1619
# i: $I2
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 1620
    $P2 = __ARG_1[$I2]
    $P1 = $P2.'optimize'()
    __ARG_1[$I2] = $P1
  __label_1: # for iteration
.annotate 'line', 1619
    inc $I2
    goto __label_3
  __label_2: # for end
# }
  __label_0: # endif
# }
.annotate 'line', 1622

.end # optimize_array


.sub 'parseDotted'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1626
# var list: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1627
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 1628
    $P3 = $P2.'isidentifier'()
    if_null $P3, __label_0
    unless $P3 goto __label_0
# {
.annotate 'line', 1629
# predefined push
    push $P1, $P2
  __label_2: # while
.annotate 'line', 1630
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 1631
    $P2 = __ARG_1.'get'()
.annotate 'line', 1632
# predefined push
    push $P1, $P2
# }
    goto __label_2
  __label_1: # endwhile
# }
  __label_0: # endif
.annotate 'line', 1635
    __ARG_1.'unget'($P2)
.annotate 'line', 1636
    .return($P1)
# }
.annotate 'line', 1637

.end # parseDotted


.sub 'toIdentifierList'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1641
    new $P1, ['ResizableStringArray']
.annotate 'line', 1642
    iter $P3, __ARG_1
    set $P3, 0
  __label_0: # for iteration
    unless $P3 goto __label_1
    shift $P2, $P3
.annotate 'line', 1643
    $P4 = $P2.'getidentifier'()
# predefined push
    push $P1, $P4
    goto __label_0
  __label_1: # endfor
.annotate 'line', 1644
    .return($P1)
# }
.annotate 'line', 1645

.end # toIdentifierList

.namespace [ 'CommonBase' ]

.sub 'initbase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1658
    setattribute self, 'start', __ARG_1
.annotate 'line', 1659
    setattribute self, 'owner', __ARG_2
# }
.annotate 'line', 1660

.end # initbase


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1663
    getattribute $P1, self, 'start'
    __ARG_1.'annotate'($P1)
# }
.annotate 'line', 1664

.end # annotate


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1667
    getattribute $P1, self, 'owner'
    $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 1668

.end # use_predef


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 1671
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 1672

.end # generatesubid


.sub 'addlocalfunction' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1675
    getattribute $P1, self, 'owner'
    .tailcall $P1.'addlocalfunction'(__ARG_1)
# }
.annotate 'line', 1676

.end # addlocalfunction


.sub 'findsymbol' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1679
    getattribute $P1, self, 'owner'
    .tailcall $P1.'findsymbol'(__ARG_1)
# }
.annotate 'line', 1680

.end # findsymbol


.sub 'findclasskey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1683
    getattribute $P1, self, 'owner'
    .tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 1684

.end # findclasskey


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 1687
    getattribute $P1, self, 'owner'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 1688

.end # dowarnings

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CommonBase' ]
.annotate 'line', 1653
    addattribute $P0, 'start'
.annotate 'line', 1654
    addattribute $P0, 'owner'
.end
.namespace [ 'SimpleArgList' ]

.sub 'init' :method :vtable
# Body
# {
.annotate 'line', 1703
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'args', $P2
# }
.annotate 'line', 1704

.end # init


.sub 'numargs' :method
# Body
# {
.annotate 'line', 1708
    getattribute $P1, self, 'args'
# predefined elements
    elements $I1, $P1
    .return($I1)
# }
.annotate 'line', 1709

.end # numargs


.sub 'getarg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 1712
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 1713
    $P2 = $P1[__ARG_1]
    .return($P2)
# }
.annotate 'line', 1714

.end # getarg


.sub 'parseargs' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 1718
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 1719
# var t: $P2
    null $P2
  __label_0: # do
.annotate 'line', 1720
# {
.annotate 'line', 1721
# var value: $P3
    $P3 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 1722
# predefined push
    push $P1, $P3
# }
  __label_2: # continue
.annotate 'line', 1723
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'(',')
    if_null $P4, __label_1
    if $P4 goto __label_0
  __label_1: # enddo
.annotate 'line', 1724
    'RequireOp'(__ARG_3, $P2)
# }
.annotate 'line', 1725

.end # parseargs


.sub 'optimizeargs' :method
# Body
# {
.annotate 'line', 1729
    getattribute $P1, self, 'args'
    'optimize_array'($P1)
# }
.annotate 'line', 1730

.end # optimizeargs


.sub 'getargvalues' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1733
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 1734
# var argreg: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 1735
# nargs: $I1
# predefined elements
    elements $I1, $P1
# for loop
.annotate 'line', 1736
# i: $I2
    null $I2
  __label_2: # for condition
    ge $I2, $I1, __label_1
# {
.annotate 'line', 1737
# var a: $P3
    $P3 = $P1[$I2]
.annotate 'line', 1738
# reg: $S1
    $P4 = $P3.'emit_get'(__ARG_1)
    null $S1
    if_null $P4, __label_3
    set $S1, $P4
  __label_3:
.annotate 'line', 1739
# predefined push
    push $P2, $S1
# }
  __label_0: # for iteration
.annotate 'line', 1736
    inc $I2
    goto __label_2
  __label_1: # for end
.annotate 'line', 1741
    .return($P2)
# }
.annotate 'line', 1742

.end # getargvalues


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1745
# var argreg: $P1
    $P1 = self.'getargvalues'(__ARG_1)
.annotate 'line', 1746
# predefined join
    join $S1, ', ', $P1
    __ARG_1.'print'($S1)
# }
.annotate 'line', 1747

.end # emitargs

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'SimpleArgList' ]
.annotate 'line', 1699
    addattribute $P0, 'args'
.end
.namespace [ 'Modifier' ]

.sub 'getname' :method
# Body
# {
.annotate 'line', 1759
    getattribute $P1, self, 'name'
    .return($P1)
# }

.end # getname


.sub 'numargs' :method
# Body
# {
.annotate 'line', 1762
# nargs: $I1
    getattribute $P2, self, 'args'
    $P1 = $P2.'numargs'()
    set $I1, $P1
.annotate 'line', 1763
    .return($I1)
# }
.annotate 'line', 1764

.end # numargs


.sub 'getarg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 1767
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 1768
    $P2 = $P1.'numargs'()
    set $I1, $P2
    ge __ARG_1, $I1, __label_0
.annotate 'line', 1769
    .tailcall $P1.'getarg'(__ARG_1)
    goto __label_1
  __label_0: # else
.annotate 'line', 1771
    'InternalError'('Wrong modifier arg number')
  __label_1: # endif
# }
.annotate 'line', 1772

.end # getarg


.sub 'Modifier' :method
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1775
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 1776
    if_null __ARG_2, __label_0
.annotate 'line', 1777
    setattribute self, 'args', __ARG_2
  __label_0: # endif
# }
.annotate 'line', 1778

.end # Modifier


.sub 'optimize' :method
# Body
# {
.annotate 'line', 1781
    getattribute $P1, self, 'args'
    $P1.'optimizeargs'()
# }
.annotate 'line', 1782

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Modifier' ]
.annotate 'line', 1756
    addattribute $P0, 'name'
.annotate 'line', 1757
    addattribute $P0, 'args'
.end
.namespace [ 'ModifierList' ]

.sub 'ModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1791
# var list: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1792
# var t: $P2
    null $P2
  __label_0: # do
.annotate 'line', 1793
# {
.annotate 'line', 1794
    $P2 = __ARG_1.'get'()
.annotate 'line', 1795
# name: $S1
    $P4 = $P2.'getidentifier'()
    null $S1
    if_null $P4, __label_3
    set $S1, $P4
  __label_3:
.annotate 'line', 1796
    $P2 = __ARG_1.'get'()
.annotate 'line', 1797
# var args: $P3
    new $P3, [ 'SimpleArgList' ]
.annotate 'line', 1798
    $P4 = $P2.'isop'('(')
    if_null $P4, __label_4
    unless $P4 goto __label_4
# {
.annotate 'line', 1799
    $P3.'parseargs'(__ARG_1, __ARG_2, ')')
.annotate 'line', 1800
    $P2 = __ARG_1.'get'()
# }
  __label_4: # endif
.annotate 'line', 1802
    new $P5, [ 'Modifier' ]
    $P5.'Modifier'($S1, $P3)
    set $P4, $P5
# predefined push
    push $P1, $P4
# }
  __label_2: # continue
.annotate 'line', 1803
    $P4 = $P2.'isop'(',')
    if_null $P4, __label_1
    if $P4 goto __label_0
  __label_1: # enddo
.annotate 'line', 1804
    'RequireOp'(']', $P2)
.annotate 'line', 1805
    setattribute self, 'list', $P1
# }
.annotate 'line', 1806

.end # ModifierList


.sub 'optimize' :method
# Body
# {
.annotate 'line', 1809
    getattribute $P2, self, 'list'
    iter $P3, $P2
    set $P3, 0
  __label_0: # for iteration
    unless $P3 goto __label_1
    shift $P1, $P3
.annotate 'line', 1810
    $P1.'optimize'()
    goto __label_0
  __label_1: # endfor
# }
.annotate 'line', 1811

.end # optimize


.sub 'getlist' :method
# Body
# {
.annotate 'line', 1812
    getattribute $P1, self, 'list'
    .return($P1)
# }

.end # getlist


.sub 'pick' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1815
# var list: $P1
    getattribute $P1, self, 'list'
.annotate 'line', 1816
# n: $I1
# predefined elements
    elements $I1, $P1
# for loop
.annotate 'line', 1817
# i: $I2
    null $I2
  __label_2: # for condition
    ge $I2, $I1, __label_1
# {
.annotate 'line', 1818
# var mod: $P2
    $P2 = $P1[$I2]
.annotate 'line', 1819
    $P3 = $P2.'getname'()
    set $S1, $P3
    ne $S1, __ARG_1, __label_3
# {
.annotate 'line', 1820
    .return($P2)
# }
  __label_3: # endif
# }
  __label_0: # for iteration
.annotate 'line', 1817
    inc $I2
    goto __label_2
  __label_1: # for end
    null $P3
.annotate 'line', 1823
    .return($P3)
# }
.annotate 'line', 1824

.end # pick

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ModifierList' ]
.annotate 'line', 1787
    addattribute $P0, 'list'
.end
.namespace [ ]

.sub 'getparrotkey'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1833
# s: $S1
# predefined join
    join $S1, "'; '", __ARG_1
.annotate 'line', 1834
    concat $S2, "[ '", $S1
    concat $S2, $S2, "' ]"
    .return($S2)
# }
.annotate 'line', 1835

.end # getparrotkey


.sub 'getparrotnamespacekey'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1839
# predefined elements
    elements $I1, __ARG_1
    ne $I1, 0, __label_0
.annotate 'line', 1840
    .return(".namespace [ ]")
    goto __label_1
  __label_0: # else
# {
.annotate 'line', 1842
# s: $S1
# predefined join
    join $S1, "'; '", __ARG_1
.annotate 'line', 1843
    concat $S2, ".namespace [ '", $S1
    concat $S2, $S2, "' ]"
    .return($S2)
# }
  __label_1: # endif
# }
.annotate 'line', 1845

.end # getparrotnamespacekey


.sub 'parseUsing'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1849
# var taux: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 1850
    $P2 = $P1.'iskeyword'('extern')
    if_null $P2, __label_0
    unless $P2 goto __label_0
.annotate 'line', 1851
    new $P4, [ 'ExternStatement' ]
    $P4.'ExternStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P3, $P4
    .return($P3)
    goto __label_1
  __label_0: # else
.annotate 'line', 1852
    $P5 = $P1.'iskeyword'('static')
    if_null $P5, __label_2
    unless $P5 goto __label_2
.annotate 'line', 1853
    new $P7, [ 'StaticStatement' ]
    $P7.'StaticStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P6, $P7
    .return($P6)
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 1855
    __ARG_2.'unget'($P1)
.annotate 'line', 1856
    new $P3, [ 'UsingStatement' ]
    $P3.'UsingStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P2, $P3
    .return($P2)
# }
  __label_3: # endif
  __label_1: # endif
# }
.annotate 'line', 1858

.end # parseUsing


.sub 'parseSig'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1862
# var params: $P1
    new $P1, [ 'SigParameterList' ]
    $P1.'SigParameterList'(__ARG_2, __ARG_3)
.annotate 'line', 1863
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 1864
    $P4 = $P2.'isop'('=')
    isfalse $I1, $P4
    unless $I1 goto __label_0
.annotate 'line', 1865
    'SyntaxError'("Expected '='", $P2)
  __label_0: # endif
.annotate 'line', 1866
# var expr: $P3
    $P3 = 'parseExpr'(__ARG_2, __ARG_3)
.annotate 'line', 1867
    new $P5, [ 'MultiAssignStatement' ]
    $P5.'MultiAssignStatement'($P1, $P3)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 1868

.end # parseSig


.sub 'parseStatement'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1872
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 1873
    $P4 = $P1.'isop'(';')
    if_null $P4, __label_0
    unless $P4 goto __label_0
.annotate 'line', 1874
    new $P5, [ 'EmptyStatement' ]
    .return($P5)
  __label_0: # endif
.annotate 'line', 1875
    $P4 = $P1.'isop'('{')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 1876
    new $P6, [ 'CompoundStatement' ]
    $P6.'CompoundStatement'($P1, __ARG_1, __ARG_2)
    set $P5, $P6
    .return($P5)
  __label_1: # endif
.annotate 'line', 1877
    $P4 = $P1.'isop'('${')
    if_null $P4, __label_2
    unless $P4 goto __label_2
.annotate 'line', 1878
    new $P6, [ 'PiropStatement' ]
    $P6.'PiropStatement'($P1, __ARG_1, __ARG_2)
    set $P5, $P6
    .return($P5)
  __label_2: # endif
.annotate 'line', 1879
    $P4 = $P1.'isop'(':')
    if_null $P4, __label_3
    unless $P4 goto __label_3
# {
.annotate 'line', 1880
# var open: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 1881
    $P4 = $P2.'isop'('(')
    isfalse $I1, $P4
    unless $I1 goto __label_4
.annotate 'line', 1882
    'SyntaxError'("Unexpected ':'", $P1)
  __label_4: # endif
.annotate 'line', 1883
    .tailcall 'parseSig'($P1, __ARG_1, __ARG_2)
# }
  __label_3: # endif
# switch
.annotate 'line', 1886
    $P4 = $P1.'checkkeyword'()
    set $S1, $P4
    set $S2, 'using'
    if $S1 == $S2 goto __label_7
    set $S2, 'const'
    if $S1 == $S2 goto __label_8
    set $S2, 'volatile'
    if $S1 == $S2 goto __label_9
    set $S2, 'var'
    if $S1 == $S2 goto __label_10
    set $S2, 'string'
    if $S1 == $S2 goto __label_11
    set $S2, 'int'
    if $S1 == $S2 goto __label_12
    set $S2, 'float'
    if $S1 == $S2 goto __label_13
    set $S2, 'return'
    if $S1 == $S2 goto __label_14
    set $S2, 'yield'
    if $S1 == $S2 goto __label_15
    set $S2, 'goto'
    if $S1 == $S2 goto __label_16
    set $S2, 'if'
    if $S1 == $S2 goto __label_17
    set $S2, 'while'
    if $S1 == $S2 goto __label_18
    set $S2, 'do'
    if $S1 == $S2 goto __label_19
    set $S2, 'continue'
    if $S1 == $S2 goto __label_20
    set $S2, 'break'
    if $S1 == $S2 goto __label_21
    set $S2, 'switch'
    if $S1 == $S2 goto __label_22
    set $S2, 'for'
    if $S1 == $S2 goto __label_23
    set $S2, 'throw'
    if $S1 == $S2 goto __label_24
    set $S2, 'try'
    if $S1 == $S2 goto __label_25
    goto __label_6
  __label_7: # case
.annotate 'line', 1888
    .tailcall 'parseUsing'($P1, __ARG_1, __ARG_2)
  __label_8: # case
.annotate 'line', 1890
    .tailcall 'parseConst'($P1, __ARG_1, __ARG_2)
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 1893
    .tailcall 'parseVolatile'($P1, __ARG_1, __ARG_2)
    goto __label_5 # break
  __label_10: # case
.annotate 'line', 1896
    .tailcall 'parseVar'($P1, __ARG_1, __ARG_2)
  __label_11: # case
.annotate 'line', 1898
    .tailcall 'parseString'($P1, __ARG_1, __ARG_2)
  __label_12: # case
.annotate 'line', 1900
    .tailcall 'parseInt'($P1, __ARG_1, __ARG_2)
  __label_13: # case
.annotate 'line', 1902
    .tailcall 'parseFloat'($P1, __ARG_1, __ARG_2)
  __label_14: # case
.annotate 'line', 1904
    new $P6, [ 'ReturnStatement' ]
    $P6.'ReturnStatement'($P1, __ARG_1, __ARG_2)
    set $P5, $P6
    .return($P5)
  __label_15: # case
.annotate 'line', 1906
    new $P8, [ 'YieldStatement' ]
    $P8.'YieldStatement'($P1, __ARG_1, __ARG_2)
    set $P7, $P8
    .return($P7)
  __label_16: # case
.annotate 'line', 1908
    new $P10, [ 'GotoStatement' ]
    $P10.'GotoStatement'($P1, __ARG_1, __ARG_2)
    set $P9, $P10
    .return($P9)
  __label_17: # case
.annotate 'line', 1910
    new $P12, [ 'IfStatement' ]
    $P12.'IfStatement'($P1, __ARG_1, __ARG_2)
    set $P11, $P12
    .return($P11)
  __label_18: # case
.annotate 'line', 1912
    new $P14, [ 'WhileStatement' ]
    $P14.'WhileStatement'($P1, __ARG_1, __ARG_2)
    set $P13, $P14
    .return($P13)
  __label_19: # case
.annotate 'line', 1914
    new $P16, [ 'DoStatement' ]
    $P16.'DoStatement'($P1, __ARG_1, __ARG_2)
    set $P15, $P16
    .return($P15)
  __label_20: # case
.annotate 'line', 1916
    new $P18, [ 'ContinueStatement' ]
    $P18.'ContinueStatement'($P1, __ARG_1, __ARG_2)
    set $P17, $P18
    .return($P17)
  __label_21: # case
.annotate 'line', 1918
    new $P20, [ 'BreakStatement' ]
    $P20.'BreakStatement'($P1, __ARG_1, __ARG_2)
    set $P19, $P20
    .return($P19)
  __label_22: # case
.annotate 'line', 1920
    .tailcall 'parseSwitch'($P1, __ARG_1, __ARG_2)
  __label_23: # case
.annotate 'line', 1922
    .tailcall 'parseFor'($P1, __ARG_1, __ARG_2)
  __label_24: # case
.annotate 'line', 1924
    new $P22, [ 'ThrowStatement' ]
    $P22.'ThrowStatement'($P1, __ARG_1, __ARG_2)
    set $P21, $P22
    .return($P21)
  __label_25: # case
.annotate 'line', 1926
    new $P24, [ 'TryStatement' ]
    $P24.'TryStatement'($P1, __ARG_1, __ARG_2)
    set $P23, $P24
    .return($P23)
  __label_6: # default
.annotate 'line', 1928
    $P25 = $P1.'isidentifier'()
    if_null $P25, __label_26
    unless $P25 goto __label_26
# {
.annotate 'line', 1929
# var t2: $P3
    $P3 = __ARG_1.'get'()
.annotate 'line', 1930
    $P4 = $P3.'isop'(':')
    if_null $P4, __label_27
    unless $P4 goto __label_27
.annotate 'line', 1931
    new $P6, [ 'LabelStatement' ]
    $P6.'LabelStatement'($P1, __ARG_2)
    set $P5, $P6
    .return($P5)
  __label_27: # endif
.annotate 'line', 1932
    __ARG_1.'unget'($P3)
# }
  __label_26: # endif
.annotate 'line', 1934
    __ARG_1.'unget'($P1)
.annotate 'line', 1935
    new $P5, [ 'ExprStatement' ]
    $P5.'ExprStatement'($P1, __ARG_1, __ARG_2)
    set $P4, $P5
    .return($P4)
  __label_5: # switch end
.annotate 'line', 1937
    'InternalError'('parseStatement failure', $P1)
# }
.annotate 'line', 1938

.end # parseStatement

.namespace [ 'Statement' ]

.sub 'Statement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1948
    self.'initbase'(__ARG_1, __ARG_2)
# }
.annotate 'line', 1949

.end # Statement


.sub 'isempty' :method
# Body
# {
.annotate 'line', 1950
    .return(0)
# }

.end # isempty


.sub 'createreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1953
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createreg'(__ARG_1)
# }
.annotate 'line', 1954

.end # createreg


.sub 'tempreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1957
    getattribute $P1, self, 'owner'
    .tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 1958

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 1961
    getattribute $P1, self, 'owner'
    $P1.'freetemps'()
# }
.annotate 'line', 1962

.end # freetemps


.sub 'genlabel' :method
# Body
# {
.annotate 'line', 1965
    getattribute $P1, self, 'owner'
    .tailcall $P1.'genlabel'()
# }
.annotate 'line', 1966

.end # genlabel


.sub 'getlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1969
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getlabel'(__ARG_1)
# }
.annotate 'line', 1970

.end # getlabel


.sub 'createlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1973
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createlabel'(__ARG_1)
# }
.annotate 'line', 1974

.end # createlabel


.sub 'createconst' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param int __ARG_5 :optional
# Body
# {
.annotate 'line', 1978
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createconst'(__ARG_1, __ARG_2, __ARG_3, __ARG_4, __ARG_5)
# }
.annotate 'line', 1979

.end # createconst


.sub 'createvar' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 1982
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvar'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 1983

.end # createvar


.sub 'getvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1986
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getvar'(__ARG_1)
# }
.annotate 'line', 1987

.end # getvar


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1990
    getattribute $P1, self, 'owner'
    .tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 1991

.end # checkclass


.sub 'getouter' :method
# Body
# {
.annotate 'line', 1998
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getouter'()
# }
.annotate 'line', 1999

.end # getouter


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2002
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getcontinuelabel'(__ARG_1)
# }
.annotate 'line', 2003

.end # getcontinuelabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2006
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getbreaklabel'(__ARG_1)
# }
.annotate 'line', 2007

.end # getbreaklabel


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2010
    getattribute $P1, self, 'start'
    'InternalError'('**checking**', $P1)
.annotate 'line', 2012
    .return(self)
# }
.annotate 'line', 2013

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Statement' ]
.annotate 'line', 1944
    get_class $P1, [ 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'EmptyStatement' ]

.sub 'isempty' :method
# Body
# {
.annotate 'line', 2018
    .return(1)
# }

.end # isempty


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2021
    'InternalError'('Attempt to annotate empty statement')
# }
.annotate 'line', 2022

.end # annotate


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2023
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'EmptyStatement' ]
.annotate 'line', 2016
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'MultiStatementBase' ]

.sub 'optimize' :method
# Body
# {
.annotate 'line', 2036
# var statements: $P1
    getattribute $P1, self, 'statements'
.annotate 'line', 2037
# n: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 2038
# empty: $I2
    set $I2, 1
# for loop
.annotate 'line', 2039
# i: $I3
    null $I3
  __label_2: # for condition
    ge $I3, $I1, __label_1
# {
.annotate 'line', 2040
# var st: $P2
    $P3 = $P1[$I3]
    $P2 = $P3.'optimize'()
.annotate 'line', 2041
    set $I4, $I2
    unless $I4 goto __label_4
    $P3 = $P2.'isempty'()
    isfalse $I4, $P3
  __label_4:
    unless $I4 goto __label_3
.annotate 'line', 2042
    null $I2
  __label_3: # endif
.annotate 'line', 2043
    $P1[$I3] = $P2
# }
  __label_0: # for iteration
.annotate 'line', 2039
    inc $I3
    goto __label_2
  __label_1: # for end
.annotate 'line', 2045
    unless $I2 goto __label_5
.annotate 'line', 2046
    new $P3, [ 'EmptyStatement' ]
    .return($P3)
    goto __label_6
  __label_5: # else
.annotate 'line', 2048
    .return(self)
  __label_6: # endif
# }
.annotate 'line', 2049

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MultiStatementBase' ]
.annotate 'line', 2032
    addattribute $P0, 'statements'
.end
.namespace [ 'MultiStatement' ]

.sub 'MultiStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2056
# var statements: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
    push $P1, __ARG_1
    push $P1, __ARG_2
.annotate 'line', 2057
    setattribute self, 'statements', $P1
# }
.annotate 'line', 2058

.end # MultiStatement


.sub 'isempty' :method
# Body
# {
.annotate 'line', 2059
    .return(0)
# }

.end # isempty


.sub 'push' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2062
    getattribute $P1, self, 'statements'
# predefined push
    push $P1, __ARG_1
.annotate 'line', 2063
    .return(self)
# }
.annotate 'line', 2064

.end # push


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2067
    getattribute $P2, self, 'statements'
    iter $P3, $P2
    set $P3, 0
  __label_0: # for iteration
    unless $P3 goto __label_1
    shift $P1, $P3
.annotate 'line', 2068
    $P1.'emit'(__ARG_1)
    goto __label_0
  __label_1: # endfor
# }
.annotate 'line', 2069

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MultiStatement' ]
.annotate 'line', 2052
    get_class $P1, [ 'MultiStatementBase' ]
    addparent $P0, $P1
.end
.namespace [ ]

.sub 'addtomulti'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2074
    unless_null __ARG_1, __label_0
.annotate 'line', 2075
    .return(__ARG_2)
    goto __label_1
  __label_0: # else
.annotate 'line', 2076
    isa $I1, __ARG_1, [ 'MultiStatement' ]
    unless $I1 goto __label_2
.annotate 'line', 2077
    .tailcall __ARG_1.'push'(__ARG_2)
    goto __label_3
  __label_2: # else
.annotate 'line', 2079
    new $P2, [ 'MultiStatement' ]
    $P2.'MultiStatement'(__ARG_1, __ARG_2)
    set $P1, $P2
    .return($P1)
  __label_3: # endif
  __label_1: # endif
# }
.annotate 'line', 2080

.end # addtomulti

.namespace [ 'PiropStatement' ]

.sub 'PiropStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2093
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2094
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 2095
# dotted: $I1
    null $I1
.annotate 'line', 2096
    $P4 = $P1.'isop'('.')
    if_null $P4, __label_0
    unless $P4 goto __label_0
# {
.annotate 'line', 2097
    set $I1, 1
.annotate 'line', 2098
    $P1 = __ARG_2.'get'()
# }
  __label_0: # endif
.annotate 'line', 2100
# opname: $S1
    $P4 = $P1.'getidentifier'()
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 2101
    unless $I1 goto __label_3
    set $S3, '.'
    goto __label_2
  __label_3:
    set $S3, ''
  __label_2:
    concat $S4, $S3, $S1
    box $P4, $S4
    setattribute self, 'opname', $P4
.annotate 'line', 2102
    $P1 = __ARG_2.'get'()
.annotate 'line', 2103
    $P4 = $P1.'isop'('}')
    isfalse $I2, $P4
    unless $I2 goto __label_4
# {
.annotate 'line', 2104
    __ARG_2.'unget'($P1)
.annotate 'line', 2105
# var args: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
  __label_5: # do
.annotate 'line', 2106
# {
.annotate 'line', 2107
# var arg: $P3
    null $P3
.annotate 'line', 2108
    $P1 = __ARG_2.'get'()
.annotate 'line', 2109
    $P4 = $P1.'isop'(':')
    if_null $P4, __label_8
    unless $P4 goto __label_8
# {
.annotate 'line', 2110
    $P1 = __ARG_2.'get'()
.annotate 'line', 2111
# label: $S2
    $P4 = $P1.'getidentifier'()
    null $S2
    if_null $P4, __label_10
    set $S2, $P4
  __label_10:
.annotate 'line', 2112
    new $P4, [ 'Reflabel' ]
    $P4.'Reflabel'(__ARG_3, $S2)
    set $P3, $P4
# }
    goto __label_9
  __label_8: # else
# {
.annotate 'line', 2115
    __ARG_2.'unget'($P1)
.annotate 'line', 2116
    $P3 = 'parseExpr'(__ARG_2, __ARG_3)
# }
  __label_9: # endif
.annotate 'line', 2118
# predefined push
    push $P2, $P3
# }
  __label_7: # continue
.annotate 'line', 2119
    $P1 = __ARG_2.'get'()
    $P4 = $P1.'isop'(',')
    if_null $P4, __label_6
    if $P4 goto __label_5
  __label_6: # enddo
.annotate 'line', 2120
    'RequireOp'('}', $P1)
.annotate 'line', 2121
    setattribute self, 'args', $P2
# }
  __label_4: # endif
.annotate 'line', 2123
    'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 2124

.end # PiropStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2127
    getattribute $P1, self, 'args'
    'optimize_array'($P1)
.annotate 'line', 2128
    .return(self)
# }
.annotate 'line', 2129

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2132
# opname: $S1
    getattribute $P4, self, 'opname'
    null $S1
    if_null $P4, __label_0
    set $S1, $P4
  __label_0:
.annotate 'line', 2133
    self.'annotate'(__ARG_1)
.annotate 'line', 2134
    concat $S3, 'pirop ', $S1
    __ARG_1.'comment'($S3)
.annotate 'line', 2135
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 2136
    __ARG_1.'print'('    ')
.annotate 'line', 2137
    unless_null $P1, __label_1
.annotate 'line', 2138
    __ARG_1.'say'($S1)
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2140
# var argreg: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 2141
# nargs: $I1
# predefined elements
    elements $I1, $P1
# for loop
.annotate 'line', 2142
# i: $I2
    null $I2
  __label_5: # for condition
    ge $I2, $I1, __label_4
# {
.annotate 'line', 2143
# var a: $P3
    $P3 = $P1[$I2]
.annotate 'line', 2144
# reg: $S2
    $P4 = $P3.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_6
    set $S2, $P4
  __label_6:
.annotate 'line', 2145
# predefined push
    push $P2, $S2
# }
  __label_3: # for iteration
.annotate 'line', 2142
    inc $I2
    goto __label_5
  __label_4: # for end
.annotate 'line', 2147
# predefined join
    join $S3, ', ', $P2
    __ARG_1.'say'($S1, ' ', $S3)
# }
  __label_2: # endif
# }
.annotate 'line', 2149

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'PiropStatement' ]
.annotate 'line', 2086
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2088
    addattribute $P0, 'opname'
.annotate 'line', 2089
    addattribute $P0, 'args'
.end
.namespace [ 'ExternStatement' ]

.sub 'ExternStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2161
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2162
# var path: $P1
    $P1 = 'parseDotted'(__ARG_2)
.annotate 'line', 2163
# predefined elements
    elements $I1, $P1
    ne $I1, 0, __label_0
.annotate 'line', 2164
    $P2 = __ARG_2.'get'()
    'ExpectedIdentifier'($P2)
  __label_0: # endif
.annotate 'line', 2165
    'ExpectOp'(';', __ARG_2)
.annotate 'line', 2166
    $P3 = 'toIdentifierList'($P1)
    setattribute self, 'path', $P3
.annotate 'line', 2167
    .return(self)
# }
.annotate 'line', 2168

.end # ExternStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2169
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2172
    self.'annotate'(__ARG_1)
.annotate 'line', 2173
    getattribute $P1, self, 'path'
# predefined join
    join $S1, '/', $P1
    __ARG_1.'say'('    ', "load_bytecode '", $S1, ".pbc'")
# }
.annotate 'line', 2174

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ExternStatement' ]
.annotate 'line', 2156
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2158
    addattribute $P0, 'path'
.end
.namespace [ 'StaticStatement' ]

.sub 'StaticStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2186
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2187
# var names: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 2188
# var t: $P2
    null $P2
  __label_0: # do
.annotate 'line', 2189
# {
.annotate 'line', 2190
    $P2 = __ARG_2.'get'()
.annotate 'line', 2191
# name: $S1
    $P3 = $P2.'getidentifier'()
    null $S1
    if_null $P3, __label_3
    set $S1, $P3
  __label_3:
.annotate 'line', 2192
# predefined push
    push $P1, $S1
# }
  __label_2: # continue
.annotate 'line', 2193
    $P2 = __ARG_2.'get'()
    $P3 = $P2.'isop'(',')
    if_null $P3, __label_1
    if $P3 goto __label_0
  __label_1: # enddo
.annotate 'line', 2194
    'RequireOp'(';', $P2)
.annotate 'line', 2195
    setattribute self, 'names', $P1
# }
.annotate 'line', 2196

.end # StaticStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2197
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2200
    self.'annotate'(__ARG_1)
.annotate 'line', 2201
    getattribute $P2, self, 'names'
    iter $P3, $P2
    set $P3, 0
  __label_0: # for iteration
    unless $P3 goto __label_1
    shift $S1, $P3
# {
.annotate 'line', 2202
# var v: $P1
    $P1 = self.'createvar'($S1, 'P')
.annotate 'line', 2203
    $P2 = $P1.'getreg'()
    __ARG_1.'say'(".const 'Sub' ", $P2, " = '", $S1, "'")
# }
    goto __label_0
  __label_1: # endfor
# }
.annotate 'line', 2205

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'StaticStatement' ]
.annotate 'line', 2181
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2183
    addattribute $P0, 'names'
.end
.namespace [ 'UsingStatement' ]

.sub 'UsingStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2219
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2220
# var path: $P1
    $P1 = 'parseDotted'(__ARG_2)
.annotate 'line', 2221
# predefined elements
    elements $I1, $P1
    ne $I1, 0, __label_0
.annotate 'line', 2222
    $P2 = __ARG_2.'get'()
    'ExpectedIdentifier'($P2)
  __label_0: # endif
.annotate 'line', 2223
    'ExpectOp'(';', __ARG_2)
.annotate 'line', 2224
    $P3 = 'toIdentifierList'($P1)
    setattribute self, 'path', $P3
# }
.annotate 'line', 2225

.end # UsingStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2228
# var path: $P1
    getattribute $P1, self, 'path'
.annotate 'line', 2229
# name: $S1
    $S1 = $P1[-1]
.annotate 'line', 2230
# var vdata: $P2
    $P2 = self.'createvar'($S1, 'P')
.annotate 'line', 2232
# var symbol: $P3
    $P3 = self.'findsymbol'($P1)
# switch-case
.annotate 'line', 2234
    isnull $I1, $P3
    if $I1 goto __label_2
.annotate 'line', 2236
    isa $I1, $P3, [ 'FunctionStatement' ]
    if $I1 goto __label_3
    goto __label_1
  __label_2: # case
    goto __label_0 # break
  __label_3: # case
.annotate 'line', 2237
# subid: $S2
    $P4 = $P3.'makesubid'()
    null $S2
    if_null $P4, __label_4
    set $S2, $P4
  __label_4:
.annotate 'line', 2238
    box $P5, $S2
    setattribute self, 'subid', $P5
    goto __label_0 # break
  __label_1: # default
  __label_0: # switch end
.annotate 'line', 2241
    .return(self)
# }
.annotate 'line', 2242

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2245
# var path: $P1
    getattribute $P1, self, 'path'
.annotate 'line', 2246
# name: $S1
    $S1 = $P1[-1]
.annotate 'line', 2247
# var vdata: $P2
    $P2 = self.'getvar'($S1)
.annotate 'line', 2248
    getattribute $P3, self, 'subid'
    if_null $P3, __label_0
# {
.annotate 'line', 2249
# subid: $S2
    getattribute $P4, self, 'subid'
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 2250
    $P3 = $P2.'getreg'()
    __ARG_1.'say'(".const 'Sub' ", $P3, ' = "', $S2, '"')
# }
    goto __label_1
  __label_0: # else
# {
.annotate 'line', 2253
    self.'annotate'(__ARG_1)
.annotate 'line', 2254
    $P3 = $P2.'getreg'()
    __ARG_1.'print'('    get_hll_global ', $P3, ', ')
.annotate 'line', 2255
    $P1.'pop'()
# switch
.annotate 'line', 2256
# predefined elements
    elements $I1, $P1
    null $I2
    if $I1 == $I2 goto __label_5
    goto __label_4
  __label_5: # case
.annotate 'line', 2258
    __ARG_1.'say'("'", $S1, "'")
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 2261
    $P3 = 'getparrotkey'($P1)
    __ARG_1.'say'($P3, " , '", $S1, "'")
  __label_3: # switch end
# }
  __label_1: # endif
# }
.annotate 'line', 2264

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'UsingStatement' ]
.annotate 'line', 2212
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2214
    addattribute $P0, 'path'
.annotate 'line', 2215
    addattribute $P0, 'subid'
.end
.namespace [ 'ExprStatement' ]

.sub 'ExprStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2276
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2277
    $P2 = 'parseExpr'(__ARG_2, self)
    setattribute self, 'expr', $P2
.annotate 'line', 2278
    'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 2279

.end # ExprStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2282
    getattribute $P3, self, 'expr'
    $P2 = $P3.'optimize'()
    setattribute self, 'expr', $P2
.annotate 'line', 2283
    .return(self)
# }
.annotate 'line', 2284

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2287
    getattribute $P1, self, 'expr'
    $P1.'emit'(__ARG_1, '')
# }
.annotate 'line', 2288

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ExprStatement' ]
.annotate 'line', 2271
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2273
    addattribute $P0, 'expr'
.end
.namespace [ 'VarData' ]

.sub 'VarData' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param int __ARG_4
        .param pmc __ARG_5 :optional
# Body
# {
.annotate 'line', 2307
    setattribute self, 'type', __ARG_1
.annotate 'line', 2308
    setattribute self, 'reg', __ARG_2
.annotate 'line', 2309
    setattribute self, 'scope', __ARG_3
.annotate 'line', 2310
    box $P1, __ARG_4
    setattribute self, 'flags', $P1
.annotate 'line', 2311
    setattribute self, 'value', __ARG_5
# }
.annotate 'line', 2312

.end # VarData


.sub 'setid' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2315
    box $P1, __ARG_1
    setattribute self, 'id', $P1
# }
.annotate 'line', 2316

.end # setid


.sub 'setlex' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2319
    box $P1, __ARG_1
    setattribute self, 'lexname', $P1
# }
.annotate 'line', 2320

.end # setlex


.sub 'gettype' :method
# Body
# {
.annotate 'line', 2321
    getattribute $P1, self, 'type'
    .return($P1)
# }

.end # gettype


.sub 'getreg' :method
# Body
# {
.annotate 'line', 2322
    getattribute $P1, self, 'reg'
    .return($P1)
# }

.end # getreg


.sub 'getscope' :method
# Body
# {
.annotate 'line', 2323
    getattribute $P1, self, 'scope'
    .return($P1)
# }

.end # getscope


.sub 'getvalue' :method
# Body
# {
.annotate 'line', 2324
    getattribute $P1, self, 'value'
    .return($P1)
# }

.end # getvalue


.sub 'isconst' :method
# Body
# {
.annotate 'line', 2325
    getattribute $P1, self, 'value'
    isnull $I1, $P1
    not $I1
    .return($I1)
# }

.end # isconst


.sub 'getid' :method
# Body
# {
.annotate 'line', 2326
    getattribute $P1, self, 'id'
    .return($P1)
# }

.end # getid


.sub 'getlex' :method
# Body
# {
.annotate 'line', 2327
    getattribute $P1, self, 'lexname'
    .return($P1)
# }

.end # getlex


.sub 'getflags' :method
# Body
# {
.annotate 'line', 2328
    getattribute $P1, self, 'flags'
    .return($P1)
# }

.end # getflags

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'VarData' ]
.annotate 'line', 2297
    addattribute $P0, 'type'
.annotate 'line', 2298
    addattribute $P0, 'reg'
.annotate 'line', 2299
    addattribute $P0, 'scope'
.annotate 'line', 2300
    addattribute $P0, 'flags'
.annotate 'line', 2301
    addattribute $P0, 'value'
.annotate 'line', 2302
    addattribute $P0, 'id'
.annotate 'line', 2303
    addattribute $P0, 'lexname'
.end
.namespace [ 'ConstantInternalFail' ]

.sub 'ConstantInternalFail' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2336
    setattribute self, 'name', __ARG_1
# }
.annotate 'line', 2337

.end # ConstantInternalFail


.sub 'get_string' :method :vtable
# Body
# {
.annotate 'line', 2340
    'InternalError'('Attempt to use unexpanded constant!!!')
# }
.annotate 'line', 2341

.end # get_string

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ConstantInternalFail' ]
.annotate 'line', 2333
    addattribute $P0, 'name'
.end
.namespace [ 'VarContainer' ]

.sub 'init' :method :vtable
# Body
# {
.annotate 'line', 2350
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'locals', $P2
# }
.annotate 'line', 2351

.end # init


.sub 'createvar' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 2354
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2355
# sname: $S1
    set $P4, __ARG_1
    null $S1
    if_null $P4, __label_0
    set $S1, $P4
  __label_0:
.annotate 'line', 2356
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2357
    if_null $P2, __label_1
.annotate 'line', 2358
    concat $S3, "Redeclared '", $S1
    concat $S3, $S3, "'"
    'SyntaxError'($S3, __ARG_1)
  __label_1: # endif
.annotate 'line', 2359
# reg: $S2
    $P4 = self.'createreg'(__ARG_2)
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 2360
# var data: $P3
    new $P3, [ 'VarData' ]
    $P3.'VarData'(__ARG_2, $S2, self, __ARG_3)
.annotate 'line', 2361
    $P1[$S1] = $P3
.annotate 'line', 2362
    .return($P3)
# }
.annotate 'line', 2363

.end # createvar


.sub 'createvarnamed' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 2366
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2367
# sname: $S1
    set $P3, __ARG_1
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
  __label_0:
.annotate 'line', 2368
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2369
    if_null $P2, __label_1
.annotate 'line', 2370
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    'SyntaxError'($S2, __ARG_1)
  __label_1: # endif
.annotate 'line', 2371
    new $P4, [ 'VarData' ]
    $P4.'VarData'(__ARG_2, __ARG_3, self, 0)
    set $P3, $P4
    $P1[$S1] = $P3
# }
.annotate 'line', 2372

.end # createvarnamed


.sub 'createconst' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param int __ARG_5 :optional
# Body
# {
.annotate 'line', 2376
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2377
# sname: $S1
    set $P4, __ARG_1
    null $S1
    if_null $P4, __label_0
    set $S1, $P4
  __label_0:
.annotate 'line', 2378
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2379
    if_null $P2, __label_1
.annotate 'line', 2380
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    'SyntaxError'($S2, __ARG_1)
  __label_1: # endif
.annotate 'line', 2381
# var data: $P3
    new $P3, [ 'VarData' ]
    new $P5, [ 'ConstantInternalFail' ]
    $P5.'ConstantInternalFail'(__ARG_1)
    set $P4, $P5
.annotate 'line', 2382
    $P3.'VarData'(__ARG_2, $P4, self, __ARG_5, __ARG_3)
.annotate 'line', 2383
    isnull $I1, __ARG_4
    not $I1
    unless $I1 goto __label_3
    isne $I1, __ARG_4, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 2384
    $P3.'setid'(__ARG_4)
  __label_2: # endif
.annotate 'line', 2385
    $P1[$S1] = $P3
# }
.annotate 'line', 2386

.end # createconst


.sub 'getvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2389
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2390
# sname: $S1
    set $P3, __ARG_1
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
  __label_0:
.annotate 'line', 2391
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2392
    isnull $I1, $P2
    unless $I1 goto __label_2
    getattribute $P3, self, 'owner'
    isnull $I1, $P3
    not $I1
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 2393
    getattribute $P4, self, 'owner'
    $P2 = $P4.'getvar'(__ARG_1)
  __label_1: # endif
.annotate 'line', 2394
    isnull $I1, $P2
    not $I1
    unless $I1 goto __label_4
    isa $I2, $P2, [ 'VarData' ]
    not $I1, $I2
  __label_4:
    unless $I1 goto __label_3
.annotate 'line', 2395
    'InternalError'('Incorrect data for Variable', __ARG_1)
  __label_3: # endif
.annotate 'line', 2396
    .return($P2)
# }
.annotate 'line', 2397

.end # getvar


.sub 'getlocalvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2400
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2401
# sname: $S1
    set $P3, __ARG_1
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
  __label_0:
.annotate 'line', 2402
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2403
    .return($P2)
# }
.annotate 'line', 2404

.end # getlocalvar


.sub 'makelexical' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2407
# var lexowner: $P1
    $P1 = self.'getouter'()
.annotate 'line', 2408
# lexname: $S1
    $P2 = $P1.'createlex'(__ARG_1)
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
  __label_0:
.annotate 'line', 2409
    .return($S1)
# }
.annotate 'line', 2410

.end # makelexical


.sub 'makelexicalself' :method
# Body
# {
.annotate 'line', 2413
# var lexowner: $P1
    set $P1, self
# Constant lexname evaluated at compile time
.annotate 'line', 2415
    self.'setlex'('__WLEX_self', 'self')
.annotate 'line', 2416
    .return('__WLEX_self')
# }
.annotate 'line', 2417

.end # makelexicalself

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'VarContainer' ]
.annotate 'line', 2347
    addattribute $P0, 'locals'
.end
.namespace [ 'BlockStatement' ]
.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'BlockStatement' ]
.annotate 'line', 2426
    get_class $P1, [ 'VarContainer' ]
    addparent $P0, $P1
    get_class $P2, [ 'Statement' ]
    addparent $P0, $P2
.end
.namespace [ 'Expr' ]

.sub 'Expr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2438
    self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 2439

.end # Expr


.sub 'issimple' :method
# Body
# {
.annotate 'line', 2440
    .return(0)
# }

.end # issimple


.sub 'isliteral' :method
# Body
# {
.annotate 'line', 2441
    .return(0)
# }

.end # isliteral


.sub 'isintegerliteral' :method
# Body
# {
.annotate 'line', 2442
    .return(0)
# }

.end # isintegerliteral


.sub 'isfloatliteral' :method
# Body
# {
.annotate 'line', 2443
    .return(0)
# }

.end # isfloatliteral


.sub 'isstringliteral' :method
# Body
# {
.annotate 'line', 2444
    .return(0)
# }

.end # isstringliteral


.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 2445
    .return(0)
# }

.end # isidentifier


.sub 'isnull' :method
# Body
# {
.annotate 'line', 2446
    .return(0)
# }

.end # isnull


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 2447
    .return(0)
# }

.end # hascompilevalue


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 2448
    .return(0)
# }

.end # isnegable


.sub 'tempreg' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2451
    getattribute $P1, self, 'owner'
    .tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 2452

.end # tempreg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2456
    .return(self)
# }
.annotate 'line', 2457

.end # optimize


.sub 'cantailcall' :method
# Body
# {
.annotate 'line', 2458
    .return(0)
# }

.end # cantailcall


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2461
# type: $S1
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 2462
# reg: $S2
    ne $S1, 'v', __label_2
    set $S2, ''
    goto __label_1
  __label_2:
    $S2 = self.'tempreg'($S1)
  __label_1:
.annotate 'line', 2463
    self.'emit'(__ARG_1, $S2)
.annotate 'line', 2464
    .return($S2)
# }
.annotate 'line', 2465

.end # emit_get


.sub 'emit_getint' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2468
# reg: $S1
    null $S1
.annotate 'line', 2469
    $P1 = self.'checkresult'()
    set $S2, $P1
    ne $S2, 'I', __label_0
.annotate 'line', 2470
    $P2 = self.'emit_get'(__ARG_1)
    set $S1, $P2
    goto __label_1
  __label_0: # else
# {
.annotate 'line', 2472
    $P3 = self.'tempreg'('I')
    set $S1, $P3
.annotate 'line', 2473
    self.'emit'(__ARG_1, $S1)
# }
  __label_1: # endif
.annotate 'line', 2475
    .return($S1)
# }
.annotate 'line', 2476

.end # emit_getint


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2479
    getattribute $P1, self, 'start'
    'SyntaxError'('Not a left-side expression', $P1)
# }
.annotate 'line', 2480

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Expr' ]
.annotate 'line', 2434
    get_class $P1, [ 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'SimpleExpr' ]

.sub 'issimple' :method
# Body
# {
.annotate 'line', 2485
    .return(1)
# }

.end # issimple

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'SimpleExpr' ]
.annotate 'line', 2483
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.end
.namespace [ 'FunctionExpr' ]

.sub 'FunctionExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2495
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 2496
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 2497
    $P2 = $P1.'isop'('(')
    isfalse $I1, $P2
    unless $I1 goto __label_0
.annotate 'line', 2498
    'SyntaxError'('anonymous function expected', $P1)
  __label_0: # endif
.annotate 'line', 2499
    new $P4, [ 'LocalFunctionStatement' ]
    $P4.'LocalFunctionStatement'(__ARG_3, __ARG_1, __ARG_2)
    set $P3, $P4
    setattribute self, 'fn', $P3
# }
.annotate 'line', 2500

.end # FunctionExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2501
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2504
    getattribute $P3, self, 'fn'
    $P2 = $P3.'optimize'()
    setattribute self, 'fn', $P2
.annotate 'line', 2505
    .return(self)
# }
.annotate 'line', 2506

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2509
# var fn: $P1
    getattribute $P1, self, 'fn'
.annotate 'line', 2510
# reg: $S1
    $P2 = self.'tempreg'('P')
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
  __label_0:
.annotate 'line', 2511
    self.'annotate'(__ARG_1)
.annotate 'line', 2512
    $P2 = $P1.'getsubid'()
    __ARG_1.'say'(".const 'Sub' ", $S1, " = '", $P2, "'")
.annotate 'line', 2513
    set $S2, __ARG_2
    eq $S2, '', __label_1
.annotate 'line', 2514
    __ARG_1.'emitarg2'('newclosure', __ARG_2, $S1)
  __label_1: # endif
# }
.annotate 'line', 2515

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FunctionExpr' ]
.annotate 'line', 2490
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 2492
    addattribute $P0, 'fn'
.end
.namespace [ ]
# Constant CONDisruntime evaluated at compile time
# Constant CONDistrue evaluated at compile time
# Constant CONDisfalse evaluated at compile time
.namespace [ 'Condition' ]

.sub 'set' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2530
    setattribute self, 'condexpr', __ARG_1
.annotate 'line', 2531
    .return(self)
# }
.annotate 'line', 2532

.end # set


.sub 'optimize_condition' :method
# Body
# {
.annotate 'line', 2535
    getattribute $P3, self, 'condexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'condexpr', $P2
# }
.annotate 'line', 2536

.end # optimize_condition


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2539
    getattribute $P3, self, 'condexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'condexpr', $P2
.annotate 'line', 2540
    .return(self)
# }
.annotate 'line', 2541

.end # optimize


.sub 'getvalue' :method
# Body
# {
.annotate 'line', 2544
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 2545
    $P2 = $P1.'isliteral'()
    if_null $P2, __label_0
    unless $P2 goto __label_0
# {
# switch
.annotate 'line', 2546
    $P3 = $P1.'checkresult'()
    set $S1, $P3
    set $S2, 'I'
    if $S1 == $S2 goto __label_3
    goto __label_2
  __label_3: # case
.annotate 'line', 2548
# n: $I1
    $P4 = $P1.'getIntegerValue'()
    set $I1, $P4
.annotate 'line', 2549
    ne $I1, 0, __label_4
.annotate 'line', 2550
    .return(2)
    goto __label_5
  __label_4: # else
.annotate 'line', 2552
    .return(1)
  __label_5: # endif
  __label_2: # default
  __label_1: # switch end
# }
  __label_0: # endif
.annotate 'line', 2555
    .return(0)
# }
.annotate 'line', 2556

.end # getvalue


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 2559
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 2561
    isa $I1, $P1, [ 'ComparatorBaseExpr' ]
    if $I1 goto __label_2
.annotate 'line', 2562
    isa $I1, $P1, [ 'NullCheckerExpr' ]
  __label_2:
    unless $I1 goto __label_0
.annotate 'line', 2563
    $P1.'emit_if'(__ARG_1, __ARG_2)
    goto __label_1
  __label_0: # else
# {
.annotate 'line', 2565
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_3
    set $S1, $P2
  __label_3:
.annotate 'line', 2566
# type: $S2
    $P2 = $P1.'checkresult'()
    null $S2
    if_null $P2, __label_4
    set $S2, $P2
  __label_4:
# switch
.annotate 'line', 2567
    set $S3, $S2
    set $S4, 'S'
    if $S3 == $S4 goto __label_7
    set $S4, 'P'
    if $S3 == $S4 goto __label_8
    set $S4, 'I'
    if $S3 == $S4 goto __label_9
    set $S4, 'N'
    if $S3 == $S4 goto __label_10
    goto __label_6
  __label_7: # case
  __label_8: # case
.annotate 'line', 2570
    __ARG_1.'emitif_null'($S1, __ARG_3)
  __label_9: # case
  __label_10: # case
.annotate 'line', 2573
    __ARG_1.'emitif'($S1, __ARG_2)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 2576
    'InternalError'('Invalid if condition')
  __label_5: # switch end
# }
  __label_1: # endif
# }
.annotate 'line', 2579

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 2582
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 2584
    isa $I1, $P1, [ 'ComparatorBaseExpr' ]
    if $I1 goto __label_2
.annotate 'line', 2585
    isa $I1, $P1, [ 'NullCheckerExpr' ]
  __label_2:
    unless $I1 goto __label_0
.annotate 'line', 2586
    $P1.'emit_else'(__ARG_1, __ARG_2)
    goto __label_1
  __label_0: # else
# {
.annotate 'line', 2588
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_3
    set $S1, $P2
  __label_3:
.annotate 'line', 2589
# type: $S2
    $P2 = $P1.'checkresult'()
    null $S2
    if_null $P2, __label_4
    set $S2, $P2
  __label_4:
# switch
.annotate 'line', 2590
    set $S3, $S2
    set $S4, 'S'
    if $S3 == $S4 goto __label_7
    set $S4, 'P'
    if $S3 == $S4 goto __label_8
    set $S4, 'I'
    if $S3 == $S4 goto __label_9
    set $S4, 'N'
    if $S3 == $S4 goto __label_10
    goto __label_6
  __label_7: # case
  __label_8: # case
.annotate 'line', 2593
    __ARG_1.'emitif_null'($S1, __ARG_2)
  __label_9: # case
  __label_10: # case
.annotate 'line', 2596
    __ARG_1.'emitunless'($S1, __ARG_2)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 2599
    'InternalError'('Invalid if condition')
  __label_5: # switch end
# }
  __label_1: # endif
# }
.annotate 'line', 2602

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Condition' ]
.annotate 'line', 2527
    addattribute $P0, 'condexpr'
.end
.namespace [ 'Literal' ]

.sub 'isliteral' :method
# Body
# {
.annotate 'line', 2609
    .return(1)
# }

.end # isliteral


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 2610
    .return(1)
# }

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Literal' ]
.annotate 'line', 2607
    get_class $P1, [ 'SimpleExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'StringLiteral' ]

.sub 'StringLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2620
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2621
    setattribute self, 'strval', __ARG_2
# }
.annotate 'line', 2622

.end # StringLiteral


.sub 'isstringliteral' :method
# Body
# {
.annotate 'line', 2623
    .return(1)
# }

.end # isstringliteral


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2624
    .return('S')
# }

.end # checkresult


.sub 'getPirString' :method
# Body
# {
.annotate 'line', 2627
# var strtok: $P1
    getattribute $P1, self, 'strval'
.annotate 'line', 2628
# str: $S1
    getattribute $P2, $P1, 'str'
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
  __label_0:
.annotate 'line', 2629
# typesinglequoted: $I1
    isa $I1, $P1, [ 'TokenSingleQuoted' ]
.annotate 'line', 2630
# need_unicode: $I2
    null $I2
.annotate 'line', 2631
    box $P2, $S1
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $I3, $P3
# {
.annotate 'line', 2632
    le $I3, 127, __label_3
# {
.annotate 'line', 2633
    set $I2, 1
    goto __label_2 # break
.annotate 'line', 2634
# }
  __label_3: # endif
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 2637
    unless $I2 goto __label_4
# {
.annotate 'line', 2638
    unless $I1 goto __label_5
# {
.annotate 'line', 2639
    null $I1
.annotate 'line', 2640
# saux: $S2
    set $S2, $S1
.annotate 'line', 2641
    set $S1, ''
.annotate 'line', 2642
    box $P2, $S2
    iter $P4, $P2
    set $P4, 0
  __label_6: # for iteration
    unless $P4 goto __label_7
    shift $S3, $P4
# {
.annotate 'line', 2643
    ne $S3, '\', __label_8
.annotate 'line', 2644
    set $S3, '\\'
  __label_8: # endif
.annotate 'line', 2645
    concat $S1, $S1, $S3
# }
    goto __label_6
  __label_7: # endfor
# }
  __label_5: # endif
.annotate 'line', 2648
# result: $S4
    set $S4, ''
.annotate 'line', 2649
# l: $I4
# predefined length
    length $I4, $S1
# for loop
.annotate 'line', 2650
# i: $I5
    null $I5
  __label_11: # for condition
    ge $I5, $I4, __label_10
# {
.annotate 'line', 2651
# c: $S5
# predefined substr
    substr $S5, $S1, $I5, 1
.annotate 'line', 2652
# n: $I6
# predefined ord
    ord $I6, $S5
.annotate 'line', 2653
    le $I6, 127, __label_12
# {
.annotate 'line', 2654
# h: $S6
    box $P5, $I6
    $P2 = $P5.'get_as_base'(16)
    null $S6
    if_null $P2, __label_14
    set $S6, $P2
  __label_14:
.annotate 'line', 2655
    concat $S4, $S4, '\x{'
    concat $S4, $S4, $S6
    concat $S4, $S4, '}'
# }
    goto __label_13
  __label_12: # else
.annotate 'line', 2658
    concat $S4, $S4, $S5
  __label_13: # endif
# }
  __label_9: # for iteration
.annotate 'line', 2650
    inc $I5
    goto __label_11
  __label_10: # for end
.annotate 'line', 2660
    set $S1, $S4
# }
  __label_4: # endif
.annotate 'line', 2662
# q: $S7
    unless $I1 goto __label_16
    set $S7, "'"
    goto __label_15
  __label_16:
    set $S7, '"'
  __label_15:
.annotate 'line', 2663
    concat $S0, $S7, $S1
    concat $S0, $S0, $S7
    set $S1, $S0
.annotate 'line', 2664
    unless $I2 goto __label_17
.annotate 'line', 2665
    concat $S0, 'unicode:', $S1
    set $S1, $S0
  __label_17: # endif
.annotate 'line', 2666
    .return($S1)
# }
.annotate 'line', 2667

.end # getPirString


.sub 'get_value' :method
# Body
# {
.annotate 'line', 2670
# var strtok: $P1
    getattribute $P1, self, 'strval'
.annotate 'line', 2671
# str: $S1
    getattribute $P3, $P1, 'str'
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
  __label_0:
.annotate 'line', 2672
    isa $I1, $P1, [ 'TokenQuoted' ]
    unless $I1 goto __label_1
# {
.annotate 'line', 2673
# var s: $P2
    box $P2, $S1
.annotate 'line', 2674
    $P3 = $P2.'unescape'('utf8')
    set $S1, $P3
# }
  __label_1: # endif
.annotate 'line', 2676
    .return($S1)
# }
.annotate 'line', 2677

.end # get_value


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2680
    set $S1, __ARG_2
    eq $S1, '', __label_0
.annotate 'line', 2681
    $P1 = self.'getPirString'()
    __ARG_1.'emitset'(__ARG_2, $P1)
  __label_0: # endif
# }
.annotate 'line', 2682

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2685
    .tailcall self.'getPirString'()
# }
.annotate 'line', 2686

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'StringLiteral' ]
.annotate 'line', 2615
    get_class $P1, [ 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 2617
    addattribute $P0, 'strval'
.end
.namespace [ 'IntegerLiteral' ]

.sub 'IntegerLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3 :optional
        .param int __ARG_4 :opt_flag
# Body
# {
.annotate 'line', 2698
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2699
    setattribute self, 'pos', __ARG_2
.annotate 'line', 2700
# n: $I1
    null $I1
.annotate 'line', 2701
    unless __ARG_4 goto __label_0
.annotate 'line', 2702
    set $I1, __ARG_3
    goto __label_1
  __label_0: # else
# {
.annotate 'line', 2704
# aux: $S1
    set $P1, __ARG_2
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 2705
    set $I1, $S1
# }
  __label_1: # endif
.annotate 'line', 2707
    box $P1, $I1
    setattribute self, 'numval', $P1
# }
.annotate 'line', 2708

.end # IntegerLiteral


.sub 'isintegerliteral' :method
# Body
# {
.annotate 'line', 2709
    .return(1)
# }

.end # isintegerliteral


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2710
    .return('I')
# }

.end # checkresult


.sub 'getIntegerValue' :method
# Body
# {
.annotate 'line', 2713
# aux: $S1
    getattribute $P1, self, 'numval'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 2714
# i: $I1
    set $S2, $S1
    set $I1, $S2
.annotate 'line', 2715
    .return($I1)
# }
.annotate 'line', 2716

.end # getIntegerValue


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2719
    set $S1, __ARG_2
    eq $S1, '', __label_0
# {
.annotate 'line', 2720
# value: $I1
    $P1 = self.'getIntegerValue'()
    set $I1, $P1
.annotate 'line', 2721
    ne $I1, 0, __label_1
.annotate 'line', 2722
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_2
  __label_1: # else
.annotate 'line', 2724
    __ARG_1.'emitset'(__ARG_2, $I1)
  __label_2: # endif
# }
  __label_0: # endif
# }
.annotate 'line', 2726

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2729
    .tailcall self.'getIntegerValue'()
# }
.annotate 'line', 2730

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IntegerLiteral' ]
.annotate 'line', 2691
    get_class $P1, [ 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 2693
    addattribute $P0, 'pos'
.annotate 'line', 2694
    addattribute $P0, 'numval'
.end
.namespace [ 'FloatLiteral' ]

.sub 'FloatLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2740
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2741
    setattribute self, 'numval', __ARG_2
# }
.annotate 'line', 2742

.end # FloatLiteral


.sub 'isfloatliteral' :method
# Body
# {
.annotate 'line', 2743
    .return(1)
# }

.end # isfloatliteral


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2744
    .return('N')
# }

.end # checkresult


.sub 'getFloatValue' :method
# Body
# {
.annotate 'line', 2747
# aux: $S1
    getattribute $P2, self, 'numval'
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
  __label_0:
.annotate 'line', 2748
# var n: $P1
    new $P1, [ 'Float' ]
.annotate 'line', 2749
    assign $P1, $S1
.annotate 'line', 2750
    .return($P1)
# }
.annotate 'line', 2751

.end # getFloatValue


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2754
    set $S1, __ARG_2
    eq $S1, '', __label_0
# {
.annotate 'line', 2755
# var n: $P1
    $P1 = self.'getFloatValue'()
.annotate 'line', 2756
    __ARG_1.'emitset'(__ARG_2, $P1)
# }
  __label_0: # endif
# }
.annotate 'line', 2758

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2763
# aux: $S1
    getattribute $P1, self, 'numval'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 2764
# predefined indexof
    index $I1, $S1, '.'
    ge $I1, 0, __label_1
.annotate 'line', 2765
    concat $S1, $S1, '.0'
  __label_1: # endif
.annotate 'line', 2766
    .return($S1)
# }
.annotate 'line', 2767

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FloatLiteral' ]
.annotate 'line', 2735
    get_class $P1, [ 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 2737
    addattribute $P0, 'numval'
.end
.namespace [ 'IdentifierExpr' ]

.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 2775
    .return(1)
# }

.end # isidentifier


.sub 'IdentifierExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2778
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2779
    setattribute self, 'name', __ARG_2
# }
.annotate 'line', 2780

.end # IdentifierExpr


.sub 'isnull' :method
# Body
# {
.annotate 'line', 2783
    getattribute $P1, self, 'name'
    .tailcall $P1.'iskeyword'('null')
# }
.annotate 'line', 2784

.end # isnull


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2787
# var desc: $P1
    getattribute $P2, self, 'owner'
    getattribute $P3, self, 'name'
    $P1 = $P2.'getvar'($P3)
.annotate 'line', 2788
    if_null $P1, __label_0
.annotate 'line', 2789
    .tailcall $P1.'gettype'()
    goto __label_1
  __label_0: # else
# {
# switch
.annotate 'line', 2791
    getattribute $P2, self, 'name'
    set $S1, $P2
    set $S2, 'self'
    if $S1 == $S2 goto __label_4
    set $S2, 'null'
    if $S1 == $S2 goto __label_5
    goto __label_3
  __label_4: # case
  __label_5: # case
.annotate 'line', 2794
    .return('P')
  __label_3: # default
.annotate 'line', 2796
    .return('')
  __label_2: # switch end
# }
  __label_1: # endif
# }
.annotate 'line', 2799

.end # checkresult


.sub 'getName' :method
# Body
# {
.annotate 'line', 2802
# s: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 2803
    .return($S1)
# }
.annotate 'line', 2804

.end # getName


.sub 'checkIdentifier' :method
# Body
# {
.annotate 'line', 2807
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 2808
    unless_null $P1, __label_0
.annotate 'line', 2809
    'InternalError'('Bad thing')
  __label_0: # endif
.annotate 'line', 2810
# var desc: $P2
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
.annotate 'line', 2811
# s: $S1
    null $S1
.annotate 'line', 2812
    unless_null $P2, __label_1
# {
.annotate 'line', 2813
# sname: $S2
    set $P3, $P1
    null $S2
    if_null $P3, __label_3
    set $S2, $P3
  __label_3:
# switch
.annotate 'line', 2814
    set $S3, $S2
    set $S4, 'self'
    if $S3 == $S4 goto __label_6
    set $S4, 'null'
    if $S3 == $S4 goto __label_7
    goto __label_5
  __label_6: # case
.annotate 'line', 2816
    set $S1, 'self'
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 2818
    set $S1, 'null'
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 2820
    set $S1, ''
  __label_4: # switch end
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2824
    $P3 = $P2.'getid'()
    if_null $P3, __label_8
.annotate 'line', 2825
    .tailcall $P2.'getid'()
    goto __label_9
  __label_8: # else
.annotate 'line', 2827
    $P4 = $P2.'getreg'()
    set $S1, $P4
  __label_9: # endif
# }
  __label_2: # endif
.annotate 'line', 2829
    .return($S1)
# }
.annotate 'line', 2830

.end # checkIdentifier


.sub 'getIdentifier' :method
# Body
# {
.annotate 'line', 2833
# var value: $P1
    $P1 = self.'checkIdentifier'()
.annotate 'line', 2834
    set $S2, $P1
    ne $S2, '', __label_0
# {
.annotate 'line', 2835
# name: $S1
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 2836
    concat $S2, "Variable '", $S1
    concat $S2, $S2, "' is not defined"
    getattribute $P2, self, 'name'
    'SyntaxError'($S2, $P2)
# }
  __label_0: # endif
.annotate 'line', 2838
    .return($P1)
# }
.annotate 'line', 2839

.end # getIdentifier


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2842
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 2843
# var desc: $P2
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
.annotate 'line', 2844
    if_null $P2, __label_0
# {
.annotate 'line', 2845
    $I2 = $P2.'isconst'()
    unless $I2 goto __label_2
    $P3 = $P2.'getid'()
    isnull $I2, $P3
  __label_2:
    unless $I2 goto __label_1
.annotate 'line', 2846
    .tailcall $P2.'getvalue'()
  __label_1: # endif
.annotate 'line', 2847
# flags: $I1
    $P3 = $P2.'getflags'()
    set $I1, $P3
.annotate 'line', 2848
    band $I2, $I1, 1
    unless $I2 goto __label_3
# {
.annotate 'line', 2849
    band $I3, $I1, 2
    unless $I3 goto __label_4
.annotate 'line', 2850
    new $P4, [ 'LexicalVolatileExpr' ]
    $P4.'LexicalVolatileExpr'(self, $P2)
    set $P3, $P4
    .return($P3)
  __label_4: # endif
# }
  __label_3: # endif
# }
  __label_0: # endif
.annotate 'line', 2853
    .return(self)
# }
.annotate 'line', 2854

.end # optimize


.sub 'emit_getid' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2857
# id: $S1
    $P2 = self.'getIdentifier'()
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
  __label_0:
.annotate 'line', 2858
# var desc: $P1
    getattribute $P2, self, 'owner'
    getattribute $P3, self, 'name'
    $P1 = $P2.'getvar'($P3)
.annotate 'line', 2859
# flags: $I1
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
    $I1 = $P1.'getflags'()
  __label_1:
.annotate 'line', 2860
    band $I2, $I1, 1
    unless $I2 goto __label_3
# {
.annotate 'line', 2861
    band $I3, $I1, 2
    unless $I3 goto __label_4
# {
.annotate 'line', 2862
# lexname: $S2
    $P2 = $P1.'getlex'()
    null $S2
    if_null $P2, __label_5
    set $S2, $P2
  __label_5:
.annotate 'line', 2863
    isnull $I2, $S2
    not $I2
    unless $I2 goto __label_7
    isne $I2, $S2, ''
  __label_7:
    unless $I2 goto __label_6
.annotate 'line', 2864
    __ARG_1.'emitfind_lex'($S1, $S2)
  __label_6: # endif
# }
  __label_4: # endif
# }
  __label_3: # endif
.annotate 'line', 2867
    .return($S1)
# }
.annotate 'line', 2868

.end # emit_getid


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2871
    set $S2, __ARG_2
    eq $S2, '', __label_0
# {
.annotate 'line', 2872
    self.'annotate'(__ARG_1)
.annotate 'line', 2873
# id: $S1
    $P1 = self.'emit_getid'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 2874
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_0: # endif
# }
.annotate 'line', 2876

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2879
    self.'annotate'(__ARG_1)
.annotate 'line', 2880
# id: $S1
    $P1 = self.'emit_getid'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 2881
    .return($S1)
# }
.annotate 'line', 2882

.end # emit_get


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2885
    self.'annotate'(__ARG_1)
.annotate 'line', 2886
    $P1 = self.'isnull'()
    if_null $P1, __label_0
    unless $P1 goto __label_0
# predefined die
.annotate 'line', 2887
    die "NO"
  __label_0: # endif
.annotate 'line', 2888
# typeleft: $S1
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 2889
# lreg: $S2
    $P1 = self.'getIdentifier'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 2890
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_3
    unless $P1 goto __label_3
# {
# switch
.annotate 'line', 2891
    set $S5, $S1
    set $S6, 'S'
    if $S5 == $S6 goto __label_7
    set $S6, 'P'
    if $S5 == $S6 goto __label_8
    goto __label_6
  __label_7: # case
  __label_8: # case
.annotate 'line', 2894
    __ARG_1.'emitnull'($S2)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 2897
    getattribute $P2, self, 'start'
    'SyntaxError'("Can't assign null to that type", $P2)
  __label_5: # switch end
# }
    goto __label_4
  __label_3: # else
.annotate 'line', 2900
    isa $I1, __ARG_2, [ 'IndexExpr' ]
    unless $I1 goto __label_9
.annotate 'line', 2901
    __ARG_2.'emit'(__ARG_1, $S2)
    goto __label_10
  __label_9: # else
# {
.annotate 'line', 2903
# typeright: $S3
    $P1 = __ARG_2.'checkresult'()
    null $S3
    if_null $P1, __label_11
    set $S3, $P1
  __label_11:
.annotate 'line', 2904
    ne $S3, 'v', __label_12
.annotate 'line', 2905
    getattribute $P1, self, 'start'
    'SyntaxError'("Can't assign from void expression", $P1)
  __label_12: # endif
.annotate 'line', 2906
    ne $S1, $S3, __label_13
# {
.annotate 'line', 2907
    __ARG_2.'emit'(__ARG_1, $S2)
# }
    goto __label_14
  __label_13: # else
# {
.annotate 'line', 2910
# rreg: $S4
    $P1 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P1, __label_15
    set $S4, $P1
  __label_15:
.annotate 'line', 2911
    self.'annotate'(__ARG_1)
.annotate 'line', 2912
    iseq $I1, $S1, 'P'
    unless $I1 goto __label_18
    isne $I1, $S3, 'P'
  __label_18:
    unless $I1 goto __label_16
.annotate 'line', 2913
    __ARG_1.'emitbox'($S2, $S4)
    goto __label_17
  __label_16: # else
.annotate 'line', 2915
    __ARG_1.'emitset'($S2, $S4)
  __label_17: # endif
# }
  __label_14: # endif
# }
  __label_10: # endif
  __label_4: # endif
.annotate 'line', 2918
    .return($S2)
# }
.annotate 'line', 2919

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IdentifierExpr' ]
.annotate 'line', 2772
    get_class $P1, [ 'SimpleExpr' ]
    addparent $P0, $P1
.annotate 'line', 2774
    addattribute $P0, 'name'
.end
.namespace [ 'LexicalVolatileExpr' ]

.sub 'LexicalVolatileExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2929
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 2930
    setattribute self, 'desc', __ARG_2
# }
.annotate 'line', 2931

.end # LexicalVolatileExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2932
    .return('P')
# }

.end # checkresult


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2935
# var desc: $P1
    getattribute $P1, self, 'desc'
.annotate 'line', 2936
# lexname: $S1
    $P2 = $P1.'getlex'()
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
  __label_0:
.annotate 'line', 2937
# reg: $S2
    getattribute $P3, self, 'owner'
    $P2 = $P3.'tempreg'('P')
    null $S2
    if_null $P2, __label_1
    set $S2, $P2
  __label_1:
.annotate 'line', 2938
    __ARG_1.'emitfind_lex'($S2, $S1)
.annotate 'line', 2939
    .return($S2)
# }
.annotate 'line', 2940

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2943
    set $S2, __ARG_2
    eq $S2, '', __label_0
# {
.annotate 'line', 2944
    self.'annotate'(__ARG_1)
.annotate 'line', 2945
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 2946
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_0: # endif
# }
.annotate 'line', 2948

.end # emit


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2951
# lreg: $S1
    getattribute $P3, self, 'owner'
    $P2 = $P3.'tempreg'('P')
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
  __label_0:
.annotate 'line', 2952
    $P2 = __ARG_2.'isnull'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 2953
    __ARG_1.'emitnull'($S1)
    goto __label_2
  __label_1: # else
.annotate 'line', 2954
    isa $I1, __ARG_2, [ 'IndexExpr' ]
    unless $I1 goto __label_3
.annotate 'line', 2955
    __ARG_2.'emit'(__ARG_1, $S1)
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 2957
# typeright: $S2
    $P3 = __ARG_2.'checkresult'()
    null $S2
    if_null $P3, __label_5
    set $S2, $P3
  __label_5:
.annotate 'line', 2958
    ne 'P', $S2, __label_6
# {
.annotate 'line', 2959
    __ARG_2.'emit'(__ARG_1, $S1)
# }
    goto __label_7
  __label_6: # else
# {
.annotate 'line', 2962
# rreg: $S3
    $P2 = __ARG_2.'emit_get'(__ARG_1)
    null $S3
    if_null $P2, __label_8
    set $S3, $P2
  __label_8:
.annotate 'line', 2963
    self.'annotate'(__ARG_1)
.annotate 'line', 2964
    __ARG_1.'emitbox'($S1, $S3)
# }
  __label_7: # endif
# }
  __label_4: # endif
  __label_2: # endif
.annotate 'line', 2968
# var desc: $P1
    getattribute $P1, self, 'desc'
.annotate 'line', 2969
# lexname: $S4
    $P2 = $P1.'getlex'()
    null $S4
    if_null $P2, __label_9
    set $S4, $P2
  __label_9:
.annotate 'line', 2970
    __ARG_1.'say'("store_lex '", $S4, "', ", $S1)
# }
.annotate 'line', 2971

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'LexicalVolatileExpr' ]
.annotate 'line', 2924
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 2926
    addattribute $P0, 'desc'
.end
.namespace [ 'OpExpr' ]

.sub 'initop' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2980
    self.'Expr'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2981

.end # initop

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpExpr' ]
.annotate 'line', 2976
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpClassExpr' ]

.sub 'OpClassExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2992
    self.'initop'(__ARG_2, __ARG_3)
.annotate 'line', 2993
    $P2 = 'parseClassSpecifier'(__ARG_1, __ARG_2)
    setattribute self, 'clspec', $P2
# }
.annotate 'line', 2994

.end # OpClassExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2995
    .return('P')
# }

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2998
# var clspec: $P1
    getattribute $P1, self, 'clspec'
.annotate 'line', 3001
    set $S1, __ARG_2
    ne $S1, '', __label_0
.annotate 'line', 3002
    getattribute $P2, self, 'owner'
    __ARG_2 = $P2.'tempreg'('P')
  __label_0: # endif
.annotate 'line', 3003
    __ARG_1.'print'('    get_class ', __ARG_2, ', ')
.annotate 'line', 3004
    getattribute $P2, self, 'owner'
    $P1.'emit'(__ARG_1, $P2)
.annotate 'line', 3005
    __ARG_1.'say'()
# }
.annotate 'line', 3006

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpClassExpr' ]
.annotate 'line', 2986
    get_class $P1, [ 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 2988
    addattribute $P0, 'clspec'
.end
.namespace [ 'OpUnaryExpr' ]

.sub 'OpUnaryExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3016
    self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 3017
    setattribute self, 'subexpr', __ARG_3
# }
.annotate 'line', 3018

.end # OpUnaryExpr


.sub 'optimizearg' :method
# Body
# {
.annotate 'line', 3021
    getattribute $P3, self, 'subexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'subexpr', $P2
# }
.annotate 'line', 3022

.end # optimizearg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3025
    self.'optimizearg'()
.annotate 'line', 3026
    .return(self)
# }
.annotate 'line', 3027

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpUnaryExpr' ]
.annotate 'line', 3011
    get_class $P1, [ 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3013
    addattribute $P0, 'subexpr'
.end
.namespace [ 'OpBinaryExpr' ]

.sub 'initbinary' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 3038
    self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 3039
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 3040
    setattribute self, 'rexpr', __ARG_4
# }
.annotate 'line', 3041

.end # initbinary


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 3044
    self.'initbinary'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 3045
    .return(self)
# }
.annotate 'line', 3046

.end # set


.sub 'setfrom' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3049
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    getattribute $P3, __ARG_1, 'lexpr'
    getattribute $P4, __ARG_1, 'rexpr'
    .tailcall self.'set'($P1, $P2, $P3, $P4)
# }
.annotate 'line', 3050

.end # setfrom


.sub 'optimizearg' :method
# Body
# {
.annotate 'line', 3053
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 3054
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'rexpr', $P2
# }
.annotate 'line', 3055

.end # optimizearg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3058
    self.'optimizearg'()
.annotate 'line', 3059
    .return(self)
# }
.annotate 'line', 3060

.end # optimize


.sub 'emit_intleft' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3063
# reg: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_getint'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 3064
    .return($S1)
# }
.annotate 'line', 3065

.end # emit_intleft


.sub 'emit_intright' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3068
# reg: $S1
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_getint'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 3069
    .return($S1)
# }
.annotate 'line', 3070

.end # emit_intright

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBinaryExpr' ]
.annotate 'line', 3032
    get_class $P1, [ 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3034
    addattribute $P0, 'lexpr'
.annotate 'line', 3035
    addattribute $P0, 'rexpr'
.end
.namespace [ 'OpBinaryIntExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3079
    .return('I')
# }
.annotate 'line', 3080

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3083
    self.'optimizearg'()
.annotate 'line', 3084
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3085
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3086
    $I3 = $P1.'isintegerliteral'()
    unless $I3 goto __label_1
    $I3 = $P2.'isintegerliteral'()
  __label_1:
    unless $I3 goto __label_0
# {
.annotate 'line', 3087
# li: $I1
# predefined int
    getattribute $P3, $P1, 'numval'
    set $I1, $P3
.annotate 'line', 3088
# ri: $I2
# predefined int
    getattribute $P3, $P2, 'numval'
    set $I2, $P3
.annotate 'line', 3089
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P5 = self.'do_op'($I1, $I2)
    .tailcall 'integerValue'($P3, $P4, $P5)
# }
  __label_0: # endif
.annotate 'line', 3091
    .return(self)
# }
.annotate 'line', 3092

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBinaryIntExpr' ]
.annotate 'line', 3075
    get_class $P1, [ 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpDelExBase' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3101
    .return('I')
# }
.annotate 'line', 3102

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpDelExBase' ]
.annotate 'line', 3097
    get_class $P1, [ 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpDeleteExpr' ]

.sub 'OpDeleteExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3110
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3111

.end # OpDeleteExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3114
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3115
    isa $I1, $P1, [ 'IndexExpr' ]
    unless $I1 goto __label_2
    $P2 = $P1.'checkresult'()
    set $S1, $P2
    isne $I1, $S1, 'S'
  __label_2:
    unless $I1 goto __label_0
# {
.annotate 'line', 3116
    $P1.'emit_prep'(__ARG_1)
.annotate 'line', 3117
    self.'annotate'(__ARG_1)
.annotate 'line', 3118
    __ARG_1.'print'('    delete ')
.annotate 'line', 3119
    $P1.'emit_aux'(__ARG_1)
.annotate 'line', 3120
    __ARG_1.'say'()
.annotate 'line', 3121
    set $S1, __ARG_2
    eq $S1, '', __label_3
.annotate 'line', 3122
    __ARG_1.'emitset'(__ARG_2, '1')
  __label_3: # endif
# }
    goto __label_1
  __label_0: # else
.annotate 'line', 3125
    getattribute $P2, self, 'start'
    'SyntaxError'("delete with invalid operator", $P2)
  __label_1: # endif
# }
.annotate 'line', 3126

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpDeleteExpr' ]
.annotate 'line', 3106
    get_class $P1, [ 'OpDelExBase' ]
    addparent $P0, $P1
.end
.namespace [ 'OpExistsExpr' ]

.sub 'OpExistsExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3133
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3134

.end # OpExistsExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3137
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3138
# reg: $S1
    set $S2, __ARG_2
    eq $S2, '', __label_1
    set $P2, __ARG_2
    goto __label_0
  __label_1:
    $P2 = self.'tempreg'('I')
  __label_0:
    null $S1
    if_null $P2, __label_2
    set $S1, $P2
  __label_2:
.annotate 'line', 3139
    isa $I1, $P1, [ 'IndexExpr' ]
    unless $I1 goto __label_5
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    isne $I1, $S2, 'S'
  __label_5:
    unless $I1 goto __label_3
# {
.annotate 'line', 3140
    $P1.'emit_prep'(__ARG_1)
.annotate 'line', 3141
    self.'annotate'(__ARG_1)
.annotate 'line', 3142
    __ARG_1.'print'('    exists ', $S1, ', ')
.annotate 'line', 3143
    $P1.'emit_aux'(__ARG_1)
.annotate 'line', 3144
    __ARG_1.'say'()
# }
    goto __label_4
  __label_3: # else
.annotate 'line', 3147
    getattribute $P2, self, 'start'
    'SyntaxError'("exists with invalid operator", $P2)
  __label_4: # endif
# }
.annotate 'line', 3148

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpExistsExpr' ]
.annotate 'line', 3129
    get_class $P1, [ 'OpDelExBase' ]
    addparent $P0, $P1
.end
.namespace [ 'OpUnaryMinusExpr' ]

.sub 'OpUnaryMinusExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3157
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3158

.end # OpUnaryMinusExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3161
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3162

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3165
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3166
    .return(self)
# }
.annotate 'line', 3167

.end # set


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3170
    self.'optimizearg'()
.annotate 'line', 3171
    getattribute $P4, self, 'subexpr'
    $P3 = $P4.'isintegerliteral'()
    if_null $P3, __label_0
    unless $P3 goto __label_0
# {
.annotate 'line', 3172
# var numval: $P1
    getattribute $P5, self, 'subexpr'
    getattribute $P1, $P5, 'numval'
.annotate 'line', 3173
# i: $I1
    set $P3, $P1
    set $I1, $P3
.annotate 'line', 3174
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'subexpr'
    getattribute $P5, $P4, 'start'
    neg $I2, $I1
    .tailcall 'integerValue'($P3, $P5, $I2)
# }
  __label_0: # endif
# {
.annotate 'line', 3177
    getattribute $P4, self, 'subexpr'
    $P3 = $P4.'isfloatliteral'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 3178
# var numval: $P2
    getattribute $P5, self, 'subexpr'
    getattribute $P2, $P5, 'numval'
.annotate 'line', 3179
# n: $N1
# predefined string
    set $S1, $P2
    set $N1, $S1
.annotate 'line', 3180
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'subexpr'
    getattribute $P5, $P4, 'start'
    neg $N2, $N1
    .tailcall 'floatValue'($P3, $P5, $N2)
# }
  __label_1: # endif
# }
.annotate 'line', 3183
    .return(self)
# }
.annotate 'line', 3184

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3187
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 3188
    self.'annotate'(__ARG_1)
.annotate 'line', 3189
    __ARG_1.'emitarg2'('neg', __ARG_2, $S1)
# }
.annotate 'line', 3190

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpUnaryMinusExpr' ]
.annotate 'line', 3153
    get_class $P1, [ 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpNotExpr' ]

.sub 'OpNotExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3199
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3200

.end # OpNotExpr


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3201
    .return(1)
# }

.end # isnegable


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3204
    .return('I')
# }
.annotate 'line', 3205

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3208
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3209
    .return(self)
# }
.annotate 'line', 3210

.end # set


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3213
    self.'optimizearg'()
.annotate 'line', 3214
# var subexpr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3215
    $P3 = $P1.'isintegerliteral'()
    if_null $P3, __label_0
    unless $P3 goto __label_0
# {
.annotate 'line', 3216
# var numval: $P2
    getattribute $P2, $P1, 'numval'
.annotate 'line', 3217
# n: $I1
    set $P3, $P2
    set $I1, $P3
.annotate 'line', 3218
    getattribute $P3, self, 'owner'
    getattribute $P4, $P1, 'start'
    not $I2, $I1
    .tailcall 'integerValue'($P3, $P4, $I2)
# }
  __label_0: # endif
.annotate 'line', 3220
    $P3 = $P1.'isnegable'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 3221
    .tailcall $P1.'negated'()
  __label_1: # endif
.annotate 'line', 3222
    .return(self)
# }
.annotate 'line', 3223

.end # optimize


.sub 'negated' :method
# Body
# {
.annotate 'line', 3226
    getattribute $P1, self, 'subexpr'
    .return($P1)
# }
.annotate 'line', 3227

.end # negated


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3230
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 3231
    self.'annotate'(__ARG_1)
.annotate 'line', 3232
# type: $S2
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
  __label_1:
# switch
.annotate 'line', 3233
    set $S3, $S2
    set $S4, 'I'
    if $S3 == $S4 goto __label_4
    set $S4, 'P'
    if $S3 == $S4 goto __label_5
    goto __label_3
  __label_4: # case
.annotate 'line', 3235
    __ARG_1.'emitarg2'('not', __ARG_2, $S1)
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 3238
    __ARG_1.'emitarg2'('isfalse', __ARG_2, $S1)
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 3241
    __ARG_1.'emitarg2'('isfalse', __ARG_2, $S1)
  __label_2: # switch end
# }
.annotate 'line', 3243

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpNotExpr' ]
.annotate 'line', 3195
    get_class $P1, [ 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpPreIncExpr' ]

.sub 'OpPreIncExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3252
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3253

.end # OpPreIncExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3256
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3257

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3260
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3261
    setattribute self, 'subexpr', __ARG_3
.annotate 'line', 3262
    .return(self)
# }
.annotate 'line', 3263

.end # set


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3266
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 3267
    set $S2, __ARG_2
    eq $S2, '', __label_1
.annotate 'line', 3268
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_1: # endif
# }
.annotate 'line', 3269

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3272
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 3273
    self.'annotate'(__ARG_1)
.annotate 'line', 3274
    __ARG_1.'emitinc'($S1)
.annotate 'line', 3275
    .return($S1)
# }
.annotate 'line', 3276

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpPreIncExpr' ]
.annotate 'line', 3248
    get_class $P1, [ 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpPostIncExpr' ]

.sub 'OpPostIncExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3285
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3286
    .return(self)
# }
.annotate 'line', 3287

.end # OpPostIncExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3290
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3291

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3294
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 3295
    self.'annotate'(__ARG_1)
.annotate 'line', 3296
    set $S2, __ARG_2
    eq $S2, '', __label_1
.annotate 'line', 3297
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_1: # endif
.annotate 'line', 3298
    __ARG_1.'emitinc'($S1)
.annotate 'line', 3299
    .return($S1)
# }
.annotate 'line', 3300

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpPostIncExpr' ]
.annotate 'line', 3281
    get_class $P1, [ 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpPreDecExpr' ]

.sub 'OpPreDecExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3309
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3310

.end # OpPreDecExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3313
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3314

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3317
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3318
    .return(self)
# }
.annotate 'line', 3319

.end # set


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3322
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 3323
    set $S2, __ARG_2
    eq $S2, '', __label_1
.annotate 'line', 3324
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_1: # endif
# }
.annotate 'line', 3325

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3328
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 3329
    self.'annotate'(__ARG_1)
.annotate 'line', 3330
    __ARG_1.'emitdec'($S1)
.annotate 'line', 3331
    .return($S1)
# }
.annotate 'line', 3332

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpPreDecExpr' ]
.annotate 'line', 3305
    get_class $P1, [ 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpPostDecExpr' ]

.sub 'OpPostDecExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3341
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3342
    .return(self)
# }
.annotate 'line', 3343

.end # OpPostDecExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3346
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3347

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3350
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 3351
    self.'annotate'(__ARG_1)
.annotate 'line', 3352
    set $S2, __ARG_2
    eq $S2, '', __label_1
.annotate 'line', 3353
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_1: # endif
.annotate 'line', 3354
    __ARG_1.'emitdec'($S1)
.annotate 'line', 3355
    .return($S1)
# }
.annotate 'line', 3356

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpPostDecExpr' ]
.annotate 'line', 3337
    get_class $P1, [ 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpBaseAssignExpr' ]

.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 3367
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3368
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 3369
    setattribute self, 'rexpr', __ARG_4
.annotate 'line', 3370
    .return(self)
# }
.annotate 'line', 3371

.end # set


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3374
    getattribute $P1, self, 'lexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3375

.end # checkresult


.sub 'optimize_base' :method
# Body
# {
.annotate 'line', 3378
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 3379
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'rexpr', $P2
.annotate 'line', 3380
    .return(self)
# }
.annotate 'line', 3381

.end # optimize_base


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3384
    .tailcall self.'optimize_base'()
# }
.annotate 'line', 3385

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3388
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 3389
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 3390
    self.'annotate'(__ARG_1)
.annotate 'line', 3391
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_1: # endif
# }
.annotate 'line', 3393

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBaseAssignExpr' ]
.annotate 'line', 3361
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3363
    addattribute $P0, 'lexpr'
.annotate 'line', 3364
    addattribute $P0, 'rexpr'
.end
.namespace [ 'OpAssignExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3402
    self.'annotate'(__ARG_1)
.annotate 'line', 3403
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3404
    getattribute $P2, self, 'rexpr'
    .tailcall $P1.'emit_assign_get'(__ARG_1, $P2)
# }
.annotate 'line', 3405

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpAssignExpr' ]
.annotate 'line', 3398
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpAssignToExpr' ]

.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3414
    self.'annotate'(__ARG_1)
.annotate 'line', 3415
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 3416
    isnull $I1, __ARG_2
    not $I1
    unless $I1 goto __label_2
    set $S2, __ARG_2
    isne $I1, $S2, ''
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 3417
    __ARG_1.'emitassign'(__ARG_2, $S1)
  __label_1: # endif
# }
.annotate 'line', 3418

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3421
    self.'annotate'(__ARG_1)
.annotate 'line', 3422
# reg: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 3423
# reg2: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
  __label_1:
.annotate 'line', 3424
    __ARG_1.'emitassign'($S1, $S2)
.annotate 'line', 3425
    .return($S1)
# }
.annotate 'line', 3426

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpAssignToExpr' ]
.annotate 'line', 3410
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpAddToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3435
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3436
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3437
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
  __label_0:
.annotate 'line', 3438
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_1
    set $S2, $P3
  __label_1:
.annotate 'line', 3439
# reg: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_2
    set $S3, $P3
  __label_2:
.annotate 'line', 3440
    iseq $I1, $S1, 'S'
    unless $I1 goto __label_5
    isa $I1, $P2, [ 'ConcatString' ]
  __label_5:
    unless $I1 goto __label_3
.annotate 'line', 3441
    $P2.'emit_concat_to'(__ARG_1, $S3)
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 3443
# reg2: $S4
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_6
    set $S4, $P3
  __label_6:
.annotate 'line', 3444
# aux: $S5
    null $S5
.annotate 'line', 3445
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 3446
    set $S6, $S1
    set $S7, 'S'
    if $S6 == $S7 goto __label_9
    set $S7, 'I'
    if $S6 == $S7 goto __label_10
    set $S7, 'N'
    if $S6 == $S7 goto __label_11
    goto __label_8
  __label_9: # case
.annotate 'line', 3448
    eq $S2, 'S', __label_12
# {
.annotate 'line', 3449
    $P3 = self.'tempreg'('S')
    set $S5, $P3
.annotate 'line', 3450
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3451
    set $S4, $S5
# }
  __label_12: # endif
.annotate 'line', 3453
    __ARG_1.'emitconcat1'($S3, $S4)
    goto __label_7 # break
  __label_10: # case
  __label_11: # case
.annotate 'line', 3457
    eq $S1, $S2, __label_13
# {
.annotate 'line', 3458
    $P3 = self.'tempreg'($S1)
    set $S5, $P3
.annotate 'line', 3459
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3460
    set $S4, $S5
# }
  __label_13: # endif
.annotate 'line', 3462
    __ARG_1.'emitaddto'($S3, $S4)
    goto __label_7 # break
  __label_8: # default
.annotate 'line', 3465
    __ARG_1.'emitaddto'($S3, $S4)
  __label_7: # switch end
# }
  __label_4: # endif
.annotate 'line', 3468
    .return($S3)
# }
.annotate 'line', 3469

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpAddToExpr' ]
.annotate 'line', 3431
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpSubToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3478
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3479
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3480
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
  __label_0:
.annotate 'line', 3481
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_1
    set $S2, $P3
  __label_1:
.annotate 'line', 3482
# reg: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_2
    set $S3, $P3
  __label_2:
.annotate 'line', 3483
# reg2: $S4
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_3
    set $S4, $P3
  __label_3:
.annotate 'line', 3484
# aux: $S5
    null $S5
.annotate 'line', 3485
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 3486
    set $S6, $S1
    set $S7, 'S'
    if $S6 == $S7 goto __label_6
    set $S7, 'I'
    if $S6 == $S7 goto __label_7
    set $S7, 'N'
    if $S6 == $S7 goto __label_8
    goto __label_5
  __label_6: # case
.annotate 'line', 3488
    getattribute $P3, self, 'start'
    'SyntaxError'("-= can't be applied to string", $P3)
  __label_7: # case
  __label_8: # case
.annotate 'line', 3491
    eq $S1, $S2, __label_9
# {
.annotate 'line', 3492
    $P4 = self.'tempreg'($S1)
    set $S5, $P4
.annotate 'line', 3493
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3494
    set $S4, $S5
# }
  __label_9: # endif
.annotate 'line', 3496
    __ARG_1.'emitsubto'($S3, $S4)
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 3499
    __ARG_1.'emitsubto'($S3, $S4)
  __label_4: # switch end
.annotate 'line', 3501
    .return($S3)
# }
.annotate 'line', 3502

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpSubToExpr' ]
.annotate 'line', 3474
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpMulToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3511
# ltype: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 3512
# rtype: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
  __label_1:
.annotate 'line', 3513
# lreg: $S3
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_2
    set $S3, $P1
  __label_2:
.annotate 'line', 3514
# rreg: $S4
    null $S4
# switch
.annotate 'line', 3515
    set $S5, $S1
    set $S6, 'S'
    if $S5 == $S6 goto __label_5
    goto __label_4
  __label_5: # case
.annotate 'line', 3517
    ne $S2, 'I', __label_6
.annotate 'line', 3518
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    set $S4, $P1
    goto __label_7
  __label_6: # else
# {
.annotate 'line', 3520
    $P3 = self.'tempreg'('I')
    set $S4, $P3
.annotate 'line', 3521
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S4)
# }
  __label_7: # endif
.annotate 'line', 3523
    self.'annotate'(__ARG_1)
.annotate 'line', 3524
    __ARG_1.'emitrepeat'($S3, $S3, $S4)
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 3527
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    set $S4, $P1
.annotate 'line', 3528
    self.'annotate'(__ARG_1)
.annotate 'line', 3529
    __ARG_1.'emitarg2'('mul', $S3, $S4)
  __label_3: # switch end
.annotate 'line', 3531
    .return($S3)
# }
.annotate 'line', 3532

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpMulToExpr' ]
.annotate 'line', 3507
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpDivToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3541
# type: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 3542
# reg: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
  __label_1:
.annotate 'line', 3543
# reg2: $S3
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_2
    set $S3, $P1
  __label_2:
.annotate 'line', 3544
    self.'annotate'(__ARG_1)
.annotate 'line', 3545
    __ARG_1.'emitarg2'('div', $S2, $S3)
.annotate 'line', 3546
    .return($S2)
# }
.annotate 'line', 3547

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpDivToExpr' ]
.annotate 'line', 3537
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpModToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3556
# type: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 3557
# reg: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
  __label_1:
.annotate 'line', 3558
# reg2: $S3
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_2
    set $S3, $P1
  __label_2:
.annotate 'line', 3559
    self.'annotate'(__ARG_1)
.annotate 'line', 3560
    __ARG_1.'emitarg2'('mod', $S2, $S3)
.annotate 'line', 3561
    .return($S2)
# }
.annotate 'line', 3562

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpModToExpr' ]
.annotate 'line', 3552
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'ComparatorBaseExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3569
    .return('I')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3572
    self.'optimizearg'()
.annotate 'line', 3573
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3574
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3575
    $I3 = $P1.'isintegerliteral'()
    unless $I3 goto __label_1
    $I3 = $P2.'isintegerliteral'()
  __label_1:
    unless $I3 goto __label_0
# {
.annotate 'line', 3576
# li: $I1
# predefined int
    getattribute $P3, $P1, 'numval'
    set $I1, $P3
.annotate 'line', 3577
# ri: $I2
# predefined int
    getattribute $P3, $P2, 'numval'
    set $I2, $P3
.annotate 'line', 3578
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P5 = self.'int_op'($I1, $I2)
    .tailcall 'integerValue'($P3, $P4, $P5)
# }
  __label_0: # endif
.annotate 'line', 3580
    .return(self)
# }
.annotate 'line', 3581

.end # optimize


.sub 'emit_comparator' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 3584
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 3585
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
  __label_1:
.annotate 'line', 3586
# regl: $S3
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_2
    set $S3, $P1
  __label_2:
.annotate 'line', 3587
# regr: $S4
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P1, __label_3
    set $S4, $P1
  __label_3:
.annotate 'line', 3588
    self.'annotate'(__ARG_1)
.annotate 'line', 3589
# aux: $S5
    null $S5
.annotate 'line', 3590
    iseq $I1, $S1, 'N'
    if $I1 goto __label_6
    iseq $I1, $S2, 'N'
  __label_6:
    unless $I1 goto __label_4
# {
.annotate 'line', 3592
    ne $S1, 'I', __label_7
# {
.annotate 'line', 3593
    $P1 = self.'tempreg'('N')
    set $S5, $P1
.annotate 'line', 3594
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3595
    set $S3, $S5
# }
  __label_7: # endif
.annotate 'line', 3597
    ne $S2, 'I', __label_8
# {
.annotate 'line', 3598
    $P1 = self.'tempreg'('N')
    set $S5, $P1
.annotate 'line', 3599
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3600
    set $S4, $S5
# }
  __label_8: # endif
# }
    goto __label_5
  __label_4: # else
.annotate 'line', 3603
    iseq $I1, $S2, 'I'
    unless $I1 goto __label_11
    iseq $I1, $S1, 'P'
  __label_11:
    unless $I1 goto __label_9
# {
.annotate 'line', 3604
    $P1 = self.'tempreg'('I')
    set $S5, $P1
.annotate 'line', 3605
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3606
    set $S3, $S5
# }
    goto __label_10
  __label_9: # else
.annotate 'line', 3608
    iseq $I1, $S2, 'P'
    unless $I1 goto __label_14
    iseq $I1, $S1, 'I'
  __label_14:
    unless $I1 goto __label_12
# {
.annotate 'line', 3609
    $P1 = self.'tempreg'('I')
    set $S5, $P1
.annotate 'line', 3610
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3611
    set $S4, $S5
# }
    goto __label_13
  __label_12: # else
.annotate 'line', 3613
    iseq $I1, $S2, 'S'
    unless $I1 goto __label_17
    iseq $I1, $S1, 'P'
  __label_17:
    unless $I1 goto __label_15
# {
.annotate 'line', 3614
    $P1 = self.'tempreg'('S')
    set $S5, $P1
.annotate 'line', 3615
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3616
    set $S3, $S5
# }
    goto __label_16
  __label_15: # else
.annotate 'line', 3618
    iseq $I1, $S2, 'P'
    unless $I1 goto __label_19
    iseq $I1, $S1, 'S'
  __label_19:
    unless $I1 goto __label_18
# {
.annotate 'line', 3619
    $P1 = self.'tempreg'('S')
    set $S5, $P1
.annotate 'line', 3620
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3621
    set $S4, $S5
# }
  __label_18: # endif
  __label_16: # endif
  __label_13: # endif
  __label_10: # endif
  __label_5: # endif
# switch
.annotate 'line', 3624
    set $I1, __ARG_3
    null $I2
    if $I1 == $I2 goto __label_22
    set $I2, 1
    if $I1 == $I2 goto __label_23
    set $I2, 2
    if $I1 == $I2 goto __label_24
    goto __label_21
  __label_22: # case
.annotate 'line', 3626
    self.'emitop'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_20 # break
  __label_23: # case
.annotate 'line', 3629
    self.'emitop_if'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_20 # break
  __label_24: # case
.annotate 'line', 3632
    self.'emitop_else'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_20 # break
  __label_21: # default
  __label_20: # switch end
.annotate 'line', 3633
# }
.annotate 'line', 3635

.end # emit_comparator


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3638
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3639

.end # emit


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 3642
    self.'emit_comparator'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 3643

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 3646
    self.'emit_comparator'(__ARG_1, __ARG_2, 2)
# }
.annotate 'line', 3647

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ComparatorBaseExpr' ]
.annotate 'line', 3567
    get_class $P1, [ 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'NullCheckerExpr' ]

.sub 'NullCheckerExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 3662
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 3663
    setattribute self, 'expr', __ARG_2
.annotate 'line', 3664
    box $P1, __ARG_3
    setattribute self, 'checknull', $P1
# }
.annotate 'line', 3665

.end # NullCheckerExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3666
    .return('I')
# }

.end # checkresult


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3667
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3670
# checkneg: $I1
    getattribute $P1, self, 'checknull'
    isfalse $I1, $P1
.annotate 'line', 3671
    box $P1, $I1
    setattribute self, 'checknull', $P1
.annotate 'line', 3672
    .return(self)
# }
.annotate 'line', 3673

.end # negated


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3676
# reg: $S1
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 3677
    self.'annotate'(__ARG_1)
.annotate 'line', 3678
    __ARG_1.'emitarg2'('isnull', __ARG_2, $S1)
.annotate 'line', 3679
    getattribute $P1, self, 'checknull'
    isfalse $I1, $P1
    unless $I1 goto __label_1
.annotate 'line', 3680
    __ARG_1.'emitarg1'('not', __ARG_2)
  __label_1: # endif
# }
.annotate 'line', 3681

.end # emit


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 3684
# reg: $S1
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 3685
    self.'annotate'(__ARG_1)
.annotate 'line', 3686
    getattribute $P1, self, 'checknull'
    if_null $P1, __label_2
    unless $P1 goto __label_2
    set $S2, 'unless'
    goto __label_1
  __label_2:
    set $S2, 'if'
  __label_1:
    __ARG_1.'say'('    ', $S2, '_null ', $S1, ', ', __ARG_2)
# }
.annotate 'line', 3687

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NullCheckerExpr' ]
.annotate 'line', 3655
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3657
    addattribute $P0, 'expr'
.annotate 'line', 3658
    addattribute $P0, 'checknull'
.end
.namespace [ 'OpEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3694
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3697
    new $P1, [ 'OpNotEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3698

.end # negated


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3701
    self.'optimizearg'()
.annotate 'line', 3702
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3703
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3704
# lnull: $I1
    $P3 = $P1.'isnull'()
    set $I1, $P3
.annotate 'line', 3705
# rnull: $I2
    $P3 = $P2.'isnull'()
    set $I2, $P3
.annotate 'line', 3706
    unless $I1 goto __label_0
# {
.annotate 'line', 3707
    unless $I2 goto __label_1
.annotate 'line', 3708
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall 'integerValue'($P3, $P4, 1)
    goto __label_2
  __label_1: # else
.annotate 'line', 3710
    new $P6, [ 'NullCheckerExpr' ]
    getattribute $P7, self, 'rexpr'
    $P6.'NullCheckerExpr'(self, $P7, 1)
    set $P5, $P6
    .return($P5)
  __label_2: # endif
# }
  __label_0: # endif
.annotate 'line', 3712
    unless $I2 goto __label_3
.annotate 'line', 3713
    new $P4, [ 'NullCheckerExpr' ]
    getattribute $P5, self, 'lexpr'
    $P4.'NullCheckerExpr'(self, $P5, 1)
    set $P3, $P4
    .return($P3)
  __label_3: # endif
.annotate 'line', 3714
    $I5 = $P1.'isliteral'()
    unless $I5 goto __label_5
    $I5 = $P2.'isliteral'()
  __label_5:
    unless $I5 goto __label_4
# {
.annotate 'line', 3715
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_6
    set $S1, $P3
  __label_6:
.annotate 'line', 3716
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_7
    set $S2, $P3
  __label_7:
.annotate 'line', 3717
    ne $S1, $S2, __label_8
# {
# switch
.annotate 'line', 3718
    set $S5, $S1
    set $S6, 'I'
    if $S5 == $S6 goto __label_11
    set $S6, 'S'
    if $S5 == $S6 goto __label_12
    goto __label_10
  __label_11: # case
.annotate 'line', 3720
# li: $I3
# predefined int
    getattribute $P3, $P1, 'numval'
    set $I3, $P3
.annotate 'line', 3721
# ri: $I4
# predefined int
    getattribute $P4, $P2, 'numval'
    set $I4, $P4
.annotate 'line', 3722
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    iseq $I5, $I3, $I4
    .tailcall 'integerValue'($P5, $P6, $I5)
  __label_12: # case
.annotate 'line', 3724
# ls: $S3
    getattribute $P8, $P1, 'strval'
    getattribute $P7, $P8, 'str'
    null $S3
    if_null $P7, __label_13
    set $S3, $P7
  __label_13:
.annotate 'line', 3725
# rs: $S4
    getattribute $P10, $P2, 'strval'
    getattribute $P9, $P10, 'str'
    null $S4
    if_null $P9, __label_14
    set $S4, $P9
  __label_14:
.annotate 'line', 3726
    getattribute $P11, self, 'owner'
    getattribute $P12, self, 'start'
    iseq $I6, $S3, $S4
    .tailcall 'integerValue'($P11, $P12, $I6)
  __label_10: # default
  __label_9: # switch end
# }
  __label_8: # endif
# }
  __label_4: # endif
.annotate 'line', 3730
    .return(self)
# }
.annotate 'line', 3731

.end # optimize


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3734
    __ARG_1.'emitbinop'('iseq', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3735

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3738
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3739

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3742
    __ARG_1.'emitcompare'('eq', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3743

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3746
    __ARG_1.'emitcompare'('ne', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3747

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpEqualExpr' ]
.annotate 'line', 3692
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpNotEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3754
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3757
    new $P1, [ 'OpEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3758

.end # negated


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3761
    self.'optimizearg'()
.annotate 'line', 3762
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3763
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3764
# lnull: $I1
    $P3 = $P1.'isnull'()
    set $I1, $P3
.annotate 'line', 3765
# rnull: $I2
    $P3 = $P2.'isnull'()
    set $I2, $P3
.annotate 'line', 3766
    unless $I1 goto __label_0
# {
.annotate 'line', 3767
    unless $I2 goto __label_1
.annotate 'line', 3768
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall 'integerValue'($P3, $P4, 0)
    goto __label_2
  __label_1: # else
.annotate 'line', 3770
    new $P6, [ 'NullCheckerExpr' ]
    getattribute $P7, self, 'rexpr'
    $P6.'NullCheckerExpr'(self, $P7, 0)
    set $P5, $P6
    .return($P5)
  __label_2: # endif
# }
  __label_0: # endif
.annotate 'line', 3772
    unless $I2 goto __label_3
.annotate 'line', 3773
    new $P4, [ 'NullCheckerExpr' ]
    getattribute $P5, self, 'lexpr'
    $P4.'NullCheckerExpr'(self, $P5, 0)
    set $P3, $P4
    .return($P3)
  __label_3: # endif
.annotate 'line', 3774
    $I5 = $P1.'isliteral'()
    unless $I5 goto __label_5
    $I5 = $P2.'isliteral'()
  __label_5:
    unless $I5 goto __label_4
# {
.annotate 'line', 3775
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_6
    set $S1, $P3
  __label_6:
.annotate 'line', 3776
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_7
    set $S2, $P3
  __label_7:
.annotate 'line', 3777
    ne $S1, $S2, __label_8
# {
# switch
.annotate 'line', 3778
    set $S5, $S1
    set $S6, 'I'
    if $S5 == $S6 goto __label_11
    set $S6, 'S'
    if $S5 == $S6 goto __label_12
    goto __label_10
  __label_11: # case
.annotate 'line', 3780
# li: $I3
# predefined int
    getattribute $P3, $P1, 'numval'
    set $I3, $P3
.annotate 'line', 3781
# ri: $I4
# predefined int
    getattribute $P4, $P2, 'numval'
    set $I4, $P4
.annotate 'line', 3782
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    isne $I5, $I3, $I4
    .tailcall 'integerValue'($P5, $P6, $I5)
  __label_12: # case
.annotate 'line', 3784
# ls: $S3
    getattribute $P8, $P1, 'strval'
    getattribute $P7, $P8, 'str'
    null $S3
    if_null $P7, __label_13
    set $S3, $P7
  __label_13:
.annotate 'line', 3785
# rs: $S4
    getattribute $P10, $P2, 'strval'
    getattribute $P9, $P10, 'str'
    null $S4
    if_null $P9, __label_14
    set $S4, $P9
  __label_14:
.annotate 'line', 3786
    getattribute $P11, self, 'owner'
    getattribute $P12, self, 'start'
    isne $I6, $S3, $S4
    .tailcall 'integerValue'($P11, $P12, $I6)
  __label_10: # default
  __label_9: # switch end
# }
  __label_8: # endif
# }
  __label_4: # endif
.annotate 'line', 3790
    .return(self)
# }
.annotate 'line', 3791

.end # optimize


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3794
    __ARG_1.'emitbinop'('isne', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3795

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3798
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3799

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3802
    __ARG_1.'emitcompare'('ne', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3803

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3806
    __ARG_1.'emitcompare'('eq', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3807

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpNotEqualExpr' ]
.annotate 'line', 3752
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpSameExpr' ]

.sub 'OpSameExpr' :method
        .param int __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 3817
    self.'initbinary'(__ARG_2, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 3818
    box $P1, __ARG_1
    setattribute self, 'positive', $P1
# }
.annotate 'line', 3819

.end # OpSameExpr


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3820
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3823
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 3824
    new $P2, [ 'OpSameExpr' ]
    not $I2, $I1
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    getattribute $P5, self, 'lexpr'
    getattribute $P6, self, 'rexpr'
    $P2.'OpSameExpr'($I2, $P3, $P4, $P5, $P6)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 3825

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 3828
    getattribute $P1, self, 'positive'
    if_null $P1, __label_1
    unless $P1 goto __label_1
    iseq $I1, __ARG_1, __ARG_2
    goto __label_0
  __label_1:
    isne $I1, __ARG_1, __ARG_2
  __label_0:
    .return($I1)
# }
.annotate 'line', 3829

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3832
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 3833
# op: $S1
    unless $I1 goto __label_1
    set $S1, 'issame'
    goto __label_0
  __label_1:
    set $S1, 'isntsame'
  __label_0:
.annotate 'line', 3834
    __ARG_1.'emitbinop'($S1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3835

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3838
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3839

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3842
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 3843
# op: $S1
    unless $I1 goto __label_1
    set $S1, 'eq_addr'
    goto __label_0
  __label_1:
    set $S1, 'ne_addr'
  __label_0:
.annotate 'line', 3844
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3845

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3848
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 3849
# op: $S1
    unless $I1 goto __label_1
    set $S1, 'ne_addr'
    goto __label_0
  __label_1:
    set $S1, 'eq_addr'
  __label_0:
.annotate 'line', 3850
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3851

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpSameExpr' ]
.annotate 'line', 3812
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 3814
    addattribute $P0, 'positive'
.end
.namespace [ 'OpLessExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3858
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3861
    new $P1, [ 'OpGreaterEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3862

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 3865
    islt $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 3866

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3869
    __ARG_1.'emitbinop'('islt', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3870

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3873
    __ARG_1.'emitcompare'('lt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3874

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3877
    __ARG_1.'emitcompare'('ge', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3878

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpLessExpr' ]
.annotate 'line', 3856
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpGreaterExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3885
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3888
    new $P1, [ 'OpLessEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3889

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 3892
    isgt $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 3893

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3896
    __ARG_1.'emitbinop'('isgt', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3897

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3900
    __ARG_1.'emitcompare'('gt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3901

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3904
    __ARG_1.'emitcompare'('le', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3905

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpGreaterExpr' ]
.annotate 'line', 3883
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpLessEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3912
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3915
    new $P1, [ 'OpGreaterExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3916

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 3919
    isle $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 3920

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3923
    __ARG_1.'emitbinop'('isle', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3924

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3927
    __ARG_1.'emitcompare'('le', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3928

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3931
    __ARG_1.'emitcompare'('gt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3932

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpLessEqualExpr' ]
.annotate 'line', 3910
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpGreaterEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3939
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3942
    new $P1, [ 'OpLessExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3943

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 3946
    isge $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 3947

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3950
    __ARG_1.'emitbinop'('isge', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3951

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3954
    __ARG_1.'emitcompare'('ge', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3955

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3958
    __ARG_1.'emitcompare'('lt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3959

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpGreaterEqualExpr' ]
.annotate 'line', 3937
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpBaseBoolExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3968
    .return('I')
# }
.annotate 'line', 3969

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBaseBoolExpr' ]
.annotate 'line', 3964
    get_class $P1, [ 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpBoolAndExpr' ]

.sub 'OpBoolAndExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 3978
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3979

.end # OpBoolAndExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3982
    self.'optimizearg'()
.annotate 'line', 3983
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'isintegerliteral'()
    if_null $P2, __label_0
    unless $P2 goto __label_0
# {
.annotate 'line', 3984
# var lval: $P1
    getattribute $P4, self, 'lexpr'
    getattribute $P1, $P4, 'numval'
.annotate 'line', 3985
# ln: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 3986
    eq $I1, 0, __label_1
.annotate 'line', 3987
    getattribute $P2, self, 'rexpr'
    .return($P2)
    goto __label_2
  __label_1: # else
.annotate 'line', 3989
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall 'integerValue'($P3, $P4, $I1)
  __label_2: # endif
# }
  __label_0: # endif
.annotate 'line', 3991
    .return(self)
# }
.annotate 'line', 3992

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3995
# res: $S1
    if_null __ARG_2, __label_1
    set $P1, __ARG_2
    goto __label_0
  __label_1:
    $P1 = self.'tempreg'('I')
  __label_0:
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 3996
    getattribute $P1, self, 'lexpr'
    $I1 = $P1.'issimple'()
    unless $I1 goto __label_5
    getattribute $P2, self, 'rexpr'
    $I1 = $P2.'issimple'()
  __label_5:
    unless $I1 goto __label_3
# {
.annotate 'line', 3997
# lreg: $S2
    $P3 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P3, __label_6
    set $S2, $P3
  __label_6:
.annotate 'line', 3998
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_7
    set $S3, $P1
  __label_7:
.annotate 'line', 3999
    __ARG_1.'emitbinop'('and', $S1, $S2, $S3)
# }
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 4002
# l: $S4
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S4
    if_null $P1, __label_8
    set $S4, $P1
  __label_8:
.annotate 'line', 4003
    getattribute $P1, self, 'lexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4004
    __ARG_1.'emitunless'($S1, $S4)
.annotate 'line', 4005
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4006
    __ARG_1.'emitlabel'($S4)
# }
  __label_4: # endif
# }
.annotate 'line', 4008

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBoolAndExpr' ]
.annotate 'line', 3974
    get_class $P1, [ 'OpBaseBoolExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpBoolOrExpr' ]

.sub 'OpBoolOrExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4017
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4018

.end # OpBoolOrExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4021
    self.'optimizearg'()
.annotate 'line', 4022
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'isintegerliteral'()
    if_null $P2, __label_0
    unless $P2 goto __label_0
# {
.annotate 'line', 4023
# var lval: $P1
    getattribute $P4, self, 'lexpr'
    getattribute $P1, $P4, 'numval'
.annotate 'line', 4024
# ln: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 4025
    ne $I1, 0, __label_1
.annotate 'line', 4026
    getattribute $P2, self, 'rexpr'
    .return($P2)
    goto __label_2
  __label_1: # else
.annotate 'line', 4028
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall 'integerValue'($P3, $P4, $I1)
  __label_2: # endif
# }
  __label_0: # endif
.annotate 'line', 4030
    .return(self)
# }
.annotate 'line', 4031

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4034
# res: $S1
    null $S1
.annotate 'line', 4035
    if_null __ARG_2, __label_0
.annotate 'line', 4036
    set $S1, __ARG_2
    goto __label_1
  __label_0: # else
.annotate 'line', 4038
    $P1 = self.'tempreg'('I')
    set $S1, $P1
  __label_1: # endif
.annotate 'line', 4039
    getattribute $P1, self, 'lexpr'
    $I1 = $P1.'issimple'()
    unless $I1 goto __label_4
    getattribute $P2, self, 'rexpr'
    $I1 = $P2.'issimple'()
  __label_4:
    unless $I1 goto __label_2
# {
.annotate 'line', 4040
# lreg: $S2
    $P3 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P3, __label_5
    set $S2, $P3
  __label_5:
.annotate 'line', 4041
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_6
    set $S3, $P1
  __label_6:
.annotate 'line', 4042
    __ARG_1.'emitbinop'('or', $S1, $S2, $S3)
# }
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 4045
# l: $S4
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S4
    if_null $P1, __label_7
    set $S4, $P1
  __label_7:
.annotate 'line', 4046
    getattribute $P1, self, 'lexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4047
    __ARG_1.'emitif'($S1, $S4)
.annotate 'line', 4048
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4049
    __ARG_1.'emitlabel'($S4)
# }
  __label_3: # endif
# }
.annotate 'line', 4051

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBoolOrExpr' ]
.annotate 'line', 4013
    get_class $P1, [ 'OpBaseBoolExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpBaseBinExpr' ]
.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBaseBinExpr' ]
.annotate 'line', 4056
    get_class $P1, [ 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpBinAndExpr' ]

.sub 'OpBinAndExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4066
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4067

.end # OpBinAndExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4070
# res: $S1
    if_null __ARG_2, __label_1
    set $P1, __ARG_2
    goto __label_0
  __label_1:
    $P1 = self.'tempreg'('I')
  __label_0:
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 4071
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
  __label_3:
.annotate 'line', 4072
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_4
    set $S3, $P1
  __label_4:
.annotate 'line', 4073
    self.'annotate'(__ARG_1)
.annotate 'line', 4074
    __ARG_1.'emitbinop'('band', $S1, $S2, $S3)
# }
.annotate 'line', 4075

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4078
    band $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4079

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBinAndExpr' ]
.annotate 'line', 4062
    get_class $P1, [ 'OpBaseBinExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpBinOrExpr' ]

.sub 'OpBinOrExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4088
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4089

.end # OpBinOrExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4092
# res: $S1
    if_null __ARG_2, __label_1
    set $P1, __ARG_2
    goto __label_0
  __label_1:
    $P1 = self.'tempreg'('I')
  __label_0:
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 4093
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
  __label_3:
.annotate 'line', 4094
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_4
    set $S3, $P1
  __label_4:
.annotate 'line', 4095
    self.'annotate'(__ARG_1)
.annotate 'line', 4096
    __ARG_1.'emitbinop'('bor', $S1, $S2, $S3)
# }
.annotate 'line', 4097

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4100
    bor $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4101

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBinOrExpr' ]
.annotate 'line', 4084
    get_class $P1, [ 'OpBaseBinExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpBinXorExpr' ]

.sub 'OpBinXorExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4110
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4111

.end # OpBinXorExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4114
# res: $S1
    if_null __ARG_2, __label_1
    set $P1, __ARG_2
    goto __label_0
  __label_1:
    $P1 = self.'tempreg'('I')
  __label_0:
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 4115
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
  __label_3:
.annotate 'line', 4116
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_4
    set $S3, $P1
  __label_4:
.annotate 'line', 4117
    self.'annotate'(__ARG_1)
.annotate 'line', 4118
    __ARG_1.'emitbinop'('bxor', $S1, $S2, $S3)
# }
.annotate 'line', 4119

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4122
    bxor $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4123

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBinXorExpr' ]
.annotate 'line', 4106
    get_class $P1, [ 'OpBaseBinExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'ConcatString' ]

.sub 'ConcatString' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4133
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 4134
    isa $I1, __ARG_3, [ 'ConcatString' ]
    unless $I1 goto __label_0
# {
.annotate 'line', 4135
    getattribute $P2, __ARG_3, 'values'
    setattribute self, 'values', $P2
.annotate 'line', 4136
    isa $I1, __ARG_4, [ 'ConcatString' ]
    unless $I1 goto __label_2
.annotate 'line', 4137
    getattribute $P1, self, 'values'
    getattribute $P2, __ARG_4, 'values'
    $P1.'append'($P2)
    goto __label_3
  __label_2: # else
.annotate 'line', 4139
    getattribute $P3, self, 'values'
# predefined push
    push $P3, __ARG_4
  __label_3: # endif
# }
    goto __label_1
  __label_0: # else
.annotate 'line', 4141
    isa $I1, __ARG_4, [ 'ConcatString' ]
    unless $I1 goto __label_4
# {
.annotate 'line', 4142
    getattribute $P2, __ARG_4, 'values'
    setattribute self, 'values', $P2
.annotate 'line', 4143
    getattribute $P1, self, 'values'
    $P1.'unshift'(__ARG_3)
# }
    goto __label_5
  __label_4: # else
.annotate 'line', 4146
    root_new $P2, ['parrot';'ResizablePMCArray']
    push $P2, __ARG_3
    push $P2, __ARG_4
    setattribute self, 'values', $P2
  __label_5: # endif
  __label_1: # endif
# }
.annotate 'line', 4147

.end # ConcatString


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4148
    .return('S')
# }

.end # checkresult


.sub 'getregs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4151
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 4152
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4153
    new $P2, ['FixedStringArray'], $I1
.annotate 'line', 4154
# i: $I2
    null $I2
# for loop
.annotate 'line', 4155
    null $I2
  __label_2: # for condition
    ge $I2, $I1, __label_1
.annotate 'line', 4156
# predefined string
    $P4 = $P1[$I2]
    $P3 = $P4.'emit_get'(__ARG_1)
    set $S1, $P3
    $P2[$I2] = $S1
  __label_0: # for iteration
.annotate 'line', 4155
    inc $I2
    goto __label_2
  __label_1: # for end
.annotate 'line', 4157
    .return($P2)
# }
.annotate 'line', 4158

.end # getregs


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4161
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4162
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4163
# auxreg: $S1
    set $S1, '$S0'
.annotate 'line', 4164
    self.'annotate'(__ARG_1)
.annotate 'line', 4165
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 4166
# i: $I2
    set $I2, 2
  __label_2: # for condition
    ge $I2, $I1, __label_1
.annotate 'line', 4167
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'($S1, $P2)
  __label_0: # for iteration
.annotate 'line', 4166
    inc $I2
    goto __label_2
  __label_1: # for end
.annotate 'line', 4168
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
.annotate 'line', 4169

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4172
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4173
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4174
# auxreg: $S1
    $P2 = self.'tempreg'('S')
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
  __label_0:
.annotate 'line', 4175
    self.'annotate'(__ARG_1)
.annotate 'line', 4176
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 4177
# i: $I2
    set $I2, 2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 4178
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'($S1, $P2)
  __label_1: # for iteration
.annotate 'line', 4177
    inc $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 4179
    .return($S1)
# }
.annotate 'line', 4180

.end # emit_get


.sub 'emit_concat_to' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4183
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4184
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4185
    self.'annotate'(__ARG_1)
# for loop
.annotate 'line', 4186
# i: $I2
    null $I2
  __label_2: # for condition
    ge $I2, $I1, __label_1
.annotate 'line', 4187
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'(__ARG_2, $P2)
  __label_0: # for iteration
.annotate 'line', 4186
    inc $I2
    goto __label_2
  __label_1: # for end
# }
.annotate 'line', 4188

.end # emit_concat_to


.sub 'emit_concat_set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4191
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4192
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4193
    self.'annotate'(__ARG_1)
.annotate 'line', 4194
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'(__ARG_2, $P2, $P3)
# for loop
.annotate 'line', 4195
# i: $I2
    set $I2, 2
  __label_2: # for condition
    ge $I2, $I1, __label_1
.annotate 'line', 4196
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'(__ARG_2, $P2)
  __label_0: # for iteration
.annotate 'line', 4195
    inc $I2
    goto __label_2
  __label_1: # for end
# }
.annotate 'line', 4197

.end # emit_concat_set

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ConcatString' ]
.annotate 'line', 4128
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 4130
    addattribute $P0, 'values'
.end
.namespace [ 'OpAddExpr' ]

.sub 'OpAddExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4206
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4207

.end # OpAddExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4210
    self.'optimizearg'()
.annotate 'line', 4211
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4212
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4213
# ltype: $S1
    $P10 = $P1.'checkresult'()
    null $S1
    if_null $P10, __label_0
    set $S1, $P10
  __label_0:
.annotate 'line', 4214
# rtype: $S2
    $P10 = $P2.'checkresult'()
    null $S2
    if_null $P10, __label_1
    set $S2, $P10
  __label_1:
.annotate 'line', 4215
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_3
    $I3 = $P2.'isliteral'()
  __label_3:
    unless $I3 goto __label_2
# {
.annotate 'line', 4216
    iseq $I4, $S1, 'S'
    unless $I4 goto __label_5
    iseq $I4, $S2, 'S'
  __label_5:
    unless $I4 goto __label_4
# {
.annotate 'line', 4221
# var etok: $P3
    getattribute $P3, $P1, 'strval'
.annotate 'line', 4222
# var rtok: $P4
    getattribute $P4, $P2, 'strval'
.annotate 'line', 4223
# var t: $P5
    isa $I3, $P3, [ 'TokenSingleQuoted' ]
    unless $I3 goto __label_8
.annotate 'line', 4224
    isa $I3, $P4, [ 'TokenSingleQuoted' ]
  __label_8:
    unless $I3 goto __label_7
.annotate 'line', 4226
    new $P10, [ 'TokenSingleQuoted' ]
    getattribute $P11, $P3, 'file'
    getattribute $P12, $P3, 'line'
# predefined string
.annotate 'line', 4227
    getattribute $P13, $P3, 'str'
    set $S3, $P13
# predefined string
    getattribute $P14, $P4, 'str'
    set $S4, $P14
    concat $S5, $S3, $S4
    $P10.'TokenSingleQuoted'($P11, $P12, $S5)
    set $P5, $P10
    goto __label_6
  __label_7:
.annotate 'line', 4229
    new $P15, [ 'TokenQuoted' ]
    getattribute $P16, $P3, 'file'
    getattribute $P17, $P3, 'line'
# predefined string
.annotate 'line', 4230
    $P18 = $P3.'getasquoted'()
    set $S6, $P18
# predefined string
    $P19 = $P4.'getasquoted'()
    set $S7, $P19
    concat $S8, $S6, $S7
    $P15.'TokenQuoted'($P16, $P17, $S8)
    set $P5, $P15
  __label_6:
.annotate 'line', 4231
    new $P11, [ 'StringLiteral' ]
    getattribute $P12, self, 'owner'
    $P11.'StringLiteral'($P12, $P5)
    set $P10, $P11
    .return($P10)
# }
  __label_4: # endif
.annotate 'line', 4233
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_10
    iseq $I3, $S2, 'I'
  __label_10:
    unless $I3 goto __label_9
# {
.annotate 'line', 4234
# var lval: $P6
    getattribute $P6, $P1, 'numval'
.annotate 'line', 4235
# ln: $I1
    set $P10, $P6
    set $I1, $P10
.annotate 'line', 4236
# var rval: $P7
    getattribute $P7, $P2, 'numval'
.annotate 'line', 4237
# rn: $I2
    set $P10, $P7
    set $I2, $P10
.annotate 'line', 4238
    getattribute $P10, self, 'owner'
    getattribute $P11, self, 'start'
    add $I3, $I1, $I2
    .tailcall 'integerValue'($P10, $P11, $I3)
# }
  __label_9: # endif
# {
.annotate 'line', 4241
    $P10 = 'floatresult'($S1, $S2)
    if_null $P10, __label_11
    unless $P10 goto __label_11
# {
.annotate 'line', 4242
# var lvalf: $P8
    getattribute $P8, $P1, 'numval'
.annotate 'line', 4243
# lf: $N1
# predefined string
    set $S3, $P8
    set $N1, $S3
.annotate 'line', 4244
# var rvalf: $P9
    getattribute $P9, $P2, 'numval'
.annotate 'line', 4245
# rf: $N2
# predefined string
    set $S3, $P9
    set $N2, $S3
.annotate 'line', 4246
    getattribute $P10, self, 'owner'
    getattribute $P11, self, 'start'
    add $N3, $N1, $N2
    .tailcall 'floatValue'($P10, $P11, $N3)
# }
  __label_11: # endif
# }
# }
  __label_2: # endif
.annotate 'line', 4250
    iseq $I3, $S1, 'S'
    unless $I3 goto __label_13
    iseq $I3, $S2, 'S'
  __label_13:
    unless $I3 goto __label_12
# {
.annotate 'line', 4251
    new $P11, [ 'ConcatString' ]
    getattribute $P12, self, 'owner'
    getattribute $P13, self, 'start'
    $P11.'ConcatString'($P12, $P13, $P1, $P2)
    set $P10, $P11
    .return($P10)
# }
  __label_12: # endif
.annotate 'line', 4253
    .return(self)
# }
.annotate 'line', 4254

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4257
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 4258
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
  __label_1:
.annotate 'line', 4259
    ne $S1, $S2, __label_2
.annotate 'line', 4260
    .return($S1)
  __label_2: # endif
.annotate 'line', 4261
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_4
    iseq $I1, $S2, 'S'
  __label_4:
    unless $I1 goto __label_3
.annotate 'line', 4262
    .return('S')
  __label_3: # endif
.annotate 'line', 4263
    iseq $I1, $S1, 'S'
    unless $I1 goto __label_6
    iseq $I1, $S2, 'I'
  __label_6:
    unless $I1 goto __label_5
.annotate 'line', 4264
    .return('S')
  __label_5: # endif
.annotate 'line', 4265
    $P1 = 'floatresult'($S1, $S2)
    if_null $P1, __label_7
    unless $P1 goto __label_7
.annotate 'line', 4266
    .return('N')
  __label_7: # endif
.annotate 'line', 4267
    .return('I')
# }
.annotate 'line', 4268

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4271
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4272
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4273
# restype: $S1
    $P3 = self.'checkresult'()
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
  __label_0:
.annotate 'line', 4274
# ltype: $S2
    $P3 = $P1.'checkresult'()
    null $S2
    if_null $P3, __label_1
    set $S2, $P3
  __label_1:
.annotate 'line', 4275
# rtype: $S3
    $P3 = $P2.'checkresult'()
    null $S3
    if_null $P3, __label_2
    set $S3, $P3
  __label_2:
.annotate 'line', 4277
# rleft: $S4
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_3
    set $S4, $P3
  __label_3:
.annotate 'line', 4278
# rright: $S5
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S5
    if_null $P3, __label_4
    set $S5, $P3
  __label_4:
.annotate 'line', 4279
    ne $S1, 'S', __label_5
# {
.annotate 'line', 4280
    isne $I1, $S2, 'S'
    if $I1 goto __label_8
    isne $I1, $S3, 'S'
  __label_8:
    unless $I1 goto __label_7
# {
.annotate 'line', 4281
# aux: $S6
    $P3 = self.'tempreg'('S')
    null $S6
    if_null $P3, __label_9
    set $S6, $P3
  __label_9:
.annotate 'line', 4282
    eq $S2, 'S', __label_10
# {
.annotate 'line', 4283
    __ARG_1.'emitset'($S6, $S4)
.annotate 'line', 4284
    set $S4, $S6
# }
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 4287
    __ARG_1.'emitset'($S6, $S5)
.annotate 'line', 4288
    set $S5, $S6
# }
  __label_11: # endif
# }
  __label_7: # endif
.annotate 'line', 4291
    __ARG_1.'emitconcat'(__ARG_2, $S4, $S5)
# }
    goto __label_6
  __label_5: # else
# {
.annotate 'line', 4294
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_14
    isne $I1, $S2, 'I'
    if $I1 goto __label_15
    isne $I1, $S3, 'I'
  __label_15:
  __label_14:
    unless $I1 goto __label_12
# {
.annotate 'line', 4295
# l: $S7
    null $S7
.annotate 'line', 4296
    ne $S2, 'I', __label_16
    set $S7, $S4
    goto __label_17
  __label_16: # else
# {
.annotate 'line', 4298
    $P3 = self.'tempreg'('I')
    set $S7, $P3
.annotate 'line', 4299
    __ARG_1.'emitset'($S7, $S4)
# }
  __label_17: # endif
.annotate 'line', 4301
# r: $S8
    null $S8
.annotate 'line', 4302
    ne $S3, 'I', __label_18
    set $S8, $S5
    goto __label_19
  __label_18: # else
# {
.annotate 'line', 4304
    $P3 = self.'tempreg'('I')
    set $S8, $P3
.annotate 'line', 4305
    __ARG_1.'emitset'($S8, $S5)
# }
  __label_19: # endif
.annotate 'line', 4307
    __ARG_1.'emitadd'(__ARG_2, $S7, $S8)
# }
    goto __label_13
  __label_12: # else
.annotate 'line', 4310
    __ARG_1.'emitadd'(__ARG_2, $S4, $S5)
  __label_13: # endif
# }
  __label_6: # endif
# }
.annotate 'line', 4312

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpAddExpr' ]
.annotate 'line', 4202
    get_class $P1, [ 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpSubExpr' ]

.sub 'OpSubExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4321
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4322

.end # OpSubExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4325
    self.'optimizearg'()
.annotate 'line', 4326
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4327
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4328
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_1
    $I3 = $P2.'isliteral'()
  __label_1:
    unless $I3 goto __label_0
# {
.annotate 'line', 4329
# ltype: $S1
    $P5 = $P1.'checkresult'()
    null $S1
    if_null $P5, __label_2
    set $S1, $P5
  __label_2:
.annotate 'line', 4330
# rtype: $S2
    $P5 = $P2.'checkresult'()
    null $S2
    if_null $P5, __label_3
    set $S2, $P5
  __label_3:
.annotate 'line', 4331
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_5
    iseq $I3, $S2, 'I'
  __label_5:
    unless $I3 goto __label_4
# {
.annotate 'line', 4332
# var lval: $P3
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4333
# ln: $I1
    set $P5, $P3
    set $I1, $P5
.annotate 'line', 4334
# var rval: $P4
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4335
# rn: $I2
    set $P5, $P4
    set $I2, $P5
.annotate 'line', 4336
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    sub $I3, $I1, $I2
    .tailcall 'integerValue'($P5, $P6, $I3)
# }
  __label_4: # endif
# }
  __label_0: # endif
.annotate 'line', 4339
    .return(self)
# }
.annotate 'line', 4340

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4343
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 4344
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
  __label_1:
.annotate 'line', 4345
    ne $S1, $S2, __label_2
.annotate 'line', 4346
    .return($S1)
  __label_2: # endif
.annotate 'line', 4347
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_4
    iseq $I1, $S2, 'N'
  __label_4:
    unless $I1 goto __label_3
.annotate 'line', 4348
    .return('N')
  __label_3: # endif
.annotate 'line', 4349
    iseq $I1, $S1, 'N'
    unless $I1 goto __label_6
    iseq $I1, $S2, 'I'
  __label_6:
    unless $I1 goto __label_5
.annotate 'line', 4350
    .return('N')
  __label_5: # endif
.annotate 'line', 4351
    .return('I')
# }
.annotate 'line', 4352

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4355
# lreg: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 4356
# rreg: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
  __label_1:
.annotate 'line', 4357
    __ARG_1.'emitsub'(__ARG_2, $S1, $S2)
# }
.annotate 'line', 4358

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpSubExpr' ]
.annotate 'line', 4317
    get_class $P1, [ 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpMulExpr' ]

.sub 'OpMulExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4367
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4368

.end # OpMulExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4371
    self.'optimizearg'()
.annotate 'line', 4372
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4373
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4374
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_1
    $I3 = $P2.'isliteral'()
  __label_1:
    unless $I3 goto __label_0
# {
.annotate 'line', 4375
# ltype: $S1
    $P7 = $P1.'checkresult'()
    null $S1
    if_null $P7, __label_2
    set $S1, $P7
  __label_2:
.annotate 'line', 4376
# rtype: $S2
    $P7 = $P2.'checkresult'()
    null $S2
    if_null $P7, __label_3
    set $S2, $P7
  __label_3:
.annotate 'line', 4377
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_5
    iseq $I3, $S2, 'I'
  __label_5:
    unless $I3 goto __label_4
# {
.annotate 'line', 4378
# var lval: $P3
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4379
# ln: $I1
    set $P7, $P3
    set $I1, $P7
.annotate 'line', 4380
# var rval: $P4
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4381
# rn: $I2
    set $P7, $P4
    set $I2, $P7
.annotate 'line', 4382
    getattribute $P7, self, 'owner'
    getattribute $P8, self, 'start'
    mul $I3, $I1, $I2
    .tailcall 'integerValue'($P7, $P8, $I3)
# }
  __label_4: # endif
# {
.annotate 'line', 4385
    $P7 = 'floatresult'($S1, $S2)
    if_null $P7, __label_6
    unless $P7 goto __label_6
# {
.annotate 'line', 4386
# var lvalf: $P5
    getattribute $P5, $P1, 'numval'
.annotate 'line', 4387
# lf: $N1
# predefined string
    set $S3, $P5
    set $N1, $S3
.annotate 'line', 4388
# var rvalf: $P6
    getattribute $P6, $P2, 'numval'
.annotate 'line', 4389
# rf: $N2
# predefined string
    set $S3, $P6
    set $N2, $S3
.annotate 'line', 4390
    getattribute $P7, self, 'owner'
    getattribute $P8, self, 'start'
    mul $N3, $N1, $N2
    .tailcall 'floatValue'($P7, $P8, $N3)
# }
  __label_6: # endif
# }
# }
  __label_0: # endif
.annotate 'line', 4394
    .return(self)
# }
.annotate 'line', 4395

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4398
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4399
# rl: $S1
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'checkresult'()
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
  __label_0:
.annotate 'line', 4400
# rr: $S2
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'checkresult'()
    null $S2
    if_null $P2, __label_1
    set $S2, $P2
  __label_1:
.annotate 'line', 4401
    ne $S1, $S2, __label_2
.annotate 'line', 4402
    .return($S1)
  __label_2: # endif
.annotate 'line', 4403
    ne $S1, 'S', __label_3
.annotate 'line', 4404
    .return('S')
    goto __label_4
  __label_3: # else
.annotate 'line', 4406
    .return('N')
  __label_4: # endif
# }
.annotate 'line', 4407

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4410
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4411
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4412
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
  __label_0:
.annotate 'line', 4413
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_1
    set $S2, $P3
  __label_1:
.annotate 'line', 4414
# lreg: $S3
    null $S3
# rreg: $S4
    null $S4
.annotate 'line', 4415
    ne $S1, 'S', __label_2
# {
.annotate 'line', 4416
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 4417
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 4418
# rval: $S5
    null $S5
# switch
.annotate 'line', 4419
    set $S7, $S2
    set $S8, 'I'
    if $S7 == $S8 goto __label_5
    goto __label_4
  __label_5: # case
.annotate 'line', 4421
    set $S5, $S4
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 4424
    $P3 = self.'tempreg'('I')
    set $S5, $P3
.annotate 'line', 4425
    __ARG_1.'emitset'($S5, $S4)
  __label_3: # switch end
.annotate 'line', 4427
    self.'annotate'(__ARG_1)
.annotate 'line', 4428
    __ARG_1.'emitrepeat'(__ARG_2, $S3, $S5)
.annotate 'line', 4429
    .return()
# }
  __label_2: # endif
.annotate 'line', 4431
    iseq $I3, $S1, $S2
    unless $I3 goto __label_7
    iseq $I3, $S1, 'I'
    if $I3 goto __label_9
    iseq $I3, $S1, 'N'
  __label_9:
    if $I3 goto __label_8
    iseq $I3, $S1, 'P'
  __label_8:
  __label_7:
    unless $I3 goto __label_6
# {
.annotate 'line', 4432
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 4433
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 4434
    __ARG_1.'emitmul'(__ARG_2, $S3, $S4)
.annotate 'line', 4435
    .return()
# }
  __label_6: # endif
.annotate 'line', 4440
    ne $S1, 'N', __label_10
# {
.annotate 'line', 4441
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 4442
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 4443
# rval: $S6
    null $S6
# switch
.annotate 'line', 4444
    set $S7, $S2
    set $S8, 'I'
    if $S7 == $S8 goto __label_13
    set $S8, 'N'
    if $S7 == $S8 goto __label_14
    goto __label_12
  __label_13: # case
.annotate 'line', 4446
    $P3 = self.'tempreg'('N')
    set $S6, $P3
.annotate 'line', 4447
    __ARG_1.'emitset'($S6, $S4)
.annotate 'line', 4448
    set $S6, $S4
    goto __label_11 # break
  __label_14: # case
.annotate 'line', 4451
    set $S6, $S4
    goto __label_11 # break
  __label_12: # default
.annotate 'line', 4454
    $P4 = self.'tempreg'('N')
    set $S6, $P4
.annotate 'line', 4455
    __ARG_1.'emitset'($S6, $S4)
  __label_11: # switch end
.annotate 'line', 4457
    set $S7, __ARG_2
    eq $S7, '', __label_15
# {
.annotate 'line', 4458
    self.'annotate'(__ARG_1)
.annotate 'line', 4459
    __ARG_1.'emitmul'(__ARG_2, $S3, $S6)
# }
  __label_15: # endif
.annotate 'line', 4461
    .return()
# }
  __label_10: # endif
.annotate 'line', 4464
# nleft: $I1
    null $I1
# nright: $I2
    null $I2
.annotate 'line', 4465
    $P3 = $P1.'issimple'()
    isfalse $I3, $P3
    if $I3 goto __label_18
    $I3 = $P1.'isidentifier'()
  __label_18:
    unless $I3 goto __label_16
# {
.annotate 'line', 4466
    $P5 = self.'checkresult'()
    $P4 = self.'tempreg'($P5)
    set $S3, $P4
.annotate 'line', 4467
    $P1.'emit'(__ARG_1, $S3)
# }
    goto __label_17
  __label_16: # else
# {
.annotate 'line', 4470
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4471
    set $S3, $I1
# }
  __label_17: # endif
.annotate 'line', 4473
    $P3 = $P2.'issimple'()
    isfalse $I3, $P3
    if $I3 goto __label_21
    $I3 = $P2.'isidentifier'()
  __label_21:
    unless $I3 goto __label_19
# {
.annotate 'line', 4474
    $P5 = self.'checkresult'()
    $P4 = self.'tempreg'($P5)
    set $S4, $P4
.annotate 'line', 4475
    $P2.'emit'(__ARG_1, $S4)
# }
    goto __label_20
  __label_19: # else
# {
# switch
.annotate 'line', 4478
    set $S7, $S2
    set $S8, 'S'
    if $S7 == $S8 goto __label_24
    set $S8, 'N'
    if $S7 == $S8 goto __label_25
    set $S8, 'I'
    if $S7 == $S8 goto __label_26
    goto __label_23
  __label_24: # case
.annotate 'line', 4480
    $P4 = self.'checkresult'()
    $P3 = self.'tempreg'($P4)
    set $S4, $P3
.annotate 'line', 4481
    $P2.'emit'(__ARG_1, $S4)
    goto __label_22 # break
  __label_25: # case
.annotate 'line', 4484
    $P5 = $P2.'emit_get'(__ARG_1)
    set $S4, $P5
    goto __label_22 # break
  __label_26: # case
  __label_23: # default
.annotate 'line', 4488
    $P6 = $P2.'getIntegerValue'()
    set $I2, $P6
.annotate 'line', 4489
    set $S4, $I2
    goto __label_22 # break
  __label_22: # switch end
.annotate 'line', 4490
# }
  __label_20: # endif
.annotate 'line', 4493
    self.'annotate'(__ARG_1)
.annotate 'line', 4494
    set $S7, __ARG_2
    ne $S7, '', __label_27
.annotate 'line', 4495
    $P3 = self.'checkresult'()
    __ARG_2 = self.'tempreg'($P3)
  __label_27: # endif
.annotate 'line', 4496
    __ARG_1.'emitmul'(__ARG_2, $S3, $S4)
# }
.annotate 'line', 4497

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpMulExpr' ]
.annotate 'line', 4363
    get_class $P1, [ 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpDivExpr' ]

.sub 'OpDivExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4506
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4507

.end # OpDivExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4510
    self.'optimizearg'()
.annotate 'line', 4511
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4512
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4513
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_1
    $I3 = $P2.'isliteral'()
  __label_1:
    unless $I3 goto __label_0
# {
.annotate 'line', 4514
# ltype: $S1
    $P5 = $P1.'checkresult'()
    null $S1
    if_null $P5, __label_2
    set $S1, $P5
  __label_2:
.annotate 'line', 4515
# rtype: $S2
    $P5 = $P2.'checkresult'()
    null $S2
    if_null $P5, __label_3
    set $S2, $P5
  __label_3:
.annotate 'line', 4516
# var lval: $P3
    null $P3
.annotate 'line', 4517
# var rval: $P4
    null $P4
.annotate 'line', 4518
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_5
    iseq $I3, $S2, 'I'
  __label_5:
    unless $I3 goto __label_4
# {
.annotate 'line', 4519
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4520
# ln: $I1
    set $P5, $P3
    set $I1, $P5
.annotate 'line', 4521
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4522
# rn: $I2
    set $P5, $P4
    set $I2, $P5
.annotate 'line', 4523
    eq $I2, 0, __label_6
.annotate 'line', 4524
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    set $N4, $I1
    set $N5, $I2
    div $N3, $N4, $N5
    .tailcall 'integerValue'($P5, $P6, $N3)
  __label_6: # endif
# }
  __label_4: # endif
# {
.annotate 'line', 4527
    $P5 = 'floatresult'($S1, $S2)
    if_null $P5, __label_7
    unless $P5 goto __label_7
# {
.annotate 'line', 4528
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4529
# lf: $N1
# predefined string
    set $S3, $P3
    set $N1, $S3
.annotate 'line', 4530
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4531
# rf: $N2
# predefined string
    set $S3, $P4
    set $N2, $S3
.annotate 'line', 4532
    set $N3, 0
    eq $N2, $N3, __label_8
.annotate 'line', 4533
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    div $N4, $N1, $N2
    .tailcall 'floatValue'($P5, $P6, $N4)
  __label_8: # endif
# }
  __label_7: # endif
# }
# }
  __label_0: # endif
.annotate 'line', 4537
    .return(self)
# }
.annotate 'line', 4538

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4541
    .return('N')
# }
.annotate 'line', 4542

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4545
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4546
# var aux: $P2
    null $P2
.annotate 'line', 4547
# var lreg: $P3
    $P3 = $P1.'emit_get'(__ARG_1)
.annotate 'line', 4548
    $P6 = $P1.'checkresult'()
    set $S1, $P6
    eq $S1, 'N', __label_0
# {
.annotate 'line', 4549
    $P2 = self.'tempreg'('N')
.annotate 'line', 4550
    __ARG_1.'emitset'($P2, $P3)
.annotate 'line', 4551
    set $P3, $P2
# }
  __label_0: # endif
.annotate 'line', 4553
# var rexpr: $P4
    getattribute $P4, self, 'rexpr'
.annotate 'line', 4554
# var rreg: $P5
    $P5 = $P4.'emit_get'(__ARG_1)
.annotate 'line', 4555
    $P6 = $P4.'checkresult'()
    set $S1, $P6
    eq $S1, 'N', __label_1
# {
.annotate 'line', 4556
    $P2 = self.'tempreg'('N')
.annotate 'line', 4557
    __ARG_1.'emitset'($P2, $P5)
.annotate 'line', 4558
    set $P5, $P2
# }
  __label_1: # endif
.annotate 'line', 4560
    self.'annotate'(__ARG_1)
.annotate 'line', 4561
    __ARG_1.'emitdiv'(__ARG_2, $P3, $P5)
# }
.annotate 'line', 4562

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpDivExpr' ]
.annotate 'line', 4502
    get_class $P1, [ 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpModExpr' ]

.sub 'OpModExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4571
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4572

.end # OpModExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4575
# lreg: $S1
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 4576
# rreg: $S2
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
  __label_1:
.annotate 'line', 4577
    self.'annotate'(__ARG_1)
.annotate 'line', 4578
    __ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
# }
.annotate 'line', 4579

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4582
    mod $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4583

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpModExpr' ]
.annotate 'line', 4567
    get_class $P1, [ 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpCModExpr' ]

.sub 'OpCModExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4592
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4593

.end # OpCModExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4596
    .return('I')
# }
.annotate 'line', 4597

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4600
# lreg: $S1
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 4601
# rreg: $S2
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
  __label_1:
.annotate 'line', 4602
    self.'annotate'(__ARG_1)
.annotate 'line', 4607
    __ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
# }
.annotate 'line', 4608

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpCModExpr' ]
.annotate 'line', 4588
    get_class $P1, [ 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpShiftleftExpr' ]

.sub 'OpShiftleftExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4617
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4618

.end # OpShiftleftExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4621
# res: $S1
    if_null __ARG_2, __label_1
    set $P1, __ARG_2
    goto __label_0
  __label_1:
    $P1 = self.'tempreg'('I')
  __label_0:
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 4622
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
  __label_3:
.annotate 'line', 4623
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_4
    set $S3, $P1
  __label_4:
.annotate 'line', 4624
    self.'annotate'(__ARG_1)
.annotate 'line', 4625
    __ARG_1.'emitbinop'('shl', $S1, $S2, $S3)
# }
.annotate 'line', 4626

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4629
    shl $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4630

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpShiftleftExpr' ]
.annotate 'line', 4613
    get_class $P1, [ 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpShiftrightExpr' ]

.sub 'OpShiftrightExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4639
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4640

.end # OpShiftrightExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4643
# res: $S1
    if_null __ARG_2, __label_1
    set $P1, __ARG_2
    goto __label_0
  __label_1:
    $P1 = self.'tempreg'('I')
  __label_0:
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 4644
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
  __label_3:
.annotate 'line', 4645
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_4
    set $S3, $P1
  __label_4:
.annotate 'line', 4646
    self.'annotate'(__ARG_1)
.annotate 'line', 4647
    __ARG_1.'emitbinop'('shr', $S1, $S2, $S3)
# }
.annotate 'line', 4648

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4651
    shr $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4652

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpShiftrightExpr' ]
.annotate 'line', 4635
    get_class $P1, [ 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'ArgumentModifierList' ]

.sub 'ArgumentModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4661
    self.'ModifierList'(__ARG_1, __ARG_2)
# }
.annotate 'line', 4662

.end # ArgumentModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4665
# isflat: $I1
    null $I1
# isnamed: $I2
    null $I2
.annotate 'line', 4666
# setname: $S1
    set $S1, ''
.annotate 'line', 4667
    $P3 = self.'getlist'()
    iter $P4, $P3
    set $P4, 0
  __label_0: # for iteration
    unless $P4 goto __label_1
    shift $P1, $P4
# {
.annotate 'line', 4668
# name: $S2
    $P5 = $P1.'getname'()
    null $S2
    if_null $P5, __label_2
    set $S2, $P5
  __label_2:
.annotate 'line', 4669
    ne $S2, 'flat', __label_3
.annotate 'line', 4670
    set $I1, 1
  __label_3: # endif
.annotate 'line', 4671
    ne $S2, 'named', __label_4
# {
.annotate 'line', 4672
    set $I2, 1
# switch
.annotate 'line', 4673
    $P3 = $P1.'numargs'()
    set $I3, $P3
    null $I4
    if $I3 == $I4 goto __label_7
    set $I4, 1
    if $I3 == $I4 goto __label_8
    goto __label_6
  __label_7: # case
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 4677
# var argmod: $P2
    $P2 = $P1.'getarg'(0)
.annotate 'line', 4678
    $P5 = $P2.'isstringliteral'()
    isfalse $I5, $P5
    unless $I5 goto __label_9
.annotate 'line', 4679
    getattribute $P6, self, 'start'
    'SyntaxError'('Invalid modifier', $P6)
  __label_9: # endif
.annotate 'line', 4680
    $P7 = $P2.'getPirString'()
    set $S1, $P7
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 4683
    getattribute $P8, self, 'start'
    'SyntaxError'('Invalid modifier', $P8)
  __label_5: # switch end
# }
  __label_4: # endif
# }
    goto __label_0
  __label_1: # endfor
.annotate 'line', 4687
    unless $I1 goto __label_10
# {
.annotate 'line', 4688
    unless $I2 goto __label_12
.annotate 'line', 4689
    __ARG_1.'print'(' :flat :named')
    goto __label_13
  __label_12: # else
.annotate 'line', 4691
    __ARG_1.'print'(' :flat')
  __label_13: # endif
# }
    goto __label_11
  __label_10: # else
.annotate 'line', 4693
    unless $I2 goto __label_14
# {
.annotate 'line', 4694
    __ARG_1.'print'(' :named')
.annotate 'line', 4695
    eq $S1, '', __label_15
.annotate 'line', 4696
    __ARG_1.'print'("(", $S1, ")")
  __label_15: # endif
# }
  __label_14: # endif
  __label_11: # endif
# }
.annotate 'line', 4698

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ArgumentModifierList' ]
.annotate 'line', 4657
    get_class $P1, [ 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'Argument' ]

.sub 'Argument' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4707
    setattribute self, 'arg', __ARG_1
.annotate 'line', 4708
    setattribute self, 'modifiers', __ARG_2
# }
.annotate 'line', 4709

.end # Argument


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4712
    getattribute $P3, self, 'arg'
    $P2 = $P3.'optimize'()
    setattribute self, 'arg', $P2
.annotate 'line', 4713
    .return(self)
# }
.annotate 'line', 4714

.end # optimize


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 4717
    getattribute $P1, self, 'arg'
    .tailcall $P1.'hascompilevalue'()
# }
.annotate 'line', 4718

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Argument' ]
.annotate 'line', 4703
    addattribute $P0, 'arg'
.annotate 'line', 4704
    addattribute $P0, 'modifiers'
.end
.namespace [ 'ArgumentList' ]

.sub 'ArgumentList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4730
    setattribute self, 'owner', __ARG_1
.annotate 'line', 4731
    setattribute self, 'start', __ARG_2
.annotate 'line', 4732
# var args: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 4733
# var t: $P2
    $P2 = __ARG_3.'get'()
.annotate 'line', 4734
    $P5 = $P2.'isop'(__ARG_4)
    isfalse $I1, $P5
    unless $I1 goto __label_0
# {
.annotate 'line', 4735
    __ARG_3.'unget'($P2)
  __label_1: # do
.annotate 'line', 4736
# {
.annotate 'line', 4737
# var modifier: $P3
    null $P3
.annotate 'line', 4738
# var expr: $P4
    $P4 = 'parseExpr'(__ARG_3, __ARG_1)
.annotate 'line', 4739
    $P2 = __ARG_3.'get'()
.annotate 'line', 4740
    $P5 = $P2.'isop'(':')
    if_null $P5, __label_4
    unless $P5 goto __label_4
# {
.annotate 'line', 4741
    $P2 = __ARG_3.'get'()
.annotate 'line', 4742
    $P5 = $P2.'isop'('[')
    if_null $P5, __label_5
    unless $P5 goto __label_5
# {
.annotate 'line', 4743
    new $P6, [ 'ArgumentModifierList' ]
    $P6.'ArgumentModifierList'(__ARG_3, __ARG_1)
    set $P3, $P6
.annotate 'line', 4744
    $P2 = __ARG_3.'get'()
# }
    goto __label_6
  __label_5: # else
.annotate 'line', 4747
    'Expected'('modifier list', $P2)
  __label_6: # endif
# }
  __label_4: # endif
.annotate 'line', 4749
    new $P6, [ 'Argument' ]
    $P6.'Argument'($P4, $P3)
    set $P5, $P6
# predefined push
    push $P1, $P5
# }
  __label_3: # continue
.annotate 'line', 4750
    $P5 = $P2.'isop'(',')
    if_null $P5, __label_2
    if $P5 goto __label_1
  __label_2: # enddo
.annotate 'line', 4751
    $P5 = $P2.'isop'(__ARG_4)
    isfalse $I1, $P5
    unless $I1 goto __label_7
.annotate 'line', 4752
    'SyntaxError'("Unfinished argument list", $P2)
  __label_7: # endif
.annotate 'line', 4753
# predefined elements
    elements $I1, $P1
    le $I1, 0, __label_8
.annotate 'line', 4754
    setattribute self, 'args', $P1
  __label_8: # endif
# }
  __label_0: # endif
# }
.annotate 'line', 4756

.end # ArgumentList


.sub 'numargs' :method
# Body
# {
.annotate 'line', 4759
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4760
    unless_null $P1, __label_1
    null $I1
    goto __label_0
  __label_1:
# predefined elements
    elements $I1, $P1
  __label_0:
    .return($I1)
# }
.annotate 'line', 4761

.end # numargs


.sub 'getrawargs' :method
# Body
# {
.annotate 'line', 4764
    getattribute $P1, self, 'args'
    .return($P1)
# }
.annotate 'line', 4765

.end # getrawargs


.sub 'getarg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 4768
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4769
    $P2 = $P1[__ARG_1]
    .return($P2)
# }
.annotate 'line', 4770

.end # getarg


.sub 'getfreearg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 4773
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4774
    $P2 = $P1[__ARG_1]
    getattribute $P3, $P2, 'arg'
    .return($P3)
# }
.annotate 'line', 4775

.end # getfreearg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4778
    getattribute $P1, self, 'args'
    'optimize_array'($P1)
.annotate 'line', 4779
    .return(self)
# }
.annotate 'line', 4780

.end # optimize


.sub 'getargvalues' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4783
# var argregs: $P1
    getattribute $P1, self, 'argregs'
.annotate 'line', 4784
    unless_null $P1, __label_0
# {
.annotate 'line', 4785
    new $P2, ['ResizableStringArray']
.annotate 'line', 4786
# pnull: $S1
    set $S1, ''
.annotate 'line', 4787
# var args: $P3
    getattribute $P3, self, 'args'
.annotate 'line', 4788
    if_null $P3, __label_1
# {
.annotate 'line', 4789
# nargs: $I1
# predefined elements
    elements $I1, $P3
# for loop
.annotate 'line', 4790
# i: $I2
    null $I2
  __label_4: # for condition
    ge $I2, $I1, __label_3
# {
.annotate 'line', 4791
# var a: $P4
    $P5 = $P3[$I2]
    getattribute $P4, $P5, 'arg'
.annotate 'line', 4792
# reg: $S2
    null $S2
.annotate 'line', 4793
    $P5 = $P4.'isnull'()
    if_null $P5, __label_5
    unless $P5 goto __label_5
# {
.annotate 'line', 4794
    ne $S1, '', __label_7
# {
.annotate 'line', 4795
    getattribute $P7, self, 'owner'
    $P6 = $P7.'tempreg'('P')
    set $S1, $P6
.annotate 'line', 4796
    __ARG_1.'emitnull'($S1)
# }
  __label_7: # endif
.annotate 'line', 4798
    set $S2, $S1
# }
    goto __label_6
  __label_5: # else
.annotate 'line', 4801
    $P5 = $P4.'emit_get'(__ARG_1)
    set $S2, $P5
  __label_6: # endif
.annotate 'line', 4802
# predefined push
    push $P2, $S2
# }
  __label_2: # for iteration
.annotate 'line', 4790
    inc $I2
    goto __label_4
  __label_3: # for end
# }
  __label_1: # endif
.annotate 'line', 4805
    setattribute self, 'argregs', $P2
# }
  __label_0: # endif
.annotate 'line', 4807
    .return($P1)
# }
.annotate 'line', 4808

.end # getargvalues


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4811
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4812
# var argreg: $P2
    $P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 4814
# sep: $S1
    set $S1, ''
.annotate 'line', 4815
# n: $I1
    $P4 = self.'numargs'()
    set $I1, $P4
# for loop
.annotate 'line', 4816
# i: $I2
    null $I2
  __label_2: # for condition
    ge $I2, $I1, __label_1
# {
.annotate 'line', 4817
# a: $S2
    $S2 = $P2[$I2]
.annotate 'line', 4818
    __ARG_1.'print'($S1, $S2)
.annotate 'line', 4819
# var modifiers: $P3
    $P4 = $P1[$I2]
    getattribute $P3, $P4, 'modifiers'
.annotate 'line', 4820
    if_null $P3, __label_3
.annotate 'line', 4821
    $P3.'emitmodifiers'(__ARG_1)
  __label_3: # endif
.annotate 'line', 4822
    set $S1, ', '
# }
  __label_0: # for iteration
.annotate 'line', 4816
    inc $I2
    goto __label_2
  __label_1: # for end
# }
.annotate 'line', 4824

.end # emitargs

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ArgumentList' ]
.annotate 'line', 4723
    addattribute $P0, 'owner'
.annotate 'line', 4724
    addattribute $P0, 'start'
.annotate 'line', 4725
    addattribute $P0, 'args'
.annotate 'line', 4726
    addattribute $P0, 'argregs'
.end
.namespace [ ]

.sub 'arglist_hascompilevalue'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4829
    iter $P2, __ARG_1
    set $P2, 0
  __label_0: # for iteration
    unless $P2 goto __label_1
    shift $P1, $P2
.annotate 'line', 4830
    $P3 = $P1.'hascompilevalue'()
    isfalse $I1, $P3
    unless $I1 goto __label_2
.annotate 'line', 4831
    .return(0)
  __label_2: # endif
    goto __label_0
  __label_1: # endfor
.annotate 'line', 4832
    .return(1)
# }
.annotate 'line', 4833

.end # arglist_hascompilevalue

.namespace [ 'CallPredefExpr' ]

.sub 'CallPredefExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4844
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 4845
    setattribute self, 'predef', __ARG_3
.annotate 'line', 4846
    setattribute self, 'args', __ARG_4
# }
.annotate 'line', 4847

.end # CallPredefExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4850
    getattribute $P1, self, 'predef'
    .tailcall $P1.'result'()
# }
.annotate 'line', 4851

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4854
# var predef: $P1
    getattribute $P1, self, 'predef'
.annotate 'line', 4855
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 4856
    new $P3, ['ResizableStringArray']
.annotate 'line', 4857
# var arg: $P4
    null $P4
.annotate 'line', 4858
# np: $I1
    $P6 = $P1.'params'()
    set $I1, $P6
.annotate 'line', 4859
# pnull: $S1
    set $S1, ''
# switch
.annotate 'line', 4860
    set $I4, $I1
    set $I5, -1
    if $I4 == $I5 goto __label_2
    set $I5, -2
    if $I4 == $I5 goto __label_3
    goto __label_1
  __label_2: # case
.annotate 'line', 4862
    iter $P7, $P2
    set $P7, 0
  __label_4: # for iteration
    unless $P7 goto __label_5
    shift $P4, $P7
# {
.annotate 'line', 4863
# reg: $S2
    getattribute $P8, $P4, 'arg'
    $P6 = $P8.'emit_get'(__ARG_1)
    null $S2
    if_null $P6, __label_6
    set $S2, $P6
  __label_6:
.annotate 'line', 4865
    ne $S2, 'null', __label_7
# {
.annotate 'line', 4866
    ne $S1, '', __label_8
# {
.annotate 'line', 4867
    $P6 = self.'tempreg'('P')
    set $S1, $P6
.annotate 'line', 4868
    __ARG_1.'emitnull'($S1)
# }
  __label_8: # endif
.annotate 'line', 4870
    set $S2, $S1
# }
  __label_7: # endif
.annotate 'line', 4872
# predefined push
    push $P3, $S2
# }
    goto __label_4
  __label_5: # endfor
    goto __label_0 # break
  __label_3: # case
.annotate 'line', 4876
# var rawargs: $P5
    root_new $P5, ['parrot';'ResizablePMCArray']
.annotate 'line', 4877
    iter $P9, $P2
    set $P9, 0
  __label_9: # for iteration
    unless $P9 goto __label_10
    shift $P4, $P9
.annotate 'line', 4878
    getattribute $P8, $P4, 'arg'
# predefined push
    push $P5, $P8
    goto __label_9
  __label_10: # endfor
.annotate 'line', 4879
    getattribute $P10, self, 'predef'
    getattribute $P11, self, 'start'
    $P10.'expand'(__ARG_1, self, $P11, __ARG_2, $P5)
.annotate 'line', 4880
    .return()
  __label_1: # default
.annotate 'line', 4882
# n: $I2
    getattribute $P12, self, 'args'
    set $I2, $P12
# for loop
.annotate 'line', 4883
# i: $I3
    null $I3
  __label_13: # for condition
    ge $I3, $I2, __label_12
# {
.annotate 'line', 4884
    $P13 = $P2[$I3]
    getattribute $P4, $P13, 'arg'
.annotate 'line', 4885
# argtype: $S3
    $P6 = $P4.'checkresult'()
    null $S3
    if_null $P6, __label_14
    set $S3, $P6
  __label_14:
.annotate 'line', 4886
# paramtype: $S4
    $P6 = $P1.'paramtype'($I3)
    null $S4
    if_null $P6, __label_15
    set $S4, $P6
  __label_15:
.annotate 'line', 4887
# argr: $S5
    null $S5
.annotate 'line', 4888
    $P6 = $P4.'isnull'()
    if_null $P6, __label_16
    unless $P6 goto __label_16
# {
# switch
.annotate 'line', 4889
    set $S7, $S4
    set $S8, 'I'
    if $S7 == $S8 goto __label_20
    set $S8, 'N'
    if $S7 == $S8 goto __label_21
    set $S8, 'S'
    if $S7 == $S8 goto __label_22
    goto __label_19
  __label_20: # case
  __label_21: # case
  __label_22: # case
.annotate 'line', 4893
    $P8 = self.'tempreg'($S4)
    set $S5, $P8
.annotate 'line', 4894
    __ARG_1.'emitnull'($S5)
    goto __label_18 # break
  __label_19: # default
.annotate 'line', 4897
    ne $S1, '', __label_23
# {
.annotate 'line', 4898
    $P10 = self.'tempreg'('P')
    set $S1, $P10
.annotate 'line', 4899
    __ARG_1.'emitnull'($S1)
# }
  __label_23: # endif
.annotate 'line', 4901
    set $S5, $S1
  __label_18: # switch end
# }
    goto __label_17
  __label_16: # else
# {
.annotate 'line', 4905
    iseq $I4, $S3, $S4
    if $I4 goto __label_26
    iseq $I4, $S4, '?'
  __label_26:
    unless $I4 goto __label_24
.annotate 'line', 4906
    $P6 = $P4.'emit_get'(__ARG_1)
    set $S5, $P6
    goto __label_25
  __label_24: # else
# {
.annotate 'line', 4908
# aux: $S6
    null $S6
.annotate 'line', 4909
    $P6 = self.'tempreg'($S4)
    set $S5, $P6
# switch
.annotate 'line', 4910
    set $S7, $S4
    set $S8, 'P'
    if $S7 == $S8 goto __label_29
    set $S8, 'I'
    if $S7 == $S8 goto __label_30
    set $S8, 'N'
    if $S7 == $S8 goto __label_31
    set $S8, 'S'
    if $S7 == $S8 goto __label_32
    goto __label_28
  __label_29: # case
# switch
.annotate 'line', 4912
    set $S9, $S3
    set $S10, 'I'
    if $S9 == $S10 goto __label_35
    set $S10, 'N'
    if $S9 == $S10 goto __label_36
    set $S10, 'S'
    if $S9 == $S10 goto __label_37
    goto __label_34
  __label_35: # case
  __label_36: # case
  __label_37: # case
.annotate 'line', 4916
    $P6 = $P4.'emit_get'(__ARG_1)
    set $S6, $P6
.annotate 'line', 4917
    __ARG_1.'emitbox'($S5, $S6)
    goto __label_33 # break
  __label_34: # default
.annotate 'line', 4920
    $P4.'emit'(__ARG_1, $S5)
  __label_33: # switch end
    goto __label_27 # break
  __label_30: # case
  __label_31: # case
  __label_32: # case
.annotate 'line', 4926
    $P8 = $P4.'emit_get'(__ARG_1)
    set $S6, $P8
.annotate 'line', 4927
    __ARG_1.'emitset'($S5, $S6)
    goto __label_27 # break
  __label_28: # default
.annotate 'line', 4930
    $P4.'emit'(__ARG_1, $S5)
  __label_27: # switch end
# }
  __label_25: # endif
# }
  __label_17: # endif
.annotate 'line', 4934
# predefined push
    push $P3, $S5
# }
  __label_11: # for iteration
.annotate 'line', 4883
    inc $I3
    goto __label_13
  __label_12: # for end
  __label_0: # switch end
.annotate 'line', 4937
    getattribute $P6, self, 'predef'
    getattribute $P8, self, 'start'
    $P6.'expand'(__ARG_1, self, $P8, __ARG_2, $P3)
# }
.annotate 'line', 4938

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CallPredefExpr' ]
.annotate 'line', 4837
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 4839
    addattribute $P0, 'predef'
.annotate 'line', 4840
    addattribute $P0, 'args'
.end
.namespace [ 'CallExpr' ]

.sub 'CallExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4950
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 4951
    setattribute self, 'funref', __ARG_4
.annotate 'line', 4952
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 4953
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_0
# {
.annotate 'line', 4954
    __ARG_1.'unget'($P1)
.annotate 'line', 4955
    new $P4, [ 'ArgumentList' ]
    $P4.'ArgumentList'(__ARG_2, __ARG_3, __ARG_1, ')')
    set $P3, $P4
    setattribute self, 'args', $P3
# }
  __label_0: # endif
# }
.annotate 'line', 4957

.end # CallExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4958
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4961
# var funref: $P1
    getattribute $P6, self, 'funref'
    $P1 = $P6.'optimize'()
.annotate 'line', 4962
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 4963
# nargs: $I1
    null $I1
.annotate 'line', 4964
    if_null $P2, __label_0
# {
.annotate 'line', 4965
    $P2 = $P2.'optimize'()
.annotate 'line', 4966
    $P6 = $P2.'numargs'()
    set $I1, $P6
# }
  __label_0: # endif
.annotate 'line', 4969
    isa $I2, $P1, [ 'MemberExpr' ]
    unless $I2 goto __label_1
.annotate 'line', 4970
    new $P7, [ 'CallMemberExpr' ]
    $P7.'CallMemberExpr'(self, $P1, $P2)
    set $P6, $P7
    .return($P6)
  __label_1: # endif
.annotate 'line', 4971
    isa $I2, $P1, [ 'MemberRefExpr' ]
    unless $I2 goto __label_2
.annotate 'line', 4972
    new $P7, [ 'CallMemberRefExpr' ]
    $P7.'CallMemberRefExpr'(self, $P1, $P2)
    set $P6, $P7
    .return($P6)
  __label_2: # endif
.annotate 'line', 4975
    $P6 = $P1.'isidentifier'()
    if_null $P6, __label_3
    unless $P6 goto __label_3
# {
.annotate 'line', 4976
# call: $S1
    $P7 = $P1.'getName'()
    null $S1
    if_null $P7, __label_4
    set $S1, $P7
  __label_4:
.annotate 'line', 4977
# var predef: $P3
    $P3 = 'findpredef'($S1, $I1)
.annotate 'line', 4978
    if_null $P3, __label_5
# {
.annotate 'line', 4979
    self.'use_predef'($S1)
.annotate 'line', 4980
# var rawargs: $P4
    ne $I1, 0, __label_7
    root_new $P6, ['parrot';'ResizablePMCArray']
    set $P4, $P6
    goto __label_6
  __label_7:
    $P4 = $P2.'getrawargs'()
  __label_6:
.annotate 'line', 4983
    isa $I2, $P3, [ 'PredefFunctionEval' ]
    unless $I2 goto __label_8
# {
.annotate 'line', 4984
    $P6 = 'arglist_hascompilevalue'($P4)
    if_null $P6, __label_9
    unless $P6 goto __label_9
# {
.annotate 'line', 4985
# var evalfun: $P5
    getattribute $P5, $P3, 'evalfun'
.annotate 'line', 4986
    getattribute $P6, self, 'owner'
    getattribute $P7, self, 'start'
    .tailcall $P5($P6, $P7, $P4)
# }
  __label_9: # endif
# }
  __label_8: # endif
.annotate 'line', 4990
    new $P7, [ 'CallPredefExpr' ]
    getattribute $P8, self, 'owner'
    getattribute $P9, self, 'start'
    $P7.'CallPredefExpr'($P8, $P9, $P3, $P4)
    set $P6, $P7
    .return($P6)
# }
  __label_5: # endif
# }
  __label_3: # endif
.annotate 'line', 4994
    setattribute self, 'funref', $P1
.annotate 'line', 4995
    setattribute self, 'args', $P2
.annotate 'line', 4996
    .return(self)
# }
.annotate 'line', 4997

.end # optimize


.sub 'cantailcall' :method
# Body
# {
.annotate 'line', 5000
    .return(1)
# }
.annotate 'line', 5001

.end # cantailcall


.sub 'emitcall' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5004
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 5005
# call: $S1
    null $S1
.annotate 'line', 5006
    $P2 = $P1.'isidentifier'()
    if_null $P2, __label_0
    unless $P2 goto __label_0
# {
.annotate 'line', 5007
    $P3 = $P1.'checkIdentifier'()
    set $S1, $P3
.annotate 'line', 5008
    ne $S1, '', __label_2
.annotate 'line', 5009
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "'"
    push $P2, $P3
    $P4 = $P1.'getName'()
    push $P2, $P4
    box $P3, "'"
    push $P2, $P3
# predefined join
    join $S1, "", $P2
  __label_2: # endif
# }
    goto __label_1
  __label_0: # else
.annotate 'line', 5012
    $P2 = $P1.'emit_get'(__ARG_1)
    set $S1, $P2
  __label_1: # endif
.annotate 'line', 5013
    .return($S1)
# }
.annotate 'line', 5014

.end # emitcall


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5017
    __ARG_1.'print'('(')
.annotate 'line', 5018
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5019
    if_null $P1, __label_0
.annotate 'line', 5020
    $P1.'emitargs'(__ARG_1)
  __label_0: # endif
.annotate 'line', 5021
    __ARG_1.'say'(')')
# }
.annotate 'line', 5022

.end # emitargs


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5025
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 5026
# call: $S1
    $P3 = self.'emitcall'(__ARG_1)
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
  __label_0:
.annotate 'line', 5027
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 5028
    if_null $P2, __label_1
.annotate 'line', 5029
    $P2.'getargvalues'(__ARG_1)
  __label_1: # endif
.annotate 'line', 5031
    self.'annotate'(__ARG_1)
.annotate 'line', 5033
    __ARG_1.'print'('    ')
.annotate 'line', 5034
    isnull $I1, __ARG_2
    not $I1
    unless $I1 goto __label_3
    set $S2, __ARG_2
    isne $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
# {
.annotate 'line', 5035
    set $S3, __ARG_2
    ne $S3, '.tailcall', __label_4
.annotate 'line', 5036
    __ARG_1.'print'('.tailcall ')
    goto __label_5
  __label_4: # else
.annotate 'line', 5038
    __ARG_1.'print'(__ARG_2, ' = ')
  __label_5: # endif
# }
  __label_2: # endif
.annotate 'line', 5041
    __ARG_1.'print'($S1)
.annotate 'line', 5042
    self.'emitargs'(__ARG_1)
# }
.annotate 'line', 5043

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CallExpr' ]
.annotate 'line', 4943
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 4945
    addattribute $P0, 'funref'
.annotate 'line', 4946
    addattribute $P0, 'args'
.end
.namespace [ 'CallMemberExpr' ]

.sub 'CallMemberExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5055
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 5056
    setattribute self, 'funref', __ARG_2
.annotate 'line', 5057
    setattribute self, 'args', __ARG_3
# }
.annotate 'line', 5058

.end # CallMemberExpr


.sub 'emitcall' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5061
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 5062
    root_new $P2, ['parrot';'ResizablePMCArray']
    $P4 = $P1.'emit_left_get'(__ARG_1)
    push $P2, $P4
    box $P3, ".'"
    push $P2, $P3
.annotate 'line', 5063
    $P5 = $P1.'get_member'()
.annotate 'line', 5062
    push $P2, $P5
    box $P3, "'"
    push $P2, $P3
# predefined join
    join $S1, "", $P2
    .return($S1)
# }
.annotate 'line', 5064

.end # emitcall

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CallMemberExpr' ]
.annotate 'line', 5051
    get_class $P1, [ 'CallExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'CallMemberRefExpr' ]

.sub 'CallMemberRefExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5074
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 5075
    setattribute self, 'funref', __ARG_2
.annotate 'line', 5076
    setattribute self, 'args', __ARG_3
# }
.annotate 'line', 5077

.end # CallMemberRefExpr


.sub 'emitcall' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5080
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 5081
# var right: $P2
    getattribute $P2, $P1, 'right'
.annotate 'line', 5082
# var type: $P3
    $P3 = $P2.'checkresult'()
.annotate 'line', 5083
    set $S3, $P3
    isne $I1, $S3, 'P'
    unless $I1 goto __label_1
    set $S4, $P3
    isne $I1, $S4, 'S'
  __label_1:
    unless $I1 goto __label_0
.annotate 'line', 5084
    getattribute $P4, $P1, 'start'
    'SyntaxError'("Invalid expression type in '.*'", $P4)
  __label_0: # endif
.annotate 'line', 5087
# lreg: $S1
    $P4 = $P1.'emit_left_get'(__ARG_1)
    null $S1
    if_null $P4, __label_2
    set $S1, $P4
  __label_2:
.annotate 'line', 5088
# rreg: $S2
    $P4 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_3
    set $S2, $P4
  __label_3:
.annotate 'line', 5089
    concat $S3, $S1, '.'
    concat $S3, $S3, $S2
    .return($S3)
# }
.annotate 'line', 5090

.end # emitcall

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CallMemberRefExpr' ]
.annotate 'line', 5070
    get_class $P1, [ 'CallExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'MemberExprBase' ]

.sub 'MemberExprBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5100
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5101
    setattribute self, 'left', __ARG_3
# }
.annotate 'line', 5102

.end # MemberExprBase


.sub 'emit_left_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5105
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5106
# type: $S1
    $P2 = $P1.'checkresult'()
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
  __label_0:
.annotate 'line', 5107
# reg: $S2
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S2
    if_null $P2, __label_1
    set $S2, $P2
  __label_1:
.annotate 'line', 5108
    eq $S1, 'P', __label_2
# {
.annotate 'line', 5109
# auxreg: $S3
    set $S3, $S2
.annotate 'line', 5110
    $P2 = self.'tempreg'('P')
    set $S2, $P2
.annotate 'line', 5111
    __ARG_1.'emitbox'($S2, $S3)
# }
  __label_2: # endif
.annotate 'line', 5113
    .return($S2)
# }
.annotate 'line', 5114

.end # emit_left_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MemberExprBase' ]
.annotate 'line', 5095
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5097
    addattribute $P0, 'left'
.end
.namespace [ 'MemberExpr' ]

.sub 'MemberExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 5123
    self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5124
    setattribute self, 'right', __ARG_4
# }
.annotate 'line', 5125

.end # MemberExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5126
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5129
    getattribute $P3, self, 'left'
    $P2 = $P3.'optimize'()
    setattribute self, 'left', $P2
.annotate 'line', 5130
    .return(self)
# }
.annotate 'line', 5131

.end # optimize


.sub 'get_member' :method
# Body
# {
.annotate 'line', 5134
    getattribute $P1, self, 'right'
    .return($P1)
# }
.annotate 'line', 5135

.end # get_member


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5138
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 5139
# ident: $S2
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
  __label_1:
.annotate 'line', 5140
# result: $S3
    $P1 = self.'tempreg'('P')
    null $S3
    if_null $P1, __label_2
    set $S3, $P1
  __label_2:
.annotate 'line', 5141
    self.'annotate'(__ARG_1)
.annotate 'line', 5142
    __ARG_1.'say'('    ', 'getattribute ', $S3, ', ', $S1, ", '", $S2, "'")
.annotate 'line', 5143
    .return($S3)
# }
.annotate 'line', 5144

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5147
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 5148
# ident: $S2
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
  __label_1:
.annotate 'line', 5149
    self.'annotate'(__ARG_1)
.annotate 'line', 5150
    __ARG_1.'say'('    ', 'getattribute ', __ARG_2, ', ', $S1, ", '", $S2, "'")
# }
.annotate 'line', 5151

.end # emit


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5154
    self.'emit'(__ARG_1, __ARG_2)
# }
.annotate 'line', 5155

.end # emit_init


.sub 'emit_assign' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5158
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 5159
# ident: $S2
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
  __label_1:
.annotate 'line', 5160
# value: $S3
    null $S3
.annotate 'line', 5161
    ne __ARG_2, 'P', __label_2
# {
.annotate 'line', 5163
    ne __ARG_3, 'null', __label_4
# {
.annotate 'line', 5164
    $P1 = self.'tempreg'('P')
    set __ARG_3, $P1
.annotate 'line', 5165
    __ARG_1.'emitnull'(__ARG_3)
# }
  __label_4: # endif
.annotate 'line', 5167
    set $S3, __ARG_3
# }
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 5170
    $P1 = self.'tempreg'('P')
    set $S3, $P1
.annotate 'line', 5171
    __ARG_1.'emitbox'($S3, __ARG_3)
# }
  __label_3: # endif
.annotate 'line', 5173
    __ARG_1.'say'('    ', "setattribute ", $S1, ", '", $S2, "', ", $S3)
# }
.annotate 'line', 5174

.end # emit_assign


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5177
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 5178
# ident: $S2
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
  __label_1:
.annotate 'line', 5179
# value: $S3
    $P1 = self.'tempreg'('P')
    null $S3
    if_null $P1, __label_2
    set $S3, $P1
  __label_2:
.annotate 'line', 5180
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_3
    unless $P1 goto __label_3
.annotate 'line', 5181
    __ARG_1.'emitnull'($S3)
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 5183
# rreg: $S4
    $P2 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P2, __label_5
    set $S4, $P2
  __label_5:
.annotate 'line', 5184
    $P1 = __ARG_2.'checkresult'()
    set $S5, $P1
    eq $S5, 'P', __label_6
.annotate 'line', 5185
    __ARG_1.'emitbox'($S3, $S4)
    goto __label_7
  __label_6: # else
.annotate 'line', 5187
    set $S3, $S4
  __label_7: # endif
# }
  __label_4: # endif
.annotate 'line', 5189
    __ARG_1.'say'('    ', "setattribute ", $S1, ", '", $S2, "', ", $S3)
.annotate 'line', 5190
    .return($S3)
# }
.annotate 'line', 5191

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MemberExpr' ]
.annotate 'line', 5117
    get_class $P1, [ 'MemberExprBase' ]
    addparent $P0, $P1
.annotate 'line', 5119
    addattribute $P0, 'right'
.end
.namespace [ 'MemberRefExpr' ]

.sub 'MemberRefExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 5201
    self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5202
    setattribute self, 'right', __ARG_4
# }
.annotate 'line', 5203

.end # MemberRefExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5204
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5207
    getattribute $P3, self, 'left'
    $P2 = $P3.'optimize'()
    setattribute self, 'left', $P2
.annotate 'line', 5208
    getattribute $P3, self, 'right'
    $P2 = $P3.'optimize'()
    setattribute self, 'right', $P2
.annotate 'line', 5209
    .return(self)
# }
.annotate 'line', 5210

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5214
    getattribute $P1, self, 'start'
.annotate 'line', 5213
    'SyntaxError'('Member reference can be used only for method calls', $P1)
# }
.annotate 'line', 5215

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MemberRefExpr' ]
.annotate 'line', 5196
    get_class $P1, [ 'MemberExprBase' ]
    addparent $P0, $P1
.annotate 'line', 5198
    addattribute $P0, 'right'
.end
.namespace [ 'IndexExpr' ]

.sub 'IndexExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 5228
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5229
    setattribute self, 'left', __ARG_4
.annotate 'line', 5230
    self.'parseargs'(__ARG_1, __ARG_2, ']')
# }
.annotate 'line', 5231

.end # IndexExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5234
    getattribute $P2, self, 'left'
    $P1 = $P2.'checkresult'()
    set $S1, $P1
    ne $S1, 'S', __label_0
.annotate 'line', 5235
    .return('S')
    goto __label_1
  __label_0: # else
.annotate 'line', 5237
    .return('P')
  __label_1: # endif
# }
.annotate 'line', 5238

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5241
# var left: $P1
    getattribute $P4, self, 'left'
    $P1 = $P4.'optimize'()
.annotate 'line', 5242
    setattribute self, 'left', $P1
.annotate 'line', 5243
    self.'optimizeargs'()
.annotate 'line', 5247
    $I2 = $P1.'isstringliteral'()
    unless $I2 goto __label_1
    $P4 = self.'numargs'()
    set $I3, $P4
    iseq $I2, $I3, 1
  __label_1:
    unless $I2 goto __label_0
# {
.annotate 'line', 5248
# var arg: $P2
    $P2 = self.'getarg'(0)
.annotate 'line', 5249
    $P4 = $P2.'isintegerliteral'()
    if_null $P4, __label_2
    unless $P4 goto __label_2
# {
.annotate 'line', 5250
# ival: $I1
    $P5 = $P2.'getIntegerValue'()
    set $I1, $P5
.annotate 'line', 5251
# sval: $S1
    $P4 = $P1.'get_value'()
    null $S1
    if_null $P4, __label_3
    set $S1, $P4
  __label_3:
.annotate 'line', 5252
# var t: $P3
    new $P3, [ 'TokenQuoted' ]
    getattribute $P4, self, 'start'
    getattribute $P5, $P4, 'file'
    getattribute $P6, self, 'start'
    getattribute $P7, $P6, 'line'
.annotate 'line', 5253
# predefined substr
    substr $S2, $S1, $I1, 1
    $P3.'TokenQuoted'($P5, $P7, $S2)
.annotate 'line', 5254
    new $P5, [ 'StringLiteral' ]
    getattribute $P6, self, 'owner'
    $P5.'StringLiteral'($P6, $P3)
    set $P4, $P5
    .return($P4)
# }
  __label_2: # endif
# }
  __label_0: # endif
.annotate 'line', 5257
    .return(self)
# }
.annotate 'line', 5258

.end # optimize


.sub 'emit_prep' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5261
# var regleft: $P1
    getattribute $P1, self, 'regleft'
.annotate 'line', 5262
# var argregs: $P2
    getattribute $P2, self, 'argregs'
.annotate 'line', 5263
    isnull $I1, $P1
    not $I1
    if $I1 goto __label_1
    isnull $I1, $P2
    not $I1
  __label_1:
    unless $I1 goto __label_0
.annotate 'line', 5264
    getattribute $P3, self, 'start'
    'InternalError'('wrong call to IndexExpr.emit_args', $P3)
  __label_0: # endif
.annotate 'line', 5265
    getattribute $P4, self, 'left'
    $P3 = $P4.'isidentifier'()
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 5266
    getattribute $P5, self, 'left'
    $P1 = $P5.'getIdentifier'()
    goto __label_3
  __label_2: # else
.annotate 'line', 5268
    getattribute $P6, self, 'left'
    $P1 = $P6.'emit_get'(__ARG_1)
  __label_3: # endif
.annotate 'line', 5269
    setattribute self, 'regleft', $P1
.annotate 'line', 5270
    $P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 5271
    setattribute self, 'argregs', $P2
# }
.annotate 'line', 5272

.end # emit_prep


.sub 'emit_aux' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5275
# var regleft: $P1
    getattribute $P1, self, 'regleft'
.annotate 'line', 5276
# var argregs: $P2
    getattribute $P2, self, 'argregs'
.annotate 'line', 5277
    isnull $I1, $P1
    if $I1 goto __label_1
    isnull $I1, $P2
  __label_1:
    unless $I1 goto __label_0
.annotate 'line', 5278
    getattribute $P3, self, 'start'
    'InternalError'('wrong call to IndexExpr.emit_aux', $P3)
  __label_0: # endif
.annotate 'line', 5279
    getattribute $P3, self, 'regleft'
    __ARG_1.'print'($P3, '[')
.annotate 'line', 5280
    getattribute $P3, self, 'argregs'
# predefined join
    join $S1, '; ', $P3
    __ARG_1.'print'($S1)
.annotate 'line', 5281
    __ARG_1.'print'(']')
# }
.annotate 'line', 5282

.end # emit_aux


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5285
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5286
# type: $S1
    $P2 = self.'checkresult'()
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
  __label_0:
.annotate 'line', 5287
    ne $S1, 'S', __label_1
# {
.annotate 'line', 5288
# var argregs: $P1
    getattribute $P1, self, 'argregs'
.annotate 'line', 5289
# nargs: $I1
    getattribute $P2, self, 'argregs'
# predefined elements
    elements $I1, $P2
.annotate 'line', 5290
    eq $I1, 1, __label_3
.annotate 'line', 5291
    getattribute $P2, self, 'start'
    'SyntaxError'('Bad string index', $P2)
  __label_3: # endif
.annotate 'line', 5292
    set $S2, __ARG_2
    ne $S2, '', __label_4
.annotate 'line', 5293
    __ARG_2 = self.'tempreg'('S')
  __label_4: # endif
.annotate 'line', 5294
    getattribute $P2, self, 'regleft'
    $P3 = $P1[0]
    __ARG_1.'say'('    ', 'substr ', __ARG_2, ', ', $P2, ', ', $P3, ', ', 1)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 5297
    self.'annotate'(__ARG_1)
.annotate 'line', 5298
    __ARG_1.'print'('    ', __ARG_2, ' = ')
.annotate 'line', 5299
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5300
    __ARG_1.'say'('')
# }
  __label_2: # endif
# }
.annotate 'line', 5302

.end # emit


.sub 'emit_assign' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5305
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5306
    self.'annotate'(__ARG_1)
.annotate 'line', 5307
    __ARG_1.'print'('    ')
.annotate 'line', 5308
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5309
    __ARG_1.'say'(' = ', __ARG_3)
# }
.annotate 'line', 5310

.end # emit_assign


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5313
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5314
# rreg: $S1
    null $S1
.annotate 'line', 5315
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_0
    unless $P1 goto __label_0
# {
.annotate 'line', 5316
    $P2 = self.'tempreg'('P')
    set $S1, $P2
.annotate 'line', 5317
    __ARG_1.'emitnull'($S1)
# }
    goto __label_1
  __label_0: # else
.annotate 'line', 5320
    $P1 = __ARG_2.'emit_get'(__ARG_1)
    set $S1, $P1
  __label_1: # endif
.annotate 'line', 5321
    self.'annotate'(__ARG_1)
.annotate 'line', 5322
    __ARG_1.'print'('    ')
.annotate 'line', 5323
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5324
    __ARG_1.'say'(' = ', $S1)
.annotate 'line', 5325
    .return($S1)
# }
.annotate 'line', 5326

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IndexExpr' ]
.annotate 'line', 5220
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
    get_class $P2, [ 'SimpleArgList' ]
    addparent $P0, $P2
.annotate 'line', 5222
    addattribute $P0, 'left'
.annotate 'line', 5223
    addattribute $P0, 'regleft'
.annotate 'line', 5224
    addattribute $P0, 'argregs'
.end
.namespace [ 'ArrayExpr' ]

.sub 'ArrayExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5337
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5338
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'values', $P4
.annotate 'line', 5339
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5340
    $P3 = $P1.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_0
# {
.annotate 'line', 5341
    __ARG_1.'unget'($P1)
  __label_1: # do
.annotate 'line', 5342
# {
.annotate 'line', 5343
# var item: $P2
    $P2 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 5344
    getattribute $P3, self, 'values'
# predefined push
    push $P3, $P2
# }
  __label_3: # continue
.annotate 'line', 5345
    $P1 = __ARG_1.'get'()
    $P3 = $P1.'isop'(',')
    if_null $P3, __label_2
    if $P3 goto __label_1
  __label_2: # enddo
.annotate 'line', 5346
    $P3 = $P1.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_4
.annotate 'line', 5347
    'Expected'("']' or ','", $P1)
  __label_4: # endif
# }
  __label_0: # endif
# }
.annotate 'line', 5349

.end # ArrayExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5350
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5353
    getattribute $P1, self, 'values'
    'optimize_array'($P1)
.annotate 'line', 5354
    .return(self)
# }
.annotate 'line', 5355

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5358
    set $S2, __ARG_2
    eq $S2, '', __label_0
# {
.annotate 'line', 5359
# value: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 5360
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
    goto __label_1
  __label_0: # else
# {
.annotate 'line', 5366
    self.'emit_init'(__ARG_1, '')
# }
  __label_1: # endif
# }
.annotate 'line', 5368

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5371
# container: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 5372
    self.'emit_init'(__ARG_1, $S1)
.annotate 'line', 5373
    .return($S1)
# }
.annotate 'line', 5374

.end # emit_get


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 5377
    self.'annotate'(__ARG_1)
.annotate 'line', 5378
# itemreg: $S1
    null $S1
.annotate 'line', 5379
# it_p: $S2
    null $S2
.annotate 'line', 5380
    eq __ARG_2, '', __label_0
# {
.annotate 'line', 5381
    __ARG_1.'say'('    ', 'root_new ', __ARG_2, ", ['parrot';'ResizablePMCArray']")
.annotate 'line', 5382
    $P2 = self.'tempreg'('P')
    set $S2, $P2
# }
  __label_0: # endif
.annotate 'line', 5384
    getattribute $P2, self, 'values'
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
# {
.annotate 'line', 5385
# type: $S3
    $P4 = $P1.'checkresult'()
    null $S3
    if_null $P4, __label_3
    set $S3, $P4
  __label_3:
# switch
.annotate 'line', 5386
    set $S5, $S3
    set $S6, 'I'
    if $S5 == $S6 goto __label_6
    set $S6, 'N'
    if $S5 == $S6 goto __label_7
    set $S6, 'S'
    if $S5 == $S6 goto __label_8
    goto __label_5
  __label_6: # case
  __label_7: # case
  __label_8: # case
.annotate 'line', 5388
# aux: $S4
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P2, __label_9
    set $S4, $P2
  __label_9:
.annotate 'line', 5389
    eq __ARG_2, '', __label_10
# {
.annotate 'line', 5390
    __ARG_1.'emitbox'($S2, $S4)
.annotate 'line', 5391
    set $S1, $S2
# }
  __label_10: # endif
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 5395
    $P2 = $P1.'isnull'()
    if_null $P2, __label_11
    unless $P2 goto __label_11
# {
.annotate 'line', 5396
    eq __ARG_2, '', __label_13
# {
.annotate 'line', 5397
    $P4 = self.'tempreg'('P')
    set $S1, $P4
.annotate 'line', 5398
    __ARG_1.'emitnull'($S1)
# }
  __label_13: # endif
# }
    goto __label_12
  __label_11: # else
.annotate 'line', 5402
    $P2 = $P1.'emit_get'(__ARG_1)
    set $S1, $P2
  __label_12: # endif
  __label_4: # switch end
.annotate 'line', 5404
    eq __ARG_2, '', __label_14
# {
.annotate 'line', 5405
    self.'annotate'(__ARG_1)
.annotate 'line', 5406
    __ARG_1.'emitarg2'('push', __ARG_2, $S1)
# }
  __label_14: # endif
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 5409

.end # emit_init

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ArrayExpr' ]
.annotate 'line', 5331
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5333
    addattribute $P0, 'values'
.end
.namespace [ 'HashExpr' ]

.sub 'HashExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5421
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5422
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5423
# var keys: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 5424
# var values: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 5425
    $P6 = $P1.'isop'('}')
    isfalse $I1, $P6
    unless $I1 goto __label_0
# {
.annotate 'line', 5426
    __ARG_1.'unget'($P1)
  __label_1: # do
.annotate 'line', 5427
# {
.annotate 'line', 5428
# var key: $P4
    $P4 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 5429
    'ExpectOp'(':', __ARG_1)
.annotate 'line', 5430
# var value: $P5
    $P5 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 5431
# predefined push
    push $P2, $P4
.annotate 'line', 5432
# predefined push
    push $P3, $P5
# }
  __label_3: # continue
.annotate 'line', 5434
    $P1 = __ARG_1.'get'()
    $P6 = $P1.'isop'(',')
    if_null $P6, __label_2
    if $P6 goto __label_1
  __label_2: # enddo
.annotate 'line', 5435
    $P6 = $P1.'isop'('}')
    isfalse $I1, $P6
    unless $I1 goto __label_4
.annotate 'line', 5436
    'Expected'("',' or '}'", $P1)
  __label_4: # endif
# }
  __label_0: # endif
.annotate 'line', 5438
    setattribute self, 'keys', $P2
.annotate 'line', 5439
    setattribute self, 'values', $P3
# }
.annotate 'line', 5440

.end # HashExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5441
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5444
    getattribute $P1, self, 'keys'
    'optimize_array'($P1)
.annotate 'line', 5445
    getattribute $P1, self, 'values'
    'optimize_array'($P1)
.annotate 'line', 5446
    .return(self)
# }
.annotate 'line', 5447

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5450
    self.'annotate'(__ARG_1)
.annotate 'line', 5455
    set $S6, __ARG_2
    eq $S6, '', __label_0
.annotate 'line', 5456
    __ARG_1.'say'('    ', 'root_new ', __ARG_2, ", ['parrot';'Hash']")
  __label_0: # endif
.annotate 'line', 5458
# var keys: $P1
    getattribute $P1, self, 'keys'
.annotate 'line', 5459
# var values: $P2
    getattribute $P2, self, 'values'
.annotate 'line', 5460
# n: $I1
    set $P5, $P1
    set $I1, $P5
# for loop
.annotate 'line', 5461
# i: $I2
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
# {
.annotate 'line', 5462
# var key: $P3
    $P3 = $P1[$I2]
.annotate 'line', 5463
# item: $S1
    null $S1
.annotate 'line', 5464
    $P5 = $P3.'isidentifier'()
    if_null $P5, __label_4
    unless $P5 goto __label_4
# {
.annotate 'line', 5465
# id: $S2
    $P6 = $P3.'getName'()
    null $S2
    if_null $P6, __label_6
    set $S2, $P6
  __label_6:
.annotate 'line', 5466
    $P5 = self.'tempreg'('P')
    set $S1, $P5
.annotate 'line', 5467
    __ARG_1.'say'('    ', 'get_hll_global ', $S1, ", '", $S2, "'")
# }
    goto __label_5
  __label_4: # else
.annotate 'line', 5470
    $P5 = $P3.'emit_get'(__ARG_1)
    set $S1, $P5
  __label_5: # endif
.annotate 'line', 5472
# var value: $P4
    $P4 = $P2[$I2]
.annotate 'line', 5473
# itemreg: $S3
    null $S3
.annotate 'line', 5474
    $P5 = $P4.'isnull'()
    if_null $P5, __label_7
    unless $P5 goto __label_7
# {
.annotate 'line', 5475
    set $S6, __ARG_2
    eq $S6, '', __label_9
# {
.annotate 'line', 5476
    $P6 = self.'tempreg'('P')
    set $S3, $P6
.annotate 'line', 5477
    __ARG_1.'emitnull'($S3)
# }
  __label_9: # endif
# }
    goto __label_8
  __label_7: # else
.annotate 'line', 5480
    $P5 = $P4.'isidentifier'()
    if_null $P5, __label_10
    unless $P5 goto __label_10
# {
.annotate 'line', 5481
# s: $S4
    $P6 = $P4.'checkIdentifier'()
    null $S4
    if_null $P6, __label_12
    set $S4, $P6
  __label_12:
.annotate 'line', 5482
    isnull $I3, $S4
    not $I3
    unless $I3 goto __label_15
    isne $I3, $S4, ''
  __label_15:
    unless $I3 goto __label_13
.annotate 'line', 5483
    set $S3, $S4
    goto __label_14
  __label_13: # else
# {
.annotate 'line', 5485
# id: $S5
    $P5 = $P4.'getName'()
    null $S5
    if_null $P5, __label_16
    set $S5, $P5
  __label_16:
.annotate 'line', 5486
    getattribute $P6, self, 'owner'
    $P5 = $P6.'getvar'($S5)
    unless_null $P5, __label_17
# {
.annotate 'line', 5487
    $P7 = self.'tempreg'('P')
    set $S3, $P7
.annotate 'line', 5488
    __ARG_1.'say'('    ', 'get_hll_global ', $S3, ", '", $S5, "'")
# }
    goto __label_18
  __label_17: # else
.annotate 'line', 5491
    $P5 = $P4.'emit_get'(__ARG_1)
    set $S3, $P5
  __label_18: # endif
# }
  __label_14: # endif
# }
    goto __label_11
  __label_10: # else
.annotate 'line', 5495
    $P5 = $P4.'emit_get'(__ARG_1)
    set $S3, $P5
  __label_11: # endif
  __label_8: # endif
.annotate 'line', 5496
    set $S6, __ARG_2
    eq $S6, '', __label_19
.annotate 'line', 5497
    __ARG_1.'say'('    ', __ARG_2, '[', $S1, '] = ', $S3)
  __label_19: # endif
# }
  __label_1: # for iteration
.annotate 'line', 5461
    inc $I2
    goto __label_3
  __label_2: # for end
# }
.annotate 'line', 5499

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5502
# container: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 5503
    self.'emit'(__ARG_1, $S1)
.annotate 'line', 5504
    .return($S1)
# }
.annotate 'line', 5505

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'HashExpr' ]
.annotate 'line', 5414
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5416
    addattribute $P0, 'keys'
.annotate 'line', 5417
    addattribute $P0, 'values'
.end
.namespace [ 'NewBaseExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5518
    .return('P')
# }

.end # checkresult


.sub 'parseinitializer' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5523
    new $P3, [ 'ArgumentList' ]
    getattribute $P4, self, 'owner'
    getattribute $P5, self, 'start'
    $P3.'ArgumentList'($P4, $P5, __ARG_1, ')')
    set $P2, $P3
    setattribute self, 'initializer', $P2
# }
.annotate 'line', 5524

.end # parseinitializer


.sub 'optimize_initializer' :method
# Body
# {
.annotate 'line', 5527
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5528
    if_null $P1, __label_0
.annotate 'line', 5529
    $P3 = $P1.'optimize'()
    setattribute self, 'initializer', $P3
  __label_0: # endif
# }
.annotate 'line', 5530

.end # optimize_initializer


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5533
    self.'optimize_initializer'()
.annotate 'line', 5534
    .return(self)
# }
.annotate 'line', 5535

.end # optimize


.sub 'emit_constructor' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5538
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5539
    if_null $P1, __label_0
.annotate 'line', 5540
    $P1.'getargvalues'(__ARG_1)
  __label_0: # endif
.annotate 'line', 5541
    __ARG_1.'print'('    ', __ARG_2, ".'", __ARG_3, "'(")
.annotate 'line', 5542
    if_null $P1, __label_1
.annotate 'line', 5543
    $P1.'emitargs'(__ARG_1)
  __label_1: # endif
.annotate 'line', 5544
    __ARG_1.'say'(")")
# }
.annotate 'line', 5545

.end # emit_constructor

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NewBaseExpr' ]
.annotate 'line', 5510
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5512
    addattribute $P0, 'initializer'
.end
.namespace [ 'NewExpr' ]

.sub 'NewExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 5556
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5558
    $I2 = __ARG_4.'isstring'()
    if $I2 goto __label_1
    $I2 = __ARG_4.'isidentifier'()
  __label_1:
    not $I1, $I2
    unless $I1 goto __label_0
.annotate 'line', 5559
    'SyntaxError'("Unimplemented", __ARG_4)
  __label_0: # endif
.annotate 'line', 5560
    setattribute self, 'value', __ARG_4
.annotate 'line', 5561
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5563
    $P2 = $P1.'isop'('(')
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 5564
    self.'parseinitializer'(__ARG_1)
    goto __label_3
  __label_2: # else
.annotate 'line', 5566
    __ARG_1.'unget'($P1)
  __label_3: # endif
# }
.annotate 'line', 5567

.end # NewExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5570
# var value: $P1
    getattribute $P1, self, 'value'
.annotate 'line', 5571
    isa $I1, $P1, [ 'Token' ]
    unless $I1 goto __label_1
    $I1 = $P1.'isidentifier'()
  __label_1:
    unless $I1 goto __label_0
# {
.annotate 'line', 5574
# var name: $P2
    $P2 = $P1.'getidentifier'()
.annotate 'line', 5575
# var desc: $P3
    getattribute $P4, self, 'owner'
    $P3 = $P4.'getvar'($P2)
.annotate 'line', 5576
    isnull $I1, $P3
    not $I1
    unless $I1 goto __label_3
    $I1 = $P3.'isconst'()
  __label_3:
    unless $I1 goto __label_2
# {
.annotate 'line', 5577
    $P4 = $P3.'getid'()
    unless_null $P4, __label_4
# {
.annotate 'line', 5578
    $P1 = $P3.'getvalue'()
.annotate 'line', 5579
    isa $I2, $P1, [ 'StringLiteral' ]
    not $I1, $I2
    unless $I1 goto __label_6
.annotate 'line', 5580
    'SyntaxError'('Constant value must evaluate to a string', $P1)
  __label_6: # endif
.annotate 'line', 5581
    getattribute $P5, $P1, 'strval'
    setattribute self, 'value', $P5
# }
    goto __label_5
  __label_4: # else
.annotate 'line', 5584
    'SyntaxError'('*Constant value must evaluate to a string', $P1)
  __label_5: # endif
# }
  __label_2: # endif
# }
  __label_0: # endif
.annotate 'line', 5587
    self.'optimize_initializer'()
.annotate 'line', 5588
    .return(self)
# }
.annotate 'line', 5589

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 5592
    self.'annotate'(__ARG_1)
.annotate 'line', 5594
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5595
# numinits: $I1
    unless_null $P1, __label_1
    set $I1, -1
    goto __label_0
  __label_1:
    $I1 = $P1.'numargs'()
  __label_0:
# Constant BYNAME evaluated at compile time
# Constant BYIDENT evaluated at compile time
.annotate 'line', 5598
# type: $I2
    getattribute $P7, self, 'value'
    $P6 = $P7.'isstring'()
    if_null $P6, __label_3
    unless $P6 goto __label_3
    null $I2
    goto __label_2
  __label_3:
.annotate 'line', 5599
    getattribute $P9, self, 'value'
    $P8 = $P9.'isidentifier'()
    if_null $P8, __label_5
    unless $P8 goto __label_5
    set $I2, 1
    goto __label_4
  __label_5:
    set $I2, -1
  __label_4:
  __label_2:
.annotate 'line', 5601
# reginit: $S1
    set $S1, ''
.annotate 'line', 5602
# regnew: $S2
    set $P6, __ARG_2
    null $S2
    if_null $P6, __label_6
    set $S2, $P6
  __label_6:
.annotate 'line', 5603
# constructor: $S3
    null $S3
# switch
.annotate 'line', 5604
    set $I3, $I1
    set $I4, -1
    if $I3 == $I4 goto __label_9
    null $I4
    if $I3 == $I4 goto __label_10
    set $I4, 1
    if $I3 == $I4 goto __label_11
    goto __label_8
  __label_9: # case
  __label_10: # case
    goto __label_7 # break
  __label_11: # case
.annotate 'line', 5609
    ne $I2, 1, __label_12
# {
.annotate 'line', 5610
    not $I5, __ARG_3
    unless $I5 goto __label_14
.annotate 'line', 5611
    $P6 = self.'tempreg'('P')
    set $S2, $P6
  __label_14: # endif
# }
    goto __label_13
  __label_12: # else
# {
.annotate 'line', 5614
# var initval: $P2
    $P2 = $P1.'getfreearg'(0)
.annotate 'line', 5615
    $P6 = $P2.'emit_get'(__ARG_1)
    set $S1, $P6
.annotate 'line', 5616
    concat $S0, ', ', $S1
    set $S1, $S0
# }
  __label_13: # endif
    goto __label_7 # break
  __label_8: # default
.annotate 'line', 5620
    eq $I2, 1, __label_15
.annotate 'line', 5621
    getattribute $P6, self, 'start'
    'SyntaxError'('Multiple init arguments not allowed here', $P6)
  __label_15: # endif
.annotate 'line', 5622
    not $I3, __ARG_3
    unless $I3 goto __label_16
.annotate 'line', 5623
    $P7 = self.'tempreg'('P')
    set $S2, $P7
  __label_16: # endif
  __label_7: # switch end
# switch
.annotate 'line', 5626
    set $I3, $I2
    null $I4
    if $I3 == $I4 goto __label_19
    set $I4, 1
    if $I3 == $I4 goto __label_20
    goto __label_18
  __label_19: # case
.annotate 'line', 5629
# name: $S4
    getattribute $P7, self, 'value'
    $P6 = $P7.'rawstring'()
    null $S4
    if_null $P6, __label_21
    set $S4, $P6
  __label_21:
.annotate 'line', 5630
# var aux: $P3
# predefined get_class
    get_class $P3, $S4
.annotate 'line', 5631
    isnull $I5, $P3
    unless $I5 goto __label_23
    $I5 = self.'dowarnings'()
  __label_23:
    unless $I5 goto __label_22
.annotate 'line', 5632
    concat $S5, "Can't locate class ", $S4
    concat $S5, $S5, " at compile time"
    getattribute $P8, self, 'value'
    'Warn'($S5, $P8)
  __label_22: # endif
.annotate 'line', 5636
    getattribute $P9, self, 'value'
    __ARG_1.'say'('    ', 'new ', $S2, ", [ ", $P9, " ]", $S1)
.annotate 'line', 5637
    le $I1, 1, __label_24
# {
.annotate 'line', 5638
    getattribute $P10, self, 'value'
    __ARG_1.'say'($S2, ".'", $P10, "'()")
# }
  __label_24: # endif
    goto __label_17 # break
  __label_20: # case
.annotate 'line', 5642
# var id: $P4
    getattribute $P6, self, 'owner'
    getattribute $P7, self, 'value'
    $P4 = $P6.'getvar'($P7)
.annotate 'line', 5643
    unless_null $P4, __label_25
# {
.annotate 'line', 5645
# var cl: $P5
    getattribute $P8, self, 'owner'
    getattribute $P9, self, 'value'
    $P5 = $P8.'checkclass'($P9)
.annotate 'line', 5646
    if_null $P5, __label_27
# {
.annotate 'line', 5647
    $P6 = $P5.'getclasskey'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P6, $S1)
# }
    goto __label_28
  __label_27: # else
# {
.annotate 'line', 5650
    $P6 = self.'dowarnings'()
    if_null $P6, __label_29
    unless $P6 goto __label_29
.annotate 'line', 5651
    'Warn'('Checking: new unknown type')
  __label_29: # endif
.annotate 'line', 5652
    getattribute $P6, self, 'value'
    __ARG_1.'say'('    ', 'new ', $S2, ", ['", $P6, "']", $S1)
# }
  __label_28: # endif
.annotate 'line', 5654
    getattribute $P6, self, 'value'
    set $S3, $P6
# }
    goto __label_26
  __label_25: # else
# {
.annotate 'line', 5658
    $P6 = $P4.'getreg'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P6, "", $S1)
# }
  __label_26: # endif
    goto __label_17 # break
  __label_18: # default
.annotate 'line', 5662
    'InternalError'('Unexpected type in new')
  __label_17: # switch end
.annotate 'line', 5664
    isgt $I3, $I1, 1
    if $I3 goto __label_31
    isge $I3, $I1, 0
    unless $I3 goto __label_32
    iseq $I3, $I2, 1
  __label_32:
  __label_31:
    unless $I3 goto __label_30
# {
.annotate 'line', 5665
    self.'emit_constructor'(__ARG_1, $S2, $S3)
.annotate 'line', 5666
    not $I3, __ARG_3
    unless $I3 goto __label_33
.annotate 'line', 5667
    __ARG_1.'emitset'(__ARG_2, $S2)
  __label_33: # endif
# }
  __label_30: # endif
# }
.annotate 'line', 5669

.end # emit


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5672
    .tailcall self.'emit'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 5673

.end # emit_init

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NewExpr' ]
.annotate 'line', 5550
    get_class $P1, [ 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 5552
    addattribute $P0, 'value'
.end
.namespace [ 'NewIndexedExpr' ]

.sub 'NewIndexedExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5684
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5685
    setattribute self, 'owner', __ARG_2
.annotate 'line', 5686
# var nskey: $P1
    new $P1, [ 'ClassSpecifierParrotKey' ]
    $P1.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5687
    setattribute self, 'nskey', $P1
.annotate 'line', 5688
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 5689
    $P3 = $P2.'isop'('(')
    if_null $P3, __label_0
    unless $P3 goto __label_0
.annotate 'line', 5690
    self.'parseinitializer'(__ARG_1)
    goto __label_1
  __label_0: # else
.annotate 'line', 5692
    __ARG_1.'unget'($P2)
  __label_1: # endif
# }
.annotate 'line', 5693

.end # NewIndexedExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5696
# reginit: $S1
    null $S1
.annotate 'line', 5697
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5698
# numinits: $I1
    unless_null $P1, __label_1
    null $I1
    goto __label_0
  __label_1:
    $I1 = $P1.'numargs'()
  __label_0:
# switch
.annotate 'line', 5699
    set $I2, $I1
    null $I3
    if $I2 == $I3 goto __label_4
    set $I3, 1
    if $I2 == $I3 goto __label_5
    goto __label_3
  __label_4: # case
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 5703
# var initval: $P2
    $P2 = $P1.'getfreearg'(0)
.annotate 'line', 5704
    $P4 = $P2.'emit_get'(__ARG_1)
    set $S1, $P4
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 5707
    getattribute $P5, self, 'start'
    'SyntaxError'('Multiple init arguments not allowed here', $P5)
  __label_2: # switch end
.annotate 'line', 5709
# var nskey: $P3
    getattribute $P3, self, 'nskey'
.annotate 'line', 5710
    __ARG_1.'print'('    ')
.annotate 'line', 5711
    $P4 = $P3.'hasHLL'()
    if_null $P4, __label_6
    unless $P4 goto __label_6
.annotate 'line', 5712
    __ARG_1.'print'("root_")
  __label_6: # endif
.annotate 'line', 5713
    __ARG_1.'print'("new ", __ARG_2, ", ")
.annotate 'line', 5714
    null $P4
    $P3.'emit'(__ARG_1, $P4)
.annotate 'line', 5715
    if_null $S1, __label_7
.annotate 'line', 5716
    __ARG_1.'print'(', ', $S1)
  __label_7: # endif
.annotate 'line', 5717
    __ARG_1.'say'()
# }
.annotate 'line', 5718

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NewIndexedExpr' ]
.annotate 'line', 5678
    get_class $P1, [ 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 5680
    addattribute $P0, 'nskey'
.end
.namespace [ 'NewQualifiedExpr' ]

.sub 'NewQualifiedExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5729
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5730
    setattribute self, 'owner', __ARG_2
.annotate 'line', 5731
# var nskey: $P1
    new $P1, [ 'ClassSpecifierId' ]
    $P1.'ClassSpecifierId'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5732
    setattribute self, 'nskey', $P1
.annotate 'line', 5733
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 5734
    $P3 = $P2.'isop'('(')
    if_null $P3, __label_0
    unless $P3 goto __label_0
.annotate 'line', 5735
    self.'parseinitializer'(__ARG_1)
    goto __label_1
  __label_0: # else
.annotate 'line', 5737
    __ARG_1.'unget'($P2)
  __label_1: # endif
# }
.annotate 'line', 5738

.end # NewQualifiedExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5741
# reginit: $S1
    null $S1
.annotate 'line', 5742
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5744
# numinits: $I1
    unless_null $P1, __label_1
    set $I1, -1
    goto __label_0
  __label_1:
# predefined elements
    elements $I1, $P1
  __label_0:
.annotate 'line', 5745
# regnew: $S2
    set $P3, __ARG_2
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 5746
    le $I1, 0, __label_3
.annotate 'line', 5747
    $P3 = self.'tempreg'('P')
    set $S2, $P3
  __label_3: # endif
.annotate 'line', 5748
# var nskey: $P2
    getattribute $P2, self, 'nskey'
.annotate 'line', 5749
    __ARG_1.'print'('    ', 'new ', $S2, ", ")
.annotate 'line', 5750
    getattribute $P3, self, 'owner'
    $P2.'emit'(__ARG_1, $P3)
.annotate 'line', 5751
    __ARG_1.'say'()
.annotate 'line', 5753
    lt $I1, 0, __label_4
# {
.annotate 'line', 5754
# constructor: $S3
    $P3 = $P2.'last'()
    null $S3
    if_null $P3, __label_5
    set $S3, $P3
  __label_5:
.annotate 'line', 5755
    self.'emit_constructor'(__ARG_1, $S2, $S3)
.annotate 'line', 5756
    __ARG_1.'emitset'(__ARG_2, $S2)
# }
  __label_4: # endif
# }
.annotate 'line', 5758

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NewQualifiedExpr' ]
.annotate 'line', 5723
    get_class $P1, [ 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 5725
    addattribute $P0, 'nskey'
.end
.namespace [ ]

.sub 'parseNew'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5765
# var t: $P1
    $P1 = __ARG_1.'get'()
# switch-case
.annotate 'line', 5768
    $I1 = $P1.'isop'('(')
    if $I1 goto __label_2
.annotate 'line', 5772
    $I1 = $P1.'isop'('[')
    if $I1 goto __label_3
.annotate 'line', 5775
    $I1 = $P1.'isidentifier'()
    if $I1 goto __label_4
    goto __label_1
  __label_2: # case
.annotate 'line', 5770
    new $P4, [ 'CallExpr' ]
.annotate 'line', 5771
    new $P6, [ 'StringLiteral' ]
    $P6.'StringLiteral'(__ARG_2, __ARG_3)
    set $P5, $P6
    $P4.'CallExpr'(__ARG_1, __ARG_2, __ARG_3, $P5)
    set $P3, $P4
.annotate 'line', 5770
    .return($P3)
  __label_3: # case
.annotate 'line', 5774
    new $P8, [ 'NewIndexedExpr' ]
    $P8.'NewIndexedExpr'(__ARG_1, __ARG_2, __ARG_3)
    set $P7, $P8
    .return($P7)
  __label_4: # case
.annotate 'line', 5778
# var t2: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 5779
    __ARG_1.'unget'($P2)
.annotate 'line', 5780
    $P9 = $P2.'isop'('.')
    if_null $P9, __label_5
    unless $P9 goto __label_5
# {
.annotate 'line', 5782
    new $P11, [ 'NewQualifiedExpr' ]
    $P11.'NewQualifiedExpr'(__ARG_1, __ARG_2, $P1)
    set $P10, $P11
    .return($P10)
# }
  __label_5: # endif
  __label_1: # default
.annotate 'line', 5787
    new $P4, [ 'NewExpr' ]
    $P4.'NewExpr'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P3, $P4
    .return($P3)
  __label_0: # switch end
# }
.annotate 'line', 5789

.end # parseNew

.namespace [ 'OpInstanceOfExpr' ]

.sub 'OpInstanceOfExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 5800
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5801
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 5802
    $P2 = 'parseClassSpecifier'(__ARG_4, self)
    setattribute self, 'checked', $P2
# }
.annotate 'line', 5803

.end # OpInstanceOfExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5806
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 5807
    .return(self)
# }
.annotate 'line', 5808

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5809
    .return('I')
# }

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5812
# var checked: $P1
    getattribute $P1, self, 'checked'
.annotate 'line', 5814
# r: $S1
    null $S1
.annotate 'line', 5815
    set $S3, __ARG_2
    ne $S3, '', __label_0
.annotate 'line', 5816
    $P2 = self.'tempreg'('I')
    set $S1, $P2
    goto __label_1
  __label_0: # else
.annotate 'line', 5818
    set $S1, __ARG_2
  __label_1: # endif
.annotate 'line', 5819
# check: $S2
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 5820
    self.'annotate'(__ARG_1)
.annotate 'line', 5821
    __ARG_1.'print'('    isa ', $S1, ', ', $S2, ', ')
.annotate 'line', 5822
    getattribute $P2, self, 'owner'
    $P1.'emit'(__ARG_1, $P2)
.annotate 'line', 5823
    __ARG_1.'say'()
# }
.annotate 'line', 5824

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpInstanceOfExpr' ]
.annotate 'line', 5793
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5795
    addattribute $P0, 'lexpr'
.annotate 'line', 5796
    addattribute $P0, 'checked'
.end
.namespace [ 'OpConditionalExpr' ]

.sub 'OpConditionalExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 5841
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5842
    new $P3, [ 'Condition' ]
    $P2 = $P3.'set'(__ARG_3)
    setattribute self, 'condition', $P2
.annotate 'line', 5843
    setattribute self, 'etrue', __ARG_4
.annotate 'line', 5844
    setattribute self, 'efalse', __ARG_5
.annotate 'line', 5845
    .return(self)
# }
.annotate 'line', 5846

.end # OpConditionalExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5849
    getattribute $P3, self, 'condition'
    $P2 = $P3.'optimize'()
    setattribute self, 'condition', $P2
# switch
.annotate 'line', 5850
    getattribute $P2, self, 'condition'
    $P1 = $P2.'getvalue'()
    set $I1, $P1
    set $I2, 1
    if $I1 == $I2 goto __label_2
    set $I2, 2
    if $I1 == $I2 goto __label_3
    goto __label_1
  __label_2: # case
.annotate 'line', 5852
    getattribute $P3, self, 'etrue'
    .tailcall $P3.'optimize'()
  __label_3: # case
.annotate 'line', 5854
    getattribute $P4, self, 'efalse'
    .tailcall $P4.'optimize'()
  __label_1: # default
.annotate 'line', 5856
    getattribute $P7, self, 'etrue'
    $P6 = $P7.'optimize'()
    setattribute self, 'etrue', $P6
.annotate 'line', 5857
    getattribute $P10, self, 'efalse'
    $P9 = $P10.'optimize'()
    setattribute self, 'efalse', $P9
.annotate 'line', 5858
    .return(self)
  __label_0: # switch end
# }
.annotate 'line', 5860

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5863
    getattribute $P1, self, 'etrue'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 5864

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5867
# cond_end: $S1
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 5868
# cond_false: $S2
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
  __label_1:
.annotate 'line', 5869
    getattribute $P1, self, 'condition'
    $P1.'emit_else'(__ARG_1, $S2)
.annotate 'line', 5870
    getattribute $P1, self, 'etrue'
    $P1.'emit'(__ARG_1, __ARG_2)
.annotate 'line', 5871
    __ARG_1.'emitgoto'($S1)
.annotate 'line', 5872
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 5873
    getattribute $P1, self, 'efalse'
    $P1.'emit'(__ARG_1, __ARG_2)
.annotate 'line', 5874
    __ARG_1.'emitlabel'($S1)
# }
.annotate 'line', 5875

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpConditionalExpr' ]
.annotate 'line', 5829
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5835
    addattribute $P0, 'condition'
.annotate 'line', 5836
    addattribute $P0, 'etrue'
.annotate 'line', 5837
    addattribute $P0, 'efalse'
.end
.namespace [ ]
# Constant Code_none evaluated at compile time
# Constant Code_paren evaluated at compile time
# Constant Code_bracket evaluated at compile time
# Constant Code_dot evaluated at compile time
# Constant Code_assign evaluated at compile time
# Constant Code_assign_to evaluated at compile time
# Constant Code_add_assign evaluated at compile time
# Constant Code_add evaluated at compile time
# Constant Code_minus evaluated at compile time
# Constant Code_inc evaluated at compile time
# Constant Code_dec evaluated at compile time
# Constant Code_not evaluated at compile time
# Constant Code_equal evaluated at compile time
# Constant Code_not_equal evaluated at compile time
# Constant Code_less evaluated at compile time
# Constant Code_less_equal evaluated at compile time
# Constant Code_greater evaluated at compile time
# Constant Code_greater_equal evaluated at compile time
# Constant Code_sub_assign evaluated at compile time
# Constant Code_mul evaluated at compile time
# Constant Code_div evaluated at compile time
# Constant Code_mod evaluated at compile time
# Constant Code_cmod evaluated at compile time
# Constant Code_mul_assign evaluated at compile time
# Constant Code_div_assign evaluated at compile time
# Constant Code_same evaluated at compile time
# Constant Code_not_same evaluated at compile time
# Constant Code_instanceof evaluated at compile time
# Constant Code_shiftleft evaluated at compile time
# Constant Code_shiftright evaluated at compile time
# Constant Code_mod_assign evaluated at compile time
# Constant Code_delete evaluated at compile time
# Constant Code_exists evaluated at compile time

.sub 'getOpCode_2'
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 5919
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    set $S2, '('
    if $S1 == $S2 goto __label_2
    set $S2, '['
    if $S1 == $S2 goto __label_3
    set $S2, '.'
    if $S1 == $S2 goto __label_4
    goto __label_1
  __label_2: # case
.annotate 'line', 5920
    .return(1)
  __label_3: # case
.annotate 'line', 5921
    .return(2)
  __label_4: # case
.annotate 'line', 5922
    .return(3)
  __label_1: # default
.annotate 'line', 5923
    .return(0)
  __label_0: # switch end
# }
.annotate 'line', 5925

.end # getOpCode_2


.sub 'getOpCode_4'
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 5929
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    set $S2, '-'
    if $S1 == $S2 goto __label_2
    set $S2, '!'
    if $S1 == $S2 goto __label_3
    set $S2, '++'
    if $S1 == $S2 goto __label_4
    set $S2, '--'
    if $S1 == $S2 goto __label_5
    goto __label_1
  __label_2: # case
.annotate 'line', 5930
    .return(8)
  __label_3: # case
.annotate 'line', 5931
    .return(11)
  __label_4: # case
.annotate 'line', 5932
    .return(9)
  __label_5: # case
.annotate 'line', 5933
    .return(10)
  __label_1: # default
.annotate 'line', 5935
    $P2 = __ARG_1.'iskeyword'('delete')
    if_null $P2, __label_6
    unless $P2 goto __label_6
    .return(31)
    goto __label_7
  __label_6: # else
.annotate 'line', 5936
    $P3 = __ARG_1.'iskeyword'('exists')
    if_null $P3, __label_8
    unless $P3 goto __label_8
    .return(32)
    goto __label_9
  __label_8: # else
.annotate 'line', 5937
    .return(0)
  __label_9: # endif
  __label_7: # endif
  __label_0: # switch end
# }
.annotate 'line', 5939

.end # getOpCode_4


.sub 'getOpCode_5'
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 5943
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    set $S2, '*'
    if $S1 == $S2 goto __label_2
    set $S2, '/'
    if $S1 == $S2 goto __label_3
    set $S2, '%'
    if $S1 == $S2 goto __label_4
    set $S2, '%%'
    if $S1 == $S2 goto __label_5
    goto __label_1
  __label_2: # case
.annotate 'line', 5944
    .return(19)
  __label_3: # case
.annotate 'line', 5945
    .return(20)
  __label_4: # case
.annotate 'line', 5946
    .return(21)
  __label_5: # case
.annotate 'line', 5947
    .return(22)
  __label_1: # default
.annotate 'line', 5948
    .return(0)
  __label_0: # switch end
# }
.annotate 'line', 5950

.end # getOpCode_5


.sub 'getOpCode_7'
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 5954
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    set $S2, '<<'
    if $S1 == $S2 goto __label_2
    set $S2, '>>'
    if $S1 == $S2 goto __label_3
    goto __label_1
  __label_2: # case
.annotate 'line', 5955
    .return(28)
  __label_3: # case
.annotate 'line', 5956
    .return(29)
  __label_1: # default
.annotate 'line', 5957
    .return(0)
  __label_0: # switch end
# }
.annotate 'line', 5959

.end # getOpCode_7


.sub 'getOpCode_8'
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 5963
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    set $S2, '<'
    if $S1 == $S2 goto __label_2
    set $S2, '>'
    if $S1 == $S2 goto __label_3
    set $S2, '<='
    if $S1 == $S2 goto __label_4
    set $S2, '>='
    if $S1 == $S2 goto __label_5
    goto __label_1
  __label_2: # case
.annotate 'line', 5964
    .return(14)
  __label_3: # case
.annotate 'line', 5965
    .return(16)
  __label_4: # case
.annotate 'line', 5966
    .return(15)
  __label_5: # case
.annotate 'line', 5967
    .return(17)
  __label_1: # default
.annotate 'line', 5969
    $P2 = __ARG_1.'iskeyword'('instanceof')
    if_null $P2, __label_6
    unless $P2 goto __label_6
    .return(27)
    goto __label_7
  __label_6: # else
.annotate 'line', 5970
    .return(0)
  __label_7: # endif
  __label_0: # switch end
# }
.annotate 'line', 5972

.end # getOpCode_8


.sub 'getOpCode_9'
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 5976
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    set $S2, '=='
    if $S1 == $S2 goto __label_2
    set $S2, '!='
    if $S1 == $S2 goto __label_3
    set $S2, '==='
    if $S1 == $S2 goto __label_4
    set $S2, '!=='
    if $S1 == $S2 goto __label_5
    goto __label_1
  __label_2: # case
.annotate 'line', 5977
    .return(12)
  __label_3: # case
.annotate 'line', 5978
    .return(13)
  __label_4: # case
.annotate 'line', 5979
    .return(25)
  __label_5: # case
.annotate 'line', 5980
    .return(26)
  __label_1: # default
.annotate 'line', 5981
    .return(0)
  __label_0: # switch end
# }
.annotate 'line', 5983

.end # getOpCode_9


.sub 'getOpCode_16'
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 5987
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    set $S2, '='
    if $S1 == $S2 goto __label_2
    set $S2, '=:'
    if $S1 == $S2 goto __label_3
    set $S2, '+='
    if $S1 == $S2 goto __label_4
    set $S2, '-='
    if $S1 == $S2 goto __label_5
    set $S2, '*='
    if $S1 == $S2 goto __label_6
    set $S2, '/='
    if $S1 == $S2 goto __label_7
    set $S2, '%='
    if $S1 == $S2 goto __label_8
    goto __label_1
  __label_2: # case
.annotate 'line', 5988
    .return(4)
  __label_3: # case
.annotate 'line', 5989
    .return(5)
  __label_4: # case
.annotate 'line', 5990
    .return(6)
  __label_5: # case
.annotate 'line', 5991
    .return(18)
  __label_6: # case
.annotate 'line', 5992
    .return(23)
  __label_7: # case
.annotate 'line', 5993
    .return(24)
  __label_8: # case
.annotate 'line', 5994
    .return(30)
  __label_1: # default
.annotate 'line', 5995
    .return(0)
  __label_0: # switch end
# }
.annotate 'line', 5997

.end # getOpCode_16


.sub 'parseExpr_0'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6001
.const 'Sub' $P3 = 'parseExpr'
.annotate 'line', 6003
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 6004
# var expr: $P2
    null $P2
# switch-case
.annotate 'line', 6007
    $I1 = $P1.'isop'('(')
    if $I1 goto __label_2
.annotate 'line', 6011
    $I1 = $P1.'isop'('[')
    if $I1 goto __label_3
.annotate 'line', 6013
    $I1 = $P1.'isop'('{')
    if $I1 goto __label_4
.annotate 'line', 6015
    $I1 = $P1.'isstring'()
    if $I1 goto __label_5
.annotate 'line', 6017
    $I1 = $P1.'isint'()
    if $I1 goto __label_6
.annotate 'line', 6019
    $I1 = $P1.'isfloat'()
    if $I1 goto __label_7
.annotate 'line', 6021
    $I1 = $P1.'iskeyword'('new')
    if $I1 goto __label_8
.annotate 'line', 6023
    $I1 = $P1.'iskeyword'('function')
    if $I1 goto __label_9
.annotate 'line', 6025
    $I1 = $P1.'iskeyword'('class')
    if $I1 goto __label_10
.annotate 'line', 6027
    $I1 = $P1.'isidentifier'()
    if $I1 goto __label_11
    goto __label_1
  __label_2: # case
.annotate 'line', 6008
    $P2 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 6009
    'ExpectOp'(')', __ARG_1)
.annotate 'line', 6010
    .return($P2)
  __label_3: # case
.annotate 'line', 6012
    new $P5, [ 'ArrayExpr' ]
    $P5.'ArrayExpr'(__ARG_1, __ARG_2, $P1)
    set $P4, $P5
    .return($P4)
  __label_4: # case
.annotate 'line', 6014
    new $P7, [ 'HashExpr' ]
    $P7.'HashExpr'(__ARG_1, __ARG_2, $P1)
    set $P6, $P7
    .return($P6)
  __label_5: # case
.annotate 'line', 6016
    new $P9, [ 'StringLiteral' ]
    $P9.'StringLiteral'(__ARG_2, $P1)
    set $P8, $P9
    .return($P8)
  __label_6: # case
.annotate 'line', 6018
    new $P11, [ 'IntegerLiteral' ]
    $P11.'IntegerLiteral'(__ARG_2, $P1)
    set $P10, $P11
    .return($P10)
  __label_7: # case
.annotate 'line', 6020
    new $P13, [ 'FloatLiteral' ]
    $P13.'FloatLiteral'(__ARG_2, $P1)
    set $P12, $P13
    .return($P12)
  __label_8: # case
.annotate 'line', 6022
    .tailcall 'parseNew'(__ARG_1, __ARG_2, $P1)
  __label_9: # case
.annotate 'line', 6024
    new $P15, [ 'FunctionExpr' ]
    $P15.'FunctionExpr'(__ARG_1, __ARG_2, $P1)
    set $P14, $P15
    .return($P14)
  __label_10: # case
.annotate 'line', 6026
    new $P17, [ 'OpClassExpr' ]
    $P17.'OpClassExpr'(__ARG_1, __ARG_2, $P1)
    set $P16, $P17
    .return($P16)
  __label_11: # case
.annotate 'line', 6028
    new $P19, [ 'IdentifierExpr' ]
    $P19.'IdentifierExpr'(__ARG_2, $P1)
    set $P18, $P19
    .return($P18)
  __label_1: # default
.annotate 'line', 6030
    'SyntaxError'('Expression expected', $P1)
  __label_0: # switch end
# }
.annotate 'line', 6032

.end # parseExpr_0


.sub 'parseExpr_2'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6036
.const 'Sub' $P5 = 'parseExpr_0'
.const 'Sub' $P6 = 'getOpCode_2'
.annotate 'line', 6038
# var subexp: $P1
    $P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6039
# var t: $P2
    null $P2
.annotate 'line', 6040
# var start: $P3
    null $P3
.annotate 'line', 6041
# code: $I1
    null $I1
  __label_1: # while
.annotate 'line', 6042
    $P2 = __ARG_1.'get'()
    $P7 = $P6($P2)
    set $I1, $P7
    eq $I1, 0, __label_0
# {
# switch
.annotate 'line', 6043
    set $I2, $I1
    set $I3, 1
    if $I2 == $I3 goto __label_4
    set $I3, 2
    if $I2 == $I3 goto __label_5
    set $I3, 3
    if $I2 == $I3 goto __label_6
    goto __label_3
  __label_4: # case
.annotate 'line', 6045
    new $P8, [ 'CallExpr' ]
    $P8.'CallExpr'(__ARG_1, __ARG_2, $P2, $P1)
    set $P1, $P8
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 6048
    new $P9, [ 'IndexExpr' ]
    $P9.'IndexExpr'(__ARG_1, __ARG_2, $P2, $P1)
    set $P1, $P9
    goto __label_2 # break
  __label_6: # case
.annotate 'line', 6051
    set $P3, $P2
.annotate 'line', 6052
    $P2 = __ARG_1.'get'()
.annotate 'line', 6053
    $P10 = $P2.'isop'('*')
    if_null $P10, __label_7
    unless $P10 goto __label_7
# {
.annotate 'line', 6054
# var right: $P4
    $P4 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6055
    new $P7, [ 'MemberRefExpr' ]
    $P7.'MemberRefExpr'(__ARG_2, $P2, $P1, $P4)
    set $P1, $P7
# }
    goto __label_8
  __label_7: # else
.annotate 'line', 6058
    new $P7, [ 'MemberExpr' ]
    $P7.'MemberExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P7
  __label_8: # endif
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 6061
    'InternalError'('Unexpected code in parseExpr_2')
  __label_2: # switch end
# }
    goto __label_1
  __label_0: # endwhile
.annotate 'line', 6064
    __ARG_1.'unget'($P2)
.annotate 'line', 6065
    .return($P1)
# }
.annotate 'line', 6066

.end # parseExpr_2


.sub 'parseExpr_3'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6070
.const 'Sub' $P3 = 'parseExpr_2'
.annotate 'line', 6072
# var subexp: $P1
    $P1 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 6073
# var t: $P2
    $P2 = __ARG_1.'get'()
# switch-case
.annotate 'line', 6075
    $I1 = $P2.'isop'('++')
    if $I1 goto __label_2
.annotate 'line', 6077
    $I1 = $P2.'isop'('--')
    if $I1 goto __label_3
    goto __label_1
  __label_2: # case
.annotate 'line', 6076
    new $P5, [ 'OpPostIncExpr' ]
    $P5.'OpPostIncExpr'(__ARG_2, $P2, $P1)
    set $P4, $P5
    .return($P4)
  __label_3: # case
.annotate 'line', 6078
    new $P7, [ 'OpPostDecExpr' ]
    $P7.'OpPostDecExpr'(__ARG_2, $P2, $P1)
    set $P6, $P7
    .return($P6)
  __label_1: # default
.annotate 'line', 6080
    __ARG_1.'unget'($P2)
.annotate 'line', 6081
    .return($P1)
  __label_0: # switch end
# }
.annotate 'line', 6083

.end # parseExpr_3


.sub 'parseExpr_4'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6087
.const 'Sub' $P3 = 'parseExpr_4'
.const 'Sub' $P4 = 'parseExpr_3'
.const 'Sub' $P5 = 'getOpCode_4'
.annotate 'line', 6089
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 6090
# code: $I1
    $P6 = $P5($P1)
    set $I1, $P6
.annotate 'line', 6091
    eq $I1, 0, __label_0
# {
.annotate 'line', 6092
# var subexpr: $P2
    $P2 = $P3(__ARG_1, __ARG_2)
# switch
.annotate 'line', 6093
    set $I2, $I1
    set $I3, 8
    if $I2 == $I3 goto __label_4
    set $I3, 11
    if $I2 == $I3 goto __label_5
    set $I3, 9
    if $I2 == $I3 goto __label_6
    set $I3, 10
    if $I2 == $I3 goto __label_7
    set $I3, 31
    if $I2 == $I3 goto __label_8
    set $I3, 32
    if $I2 == $I3 goto __label_9
    goto __label_3
  __label_4: # case
.annotate 'line', 6095
    new $P7, [ 'OpUnaryMinusExpr' ]
    $P7.'OpUnaryMinusExpr'(__ARG_2, $P1, $P2)
    set $P6, $P7
    .return($P6)
  __label_5: # case
.annotate 'line', 6097
    new $P9, [ 'OpNotExpr' ]
    $P9.'OpNotExpr'(__ARG_2, $P1, $P2)
    set $P8, $P9
    .return($P8)
  __label_6: # case
.annotate 'line', 6099
    new $P11, [ 'OpPreIncExpr' ]
    $P11.'OpPreIncExpr'(__ARG_2, $P1, $P2)
    set $P10, $P11
    .return($P10)
  __label_7: # case
.annotate 'line', 6101
    new $P13, [ 'OpPreDecExpr' ]
    $P13.'OpPreDecExpr'(__ARG_2, $P1, $P2)
    set $P12, $P13
    .return($P12)
  __label_8: # case
.annotate 'line', 6103
    new $P15, [ 'OpDeleteExpr' ]
    $P15.'OpDeleteExpr'(__ARG_2, $P1, $P2)
    set $P14, $P15
    .return($P14)
  __label_9: # case
.annotate 'line', 6105
    new $P17, [ 'OpExistsExpr' ]
    $P17.'OpExistsExpr'(__ARG_2, $P1, $P2)
    set $P16, $P17
    .return($P16)
  __label_3: # default
.annotate 'line', 6107
    'InternalError'('Invalid code in parseExpr_4', $P1)
  __label_2: # switch end
# }
    goto __label_1
  __label_0: # else
# {
.annotate 'line', 6111
    __ARG_1.'unget'($P1)
.annotate 'line', 6112
    .tailcall $P4(__ARG_1, __ARG_2)
# }
  __label_1: # endif
# }
.annotate 'line', 6114

.end # parseExpr_4


.sub 'parseExpr_5'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6118
.const 'Sub' $P4 = 'parseExpr_4'
.const 'Sub' $P5 = 'getOpCode_5'
.annotate 'line', 6120
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6121
# var t: $P2
    null $P2
.annotate 'line', 6122
# code: $I1
    null $I1
  __label_1: # while
.annotate 'line', 6123
    $P2 = __ARG_1.'get'()
    $P6 = $P5($P2)
    set $I1, $P6
    eq $I1, 0, __label_0
# {
.annotate 'line', 6124
# var rexpr: $P3
    $P3 = $P4(__ARG_1, __ARG_2)
# switch
.annotate 'line', 6125
    set $I2, $I1
    set $I3, 19
    if $I2 == $I3 goto __label_4
    set $I3, 20
    if $I2 == $I3 goto __label_5
    set $I3, 21
    if $I2 == $I3 goto __label_6
    set $I3, 22
    if $I2 == $I3 goto __label_7
    goto __label_3
  __label_4: # case
.annotate 'line', 6127
    new $P6, [ 'OpMulExpr' ]
    $P6.'OpMulExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P6
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 6130
    new $P7, [ 'OpDivExpr' ]
    $P7.'OpDivExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P7
    goto __label_2 # break
  __label_6: # case
.annotate 'line', 6133
    new $P8, [ 'OpModExpr' ]
    $P8.'OpModExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P8
    goto __label_2 # break
  __label_7: # case
.annotate 'line', 6136
    new $P9, [ 'OpCModExpr' ]
    $P9.'OpCModExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P9
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 6139
    'InternalError'('Invalid code in parseExpr_5', $P2)
  __label_2: # switch end
# }
    goto __label_1
  __label_0: # endwhile
.annotate 'line', 6142
    __ARG_1.'unget'($P2)
.annotate 'line', 6143
    .return($P1)
# }
.annotate 'line', 6144

.end # parseExpr_5


.sub 'parseExpr_6'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6148
.const 'Sub' $P5 = 'parseExpr_5'
.annotate 'line', 6150
# var lexpr: $P1
    $P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6151
# var t: $P2
    null $P2
  __label_1: # while
.annotate 'line', 6152
    $P2 = __ARG_1.'get'()
    $I1 = $P2.'isop'('+')
    if $I1 goto __label_2
    $I1 = $P2.'isop'('-')
  __label_2:
    unless $I1 goto __label_0
# {
.annotate 'line', 6153
# var rexpr: $P3
    $P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6154
# var expr: $P4
    null $P4
.annotate 'line', 6155
    $P6 = $P2.'isop'('+')
    if_null $P6, __label_3
    unless $P6 goto __label_3
.annotate 'line', 6156
    new $P7, [ 'OpAddExpr' ]
    $P7.'OpAddExpr'(__ARG_2, $P2, $P1, $P3)
    set $P4, $P7
    goto __label_4
  __label_3: # else
.annotate 'line', 6158
    new $P8, [ 'OpSubExpr' ]
    $P8.'OpSubExpr'(__ARG_2, $P2, $P1, $P3)
    set $P4, $P8
  __label_4: # endif
.annotate 'line', 6159
    set $P1, $P4
# }
    goto __label_1
  __label_0: # endwhile
.annotate 'line', 6161
    __ARG_1.'unget'($P2)
.annotate 'line', 6162
    .return($P1)
# }
.annotate 'line', 6163

.end # parseExpr_6


.sub 'parseExpr_7'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6167
.const 'Sub' $P4 = 'parseExpr_6'
.annotate 'line', 6169
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6170
# var rexpr: $P2
    null $P2
.annotate 'line', 6171
# var t: $P3
    null $P3
.annotate 'line', 6172
# code: $I1
    null $I1
  __label_1: # while
.annotate 'line', 6173
    $P3 = __ARG_1.'get'()
    $P5 = 'getOpCode_7'($P3)
    set $I1, $P5
    eq $I1, 0, __label_0
# {
# switch
.annotate 'line', 6174
    set $I2, $I1
    set $I3, 28
    if $I2 == $I3 goto __label_4
    set $I3, 29
    if $I2 == $I3 goto __label_5
    goto __label_3
  __label_4: # case
.annotate 'line', 6176
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6177
    new $P6, [ 'OpShiftleftExpr' ]
    $P6.'OpShiftleftExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P6
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 6180
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6181
    new $P7, [ 'OpShiftrightExpr' ]
    $P7.'OpShiftrightExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P7
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 6184
    'InternalError'('Invalid code in parseExpr_7', $P3)
  __label_2: # switch end
# }
    goto __label_1
  __label_0: # endwhile
.annotate 'line', 6187
    __ARG_1.'unget'($P3)
.annotate 'line', 6188
    .return($P1)
# }
.annotate 'line', 6189

.end # parseExpr_7


.sub 'parseExpr_8'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6193
.const 'Sub' $P4 = 'parseExpr_7'
.const 'Sub' $P5 = 'getOpCode_8'
.annotate 'line', 6195
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6196
# var rexpr: $P2
    null $P2
.annotate 'line', 6197
# var t: $P3
    null $P3
.annotate 'line', 6198
# code: $I1
    null $I1
  __label_1: # while
.annotate 'line', 6199
    $P3 = __ARG_1.'get'()
    $P6 = $P5($P3)
    set $I1, $P6
    eq $I1, 0, __label_0
# {
# switch
.annotate 'line', 6200
    set $I2, $I1
    set $I3, 14
    if $I2 == $I3 goto __label_4
    set $I3, 16
    if $I2 == $I3 goto __label_5
    set $I3, 15
    if $I2 == $I3 goto __label_6
    set $I3, 17
    if $I2 == $I3 goto __label_7
    set $I3, 27
    if $I2 == $I3 goto __label_8
    goto __label_3
  __label_4: # case
.annotate 'line', 6202
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6203
    new $P7, [ 'OpLessExpr' ]
    $P1 = $P7.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 6206
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6207
    new $P8, [ 'OpGreaterExpr' ]
    $P1 = $P8.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_2 # break
  __label_6: # case
.annotate 'line', 6210
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6211
    new $P9, [ 'OpLessEqualExpr' ]
    $P1 = $P9.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_2 # break
  __label_7: # case
.annotate 'line', 6214
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6215
    new $P10, [ 'OpGreaterEqualExpr' ]
    $P1 = $P10.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_2 # break
  __label_8: # case
.annotate 'line', 6218
    new $P11, [ 'OpInstanceOfExpr' ]
    $P11.'OpInstanceOfExpr'(__ARG_2, $P3, $P1, __ARG_1)
    set $P1, $P11
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 6221
    'InternalError'('Invalid code in parseExpr_9', $P3)
  __label_2: # switch end
# }
    goto __label_1
  __label_0: # endwhile
.annotate 'line', 6224
    __ARG_1.'unget'($P3)
.annotate 'line', 6225
    .return($P1)
# }
.annotate 'line', 6226

.end # parseExpr_8


.sub 'parseExpr_9'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6230
.const 'Sub' $P4 = 'parseExpr_8'
.const 'Sub' $P5 = 'getOpCode_9'
.annotate 'line', 6232
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6233
# var rexpr: $P2
    null $P2
.annotate 'line', 6234
# var t: $P3
    null $P3
.annotate 'line', 6235
# code: $I1
    null $I1
  __label_1: # while
.annotate 'line', 6236
    $P3 = __ARG_1.'get'()
    $P6 = $P5($P3)
    set $I1, $P6
    eq $I1, 0, __label_0
# {
# switch
.annotate 'line', 6237
    set $I2, $I1
    set $I3, 12
    if $I2 == $I3 goto __label_4
    set $I3, 13
    if $I2 == $I3 goto __label_5
    set $I3, 25
    if $I2 == $I3 goto __label_6
    set $I3, 26
    if $I2 == $I3 goto __label_7
    goto __label_3
  __label_4: # case
.annotate 'line', 6239
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6240
    new $P7, [ 'OpEqualExpr' ]
    $P1 = $P7.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 6243
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6244
    new $P8, [ 'OpNotEqualExpr' ]
    $P1 = $P8.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_2 # break
  __label_6: # case
.annotate 'line', 6247
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6248
    new $P9, [ 'OpSameExpr' ]
    $P9.'OpSameExpr'(1, __ARG_2, $P3, $P1, $P2)
    set $P1, $P9
    goto __label_2 # break
  __label_7: # case
.annotate 'line', 6251
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6252
    new $P10, [ 'OpSameExpr' ]
    $P10.'OpSameExpr'(0, __ARG_2, $P3, $P1, $P2)
    set $P1, $P10
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 6255
    'InternalError'('Invalid code in parseExpr_8', $P3)
  __label_2: # switch end
# }
    goto __label_1
  __label_0: # endwhile
.annotate 'line', 6258
    __ARG_1.'unget'($P3)
.annotate 'line', 6259
    .return($P1)
# }
.annotate 'line', 6260

.end # parseExpr_9


.sub 'parseExpr_10'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6264
.const 'Sub' $P4 = 'parseExpr_9'
.annotate 'line', 6266
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6267
# var t: $P2
    null $P2
  __label_1: # while
.annotate 'line', 6268
    $P2 = __ARG_1.'get'()
    $P5 = $P2.'isop'('&')
    if_null $P5, __label_0
    unless $P5 goto __label_0
# {
.annotate 'line', 6269
# var rexpr: $P3
    $P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6270
    new $P5, [ 'OpBinAndExpr' ]
    $P5.'OpBinAndExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P5
# }
    goto __label_1
  __label_0: # endwhile
.annotate 'line', 6272
    __ARG_1.'unget'($P2)
.annotate 'line', 6273
    .return($P1)
# }
.annotate 'line', 6274

.end # parseExpr_10


.sub 'parseExpr_11'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6278
.const 'Sub' $P4 = 'parseExpr_10'
.annotate 'line', 6280
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6281
# var t: $P2
    null $P2
  __label_1: # while
.annotate 'line', 6282
    $P2 = __ARG_1.'get'()
    $P5 = $P2.'isop'('^')
    if_null $P5, __label_0
    unless $P5 goto __label_0
# {
.annotate 'line', 6283
# var rexpr: $P3
    $P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6284
    new $P5, [ 'OpBinXorExpr' ]
    $P5.'OpBinXorExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P5
# }
    goto __label_1
  __label_0: # endwhile
.annotate 'line', 6286
    __ARG_1.'unget'($P2)
.annotate 'line', 6287
    .return($P1)
# }
.annotate 'line', 6288

.end # parseExpr_11


.sub 'parseExpr_12'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6292
.const 'Sub' $P4 = 'parseExpr_11'
.annotate 'line', 6294
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6295
# var t: $P2
    null $P2
  __label_1: # while
.annotate 'line', 6296
    $P2 = __ARG_1.'get'()
    $P5 = $P2.'isop'('|')
    if_null $P5, __label_0
    unless $P5 goto __label_0
# {
.annotate 'line', 6297
# var rexpr: $P3
    $P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6298
    new $P5, [ 'OpBinOrExpr' ]
    $P5.'OpBinOrExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P5
# }
    goto __label_1
  __label_0: # endwhile
.annotate 'line', 6300
    __ARG_1.'unget'($P2)
.annotate 'line', 6301
    .return($P1)
# }
.annotate 'line', 6302

.end # parseExpr_12


.sub 'parseExpr_13'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6306
.const 'Sub' $P4 = 'parseExpr_12'
.annotate 'line', 6308
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6309
# var t: $P2
    null $P2
  __label_1: # while
.annotate 'line', 6310
    $P2 = __ARG_1.'get'()
    $P5 = $P2.'isop'('&&')
    if_null $P5, __label_0
    unless $P5 goto __label_0
# {
.annotate 'line', 6311
# var rexpr: $P3
    $P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6312
    new $P5, [ 'OpBoolAndExpr' ]
    $P5.'OpBoolAndExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P5
# }
    goto __label_1
  __label_0: # endwhile
.annotate 'line', 6314
    __ARG_1.'unget'($P2)
.annotate 'line', 6315
    .return($P1)
# }
.annotate 'line', 6316

.end # parseExpr_13


.sub 'parseExpr_14'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6320
.const 'Sub' $P4 = 'parseExpr_13'
.annotate 'line', 6322
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6323
# var t: $P2
    null $P2
  __label_1: # while
.annotate 'line', 6324
    $P2 = __ARG_1.'get'()
    $P5 = $P2.'isop'('||')
    if_null $P5, __label_0
    unless $P5 goto __label_0
# {
.annotate 'line', 6325
# var rexpr: $P3
    $P3 = 'parseExpr_12'(__ARG_1, __ARG_2)
.annotate 'line', 6326
    new $P5, [ 'OpBoolOrExpr' ]
    $P5.'OpBoolOrExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P5
# }
    goto __label_1
  __label_0: # endwhile
.annotate 'line', 6328
    __ARG_1.'unget'($P2)
.annotate 'line', 6329
    .return($P1)
# }
.annotate 'line', 6330

.end # parseExpr_14


.sub 'parseExpr_15'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6334
.const 'Sub' $P5 = 'parseExpr_16'
.const 'Sub' $P6 = 'parseExpr_14'
.annotate 'line', 6336
# var econd: $P1
    $P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 6337
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 6338
    $P7 = $P2.'isop'('?')
    if_null $P7, __label_0
    unless $P7 goto __label_0
# {
.annotate 'line', 6339
# var etrue: $P3
    $P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6340
    'ExpectOp'(':', __ARG_1)
.annotate 'line', 6341
# var efalse: $P4
    $P4 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6342
    new $P8, [ 'OpConditionalExpr' ]
    $P8.'OpConditionalExpr'(__ARG_2, $P2, $P1, $P3, $P4)
    set $P7, $P8
    .return($P7)
# }
    goto __label_1
  __label_0: # else
# {
.annotate 'line', 6345
    __ARG_1.'unget'($P2)
.annotate 'line', 6346
    .return($P1)
# }
  __label_1: # endif
# }
.annotate 'line', 6348

.end # parseExpr_15


.sub 'parseExpr_16'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6352
.const 'Sub' $P5 = 'parseExpr_16'
.const 'Sub' $P6 = 'parseExpr_15'
.const 'Sub' $P7 = 'getOpCode_16'
.annotate 'line', 6354
# var lexpr: $P1
    $P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 6355
# var t: $P2
    null $P2
.annotate 'line', 6356
# code: $I1
    null $I1
  __label_1: # while
.annotate 'line', 6357
    $P2 = __ARG_1.'get'()
    $P8 = $P7($P2)
    set $I1, $P8
    eq $I1, 0, __label_0
# {
.annotate 'line', 6358
# var rexpr: $P3
    $P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6359
# var expr: $P4
    null $P4
# switch
.annotate 'line', 6360
    set $I2, $I1
    set $I3, 4
    if $I2 == $I3 goto __label_4
    set $I3, 5
    if $I2 == $I3 goto __label_5
    set $I3, 6
    if $I2 == $I3 goto __label_6
    set $I3, 18
    if $I2 == $I3 goto __label_7
    set $I3, 23
    if $I2 == $I3 goto __label_8
    set $I3, 24
    if $I2 == $I3 goto __label_9
    set $I3, 30
    if $I2 == $I3 goto __label_10
    goto __label_3
  __label_4: # case
.annotate 'line', 6362
    new $P4, [ 'OpAssignExpr' ]
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 6365
    new $P4, [ 'OpAssignToExpr' ]
    goto __label_2 # break
  __label_6: # case
.annotate 'line', 6368
    new $P4, [ 'OpAddToExpr' ]
    goto __label_2 # break
  __label_7: # case
.annotate 'line', 6371
    new $P4, [ 'OpSubToExpr' ]
    goto __label_2 # break
  __label_8: # case
.annotate 'line', 6374
    new $P4, [ 'OpMulToExpr' ]
    goto __label_2 # break
  __label_9: # case
.annotate 'line', 6377
    new $P4, [ 'OpDivToExpr' ]
    goto __label_2 # break
  __label_10: # case
.annotate 'line', 6380
    new $P4, [ 'OpModToExpr' ]
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 6383
    'InternalError'('Unexpected code in parseExpr_16', $P2)
  __label_2: # switch end
.annotate 'line', 6385
    $P4.'set'(__ARG_2, $P2, $P1, $P3)
.annotate 'line', 6386
    set $P1, $P4
# }
    goto __label_1
  __label_0: # endwhile
.annotate 'line', 6388
    __ARG_1.'unget'($P2)
.annotate 'line', 6389
    .return($P1)
# }
.annotate 'line', 6390

.end # parseExpr_16


.sub 'parseExpr'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6394
.const 'Sub' $P1 = 'parseExpr_16'
.annotate 'line', 6396
    .tailcall $P1(__ARG_1, __ARG_2)
# }
.annotate 'line', 6397

.end # parseExpr

.namespace [ 'Breakable' ]

.sub 'genbreaklabel' :method
# Body
# {
.annotate 'line', 6412
    getattribute $P1, self, 'brlabel'
    if_null $P1, __label_0
.annotate 'line', 6413
    'InternalError'('attempt to generate break label twice')
  __label_0: # endif
.annotate 'line', 6414
# label: $S1
    $P1 = self.'genlabel'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6415
    box $P1, $S1
    setattribute self, 'brlabel', $P1
.annotate 'line', 6416
    .return($S1)
# }
.annotate 'line', 6417

.end # genbreaklabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6420
# var label: $P1
    getattribute $P1, self, 'brlabel'
.annotate 'line', 6421
    unless_null $P1, __label_0
.annotate 'line', 6422
    'InternalError'('attempt to get break label before creating it')
  __label_0: # endif
.annotate 'line', 6423
    .return($P1)
# }
.annotate 'line', 6424

.end # getbreaklabel

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Breakable' ]
.annotate 'line', 6408
    addattribute $P0, 'brlabel'
.end
.namespace [ 'Continuable' ]

.sub 'gencontinuelabel' :method
# Body
# {
.annotate 'line', 6433
    getattribute $P1, self, 'cntlabel'
    if_null $P1, __label_0
.annotate 'line', 6434
    'InternalError'('attempt to generate continue label twice')
  __label_0: # endif
.annotate 'line', 6435
# label: $S1
    $P1 = self.'genlabel'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6436
    box $P1, $S1
    setattribute self, 'cntlabel', $P1
.annotate 'line', 6437
    .return($S1)
# }
.annotate 'line', 6438

.end # gencontinuelabel


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6441
# var label: $P1
    getattribute $P1, self, 'cntlabel'
.annotate 'line', 6442
    unless_null $P1, __label_0
.annotate 'line', 6443
    'InternalError'('attempt to get continue label before creating it')
  __label_0: # endif
.annotate 'line', 6444
    .return($P1)
# }
.annotate 'line', 6445

.end # getcontinuelabel

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Continuable' ]
.annotate 'line', 6427
    get_class $P1, [ 'Breakable' ]
    addparent $P0, $P1
.annotate 'line', 6429
    addattribute $P0, 'cntlabel'
.end
.namespace [ 'ReturnYieldStatement' ]

.sub 'parse' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6461
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6462
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6463
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_0
# {
.annotate 'line', 6464
    __ARG_2.'unget'($P1)
.annotate 'line', 6465
    new $P4, [ 'ArgumentList' ]
    $P4.'ArgumentList'(__ARG_3, __ARG_1, __ARG_2, ";")
    set $P3, $P4
    setattribute self, 'values', $P3
# }
  __label_0: # endif
# }
.annotate 'line', 6467

.end # parse


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6470
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 6471
    if_null $P1, __label_0
.annotate 'line', 6472
    $P1 = $P1.'optimize'()
  __label_0: # endif
.annotate 'line', 6473
    .return(self)
# }
.annotate 'line', 6474

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6478
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 6479
# n: $I1
    unless_null $P1, __label_1
    null $I1
    goto __label_0
  __label_1:
# predefined int
    $P3 = $P1.'numargs'()
    set $I1, $P3
  __label_0:
.annotate 'line', 6482
    iseq $I2, $I1, 1
    unless $I2 goto __label_3
    isa $I2, self, [ 'ReturnStatement' ]
  __label_3:
    unless $I2 goto __label_2
# {
.annotate 'line', 6483
# var func: $P2
    $P2 = $P1.'getfreearg'(0)
.annotate 'line', 6484
    $P3 = $P2.'cantailcall'()
    if_null $P3, __label_4
    unless $P3 goto __label_4
# {
.annotate 'line', 6485
    self.'annotate'(__ARG_1)
.annotate 'line', 6486
    .tailcall $P2.'emit'(__ARG_1, '.tailcall')
# }
  __label_4: # endif
# }
  __label_2: # endif
.annotate 'line', 6490
    le $I1, 0, __label_5
.annotate 'line', 6491
    $P1.'getargvalues'(__ARG_1)
  __label_5: # endif
.annotate 'line', 6493
    self.'annotate'(__ARG_1)
.annotate 'line', 6494
    self.'emitret'(__ARG_1)
.annotate 'line', 6495
    le $I1, 0, __label_6
.annotate 'line', 6496
    $P1.'emitargs'(__ARG_1)
  __label_6: # endif
.annotate 'line', 6497
    __ARG_1.'say'(')')
# }
.annotate 'line', 6498

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ReturnYieldStatement' ]
.annotate 'line', 6455
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 6457
    addattribute $P0, 'values'
.end
.namespace [ 'ReturnStatement' ]

.sub 'ReturnStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6505
    self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6506

.end # ReturnStatement


.sub 'emitret' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6509
    __ARG_1.'print'('    ', '.return(')
# }
.annotate 'line', 6510

.end # emitret

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ReturnStatement' ]
.annotate 'line', 6501
    get_class $P1, [ 'ReturnYieldStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'YieldStatement' ]

.sub 'YieldStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6517
    self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6518

.end # YieldStatement


.sub 'emitret' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6521
    __ARG_1.'print'('    ', '.yield(')
# }
.annotate 'line', 6522

.end # emitret

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'YieldStatement' ]
.annotate 'line', 6513
    get_class $P1, [ 'ReturnYieldStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'LabelStatement' ]

.sub 'LabelStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6535
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 6536
    setattribute self, 'name', __ARG_1
.annotate 'line', 6537
# value: $S1
    getattribute $P2, self, 'owner'
    $P1 = $P2.'createlabel'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 6538
    box $P1, $S1
    setattribute self, 'value', $P1
# }
.annotate 'line', 6539

.end # LabelStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6540
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6543
    self.'annotate'(__ARG_1)
.annotate 'line', 6544
# name: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 6545
# comment: $S2
    concat $S2, 'label ', $S1
.annotate 'line', 6546
    getattribute $P1, self, 'value'
    __ARG_1.'emitlabel'($P1, $S2)
# }
.annotate 'line', 6547

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'LabelStatement' ]
.annotate 'line', 6529
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 6531
    addattribute $P0, 'name'
.annotate 'line', 6532
    addattribute $P0, 'value'
.end
.namespace [ 'Reflabel' ]

.sub 'Reflabel' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 6561
    setattribute self, 'owner', __ARG_1
.annotate 'line', 6562
    box $P1, __ARG_2
    setattribute self, 'label', $P1
# }
.annotate 'line', 6563

.end # Reflabel


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6564
    .return(self)
# }

.end # optimize


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6567
# label: $S1
    getattribute $P1, self, 'label'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 6568
# value: $S2
    getattribute $P2, self, 'owner'
    $P1 = $P2.'getlabel'($S1)
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
  __label_1:
.annotate 'line', 6569
    .return($S2)
# }
.annotate 'line', 6570

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Reflabel' ]
.annotate 'line', 6556
    addattribute $P0, 'owner'
.annotate 'line', 6557
    addattribute $P0, 'label'
.end
.namespace [ 'GotoStatement' ]

.sub 'GotoStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6583
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6584
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6585
    'RequireIdentifier'($P1)
.annotate 'line', 6586
    setattribute self, 'label', $P1
.annotate 'line', 6587
    'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 6588

.end # GotoStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6589
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6592
    self.'annotate'(__ARG_1)
.annotate 'line', 6593
# label: $S1
    getattribute $P1, self, 'label'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 6594
# value: $S2
    $P1 = self.'getlabel'($S1)
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
  __label_1:
.annotate 'line', 6595
    concat $S3, 'goto ', $S1
    __ARG_1.'emitgoto'($S2, $S3)
# }
.annotate 'line', 6596

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'GotoStatement' ]
.annotate 'line', 6577
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 6579
    addattribute $P0, 'label'
.end
.namespace [ 'ConditionalStatement' ]

.sub 'parseconditionshort' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6607
    $P1 = 'parseExpr'(__ARG_1, self)
    self.'set'($P1)
# }
.annotate 'line', 6608

.end # parseconditionshort


.sub 'parsecondition' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6611
    'ExpectOp'('(', __ARG_1)
.annotate 'line', 6612
    $P1 = 'parseExpr'(__ARG_1, self)
    self.'set'($P1)
.annotate 'line', 6613
    'ExpectOp'(')', __ARG_1)
# }
.annotate 'line', 6614

.end # parsecondition

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ConditionalStatement' ]
.annotate 'line', 6603
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
    get_class $P2, [ 'Condition' ]
    addparent $P0, $P2
.end
.namespace [ 'IfStatement' ]

.sub 'IfStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6627
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6628
    self.'parsecondition'(__ARG_2)
.annotate 'line', 6629
    $P3 = 'parseStatement'(__ARG_2, self)
    setattribute self, 'truebranch', $P3
.annotate 'line', 6630
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6631
    $P2 = $P1.'iskeyword'("else")
    if_null $P2, __label_0
    unless $P2 goto __label_0
.annotate 'line', 6632
    $P4 = 'parseStatement'(__ARG_2, self)
    setattribute self, 'falsebranch', $P4
    goto __label_1
  __label_0: # else
# {
.annotate 'line', 6634
    new $P6, [ 'EmptyStatement' ]
    setattribute self, 'falsebranch', $P6
.annotate 'line', 6635
    __ARG_2.'unget'($P1)
# }
  __label_1: # endif
# }
.annotate 'line', 6637

.end # IfStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6640
    self.'optimize_condition'()
.annotate 'line', 6641
# checkvalue: $I1
    $P1 = self.'getvalue'()
    set $I1, $P1
.annotate 'line', 6642
    getattribute $P3, self, 'truebranch'
    $P2 = $P3.'optimize'()
    setattribute self, 'truebranch', $P2
.annotate 'line', 6643
    getattribute $P3, self, 'falsebranch'
    $P2 = $P3.'optimize'()
    setattribute self, 'falsebranch', $P2
# switch
.annotate 'line', 6644
    set $I2, $I1
    set $I3, 1
    if $I2 == $I3 goto __label_2
    set $I3, 2
    if $I2 == $I3 goto __label_3
    goto __label_1
  __label_2: # case
.annotate 'line', 6646
    getattribute $P1, self, 'truebranch'
    .return($P1)
  __label_3: # case
.annotate 'line', 6648
    getattribute $P2, self, 'falsebranch'
    .return($P2)
  __label_1: # default
  __label_0: # switch end
.annotate 'line', 6650
    .return(self)
# }
.annotate 'line', 6651

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6654
# var truebranch: $P1
    getattribute $P1, self, 'truebranch'
.annotate 'line', 6655
# var falsebranch: $P2
    getattribute $P2, self, 'falsebranch'
.annotate 'line', 6656
# t_empty: $I1
    $P3 = $P1.'isempty'()
    set $I1, $P3
.annotate 'line', 6657
# f_empty: $I2
    $P3 = $P2.'isempty'()
    set $I2, $P3
.annotate 'line', 6658
# elselabel: $S1
    set $S1, ''
.annotate 'line', 6659
    not $I3, $I2
    unless $I3 goto __label_0
.annotate 'line', 6660
    $P3 = self.'genlabel'()
    set $S1, $P3
  __label_0: # endif
.annotate 'line', 6661
# endlabel: $S2
    $P3 = self.'genlabel'()
    null $S2
    if_null $P3, __label_1
    set $S2, $P3
  __label_1:
.annotate 'line', 6662
# cond_false: $S3
    unless $I2 goto __label_3
    set $S3, $S2
    goto __label_2
  __label_3:
    set $S3, $S1
  __label_2:
.annotate 'line', 6663
    self.'annotate'(__ARG_1)
.annotate 'line', 6664
    self.'emit_else'(__ARG_1, $S3)
.annotate 'line', 6665
    $P1.'emit'(__ARG_1)
.annotate 'line', 6667
    not $I3, $I2
    unless $I3 goto __label_4
# {
.annotate 'line', 6668
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 6669
    __ARG_1.'emitlabel'($S1, 'else')
.annotate 'line', 6670
    $P2.'emit'(__ARG_1)
# }
  __label_4: # endif
.annotate 'line', 6672
    __ARG_1.'emitlabel'($S2, 'endif')
# }
.annotate 'line', 6673

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IfStatement' ]
.annotate 'line', 6621
    get_class $P1, [ 'ConditionalStatement' ]
    addparent $P0, $P1
.annotate 'line', 6623
    addattribute $P0, 'truebranch'
.annotate 'line', 6624
    addattribute $P0, 'falsebranch'
.end
.namespace [ 'LoopStatement' ]

.sub 'parsebody' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6685
    $P2 = 'parseStatement'(__ARG_1, self)
    setattribute self, 'body', $P2
# }
.annotate 'line', 6686

.end # parsebody


.sub 'emit_infinite' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6689
# breaklabel: $S1
    $P1 = self.'genbreaklabel'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 6690
# continuelabel: $S2
    $P1 = self.'gencontinuelabel'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
  __label_1:
.annotate 'line', 6692
    self.'annotate'(__ARG_1)
.annotate 'line', 6693
    __ARG_1.'emitlabel'($S2, 'Infinite loop')
.annotate 'line', 6694
    getattribute $P1, self, 'body'
    $P1.'emit'(__ARG_1)
.annotate 'line', 6695
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 6696
    __ARG_1.'emitlabel'($S1, 'Infinite loop end')
# }
.annotate 'line', 6697

.end # emit_infinite

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'LoopStatement' ]
.annotate 'line', 6680
    get_class $P1, [ 'Continuable' ]
    addparent $P0, $P1
.annotate 'line', 6682
    addattribute $P0, 'body'
.end
.namespace [ 'WhileStatement' ]

.sub 'WhileStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6708
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6709
    self.'parsecondition'(__ARG_2)
.annotate 'line', 6710
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 6711

.end # WhileStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6714
    self.'optimize_condition'()
.annotate 'line', 6715
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 6716
    .return(self)
# }
.annotate 'line', 6717

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6720
    $P1 = self.'getvalue'()
    set $I1, $P1
    set $I2, 1
    if $I1 == $I2 goto __label_2
    set $I2, 2
    if $I1 == $I2 goto __label_3
    goto __label_1
  __label_2: # case
.annotate 'line', 6722
    self.'emit_infinite'(__ARG_1)
    goto __label_0 # break
  __label_3: # case
.annotate 'line', 6725
    __ARG_1.'comment'('while(false) optimized out')
    goto __label_0 # break
  __label_1: # default
.annotate 'line', 6728
# breaklabel: $S1
    $P2 = self.'genbreaklabel'()
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
.annotate 'line', 6729
# continuelabel: $S2
    $P3 = self.'gencontinuelabel'()
    null $S2
    if_null $P3, __label_5
    set $S2, $P3
  __label_5:
.annotate 'line', 6731
    self.'annotate'(__ARG_1)
.annotate 'line', 6732
    __ARG_1.'emitlabel'($S2, 'while')
.annotate 'line', 6733
    self.'emit_else'(__ARG_1, $S1)
.annotate 'line', 6734
    getattribute $P4, self, 'body'
    $P4.'emit'(__ARG_1)
.annotate 'line', 6735
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 6736
    __ARG_1.'emitlabel'($S1, 'endwhile')
  __label_0: # switch end
# }
.annotate 'line', 6738

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'WhileStatement' ]
.annotate 'line', 6704
    get_class $P1, [ 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'ConditionalStatement' ]
    addparent $P0, $P2
.end
.namespace [ 'DoStatement' ]

.sub 'DoStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6749
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6750
    self.'parsebody'(__ARG_2)
.annotate 'line', 6751
    'ExpectKeyword'('while', __ARG_2)
.annotate 'line', 6752
    self.'parsecondition'(__ARG_2)
# }
.annotate 'line', 6753

.end # DoStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6756
    self.'optimize_condition'()
.annotate 'line', 6757
# var body: $P1
    getattribute $P2, self, 'body'
    $P1 = $P2.'optimize'()
.annotate 'line', 6758
    $I1 = $P1.'isempty'()
    unless $I1 goto __label_1
    $P2 = self.'getvalue'()
    set $I2, $P2
    iseq $I1, $I2, 2
  __label_1:
    unless $I1 goto __label_0
.annotate 'line', 6759
    new $P3, [ 'EmptyStatement' ]
    .return($P3)
  __label_0: # endif
.annotate 'line', 6760
    setattribute self, 'body', $P1
.annotate 'line', 6761
    .return(self)
# }
.annotate 'line', 6762

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6765
# var body: $P1
    getattribute $P1, self, 'body'
.annotate 'line', 6766
# condvalue: $I1
    $P2 = self.'getvalue'()
    set $I1, $P2
# switch
.annotate 'line', 6767
    set $I2, $I1
    set $I3, 1
    if $I2 == $I3 goto __label_2
    goto __label_1
  __label_2: # case
.annotate 'line', 6769
    self.'emit_infinite'(__ARG_1)
    goto __label_0 # break
  __label_1: # default
.annotate 'line', 6772
# looplabel: $S1
    $P2 = self.'genlabel'()
    null $S1
    if_null $P2, __label_3
    set $S1, $P2
  __label_3:
.annotate 'line', 6773
# breaklabel: $S2
    $P3 = self.'genbreaklabel'()
    null $S2
    if_null $P3, __label_4
    set $S2, $P3
  __label_4:
.annotate 'line', 6774
# continuelabel: $S3
    $P4 = self.'gencontinuelabel'()
    null $S3
    if_null $P4, __label_5
    set $S3, $P4
  __label_5:
.annotate 'line', 6776
    self.'annotate'(__ARG_1)
.annotate 'line', 6777
    __ARG_1.'emitlabel'($S1, 'do')
.annotate 'line', 6779
    $P1.'emit'(__ARG_1)
.annotate 'line', 6780
    __ARG_1.'emitlabel'($S3, 'continue')
.annotate 'line', 6781
    eq $I1, 2, __label_6
.annotate 'line', 6782
    self.'emit_if'(__ARG_1, $S1, $S2)
  __label_6: # endif
.annotate 'line', 6783
    __ARG_1.'emitlabel'($S2, 'enddo')
  __label_0: # switch end
# }
.annotate 'line', 6785

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'DoStatement' ]
.annotate 'line', 6745
    get_class $P1, [ 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'ConditionalStatement' ]
    addparent $P0, $P2
.end
.namespace [ 'ContinueStatement' ]

.sub 'ContinueStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6796
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6797
    'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 6798

.end # ContinueStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6799
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6802
    self.'annotate'(__ARG_1)
.annotate 'line', 6803
# label: $S1
    getattribute $P2, self, 'start'
    $P1 = self.'getcontinuelabel'($P2)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 6804
    __ARG_1.'emitgoto'($S1, 'continue')
# }
.annotate 'line', 6805

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ContinueStatement' ]
.annotate 'line', 6792
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'BreakStatement' ]

.sub 'BreakStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6816
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6817
    'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 6818

.end # BreakStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6819
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6822
    self.'annotate'(__ARG_1)
.annotate 'line', 6823
# label: $S1
    getattribute $P2, self, 'start'
    $P1 = self.'getbreaklabel'($P2)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 6824
    __ARG_1.'emitgoto'($S1, 'break')
# }
.annotate 'line', 6825

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'BreakStatement' ]
.annotate 'line', 6812
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'SwitchBaseStatement' ]

.sub 'SwitchBaseStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6840
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 6841
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'case_value', $P2
.annotate 'line', 6842
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'case_st', $P2
.annotate 'line', 6843
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'default_st', $P2
# }
.annotate 'line', 6844

.end # SwitchBaseStatement


.sub 'parse_cases' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6847
# var t: $P1
    null $P1
  __label_1: # while
.annotate 'line', 6848
    $P1 = __ARG_1.'get'()
    $I1 = $P1.'iskeyword'('case')
    if $I1 goto __label_2
    $I1 = $P1.'iskeyword'('default')
  __label_2:
    unless $I1 goto __label_0
# {
.annotate 'line', 6849
    $P3 = $P1.'iskeyword'('case')
    if_null $P3, __label_3
    unless $P3 goto __label_3
# {
.annotate 'line', 6850
    getattribute $P4, self, 'case_value'
    $P5 = 'parseExpr'(__ARG_1, self)
# predefined push
    push $P4, $P5
.annotate 'line', 6851
    $P1 = __ARG_1.'get'()
.annotate 'line', 6852
    $P3 = $P1.'isop'(':')
    isfalse $I1, $P3
    unless $I1 goto __label_5
.annotate 'line', 6853
    'Expected'("':' in case", $P1)
  __label_5: # endif
.annotate 'line', 6854
# var st: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
  __label_7: # while
.annotate 'line', 6855
    $P1 = __ARG_1.'get'()
    $I2 = $P1.'isop'('}')
    if $I2 goto __label_9
    $I2 = $P1.'iskeyword'('case')
  __label_9:
    if $I2 goto __label_8
    $I2 = $P1.'iskeyword'('default')
  __label_8:
    not $I1, $I2
    unless $I1 goto __label_6
# {
.annotate 'line', 6856
    __ARG_1.'unget'($P1)
.annotate 'line', 6857
    $P3 = 'parseStatement'(__ARG_1, self)
# predefined push
    push $P2, $P3
# }
    goto __label_7
  __label_6: # endwhile
.annotate 'line', 6859
    getattribute $P3, self, 'case_st'
# predefined push
    push $P3, $P2
.annotate 'line', 6860
    __ARG_1.'unget'($P1)
# }
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 6863
    $P1 = __ARG_1.'get'()
.annotate 'line', 6864
    $P3 = $P1.'isop'(':')
    isfalse $I1, $P3
    unless $I1 goto __label_10
.annotate 'line', 6865
    'Expected'("':' in default", $P1)
  __label_10: # endif
  __label_12: # while
.annotate 'line', 6866
    $P1 = __ARG_1.'get'()
    $I2 = $P1.'isop'('}')
    if $I2 goto __label_14
    $I2 = $P1.'iskeyword'('case')
  __label_14:
    if $I2 goto __label_13
    $I2 = $P1.'iskeyword'('default')
  __label_13:
    not $I1, $I2
    unless $I1 goto __label_11
# {
.annotate 'line', 6867
    __ARG_1.'unget'($P1)
.annotate 'line', 6868
    getattribute $P3, self, 'default_st'
    $P4 = 'parseStatement'(__ARG_1, self)
# predefined push
    push $P3, $P4
# }
    goto __label_12
  __label_11: # endwhile
.annotate 'line', 6870
    __ARG_1.'unget'($P1)
# }
  __label_4: # endif
# }
    goto __label_1
  __label_0: # endwhile
.annotate 'line', 6873
    $P3 = $P1.'isop'('}')
    isfalse $I1, $P3
    unless $I1 goto __label_15
.annotate 'line', 6874
    'Expected'("'}' in switch", $P1)
  __label_15: # endif
# }
.annotate 'line', 6875

.end # parse_cases


.sub 'optimize_cases' :method
# Body
# {
.annotate 'line', 6878
    getattribute $P2, self, 'case_value'
    'optimize_array'($P2)
.annotate 'line', 6879
    getattribute $P2, self, 'case_st'
    iter $P3, $P2
    set $P3, 0
  __label_0: # for iteration
    unless $P3 goto __label_1
    shift $P1, $P3
.annotate 'line', 6880
    'optimize_array'($P1)
    goto __label_0
  __label_1: # endfor
.annotate 'line', 6881
    getattribute $P2, self, 'default_st'
    'optimize_array'($P2)
# }
.annotate 'line', 6882

.end # optimize_cases

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'SwitchBaseStatement' ]
.annotate 'line', 6832
    get_class $P1, [ 'Breakable' ]
    addparent $P0, $P1
    get_class $P2, [ 'Statement' ]
    addparent $P0, $P2
.annotate 'line', 6834
    addattribute $P0, 'case_value'
.annotate 'line', 6835
    addattribute $P0, 'case_st'
.annotate 'line', 6836
    addattribute $P0, 'default_st'
.end
.namespace [ 'SwitchStatement' ]

.sub 'SwitchStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6895
    self.'SwitchBaseStatement'(__ARG_1, __ARG_3)
.annotate 'line', 6896
    $P3 = 'parseExpr'(__ARG_2, self)
    setattribute self, 'condition', $P3
.annotate 'line', 6897
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6898
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_0
.annotate 'line', 6899
    'Expected'("')' in switch", $P1)
  __label_0: # endif
.annotate 'line', 6900
    $P1 = __ARG_2.'get'()
.annotate 'line', 6901
    $P2 = $P1.'isop'('{')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 6902
    'Expected'("'{' in switch", $P1)
  __label_1: # endif
.annotate 'line', 6903
    self.'parse_cases'(__ARG_2)
# }
.annotate 'line', 6904

.end # SwitchStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6907
    getattribute $P3, self, 'condition'
    $P2 = $P3.'optimize'()
    setattribute self, 'condition', $P2
.annotate 'line', 6908
    self.'optimize_cases'()
.annotate 'line', 6909
    .return(self)
# }
.annotate 'line', 6910

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6914
# type: $S1
    set $S1, ''
.annotate 'line', 6915
    getattribute $P10, self, 'case_value'
    iter $P11, $P10
    set $P11, 0
  __label_0: # for iteration
    unless $P11 goto __label_1
    shift $P1, $P11
# {
.annotate 'line', 6916
# t: $S2
    $P12 = $P1.'checkresult'()
    null $S2
    if_null $P12, __label_2
    set $S2, $P12
  __label_2:
.annotate 'line', 6917
    ne $S2, 'N', __label_3
.annotate 'line', 6918
    getattribute $P10, self, 'start'
    'SyntaxError'("Invalid type in case", $P10)
  __label_3: # endif
.annotate 'line', 6919
    ne $S1, '', __label_4
.annotate 'line', 6920
    set $S1, $S2
    goto __label_5
  __label_4: # else
.annotate 'line', 6921
    eq $S1, $S2, __label_6
.annotate 'line', 6922
    set $S1, 'P'
  __label_6: # endif
  __label_5: # endif
# }
    goto __label_0
  __label_1: # endfor
.annotate 'line', 6925
# var condition: $P2
    getattribute $P2, self, 'condition'
.annotate 'line', 6926
# var condtype: $P3
    $P3 = $P2.'checkresult'()
.annotate 'line', 6930
    ne $S1, '', __label_7
.annotate 'line', 6931
    set $S1, $P3
  __label_7: # endif
.annotate 'line', 6933
    __ARG_1.'comment'('switch')
.annotate 'line', 6934
# reg: $S3
    $P10 = self.'tempreg'($S1)
    null $S3
    if_null $P10, __label_8
    set $S3, $P10
  __label_8:
.annotate 'line', 6935
    set $S9, $P3
    ne $S9, $S1, __label_9
.annotate 'line', 6936
    $P2.'emit'(__ARG_1, $S3)
    goto __label_10
  __label_9: # else
# {
.annotate 'line', 6938
# regcond: $S4
    $P10 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P10, __label_11
    set $S4, $P10
  __label_11:
.annotate 'line', 6939
    __ARG_1.'emitset'($S3, $S4)
# }
  __label_10: # endif
.annotate 'line', 6943
    self.'genbreaklabel'()
.annotate 'line', 6944
# defaultlabel: $S5
    $P10 = self.'genlabel'()
    null $S5
    if_null $P10, __label_12
    set $S5, $P10
  __label_12:
.annotate 'line', 6945
    new $P4, ['ResizableStringArray']
.annotate 'line', 6946
# regval: $S6
    $P10 = self.'tempreg'($S1)
    null $S6
    if_null $P10, __label_13
    set $S6, $P10
  __label_13:
.annotate 'line', 6947
    getattribute $P10, self, 'case_value'
    iter $P13, $P10
    set $P13, 0
  __label_14: # for iteration
    unless $P13 goto __label_15
    shift $P5, $P13
# {
.annotate 'line', 6948
# label: $S7
    $P12 = self.'genlabel'()
    null $S7
    if_null $P12, __label_16
    set $S7, $P12
  __label_16:
.annotate 'line', 6949
# predefined push
    push $P4, $S7
.annotate 'line', 6950
    $P5.'emit'(__ARG_1, $S6)
.annotate 'line', 6951
    __ARG_1.'say'('    ', 'if ', $S3, ' == ', $S6, ' goto ', $S7)
# }
    goto __label_14
  __label_15: # endfor
.annotate 'line', 6953
    __ARG_1.'emitgoto'($S5)
.annotate 'line', 6956
    self.'annotate'(__ARG_1)
.annotate 'line', 6957
# var case_st: $P6
    getattribute $P6, self, 'case_st'
.annotate 'line', 6958
# n: $I1
    set $P10, $P6
    set $I1, $P10
# for loop
.annotate 'line', 6959
# i: $I2
    null $I2
  __label_19: # for condition
    ge $I2, $I1, __label_18
# {
.annotate 'line', 6960
# l: $S8
    $S8 = $P4[$I2]
.annotate 'line', 6961
    __ARG_1.'emitlabel'($S8, 'case')
.annotate 'line', 6962
# var casest: $P7
    $P7 = $P6[$I2]
.annotate 'line', 6963
    iter $P14, $P7
    set $P14, 0
  __label_20: # for iteration
    unless $P14 goto __label_21
    shift $P8, $P14
.annotate 'line', 6964
    $P8.'emit'(__ARG_1)
    goto __label_20
  __label_21: # endfor
# }
  __label_17: # for iteration
.annotate 'line', 6959
    inc $I2
    goto __label_19
  __label_18: # for end
.annotate 'line', 6967
    __ARG_1.'emitlabel'($S5, 'default')
.annotate 'line', 6968
    getattribute $P10, self, 'default_st'
    iter $P15, $P10
    set $P15, 0
  __label_22: # for iteration
    unless $P15 goto __label_23
    shift $P9, $P15
.annotate 'line', 6969
    $P9.'emit'(__ARG_1)
    goto __label_22
  __label_23: # endfor
.annotate 'line', 6971
    getattribute $P12, self, 'start'
    $P10 = self.'getbreaklabel'($P12)
    __ARG_1.'emitlabel'($P10, 'switch end')
# }
.annotate 'line', 6972

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'SwitchStatement' ]
.annotate 'line', 6889
    get_class $P1, [ 'SwitchBaseStatement' ]
    addparent $P0, $P1
.annotate 'line', 6891
    addattribute $P0, 'condition'
.end
.namespace [ 'SwitchCaseStatement' ]

.sub 'SwitchCaseStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6984
    self.'SwitchBaseStatement'(__ARG_1, __ARG_3)
.annotate 'line', 6985
    self.'parse_cases'(__ARG_2)
# }
.annotate 'line', 6986

.end # SwitchCaseStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6989
    self.'optimize_cases'()
.annotate 'line', 6990
    .return(self)
# }
.annotate 'line', 6991

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6995
    self.'genbreaklabel'()
.annotate 'line', 6996
# defaultlabel: $S1
    $P7 = self.'genlabel'()
    null $S1
    if_null $P7, __label_0
    set $S1, $P7
  __label_0:
.annotate 'line', 6997
    new $P1, ['ResizableStringArray']
.annotate 'line', 6999
    __ARG_1.'comment'('switch-case')
.annotate 'line', 7000
# reg: $S2
    $P7 = self.'tempreg'('I')
    null $S2
    if_null $P7, __label_1
    set $S2, $P7
  __label_1:
.annotate 'line', 7001
    getattribute $P7, self, 'case_value'
    iter $P8, $P7
    set $P8, 0
  __label_2: # for iteration
    unless $P8 goto __label_3
    shift $P2, $P8
# {
.annotate 'line', 7002
# label: $S3
    $P9 = self.'genlabel'()
    null $S3
    if_null $P9, __label_4
    set $S3, $P9
  __label_4:
.annotate 'line', 7003
# predefined push
    push $P1, $S3
.annotate 'line', 7004
    $P2.'emit'(__ARG_1, $S2)
.annotate 'line', 7005
    __ARG_1.'say'('    ', 'if ', $S2, ' goto ', $S3)
# }
    goto __label_2
  __label_3: # endfor
.annotate 'line', 7007
    __ARG_1.'emitgoto'($S1)
.annotate 'line', 7010
    self.'annotate'(__ARG_1)
.annotate 'line', 7011
# var case_st: $P3
    getattribute $P3, self, 'case_st'
.annotate 'line', 7012
# n: $I1
    set $P7, $P3
    set $I1, $P7
# for loop
.annotate 'line', 7013
# i: $I2
    null $I2
  __label_7: # for condition
    ge $I2, $I1, __label_6
# {
.annotate 'line', 7014
# l: $S4
    $S4 = $P1[$I2]
.annotate 'line', 7015
    __ARG_1.'emitlabel'($S4, 'case')
.annotate 'line', 7016
# var casest: $P4
    $P4 = $P3[$I2]
.annotate 'line', 7017
    iter $P10, $P4
    set $P10, 0
  __label_8: # for iteration
    unless $P10 goto __label_9
    shift $P5, $P10
.annotate 'line', 7018
    $P5.'emit'(__ARG_1)
    goto __label_8
  __label_9: # endfor
# }
  __label_5: # for iteration
.annotate 'line', 7013
    inc $I2
    goto __label_7
  __label_6: # for end
.annotate 'line', 7021
    __ARG_1.'emitlabel'($S1, 'default')
.annotate 'line', 7022
    getattribute $P7, self, 'default_st'
    iter $P11, $P7
    set $P11, 0
  __label_10: # for iteration
    unless $P11 goto __label_11
    shift $P6, $P11
.annotate 'line', 7023
    $P6.'emit'(__ARG_1)
    goto __label_10
  __label_11: # endfor
.annotate 'line', 7025
    getattribute $P9, self, 'start'
    $P7 = self.'getbreaklabel'($P9)
    __ARG_1.'emitlabel'($P7, 'switch end')
# }
.annotate 'line', 7026

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'SwitchCaseStatement' ]
.annotate 'line', 6979
    get_class $P1, [ 'SwitchBaseStatement' ]
    addparent $P0, $P1
.end
.namespace [ ]

.sub 'parseSwitch'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7033
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7034
    $P2 = $P1.'isop'('(')
    if_null $P2, __label_0
    unless $P2 goto __label_0
.annotate 'line', 7035
    new $P4, [ 'SwitchStatement' ]
    $P4.'SwitchStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P3, $P4
    .return($P3)
  __label_0: # endif
.annotate 'line', 7036
    $P2 = $P1.'isop'('{')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 7037
    new $P4, [ 'SwitchCaseStatement' ]
    $P4.'SwitchCaseStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P3, $P4
    .return($P3)
  __label_1: # endif
.annotate 'line', 7038
    'Expected'("'(' in switch", $P1)
# }
.annotate 'line', 7039

.end # parseSwitch

.namespace [ 'ForStatement' ]

.sub 'ForStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7052
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7053
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7054
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_0
# {
.annotate 'line', 7055
    __ARG_2.'unget'($P1)
.annotate 'line', 7056
    $P3 = 'parseStatement'(__ARG_2, self)
    setattribute self, 'initializer', $P3
# }
  __label_0: # endif
.annotate 'line', 7058
    $P1 = __ARG_2.'get'()
.annotate 'line', 7059
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 7060
    __ARG_2.'unget'($P1)
.annotate 'line', 7061
    self.'parseconditionshort'(__ARG_2)
.annotate 'line', 7062
    'ExpectOp'(';', __ARG_2)
# }
  __label_1: # endif
.annotate 'line', 7064
    $P1 = __ARG_2.'get'()
.annotate 'line', 7065
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_2
# {
.annotate 'line', 7066
    __ARG_2.'unget'($P1)
.annotate 'line', 7067
    $P3 = 'parseExpr'(__ARG_2, self)
    setattribute self, 'iteration', $P3
.annotate 'line', 7068
    'ExpectOp'(')', __ARG_2)
# }
  __label_2: # endif
.annotate 'line', 7070
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 7071

.end # ForStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7074
    getattribute $P1, self, 'initializer'
    if_null $P1, __label_0
.annotate 'line', 7075
    getattribute $P4, self, 'initializer'
    $P3 = $P4.'optimize'()
    setattribute self, 'initializer', $P3
  __label_0: # endif
.annotate 'line', 7076
    getattribute $P1, self, 'condexpr'
    if_null $P1, __label_1
.annotate 'line', 7077
    self.'optimize_condition'()
  __label_1: # endif
.annotate 'line', 7078
    getattribute $P1, self, 'iteration'
    if_null $P1, __label_2
.annotate 'line', 7079
    getattribute $P4, self, 'iteration'
    $P3 = $P4.'optimize'()
    setattribute self, 'iteration', $P3
  __label_2: # endif
.annotate 'line', 7080
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 7081
    .return(self)
# }
.annotate 'line', 7082

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7085
    getattribute $P1, self, 'initializer'
    isnull $I1, $P1
    unless $I1 goto __label_2
.annotate 'line', 7086
    getattribute $P2, self, 'condexpr'
    isnull $I1, $P2
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 7087
    getattribute $P3, self, 'iteration'
    isnull $I1, $P3
  __label_1:
    unless $I1 goto __label_0
# {
.annotate 'line', 7088
    self.'emit_infinite'(__ARG_1)
.annotate 'line', 7089
    .return()
# }
  __label_0: # endif
.annotate 'line', 7091
    __ARG_1.'comment'('for loop')
.annotate 'line', 7092
# continuelabel: $S1
    $P1 = self.'gencontinuelabel'()
    null $S1
    if_null $P1, __label_3
    set $S1, $P1
  __label_3:
.annotate 'line', 7093
# breaklabel: $S2
    $P1 = self.'genbreaklabel'()
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 7094
# condlabel: $S3
    $P1 = self.'genlabel'()
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 7095
    getattribute $P1, self, 'initializer'
    if_null $P1, __label_6
.annotate 'line', 7096
    getattribute $P2, self, 'initializer'
    $P2.'emit'(__ARG_1)
  __label_6: # endif
.annotate 'line', 7098
    __ARG_1.'emitlabel'($S3, 'for condition')
.annotate 'line', 7099
    getattribute $P1, self, 'condexpr'
    if_null $P1, __label_7
.annotate 'line', 7100
    self.'emit_else'(__ARG_1, $S2)
  __label_7: # endif
.annotate 'line', 7102
    getattribute $P1, self, 'body'
    $P1.'emit'(__ARG_1)
.annotate 'line', 7103
    __ARG_1.'emitlabel'($S1, 'for iteration')
.annotate 'line', 7104
    getattribute $P1, self, 'iteration'
    if_null $P1, __label_8
.annotate 'line', 7105
# unused: $S4
    getattribute $P3, self, 'iteration'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S4
    if_null $P2, __label_9
    set $S4, $P2
  __label_9:
  __label_8: # endif
.annotate 'line', 7106
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 7108
    __ARG_1.'emitlabel'($S2, 'for end')
# }
.annotate 'line', 7109

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ForStatement' ]
.annotate 'line', 7045
    get_class $P1, [ 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'BlockStatement' ]
    addparent $P0, $P2
    get_class $P3, [ 'ConditionalStatement' ]
    addparent $P0, $P3
.annotate 'line', 7047
    addattribute $P0, 'initializer'
.annotate 'line', 7048
    addattribute $P0, 'iteration'
.end
.namespace [ 'ForeachStatement' ]

.sub 'ForeachStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param string __ARG_5
# Body
# {
.annotate 'line', 7124
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7125
# sname: $S1
    set $P1, __ARG_4
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 7126
    eq __ARG_5, '', __label_1
# {
.annotate 'line', 7127
# deftype: $S2
    $P1 = 'typetoregcheck'(__ARG_5)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 7128
    self.'createvar'($S1, $S2)
.annotate 'line', 7129
    box $P1, $S2
    setattribute self, 'deftype', $P1
# }
  __label_1: # endif
.annotate 'line', 7131
    setattribute self, 'varname', __ARG_4
.annotate 'line', 7132
    $P2 = 'parseExpr'(__ARG_2, self)
    setattribute self, 'container', $P2
.annotate 'line', 7133
    'ExpectOp'(')', __ARG_2)
.annotate 'line', 7134
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 7135

.end # ForeachStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7138
    getattribute $P3, self, 'container'
    $P2 = $P3.'optimize'()
    setattribute self, 'container', $P2
.annotate 'line', 7139
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 7140
    .return(self)
# }
.annotate 'line', 7141

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7144
    self.'annotate'(__ARG_1)
.annotate 'line', 7145
# regcont: $S1
    null $S1
.annotate 'line', 7146
    getattribute $P3, self, 'container'
    $P2 = $P3.'checkresult'()
    set $S6, $P2
    ne $S6, 'S', __label_0
# {
.annotate 'line', 7147
# value: $S2
    getattribute $P5, self, 'container'
    $P4 = $P5.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 7148
    $P2 = self.'tempreg'('P')
    set $S1, $P2
.annotate 'line', 7149
    __ARG_1.'emitbox'($S1, $S2)
# }
    goto __label_1
  __label_0: # else
.annotate 'line', 7152
    getattribute $P3, self, 'container'
    $P2 = $P3.'emit_get'(__ARG_1)
    set $S1, $P2
  __label_1: # endif
.annotate 'line', 7153
# var itvar: $P1
    getattribute $P2, self, 'varname'
    $P1 = self.'getvar'($P2)
.annotate 'line', 7154
# iterator: $S3
    $P2 = self.'createreg'('P')
    null $S3
    if_null $P2, __label_3
    set $S3, $P2
  __label_3:
.annotate 'line', 7155
# continuelabel: $S4
    $P2 = self.'gencontinuelabel'()
    null $S4
    if_null $P2, __label_4
    set $S4, $P2
  __label_4:
.annotate 'line', 7156
# breaklabel: $S5
    $P2 = self.'genbreaklabel'()
    null $S5
    if_null $P2, __label_5
    set $S5, $P2
  __label_5:
.annotate 'line', 7157
    __ARG_1.'emitarg2'('iter', $S3, $S1)
.annotate 'line', 7158
    __ARG_1.'emitset'($S3, '0')
.annotate 'line', 7159
    __ARG_1.'emitlabel'($S4, 'for iteration')
.annotate 'line', 7160
    __ARG_1.'emitunless'($S3, $S5)
.annotate 'line', 7161
    $P2 = $P1.'getreg'()
    __ARG_1.'emitarg2'('shift', $P2, $S3)
.annotate 'line', 7162
    getattribute $P2, self, 'body'
    $P2.'emit'(__ARG_1)
.annotate 'line', 7163
    __ARG_1.'emitgoto'($S4)
.annotate 'line', 7164
    __ARG_1.'emitlabel'($S5, 'endfor')
# }
.annotate 'line', 7165

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ForeachStatement' ]
.annotate 'line', 7116
    get_class $P1, [ 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'BlockStatement' ]
    addparent $P0, $P2
.annotate 'line', 7118
    addattribute $P0, 'deftype'
.annotate 'line', 7119
    addattribute $P0, 'varname'
.annotate 'line', 7120
    addattribute $P0, 'container'
.end
.namespace [ ]

.sub 'parseFor'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7172
    'ExpectOp'('(', __ARG_2)
.annotate 'line', 7173
# var aux: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7174
# var in1: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 7175
    $P4 = $P2.'iskeyword'('in')
    if_null $P4, __label_0
    unless $P4 goto __label_0
.annotate 'line', 7176
    new $P6, [ 'ForeachStatement' ]
    $P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, '')
    set $P5, $P6
    .return($P5)
    goto __label_1
  __label_0: # else
# {
.annotate 'line', 7178
# var in2: $P3
    $P3 = __ARG_2.'get'()
.annotate 'line', 7179
    $P4 = $P3.'iskeyword'('in')
    if_null $P4, __label_2
    unless $P4 goto __label_2
.annotate 'line', 7180
    new $P6, [ 'ForeachStatement' ]
    $P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P2, $P1)
    set $P5, $P6
    .return($P5)
  __label_2: # endif
.annotate 'line', 7181
    __ARG_2.'unget'($P3)
.annotate 'line', 7182
    __ARG_2.'unget'($P2)
.annotate 'line', 7183
    __ARG_2.'unget'($P1)
# }
  __label_1: # endif
.annotate 'line', 7185
    new $P5, [ 'ForStatement' ]
    $P5.'ForStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 7186

.end # parseFor

.namespace [ 'ThrowStatement' ]

.sub 'ThrowStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7198
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7199
    $P2 = 'parseExpr'(__ARG_2, self)
    setattribute self, 'excep', $P2
# }
.annotate 'line', 7200

.end # ThrowStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7203
    getattribute $P3, self, 'excep'
    $P2 = $P3.'optimize'()
    setattribute self, 'excep', $P2
.annotate 'line', 7204
    .return(self)
# }
.annotate 'line', 7205

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7208
# var excep: $P1
    getattribute $P1, self, 'excep'
.annotate 'line', 7209
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
  __label_0:
.annotate 'line', 7210
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 7211
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    set $S3, 'P'
    if $S2 == $S3 goto __label_3
    set $S3, 'S'
    if $S2 == $S3 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 7213
    __ARG_1.'emitarg1'('throw', $S1)
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 7216
    __ARG_1.'emitarg1'('die', $S1)
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 7219
    getattribute $P3, self, 'start'
    'SyntaxError'("Invalid throw argument", $P3)
  __label_1: # switch end
# }
.annotate 'line', 7221

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ThrowStatement' ]
.annotate 'line', 7192
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7194
    addattribute $P0, 'excep'
.end
.namespace [ 'TryModifierList' ]

.sub 'TryModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7233
    setattribute self, 'start', __ARG_1
.annotate 'line', 7234
    self.'ModifierList'(__ARG_2, __ARG_3)
# }
.annotate 'line', 7235

.end # TryModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 7238
# var modiflist: $P1
    $P1 = self.'getlist'()
.annotate 'line', 7239
    iter $P6, $P1
    set $P6, 0
  __label_0: # for iteration
    unless $P6 goto __label_1
    shift $P2, $P6
# {
.annotate 'line', 7240
# modifname: $S1
    $P7 = $P2.'getname'()
    null $S1
    if_null $P7, __label_2
    set $S1, $P7
  __label_2:
.annotate 'line', 7241
# nargs: $I1
    $P7 = $P2.'numargs'()
    set $I1, $P7
# switch
.annotate 'line', 7242
    set $S3, $S1
    set $S4, 'min_severity'
    if $S3 == $S4 goto __label_5
    set $S4, 'max_severity'
    if $S3 == $S4 goto __label_6
    set $S4, 'handle_types'
    if $S3 == $S4 goto __label_7
    set $S4, 'handle_types_except'
    if $S3 == $S4 goto __label_8
    goto __label_4
  __label_5: # case
  __label_6: # case
.annotate 'line', 7245
    eq $I1, 1, __label_9
.annotate 'line', 7246
    getattribute $P7, self, 'start'
    'SyntaxError'('Wrong modifier args', $P7)
  __label_9: # endif
.annotate 'line', 7247
# var arg: $P3
    $P3 = $P2.'getarg'(0)
.annotate 'line', 7248
# argreg: $S2
    $P8 = $P3.'emit_get'(__ARG_1)
    null $S2
    if_null $P8, __label_10
    set $S2, $P8
  __label_10:
.annotate 'line', 7249
    __ARG_1.'say'('    ', __ARG_2, ".'", $S1, "'(", $S2, ")")
    goto __label_3 # break
  __label_7: # case
  __label_8: # case
.annotate 'line', 7253
    new $P4, ['ResizableStringArray']
# for loop
.annotate 'line', 7254
# i: $I2
    null $I2
  __label_13: # for condition
    ge $I2, $I1, __label_12
# {
.annotate 'line', 7255
# var arg: $P5
    $P5 = $P2.'getarg'($I2)
.annotate 'line', 7256
    $P7 = $P5.'emit_get'(__ARG_1)
# predefined push
    push $P4, $P7
# }
  __label_11: # for iteration
.annotate 'line', 7254
    inc $I2
    goto __label_13
  __label_12: # for end
.annotate 'line', 7259
# predefined join
    join $S3, ', ', $P4
.annotate 'line', 7258
    __ARG_1.'say'('    ', __ARG_2, ".'", $S1, "'(", $S3, ")")
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 7262
    concat $S4, "Modifier '", $S1
    concat $S4, $S4, "' not valid for try"
    getattribute $P7, self, 'start'
    'SyntaxError'($S4, $P7)
  __label_3: # switch end
# }
    goto __label_0
  __label_1: # endfor
# }
.annotate 'line', 7265

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TryModifierList' ]
.annotate 'line', 7228
    get_class $P1, [ 'ModifierList' ]
    addparent $P0, $P1
.annotate 'line', 7230
    addattribute $P0, 'start'
.end
.namespace [ 'TryStatement' ]

.sub 'TryStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7277
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7278
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7279
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_0
    unless $P2 goto __label_0
.annotate 'line', 7280
    new $P5, [ 'TryModifierList' ]
    $P5.'TryModifierList'($P1, __ARG_2, self)
    set $P4, $P5
    setattribute self, 'modifiers', $P4
    goto __label_1
  __label_0: # else
.annotate 'line', 7282
    __ARG_2.'unget'($P1)
  __label_1: # endif
.annotate 'line', 7284
    $P3 = 'parseStatement'(__ARG_2, self)
    setattribute self, 'stry', $P3
.annotate 'line', 7285
    $P1 = __ARG_2.'get'()
.annotate 'line', 7286
    $P2 = $P1.'iskeyword'('catch')
    isfalse $I1, $P2
    unless $I1 goto __label_2
.annotate 'line', 7287
    'ExpectedOp'('catch', $P1)
  __label_2: # endif
.annotate 'line', 7288
    $P1 = __ARG_2.'get'()
.annotate 'line', 7289
    $P2 = $P1.'isop'('(')
    isfalse $I1, $P2
    unless $I1 goto __label_3
.annotate 'line', 7290
    'Expected'("'(' after 'catch'", $P1)
  __label_3: # endif
.annotate 'line', 7291
    $P1 = __ARG_2.'get'()
.annotate 'line', 7292
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_4
# {
.annotate 'line', 7293
# exname: $S1
    $P3 = $P1.'getidentifier'()
    null $S1
    if_null $P3, __label_5
    set $S1, $P3
  __label_5:
.annotate 'line', 7294
    setattribute self, 'exname', $P1
.annotate 'line', 7295
    self.'createvar'($S1, 'P')
.annotate 'line', 7296
    $P1 = __ARG_2.'get'()
.annotate 'line', 7297
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_6
.annotate 'line', 7298
    'Expected'("')' in 'catch'", $P1)
  __label_6: # endif
# }
  __label_4: # endif
.annotate 'line', 7300
    $P3 = 'parseStatement'(__ARG_2, self)
    setattribute self, 'scatch', $P3
# }
.annotate 'line', 7301

.end # TryStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7304
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_0
.annotate 'line', 7305
    getattribute $P2, self, 'modifiers'
    $P2.'optimize'()
  __label_0: # endif
.annotate 'line', 7306
    getattribute $P3, self, 'stry'
    $P2 = $P3.'optimize'()
    setattribute self, 'stry', $P2
.annotate 'line', 7307
    getattribute $P3, self, 'scatch'
    $P2 = $P3.'optimize'()
    setattribute self, 'scatch', $P2
.annotate 'line', 7308
    .return(self)
# }
.annotate 'line', 7309

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7312
# reghandler: $S1
    $P2 = self.'tempreg'('P')
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
  __label_0:
.annotate 'line', 7313
# labelhandler: $S2
    $P2 = self.'genlabel'()
    null $S2
    if_null $P2, __label_1
    set $S2, $P2
  __label_1:
.annotate 'line', 7314
# labelpasthandler: $S3
    $P2 = self.'genlabel'()
    null $S3
    if_null $P2, __label_2
    set $S3, $P2
  __label_2:
.annotate 'line', 7315
# exreg: $S4
    null $S4
.annotate 'line', 7316
    getattribute $P2, self, 'exname'
    if_null $P2, __label_3
# {
.annotate 'line', 7317
# var exname: $P1
    getattribute $P3, self, 'exname'
    $P1 = self.'getvar'($P3)
.annotate 'line', 7318
    $P2 = $P1.'getreg'()
    set $S4, $P2
# }
    goto __label_4
  __label_3: # else
.annotate 'line', 7321
    $P2 = self.'tempreg'('P')
    set $S4, $P2
  __label_4: # endif
.annotate 'line', 7323
    self.'annotate'(__ARG_1)
.annotate 'line', 7324
    __ARG_1.'comment'('try: create handler')
.annotate 'line', 7326
    __ARG_1.'say'('    ', 'new ', $S1, ", 'ExceptionHandler'")
.annotate 'line', 7327
    __ARG_1.'say'('    ', 'set_label ', $S1, ', ', $S2)
.annotate 'line', 7329
    getattribute $P2, self, 'modifiers'
    if_null $P2, __label_5
.annotate 'line', 7330
    getattribute $P3, self, 'modifiers'
    $P3.'emitmodifiers'(__ARG_1, $S1)
  __label_5: # endif
.annotate 'line', 7332
    __ARG_1.'emitarg1'('push_eh', $S1)
.annotate 'line', 7333
    __ARG_1.'comment'('try: begin')
.annotate 'line', 7334
    getattribute $P2, self, 'stry'
    $P2.'emit'(__ARG_1)
.annotate 'line', 7335
    __ARG_1.'comment'('try: end')
.annotate 'line', 7336
    __ARG_1.'say'('    ', 'pop_eh')
.annotate 'line', 7338
    self.'annotate'(__ARG_1)
.annotate 'line', 7339
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 7341
    __ARG_1.'comment'('catch')
.annotate 'line', 7342
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 7343
    __ARG_1.'say'('    ', '.get_results(', $S4, ')')
.annotate 'line', 7344
    __ARG_1.'emitarg1'('finalize', $S4)
.annotate 'line', 7345
    __ARG_1.'say'('    ', 'pop_eh')
.annotate 'line', 7346
    getattribute $P2, self, 'scatch'
    $P2.'emit'(__ARG_1)
.annotate 'line', 7348
    __ARG_1.'comment'('catch end')
.annotate 'line', 7349
    __ARG_1.'emitlabel'($S3)
# }
.annotate 'line', 7350

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TryStatement' ]
.annotate 'line', 7268
    get_class $P1, [ 'BlockStatement' ]
    addparent $P0, $P1
.annotate 'line', 7270
    addattribute $P0, 'stry'
.annotate 'line', 7271
    addattribute $P0, 'modifiers'
.annotate 'line', 7272
    addattribute $P0, 'exname'
.annotate 'line', 7273
    addattribute $P0, 'scatch'
.end
.namespace [ 'VarBaseStatement' ]

.sub 'initvarbase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param int __ARG_4 :optional
# Body
# {
.annotate 'line', 7363
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7364
    setattribute self, 'name', __ARG_3
.annotate 'line', 7365
# var vdata: $P1
    $P1 = self.'createvar'(__ARG_3, 'P', __ARG_4)
.annotate 'line', 7366
    $P3 = $P1.'getreg'()
    setattribute self, 'reg', $P3
# }
.annotate 'line', 7367

.end # initvarbase

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'VarBaseStatement' ]
.annotate 'line', 7357
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7359
    addattribute $P0, 'name'
.annotate 'line', 7360
    addattribute $P0, 'reg'
.end
.namespace [ 'DeclareBase' ]

.sub 'DeclareBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 7382
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7383
    setattribute self, 'name', __ARG_3
.annotate 'line', 7384
    box $P1, __ARG_4
    setattribute self, 'basetype', $P1
# }
.annotate 'line', 7385

.end # DeclareBase

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'DeclareBase' ]
.annotate 'line', 7374
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7376
    addattribute $P0, 'name'
.annotate 'line', 7377
    addattribute $P0, 'basetype'
.annotate 'line', 7378
    addattribute $P0, 'reg'
.end
.namespace [ 'DeclareSingleStatement' ]

.sub 'DeclareSingleStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 7396
    self.'DeclareBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 7397
# var vdata: $P1
    getattribute $P3, self, 'name'
    getattribute $P4, self, 'basetype'
    $P1 = self.'createvar'($P3, $P4)
.annotate 'line', 7398
    $P4 = $P1.'getreg'()
    setattribute self, 'reg', $P4
.annotate 'line', 7399
# var t: $P2
    $P2 = __ARG_5.'get'()
.annotate 'line', 7400
    $P3 = $P2.'isop'('=')
    if_null $P3, __label_0
    unless $P3 goto __label_0
# {
.annotate 'line', 7402
    $P5 = 'parseExpr'(__ARG_5, self)
    setattribute self, 'init', $P5
# }
    goto __label_1
  __label_0: # else
.annotate 'line', 7405
    __ARG_5.'unget'($P2)
  __label_1: # endif
# }
.annotate 'line', 7406

.end # DeclareSingleStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7409
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 7410
    if_null $P1, __label_0
.annotate 'line', 7411
    $P3 = $P1.'optimize'()
    setattribute self, 'init', $P3
  __label_0: # endif
.annotate 'line', 7412
    .return(self)
# }
.annotate 'line', 7413

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7416
    self.'annotate'(__ARG_1)
.annotate 'line', 7417
# name: $S1
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
  __label_0:
.annotate 'line', 7418
# reg: $S2
    getattribute $P2, self, 'reg'
    null $S2
    if_null $P2, __label_1
    set $S2, $P2
  __label_1:
.annotate 'line', 7419
# basetype: $S3
    getattribute $P2, self, 'basetype'
    null $S3
    if_null $P2, __label_2
    set $S3, $P2
  __label_2:
.annotate 'line', 7420
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 7421
    concat $S7, $S1, ': '
    concat $S7, $S7, $S2
    __ARG_1.'comment'($S7)
.annotate 'line', 7423
    isnull $I1, $P1
    if $I1 goto __label_5
    $I1 = $P1.'isnull'()
  __label_5:
    unless $I1 goto __label_3
.annotate 'line', 7424
    __ARG_1.'emitnull'($S2)
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 7426
# itype: $S4
    $P2 = $P1.'checkresult'()
    null $S4
    if_null $P2, __label_6
    set $S4, $P2
  __label_6:
.annotate 'line', 7427
    ne $S4, $S3, __label_7
# {
.annotate 'line', 7428
    iseq $I1, $S4, 'S'
    unless $I1 goto __label_11
    isa $I1, $P1, [ 'ConcatString' ]
  __label_11:
    unless $I1 goto __label_9
.annotate 'line', 7429
    $P1.'emit_concat_set'(__ARG_1, $S2)
    goto __label_10
  __label_9: # else
.annotate 'line', 7431
    $P1.'emit'(__ARG_1, $S2)
  __label_10: # endif
# }
    goto __label_8
  __label_7: # else
# {
.annotate 'line', 7434
    isa $I1, $P1, [ 'IndexExpr' ]
    unless $I1 goto __label_12
# {
.annotate 'line', 7436
    $P1.'emit'(__ARG_1, $S2)
# }
    goto __label_13
  __label_12: # else
# {
.annotate 'line', 7439
# ireg: $S5
    null $S5
.annotate 'line', 7440
    ne $S4, '', __label_14
.annotate 'line', 7441
    $P2 = $P1.'emit_get'(__ARG_1)
    set $S5, $P2
    goto __label_15
  __label_14: # else
# {
.annotate 'line', 7443
    $P3 = self.'tempreg'($S4)
    set $S5, $P3
.annotate 'line', 7444
    $P1.'emit'(__ARG_1, $S5)
# }
  __label_15: # endif
.annotate 'line', 7446
    iseq $I1, $S3, 'S'
    unless $I1 goto __label_18
    iseq $I1, $S4, 'P'
  __label_18:
    unless $I1 goto __label_16
# {
.annotate 'line', 7447
# auxlabel: $S6
    $P2 = self.'genlabel'()
    null $S6
    if_null $P2, __label_19
    set $S6, $P2
  __label_19:
.annotate 'line', 7448
    __ARG_1.'emitnull'($S2)
.annotate 'line', 7449
    __ARG_1.'emitif_null'($S5, $S6)
.annotate 'line', 7450
    __ARG_1.'emitset'($S2, $S5)
.annotate 'line', 7451
    __ARG_1.'emitlabel'($S6)
# }
    goto __label_17
  __label_16: # else
.annotate 'line', 7454
    __ARG_1.'emitset'($S2, $S5)
  __label_17: # endif
# }
  __label_13: # endif
# }
  __label_8: # endif
# }
  __label_4: # endif
# }
.annotate 'line', 7458

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'DeclareSingleStatement' ]
.annotate 'line', 7390
    get_class $P1, [ 'DeclareBase' ]
    addparent $P0, $P1
.annotate 'line', 7392
    addattribute $P0, 'init'
.end
.namespace [ 'DeclareArrayStatement' ]

.sub 'DeclareArrayStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param string __ARG_5
        .param pmc __ARG_6
# Body
# {
.annotate 'line', 7473
    self.'DeclareBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 7474
    box $P4, __ARG_5
    setattribute self, 'arraytype', $P4
.annotate 'line', 7475
# var vdata: $P1
    getattribute $P4, self, 'name'
    $P1 = self.'createvar'($P4, 'P')
.annotate 'line', 7476
    $P5 = $P1.'getreg'()
    setattribute self, 'reg', $P5
.annotate 'line', 7477
# var t: $P2
    $P2 = __ARG_6.'get'()
.annotate 'line', 7478
    $P4 = $P2.'isop'(']')
    isfalse $I1, $P4
    unless $I1 goto __label_0
# {
.annotate 'line', 7480
    __ARG_6.'unget'($P2)
.annotate 'line', 7481
    $P5 = 'parseExpr'(__ARG_6, self)
    setattribute self, 'size', $P5
.annotate 'line', 7482
    'ExpectOp'(']', __ARG_6)
# }
  __label_0: # endif
.annotate 'line', 7484
    $P2 = __ARG_6.'get'()
.annotate 'line', 7485
    $P4 = $P2.'isop'('=')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 7486
    $P2 = __ARG_6.'get'()
.annotate 'line', 7487
    $P4 = $P2.'isop'('[')
    isfalse $I1, $P4
    unless $I1 goto __label_3
.annotate 'line', 7488
    'Expected'("array initializer", $P2)
  __label_3: # endif
.annotate 'line', 7489
    root_new $P5, ['parrot';'ResizablePMCArray']
    setattribute self, 'initarray', $P5
.annotate 'line', 7490
    $P2 = __ARG_6.'get'()
.annotate 'line', 7491
    $P4 = $P2.'isop'(']')
    isfalse $I1, $P4
    unless $I1 goto __label_4
# {
.annotate 'line', 7492
    __ARG_6.'unget'($P2)
  __label_5: # do
.annotate 'line', 7493
# {
.annotate 'line', 7494
# var item: $P3
    $P3 = 'parseExpr'(__ARG_6, self)
.annotate 'line', 7495
    getattribute $P4, self, 'initarray'
# predefined push
    push $P4, $P3
# }
  __label_7: # continue
.annotate 'line', 7496
    $P2 = __ARG_6.'get'()
    $P4 = $P2.'isop'(',')
    if_null $P4, __label_6
    if $P4 goto __label_5
  __label_6: # enddo
.annotate 'line', 7497
    $P4 = $P2.'isop'(']')
    isfalse $I1, $P4
    unless $I1 goto __label_8
.annotate 'line', 7498
    'Expected'("',' or ']'", $P2)
  __label_8: # endif
# }
  __label_4: # endif
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 7502
    __ARG_6.'unget'($P2)
  __label_2: # endif
# }
.annotate 'line', 7503

.end # DeclareArrayStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7506
    getattribute $P1, self, 'size'
    if_null $P1, __label_0
.annotate 'line', 7507
    getattribute $P4, self, 'size'
    $P3 = $P4.'optimize'()
    setattribute self, 'size', $P3
  __label_0: # endif
.annotate 'line', 7508
    getattribute $P1, self, 'initarray'
    'optimize_array'($P1)
.annotate 'line', 7509
    .return(self)
# }
.annotate 'line', 7510

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7513
    self.'annotate'(__ARG_1)
.annotate 'line', 7515
# var reg: $P1
    getattribute $P1, self, 'reg'
.annotate 'line', 7516
# var size: $P2
    getattribute $P2, self, 'size'
.annotate 'line', 7517
# var init: $P3
    getattribute $P3, self, 'initarray'
.annotate 'line', 7518
# var basetype: $P4
    getattribute $P4, self, 'basetype'
.annotate 'line', 7519
# arraytype: $S1
# predefined string
    getattribute $P6, self, 'arraytype'
    set $S4, $P6
    concat $S1, $S4, 'Array'
.annotate 'line', 7520
    if_null $P2, __label_0
# {
.annotate 'line', 7522
# regsize: $S2
    $P6 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P6, __label_2
    set $S2, $P6
  __label_2:
.annotate 'line', 7523
    __ARG_1.'say'('    ', 'new ', $P1, ", ['Fixed", $S1, "'], ", $S2)
# }
    goto __label_1
  __label_0: # else
# {
.annotate 'line', 7527
    __ARG_1.'say'('    ', 'new ', $P1, ", ['Resizable", $S1, "']")
# }
  __label_1: # endif
.annotate 'line', 7529
    if_null $P3, __label_3
# {
.annotate 'line', 7530
# itemreg: $S3
    $P6 = self.'tempreg'($P4)
    null $S3
    if_null $P6, __label_4
    set $S3, $P6
  __label_4:
.annotate 'line', 7531
# n: $I1
# predefined elements
    elements $I1, $P3
.annotate 'line', 7532
    unless_null $P2, __label_5
# {
.annotate 'line', 7533
    le $I1, 0, __label_6
# {
.annotate 'line', 7535
    __ARG_1.'emitset'($P1, $I1)
# }
  __label_6: # endif
# }
  __label_5: # endif
.annotate 'line', 7538
# i: $I2
    null $I2
.annotate 'line', 7539
    iter $P7, $P3
    set $P7, 0
  __label_7: # for iteration
    unless $P7 goto __label_8
    shift $P5, $P7
# {
.annotate 'line', 7540
    $P5.'emit'(__ARG_1, $S3)
.annotate 'line', 7541
    __ARG_1.'say'('    ', $P1, '[', $I2, '] = ', $S3)
.annotate 'line', 7542
    inc $I2
# }
    goto __label_7
  __label_8: # endfor
# }
  __label_3: # endif
# }
.annotate 'line', 7545

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'DeclareArrayStatement' ]
.annotate 'line', 7463
    get_class $P1, [ 'DeclareBase' ]
    addparent $P0, $P1
.annotate 'line', 7465
    addattribute $P0, 'size'
.annotate 'line', 7466
    addattribute $P0, 'initarray'
.annotate 'line', 7467
    addattribute $P0, 'arraytype'
.end
.namespace [ ]

.sub 'parseDeclareHelper'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 7552
# var next: $P1
    null $P1
.annotate 'line', 7553
# var r: $P2
    null $P2
  __label_0: # do
.annotate 'line', 7554
# {
.annotate 'line', 7555
# var name: $P3
    $P3 = __ARG_4.'get'()
.annotate 'line', 7556
    'RequireIdentifier'($P3)
.annotate 'line', 7557
# var t: $P4
    $P4 = __ARG_4.'get'()
.annotate 'line', 7558
# var item: $P5
    null $P5
.annotate 'line', 7559
    $P6 = $P4.'isop'('[')
    if_null $P6, __label_3
    unless $P6 goto __label_3
.annotate 'line', 7560
    $P5 = __ARG_2(__ARG_3, __ARG_5, __ARG_4, $P3)
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 7562
    __ARG_4.'unget'($P4)
.annotate 'line', 7563
    $P5 = __ARG_1(__ARG_3, __ARG_5, $P3, __ARG_4)
# }
  __label_4: # endif
.annotate 'line', 7565
    $P2 = 'addtomulti'($P2, $P5)
.annotate 'line', 7566
    $P1 = __ARG_4.'get'()
# }
  __label_2: # continue
.annotate 'line', 7567
    $P6 = $P1.'isop'(',')
    if_null $P6, __label_1
    if $P6 goto __label_0
  __label_1: # enddo
.annotate 'line', 7568
    'RequireOp'(';', $P1)
.annotate 'line', 7569
    .return($P2)
# }
.annotate 'line', 7570

.end # parseDeclareHelper

.namespace [ 'IntStatement' ]

.sub 'IntStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7578
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'I', __ARG_4)
# }
.annotate 'line', 7579

.end # IntStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IntStatement' ]
.annotate 'line', 7574
    get_class $P1, [ 'DeclareSingleStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'IntArrayStatement' ]

.sub 'IntArrayStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7586
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'I', 'Integer', __ARG_4)
# }
.annotate 'line', 7587

.end # IntArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IntArrayStatement' ]
.annotate 'line', 7582
    get_class $P1, [ 'DeclareArrayStatement' ]
    addparent $P0, $P1
.end
.namespace [ ]

.sub 'newIntSingle'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7593
    new $P2, [ 'IntStatement' ]
    $P2.'IntStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7594

.end # newIntSingle


.sub 'newIntArray'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7598
    new $P2, [ 'IntArrayStatement' ]
    $P2.'IntArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7599

.end # newIntArray


.sub 'parseInt'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7603
.const 'Sub' $P1 = 'newIntSingle'
.const 'Sub' $P2 = 'newIntArray'
.annotate 'line', 7604
    .tailcall 'parseDeclareHelper'($P1, $P2, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7605

.end # parseInt

.namespace [ 'FloatStatement' ]

.sub 'FloatStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7613
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'N', __ARG_4)
# }
.annotate 'line', 7614

.end # FloatStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FloatStatement' ]
.annotate 'line', 7609
    get_class $P1, [ 'DeclareSingleStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'FloatArrayStatement' ]

.sub 'FloatArrayStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7621
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'N', 'Float', __ARG_4)
# }
.annotate 'line', 7622

.end # FloatArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FloatArrayStatement' ]
.annotate 'line', 7617
    get_class $P1, [ 'DeclareArrayStatement' ]
    addparent $P0, $P1
.end
.namespace [ ]

.sub 'newFloatSingle'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7628
    new $P2, [ 'FloatStatement' ]
    $P2.'FloatStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7629

.end # newFloatSingle


.sub 'newFloatArray'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7633
    new $P2, [ 'FloatArrayStatement' ]
    $P2.'FloatArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7634

.end # newFloatArray


.sub 'parseFloat'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7638
.const 'Sub' $P1 = 'newFloatSingle'
.const 'Sub' $P2 = 'newFloatArray'
.annotate 'line', 7639
    .tailcall 'parseDeclareHelper'($P1, $P2, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7640

.end # parseFloat

.namespace [ 'StringStatement' ]

.sub 'StringStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7648
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'S', __ARG_4)
# }
.annotate 'line', 7649

.end # StringStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'StringStatement' ]
.annotate 'line', 7644
    get_class $P1, [ 'DeclareSingleStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'StringArrayStatement' ]

.sub 'StringArrayStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7656
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'S', 'String', __ARG_4)
# }
.annotate 'line', 7657

.end # StringArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'StringArrayStatement' ]
.annotate 'line', 7652
    get_class $P1, [ 'DeclareArrayStatement' ]
    addparent $P0, $P1
.end
.namespace [ ]

.sub 'newStringSingle'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7663
    new $P2, [ 'StringStatement' ]
    $P2.'StringStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7664

.end # newStringSingle


.sub 'newStringArray'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7668
    new $P2, [ 'StringArrayStatement' ]
    $P2.'StringArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7669

.end # newStringArray


.sub 'parseString'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7673
.const 'Sub' $P1 = 'newStringSingle'
.const 'Sub' $P2 = 'newStringArray'
.annotate 'line', 7674
    .tailcall 'parseDeclareHelper'($P1, $P2, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7675

.end # parseString

.namespace [ 'ConstStatement' ]

.sub 'ConstStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 7690
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7691
    box $P1, __ARG_3
    setattribute self, 'type', $P1
.annotate 'line', 7692
    setattribute self, 'name', __ARG_4
.annotate 'line', 7693
    setattribute self, 'value', __ARG_5
# }
.annotate 'line', 7694

.end # ConstStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7697
# var value: $P1
    getattribute $P1, self, 'value'
.annotate 'line', 7698
# var name: $P2
    getattribute $P2, self, 'name'
.annotate 'line', 7699
# type: $S1
    getattribute $P3, self, 'type'
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
  __label_0:
.annotate 'line', 7700
    $P1 = $P1.'optimize'()
.annotate 'line', 7701
    $P3 = $P1.'hascompilevalue'()
    isfalse $I1, $P3
    unless $I1 goto __label_1
# {
.annotate 'line', 7703
    getattribute $P4, self, 'start'
.annotate 'line', 7702
    'SyntaxError'('Value for const is not evaluable at compile time', $P4)
# }
  __label_1: # endif
.annotate 'line', 7705
    self.'createconst'($P2, $S1, $P1, '')
.annotate 'line', 7706
    setattribute self, 'value', $P1
.annotate 'line', 7707
    .return(self)
# }
.annotate 'line', 7708

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 7711
    getattribute $P1, self, 'start'
    'InternalError'('Direct use of const', $P1)
# }
.annotate 'line', 7712

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7715
# name: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 7716
    concat $S2, 'Constant ', $S1
    concat $S2, $S2, ' evaluated at compile time'
    __ARG_1.'comment'($S2)
# }
.annotate 'line', 7717

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ConstStatement' ]
.annotate 'line', 7681
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7683
    addattribute $P0, 'type'
.annotate 'line', 7684
    addattribute $P0, 'name'
.annotate 'line', 7685
    addattribute $P0, 'value'
.end
.namespace [ ]

.sub 'parseConst'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7722
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7723
# type: $S1
    $P5 = 'typetoregcheck'($P1)
    null $S1
    if_null $P5, __label_0
    set $S1, $P5
  __label_0:
.annotate 'line', 7724
    isne $I1, $S1, 'I'
    unless $I1 goto __label_3
    isne $I1, $S1, 'N'
  __label_3:
    unless $I1 goto __label_2
    isne $I1, $S1, 'S'
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 7725
    'SyntaxError'('Invalid type for const', __ARG_1)
  __label_1: # endif
.annotate 'line', 7727
# var multi: $P2
    null $P2
  __label_4: # do
.annotate 'line', 7728
# {
.annotate 'line', 7729
    $P1 = __ARG_2.'get'()
.annotate 'line', 7730
# var name: $P3
    set $P3, $P1
.annotate 'line', 7731
    'ExpectOp'('=', __ARG_2)
.annotate 'line', 7732
# var value: $P4
    $P4 = 'parseExpr'(__ARG_2, __ARG_3)
.annotate 'line', 7734
    new $P6, [ 'ConstStatement' ]
    $P6.'ConstStatement'($P1, __ARG_3, $S1, $P3, $P4)
    set $P5, $P6
.annotate 'line', 7733
    $P2 = 'addtomulti'($P2, $P5)
# }
  __label_6: # continue
.annotate 'line', 7735
    $P1 = __ARG_2.'get'()
    $P5 = $P1.'isop'(',')
    if_null $P5, __label_5
    if $P5 goto __label_4
  __label_5: # enddo
.annotate 'line', 7736
    .return($P2)
# }
.annotate 'line', 7737

.end # parseConst

.namespace [ 'VarStatement' ]

.sub 'VarStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param int __ARG_5
# Body
# {
.annotate 'line', 7748
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 7749
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7750
    $P2 = $P1.'isop'('=')
    if_null $P2, __label_0
    unless $P2 goto __label_0
# {
.annotate 'line', 7751
    $P4 = 'parseExpr'(__ARG_2, self)
    setattribute self, 'init', $P4
.annotate 'line', 7752
    $P1 = __ARG_2.'get'()
# }
  __label_0: # endif
.annotate 'line', 7754
    'RequireOp'(';', $P1)
# }
.annotate 'line', 7755

.end # VarStatement


.sub 'optimize_init' :method
# Body
# {
.annotate 'line', 7758
    getattribute $P1, self, 'init'
    if_null $P1, __label_0
.annotate 'line', 7759
    getattribute $P4, self, 'init'
    $P3 = $P4.'optimize'()
    setattribute self, 'init', $P3
  __label_0: # endif
.annotate 'line', 7760
    .return(self)
# }
.annotate 'line', 7761

.end # optimize_init


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7764
    .tailcall self.'optimize_init'()
# }
.annotate 'line', 7765

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7768
    self.'annotate'(__ARG_1)
.annotate 'line', 7769
# name: $S1
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
  __label_0:
.annotate 'line', 7770
# reg: $S2
    getattribute $P2, self, 'reg'
    null $S2
    if_null $P2, __label_1
    set $S2, $P2
  __label_1:
.annotate 'line', 7771
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 7772
    concat $S5, 'var ', $S1
    concat $S5, $S5, ': '
    concat $S5, $S5, $S2
    __ARG_1.'comment'($S5)
.annotate 'line', 7773
    if_null $P1, __label_2
.annotate 'line', 7774
    $P2 = $P1.'isnull'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 7775
    null $P1
  __label_3: # endif
  __label_2: # endif
.annotate 'line', 7776
    if_null $P1, __label_4
# {
.annotate 'line', 7777
# type: $S3
    $P2 = $P1.'checkresult'()
    null $S3
    if_null $P2, __label_6
    set $S3, $P2
  __label_6:
# switch
.annotate 'line', 7778
    set $S5, $S3
    set $S6, 'P'
    if $S5 == $S6 goto __label_9
    set $S6, 'S'
    if $S5 == $S6 goto __label_10
    set $S6, 'I'
    if $S5 == $S6 goto __label_11
    set $S6, 'N'
    if $S5 == $S6 goto __label_12
    set $S6, 'v'
    if $S5 == $S6 goto __label_13
    goto __label_8
  __label_9: # case
.annotate 'line', 7780
    isa $I1, $P1, [ 'MemberExpr' ]
    if $I1 goto __label_17
    isa $I1, $P1, [ 'ArrayExpr' ]
  __label_17:
    if $I1 goto __label_16
    isa $I1, $P1, [ 'NewExpr' ]
  __label_16:
    unless $I1 goto __label_14
.annotate 'line', 7781
    $P1.'emit_init'(__ARG_1, $S2)
    goto __label_15
  __label_14: # else
.annotate 'line', 7783
    $P1.'emit'(__ARG_1, $S2)
  __label_15: # endif
    goto __label_7 # break
  __label_10: # case
  __label_11: # case
  __label_12: # case
.annotate 'line', 7788
# value: $S4
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P2, __label_18
    set $S4, $P2
  __label_18:
.annotate 'line', 7789
    __ARG_1.'emitbox'($S2, $S4)
    goto __label_7 # break
  __label_13: # case
.annotate 'line', 7792
    getattribute $P3, self, 'name'
    'SyntaxError'("Can't use void function as initializer", $P3)
  __label_8: # default
.annotate 'line', 7794
    getattribute $P4, self, 'name'
    'SyntaxError'("Invalid var initializer", $P4)
  __label_7: # switch end
# }
    goto __label_5
  __label_4: # else
.annotate 'line', 7798
    __ARG_1.'emitnull'($S2)
  __label_5: # endif
# }
.annotate 'line', 7799

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'VarStatement' ]
.annotate 'line', 7743
    get_class $P1, [ 'VarBaseStatement' ]
    addparent $P0, $P1
.annotate 'line', 7745
    addattribute $P0, 'init'
.end
.namespace [ 'ResizableVarStatement' ]

.sub 'ResizableVarStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7806
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 7807
    'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 7808

.end # ResizableVarStatement


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7811
    self.'annotate'(__ARG_1)
.annotate 'line', 7812
# name: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 7813
# reg: $S2
    getattribute $P1, self, 'reg'
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
  __label_1:
.annotate 'line', 7814
    concat $S3, 'var ', $S1
    concat $S3, $S3, '[] : '
    concat $S3, $S3, $S2
    __ARG_1.'comment'($S3)
.annotate 'line', 7815
    __ARG_1.'say'('    ', 'new ', $S2, ", 'ResizablePMCArray'")
# }
.annotate 'line', 7816

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ResizableVarStatement' ]
.annotate 'line', 7802
    get_class $P1, [ 'VarStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'FixedVarStatement' ]

.sub 'FixedVarStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7825
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 7826
    $P2 = 'parseExpr'(__ARG_2, self)
    setattribute self, 'exprsize', $P2
.annotate 'line', 7827
    'ExpectOp'(']', __ARG_2)
.annotate 'line', 7828
    'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 7829

.end # FixedVarStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7832
    getattribute $P3, self, 'exprsize'
    $P2 = $P3.'optimize'()
    setattribute self, 'exprsize', $P2
.annotate 'line', 7833
    .tailcall self.'optimize_init'()
# }
.annotate 'line', 7834

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7837
# regsize: $S1
    getattribute $P2, self, 'exprsize'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 7838
    self.'annotate'(__ARG_1)
.annotate 'line', 7839
# name: $S2
    getattribute $P1, self, 'name'
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
  __label_1:
.annotate 'line', 7840
# reg: $S3
    getattribute $P1, self, 'reg'
    null $S3
    if_null $P1, __label_2
    set $S3, $P1
  __label_2:
.annotate 'line', 7841
    concat $S4, 'var ', $S2
    concat $S4, $S4, '[] : '
    concat $S4, $S4, $S3
    __ARG_1.'comment'($S4)
.annotate 'line', 7842
    __ARG_1.'say'('    ', 'new ', $S3, ", 'FixedPMCArray', ", $S1)
# }
.annotate 'line', 7843

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FixedVarStatement' ]
.annotate 'line', 7819
    get_class $P1, [ 'VarStatement' ]
    addparent $P0, $P1
.annotate 'line', 7821
    addattribute $P0, 'exprsize'
.end
.namespace [ ]

.sub 'parseVar'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param int __ARG_4 :optional
# Body
# {
.annotate 'line', 7848
# var name: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7849
    'RequireIdentifier'($P1)
.annotate 'line', 7850
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 7851
    $P3 = $P2.'isop'('[')
    if_null $P3, __label_0
    unless $P3 goto __label_0
# {
.annotate 'line', 7852
    $P2 = __ARG_2.'get'()
.annotate 'line', 7853
    $P3 = $P2.'isop'(']')
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 7854
    new $P5, [ 'ResizableVarStatement' ]
    $P5.'ResizableVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P4, $P5
    .return($P4)
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 7856
    __ARG_2.'unget'($P2)
.annotate 'line', 7857
    new $P4, [ 'FixedVarStatement' ]
    $P4.'FixedVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P3, $P4
    .return($P3)
# }
  __label_3: # endif
# }
    goto __label_1
  __label_0: # else
# {
.annotate 'line', 7861
    __ARG_2.'unget'($P2)
.annotate 'line', 7862
    new $P4, [ 'VarStatement' ]
    $P4.'VarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, __ARG_4)
    set $P3, $P4
    .return($P3)
# }
  __label_1: # endif
# }
.annotate 'line', 7864

.end # parseVar


.sub 'parseVolatile'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7868
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7869
    $P2 = $P1.'iskeyword'('var')
    isfalse $I1, $P2
    unless $I1 goto __label_0
.annotate 'line', 7870
    'SyntaxError'("invalid volatile type", $P1)
  __label_0: # endif
.annotate 'line', 7871
    .tailcall 'parseVar'(__ARG_1, __ARG_2, __ARG_3, 1)
# }
.annotate 'line', 7872

.end # parseVolatile

.namespace [ 'CompoundStatement' ]

.sub 'CompoundStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7885
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7886
    root_new $P4, ['parrot';'Hash']
    setattribute self, 'labels', $P4
.annotate 'line', 7887
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'statements', $P4
.annotate 'line', 7888
# var t: $P1
    null $P1
  __label_1: # while
.annotate 'line', 7889
    $P1 = __ARG_2.'get'()
    $P3 = $P1.'isop'('}')
    isfalse $I1, $P3
    unless $I1 goto __label_0
# {
.annotate 'line', 7890
    __ARG_2.'unget'($P1)
.annotate 'line', 7891
# var c: $P2
    $P2 = 'parseStatement'(__ARG_2, self)
.annotate 'line', 7892
    unless_null $P2, __label_2
.annotate 'line', 7893
    'InternalError'('Unexpected null statement')
  __label_2: # endif
.annotate 'line', 7894
    getattribute $P3, self, 'statements'
# predefined push
    push $P3, $P2
# }
    goto __label_1
  __label_0: # endwhile
.annotate 'line', 7896
    setattribute self, 'end', $P1
# }
.annotate 'line', 7897

.end # CompoundStatement


.sub 'getlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7900
# s: $S1
    set $P2, __ARG_1
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
  __label_0:
.annotate 'line', 7901
# var labels: $P1
    getattribute $P1, self, 'labels'
.annotate 'line', 7902
# exist: $S2
    $S2 = $P1[$S1]
.annotate 'line', 7903
    isnull $I1, $S2
    if $I1 goto __label_2
    iseq $I1, $S2, ''
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 7904
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getlabel'(__ARG_1)
    set $S2, $P2
  __label_1: # endif
.annotate 'line', 7905
    .return($S2)
# }
.annotate 'line', 7906

.end # getlabel


.sub 'createlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7909
# s: $S1
    set $P2, __ARG_1
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
  __label_0:
.annotate 'line', 7910
# var labels: $P1
    getattribute $P1, self, 'labels'
.annotate 'line', 7911
# exist: $S2
    $S2 = $P1[$S1]
.annotate 'line', 7912
    isnull $I1, $S2
    not $I1
    unless $I1 goto __label_2
    isne $I1, $S2, ''
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 7913
    'SyntaxError'('Label already defined', __ARG_1)
  __label_1: # endif
.annotate 'line', 7914
# value: $S3
    $P2 = self.'genlabel'()
    null $S3
    if_null $P2, __label_3
    set $S3, $P2
  __label_3:
.annotate 'line', 7915
    $P1[$S1] = $S3
.annotate 'line', 7916
    .return($S3)
# }
.annotate 'line', 7917

.end # createlabel


.sub 'getend' :method
# Body
# {
.annotate 'line', 7918
    getattribute $P1, self, 'end'
    .return($P1)
# }

.end # getend


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7921
    __ARG_1.'comment'('{')
.annotate 'line', 7922
    getattribute $P2, self, 'statements'
    iter $P3, $P2
    set $P3, 0
  __label_0: # for iteration
    unless $P3 goto __label_1
    shift $P1, $P3
# {
.annotate 'line', 7923
    $P1.'emit'(__ARG_1)
.annotate 'line', 7924
    self.'freetemps'()
# }
    goto __label_0
  __label_1: # endfor
.annotate 'line', 7926
    __ARG_1.'comment'('}')
# }
.annotate 'line', 7927

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CompoundStatement' ]
.annotate 'line', 7878
    get_class $P1, [ 'MultiStatementBase' ]
    addparent $P0, $P1
    get_class $P2, [ 'BlockStatement' ]
    addparent $P0, $P2
.annotate 'line', 7880
    addattribute $P0, 'end'
.annotate 'line', 7881
    addattribute $P0, 'labels'
.end
.namespace [ 'RegisterStore' ]

.sub 'RegisterStore' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 7942
    box $P3, __ARG_1
    setattribute self, 'type', $P3
.annotate 'line', 7944
    box $P3, 1
    setattribute self, 'nreg', $P3
.annotate 'line', 7945
    new $P1, ['ResizableStringArray']
.annotate 'line', 7946
    new $P2, ['ResizableStringArray']
.annotate 'line', 7947
    setattribute self, 'tempreg', $P1
.annotate 'line', 7948
    setattribute self, 'freereg', $P2
# }
.annotate 'line', 7949

.end # RegisterStore


.sub 'createreg' :method
# Body
# {
.annotate 'line', 7952
# var n: $P1
    getattribute $P1, self, 'nreg'
.annotate 'line', 7953
# i: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 7954
# reg: $S1
    set $I2, $I1
    inc $I1
    set $S1, $I2
.annotate 'line', 7955
    assign $P1, $I1
.annotate 'line', 7956
# type: $S2
    getattribute $P2, self, 'type'
    null $S2
    if_null $P2, __label_0
    set $S2, $P2
  __label_0:
.annotate 'line', 7957
    concat $S0, '$', $S2
    concat $S0, $S0, $S1
    set $S1, $S0
.annotate 'line', 7958
    .return($S1)
# }
.annotate 'line', 7959

.end # createreg


.sub 'tempreg' :method
# Body
# {
.annotate 'line', 7962
# var freereg: $P1
    getattribute $P1, self, 'freereg'
.annotate 'line', 7963
# var tempreg: $P2
    getattribute $P2, self, 'tempreg'
.annotate 'line', 7964
# reg: $S1
    null $S1
.annotate 'line', 7965
# predefined elements
    elements $I1, $P1
    le $I1, 0, __label_0
.annotate 'line', 7966
    $P3 = $P1.'pop'()
    set $S1, $P3
    goto __label_1
  __label_0: # else
.annotate 'line', 7968
    $P4 = self.'createreg'()
    set $S1, $P4
  __label_1: # endif
.annotate 'line', 7969
# predefined push
    push $P2, $S1
.annotate 'line', 7970
    .return($S1)
# }
.annotate 'line', 7971

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 7974
# var freereg: $P1
    getattribute $P1, self, 'freereg'
.annotate 'line', 7975
# var tempreg: $P2
    getattribute $P2, self, 'tempreg'
.annotate 'line', 7976
# n: $I1
# predefined elements
    elements $I1, $P2
# for loop
.annotate 'line', 7977
# i: $I2
    sub $I2, $I1, 1
  __label_2: # for condition
    lt $I2, 0, __label_1
# {
.annotate 'line', 7978
# s: $S1
    $S1 = $P2[$I2]
.annotate 'line', 7979
# predefined push
    push $P1, $S1
# }
  __label_0: # for iteration
.annotate 'line', 7977
    dec $I2
    goto __label_2
  __label_1: # for end
.annotate 'line', 7981
    assign $P2, 0
# }
.annotate 'line', 7982

.end # freetemps

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'RegisterStore' ]
.annotate 'line', 7936
    addattribute $P0, 'type'
.annotate 'line', 7937
    addattribute $P0, 'nreg'
.annotate 'line', 7938
    addattribute $P0, 'tempreg'
.annotate 'line', 7939
    addattribute $P0, 'freereg'
.end
.namespace [ 'ParameterModifierList' ]

.sub 'ParameterModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 7993
    self.'ModifierList'(__ARG_1, __ARG_2)
# }
.annotate 'line', 7994

.end # ParameterModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 7997
# var named: $P1
    null $P1
.annotate 'line', 7998
# var slurpy: $P2
    null $P2
.annotate 'line', 7999
# var modarglist: $P3
    $P3 = self.'getlist'()
.annotate 'line', 8000
    iter $P6, $P3
    set $P6, 0
  __label_0: # for iteration
    unless $P6 goto __label_1
    shift $P4, $P6
# {
.annotate 'line', 8001
# modname: $S1
    $P7 = $P4.'getname'()
    null $S1
    if_null $P7, __label_2
    set $S1, $P7
  __label_2:
# switch
.annotate 'line', 8002
    set $S3, $S1
    set $S4, 'named'
    if $S3 == $S4 goto __label_5
    set $S4, 'slurpy'
    if $S3 == $S4 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 8004
    set $P1, $P4
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 8007
    set $P2, $P4
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 8010
    __ARG_1.'print'(' :', $S1)
  __label_3: # switch end
# }
    goto __label_0
  __label_1: # endfor
.annotate 'line', 8013
    isnull $I2, $P1
    not $I2
    unless $I2 goto __label_9
    isnull $I2, $P2
    not $I2
  __label_9:
    unless $I2 goto __label_7
# {
.annotate 'line', 8018
    __ARG_1.'print'(" :named :slurpy")
# }
    goto __label_8
  __label_7: # else
# {
.annotate 'line', 8021
    if_null $P1, __label_10
# {
.annotate 'line', 8022
# setname: $S2
    null $S2
.annotate 'line', 8023
# nargs: $I1
    $P7 = $P1.'numargs'()
    set $I1, $P7
# switch
.annotate 'line', 8024
    set $I2, $I1
    null $I3
    if $I2 == $I3 goto __label_14
    set $I3, 1
    if $I2 == $I3 goto __label_15
    goto __label_13
  __label_14: # case
.annotate 'line', 8026
    concat $S0, "'", __ARG_3
    concat $S0, $S0, "'"
    set $S2, $S0
    goto __label_12 # break
  __label_15: # case
.annotate 'line', 8029
# var argmod: $P5
    $P5 = $P1.'getarg'(0)
.annotate 'line', 8030
    $P7 = $P5.'isstringliteral'()
    isfalse $I4, $P7
    unless $I4 goto __label_16
.annotate 'line', 8031
    'SyntaxError'('Invalid modifier', __ARG_2)
  __label_16: # endif
.annotate 'line', 8032
    $P8 = $P5.'getPirString'()
    set $S2, $P8
    goto __label_12 # break
  __label_13: # default
.annotate 'line', 8035
    'SyntaxError'('Invalid modifier', __ARG_2)
  __label_12: # switch end
.annotate 'line', 8037
    __ARG_1.'print'(" :named(", $S2, ")")
# }
    goto __label_11
  __label_10: # else
.annotate 'line', 8039
    if_null $P2, __label_17
# {
.annotate 'line', 8040
    __ARG_1.'print'(" :slurpy")
# }
  __label_17: # endif
  __label_11: # endif
# }
  __label_8: # endif
# }
.annotate 'line', 8043

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ParameterModifierList' ]
.annotate 'line', 7989
    get_class $P1, [ 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'FunctionParameter' ]

.sub 'FunctionParameter' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8052
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8053
# type: $S1
    $P3 = $P1.'checkkeyword'()
    $P2 = 'typetoregcheck'($P3)
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
  __label_0:
.annotate 'line', 8054
    eq $S1, '', __label_1
.annotate 'line', 8055
    $P1 = __ARG_2.'get'()
    goto __label_2
  __label_1: # else
.annotate 'line', 8057
    set $S1, 'P'
  __label_2: # endif
.annotate 'line', 8058
# argname: $S2
# predefined string
    $P2 = __ARG_1.'getparamnum'()
    set $S3, $P2
    concat $S2, '__ARG_', $S3
.annotate 'line', 8059
    __ARG_1.'createvarnamed'($P1, $S1, $S2)
.annotate 'line', 8061
# predefined string
    set $S3, $P1
    box $P2, $S3
    setattribute self, 'name', $P2
.annotate 'line', 8062
    $P1 = __ARG_2.'get'()
.annotate 'line', 8063
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 8064
    new $P5, [ 'ParameterModifierList' ]
    $P5.'ParameterModifierList'(__ARG_2, self)
    set $P4, $P5
    setattribute self, 'modifiers', $P4
    goto __label_4
  __label_3: # else
.annotate 'line', 8066
    __ARG_2.'unget'($P1)
  __label_4: # endif
# }
.annotate 'line', 8067

.end # FunctionParameter


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8070
# paramname: $S1
    getattribute $P3, self, 'name'
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
  __label_0:
.annotate 'line', 8071
# var param: $P1
    $P1 = __ARG_1.'getvar'($S1)
.annotate 'line', 8072
# ptype: $S2
    $P4 = $P1.'gettype'()
    $P3 = 'typetopirname'($P4)
    null $S2
    if_null $P3, __label_1
    set $S2, $P3
  __label_1:
.annotate 'line', 8073
    $P3 = $P1.'getreg'()
    __ARG_2.'print'('        .param ', $S2, ' ', $P3)
.annotate 'line', 8074
# var modarg: $P2
    getattribute $P2, self, 'modifiers'
.annotate 'line', 8075
    if_null $P2, __label_2
.annotate 'line', 8076
    getattribute $P3, __ARG_1, 'start'
    $P2.'emitmodifiers'(__ARG_2, $P3, $S1)
  __label_2: # endif
.annotate 'line', 8077
    __ARG_2.'say'('')
# }
.annotate 'line', 8078

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FunctionParameter' ]
.annotate 'line', 8048
    addattribute $P0, 'name'
.annotate 'line', 8049
    addattribute $P0, 'modifiers'
.end
.namespace [ 'FunctionModifierList' ]

.sub 'FunctionModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8089
    self.'ModifierList'(__ARG_1, __ARG_2)
# }
.annotate 'line', 8090

.end # FunctionModifierList


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8093
    $P3 = self.'getlist'()
    iter $P4, $P3
    set $P4, 0
  __label_0: # for iteration
    unless $P4 goto __label_1
    shift $P1, $P4
# {
.annotate 'line', 8094
# nargmods: $I1
    $P5 = $P1.'numargs'()
    set $I1, $P5
.annotate 'line', 8095
    $P3 = $P1.'getname'()
    __ARG_1.'print'(' :', $P3)
.annotate 'line', 8096
    le $I1, 0, __label_2
# {
.annotate 'line', 8097
    __ARG_1.'print'('(')
# for loop
.annotate 'line', 8098
# iargmod: $I2
    null $I2
  __label_5: # for condition
    ge $I2, $I1, __label_4
# {
.annotate 'line', 8099
# var argmod: $P2
    $P2 = $P1.'getarg'($I2)
.annotate 'line', 8100
    $P3 = $P2.'isstringliteral'()
    isfalse $I3, $P3
    unless $I3 goto __label_6
.annotate 'line', 8101
    getattribute $P5, $P2, 'start'
    'SyntaxError'('Invalid modifier', $P5)
  __label_6: # endif
.annotate 'line', 8102
    $P3 = $P2.'getPirString'()
    __ARG_1.'print'($P3)
# }
  __label_3: # for iteration
.annotate 'line', 8098
    inc $I2
    goto __label_5
  __label_4: # for end
.annotate 'line', 8104
    __ARG_1.'print'(')')
# }
  __label_2: # endif
# }
    goto __label_0
  __label_1: # endfor
# }
.annotate 'line', 8107

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FunctionModifierList' ]
.annotate 'line', 8085
    get_class $P1, [ 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'FunctionBase' ]

.sub 'FunctionBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8129
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 8130
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'params', $P2
.annotate 'line', 8131
    box $P1, 0
    setattribute self, 'nlabel', $P1
.annotate 'line', 8132
    new $P3, [ 'RegisterStore' ]
    $P3.'RegisterStore'('I')
    set $P2, $P3
    setattribute self, 'regstI', $P2
.annotate 'line', 8133
    new $P3, [ 'RegisterStore' ]
    $P3.'RegisterStore'('N')
    set $P2, $P3
    setattribute self, 'regstN', $P2
.annotate 'line', 8134
    new $P3, [ 'RegisterStore' ]
    $P3.'RegisterStore'('S')
    set $P2, $P3
    setattribute self, 'regstS', $P2
.annotate 'line', 8135
    new $P3, [ 'RegisterStore' ]
    $P3.'RegisterStore'('P')
    set $P2, $P3
    setattribute self, 'regstP', $P2
# }
.annotate 'line', 8136

.end # FunctionBase


.sub 'getouter' :method
# Body
# {
.annotate 'line', 8138
    .return(self)
# }

.end # getouter


.sub 'makesubid' :method
# Body
# {
.annotate 'line', 8142
# var subid: $P1
    getattribute $P1, self, 'subid'
.annotate 'line', 8143
    unless_null $P1, __label_0
# {
.annotate 'line', 8144
    $P1 = self.'generatesubid'()
.annotate 'line', 8145
    setattribute self, 'subid', $P1
# }
  __label_0: # endif
.annotate 'line', 8147
    .return($P1)
# }
.annotate 'line', 8148

.end # makesubid


.sub 'same_scope_as' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8152
# r: $I1
    issame $I1, self, __ARG_1
.annotate 'line', 8153
    .return($I1)
# }
.annotate 'line', 8154

.end # same_scope_as


.sub 'parse_parameters' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8157
# var params: $P1
    getattribute $P1, self, 'params'
.annotate 'line', 8158
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 8159
    $P3 = $P2.'isop'(')')
    isfalse $I1, $P3
    unless $I1 goto __label_0
# {
.annotate 'line', 8160
    __ARG_1.'unget'($P2)
  __label_1: # do
.annotate 'line', 8161
# {
.annotate 'line', 8162
    new $P4, [ 'FunctionParameter' ]
    $P4.'FunctionParameter'(self, __ARG_1)
    set $P3, $P4
# predefined push
    push $P1, $P3
.annotate 'line', 8163
    $P2 = __ARG_1.'get'()
# }
  __label_3: # continue
.annotate 'line', 8164
    $P3 = $P2.'isop'(',')
    if_null $P3, __label_2
    if $P3 goto __label_1
  __label_2: # enddo
.annotate 'line', 8165
    $P3 = $P2.'isop'(')')
    isfalse $I1, $P3
    unless $I1 goto __label_4
.annotate 'line', 8166
    'Expected'("')' or ','", $P2)
  __label_4: # endif
# }
  __label_0: # endif
# }
.annotate 'line', 8168

.end # parse_parameters


.sub 'addlocalfunction' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8172
# var localfun: $P1
    getattribute $P1, self, 'localfun'
.annotate 'line', 8173
    unless_null $P1, __label_0
.annotate 'line', 8174
    root_new $P3, ['parrot';'ResizablePMCArray']
    push $P3, __ARG_1
    setattribute self, 'localfun', $P3
    goto __label_1
  __label_0: # else
.annotate 'line', 8176
# predefined push
    push $P1, __ARG_1
  __label_1: # endif
# }
.annotate 'line', 8177

.end # addlocalfunction


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8181
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 8182
    .return(self)
# }
.annotate 'line', 8183

.end # optimize


.sub 'setusedlex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 8187
# var lexicals: $P1
    getattribute $P1, self, 'usedlexicals'
.annotate 'line', 8188
    unless_null $P1, __label_0
# {
.annotate 'line', 8189
    root_new $P1, ['parrot';'Hash']
.annotate 'line', 8190
    setattribute self, 'usedlexicals', $P1
# }
  __label_0: # endif
.annotate 'line', 8192
    $P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 8193

.end # setusedlex


.sub 'setlex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 8196
# var lexicals: $P1
    getattribute $P1, self, 'lexicals'
.annotate 'line', 8197
    unless_null $P1, __label_0
# {
.annotate 'line', 8198
    root_new $P1, ['parrot';'Hash']
.annotate 'line', 8199
    setattribute self, 'lexicals', $P1
# }
  __label_0: # endif
.annotate 'line', 8201
    $P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 8202

.end # setlex


.sub 'createlex' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8207
# var lex: $P1
    $P1 = __ARG_1.'getlex'()
.annotate 'line', 8208
# lexname: $S1
    null $S1
.annotate 'line', 8209
    if_null $P1, __label_0
.annotate 'line', 8210
    set $S1, $P1
    goto __label_1
  __label_0: # else
# {
.annotate 'line', 8212
# reg: $S2
    $P2 = __ARG_1.'getreg'()
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 8213
# lexnum: $I1
    $P2 = self.'getlexnum'()
    set $I1, $P2
.annotate 'line', 8214
# predefined string
    set $S3, $I1
    concat $S0, '__WLEX_', $S3
    set $S1, $S0
.annotate 'line', 8215
    self.'setlex'($S1, $S2)
.annotate 'line', 8216
    __ARG_1.'setlex'($S1)
# }
  __label_1: # endif
.annotate 'line', 8218
    .return($S1)
# }
.annotate 'line', 8219

.end # createlex


.sub 'createreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8223
# var store: $P1
    null $P1
# switch
.annotate 'line', 8224
    set $S2, __ARG_1
    set $S3, 'I'
    if $S2 == $S3 goto __label_2
    set $S3, 'N'
    if $S2 == $S3 goto __label_3
    set $S3, 'S'
    if $S2 == $S3 goto __label_4
    set $S3, 'P'
    if $S2 == $S3 goto __label_5
    goto __label_1
  __label_2: # case
.annotate 'line', 8226
    getattribute $P1, self, 'regstI'
    goto __label_0 # break
  __label_3: # case
.annotate 'line', 8228
    getattribute $P1, self, 'regstN'
    goto __label_0 # break
  __label_4: # case
.annotate 'line', 8230
    getattribute $P1, self, 'regstS'
    goto __label_0 # break
  __label_5: # case
.annotate 'line', 8232
    getattribute $P1, self, 'regstP'
    goto __label_0 # break
  __label_1: # default
.annotate 'line', 8234
    concat $S4, 'Invalid type in createreg: ', __ARG_1
    'InternalError'($S4)
  __label_0: # switch end
.annotate 'line', 8236
# reg: $S1
    $P2 = $P1.'createreg'()
    null $S1
    if_null $P2, __label_6
    set $S1, $P2
  __label_6:
.annotate 'line', 8237
    .return($S1)
# }
.annotate 'line', 8238

.end # createreg


.sub 'tempreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8241
# var store: $P1
    null $P1
# switch
.annotate 'line', 8242
    set $S2, __ARG_1
    set $S3, 'I'
    if $S2 == $S3 goto __label_2
    set $S3, 'N'
    if $S2 == $S3 goto __label_3
    set $S3, 'S'
    if $S2 == $S3 goto __label_4
    set $S3, 'P'
    if $S2 == $S3 goto __label_5
    goto __label_1
  __label_2: # case
.annotate 'line', 8244
    getattribute $P1, self, 'regstI'
    goto __label_0 # break
  __label_3: # case
.annotate 'line', 8246
    getattribute $P1, self, 'regstN'
    goto __label_0 # break
  __label_4: # case
.annotate 'line', 8248
    getattribute $P1, self, 'regstS'
    goto __label_0 # break
  __label_5: # case
.annotate 'line', 8250
    getattribute $P1, self, 'regstP'
    goto __label_0 # break
  __label_1: # default
.annotate 'line', 8252
    concat $S4, "Invalid type '", __ARG_1
    concat $S4, $S4, "' in tempreg"
    'InternalError'($S4)
  __label_0: # switch end
.annotate 'line', 8254
# reg: $S1
    $P2 = $P1.'tempreg'()
    null $S1
    if_null $P2, __label_6
    set $S1, $P2
  __label_6:
.annotate 'line', 8255
    .return($S1)
# }
.annotate 'line', 8256

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 8259
    root_new $P2, ['parrot';'ResizablePMCArray']
    getattribute $P4, self, 'regstI'
    push $P2, $P4
    getattribute $P5, self, 'regstN'
    push $P2, $P5
    getattribute $P6, self, 'regstS'
    push $P2, $P6
    getattribute $P7, self, 'regstP'
    push $P2, $P7
    iter $P8, $P2
    set $P8, 0
  __label_0: # for iteration
    unless $P8 goto __label_1
    shift $P1, $P8
.annotate 'line', 8260
    $P1.'freetemps'()
    goto __label_0
  __label_1: # endfor
# }
.annotate 'line', 8261

.end # freetemps


.sub 'genlabel' :method
# Body
# {
.annotate 'line', 8264
# var nlabel: $P1
    getattribute $P1, self, 'nlabel'
.annotate 'line', 8265
# n: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 8266
# s: $S1
    set $I2, $I1
    inc $I1
    set $S2, $I2
    concat $S1, '__label_', $S2
.annotate 'line', 8267
    assign $P1, $I1
.annotate 'line', 8268
    .return($S1)
# }
.annotate 'line', 8269

.end # genlabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8272
    'SyntaxError'('break not allowed here', __ARG_1)
# }
.annotate 'line', 8273

.end # getbreaklabel


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8276
    'SyntaxError'('continue not allowed here', __ARG_1)
# }
.annotate 'line', 8277

.end # getcontinuelabel


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8281
# name: $S1
    getattribute $P10, self, 'name'
    null $S1
    if_null $P10, __label_0
    set $S1, $P10
  __label_0:
.annotate 'line', 8282
    __ARG_1.'say'()
.annotate 'line', 8283
    __ARG_1.'print'(".sub ")
.annotate 'line', 8284
    $P10 = self.'isanonymous'()
    if_null $P10, __label_1
    unless $P10 goto __label_1
.annotate 'line', 8285
    __ARG_1.'print'("'' :anon")
    goto __label_2
  __label_1: # else
.annotate 'line', 8287
    __ARG_1.'print'("'", $S1, "'")
  __label_2: # endif
.annotate 'line', 8288
    getattribute $P10, self, 'subid'
    if_null $P10, __label_3
.annotate 'line', 8289
    getattribute $P11, self, 'subid'
    __ARG_1.'print'(" :subid('", $P11, "')")
  __label_3: # endif
.annotate 'line', 8290
    getattribute $P10, self, 'outer'
    if_null $P10, __label_4
# {
.annotate 'line', 8291
# var outer: $P1
    getattribute $P1, self, 'outer'
.annotate 'line', 8292
# var outerid: $P2
    getattribute $P2, $P1, 'subid'
.annotate 'line', 8293
    if_null $P2, __label_5
.annotate 'line', 8294
    __ARG_1.'print'(" :outer('", $P2, "')")
  __label_5: # endif
# }
  __label_4: # endif
.annotate 'line', 8298
    $P10 = self.'ismethod'()
    if_null $P10, __label_6
    unless $P10 goto __label_6
.annotate 'line', 8299
    __ARG_1.'print'(' :method')
  __label_6: # endif
.annotate 'line', 8300
# var modifiers: $P3
    getattribute $P3, self, 'modifiers'
.annotate 'line', 8301
    if_null $P3, __label_7
.annotate 'line', 8302
    $P3.'emit'(__ARG_1)
    goto __label_8
  __label_7: # else
# {
.annotate 'line', 8304
    ne $S1, 'main', __label_9
.annotate 'line', 8305
    __ARG_1.'print'(' :main')
  __label_9: # endif
# }
  __label_8: # endif
.annotate 'line', 8307
    __ARG_1.'say'()
.annotate 'line', 8310
    getattribute $P10, self, 'params'
    iter $P12, $P10
    set $P12, 0
  __label_10: # for iteration
    unless $P12 goto __label_11
    shift $P4, $P12
.annotate 'line', 8311
    $P4.'emit'(self, __ARG_1)
    goto __label_10
  __label_11: # endfor
.annotate 'line', 8313
# var lexicals: $P5
    getattribute $P5, self, 'lexicals'
.annotate 'line', 8314
# var usedlexicals: $P6
    getattribute $P6, self, 'usedlexicals'
.annotate 'line', 8315
    isnull $I2, $P5
    not $I2
    if $I2 goto __label_13
    isnull $I2, $P6
    not $I2
  __label_13:
    unless $I2 goto __label_12
# {
.annotate 'line', 8316
    getattribute $P10, self, 'start'
    __ARG_1.'annotate'($P10)
.annotate 'line', 8318
    if_null $P5, __label_14
# {
.annotate 'line', 8320
    iter $P13, $P5
    set $P13, 0
  __label_15: # for iteration
    unless $P13 goto __label_16
    shift $S2, $P13
.annotate 'line', 8321
    $P10 = $P5[$S2]
    __ARG_1.'say'(".lex '", $P10, "', ", $S2)
    goto __label_15
  __label_16: # endfor
# }
  __label_14: # endif
.annotate 'line', 8324
    if_null $P6, __label_17
# {
.annotate 'line', 8326
    iter $P14, $P6
    set $P14, 0
  __label_18: # for iteration
    unless $P14 goto __label_19
    shift $S3, $P14
.annotate 'line', 8327
    $P10 = $P6[$S3]
    __ARG_1.'emitfind_lex'($S3, $P10)
    goto __label_18
  __label_19: # endfor
# }
  __label_17: # endif
# }
  __label_12: # endif
.annotate 'line', 8331
# var body: $P7
    getattribute $P7, self, 'body'
.annotate 'line', 8332
    $P10 = $P7.'isempty'()
    if_null $P10, __label_20
    unless $P10 goto __label_20
.annotate 'line', 8333
    __ARG_1.'comment'('Empty body')
    goto __label_21
  __label_20: # else
# {
.annotate 'line', 8335
    __ARG_1.'comment'('Body')
.annotate 'line', 8336
    $P7.'emit'(__ARG_1)
.annotate 'line', 8337
    $P10 = $P7.'getend'()
    __ARG_1.'annotate'($P10)
# }
  __label_21: # endif
.annotate 'line', 8339
    __ARG_1.'say'("\n.end # ", $S1, "\n")
.annotate 'line', 8342
# var localfun: $P8
    getattribute $P8, self, 'localfun'
.annotate 'line', 8343
    if_null $P8, __label_22
# {
# for loop
.annotate 'line', 8344
# ifn: $I1
    null $I1
  __label_25: # for condition
# predefined elements
    elements $I2, $P8
    ge $I1, $I2, __label_24
# {
.annotate 'line', 8345
# var fn: $P9
    $P9 = $P8[$I1]
.annotate 'line', 8346
    $P9.'emit'(__ARG_1)
# }
  __label_23: # for iteration
.annotate 'line', 8344
    inc $I1
    goto __label_25
  __label_24: # for end
# }
  __label_22: # endif
# }
.annotate 'line', 8349

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FunctionBase' ]
.annotate 'line', 8110
    get_class $P1, [ 'BlockStatement' ]
    addparent $P0, $P1
.annotate 'line', 8112
    addattribute $P0, 'name'
.annotate 'line', 8113
    addattribute $P0, 'subid'
.annotate 'line', 8114
    addattribute $P0, 'modifiers'
.annotate 'line', 8115
    addattribute $P0, 'params'
.annotate 'line', 8116
    addattribute $P0, 'body'
.annotate 'line', 8117
    addattribute $P0, 'regstI'
.annotate 'line', 8118
    addattribute $P0, 'regstN'
.annotate 'line', 8119
    addattribute $P0, 'regstS'
.annotate 'line', 8120
    addattribute $P0, 'regstP'
.annotate 'line', 8121
    addattribute $P0, 'nlabel'
.annotate 'line', 8122
    addattribute $P0, 'localfun'
.annotate 'line', 8123
    addattribute $P0, 'lexicals'
.annotate 'line', 8124
    addattribute $P0, 'usedlexicals'
.annotate 'line', 8125
    addattribute $P0, 'outer'
.end
.namespace [ 'FunctionStatement' ]

.sub 'FunctionStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8363
    self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 8364
    box $P1, 0
    setattribute self, 'paramnum', $P1
.annotate 'line', 8365
    box $P1, 0
    setattribute self, 'lexnum', $P1
.annotate 'line', 8366
    self.'parse'(__ARG_2)
# }
.annotate 'line', 8367

.end # FunctionStatement


.sub 'isanonymous' :method
# Body
# {
.annotate 'line', 8369
    .return(0)
# }

.end # isanonymous


.sub 'getparamnum' :method
# Body
# {
.annotate 'line', 8373
# var paramnum: $P1
    getattribute $P1, self, 'paramnum'
.annotate 'line', 8374
# n: $I1
    set $I2, $P1
    add $I1, $I2, 1
.annotate 'line', 8375
    assign $P1, $I1
.annotate 'line', 8376
    .return($I1)
# }
.annotate 'line', 8377

.end # getparamnum


.sub 'getlexnum' :method
# Body
# {
.annotate 'line', 8381
# var lexnum: $P1
    getattribute $P1, self, 'lexnum'
.annotate 'line', 8382
# n: $I1
    set $I2, $P1
    add $I1, $I2, 1
.annotate 'line', 8383
    assign $P1, $I1
.annotate 'line', 8384
    .return($I1)
# }
.annotate 'line', 8385

.end # getlexnum


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 8386
    .return(0)
# }

.end # ismethod


.sub 'parse' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8390
# var name: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8391
    setattribute self, 'name', $P1
.annotate 'line', 8392
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 8393
    $P4 = $P2.'isop'('[')
    if_null $P4, __label_0
    unless $P4 goto __label_0
# {
.annotate 'line', 8394
    new $P7, [ 'FunctionModifierList' ]
    $P7.'FunctionModifierList'(__ARG_1, self)
    set $P6, $P7
    setattribute self, 'modifiers', $P6
.annotate 'line', 8395
    $P2 = __ARG_1.'get'()
# }
  __label_0: # endif
.annotate 'line', 8397
    'RequireOp'('(', $P2)
.annotate 'line', 8398
    self.'parse_parameters'(__ARG_1)
.annotate 'line', 8400
# var fullname: $P3
    getattribute $P5, self, 'owner'
    $P4 = $P5.'getpath'()
# predefined clone
    clone $P3, $P4
.annotate 'line', 8401
    $P4 = $P1.'getidentifier'()
# predefined push
    push $P3, $P4
.annotate 'line', 8403
    new $P5, [ 'StringLiteral' ]
.annotate 'line', 8404
    new $P7, [ 'TokenQuoted' ]
    getattribute $P8, $P1, 'file'
    getattribute $P9, $P1, 'line'
# predefined join
    join $S1, '.', $P3
    $P7.'TokenQuoted'($P8, $P9, $S1)
    set $P6, $P7
    $P5.'StringLiteral'(self, $P6)
    set $P4, $P5
.annotate 'line', 8402
    self.'createconst'('__FUNCTION__', 'S', $P4, '')
.annotate 'line', 8407
    $P2 = __ARG_1.'get'()
.annotate 'line', 8408
    $P4 = $P2.'isop'('{')
    isfalse $I1, $P4
    unless $I1 goto __label_1
.annotate 'line', 8409
    'ExpectedOp'('{', $P2)
  __label_1: # endif
.annotate 'line', 8410
    new $P6, [ 'CompoundStatement' ]
    $P6.'CompoundStatement'($P2, __ARG_1, self)
    set $P5, $P6
    setattribute self, 'body', $P5
.annotate 'line', 8411
    .return(self)
# }
.annotate 'line', 8412

.end # parse

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FunctionStatement' ]
.annotate 'line', 8356
    get_class $P1, [ 'FunctionBase' ]
    addparent $P0, $P1
.annotate 'line', 8358
    addattribute $P0, 'paramnum'
.annotate 'line', 8359
    addattribute $P0, 'lexnum'
.end
.namespace [ 'LocalFunctionStatement' ]

.sub 'LocalFunctionStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8423
    self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 8424
    $P4 = __ARG_3.'getouter'()
    setattribute self, 'outer', $P4
.annotate 'line', 8425
    getattribute $P3, self, 'outer'
    $P3.'makesubid'()
.annotate 'line', 8426
# var subid: $P1
    $P1 = self.'makesubid'()
.annotate 'line', 8427
    setattribute self, 'name', $P1
.annotate 'line', 8428
    self.'parse_parameters'(__ARG_2)
.annotate 'line', 8429
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 8430
    'RequireOp'('{', $P2)
.annotate 'line', 8431
    new $P5, [ 'CompoundStatement' ]
    $P5.'CompoundStatement'($P2, __ARG_2, self)
    set $P4, $P5
    setattribute self, 'body', $P4
.annotate 'line', 8432
    __ARG_3.'addlocalfunction'(self)
# }
.annotate 'line', 8433

.end # LocalFunctionStatement


.sub 'isanonymous' :method
# Body
# {
.annotate 'line', 8434
    .return(1)
# }

.end # isanonymous


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 8435
    .return(0)
# }

.end # ismethod


.sub 'getsubid' :method
# Body
# {
.annotate 'line', 8438
    getattribute $P1, self, 'subid'
    .return($P1)
# }
.annotate 'line', 8439

.end # getsubid


.sub 'getparamnum' :method
# Body
# {
.annotate 'line', 8443
    getattribute $P1, self, 'outer'
    .tailcall $P1.'getparamnum'()
# }
.annotate 'line', 8444

.end # getparamnum


.sub 'getlexnum' :method
# Body
# {
.annotate 'line', 8448
    getattribute $P1, self, 'outer'
    .tailcall $P1.'getlexnum'()
# }
.annotate 'line', 8449

.end # getlexnum


.sub 'getvar' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8452
# var r: $P1
    $P1 = self.'getlocalvar'(__ARG_1)
.annotate 'line', 8453
    unless_null $P1, __label_0
# {
.annotate 'line', 8456
    getattribute $P6, self, 'owner'
    $P1 = $P6.'getvar'(__ARG_1)
.annotate 'line', 8457
    unless_null $P1, __label_1
# {
.annotate 'line', 8459
    ne __ARG_1, 'self', __label_3
# {
.annotate 'line', 8460
# var ownerscope: $P2
    getattribute $P2, self, 'outer'
.annotate 'line', 8461
    getattribute $P7, self, 'outer'
    $P6 = $P7.'ismethod'()
    if_null $P6, __label_4
    unless $P6 goto __label_4
# {
.annotate 'line', 8462
# lexself: $S1
    $P8 = $P2.'makelexicalself'()
    null $S1
    if_null $P8, __label_5
    set $S1, $P8
  __label_5:
.annotate 'line', 8463
    $P1 = self.'createvar'(__ARG_1, 'P')
.annotate 'line', 8464
# reg: $S2
    $P6 = $P1.'getreg'()
    null $S2
    if_null $P6, __label_6
    set $S2, $P6
  __label_6:
.annotate 'line', 8465
    self.'setusedlex'($S1, $S2)
# }
  __label_4: # endif
# }
  __label_3: # endif
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 8469
    $P6 = $P1.'gettype'()
    set $S5, $P6
    iseq $I2, $S5, 'P'
    unless $I2 goto __label_8
    $P7 = $P1.'isconst'()
    isfalse $I2, $P7
  __label_8:
    unless $I2 goto __label_7
# {
.annotate 'line', 8470
# var scope: $P3
    $P3 = $P1.'getscope'()
.annotate 'line', 8471
# var ownerscope: $P4
    $P4 = $P3.'getouter'()
.annotate 'line', 8472
# var outer: $P5
    getattribute $P5, self, 'outer'
.annotate 'line', 8473
    isa $I2, $P4, [ 'FunctionBase' ]
    unless $I2 goto __label_9
# {
.annotate 'line', 8474
    $P6 = $P4.'same_scope_as'($P5)
    if_null $P6, __label_10
    unless $P6 goto __label_10
# {
.annotate 'line', 8475
# lexname: $S3
    $P7 = $P3.'makelexical'($P1)
    null $S3
    if_null $P7, __label_11
    set $S3, $P7
  __label_11:
.annotate 'line', 8476
# flags: $I1
    $I2 = $P1.'getflags'()
    bor $I1, $I2, 2
.annotate 'line', 8477
    $P1 = self.'createvar'(__ARG_1, 'P', $I1)
.annotate 'line', 8478
    box $P6, $S3
    setattribute $P1, 'lexname', $P6
.annotate 'line', 8479
# reg: $S4
    $P6 = $P1.'getreg'()
    null $S4
    if_null $P6, __label_12
    set $S4, $P6
  __label_12:
.annotate 'line', 8480
    self.'setusedlex'($S3, $S4)
# }
  __label_10: # endif
# }
  __label_9: # endif
# }
  __label_7: # endif
  __label_2: # endif
# }
  __label_0: # endif
.annotate 'line', 8485
    isnull $I2, $P1
    not $I2
    unless $I2 goto __label_14
    isa $I3, $P1, [ 'VarData' ]
    not $I2, $I3
  __label_14:
    unless $I2 goto __label_13
.annotate 'line', 8486
    'InternalError'('Incorrect data for variable in LocalFunction')
  __label_13: # endif
.annotate 'line', 8487
    .return($P1)
# }
.annotate 'line', 8488

.end # getvar

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'LocalFunctionStatement' ]
.annotate 'line', 8419
    get_class $P1, [ 'FunctionBase' ]
    addparent $P0, $P1
.end
.namespace [ 'MethodStatement' ]

.sub 'MethodStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8499
    self.'FunctionStatement'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 8500

.end # MethodStatement


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 8501
    .return(1)
# }

.end # ismethod

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MethodStatement' ]
.annotate 'line', 8495
    get_class $P1, [ 'FunctionStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'SigParameter' ]

.sub 'SigParameter' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8515
# var name: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8516
    $P4 = $P1.'isidentifier'()
    isfalse $I1, $P4
    unless $I1 goto __label_0
.annotate 'line', 8517
    'SyntaxError'("Identifier expected", $P1)
  __label_0: # endif
.annotate 'line', 8518
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 8519
    $P4 = $P2.'isidentifier'()
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 8520
# type: $S1
    $P6 = $P1.'checkkeyword'()
    $P5 = 'typetoregcheck'($P6)
    null $S1
    if_null $P5, __label_2
    set $S1, $P5
  __label_2:
.annotate 'line', 8521
    set $P1, $P2
.annotate 'line', 8522
    __ARG_2.'createvar'($P1, $S1)
.annotate 'line', 8523
    $P2 = __ARG_1.'get'()
# }
  __label_1: # endif
.annotate 'line', 8525
    setattribute self, 'name', $P1
.annotate 'line', 8526
# var data: $P3
    $P4 = $P1.'getidentifier'()
    $P3 = __ARG_2.'getvar'($P4)
.annotate 'line', 8527
    $P5 = $P3.'getreg'()
    setattribute self, 'reg', $P5
.annotate 'line', 8528
    $P4 = $P2.'isop'('[')
    if_null $P4, __label_3
    unless $P4 goto __label_3
.annotate 'line', 8529
    new $P7, [ 'ParameterModifierList' ]
    $P7.'ParameterModifierList'(__ARG_1, self)
    set $P6, $P7
    setattribute self, 'modifiers', $P6
    goto __label_4
  __label_3: # else
.annotate 'line', 8531
    __ARG_1.'unget'($P2)
  __label_4: # endif
# }
.annotate 'line', 8532

.end # SigParameter


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8535
    getattribute $P3, self, 'reg'
    __ARG_1.'print'($P3)
.annotate 'line', 8536
# var modifiers: $P1
    getattribute $P1, self, 'modifiers'
.annotate 'line', 8537
    if_null $P1, __label_0
# {
.annotate 'line', 8538
# var name: $P2
    getattribute $P2, self, 'name'
.annotate 'line', 8539
    $P1.'emitmodifiers'(__ARG_1, $P2, $P2)
# }
  __label_0: # endif
# }
.annotate 'line', 8541

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'SigParameter' ]
.annotate 'line', 8510
    addattribute $P0, 'name'
.annotate 'line', 8511
    addattribute $P0, 'modifiers'
.annotate 'line', 8512
    addattribute $P0, 'reg'
.end
.namespace [ 'SigParameterList' ]

.sub 'SigParameterList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8549
# var t: $P1
    null $P1
.annotate 'line', 8550
# var params: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
  __label_0: # do
.annotate 'line', 8551
# {
.annotate 'line', 8552
# var sigelem: $P3
    new $P3, [ 'SigParameter' ]
    $P3.'SigParameter'(__ARG_1, __ARG_2)
.annotate 'line', 8553
    $P2.'push'($P3)
.annotate 'line', 8554
    $P1 = __ARG_1.'get'()
# }
  __label_2: # continue
.annotate 'line', 8555
    $P4 = $P1.'isop'(',')
    if_null $P4, __label_1
    if $P4 goto __label_0
  __label_1: # enddo
.annotate 'line', 8556
    $P4 = $P1.'isop'(')')
    isfalse $I1, $P4
    unless $I1 goto __label_3
.annotate 'line', 8557
    'SyntaxError'("Expected ',' or ')'", $P1)
  __label_3: # endif
.annotate 'line', 8558
    setattribute self, 'params', $P2
# }
.annotate 'line', 8559

.end # SigParameterList


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8562
    __ARG_1.'print'('(')
.annotate 'line', 8563
# sep: $S1
    set $S1, ''
.annotate 'line', 8564
    getattribute $P2, self, 'params'
    iter $P3, $P2
    set $P3, 0
  __label_0: # for iteration
    unless $P3 goto __label_1
    shift $P1, $P3
# {
.annotate 'line', 8565
    __ARG_1.'print'($S1)
.annotate 'line', 8566
    $P1.'emit'(__ARG_1)
.annotate 'line', 8567
    set $S1, ', '
# }
    goto __label_0
  __label_1: # endfor
.annotate 'line', 8569
    __ARG_1.'print'(')')
# }
.annotate 'line', 8570

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'SigParameterList' ]
.annotate 'line', 8546
    addattribute $P0, 'params'
.end
.namespace [ 'MultiAssignStatement' ]

.sub 'MultiAssignStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8579
    setattribute self, 'params', __ARG_1
.annotate 'line', 8580
    setattribute self, 'expr', __ARG_2
# }
.annotate 'line', 8581

.end # MultiAssignStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8584
    getattribute $P3, self, 'expr'
    $P2 = $P3.'optimize'()
    setattribute self, 'expr', $P2
.annotate 'line', 8585
    .return(self)
# }
.annotate 'line', 8586

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8589
# var expr: $P1
    getattribute $P1, self, 'expr'
.annotate 'line', 8590
# var call: $P2
    $P2 = $P1.'emitcall'(__ARG_1)
.annotate 'line', 8591
    __ARG_1.'print'('    ')
.annotate 'line', 8592
    getattribute $P3, self, 'params'
    $P3.'emit'(__ARG_1)
.annotate 'line', 8593
    __ARG_1.'print'(' = ', $P2)
.annotate 'line', 8594
    getattribute $P3, self, 'expr'
    $P3.'emitargs'(__ARG_1)
.annotate 'line', 8595
    __ARG_1.'say'()
# }
.annotate 'line', 8596

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MultiAssignStatement' ]
.annotate 'line', 8575
    addattribute $P0, 'params'
.annotate 'line', 8576
    addattribute $P0, 'expr'
.end
.namespace [ ]
# Constant CLASSSPECIFIER_invalid evaluated at compile time
# Constant CLASSSPECIFIER_str evaluated at compile time
# Constant CLASSSPECIFIER_parrotkey evaluated at compile time
# Constant CLASSSPECIFIER_id evaluated at compile time
.namespace [ 'ClassSpecifier' ]

.sub 'ClassSpecifier' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8613
    self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 8614

.end # ClassSpecifier


.sub 'reftype' :method
# Body
# {
.annotate 'line', 8615
    .return(0)
# }

.end # reftype


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8619
    getattribute $P1, self, 'start'
    __ARG_1.'annotate'($P1)
# }
.annotate 'line', 8620

.end # annotate

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassSpecifier' ]
.annotate 'line', 8609
    get_class $P1, [ 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'ClassSpecifierStr' ]

.sub 'ClassSpecifierStr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8628
    self.'ClassSpecifier'(__ARG_1, __ARG_2)
.annotate 'line', 8629
    setattribute self, 'name', __ARG_2
# }
.annotate 'line', 8630

.end # ClassSpecifierStr


.sub 'reftype' :method
# Body
# {
.annotate 'line', 8631
    .return(1)
# }

.end # reftype


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8635
# basestr: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 8636
    __ARG_1.'print'($S1)
# }
.annotate 'line', 8637

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassSpecifierStr' ]
.annotate 'line', 8623
    get_class $P1, [ 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 8625
    addattribute $P0, 'name'
.end
.namespace [ 'ClassSpecifierParrotKey' ]

.sub 'ClassSpecifierParrotKey' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8646
    self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 8647
# var key: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 8648
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 8649
    $P3 = $P2.'isstring'()
    isfalse $I1, $P3
    unless $I1 goto __label_0
.annotate 'line', 8650
    'Expected'('literal string', $P2)
  __label_0: # endif
.annotate 'line', 8651
    $P3 = $P2.'rawstring'()
# predefined push
    push $P1, $P3
.annotate 'line', 8652
    $P2 = __ARG_1.'get'()
.annotate 'line', 8653
    $P3 = $P2.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_1
# {
# switch
.annotate 'line', 8654
    $P4 = $P2.'checkop'()
    set $S1, $P4
    set $S2, ':'
    if $S1 == $S2 goto __label_4
    set $S2, ','
    if $S1 == $S2 goto __label_5
    goto __label_3
  __label_4: # case
.annotate 'line', 8656
    box $P5, 1
    setattribute self, 'hll', $P5
  __label_5: # case
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 8660
    'SyntaxError'('Unexpected token in class key', $P2)
  __label_2: # switch end
  __label_6: # do
.annotate 'line', 8662
# {
.annotate 'line', 8663
    $P2 = __ARG_1.'get'()
.annotate 'line', 8664
    $P3 = $P2.'isstring'()
    isfalse $I1, $P3
    unless $I1 goto __label_9
.annotate 'line', 8665
    'Expected'('literal string', $P2)
  __label_9: # endif
.annotate 'line', 8666
    $P3 = $P2.'rawstring'()
# predefined push
    push $P1, $P3
# }
  __label_8: # continue
.annotate 'line', 8667
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'(',')
    if_null $P3, __label_7
    if $P3 goto __label_6
  __label_7: # enddo
.annotate 'line', 8668
    'RequireOp'(']', $P2)
# }
  __label_1: # endif
.annotate 'line', 8670
    setattribute self, 'key', $P1
# }
.annotate 'line', 8671

.end # ClassSpecifierParrotKey


.sub 'reftype' :method
# Body
# {
.annotate 'line', 8672
    .return(2)
# }

.end # reftype


.sub 'hasHLL' :method
# Body
# {
# predefined int
.annotate 'line', 8675
    getattribute $P1, self, 'hll'
    isnull $I1, $P1
    not $I1
    .return($I1)
# }
.annotate 'line', 8676

.end # hasHLL


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8680
    getattribute $P2, self, 'key'
    $P1 = 'getparrotkey'($P2)
    __ARG_1.'print'($P1)
# }
.annotate 'line', 8681

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassSpecifierParrotKey' ]
.annotate 'line', 8640
    get_class $P1, [ 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 8642
    addattribute $P0, 'key'
.annotate 'line', 8643
    addattribute $P0, 'hll'
.end
.namespace [ 'ClassSpecifierId' ]

.sub 'ClassSpecifierId' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8689
    self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 8690
# var key: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
# predefined string
    set $S1, __ARG_3
    box $P3, $S1
    push $P1, $P3
.annotate 'line', 8691
# var t: $P2
    null $P2
  __label_1: # while
.annotate 'line', 8692
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_0
    unless $P3 goto __label_0
# {
.annotate 'line', 8693
    $P2 = __ARG_1.'get'()
.annotate 'line', 8694
# predefined string
    set $S1, $P2
# predefined push
    push $P1, $S1
# }
    goto __label_1
  __label_0: # endwhile
.annotate 'line', 8696
    __ARG_1.'unget'($P2)
.annotate 'line', 8697
    setattribute self, 'key', $P1
# }
.annotate 'line', 8698

.end # ClassSpecifierId


.sub 'reftype' :method
# Body
# {
.annotate 'line', 8699
    .return(3)
# }

.end # reftype


.sub 'last' :method
# Body
# {
.annotate 'line', 8703
# var key: $P1
    getattribute $P1, self, 'key'
.annotate 'line', 8704
    $P2 = $P1[-1]
    .return($P2)
# }
.annotate 'line', 8705

.end # last


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8709
# var key: $P1
    getattribute $P2, self, 'key'
    $P1 = __ARG_2.'findclasskey'($P2)
.annotate 'line', 8710
    unless_null $P1, __label_0
# {
.annotate 'line', 8711
    $P2 = self.'dowarnings'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 8712
    getattribute $P3, self, 'key'
# predefined join
    join $S1, ".", $P3
    concat $S2, "class ", $S1
    concat $S2, $S2, " not found at compile time"
    'Warn'($S2)
  __label_2: # endif
.annotate 'line', 8713
    getattribute $P3, self, 'key'
    $P2 = 'getparrotkey'($P3)
    __ARG_1.'print'($P2)
# }
    goto __label_1
  __label_0: # else
.annotate 'line', 8715
    $P2 = $P1.'getclasskey'()
    __ARG_1.'print'($P2)
  __label_1: # endif
# }
.annotate 'line', 8716

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassSpecifierId' ]
.annotate 'line', 8684
    get_class $P1, [ 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 8686
    addattribute $P0, 'key'
.end
.namespace [ ]

.sub 'parseClassSpecifier'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8721
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8722
    $P2 = $P1.'isstring'()
    if_null $P2, __label_0
    unless $P2 goto __label_0
.annotate 'line', 8723
    new $P4, [ 'ClassSpecifierStr' ]
    $P4.'ClassSpecifierStr'(__ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_0: # endif
.annotate 'line', 8724
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 8725
    new $P4, [ 'ClassSpecifierParrotKey' ]
    $P4.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_1: # endif
.annotate 'line', 8726
    $P2 = $P1.'isidentifier'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 8727
    new $P4, [ 'ClassSpecifierId' ]
    $P4.'ClassSpecifierId'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_2: # endif
.annotate 'line', 8728
    'SyntaxError'('Invalid class', $P1)
# }
.annotate 'line', 8729

.end # parseClassSpecifier

.namespace [ 'ClassBase' ]

.sub 'ClassBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8741
    self.'initbase'(__ARG_1, __ARG_3)
.annotate 'line', 8742
    setattribute self, 'name', __ARG_2
.annotate 'line', 8743
# var classns: $P1
    $P2 = __ARG_3.'getpath'()
# predefined clone
    clone $P1, $P2
.annotate 'line', 8744
    getattribute $P2, self, 'name'
# predefined push
    push $P1, $P2
.annotate 'line', 8745
    setattribute self, 'classns', $P1
# }
.annotate 'line', 8746

.end # ClassBase


.sub 'getclasskey' :method
# Body
# {
.annotate 'line', 8749
    getattribute $P1, self, 'classns'
    .tailcall 'getparrotkey'($P1)
# }
.annotate 'line', 8750

.end # getclasskey

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassBase' ]
.annotate 'line', 8735
    get_class $P1, [ 'CommonBase' ]
    addparent $P0, $P1
.annotate 'line', 8737
    addattribute $P0, 'name'
.annotate 'line', 8738
    addattribute $P0, 'classns'
.end
.namespace [ 'ClassStatement' ]

.sub 'ClassStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 8763
    self.'ClassBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 8764
    setattribute self, 'parent', __ARG_3
.annotate 'line', 8765
# var functions: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 8766
    setattribute self, 'functions', $P1
.annotate 'line', 8767
# var members: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 8768
    setattribute self, 'members', $P2
.annotate 'line', 8769
    root_new $P11, ['parrot';'ResizablePMCArray']
    setattribute self, 'bases', $P11
.annotate 'line', 8770
# var constants: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 8771
    setattribute self, 'constants', $P3
.annotate 'line', 8773
# var t: $P4
    $P4 = __ARG_4.'get'()
.annotate 'line', 8774
    $P10 = $P4.'isop'(':')
    if_null $P10, __label_0
    unless $P10 goto __label_0
# {
.annotate 'line', 8775
# var bases: $P5
    getattribute $P5, self, 'bases'
  __label_2: # Infinite loop
.annotate 'line', 8776
# {
.annotate 'line', 8777
# var base: $P6
    $P6 = 'parseClassSpecifier'(__ARG_4, self)
.annotate 'line', 8778
# predefined push
    push $P5, $P6
.annotate 'line', 8779
    $P4 = __ARG_4.'get'()
.annotate 'line', 8780
    $P10 = $P4.'isop'(',')
    isfalse $I1, $P10
    unless $I1 goto __label_3
    goto __label_1 # break
  __label_3: # endif
# }
    goto __label_2
  __label_1: # Infinite loop end
# }
  __label_0: # endif
.annotate 'line', 8783
    'RequireOp'('{', $P4)
# for loop
.annotate 'line', 8784
    $P4 = __ARG_4.'get'()
  __label_6: # for condition
    $P10 = $P4.'isop'('}')
    isfalse $I1, $P10
    unless $I1 goto __label_5
# {
# switch
.annotate 'line', 8785
    $P11 = $P4.'checkkeyword'()
    set $S1, $P11
    set $S2, 'function'
    if $S1 == $S2 goto __label_9
    set $S2, 'var'
    if $S1 == $S2 goto __label_10
    set $S2, 'const'
    if $S1 == $S2 goto __label_11
    goto __label_8
  __label_9: # case
.annotate 'line', 8787
# var f: $P7
    new $P7, [ 'MethodStatement' ]
    $P7.'MethodStatement'($P4, __ARG_4, self)
.annotate 'line', 8788
# predefined push
    push $P1, $P7
    goto __label_7 # break
  __label_10: # case
.annotate 'line', 8791
# var name: $P8
    $P8 = __ARG_4.'get'()
.annotate 'line', 8792
    $P12 = $P8.'isidentifier'()
    isfalse $I2, $P12
    unless $I2 goto __label_12
.annotate 'line', 8793
    'Expected'("member identifier", $P8)
  __label_12: # endif
.annotate 'line', 8794
# predefined push
    push $P2, $P8
.annotate 'line', 8795
    $P4 = __ARG_4.'get'()
.annotate 'line', 8796
    $P13 = $P4.'isop'(';')
    isfalse $I3, $P13
    unless $I3 goto __label_13
.annotate 'line', 8797
    'Expected'("';' in member declaration", $P4)
  __label_13: # endif
    goto __label_7 # break
  __label_11: # case
.annotate 'line', 8800
# var cst: $P9
    $P9 = 'parseConst'($P4, __ARG_4, self)
.annotate 'line', 8801
# predefined push
    push $P3, $P9
    goto __label_7 # break
  __label_8: # default
.annotate 'line', 8804
    'SyntaxError'("Unexpected item in class", $P4)
  __label_7: # switch end
# }
  __label_4: # for iteration
.annotate 'line', 8784
    $P4 = __ARG_4.'get'()
    goto __label_6
  __label_5: # for end
# }
.annotate 'line', 8807

.end # ClassStatement


.sub 'getpath' :method
# Body
# {
.annotate 'line', 8810
    getattribute $P1, self, 'classns'
    .return($P1)
# }
.annotate 'line', 8811

.end # getpath


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 8814
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 8815

.end # generatesubid


.sub 'findsymbol' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8818
    getattribute $P1, self, 'parent'
    .tailcall $P1.'findsymbol'(__ARG_1)
# }
.annotate 'line', 8819

.end # findsymbol


.sub 'findclasskey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8822
    getattribute $P1, self, 'parent'
    .tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 8823

.end # findclasskey


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8826
    getattribute $P1, self, 'parent'
    .tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 8827

.end # checkclass


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8830
    getattribute $P1, self, 'owner'
    .tailcall $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 8831

.end # use_predef


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8834
    getattribute $P1, self, 'constants'
    'optimize_array'($P1)
.annotate 'line', 8835
    getattribute $P1, self, 'functions'
    'optimize_array'($P1)
.annotate 'line', 8836
    .return(self)
# }
.annotate 'line', 8837

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8840
# var classns: $P1
    getattribute $P1, self, 'classns'
.annotate 'line', 8841
    $P5 = 'getparrotnamespacekey'($P1)
    __ARG_1.'say'($P5)
.annotate 'line', 8842
    getattribute $P5, self, 'functions'
    iter $P6, $P5
    set $P6, 0
  __label_0: # for iteration
    unless $P6 goto __label_1
    shift $P2, $P6
.annotate 'line', 8843
    $P2.'emit'(__ARG_1)
    goto __label_0
  __label_1: # endfor
.annotate 'line', 8845
    __ARG_1.'say'('.sub Winxed_class_init :anon :load :init')
.annotate 'line', 8847
    $P5 = self.'getclasskey'()
    __ARG_1.'say'('    ', 'newclass $P0, ', $P5)
.annotate 'line', 8848
# n: $I1
    set $I1, 1
.annotate 'line', 8849
    getattribute $P5, self, 'bases'
    iter $P7, $P5
    set $P7, 0
  __label_2: # for iteration
    unless $P7 goto __label_3
    shift $P3, $P7
# {
.annotate 'line', 8850
    $P3.'annotate'(__ARG_1)
.annotate 'line', 8851
# reg: $S1
    set $I2, $I1
    inc $I1
    set $S2, $I2
    concat $S1, "$P", $S2
.annotate 'line', 8852
    __ARG_1.'print'('    ', 'get_class ', $S1, ', ')
.annotate 'line', 8853
    getattribute $P5, self, 'parent'
    $P3.'emit'(__ARG_1, $P5)
.annotate 'line', 8854
    __ARG_1.'say'()
.annotate 'line', 8855
    __ARG_1.'say'('    ', 'addparent $P0, ', $S1)
# }
    goto __label_2
  __label_3: # endfor
.annotate 'line', 8857
    getattribute $P5, self, 'members'
    iter $P8, $P5
    set $P8, 0
  __label_4: # for iteration
    unless $P8 goto __label_5
    shift $P4, $P8
# {
.annotate 'line', 8858
    __ARG_1.'annotate'($P4)
.annotate 'line', 8859
    __ARG_1.'say'('    ', "addattribute $P0, '", $P4, "'")
# }
    goto __label_4
  __label_5: # endfor
.annotate 'line', 8862
    __ARG_1.'say'('.end')
# }
.annotate 'line', 8863

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassStatement' ]
.annotate 'line', 8753
    get_class $P1, [ 'ClassBase' ]
    addparent $P0, $P1
    get_class $P2, [ 'VarContainer' ]
    addparent $P0, $P2
.annotate 'line', 8755
    addattribute $P0, 'parent'
.annotate 'line', 8756
    addattribute $P0, 'bases'
.annotate 'line', 8757
    addattribute $P0, 'constants'
.annotate 'line', 8758
    addattribute $P0, 'functions'
.annotate 'line', 8759
    addattribute $P0, 'members'
.end
.namespace [ 'DeclareClassStatement' ]

.sub 'DeclareClassStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8870
    self.'ClassBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 8871
    setattribute self, 'name', __ARG_2
# }
.annotate 'line', 8872

.end # DeclareClassStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8875
    .return(self)
# }
.annotate 'line', 8876

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'DeclareClassStatement' ]
.annotate 'line', 8866
    get_class $P1, [ 'ClassBase' ]
    addparent $P0, $P1
.end
.namespace [ ]

.sub 'parseClass'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8884
# var name: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8885
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 8886
    $I1 = $P2.'isop'(';')
    if $I1 goto __label_2
    $I1 = $P2.'isop'('.')
  __label_2:
    unless $I1 goto __label_0
# {
# for loop
  __label_5: # for condition
.annotate 'line', 8887
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_4
    unless $P3 goto __label_4
# {
.annotate 'line', 8888
# predefined string
    set $S1, $P1
    __ARG_3 = __ARG_3.'declarenamespace'($P1, $S1)
.annotate 'line', 8889
    $P1 = __ARG_2.'get'()
# }
  __label_3: # for iteration
.annotate 'line', 8887
    $P2 = __ARG_2.'get'()
    goto __label_5
  __label_4: # for end
.annotate 'line', 8891
    'RequireOp'(';', $P2)
.annotate 'line', 8892
    new $P4, [ 'DeclareClassStatement' ]
    $P4.'DeclareClassStatement'(__ARG_1, $P1, __ARG_3)
    set $P3, $P4
    __ARG_3.'declareclass'($P3)
# }
    goto __label_1
  __label_0: # else
# {
.annotate 'line', 8895
    __ARG_2.'unget'($P2)
.annotate 'line', 8896
    new $P4, [ 'ClassStatement' ]
    $P4.'ClassStatement'(__ARG_1, $P1, __ARG_3, __ARG_2)
    set $P3, $P4
    __ARG_3.'addclass'($P3)
# }
  __label_1: # endif
# }
.annotate 'line', 8898

.end # parseClass


.sub 'include_parrot'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8906
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8907
    $P6 = $P1.'isstring'()
    isfalse $I4, $P6
    unless $I4 goto __label_0
.annotate 'line', 8908
    'Expected'('literal string', $P1)
  __label_0: # endif
.annotate 'line', 8909
    'ExpectOp'(';', __ARG_2)
.annotate 'line', 8910
# filename: $S1
    $P6 = $P1.'rawstring'()
    null $S1
    if_null $P6, __label_1
    set $S1, $P6
  __label_1:
.annotate 'line', 8911
# var interp: $P2
# predefined getinterp
    getinterp $P2
# Constant IGLOBALS_LIB_PATHS evaluated at compile time
# Constant PARROT_LIB_PATH_INCLUDE evaluated at compile time
.annotate 'line', 8916
# var libpaths: $P3
    $P3 = $P2[9]
.annotate 'line', 8917
# var paths: $P4
    $P4 = $P3[0]
.annotate 'line', 8918
# var file: $P5
    new $P5, [ 'FileHandle' ]
.annotate 'line', 8919
    iter $P7, $P4
    set $P7, 0
  __label_2: # for iteration
    unless $P7 goto __label_3
    shift $S2, $P7
# {
.annotate 'line', 8920
# filepath: $S3
    concat $S3, $S2, $S1
.annotate 'line', 8921
# try: create handler
    new $P6, 'ExceptionHandler'
    set_label $P6, __label_4
    push_eh $P6
# try: begin
# {
.annotate 'line', 8922
    $P5.'open'($S3, 'r')
    goto __label_3 # break
.annotate 'line', 8923
# }
# try: end
    pop_eh
    goto __label_5
.annotate 'line', 8921
# catch
  __label_4:
    .get_results($P8)
    finalize $P8
    pop_eh
# catch end
  __label_5:
# }
    goto __label_2
  __label_3: # endfor
.annotate 'line', 8928
    $P6 = $P5.'is_closed'()
    if_null $P6, __label_6
    unless $P6 goto __label_6
.annotate 'line', 8929
    'SyntaxError'('File not found', $P1)
  __label_6: # endif
# Constant MACRO_CONST evaluated at compile time
# for loop
.annotate 'line', 8934
# line: $S4
    $P6 = $P5.'readline'()
    null $S4
    if_null $P6, __label_10
    set $S4, $P6
  __label_10:
  __label_9: # for condition
    $P8 = $P5.'eof'()
    isfalse $I4, $P8
    unless $I4 goto __label_8
# {
.annotate 'line', 8935
# predefined substr
    substr $S8, $S4, 0, 12
    ne $S8, '.macro_const', __label_11
# {
.annotate 'line', 8936
# pos: $I1
    set $I1, 12
.annotate 'line', 8937
# c: $S5
    null $S5
  __label_13: # while
.annotate 'line', 8938
# predefined substr
    substr $S5, $S4, $I1, 1
    iseq $I4, $S5, " "
    if $I4 goto __label_14
    iseq $I4, $S5, "\t"
  __label_14:
    unless $I4 goto __label_12
.annotate 'line', 8939
    inc $I1
    goto __label_13
  __label_12: # endwhile
.annotate 'line', 8940
# pos2: $I2
    set $I2, $I1
  __label_16: # while
.annotate 'line', 8941
# predefined substr
    substr $S5, $S4, $I2, 1
    isne $I4, $S5, " "
    unless $I4 goto __label_20
    isne $I4, $S5, "\t"
  __label_20:
    unless $I4 goto __label_19
.annotate 'line', 8942
    isne $I4, $S5, "\n"
  __label_19:
    unless $I4 goto __label_18
    isne $I4, $S5, "\r"
  __label_18:
    unless $I4 goto __label_17
    isne $I4, $S5, ""
  __label_17:
    unless $I4 goto __label_15
.annotate 'line', 8943
    inc $I2
    goto __label_16
  __label_15: # endwhile
.annotate 'line', 8944
    ne $I2, $I1, __label_21
    goto __label_7 # continue
  __label_21: # endif
.annotate 'line', 8946
# name: $S6
    sub $I4, $I2, $I1
# predefined substr
    substr $S6, $S4, $I1, $I4
  __label_23: # while
.annotate 'line', 8947
# predefined substr
    substr $S5, $S4, $I2, 1
    iseq $I4, $S5, " "
    if $I4 goto __label_24
    iseq $I4, $S5, "\t"
  __label_24:
    unless $I4 goto __label_22
.annotate 'line', 8948
    inc $I2
    goto __label_23
  __label_22: # endwhile
.annotate 'line', 8949
    set $I1, $I2
  __label_26: # while
.annotate 'line', 8950
# predefined substr
    substr $S5, $S4, $I2, 1
    isne $I4, $S5, " "
    unless $I4 goto __label_30
    isne $I4, $S5, "\t"
  __label_30:
    unless $I4 goto __label_29
.annotate 'line', 8951
    isne $I4, $S5, "\n"
  __label_29:
    unless $I4 goto __label_28
    isne $I4, $S5, "\r"
  __label_28:
    unless $I4 goto __label_27
    isne $I4, $S5, ""
  __label_27:
    unless $I4 goto __label_25
.annotate 'line', 8952
    inc $I2
    goto __label_26
  __label_25: # endwhile
.annotate 'line', 8953
    ne $I2, $I1, __label_31
    goto __label_7 # continue
  __label_31: # endif
.annotate 'line', 8955
# value: $S7
    sub $I4, $I2, $I1
# predefined substr
    substr $S7, $S4, $I1, $I4
.annotate 'line', 8957
# ivalue: $I3
    null $I3
.annotate 'line', 8958
# predefined substr
    substr $S8, $S7, 0, 2
    iseq $I4, $S8, '0x'
    if $I4 goto __label_34
# predefined substr
    substr $S9, $S7, 0, 2
    iseq $I4, $S9, '0X'
  __label_34:
    unless $I4 goto __label_32
.annotate 'line', 8959
# predefined substr
    substr $S10, $S7, 2
    box $P8, $S10
    $P6 = $P8.'to_int'(16)
    set $I3, $P6
    goto __label_33
  __label_32: # else
.annotate 'line', 8961
    set $I3, $S7
  __label_33: # endif
.annotate 'line', 8964
    new $P9, [ 'TokenInteger' ]
    getattribute $P10, __ARG_1, 'file'
    getattribute $P11, __ARG_1, 'line'
    $P9.'TokenInteger'($P10, $P11, $S6)
    set $P8, $P9
.annotate 'line', 8963
    $P6 = 'integerValue'(__ARG_3, $P8, $I3)
.annotate 'line', 8962
    __ARG_3.'createconst'($S6, 'I', $P6, '', 4)
# }
  __label_11: # endif
# }
  __label_7: # for iteration
.annotate 'line', 8934
    $P6 = $P5.'readline'()
    set $S4, $P6
    goto __label_9
  __label_8: # for end
.annotate 'line', 8969
    $P5.'close'()
# }
.annotate 'line', 8970

.end # include_parrot

.namespace [ 'NamespaceBase' ]

.sub 'NamespaceBase' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8985
    setattribute self, 'nspath', __ARG_1
.annotate 'line', 8986
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'namespaces', $P2
.annotate 'line', 8987
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'classes', $P2
.annotate 'line', 8988
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'functions', $P2
.annotate 'line', 8989
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'items', $P2
# }
.annotate 'line', 8990

.end # NamespaceBase


.sub 'getpath' :method
# Body
# {
.annotate 'line', 8993
    getattribute $P1, self, 'nspath'
    .return($P1)
# }
.annotate 'line', 8994

.end # getpath


.sub 'checkclass_base' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8997
# var classes: $P1
    getattribute $P1, self, 'classes'
.annotate 'line', 8998
    iter $P3, $P1
    set $P3, 0
  __label_0: # for iteration
    unless $P3 goto __label_1
    shift $P2, $P3
.annotate 'line', 8999
    getattribute $P4, $P2, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_2
.annotate 'line', 9000
    .return($P2)
  __label_2: # endif
    goto __label_0
  __label_1: # endfor
    null $P4
.annotate 'line', 9001
    .return($P4)
# }
.annotate 'line', 9002

.end # checkclass_base


.sub 'findclasskey_base' :method
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 9007
# predefined elements
    elements $I1, __ARG_1
    null $I2
    if $I1 == $I2 goto __label_2
    set $I2, 1
    if $I1 == $I2 goto __label_3
    goto __label_1
  __label_2: # case
    null $P5
.annotate 'line', 9009
    .return($P5)
  __label_3: # case
.annotate 'line', 9012
    $P6 = __ARG_1[0]
    .tailcall self.'checkclass_base'($P6)
  __label_1: # default
.annotate 'line', 9017
# var namespaces: $P1
    getattribute $P1, self, 'namespaces'
.annotate 'line', 9018
# var childkey: $P2
# predefined clone
    clone $P2, __ARG_1
.annotate 'line', 9019
# basename: $S1
    $P7 = $P2.'shift'()
    null $S1
    if_null $P7, __label_4
    set $S1, $P7
  __label_4:
.annotate 'line', 9020
    iter $P8, $P1
    set $P8, 0
  __label_5: # for iteration
    unless $P8 goto __label_6
    shift $P3, $P8
# {
.annotate 'line', 9021
    getattribute $P9, $P3, 'name'
    set $S2, $P9
    ne $S2, $S1, __label_7
# {
.annotate 'line', 9022
# var found: $P4
    $P4 = $P3.'findclasskey'($P2)
.annotate 'line', 9023
    if_null $P4, __label_8
.annotate 'line', 9024
    .return($P4)
  __label_8: # endif
# }
  __label_7: # endif
# }
    goto __label_5
  __label_6: # endfor
  __label_0: # switch end
    null $P5
.annotate 'line', 9028
    .return($P5)
# }
.annotate 'line', 9029

.end # findclasskey_base


.sub 'findsymbol' :method
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 9034
# predefined elements
    elements $I1, __ARG_1
    null $I2
    if $I1 == $I2 goto __label_2
    set $I2, 1
    if $I1 == $I2 goto __label_3
    goto __label_1
  __label_2: # case
    null $P7
.annotate 'line', 9036
    .return($P7)
  __label_3: # case
.annotate 'line', 9038
# name: $S1
    $S1 = __ARG_1[0]
.annotate 'line', 9040
# var sym: $P1
    $P1 = self.'checkclass_base'($S1)
.annotate 'line', 9041
    if_null $P1, __label_4
.annotate 'line', 9042
    .return($P1)
  __label_4: # endif
.annotate 'line', 9043
    getattribute $P8, self, 'functions'
    iter $P9, $P8
    set $P9, 0
  __label_5: # for iteration
    unless $P9 goto __label_6
    shift $P2, $P9
.annotate 'line', 9044
    getattribute $P10, $P2, 'name'
    set $S3, $P10
    ne $S3, $S1, __label_7
.annotate 'line', 9045
    .return($P2)
  __label_7: # endif
    goto __label_5
  __label_6: # endfor
    null $P11
.annotate 'line', 9046
    .return($P11)
  __label_1: # default
.annotate 'line', 9051
# var namespaces: $P3
    getattribute $P3, self, 'namespaces'
.annotate 'line', 9052
# var childkey: $P4
# predefined clone
    clone $P4, __ARG_1
.annotate 'line', 9053
# basename: $S2
    $P12 = $P4.'shift'()
    null $S2
    if_null $P12, __label_8
    set $S2, $P12
  __label_8:
.annotate 'line', 9054
    iter $P13, $P3
    set $P13, 0
  __label_9: # for iteration
    unless $P13 goto __label_10
    shift $P5, $P13
# {
.annotate 'line', 9055
    getattribute $P14, $P5, 'name'
    set $S4, $P14
    ne $S4, $S2, __label_11
# {
.annotate 'line', 9056
# var found: $P6
    $P6 = $P5.'findsymbol'($P4)
.annotate 'line', 9057
    if_null $P6, __label_12
.annotate 'line', 9058
    .return($P6)
  __label_12: # endif
# }
  __label_11: # endif
# }
    goto __label_9
  __label_10: # endfor
  __label_0: # switch end
    null $P7
.annotate 'line', 9062
    .return($P7)
# }
.annotate 'line', 9063

.end # findsymbol


.sub 'declarenamespace' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 9066
# var child: $P1
    new $P1, [ 'NamespaceStatement' ]
    null $P2
    $P1.'NamespaceStatement'(self, __ARG_1, __ARG_2, $P2)
.annotate 'line', 9067
    getattribute $P2, self, 'namespaces'
# predefined push
    push $P2, $P1
.annotate 'line', 9068
    .return($P1)
# }
.annotate 'line', 9069

.end # declarenamespace


.sub 'childnamespace' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9072
# var child: $P1
    new $P1, [ 'NamespaceStatement' ]
    $P1.'NamespaceStatement'(self, __ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 9073
    getattribute $P2, self, 'namespaces'
# predefined push
    push $P2, $P1
.annotate 'line', 9074
    getattribute $P2, self, 'items'
# predefined push
    push $P2, $P1
.annotate 'line', 9075
    .return($P1)
# }
.annotate 'line', 9076

.end # childnamespace


.sub 'declareclass' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9079
    getattribute $P1, self, 'classes'
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 9080

.end # declareclass


.sub 'addclass' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9083
    getattribute $P1, self, 'classes'
# predefined push
    push $P1, __ARG_1
.annotate 'line', 9084
    getattribute $P1, self, 'items'
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 9085

.end # addclass


.sub 'parsenamespace' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9088
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9089
# name: $S1
    set $P4, $P1
    null $S1
    if_null $P4, __label_0
    set $S1, $P4
  __label_0:
.annotate 'line', 9090
    $P1 = __ARG_2.'get'()
.annotate 'line', 9092
# var modifier: $P2
    null $P2
.annotate 'line', 9093
    $P4 = $P1.'isop'('[')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 9094
    new $P5, [ 'ModifierList' ]
    $P5.'ModifierList'(__ARG_2, self)
    set $P2, $P5
.annotate 'line', 9095
    $P1 = __ARG_2.'get'()
# }
  __label_1: # endif
.annotate 'line', 9098
    'RequireOp'('{', $P1)
.annotate 'line', 9099
# var child: $P3
    $P3 = self.'childnamespace'(__ARG_1, $S1, $P2)
.annotate 'line', 9100
    $P3.'parse'(__ARG_2)
# }
.annotate 'line', 9101

.end # parsenamespace


.sub 'parse' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9104
# var items: $P1
    getattribute $P1, self, 'items'
.annotate 'line', 9105
# var functions: $P2
    getattribute $P2, self, 'functions'
.annotate 'line', 9106
# var classes: $P3
    getattribute $P3, self, 'classes'
.annotate 'line', 9107
# var t: $P4
    null $P4
# for loop
.annotate 'line', 9108
    $P4 = __ARG_1.'get'()
  __label_2: # for condition
    set $I1, $P4
    unless $I1 goto __label_3
    $P7 = $P4.'isop'('}')
    isfalse $I1, $P7
  __label_3:
    unless $I1 goto __label_1
# {
# switch
.annotate 'line', 9110
    $P8 = $P4.'checkkeyword'()
    set $S2, $P8
    set $S3, 'namespace'
    if $S2 == $S3 goto __label_6
    set $S3, 'const'
    if $S2 == $S3 goto __label_7
    set $S3, 'function'
    if $S2 == $S3 goto __label_8
    set $S3, 'class'
    if $S2 == $S3 goto __label_9
    set $S3, 'using'
    if $S2 == $S3 goto __label_10
    set $S3, '$include_const'
    if $S2 == $S3 goto __label_11
    set $S3, '$load'
    if $S2 == $S3 goto __label_12
    set $S3, '$loadlib'
    if $S2 == $S3 goto __label_13
    goto __label_5
  __label_6: # case
.annotate 'line', 9112
    self.'parsenamespace'($P4, __ARG_1)
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 9115
# var cst: $P5
    $P5 = 'parseConst'($P4, __ARG_1, self)
.annotate 'line', 9116
# predefined push
    push $P1, $P5
    goto __label_4 # break
  __label_8: # case
.annotate 'line', 9119
# var f: $P6
    new $P6, [ 'FunctionStatement' ]
    $P6.'FunctionStatement'($P4, __ARG_1, self)
.annotate 'line', 9120
# predefined push
    push $P2, $P6
.annotate 'line', 9121
# predefined push
    push $P1, $P6
    goto __label_4 # break
  __label_9: # case
.annotate 'line', 9124
    'parseClass'($P4, __ARG_1, self)
    goto __label_4 # break
  __label_10: # case
.annotate 'line', 9127
    $P4 = __ARG_1.'get'()
.annotate 'line', 9128
    $P9 = $P4.'iskeyword'('extern')
    isfalse $I2, $P9
    unless $I2 goto __label_14
.annotate 'line', 9129
    'SyntaxError'('Unsupported at namespace level', $P4)
  __label_14: # endif
.annotate 'line', 9130
    $P4 = __ARG_1.'get'()
.annotate 'line', 9131
    $P10 = $P4.'isstring'()
    isfalse $I3, $P10
    unless $I3 goto __label_15
.annotate 'line', 9132
    'Expected'('string literal', $P4)
  __label_15: # endif
.annotate 'line', 9133
# reqlib: $S1
    set $P11, $P4
    null $S1
    if_null $P11, __label_16
    set $S1, $P11
  __label_16:
.annotate 'line', 9134
    self.'addlib'($S1)
.annotate 'line', 9135
    'ExpectOp'(';', __ARG_1)
    goto __label_4 # break
  __label_11: # case
.annotate 'line', 9138
    'include_parrot'($P4, __ARG_1, self)
    goto __label_4 # break
  __label_12: # case
.annotate 'line', 9141
    $P4 = __ARG_1.'get'()
.annotate 'line', 9142
    $P12 = $P4.'isstring'()
    isfalse $I4, $P12
    unless $I4 goto __label_17
.annotate 'line', 9143
    'Expected'('string literal', $P4)
  __label_17: # endif
.annotate 'line', 9144
    'ExpectOp'(';', __ARG_1)
.annotate 'line', 9145
    new $P15, [ 'StringLiteral' ]
    $P15.'StringLiteral'(self, $P4)
    set $P14, $P15
    $P13 = $P14.'getPirString'()
    self.'addload'($P13)
    goto __label_4 # break
  __label_13: # case
.annotate 'line', 9148
    $P4 = __ARG_1.'get'()
.annotate 'line', 9149
    $P16 = $P4.'isstring'()
    isfalse $I5, $P16
    unless $I5 goto __label_18
.annotate 'line', 9150
    'Expected'('string literal', $P4)
  __label_18: # endif
.annotate 'line', 9151
    'ExpectOp'(';', __ARG_1)
.annotate 'line', 9152
    new $P19, [ 'StringLiteral' ]
    $P19.'StringLiteral'(self, $P4)
    set $P18, $P19
    $P17 = $P18.'getPirString'()
    self.'addlib'($P17)
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 9155
    'SyntaxError'("Unexpected token", $P4)
  __label_4: # switch end
# }
  __label_0: # for iteration
.annotate 'line', 9108
    $P4 = __ARG_1.'get'()
    goto __label_2
  __label_1: # for end
.annotate 'line', 9158
    if_null $P4, __label_19
    unless $P4 goto __label_19
.annotate 'line', 9159
    self.'close_ns'($P4)
    goto __label_20
  __label_19: # else
.annotate 'line', 9161
    self.'unclosed_ns'()
  __label_20: # endif
# }
.annotate 'line', 9162

.end # parse


.sub 'optimize_base' :method
# Body
# {
.annotate 'line', 9165
    getattribute $P1, self, 'items'
    'optimize_array'($P1)
# }
.annotate 'line', 9166

.end # optimize_base


.sub 'emit_base' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9169
# var path: $P1
    $P1 = self.'getpath'()
.annotate 'line', 9170
# s: $S1
    $P3 = 'getparrotnamespacekey'($P1)
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
  __label_0:
.annotate 'line', 9172
# activate: $I1
    set $I1, 1
.annotate 'line', 9173
    getattribute $P3, self, 'items'
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
# {
.annotate 'line', 9174
    isa $I2, $P2, [ 'NamespaceStatement' ]
    if $I2 goto __label_5
.annotate 'line', 9175
    isa $I2, $P2, [ 'ClassStatement' ]
  __label_5:
    unless $I2 goto __label_3
.annotate 'line', 9176
    set $I1, 1
    goto __label_4
  __label_3: # else
.annotate 'line', 9178
    unless $I1 goto __label_6
# {
.annotate 'line', 9179
    __ARG_1.'say'($S1)
.annotate 'line', 9180
    null $I1
# }
  __label_6: # endif
  __label_4: # endif
.annotate 'line', 9182
    $P2.'emit'(__ARG_1)
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 9184

.end # emit_base

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NamespaceBase' ]
.annotate 'line', 8974
    get_class $P1, [ 'VarContainer' ]
    addparent $P0, $P1
.annotate 'line', 8976
    addattribute $P0, 'nspath'
.annotate 'line', 8977
    addattribute $P0, 'namespaces'
.annotate 'line', 8978
    addattribute $P0, 'classes'
.annotate 'line', 8979
    addattribute $P0, 'functions'
.annotate 'line', 8980
    addattribute $P0, 'items'
.annotate 'line', 8981
    addattribute $P0, 'owner'
.end
.namespace [ 'NamespaceStatement' ]

.sub 'NamespaceStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 9202
# var nspath: $P1
    $P2 = __ARG_1.'getpath'()
# predefined clone
    clone $P1, $P2
.annotate 'line', 9203
# predefined push
    push $P1, __ARG_3
.annotate 'line', 9204
    self.'NamespaceBase'($P1)
.annotate 'line', 9206
    setattribute self, 'parent', __ARG_1
.annotate 'line', 9207
    setattribute self, 'start', __ARG_2
.annotate 'line', 9208
    setattribute self, 'owner', __ARG_1
.annotate 'line', 9209
    box $P2, __ARG_3
    setattribute self, 'name', $P2
.annotate 'line', 9210
    setattribute self, 'modifier', __ARG_4
.annotate 'line', 9211
    if_null __ARG_4, __label_0
# {
.annotate 'line', 9212
    $P2 = __ARG_4.'pick'('HLL')
    if_null $P2, __label_1
.annotate 'line', 9213
    getattribute $P4, self, 'name'
    setattribute self, 'hll', $P4
  __label_1: # endif
# }
  __label_0: # endif
# }
.annotate 'line', 9215

.end # NamespaceStatement


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 9218
    getattribute $P1, self, 'parent'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 9219

.end # dowarnings


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 9222
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 9223

.end # generatesubid


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9226
    getattribute $P1, self, 'owner'
    $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 9227

.end # use_predef


.sub 'addlib' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9230
    getattribute $P1, self, 'parent'
    $P1.'addlib'(__ARG_1)
# }
.annotate 'line', 9231

.end # addlib


.sub 'addlib' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9234
    getattribute $P1, self, 'parent'
    $P1.'addload'(__ARG_1)
# }
.annotate 'line', 9235

.end # addlib


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9238
# var cl: $P1
    $P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 9239
    unless_null $P1, __label_0
.annotate 'line', 9240
    getattribute $P2, self, 'parent'
    .tailcall $P2.'checkclass'(__ARG_1)
    goto __label_1
  __label_0: # else
.annotate 'line', 9242
    .return($P1)
  __label_1: # endif
# }
.annotate 'line', 9243

.end # checkclass


.sub 'findclasskey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9248
# var cl: $P1
    $P1 = self.'findclasskey_base'(__ARG_1)
.annotate 'line', 9249
    unless_null $P1, __label_0
.annotate 'line', 9250
    getattribute $P2, self, 'parent'
    $P1 = $P2.'findclasskey'(__ARG_1)
  __label_0: # endif
.annotate 'line', 9251
    .return($P1)
# }
.annotate 'line', 9252

.end # findclasskey


.sub 'unclosed_ns' :method
# Body
# {
.annotate 'line', 9255
    getattribute $P1, self, 'start'
    'SyntaxError'('unclosed namespace', $P1)
# }
.annotate 'line', 9256

.end # unclosed_ns


.sub 'close_ns' :method
        .param pmc __ARG_1
# Empty body

.end # close_ns


.sub 'optimize' :method
# Body
# {
.annotate 'line', 9263
# var modifier: $P1
    getattribute $P1, self, 'modifier'
.annotate 'line', 9264
    if_null $P1, __label_0
# {
.annotate 'line', 9265
    $P1 = $P1.'optimize'()
.annotate 'line', 9266
    setattribute self, 'modifier', $P1
# }
  __label_0: # endif
.annotate 'line', 9268
    self.'optimize_base'()
.annotate 'line', 9269
    .return(self)
# }
.annotate 'line', 9270

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9273
# var hll: $P1
    getattribute $P1, self, 'hll'
.annotate 'line', 9274
    if_null $P1, __label_0
.annotate 'line', 9275
    __ARG_1.'say'(".HLL '", $P1, "'")
  __label_0: # endif
.annotate 'line', 9277
    self.'emit_base'(__ARG_1)
.annotate 'line', 9279
    if_null $P1, __label_1
.annotate 'line', 9280
    __ARG_1.'say'(".HLL 'parrot'")
  __label_1: # endif
# }
.annotate 'line', 9281

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NamespaceStatement' ]
.annotate 'line', 9191
    get_class $P1, [ 'NamespaceBase' ]
    addparent $P0, $P1
.annotate 'line', 9193
    addattribute $P0, 'parent'
.annotate 'line', 9194
    addattribute $P0, 'start'
.annotate 'line', 9195
    addattribute $P0, 'name'
.annotate 'line', 9196
    addattribute $P0, 'modifier'
.annotate 'line', 9197
    addattribute $P0, 'hll'
.end
.namespace [ 'RootNamespace' ]

.sub 'RootNamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9298
    new $P1, ['ResizableStringArray']
.annotate 'line', 9299
    self.'NamespaceBase'($P1)
.annotate 'line', 9300
    setattribute self, 'unit', __ARG_1
.annotate 'line', 9301
    root_new $P3, ['parrot';'Hash']
    setattribute self, 'predefs_used', $P3
.annotate 'line', 9302
    box $P2, 0
    setattribute self, 'subidgen', $P2
# }
.annotate 'line', 9303

.end # RootNamespace


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9306
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 9307
    $P1[__ARG_1] = 1
# }
.annotate 'line', 9308

.end # use_predef


.sub 'predef_is_used' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9311
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 9312
    $P2 = $P1[__ARG_1]
    unless_null $P2, __label_1
    null $I1
    goto __label_0
  __label_1:
    set $I1, 1
  __label_0:
    .return($I1)
# }
.annotate 'line', 9313

.end # predef_is_used


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 9317
# var subidgen: $P1
    getattribute $P1, self, 'subidgen'
.annotate 'line', 9318
# idgen: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 9319
    inc $I1
.annotate 'line', 9320
    assign $P1, $I1
.annotate 'line', 9321
# id: $S1
# predefined string
    set $S2, $I1
    concat $S1, 'WSubId_', $S2
.annotate 'line', 9322
    .return($S1)
# }
.annotate 'line', 9323

.end # generatesubid


.sub 'addlib' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9327
# var libs: $P1
    getattribute $P1, self, 'libs'
.annotate 'line', 9328
    unless_null $P1, __label_0
# {
.annotate 'line', 9329
    root_new $P1, ['parrot';'Hash']
.annotate 'line', 9330
    setattribute self, 'libs', $P1
# }
  __label_0: # endif
.annotate 'line', 9332
    $P1[__ARG_1] = 1
# }
.annotate 'line', 9333

.end # addlib


.sub 'addload' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9336
# var loads: $P1
    getattribute $P1, self, 'loads'
.annotate 'line', 9337
    unless_null $P1, __label_0
# {
.annotate 'line', 9338
    root_new $P1, ['parrot';'Hash']
.annotate 'line', 9339
    setattribute self, 'loads', $P1
# }
  __label_0: # endif
.annotate 'line', 9341
    $P1[__ARG_1] = 1
# }
.annotate 'line', 9342

.end # addload


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9345
    .tailcall self.'checkclass_base'(__ARG_1)
# }
.annotate 'line', 9346

.end # checkclass


.sub 'findclasskey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9350
    .tailcall self.'findclasskey_base'(__ARG_1)
# }
.annotate 'line', 9351

.end # findclasskey


.sub 'unclosed_ns' :method
# Empty body

.end # unclosed_ns


.sub 'close_ns' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9358
    'SyntaxError'('Cannot close root namespace', __ARG_1)
# }
.annotate 'line', 9359

.end # close_ns


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 9362
    getattribute $P1, self, 'unit'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 9363

.end # dowarnings


.sub 'optimize' :method
# Body
# {
.annotate 'line', 9366
    self.'optimize_base'()
.annotate 'line', 9367
    .return(self)
# }
.annotate 'line', 9368

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9371
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 9374
    $P5 = $P1['chomp']
    if_null $P5, __label_0
.annotate 'line', 9375
    self.'addload'('"String/Utils.pbc"')
  __label_0: # endif
.annotate 'line', 9378
    new $P2, ['ResizableStringArray']
    set $P2, 9
    set $S4, 'acos'
    $P2[0] = $S4
    set $S4, 'asin'
    $P2[1] = $S4
    set $S4, 'atan'
    $P2[2] = $S4
    set $S4, 'cos'
    $P2[3] = $S4
    set $S4, 'exp'
    $P2[4] = $S4
    set $S4, 'ln'
    $P2[5] = $S4
    set $S4, 'sin'
    $P2[6] = $S4
    set $S4, 'tan'
    $P2[7] = $S4
    set $S4, 'pow'
    $P2[8] = $S4
.annotate 'line', 9381
    iter $P6, $P2
    set $P6, 0
  __label_1: # for iteration
    unless $P6 goto __label_2
    shift $S1, $P6
.annotate 'line', 9382
    $P5 = $P1[$S1]
    if_null $P5, __label_3
# {
.annotate 'line', 9383
    self.'addlib'("'trans_ops'")
    goto __label_2 # break
.annotate 'line', 9384
# }
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9387
# somelib: $I1
    null $I1
.annotate 'line', 9388
# var libs: $P3
    getattribute $P3, self, 'libs'
.annotate 'line', 9389
    if_null $P3, __label_4
# {
.annotate 'line', 9390
    set $I1, 1
.annotate 'line', 9391
    iter $P7, $P3
    set $P7, 0
  __label_5: # for iteration
    unless $P7 goto __label_6
    shift $S2, $P7
.annotate 'line', 9392
    __ARG_1.'say'('.loadlib ', $S2)
    goto __label_5
  __label_6: # endfor
# }
  __label_4: # endif
.annotate 'line', 9395
# someload: $I2
    null $I2
.annotate 'line', 9396
# var loads: $P4
    getattribute $P4, self, 'loads'
.annotate 'line', 9397
    if_null $P4, __label_7
# {
.annotate 'line', 9398
    set $I2, 1
.annotate 'line', 9399
    __ARG_1.'print'("\n.sub initial_load_bytecode :anon :load :init\n")
.annotate 'line', 9400
    iter $P8, $P4
    set $P8, 0
  __label_8: # for iteration
    unless $P8 goto __label_9
    shift $S3, $P8
.annotate 'line', 9401
    __ARG_1.'say'('    load_bytecode ', $S3)
    goto __label_8
  __label_9: # endfor
.annotate 'line', 9402
    __ARG_1.'print'(".end\n\n")
# }
  __label_7: # endif
.annotate 'line', 9404
    or $I3, $I1, $I2
    unless $I3 goto __label_10
.annotate 'line', 9405
    __ARG_1.'comment'('end libs')
  __label_10: # endif
.annotate 'line', 9407
    self.'emit_base'(__ARG_1)
# }
.annotate 'line', 9408

.end # emit


.sub 'emitinclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9411
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 9412
    iter $P4, $P1
    set $P4, 0
  __label_0: # for iteration
    unless $P4 goto __label_1
    shift $S1, $P4
# {
.annotate 'line', 9413
# var data: $P2
    $P2 = $P1[$S1]
.annotate 'line', 9414
    isa $I2, $P2, [ 'VarData' ]
    not $I1, $I2
    if $I1 goto __label_4
.annotate 'line', 9415
    $P5 = $P2.'gettype'()
    set $S2, $P5
    isne $I1, $S2, 'I'
  __label_4:
    if $I1 goto __label_3
.annotate 'line', 9416
    $I3 = $P2.'getflags'()
    band $I1, $I3, 4
  __label_3:
    unless $I1 goto __label_2
    goto __label_0 # continue
  __label_2: # endif
.annotate 'line', 9418
# var value: $P3
    $P3 = $P2.'getvalue'()
.annotate 'line', 9419
    $P5 = $P3.'getIntegerValue'()
    __ARG_1.'say'('.macro_const ', $S1, ' ', $P5)
# }
    goto __label_0
  __label_1: # endfor
# }
.annotate 'line', 9421

.end # emitinclude

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'RootNamespace' ]
.annotate 'line', 9288
    get_class $P1, [ 'NamespaceBase' ]
    addparent $P0, $P1
.annotate 'line', 9290
    addattribute $P0, 'unit'
.annotate 'line', 9291
    addattribute $P0, 'predefs_used'
.annotate 'line', 9292
    addattribute $P0, 'libs'
.annotate 'line', 9293
    addattribute $P0, 'loads'
.annotate 'line', 9294
    addattribute $P0, 'subidgen'
.end
.namespace [ ]
# Constant EVAL_NAME evaluated at compile time
.namespace [ 'WinxedCompileUnit' ]

.sub 'init' :method :vtable
# Body
# {
.annotate 'line', 9437
    box $P3, 1
    setattribute self, 'warnings', $P3
.annotate 'line', 9438
# var rootns: $P1
    new $P1, [ 'RootNamespace' ]
    $P1.'RootNamespace'(self)
.annotate 'line', 9441
# var taux: $P2
    new $P2, [ 'TokenIdentifier' ]
    $P2.'TokenIdentifier'('__predefconst__', 0, 'predefconst')
.annotate 'line', 9445
    new $P5, [ 'TokenInteger' ]
    getattribute $P6, $P2, 'file'
    getattribute $P7, $P2, 'line'
    $P5.'TokenInteger'($P6, $P7, 'false')
    set $P4, $P5
.annotate 'line', 9444
    $P3 = 'integerValue'($P1, $P4, 0)
.annotate 'line', 9443
    $P1.'createconst'('false', 'I', $P3, '', 4)
.annotate 'line', 9449
    new $P5, [ 'TokenInteger' ]
    getattribute $P6, $P2, 'file'
    getattribute $P7, $P2, 'line'
    $P5.'TokenInteger'($P6, $P7, 'false')
    set $P4, $P5
.annotate 'line', 9448
    $P3 = 'integerValue'($P1, $P4, 1)
.annotate 'line', 9447
    $P1.'createconst'('true', 'I', $P3, '', 4)
.annotate 'line', 9455
    new $P4, [ 'StringLiteral' ]
.annotate 'line', 9456
    new $P6, [ 'TokenQuoted' ]
    getattribute $P7, $P2, 'file'
    getattribute $P8, $P2, 'line'
# predefined string
# predefined int
    set $I2, "2"
    add $I1, $I2, 1
    set $S1, $I1
    $P6.'TokenQuoted'($P7, $P8, $S1)
    set $P5, $P6
    $P4.'StringLiteral'($P1, $P5)
    set $P3, $P4
.annotate 'line', 9454
    $P1.'createconst'('__STAGE__', 'S', $P3, '', 4)
.annotate 'line', 9459
    setattribute self, 'rootns', $P1
# }
.annotate 'line', 9460

.end # init


.sub 'setwarnmode' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 9463
    getattribute $P1, self, 'warnings'
    assign $P1, __ARG_1
# }
.annotate 'line', 9464

.end # setwarnmode


.sub 'dowarnings' :method
# Body
# {
# predefined int
.annotate 'line', 9467
    getattribute $P1, self, 'warnings'
    set $I1, $P1
    .return($I1)
# }
.annotate 'line', 9468

.end # dowarnings


.sub 'parse' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9471
    getattribute $P1, self, 'rootns'
    $P1.'parse'(__ARG_1)
# }
.annotate 'line', 9472

.end # parse


.sub 'optimize' :method
# Body
# {
.annotate 'line', 9475
    getattribute $P3, self, 'rootns'
    $P2 = $P3.'optimize'()
    setattribute self, 'rootns', $P2
# }
.annotate 'line', 9476

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9479
    __ARG_1.'comment'('Begin generated code')
.annotate 'line', 9480
    __ARG_1.'say'('')
.annotate 'line', 9482
    getattribute $P1, self, 'rootns'
    $P1.'emit'(__ARG_1)
.annotate 'line', 9484
    __ARG_1.'comment'('End generated code')
# }
.annotate 'line', 9485

.end # emit


.sub 'emitinclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9488
    __ARG_1.'comment'('DO NOT EDIT THIS FILE')
.annotate 'line', 9489
    __ARG_1.'comment'('Generated automatically from Winxed sources')
.annotate 'line', 9491
    getattribute $P1, self, 'rootns'
    $P1.'emitinclude'(__ARG_1)
.annotate 'line', 9493
    __ARG_1.'comment'('End')
# }
.annotate 'line', 9494

.end # emitinclude

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'WinxedCompileUnit' ]
.annotate 'line', 9432
    addattribute $P0, 'rootns'
.annotate 'line', 9433
    addattribute $P0, 'warnings'
.end
.namespace [ 'WinxedHLL' ]

.sub '__private_compile_tail' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9503
    set $S2, __ARG_2
    ne $S2, 'parse', __label_0
.annotate 'line', 9504
    .return(__ARG_1)
  __label_0: # endif
.annotate 'line', 9505
# var handleout: $P1
    new $P1, [ 'StringHandle' ]
.annotate 'line', 9506
    $P1.'open'('__eval__', 'w')
.annotate 'line', 9507
# var emit: $P2
    new $P2, [ 'Emit' ]
    $P2.'Emit'($P1)
.annotate 'line', 9508
    if_null __ARG_3, __label_1
    unless __ARG_3 goto __label_1
.annotate 'line', 9509
    $P2.'disable_annotations'()
  __label_1: # endif
.annotate 'line', 9510
    __ARG_1.'emit'($P2)
.annotate 'line', 9511
    $P2.'close'()
.annotate 'line', 9512
    $P1.'close'()
.annotate 'line', 9513
# pircode: $S1
    $P5 = $P1.'read'(0)
    null $S1
    if_null $P5, __label_2
    set $S1, $P5
  __label_2:
.annotate 'line', 9514
# var object: $P3
    null $P3
# switch
.annotate 'line', 9515
    set $S2, __ARG_2
    set $S3, 'pir'
    if $S2 == $S3 goto __label_5
    set $S3, 'pbc'
    if $S2 == $S3 goto __label_6
    set $S3, ''
    if $S2 == $S3 goto __label_7
    goto __label_4
  __label_5: # case
.annotate 'line', 9517
    new $P3, [ 'String' ]
.annotate 'line', 9518
    assign $P3, $S1
    goto __label_3 # break
  __label_6: # case
  __label_7: # case
.annotate 'line', 9522
# var pircomp: $P4
# predefined compreg
    compreg $P4, 'PIR'
.annotate 'line', 9523
    $P3 = $P4($S1)
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 9524
# predefined string
.annotate 'line', 9526
    set $S4, __ARG_2
    concat $S5, 'Invalid target: ', $S4
# predefined die
    die $S5
  __label_3: # switch end
.annotate 'line', 9528
    .return($P3)
# }
.annotate 'line', 9529

.end # __private_compile_tail


.sub '__private_geninclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9532
# var handleout: $P1
    new $P1, [ 'StringHandle' ]
.annotate 'line', 9533
    $P1.'open'('__eval__', 'w')
.annotate 'line', 9534
# var emit: $P2
    new $P2, [ 'Emit' ]
    $P2.'Emit'($P1)
.annotate 'line', 9535
    __ARG_1.'emitinclude'($P2)
.annotate 'line', 9536
    $P2.'close'()
.annotate 'line', 9537
    $P1.'close'()
.annotate 'line', 9538
    .tailcall $P1.'read'(0)
# }
.annotate 'line', 9539

.end # __private_geninclude


.sub 'compile' :method
        .param string __ARG_1
        .param string __ARG_2 :optional :named('target')
        .param int __ARG_3 :optional :named('noan')
        .param int __ARG_4 :optional :named('nowarn')
# Body
# {
.annotate 'line', 9545
    unless_null __ARG_2, __label_0
.annotate 'line', 9546
    set __ARG_2, ''
  __label_0: # endif
.annotate 'line', 9547
# var handlein: $P1
    new $P1, [ 'StringHandle' ]
.annotate 'line', 9548
    $P1.'open'('__eval__', 'w')
.annotate 'line', 9549
    $P1.'puts'(__ARG_1)
.annotate 'line', 9550
    $P1.'close'()
.annotate 'line', 9551
    $P1.'open'('__eval__', 'r')
.annotate 'line', 9552
# var tk: $P2
    new $P2, [ 'Tokenizer' ]
    $P2.'Tokenizer'($P1, '__eval__')
.annotate 'line', 9553
# var winxed: $P3
    new $P3, [ 'WinxedCompileUnit' ]
.annotate 'line', 9554
    unless __ARG_4 goto __label_1
.annotate 'line', 9555
    $P3.'setwarnmode'(0)
  __label_1: # endif
.annotate 'line', 9556
    $P3.'parse'($P2)
.annotate 'line', 9557
    $P1.'close'()
.annotate 'line', 9558
    $P3.'optimize'()
.annotate 'line', 9559
    ne __ARG_2, 'include', __label_2
# {
.annotate 'line', 9560
    .tailcall self.'__private_geninclude'($P3)
# }
    goto __label_3
  __label_2: # else
.annotate 'line', 9563
    .tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3)
  __label_3: # endif
# }
.annotate 'line', 9564

.end # compile


.sub 'compile_from_file' :method
        .param string __ARG_1
        .param string __ARG_2 :optional :named('target')
        .param int __ARG_3 :optional :named('noan')
        .param int __ARG_4 :optional :named('nowarn')
# Body
# {
.annotate 'line', 9570
    unless_null __ARG_2, __label_0
.annotate 'line', 9571
    set __ARG_2, ''
  __label_0: # endif
.annotate 'line', 9572
# var handlein: $P1
    new $P1, [ 'FileHandle' ]
.annotate 'line', 9573
    $P1.'open'(__ARG_1, 'r')
.annotate 'line', 9574
    $P1.'encoding'('utf8')
.annotate 'line', 9575
# var tk: $P2
    new $P2, [ 'Tokenizer' ]
    $P2.'Tokenizer'($P1, __ARG_1)
.annotate 'line', 9576
# var winxed: $P3
    new $P3, [ 'WinxedCompileUnit' ]
.annotate 'line', 9577
    unless __ARG_4 goto __label_1
.annotate 'line', 9578
    $P3.'setwarnmode'(0)
  __label_1: # endif
.annotate 'line', 9579
    $P3.'parse'($P2)
.annotate 'line', 9580
    $P1.'close'()
.annotate 'line', 9581
    $P3.'optimize'()
.annotate 'line', 9582
    ne __ARG_2, 'include', __label_2
# {
.annotate 'line', 9583
    .tailcall self.'__private_geninclude'($P3)
# }
    goto __label_3
  __label_2: # else
.annotate 'line', 9586
    .tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3)
  __label_3: # endif
# }
.annotate 'line', 9587

.end # compile_from_file

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'WinxedHLL' ]
.end
.namespace [ ]

.sub 'initializer' :init :load
# Body
# {
.annotate 'line', 9596
# var comp: $P1
    new $P1, [ 'WinxedHLL' ]
.annotate 'line', 9597
# predefined compreg
    compreg 'winxed', $P1
# }
.annotate 'line', 9598

.end # initializer

# End generated code
