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
    null $S2
# for loop
.annotate 'line', 426
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_2: # for condition
    $P2 = 'isident'($S2)
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 427
    concat $S1, $S1, $S2
  __label_0: # for iteration
.annotate 'line', 426
    $P3 = __ARG_1.'getchar'()
    set $S2, $P3
    goto __label_2
  __label_1: # for end
.annotate 'line', 428
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 429
    new $P2, [ 'TokenIdentifier' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenIdentifier'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 430

.end # getident


.sub 'getnumber'
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 434
# s: $S1
    null $S1
.annotate 'line', 435
# c: $S2
    set $S2, __ARG_2
  __label_0: # do
.annotate 'line', 436
# {
.annotate 'line', 437
    concat $S1, $S1, $S2
.annotate 'line', 438
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
  __label_2: # continue
.annotate 'line', 439
    $P1 = 'isdigit'($S2)
    if_null $P1, __label_1
    if $P1 goto __label_0
  __label_1: # enddo
.annotate 'line', 440
    iseq $I3, $S1, '0'
    unless $I3 goto __label_4
    iseq $I3, $S2, 'x'
    if $I3 goto __label_5
    iseq $I3, $S2, 'X'
  __label_5:
  __label_4:
    unless $I3 goto __label_3
# {
.annotate 'line', 441
# hexval: $I1
    null $I1
# h: $I2
    null $I2
# for loop
.annotate 'line', 442
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_8: # for condition
    $P2 = 'hexdigit'($S2)
    set $I2, $P2
    lt $I2, 0, __label_7
# {
.annotate 'line', 443
    mul $I3, $I1, 16
    add $I1, $I3, $I2
.annotate 'line', 444
    concat $S1, $S1, $S2
# }
  __label_6: # for iteration
.annotate 'line', 442
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_8
  __label_7: # for end
.annotate 'line', 446
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 447
    set $S1, $I1
.annotate 'line', 448
    new $P2, [ 'TokenInteger' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenInteger'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
  __label_3: # endif
.annotate 'line', 450
    ne $S2, '.', __label_9
# {
  __label_11: # do
.annotate 'line', 451
# {
.annotate 'line', 452
    concat $S1, $S1, $S2
.annotate 'line', 453
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
  __label_13: # continue
.annotate 'line', 454
    $P1 = 'isdigit'($S2)
    if_null $P1, __label_12
    if $P1 goto __label_11
  __label_12: # enddo
.annotate 'line', 455
    iseq $I3, $S2, 'e'
    if $I3 goto __label_15
    iseq $I3, $S2, 'E'
  __label_15:
    unless $I3 goto __label_14
# {
.annotate 'line', 456
    concat $S1, $S1, 'E'
.annotate 'line', 457
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    iseq $I3, $S2, '+'
    if $I3 goto __label_17
    iseq $I3, $S2, '-'
  __label_17:
    unless $I3 goto __label_16
# {
.annotate 'line', 458
    concat $S1, $S1, $S2
.annotate 'line', 459
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
  __label_16: # endif
# for loop
  __label_20: # for condition
.annotate 'line', 461
    $P1 = 'isdigit'($S2)
    if_null $P1, __label_19
    unless $P1 goto __label_19
.annotate 'line', 462
    concat $S1, $S1, $S2
  __label_18: # for iteration
.annotate 'line', 461
    $P2 = __ARG_1.'getchar'()
    set $S2, $P2
    goto __label_20
  __label_19: # for end
# }
  __label_14: # endif
.annotate 'line', 464
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 465
    new $P2, [ 'TokenFloat' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenFloat'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
    goto __label_10
  __label_9: # else
# {
.annotate 'line', 468
    iseq $I3, $S2, 'e'
    if $I3 goto __label_23
    iseq $I3, $S2, 'E'
  __label_23:
    unless $I3 goto __label_21
# {
.annotate 'line', 469
    concat $S1, $S1, 'E'
.annotate 'line', 470
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    iseq $I3, $S2, '+'
    if $I3 goto __label_25
    iseq $I3, $S2, '-'
  __label_25:
    unless $I3 goto __label_24
# {
.annotate 'line', 471
    concat $S1, $S1, $S2
.annotate 'line', 472
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
  __label_24: # endif
# for loop
  __label_28: # for condition
.annotate 'line', 474
    $P1 = 'isdigit'($S2)
    if_null $P1, __label_27
    unless $P1 goto __label_27
.annotate 'line', 475
    concat $S1, $S1, $S2
  __label_26: # for iteration
.annotate 'line', 474
    $P2 = __ARG_1.'getchar'()
    set $S2, $P2
    goto __label_28
  __label_27: # for end
.annotate 'line', 476
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 477
    new $P2, [ 'TokenFloat' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenFloat'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
    goto __label_22
  __label_21: # else
# {
.annotate 'line', 480
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 481
    new $P2, [ 'TokenInteger' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenInteger'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
  __label_22: # endif
# }
  __label_10: # endif
# }
.annotate 'line', 484

.end # getnumber


.sub 'getlinecomment'
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 488
# s: $S1
    set $S1, __ARG_2
# for loop
.annotate 'line', 490
# c: $S2
    $P1 = __ARG_1.'getchar'()
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
  __label_3:
  __label_2: # for condition
    isne $I1, $S2, ''
    unless $I1 goto __label_4
    isne $I1, $S2, "\n"
  __label_4:
    unless $I1 goto __label_1
.annotate 'line', 491
    concat $S1, $S1, $S2
  __label_0: # for iteration
.annotate 'line', 490
    $P2 = __ARG_1.'getchar'()
    set $S2, $P2
    goto __label_2
  __label_1: # for end
.annotate 'line', 492
    new $P2, [ 'TokenComment' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenComment'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 493

.end # getlinecomment


.sub 'getcomment'
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 497
# s: $S1
    set $S1, __ARG_2
.annotate 'line', 498
# c: $S2
    $P1 = __ARG_1.'getchar'()
    null $S2
    if_null $P1, __label_0
    set $S2, $P1
  __label_0:
  __label_1: # do
.annotate 'line', 499
# {
# for loop
  __label_6: # for condition
.annotate 'line', 500
    isne $I1, $S2, ''
    unless $I1 goto __label_7
    isne $I1, $S2, '*'
  __label_7:
    unless $I1 goto __label_5
.annotate 'line', 501
    concat $S1, $S1, $S2
  __label_4: # for iteration
.annotate 'line', 500
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_6
  __label_5: # for end
.annotate 'line', 502
    ne $S2, '', __label_8
.annotate 'line', 503
    'TokenError'("Unclosed comment", __ARG_1, __ARG_3)
  __label_8: # endif
.annotate 'line', 504
    concat $S1, $S1, $S2
.annotate 'line', 505
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
.annotate 'line', 506
    ne $S2, '', __label_9
.annotate 'line', 507
    'TokenError'("Unclosed comment", __ARG_1, __ARG_3)
  __label_9: # endif
# }
  __label_3: # continue
.annotate 'line', 508
    ne $S2, '/', __label_1
  __label_2: # enddo
.annotate 'line', 509
    concat $S1, $S1, '/'
.annotate 'line', 510
    new $P2, [ 'TokenComment' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenComment'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 511

.end # getcomment


.sub 'getop'
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 515
# s: $S1
    set $S1, __ARG_2
.annotate 'line', 516
    new $P2, [ 'TokenOp' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenOp'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 517

.end # getop

.namespace [ 'Tokenizer' ]

.sub 'Tokenizer' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 533
.const 'Sub' $P2 = 'getop'
.annotate 'line', 535
    setattribute self, 'h', __ARG_1
.annotate 'line', 536
    box $P3, ''
    setattribute self, 'pending', $P3
.annotate 'line', 537
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'stacked', $P4
.annotate 'line', 538
    box $P3, __ARG_2
    setattribute self, 'filename', $P3
.annotate 'line', 539
    box $P3, 1
    setattribute self, 'line', $P3
.annotate 'line', 540
# var select: $P1
    root_new $P1, ['parrot';'Hash']
.annotate 'line', 541
    root_new $P3, ['parrot';'Hash']
    get_hll_global $P4, 'getident'
    $P3[''] = $P4
    $P3['{'] = $P2
    $P1['$'] = $P3
    get_hll_global $P5, 'getquoted'
    $P1['"'] = $P5
    get_hll_global $P6, 'getsinglequoted'
    $P1["'"] = $P6
.annotate 'line', 544
    root_new $P7, ['parrot';'Hash']
.annotate 'line', 545
    root_new $P8, ['parrot';'Hash']
    $P8[''] = $P2
    $P8['='] = $P2
    $P7['='] = $P8
    $P7[':'] = $P2
    $P1['='] = $P7
.annotate 'line', 548
    root_new $P9, ['parrot';'Hash']
    $P9['+'] = $P2
    $P9['='] = $P2
    $P1['+'] = $P9
.annotate 'line', 549
    root_new $P10, ['parrot';'Hash']
    $P10['-'] = $P2
    $P10['='] = $P2
    $P1['-'] = $P10
.annotate 'line', 550
    root_new $P11, ['parrot';'Hash']
    $P11['='] = $P2
    $P1['*'] = $P11
.annotate 'line', 551
    root_new $P12, ['parrot';'Hash']
    $P12['|'] = $P2
    $P1['|'] = $P12
.annotate 'line', 552
    root_new $P13, ['parrot';'Hash']
    $P13['&'] = $P2
    $P1['&'] = $P13
.annotate 'line', 553
    root_new $P14, ['parrot';'Hash']
.annotate 'line', 554
    root_new $P15, ['parrot';'Hash']
    $P15[''] = $P2
    get_hll_global $P16, 'getheredoc'
    $P15[':'] = $P16
    $P14['<'] = $P15
    $P14['='] = $P2
    $P1['<'] = $P14
.annotate 'line', 557
    root_new $P17, ['parrot';'Hash']
    $P17['>'] = $P2
    $P17['='] = $P2
    $P1['>'] = $P17
.annotate 'line', 558
    root_new $P18, ['parrot';'Hash']
.annotate 'line', 559
    root_new $P19, ['parrot';'Hash']
    $P19[''] = $P2
    $P19['='] = $P2
    $P18['='] = $P19
    $P1['!'] = $P18
.annotate 'line', 561
    root_new $P20, ['parrot';'Hash']
    $P20['%'] = $P2
    $P20['='] = $P2
    $P1['%'] = $P20
.annotate 'line', 562
    root_new $P21, ['parrot';'Hash']
    $P21['='] = $P2
    get_hll_global $P22, 'getlinecomment'
    $P21['/'] = $P22
    get_hll_global $P23, 'getcomment'
    $P21['*'] = $P23
    $P1['/'] = $P21
    get_hll_global $P24, 'getlinecomment'
    $P1['#'] = $P24
.annotate 'line', 565
    setattribute self, 'select', $P1
# }
.annotate 'line', 566

.end # Tokenizer


.sub 'getchar' :method
# Body
# {
.annotate 'line', 569
# var pending: $P1
    getattribute $P1, self, 'pending'
.annotate 'line', 570
# c: $S1
    set $P3, $P1
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
  __label_0:
.annotate 'line', 571
    eq $S1, '', __label_1
.annotate 'line', 572
    assign $P1, ''
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 574
# var h: $P2
    getattribute $P2, self, 'h'
.annotate 'line', 575
    $P3 = $P2.'read'(1)
    set $S1, $P3
.annotate 'line', 576
    ne $S1, "\n", __label_3
# {
.annotate 'line', 577
# l: $I1
    getattribute $P3, self, 'line'
    set $I1, $P3
.annotate 'line', 578
    inc $I1
.annotate 'line', 579
    box $P3, $I1
    setattribute self, 'line', $P3
# }
  __label_3: # endif
# }
  __label_2: # endif
.annotate 'line', 582
    .return($S1)
# }
.annotate 'line', 583

.end # getchar


.sub 'ungetchar' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 586
    getattribute $P1, self, 'pending'
    assign $P1, __ARG_1
# }
.annotate 'line', 587

.end # ungetchar


.sub 'get_token' :method
# Body
# {
.annotate 'line', 590
.const 'Sub' $P4 = 'isspace'
.const 'Sub' $P5 = 'isidentstart'
.const 'Sub' $P6 = 'isdigit'
.const 'Sub' $P7 = 'getop'
.const 'Sub' $P8 = 'getident'
.const 'Sub' $P9 = 'getnumber'
.annotate 'line', 593
    getattribute $P10, self, 'stacked'
    if_null $P10, __label_0
    unless $P10 goto __label_0
# {
.annotate 'line', 594
# var t: $P1
    getattribute $P11, self, 'stacked'
    $P1 = $P11.'pop'()
.annotate 'line', 595
    .return($P1)
# }
  __label_0: # endif
.annotate 'line', 597
# c: $S1
    $P10 = self.'getchar'()
    null $S1
    if_null $P10, __label_1
    set $S1, $P10
  __label_1:
  __label_3: # while
.annotate 'line', 598
    $P10 = $P4($S1)
    if_null $P10, __label_2
    unless $P10 goto __label_2
.annotate 'line', 599
    $P11 = self.'getchar'()
    set $S1, $P11
    goto __label_3
  __label_2: # endwhile
.annotate 'line', 600
# line: $I1
    getattribute $P10, self, 'line'
    set $I1, $P10
.annotate 'line', 601
    ne $S1, '', __label_4
.annotate 'line', 602
    new $P11, [ 'TokenEof' ]
    getattribute $P12, self, 'filename'
    $P11.'TokenEof'($P12)
    set $P10, $P11
    .return($P10)
  __label_4: # endif
.annotate 'line', 603
    $P10 = $P5($S1)
    if_null $P10, __label_5
    unless $P10 goto __label_5
.annotate 'line', 604
    .tailcall $P8(self, $S1, $I1)
  __label_5: # endif
.annotate 'line', 605
    $P10 = $P6($S1)
    if_null $P10, __label_6
    unless $P10 goto __label_6
.annotate 'line', 606
    .tailcall $P9(self, $S1, $I1)
  __label_6: # endif
.annotate 'line', 608
# op: $S2
    set $S2, $S1
.annotate 'line', 609
# var select: $P2
    getattribute $P2, self, 'select'
.annotate 'line', 610
# var current: $P3
    $P3 = $P2[$S1]
  __label_8: # while
.annotate 'line', 612
    isnull $I2, $P3
    not $I2
    unless $I2 goto __label_9
    isa $I2, $P3, 'Hash'
  __label_9:
    unless $I2 goto __label_7
# {
.annotate 'line', 613
    $P10 = self.'getchar'()
    set $S1, $P10
.annotate 'line', 614
    set $P2, $P3
.annotate 'line', 615
    $P3 = $P2[$S1]
.annotate 'line', 616
    unless_null $P3, __label_10
# {
.annotate 'line', 617
    self.'ungetchar'($S1)
.annotate 'line', 618
    $P3 = $P2['']
# }
    goto __label_11
  __label_10: # else
.annotate 'line', 621
    concat $S2, $S2, $S1
  __label_11: # endif
# }
    goto __label_8
  __label_7: # endwhile
.annotate 'line', 623
    if_null $P3, __label_12
    unless $P3 goto __label_12
.annotate 'line', 624
    .tailcall $P3(self, $S2, $I1)
  __label_12: # endif
.annotate 'line', 625
    .tailcall $P7(self, $S2, $I1)
# }
.annotate 'line', 626

.end # get_token


.sub 'get' :method
        .param int __ARG_1 :optional
# Body
# {
.annotate 'line', 629
# var t: $P1
    $P1 = self.'get_token'()
  __label_1: # while
.annotate 'line', 630
    $P2 = $P1.'iseof'()
    isfalse $I1, $P2
    unless $I1 goto __label_3
    not $I1, __ARG_1
  __label_3:
    unless $I1 goto __label_2
    $I1 = $P1.'iscomment'()
  __label_2:
    unless $I1 goto __label_0
.annotate 'line', 631
    $P1 = self.'get_token'()
    goto __label_1
  __label_0: # endwhile
.annotate 'line', 632
    .return($P1)
# }
.annotate 'line', 633

.end # get


.sub 'unget' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 636
    getattribute $P1, self, 'stacked'
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 637

.end # unget

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Tokenizer' ]
.annotate 'line', 525
    addattribute $P0, 'h'
.annotate 'line', 526
    addattribute $P0, 'pending'
.annotate 'line', 527
    addattribute $P0, 'select'
.annotate 'line', 528
    addattribute $P0, 'stacked'
.annotate 'line', 529
    addattribute $P0, 'filename'
.annotate 'line', 530
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
.annotate 'line', 658
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
.annotate 'line', 659
    .return('I')
  __label_3: # case
.annotate 'line', 660
    .return('N')
  __label_4: # case
.annotate 'line', 661
    .return('S')
  __label_5: # case
.annotate 'line', 662
    .return('P')
  __label_1: # default
.annotate 'line', 663
    .return('')
  __label_0: # switch end
# }
.annotate 'line', 665

.end # typetoregcheck


.sub 'typetopirname'
        .param string __ARG_1
# Body
# {
# switch
.annotate 'line', 669
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
.annotate 'line', 670
    .return('int')
  __label_3: # case
.annotate 'line', 671
    .return('num')
  __label_4: # case
.annotate 'line', 672
    .return('string')
  __label_5: # case
.annotate 'line', 673
    .return('pmc')
  __label_1: # default
.annotate 'line', 674
    'InternalError'('Invalid reg type')
  __label_0: # switch end
# }
.annotate 'line', 676

.end # typetopirname

# Constant INDENT evaluated at compile time
# Constant INDENTLABEL evaluated at compile time
.namespace [ 'Emit' ]

.sub 'Emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 696
    setattribute self, 'handle', __ARG_1
.annotate 'line', 697
    box $P1, ''
    setattribute self, 'file', $P1
.annotate 'line', 698
    box $P1, 0
    setattribute self, 'line', $P1
.annotate 'line', 699
    box $P1, 0
    setattribute self, 'pendingf', $P1
.annotate 'line', 700
    box $P1, 0
    setattribute self, 'pendingl', $P1
# }
.annotate 'line', 701

.end # Emit


.sub 'disable_annotations' :method
# Body
# {
.annotate 'line', 704
    box $P1, 1
    setattribute self, 'noan', $P1
# }
.annotate 'line', 705

.end # disable_annotations


.sub 'close' :method
# Body
# {
.annotate 'line', 708
    null $P1
    setattribute self, 'handle', $P1
# }
.annotate 'line', 709

.end # close


.sub 'updateannot' :method
# Body
# {
.annotate 'line', 712
    getattribute $P1, self, 'pendingf'
    if_null $P1, __label_0
    unless $P1 goto __label_0
# {
.annotate 'line', 713
    getattribute $P2, self, 'handle'
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, ".annotate 'file', '"
    push $P3, $P4
.annotate 'line', 715
    getattribute $P5, self, 'file'
.annotate 'line', 713
    push $P3, $P5
    box $P4, "'\n"
    push $P3, $P4
# predefined join
    join $S1, "", $P3
    $P2.'print'($S1)
.annotate 'line', 718
    getattribute $P1, self, 'pendingf'
    assign $P1, 0
# }
  __label_0: # endif
.annotate 'line', 720
    getattribute $P1, self, 'pendingl'
    if_null $P1, __label_1
    unless $P1 goto __label_1
# {
.annotate 'line', 721
    getattribute $P2, self, 'handle'
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, ".annotate 'line', "
    push $P3, $P4
.annotate 'line', 723
    getattribute $P5, self, 'line'
.annotate 'line', 721
    push $P3, $P5
    box $P4, "\n"
    push $P3, $P4
# predefined join
    join $S1, "", $P3
    $P2.'print'($S1)
.annotate 'line', 726
    getattribute $P1, self, 'pendingl'
    assign $P1, 0
# }
  __label_1: # endif
# }
.annotate 'line', 728

.end # updateannot


.sub 'vprint' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 731
    iter $P2, __ARG_1
    set $P2, 0
  __label_0: # for iteration
    unless $P2 goto __label_1
    shift $P1, $P2
.annotate 'line', 732
    getattribute $P3, self, 'handle'
    $P3.'print'($P1)
    goto __label_0
  __label_1: # endfor
# }
.annotate 'line', 733

.end # vprint


.sub 'print' :method
        .param pmc __ARG_1 :slurpy
# Body
# {
.annotate 'line', 736
    self.'updateannot'()
.annotate 'line', 737
    self.'vprint'(__ARG_1)
# }
.annotate 'line', 738

.end # print


.sub 'say' :method
        .param pmc __ARG_1 :slurpy
# Body
# {
.annotate 'line', 741
    self.'updateannot'()
.annotate 'line', 742
    self.'vprint'(__ARG_1)
.annotate 'line', 743
    getattribute $P1, self, 'handle'
    $P1.'print'("\n")
# }
.annotate 'line', 744

.end # say


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 747
    getattribute $P3, self, 'noan'
    unless_null $P3, __label_0
# {
.annotate 'line', 749
# var file: $P1
    getattribute $P1, self, 'file'
.annotate 'line', 750
# var line: $P2
    getattribute $P2, self, 'line'
.annotate 'line', 751
# tfile: $S1
    getattribute $P3, __ARG_1, 'file'
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 752
# tline: $I1
    getattribute $P3, __ARG_1, 'line'
    set $I1, $P3
.annotate 'line', 753
    set $S2, $P1
    eq $S2, $S1, __label_2
# {
.annotate 'line', 754
    assign $P1, $S1
.annotate 'line', 755
    getattribute $P3, self, 'pendingf'
    assign $P3, 1
.annotate 'line', 756
    assign $P2, 0
# }
  __label_2: # endif
.annotate 'line', 758
    set $I2, $P2
    eq $I2, $I1, __label_3
# {
.annotate 'line', 759
    assign $P2, $I1
.annotate 'line', 760
    getattribute $P3, self, 'pendingl'
    assign $P3, 1
# }
  __label_3: # endif
# }
  __label_0: # endif
# }
.annotate 'line', 763

.end # annotate


.sub 'comment' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 766
    self.'updateannot'()
.annotate 'line', 767
    getattribute $P1, self, 'handle'
    concat $S1, '# ', __ARG_1
    concat $S1, $S1, "\n"
    $P1.'print'($S1)
# }
.annotate 'line', 768

.end # comment


.sub 'emitlabel' :method
        .param string __ARG_1
        .param string __ARG_2 :optional
# Body
# {
.annotate 'line', 771
# var handle: $P1
    getattribute $P1, self, 'handle'
.annotate 'line', 772
    $P1.'print'('  ')
.annotate 'line', 773
    $P1.'print'(__ARG_1)
.annotate 'line', 774
    $P1.'print'(':')
.annotate 'line', 775
    if_null __ARG_2, __label_0
# {
.annotate 'line', 776
    concat $S1, ' # ', __ARG_2
    $P1.'print'($S1)
# }
  __label_0: # endif
.annotate 'line', 778
    $P1.'print'("\n")
# }
.annotate 'line', 779

.end # emitlabel


.sub 'emitgoto' :method
        .param string __ARG_1
        .param string __ARG_2 :optional
# Body
# {
.annotate 'line', 782
# var handle: $P1
    getattribute $P1, self, 'handle'
.annotate 'line', 783
    $P1.'print'('    goto ')
.annotate 'line', 784
    $P1.'print'(__ARG_1)
.annotate 'line', 785
    if_null __ARG_2, __label_0
# {
.annotate 'line', 786
    $P1.'print'(' # ')
.annotate 'line', 787
    $P1.'print'(__ARG_2)
# }
  __label_0: # endif
.annotate 'line', 789
    $P1.'print'("\n")
# }
.annotate 'line', 790

.end # emitgoto


.sub 'emitarg1' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 794
    concat $S1, '    ', __ARG_1
    concat $S1, $S1, ' '
    concat $S1, $S1, __ARG_2
    self.'say'($S1)
# }
.annotate 'line', 795

.end # emitarg1


.sub 'emitarg2' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 798
    concat $S1, '    ', __ARG_1
    concat $S1, $S1, ' '
    concat $S1, $S1, __ARG_2
    concat $S1, $S1, ', '
    concat $S1, $S1, __ARG_3
    self.'say'($S1)
# }
.annotate 'line', 799

.end # emitarg2


.sub 'emitcompare' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 802
    concat $S1, '    ', __ARG_1
    concat $S1, $S1, ' '
    concat $S1, $S1, __ARG_2
    concat $S1, $S1, ', '
    concat $S1, $S1, __ARG_3
    concat $S1, $S1, ', '
    concat $S1, $S1, __ARG_4
    self.'say'($S1)
# }
.annotate 'line', 803

.end # emitcompare


.sub 'emitif' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 806
    self.'say'('    if ', __ARG_1, ' goto ', __ARG_2)
# }
.annotate 'line', 807

.end # emitif


.sub 'emitunless' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 810
    self.'say'('    unless ', __ARG_1, ' goto ', __ARG_2)
# }
.annotate 'line', 811

.end # emitunless


.sub 'emitif_null' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 814
    self.'say'('    if_null ', __ARG_1, ', ', __ARG_2)
# }
.annotate 'line', 815

.end # emitif_null


.sub 'emitnull' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 818
    self.'say'("    null ", __ARG_1)
# }
.annotate 'line', 819

.end # emitnull


.sub 'emitinc' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 823
    self.'say'('    inc ', __ARG_1)
# }
.annotate 'line', 824

.end # emitinc


.sub 'emitdec' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 827
    self.'say'('    dec ', __ARG_1)
# }
.annotate 'line', 828

.end # emitdec


.sub 'emitset' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 831
    self.'say'("    set ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 832

.end # emitset


.sub 'emitassign' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 835
    self.'say'("    assign ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 836

.end # emitassign


.sub 'emitbox' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 839
    self.'say'("    box ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 840

.end # emitbox


.sub 'emitunbox' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 843
    self.'say'("    unbox ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 844

.end # emitunbox


.sub 'emitbinop' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 847
    self.'say'('    ', __ARG_1, " ", __ARG_2, ", ", __ARG_3, ", ", __ARG_4)
# }
.annotate 'line', 848

.end # emitbinop


.sub 'emitaddto' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 851
    self.'say'("    add ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 852

.end # emitaddto


.sub 'emitsubto' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 855
    self.'say'("    sub ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 856

.end # emitsubto


.sub 'emitadd' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 859
    self.'say'("    add ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 860

.end # emitadd


.sub 'emitsub' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 863
    self.'say'("    sub ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 864

.end # emitsub


.sub 'emitmul' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 867
    self.'say'("    mul ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 868

.end # emitmul


.sub 'emitdiv' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 871
    self.'say'("    div ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 872

.end # emitdiv


.sub 'emitconcat1' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 875
    self.'say'("    concat ", __ARG_1, ", ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 876

.end # emitconcat1


.sub 'emitconcat' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 879
    self.'say'("    concat ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 880

.end # emitconcat


.sub 'emitrepeat' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 883
    self.'say'("    repeat ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 884

.end # emitrepeat


.sub 'emitprint' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 887
    self.'say'('    print ', __ARG_1)
# }
.annotate 'line', 888

.end # emitprint


.sub 'emitsay' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 891
    self.'say'('    say ', __ARG_1)
# }
.annotate 'line', 892

.end # emitsay


.sub 'emitfind_lex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 895
    concat $S1, "    find_lex ", __ARG_1
    concat $S1, $S1, ", '"
    concat $S1, $S1, __ARG_2
    concat $S1, $S1, "'"
    self.'say'($S1)
# }
.annotate 'line', 896

.end # emitfind_lex

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Emit' ]
.annotate 'line', 687
    addattribute $P0, 'handle'
.annotate 'line', 688
    addattribute $P0, 'file'
.annotate 'line', 689
    addattribute $P0, 'line'
.annotate 'line', 690
    addattribute $P0, 'pendingf'
.annotate 'line', 691
    addattribute $P0, 'pendingl'
.annotate 'line', 692
    addattribute $P0, 'noan'
.end
.namespace [ ]

.sub 'integerValue'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 905
    new $P2, [ 'IntegerLiteral' ]
    $P2.'IntegerLiteral'(__ARG_1, __ARG_2, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 906

.end # integerValue


.sub 'floatValue'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param num __ARG_3
# Body
# {
.annotate 'line', 910
# var t: $P1
    new $P1, [ 'TokenFloat' ]
    getattribute $P2, __ARG_2, 'file'
    getattribute $P3, __ARG_2, 'line'
    $P1.'TokenFloat'($P2, $P3, __ARG_3)
.annotate 'line', 911
    new $P3, [ 'FloatLiteral' ]
    $P3.'FloatLiteral'(__ARG_1, $P1)
    set $P2, $P3
    .return($P2)
# }
.annotate 'line', 912

.end # floatValue


.sub 'floatresult'
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 920
# result: $I1
    iseq $I1, __ARG_1, 'N'
    unless $I1 goto __label_1
    iseq $I1, __ARG_2, 'N'
    if $I1 goto __label_2
    iseq $I1, __ARG_2, 'I'
  __label_2:
  __label_1:
    if $I1 goto __label_0
.annotate 'line', 921
    iseq $I1, __ARG_2, 'N'
    unless $I1 goto __label_3
    iseq $I1, __ARG_1, 'N'
    if $I1 goto __label_4
    iseq $I1, __ARG_1, 'I'
  __label_4:
  __label_3:
  __label_0:
.annotate 'line', 922
    .return($I1)
# }
.annotate 'line', 923

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
.annotate 'line', 960
# l: $I2
# predefined length
    length $I3, __ARG_2
    sub $I2, $I3, 1
.annotate 'line', 961
# predefined substr
    substr $S1, __ARG_2, $I2, 1
    ne $S1, "\n", __label_0
.annotate 'line', 962
# predefined substr
    substr __ARG_2, __ARG_2, 0, $I2
  __label_0: # endif
.annotate 'line', 963
# predefined split
    split $P1, "\n", __ARG_2
# predefined join
    join $S1, "\n    ", $P1
    concat $S0, '    ', $S1
    set __ARG_2, $S0
.annotate 'line', 964
    box $P1, __ARG_2
    setattribute self, 'body', $P1
.annotate 'line', 965
    box $P1, __ARG_1
    setattribute self, 'typeresult', $P1
# }
.annotate 'line', 966

.end # Predef_frombody


.sub 'invoke' :method :vtable
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 969
# typeresult: $S1
    getattribute $P2, self, 'typeresult'
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
  __label_0:
.annotate 'line', 971
    ne $S1, 'v', __label_1
# {
.annotate 'line', 972
    isnull $I1, __ARG_3
    not $I1
    unless $I1 goto __label_4
    isne $I1, __ARG_3, ''
  __label_4:
    unless $I1 goto __label_3
.annotate 'line', 973
    'SyntaxError'('using return value from void predef')
  __label_3: # endif
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 976
    isnull $I1, __ARG_3
    if $I1 goto __label_6
    iseq $I1, __ARG_3, ''
  __label_6:
    unless $I1 goto __label_5
.annotate 'line', 977
    'InternalError'('Bad result in non void predef')
  __label_5: # endif
# }
  __label_2: # endif
.annotate 'line', 980
# var builder: $P1
    new $P1, [ 'StringBuilder' ]
.annotate 'line', 981
    getattribute $P2, self, 'body'
    $P1.'append_format'($P2, __ARG_3, __ARG_4 :flat)
.annotate 'line', 982
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 983
# predefined string
    set $S2, $P1
    __ARG_1.'say'($S2)
# }
.annotate 'line', 984

.end # invoke

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Predef_frombody' ]
.annotate 'line', 946
    addattribute $P0, 'body'
.annotate 'line', 947
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
.annotate 'line', 1005
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 1006
    isa $I2, __ARG_2, 'String'
    unless $I2 goto __label_0
.annotate 'line', 1007
    new $P3, [ 'Predef_frombody' ]
    $P3.'Predef_frombody'(__ARG_3, __ARG_2)
    set $P2, $P3
    setattribute self, 'body', $P2
    goto __label_1
  __label_0: # else
.annotate 'line', 1009
    setattribute self, 'body', __ARG_2
  __label_1: # endif
.annotate 'line', 1010
    box $P1, __ARG_3
    setattribute self, 'typeresult', $P1
.annotate 'line', 1011
# n: $I1
    null $I1
.annotate 'line', 1012
    if_null __ARG_4, __label_2
# {
.annotate 'line', 1013
    box $P1, __ARG_4
    setattribute self, 'type0', $P1
# switch
.annotate 'line', 1014
    set $S1, __ARG_4
    set $S2, '*'
    if $S1 == $S2 goto __label_5
    set $S2, '!'
    if $S1 == $S2 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 1016
    set $I1, -1
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 1019
    set $I1, -2
.annotate 'line', 1020
    if_null __ARG_5, __label_7
.annotate 'line', 1021
    concat $S3, "Invalid predef '", __ARG_1
    concat $S3, $S3, '"'
    'InternalError'($S3)
  __label_7: # endif
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 1024
    set $I1, 1
.annotate 'line', 1025
    if_null __ARG_5, __label_8
# {
.annotate 'line', 1026
    box $P1, __ARG_5
    setattribute self, 'type1', $P1
.annotate 'line', 1027
    inc $I1
# }
  __label_8: # endif
.annotate 'line', 1029
    if_null __ARG_6, __label_9
# {
.annotate 'line', 1030
    box $P1, __ARG_6
    setattribute self, 'type2', $P1
.annotate 'line', 1031
    inc $I1
# }
  __label_9: # endif
.annotate 'line', 1033
    if_null __ARG_7, __label_10
# {
.annotate 'line', 1034
    box $P1, __ARG_7
    setattribute self, 'type3', $P1
.annotate 'line', 1035
    inc $I1
# }
  __label_10: # endif
  __label_3: # switch end
# }
  __label_2: # endif
.annotate 'line', 1039
    box $P1, $I1
    setattribute self, 'nparams', $P1
# }
.annotate 'line', 1040

.end # PredefBase


.sub 'name' :method
# Body
# {
.annotate 'line', 1043
# name: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 1044
    .return($S1)
# }
.annotate 'line', 1045

.end # name


.sub 'result' :method
# Body
# {
.annotate 'line', 1048
    getattribute $P1, self, 'typeresult'
    .return($P1)
# }
.annotate 'line', 1049

.end # result


.sub 'params' :method
# Body
# {
.annotate 'line', 1050
    getattribute $P1, self, 'nparams'
    .return($P1)
# }

.end # params


.sub 'paramtype' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 1053
# type: $S1
    null $S1
# switch
.annotate 'line', 1054
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
.annotate 'line', 1055
    getattribute $P1, self, 'type0'
    set $S1, $P1
    goto __label_0 # break
  __label_3: # case
.annotate 'line', 1056
    getattribute $P2, self, 'type1'
    set $S1, $P2
    goto __label_0 # break
  __label_4: # case
.annotate 'line', 1057
    getattribute $P3, self, 'type2'
    set $S1, $P3
    goto __label_0 # break
  __label_5: # case
.annotate 'line', 1058
    getattribute $P4, self, 'type3'
    set $S1, $P4
    goto __label_0 # break
  __label_1: # default
.annotate 'line', 1060
    'InternalError'('Invalid predef arg')
  __label_0: # switch end
.annotate 'line', 1062
    .return($S1)
# }
.annotate 'line', 1063

.end # paramtype


.sub 'expand' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 1066
# predefined string
    getattribute $P2, self, 'name'
    set $S2, $P2
    concat $S3, 'predefined ', $S2
    __ARG_1.'comment'($S3)
.annotate 'line', 1067
# typeresult: $S1
    getattribute $P2, self, 'typeresult'
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
  __label_0:
.annotate 'line', 1068
    isne $I1, $S1, 'v'
    unless $I1 goto __label_2
    iseq $I1, __ARG_4, ''
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 1069
    $P2 = __ARG_2.'tempreg'($S1)
    set __ARG_4, $P2
  __label_1: # endif
.annotate 'line', 1070
# var fun: $P1
    getattribute $P1, self, 'body'
.annotate 'line', 1071
    $P1(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
# }
.annotate 'line', 1072

.end # expand

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'PredefBase' ]
.annotate 'line', 989
    addattribute $P0, 'name'
.annotate 'line', 990
    addattribute $P0, 'body'
.annotate 'line', 991
    addattribute $P0, 'typeresult'
.annotate 'line', 992
    addattribute $P0, 'type0'
.annotate 'line', 993
    addattribute $P0, 'type1'
.annotate 'line', 994
    addattribute $P0, 'type2'
.annotate 'line', 995
    addattribute $P0, 'type3'
.annotate 'line', 996
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
.annotate 'line', 1084
    self.'PredefBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7)
# }
.annotate 'line', 1085

.end # PredefFunction

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'PredefFunction' ]
.annotate 'line', 1075
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
.annotate 'line', 1098
    self.'PredefBase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7, __ARG_8)
.annotate 'line', 1099
    setattribute self, 'evalfun', __ARG_2
# }
.annotate 'line', 1100

.end # PredefFunctionEval

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'PredefFunctionEval' ]
.annotate 'line', 1088
    get_class $P1, [ 'PredefBase' ]
    addparent $P0, $P1
.annotate 'line', 1090
    addattribute $P0, 'evalfun'
.end
.namespace [ 'Predef_typecast' ]

.sub 'Predef_typecast' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1108
    box $P1, __ARG_1
    setattribute self, 'type', $P1
# }
.annotate 'line', 1109

.end # Predef_typecast


.sub 'invoke' :method :vtable
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 1112
# type: $S1
    getattribute $P2, self, 'type'
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
  __label_0:
.annotate 'line', 1113
# predefined elements
    elements $I1, __ARG_4
    eq $I1, 1, __label_1
.annotate 'line', 1114
    'InternalError'("Invalid Predef_typecast.invoke call")
  __label_1: # endif
.annotate 'line', 1115
# var rawarg: $P1
    $P1 = __ARG_4[0]
.annotate 'line', 1116
# argtype: $S2
    $P2 = $P1.'checkresult'()
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
# switch-case
.annotate 'line', 1118
    iseq $I1, $S2, $S1
    if $I1 goto __label_5
.annotate 'line', 1119
    isa $I1, $P1, [ 'IndexExpr' ]
    if $I1 goto __label_6
    goto __label_4
  __label_5: # case
  __label_6: # case
.annotate 'line', 1120
    $P1.'emit'(__ARG_1, __ARG_3)
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 1123
# arg: $S3
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P2, __label_7
    set $S3, $P2
  __label_7:
.annotate 'line', 1124
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1126
    ne $S3, 'null', __label_8
.annotate 'line', 1127
    __ARG_1.'emitnull'(__ARG_3)
    goto __label_9
  __label_8: # else
.annotate 'line', 1129
    __ARG_1.'emitset'(__ARG_3, $S3)
  __label_9: # endif
  __label_3: # switch end
# }
.annotate 'line', 1131

.end # invoke

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Predef_typecast' ]
.annotate 'line', 1105
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
.annotate 'line', 1136
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1137
# n: $I1
# predefined elements
    elements $I3, __ARG_4
    sub $I1, $I3, 1
.annotate 'line', 1138
    lt $I1, 0, __label_0
# {
# for loop
.annotate 'line', 1139
# i: $I2
    null $I2
  __label_4: # for condition
    ge $I2, $I1, __label_3
.annotate 'line', 1140
    $P1 = __ARG_4[$I2]
    __ARG_1.'emitprint'($P1)
  __label_2: # for iteration
.annotate 'line', 1139
    inc $I2
    goto __label_4
  __label_3: # for end
.annotate 'line', 1141
    $P1 = __ARG_4[$I1]
    __ARG_1.'emitsay'($P1)
# }
    goto __label_1
  __label_0: # else
.annotate 'line', 1144
    __ARG_1.'emitsay'("''")
  __label_1: # endif
# }
.annotate 'line', 1145

.end # Predef_say


.sub 'Predef_cry'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 1149
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1150
    __ARG_1.'say'('    ', "getstderr $P0")
.annotate 'line', 1151
    iter $P1, __ARG_4
    set $P1, 0
  __label_0: # for iteration
    unless $P1 goto __label_1
    shift $S1, $P1
.annotate 'line', 1152
    __ARG_1.'say'('    ', "print $P0, ", $S1)
    goto __label_0
  __label_1: # endfor
.annotate 'line', 1153
    __ARG_1.'say'('    ', "print $P0, \"\\n\"")
# }
.annotate 'line', 1154

.end # Predef_cry


.sub 'Predef_print'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 1158
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1159
    iter $P1, __ARG_4
    set $P1, 0
  __label_0: # for iteration
    unless $P1 goto __label_1
    shift $S1, $P1
.annotate 'line', 1160
    __ARG_1.'emitprint'($S1)
    goto __label_0
  __label_1: # endfor
# }
.annotate 'line', 1161

.end # Predef_print


.sub 'Predef_invoke'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 1167
# var arg: $P1
    $P1 = __ARG_4[0]
.annotate 'line', 1168
    isa $I2, $P1, [ 'CallExpr' ]
    not $I1, $I2
    unless $I1 goto __label_0
.annotate 'line', 1169
    'SyntaxError'("invoke argument must be callable", __ARG_2)
  __label_0: # endif
.annotate 'line', 1170
    concat $S1, "(", __ARG_3
    concat $S1, $S1, " :call_sig)"
    $P1.'emit'(__ARG_1, $S1)
# }
.annotate 'line', 1171

.end # Predef_invoke


.sub 'predefeval_length' :subid('WSubId_1')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1175
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1176
# s: $S1
    $P2 = $P1.'get_value'()
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
  __label_0:
.annotate 'line', 1177
# predefined length
    length $I1, $S1
    .tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1178

.end # predefeval_length


.sub 'predefeval_bytelength' :subid('WSubId_2')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1182
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1183
# s: $S1
    $P2 = $P1.'get_value'()
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
  __label_0:
.annotate 'line', 1184
# predefined bytelength
    bytelength $I1, $S1
    .tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1185

.end # predefeval_bytelength


.sub 'predefeval_ord' :subid('WSubId_4')
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
# predefined ord
    ord $I1, $S1
    .tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1192

.end # predefeval_ord


.sub 'predefeval_ord_n' :subid('WSubId_5')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1196
# var arg: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1197
# s: $S1
    $P3 = $P1.'get_value'()
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
  __label_0:
.annotate 'line', 1198
# var argn: $P2
    $P3 = __ARG_3[1]
    getattribute $P2, $P3, 'arg'
.annotate 'line', 1199
# n: $I1
    getattribute $P3, $P2, 'numval'
    set $I1, $P3
.annotate 'line', 1200
# predefined ord
    ord $I2, $S1, $I1
    .tailcall 'integerValue'(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 1201

.end # predefeval_ord_n


.sub 'predefeval_chr' :subid('WSubId_3')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1205
# var arg: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1207
# n: $I1
    getattribute $P3, $P1, 'numval'
    set $I1, $P3
.annotate 'line', 1208
# s: $S1
# predefined chr
    chr $S0, $I1
    find_encoding $I0, 'utf8'
    trans_encoding $S1, $S0, $I0
.annotate 'line', 1210
# var t: $P2
    new $P2, [ 'TokenQuoted' ]
    getattribute $P3, __ARG_2, 'file'
    getattribute $P4, __ARG_2, 'line'
    $P2.'TokenQuoted'($P3, $P4, $S1)
.annotate 'line', 1211
    new $P4, [ 'StringLiteral' ]
    $P4.'StringLiteral'(__ARG_1, $P2)
    set $P3, $P4
    .return($P3)
# }
.annotate 'line', 1212

.end # predefeval_chr


.sub 'predefeval_substr' :subid('WSubId_6')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1216
# var argstr: $P1
    $P4 = __ARG_3[0]
    getattribute $P1, $P4, 'arg'
.annotate 'line', 1217
# var argpos: $P2
    $P4 = __ARG_3[1]
    getattribute $P2, $P4, 'arg'
.annotate 'line', 1218
# str: $S1
    $P4 = $P1.'get_value'()
    null $S1
    if_null $P4, __label_0
    set $S1, $P4
  __label_0:
.annotate 'line', 1219
# pos: $I1
    getattribute $P4, $P2, 'numval'
    set $I1, $P4
.annotate 'line', 1221
# var t: $P3
    new $P3, [ 'TokenQuoted' ]
    getattribute $P4, __ARG_2, 'file'
    getattribute $P5, __ARG_2, 'line'
# predefined substr
    substr $S2, $S1, $I1
    $P3.'TokenQuoted'($P4, $P5, $S2)
.annotate 'line', 1222
    new $P5, [ 'StringLiteral' ]
    $P5.'StringLiteral'(__ARG_1, $P3)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 1223

.end # predefeval_substr


.sub 'predefeval_substr_l' :subid('WSubId_7')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1227
# var argstr: $P1
    $P5 = __ARG_3[0]
    getattribute $P1, $P5, 'arg'
.annotate 'line', 1228
# var argpos: $P2
    $P5 = __ARG_3[1]
    getattribute $P2, $P5, 'arg'
.annotate 'line', 1229
# var arglen: $P3
    $P5 = __ARG_3[2]
    getattribute $P3, $P5, 'arg'
.annotate 'line', 1230
# str: $S1
    $P5 = $P1.'get_value'()
    null $S1
    if_null $P5, __label_0
    set $S1, $P5
  __label_0:
.annotate 'line', 1231
# pos: $I1
    getattribute $P5, $P2, 'numval'
    set $I1, $P5
.annotate 'line', 1232
# len: $I2
    getattribute $P5, $P3, 'numval'
    set $I2, $P5
.annotate 'line', 1234
# var t: $P4
    new $P4, [ 'TokenQuoted' ]
    getattribute $P5, __ARG_2, 'file'
    getattribute $P6, __ARG_2, 'line'
# predefined substr
    substr $S2, $S1, $I1, $I2
    $P4.'TokenQuoted'($P5, $P6, $S2)
.annotate 'line', 1235
    new $P6, [ 'StringLiteral' ]
    $P6.'StringLiteral'(__ARG_1, $P4)
    set $P5, $P6
    .return($P5)
# }
.annotate 'line', 1236

.end # predefeval_substr_l


.sub 'predefeval_indexof' :subid('WSubId_8')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1240
# var argstrfrom: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1241
# var argstrsearch: $P2
    $P3 = __ARG_3[1]
    getattribute $P2, $P3, 'arg'
.annotate 'line', 1242
# strfrom: $S1
    $P3 = $P1.'get_value'()
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
  __label_0:
.annotate 'line', 1243
# strsearch: $S2
    $P3 = $P2.'get_value'()
    null $S2
    if_null $P3, __label_1
    set $S2, $P3
  __label_1:
.annotate 'line', 1244
# predefined indexof
    index $I1, $S1, $S2
    .tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1245

.end # predefeval_indexof


.sub 'predefeval_indexof_pos' :subid('WSubId_9')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1249
# var argstrfrom: $P1
    $P4 = __ARG_3[0]
    getattribute $P1, $P4, 'arg'
.annotate 'line', 1250
# var argstrsearch: $P2
    $P4 = __ARG_3[1]
    getattribute $P2, $P4, 'arg'
.annotate 'line', 1251
# var argpos: $P3
    $P4 = __ARG_3[2]
    getattribute $P3, $P4, 'arg'
.annotate 'line', 1252
# strfrom: $S1
    $P4 = $P1.'get_value'()
    null $S1
    if_null $P4, __label_0
    set $S1, $P4
  __label_0:
.annotate 'line', 1253
# strsearch: $S2
    $P4 = $P2.'get_value'()
    null $S2
    if_null $P4, __label_1
    set $S2, $P4
  __label_1:
.annotate 'line', 1254
# pos: $I1
    getattribute $P4, $P3, 'numval'
    set $I1, $P4
.annotate 'line', 1255
# predefined indexof
    index $I2, $S1, $S2, $I1
    .tailcall 'integerValue'(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 1256

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
.annotate 'line', 1269
.const 'Sub' $P11 = 'Predef_print'
.const 'Sub' $P12 = 'Predef_say'
.const 'Sub' $P13 = 'Predef_cry'
.const 'Sub' $P14 = 'Predef_invoke'
.annotate 'line', 1271
# var predefs: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1272
    new $P17, [ 'PredefFunction' ]
.annotate 'line', 1273
    new $P19, [ 'Predef_typecast' ]
    $P19.'Predef_typecast'('I')
    set $P18, $P19
    $P17.'PredefFunction'('int', $P18, 'I', '!')
    set $P16, $P17
.annotate 'line', 1271
    push $P1, $P16
.annotate 'line', 1276
    new $P21, [ 'PredefFunction' ]
.annotate 'line', 1277
    new $P23, [ 'Predef_typecast' ]
    $P23.'Predef_typecast'('N')
    set $P22, $P23
    $P21.'PredefFunction'('float', $P22, 'N', '!')
    set $P20, $P21
.annotate 'line', 1271
    push $P1, $P20
.annotate 'line', 1280
    new $P25, [ 'PredefFunction' ]
.annotate 'line', 1281
    new $P27, [ 'Predef_typecast' ]
    $P27.'Predef_typecast'('S')
    set $P26, $P27
    $P25.'PredefFunction'('string', $P26, 'S', '!')
    set $P24, $P25
.annotate 'line', 1271
    push $P1, $P24
.annotate 'line', 1284
    new $P29, [ 'PredefFunction' ]
    $P29.'PredefFunction'('die', 'die %1', 'v', 'S')
    set $P28, $P29
.annotate 'line', 1271
    push $P1, $P28
.annotate 'line', 1288
    new $P31, [ 'PredefFunction' ]
    $P31.'PredefFunction'('exit', 'exit %1', 'v', 'I')
    set $P30, $P31
.annotate 'line', 1271
    push $P1, $P30
.annotate 'line', 1292
    new $P33, [ 'PredefFunction' ]
    $P33.'PredefFunction'('time', 'time %0', 'I')
    set $P32, $P33
.annotate 'line', 1271
    push $P1, $P32
.annotate 'line', 1296
    new $P35, [ 'PredefFunction' ]
    $P35.'PredefFunction'('floattime', 'time %0', 'N')
    set $P34, $P35
.annotate 'line', 1271
    push $P1, $P34
.annotate 'line', 1300
    new $P37, [ 'PredefFunction' ]
    $P37.'PredefFunction'('spawnw', 'spawnw %0, %1', 'I', 'P')
    set $P36, $P37
.annotate 'line', 1271
    push $P1, $P36
.annotate 'line', 1304
    new $P39, [ 'PredefFunction' ]
    $P39.'PredefFunction'('getstdin', 'getstdin %0', 'P')
    set $P38, $P39
.annotate 'line', 1271
    push $P1, $P38
.annotate 'line', 1308
    new $P41, [ 'PredefFunction' ]
    $P41.'PredefFunction'('getstdout', 'getstdout %0', 'P')
    set $P40, $P41
.annotate 'line', 1271
    push $P1, $P40
.annotate 'line', 1312
    new $P43, [ 'PredefFunction' ]
    $P43.'PredefFunction'('getstderr', 'getstderr %0', 'P')
    set $P42, $P43
.annotate 'line', 1271
    push $P1, $P42
.annotate 'line', 1316
    new $P45, [ 'PredefFunction' ]
    $P45.'PredefFunction'('open', "root_new %0, ['parrot';'FileHandle']\n%0.'open'(%1)\n", 'P', 'S')
    set $P44, $P45
.annotate 'line', 1271
    push $P1, $P44
.annotate 'line', 1323
    new $P47, [ 'PredefFunction' ]
    $P47.'PredefFunction'('open', "root_new %0, ['parrot';'FileHandle']\n%0.'open'(%1,%2)\n", 'P', 'S', 'S')
    set $P46, $P47
.annotate 'line', 1271
    push $P1, $P46
.annotate 'line', 1330
    new $P49, [ 'PredefFunction' ]
    $P49.'PredefFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n", 'P', 'S')
    set $P48, $P49
.annotate 'line', 1271
    push $P1, $P48
.annotate 'line', 1337
    new $P51, [ 'PredefFunction' ]
    $P51.'PredefFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n", 'P', 'S', 'I')
    set $P50, $P51
.annotate 'line', 1271
    push $P1, $P50
.annotate 'line', 1345
    new $P53, [ 'PredefFunction' ]
    $P53.'PredefFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n%0['type'] = %3\n", 'P', 'S', 'I', 'I')
    set $P52, $P53
.annotate 'line', 1271
    push $P1, $P52
.annotate 'line', 1354
    new $P55, [ 'PredefFunction' ]
    $P55.'PredefFunction'('elements', 'elements %0, %1', 'I', 'P')
    set $P54, $P55
.annotate 'line', 1271
    push $P1, $P54
.annotate 'line', 1358
    new $P57, [ 'PredefFunctionEval' ]
.annotate 'line', 1359
    $P57.'PredefFunctionEval'('length', $P2, 'length %0, %1', 'I', 'S')
    set $P56, $P57
.annotate 'line', 1271
    push $P1, $P56
.annotate 'line', 1363
    new $P59, [ 'PredefFunctionEval' ]
.annotate 'line', 1364
    $P59.'PredefFunctionEval'('bytelength', $P3, 'bytelength %0, %1', 'I', 'S')
    set $P58, $P59
.annotate 'line', 1271
    push $P1, $P58
.annotate 'line', 1368
    new $P61, [ 'PredefFunctionEval' ]
.annotate 'line', 1369
    $P61.'PredefFunctionEval'('chr', $P4, "chr $S0, %1\nfind_encoding $I0, 'utf8'\ntrans_encoding %0, $S0, $I0\n", 'S', 'I')
    set $P60, $P61
.annotate 'line', 1271
    push $P1, $P60
.annotate 'line', 1377
    new $P63, [ 'PredefFunctionEval' ]
.annotate 'line', 1378
    $P63.'PredefFunctionEval'('ord', $P5, 'ord %0, %1', 'I', 'S')
    set $P62, $P63
.annotate 'line', 1271
    push $P1, $P62
.annotate 'line', 1382
    new $P65, [ 'PredefFunctionEval' ]
.annotate 'line', 1383
    $P65.'PredefFunctionEval'('ord', $P6, 'ord %0, %1, %2', 'I', 'S', 'I')
    set $P64, $P65
.annotate 'line', 1271
    push $P1, $P64
.annotate 'line', 1387
    new $P67, [ 'PredefFunctionEval' ]
.annotate 'line', 1388
    $P67.'PredefFunctionEval'('substr', $P7, 'substr %0, %1, %2', 'S', 'S', 'I')
    set $P66, $P67
.annotate 'line', 1271
    push $P1, $P66
.annotate 'line', 1392
    new $P69, [ 'PredefFunctionEval' ]
.annotate 'line', 1393
    $P69.'PredefFunctionEval'('substr', $P8, 'substr %0, %1, %2, %3', 'S', 'S', 'I', 'I')
    set $P68, $P69
.annotate 'line', 1271
    push $P1, $P68
.annotate 'line', 1397
    new $P71, [ 'PredefFunction' ]
    $P71.'PredefFunction'('replace', 'replace %0, %1, %2, %3, %4', 'S', 'S', 'I', 'I', 'S')
    set $P70, $P71
.annotate 'line', 1271
    push $P1, $P70
.annotate 'line', 1401
    new $P73, [ 'PredefFunctionEval' ]
.annotate 'line', 1402
    $P73.'PredefFunctionEval'('indexof', $P9, 'index %0, %1, %2', 'I', 'S', 'S')
    set $P72, $P73
.annotate 'line', 1271
    push $P1, $P72
.annotate 'line', 1406
    new $P75, [ 'PredefFunctionEval' ]
.annotate 'line', 1407
    $P75.'PredefFunctionEval'('indexof', $P10, 'index %0, %1, %2, %3', 'I', 'S', 'S', 'I')
    set $P74, $P75
.annotate 'line', 1271
    push $P1, $P74
.annotate 'line', 1411
    new $P77, [ 'PredefFunction' ]
    $P77.'PredefFunction'('join', 'join %0, %1, %2', 'S', 'S', 'P')
    set $P76, $P77
.annotate 'line', 1271
    push $P1, $P76
.annotate 'line', 1415
    new $P79, [ 'PredefFunction' ]
    $P79.'PredefFunction'('upcase', 'upcase %0, %1', 'S', 'S')
    set $P78, $P79
.annotate 'line', 1271
    push $P1, $P78
.annotate 'line', 1419
    new $P81, [ 'PredefFunction' ]
    $P81.'PredefFunction'('downcase', 'downcase %0, %1', 'S', 'S')
    set $P80, $P81
.annotate 'line', 1271
    push $P1, $P80
.annotate 'line', 1423
    new $P83, [ 'PredefFunction' ]
    $P83.'PredefFunction'('titlecase', 'titlecase %0, %1', 'S', 'S')
    set $P82, $P83
.annotate 'line', 1271
    push $P1, $P82
.annotate 'line', 1427
    new $P85, [ 'PredefFunction' ]
    $P85.'PredefFunction'('split', 'split %0, %1, %2', 'P', 'S', 'S')
    set $P84, $P85
.annotate 'line', 1271
    push $P1, $P84
.annotate 'line', 1431
    new $P87, [ 'PredefFunction' ]
    $P87.'PredefFunction'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n%0 = $P0(%1)\n", 'S', 'S')
    set $P86, $P87
.annotate 'line', 1271
    push $P1, $P86
.annotate 'line', 1438
    new $P89, [ 'PredefFunction' ]
    $P89.'PredefFunction'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n%0 = $P0(%1, %2)\n", 'S', 'S', 'S')
    set $P88, $P89
.annotate 'line', 1271
    push $P1, $P88
.annotate 'line', 1445
    new $P91, [ 'PredefFunction' ]
    $P91.'PredefFunction'('push', 'push %1, %2', 'v', 'P', '?')
    set $P90, $P91
.annotate 'line', 1271
    push $P1, $P90
.annotate 'line', 1449
    new $P93, [ 'PredefFunction' ]
    $P93.'PredefFunction'('sqrt', 'sqrt %0, %1', 'N', 'N')
    set $P92, $P93
.annotate 'line', 1271
    push $P1, $P92
.annotate 'line', 1453
    new $P95, [ 'PredefFunction' ]
    $P95.'PredefFunction'('pow', 'pow %0, %1, %2', 'N', 'N', 'N')
    set $P94, $P95
.annotate 'line', 1271
    push $P1, $P94
.annotate 'line', 1457
    new $P97, [ 'PredefFunction' ]
    $P97.'PredefFunction'('exp', 'exp %0, %1', 'N', 'N')
    set $P96, $P97
.annotate 'line', 1271
    push $P1, $P96
.annotate 'line', 1461
    new $P99, [ 'PredefFunction' ]
    $P99.'PredefFunction'('ln', 'ln %0, %1', 'N', 'N')
    set $P98, $P99
.annotate 'line', 1271
    push $P1, $P98
.annotate 'line', 1465
    new $P101, [ 'PredefFunction' ]
    $P101.'PredefFunction'('sin', 'sin %0, %1', 'N', 'N')
    set $P100, $P101
.annotate 'line', 1271
    push $P1, $P100
.annotate 'line', 1469
    new $P103, [ 'PredefFunction' ]
    $P103.'PredefFunction'('cos', 'cos %0, %1', 'N', 'N')
    set $P102, $P103
.annotate 'line', 1271
    push $P1, $P102
.annotate 'line', 1473
    new $P105, [ 'PredefFunction' ]
    $P105.'PredefFunction'('tan', 'tan %0, %1', 'N', 'N')
    set $P104, $P105
.annotate 'line', 1271
    push $P1, $P104
.annotate 'line', 1477
    new $P107, [ 'PredefFunction' ]
    $P107.'PredefFunction'('asin', 'asin %0, %1', 'N', 'N')
    set $P106, $P107
.annotate 'line', 1271
    push $P1, $P106
.annotate 'line', 1481
    new $P109, [ 'PredefFunction' ]
    $P109.'PredefFunction'('acos', 'acos %0, %1', 'N', 'N')
    set $P108, $P109
.annotate 'line', 1271
    push $P1, $P108
.annotate 'line', 1485
    new $P111, [ 'PredefFunction' ]
    $P111.'PredefFunction'('atan', 'atan %0, %1', 'N', 'N')
    set $P110, $P111
.annotate 'line', 1271
    push $P1, $P110
.annotate 'line', 1489
    new $P113, [ 'PredefFunction' ]
    $P113.'PredefFunction'('atan', 'atan %0, %1, %2', 'N', 'N', 'N')
    set $P112, $P113
.annotate 'line', 1271
    push $P1, $P112
.annotate 'line', 1493
    new $P115, [ 'PredefFunction' ]
    $P115.'PredefFunction'('getinterp', 'getinterp %0', 'P')
    set $P114, $P115
.annotate 'line', 1271
    push $P1, $P114
.annotate 'line', 1497
    new $P117, [ 'PredefFunction' ]
    $P117.'PredefFunction'('get_class', 'get_class %0, %1', 'P', 'S')
    set $P116, $P117
.annotate 'line', 1271
    push $P1, $P116
.annotate 'line', 1501
    new $P119, [ 'PredefFunction' ]
    $P119.'PredefFunction'('typeof', 'typeof %0, %1', 'P', 'P')
    set $P118, $P119
.annotate 'line', 1271
    push $P1, $P118
.annotate 'line', 1505
    new $P121, [ 'PredefFunction' ]
    $P121.'PredefFunction'('getattribute', 'getattribute %0, %1, %2', 'P', 'P', 'S')
    set $P120, $P121
.annotate 'line', 1271
    push $P1, $P120
.annotate 'line', 1509
    new $P123, [ 'PredefFunction' ]
    $P123.'PredefFunction'('find_method', 'find_method %0, %1, %2', 'P', 'P', 'S')
    set $P122, $P123
.annotate 'line', 1271
    push $P1, $P122
.annotate 'line', 1513
    new $P125, [ 'PredefFunction' ]
    $P125.'PredefFunction'('callmethodwithargs', '%0 = %1.%2(%3 :flat)', 'P', 'P', 'P', 'P')
    set $P124, $P125
.annotate 'line', 1271
    push $P1, $P124
.annotate 'line', 1517
    new $P127, [ 'PredefFunction' ]
    $P127.'PredefFunction'('clone', 'clone %0, %1', 'P', 'P')
    set $P126, $P127
.annotate 'line', 1271
    push $P1, $P126
.annotate 'line', 1521
    new $P129, [ 'PredefFunction' ]
    $P129.'PredefFunction'('compreg', 'compreg %0, %1', 'P', 'S')
    set $P128, $P129
.annotate 'line', 1271
    push $P1, $P128
.annotate 'line', 1525
    new $P131, [ 'PredefFunction' ]
    $P131.'PredefFunction'('compreg', 'compreg %1, %2', 'v', 'S', 'P')
    set $P130, $P131
.annotate 'line', 1271
    push $P1, $P130
.annotate 'line', 1529
    new $P133, [ 'PredefFunction' ]
    $P133.'PredefFunction'('load_language', "load_language %1\ncompreg %0, %1\n", 'P', 'S')
    set $P132, $P133
.annotate 'line', 1271
    push $P1, $P132
.annotate 'line', 1536
    new $P135, [ 'PredefFunction' ]
    $P135.'PredefFunction'('load_language', "load_language %1\ncompreg %0, %2\n", 'P', 'S', 'S')
    set $P134, $P135
.annotate 'line', 1271
    push $P1, $P134
.annotate 'line', 1543
    new $P137, [ 'PredefFunction' ]
    $P137.'PredefFunction'('loadlib', 'loadlib %0, %1', 'P', 'S')
    set $P136, $P137
.annotate 'line', 1271
    push $P1, $P136
.annotate 'line', 1547
    new $P139, [ 'PredefFunction' ]
    $P139.'PredefFunction'('load_bytecode', 'load_bytecode %1', 'v', 'S')
    set $P138, $P139
.annotate 'line', 1271
    push $P1, $P138
.annotate 'line', 1551
    new $P141, [ 'PredefFunction' ]
    $P141.'PredefFunction'('dlfunc', 'dlfunc %0, %1, %2, %3', 'P', 'P', 'S', 'S')
    set $P140, $P141
.annotate 'line', 1271
    push $P1, $P140
.annotate 'line', 1555
    new $P143, [ 'PredefFunction' ]
    $P143.'PredefFunction'('sprintf', 'sprintf %0, %1, %2', 'S', 'S', 'P')
    set $P142, $P143
.annotate 'line', 1271
    push $P1, $P142
.annotate 'line', 1559
    new $P145, [ 'PredefFunction' ]
    $P145.'PredefFunction'('sprintf', 'sprintf %0, %1, %2', 'P', 'P', 'P')
    set $P144, $P145
.annotate 'line', 1271
    push $P1, $P144
.annotate 'line', 1563
    new $P147, [ 'PredefFunction' ]
.annotate 'line', 1564
    $P147.'PredefFunction'('print', $P11, 'v', '*')
    set $P146, $P147
.annotate 'line', 1271
    push $P1, $P146
.annotate 'line', 1567
    new $P149, [ 'PredefFunction' ]
.annotate 'line', 1568
    $P149.'PredefFunction'('say', $P12, 'v', '*')
    set $P148, $P149
.annotate 'line', 1271
    push $P1, $P148
.annotate 'line', 1571
    new $P151, [ 'PredefFunction' ]
.annotate 'line', 1572
    $P151.'PredefFunction'('cry', $P13, 'v', '*')
    set $P150, $P151
.annotate 'line', 1271
    push $P1, $P150
.annotate 'line', 1575
    new $P153, [ 'PredefFunction' ]
.annotate 'line', 1576
    $P153.'PredefFunction'('invoke', $P14, 'P', '!')
    set $P152, $P153
.annotate 'line', 1271
    push $P1, $P152
  __label_1: # Infinite loop
.annotate 'line', 1581
    .yield($P1)
    goto __label_1
  __label_0: # Infinite loop end
# }
.annotate 'line', 1582

.end # getpredefs


.sub 'findpredef'
        .param string __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 1586
    $P2 = 'getpredefs'()
    iter $P3, $P2
    set $P3, 0
  __label_0: # for iteration
    unless $P3 goto __label_1
    shift $P1, $P3
.annotate 'line', 1587
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_2
# {
.annotate 'line', 1588
# pargs: $I1
    getattribute $P5, $P1, 'nparams'
    set $I1, $P5
.annotate 'line', 1589
    iseq $I2, $I1, __ARG_2
    if $I2 goto __label_5
.annotate 'line', 1590
    iseq $I2, $I1, -1
  __label_5:
    if $I2 goto __label_4
.annotate 'line', 1591
    iseq $I2, $I1, -2
    unless $I2 goto __label_6
    iseq $I2, __ARG_2, 1
  __label_6:
  __label_4:
    unless $I2 goto __label_3
.annotate 'line', 1592
    .return($P1)
  __label_3: # endif
# }
  __label_2: # endif
    goto __label_0
  __label_1: # endfor
    null $P2
.annotate 'line', 1594
    .return($P2)
# }
.annotate 'line', 1595

.end # findpredef


.sub 'optimize_array'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1603
    if_null __ARG_1, __label_0
# {
.annotate 'line', 1604
# n: $I1
# predefined elements
    elements $I1, __ARG_1
# for loop
.annotate 'line', 1605
# i: $I2
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 1606
    $P2 = __ARG_1[$I2]
    $P1 = $P2.'optimize'()
    __ARG_1[$I2] = $P1
  __label_1: # for iteration
.annotate 'line', 1605
    inc $I2
    goto __label_3
  __label_2: # for end
# }
  __label_0: # endif
# }
.annotate 'line', 1608

.end # optimize_array


.sub 'parseDotted'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1612
# var list: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1613
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 1614
    $P3 = $P2.'isidentifier'()
    if_null $P3, __label_0
    unless $P3 goto __label_0
# {
.annotate 'line', 1615
# predefined push
    push $P1, $P2
  __label_2: # while
.annotate 'line', 1616
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 1617
    $P2 = __ARG_1.'get'()
.annotate 'line', 1618
# predefined push
    push $P1, $P2
# }
    goto __label_2
  __label_1: # endwhile
# }
  __label_0: # endif
.annotate 'line', 1621
    __ARG_1.'unget'($P2)
.annotate 'line', 1622
    .return($P1)
# }
.annotate 'line', 1623

.end # parseDotted


.sub 'parseList'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1631
# var list: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1632
# var t: $P2
    null $P2
  __label_0: # do
.annotate 'line', 1633
# {
.annotate 'line', 1634
# var value: $P3
    $P3 = __ARG_3(__ARG_1, __ARG_2)
.annotate 'line', 1635
# predefined push
    push $P1, $P3
# }
  __label_2: # continue
.annotate 'line', 1636
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'(',')
    if_null $P4, __label_1
    if $P4 goto __label_0
  __label_1: # enddo
.annotate 'line', 1637
    __ARG_1.'unget'($P2)
.annotate 'line', 1638
    .return($P1)
# }
.annotate 'line', 1639

.end # parseList


.sub 'toIdentifierList'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1643
    new $P1, ['ResizableStringArray']
.annotate 'line', 1644
    iter $P3, __ARG_1
    set $P3, 0
  __label_0: # for iteration
    unless $P3 goto __label_1
    shift $P2, $P3
.annotate 'line', 1645
    $P4 = $P2.'getidentifier'()
# predefined push
    push $P1, $P4
    goto __label_0
  __label_1: # endfor
.annotate 'line', 1646
    .return($P1)
# }
.annotate 'line', 1647

.end # toIdentifierList

.namespace [ 'CommonBase' ]

.sub 'initbase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1660
    setattribute self, 'start', __ARG_1
.annotate 'line', 1661
    setattribute self, 'owner', __ARG_2
# }
.annotate 'line', 1662

.end # initbase


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1665
    getattribute $P1, self, 'start'
    __ARG_1.'annotate'($P1)
# }
.annotate 'line', 1666

.end # annotate


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1669
    getattribute $P1, self, 'owner'
    $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 1670

.end # use_predef


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 1673
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 1674

.end # generatesubid


.sub 'addlocalfunction' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1677
    getattribute $P1, self, 'owner'
    .tailcall $P1.'addlocalfunction'(__ARG_1)
# }
.annotate 'line', 1678

.end # addlocalfunction


.sub 'findsymbol' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1681
    getattribute $P1, self, 'owner'
    .tailcall $P1.'findsymbol'(__ARG_1)
# }
.annotate 'line', 1682

.end # findsymbol


.sub 'findclasskey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1685
    getattribute $P1, self, 'owner'
    .tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 1686

.end # findclasskey


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 1689
    getattribute $P1, self, 'owner'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 1690

.end # dowarnings

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CommonBase' ]
.annotate 'line', 1655
    addattribute $P0, 'start'
.annotate 'line', 1656
    addattribute $P0, 'owner'
.end
.namespace [ 'SimpleArgList' ]

.sub 'SimpleArgList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 1705
.const 'Sub' $P2 = 'parseExpr'
.annotate 'line', 1706
# var args: $P1
    $P1 = 'parseList'(__ARG_1, __ARG_2, $P2)
.annotate 'line', 1707
    'ExpectOp'(__ARG_3, __ARG_1)
.annotate 'line', 1708
    setattribute self, 'args', $P1
# }
.annotate 'line', 1709

.end # SimpleArgList


.sub 'numargs' :method
# Body
# {
.annotate 'line', 1713
    getattribute $P1, self, 'args'
# predefined elements
    elements $I1, $P1
    .return($I1)
# }
.annotate 'line', 1714

.end # numargs


.sub 'getarg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 1717
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 1718
    $P2 = $P1[__ARG_1]
    .return($P2)
# }
.annotate 'line', 1719

.end # getarg


.sub 'optimizeargs' :method
# Body
# {
.annotate 'line', 1723
    getattribute $P1, self, 'args'
    'optimize_array'($P1)
# }
.annotate 'line', 1724

.end # optimizeargs


.sub 'getargvalues' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1727
# var argreg: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1728
    getattribute $P3, self, 'args'
    iter $P4, $P3
    set $P4, 0
  __label_0: # for iteration
    unless $P4 goto __label_1
    shift $P2, $P4
.annotate 'line', 1729
    $P5 = $P2.'emit_get'(__ARG_1)
# predefined push
    push $P1, $P5
    goto __label_0
  __label_1: # endfor
.annotate 'line', 1730
    .return($P1)
# }
.annotate 'line', 1731

.end # getargvalues


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1734
    $P1 = self.'getargvalues'(__ARG_1)
# predefined join
    join $S1, ', ', $P1
    __ARG_1.'print'($S1)
# }
.annotate 'line', 1735

.end # emitargs

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'SimpleArgList' ]
.annotate 'line', 1701
    addattribute $P0, 'args'
.end
.namespace [ 'Modifier' ]

.sub 'getname' :method
# Body
# {
.annotate 'line', 1747
    getattribute $P1, self, 'name'
    .return($P1)
# }

.end # getname


.sub 'numargs' :method
# Body
# {
.annotate 'line', 1750
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 1751
# nargs: $I1
    unless_null $P1, __label_1
    null $I1
    goto __label_0
  __label_1:
    $I1 = $P1.'numargs'()
  __label_0:
.annotate 'line', 1752
    .return($I1)
# }
.annotate 'line', 1753

.end # numargs


.sub 'getarg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 1756
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 1757
    $P2 = $P1.'numargs'()
    set $I1, $P2
    lt __ARG_1, $I1, __label_0
.annotate 'line', 1758
    'InternalError'('Wrong modifier arg number')
  __label_0: # endif
.annotate 'line', 1759
    .tailcall $P1.'getarg'(__ARG_1)
# }
.annotate 'line', 1760

.end # getarg


.sub 'Modifier' :method
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1763
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 1764
    if_null __ARG_2, __label_0
.annotate 'line', 1765
    setattribute self, 'args', __ARG_2
  __label_0: # endif
# }
.annotate 'line', 1766

.end # Modifier


.sub 'optimize' :method
# Body
# {
.annotate 'line', 1769
    getattribute $P1, self, 'args'
    $P1.'optimizeargs'()
# }
.annotate 'line', 1770

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Modifier' ]
.annotate 'line', 1744
    addattribute $P0, 'name'
.annotate 'line', 1745
    addattribute $P0, 'args'
.end
.namespace [ ]

.sub 'parseModifier'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1775
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 1776
# name: $S1
    $P3 = $P1.'getidentifier'()
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
  __label_0:
.annotate 'line', 1777
    $P1 = __ARG_1.'get'()
.annotate 'line', 1778
# var args: $P2
    null $P2
.annotate 'line', 1779
    $P3 = $P1.'isop'('(')
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 1780
    new $P4, [ 'SimpleArgList' ]
    $P4.'SimpleArgList'(__ARG_1, __ARG_2, ')')
    set $P2, $P4
    goto __label_2
  __label_1: # else
.annotate 'line', 1782
    __ARG_1.'unget'($P1)
  __label_2: # endif
.annotate 'line', 1783
    new $P4, [ 'Modifier' ]
    $P4.'Modifier'($S1, $P2)
    set $P3, $P4
    .return($P3)
# }
.annotate 'line', 1784

.end # parseModifier

.namespace [ 'ModifierList' ]

.sub 'ModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1793
.const 'Sub' $P2 = 'parseModifier'
.annotate 'line', 1794
# var list: $P1
    $P1 = 'parseList'(__ARG_1, __ARG_2, $P2)
.annotate 'line', 1795
    'ExpectOp'(']', __ARG_1)
.annotate 'line', 1796
    setattribute self, 'list', $P1
# }
.annotate 'line', 1797

.end # ModifierList


.sub 'optimize' :method
# Body
# {
.annotate 'line', 1800
    getattribute $P2, self, 'list'
    iter $P3, $P2
    set $P3, 0
  __label_0: # for iteration
    unless $P3 goto __label_1
    shift $P1, $P3
.annotate 'line', 1801
    $P1.'optimize'()
    goto __label_0
  __label_1: # endfor
# }
.annotate 'line', 1802

.end # optimize


.sub 'getlist' :method
# Body
# {
.annotate 'line', 1803
    getattribute $P1, self, 'list'
    .return($P1)
# }

.end # getlist


.sub 'pick' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1806
    getattribute $P2, self, 'list'
    iter $P3, $P2
    set $P3, 0
  __label_0: # for iteration
    unless $P3 goto __label_1
    shift $P1, $P3
# {
.annotate 'line', 1807
    $P4 = $P1.'getname'()
    set $S1, $P4
    ne $S1, __ARG_1, __label_2
.annotate 'line', 1808
    .return($P1)
  __label_2: # endif
# }
    goto __label_0
  __label_1: # endfor
    null $P2
.annotate 'line', 1810
    .return($P2)
# }
.annotate 'line', 1811

.end # pick

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ModifierList' ]
.annotate 'line', 1789
    addattribute $P0, 'list'
.end
.namespace [ ]

.sub 'getparrotkey'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1820
# s: $S1
# predefined join
    join $S1, "'; '", __ARG_1
.annotate 'line', 1821
    concat $S2, "[ '", $S1
    concat $S2, $S2, "' ]"
    .return($S2)
# }
.annotate 'line', 1822

.end # getparrotkey


.sub 'getparrotnamespacekey'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1826
# predefined elements
    elements $I1, __ARG_1
    ne $I1, 0, __label_0
.annotate 'line', 1827
    .return(".namespace [ ]")
    goto __label_1
  __label_0: # else
# {
.annotate 'line', 1829
# s: $S1
# predefined join
    join $S1, "'; '", __ARG_1
.annotate 'line', 1830
    concat $S2, ".namespace [ '", $S1
    concat $S2, $S2, "' ]"
    .return($S2)
# }
  __label_1: # endif
# }
.annotate 'line', 1832

.end # getparrotnamespacekey


.sub 'parseUsing'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1836
# var taux: $P1
    $P1 = __ARG_2.'get'()
# switch-case
.annotate 'line', 1838
    $I1 = $P1.'iskeyword'('extern')
    if $I1 goto __label_2
.annotate 'line', 1840
    $I1 = $P1.'iskeyword'('static')
    if $I1 goto __label_3
    goto __label_1
  __label_2: # case
.annotate 'line', 1839
    new $P3, [ 'ExternStatement' ]
    $P3.'ExternStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P2, $P3
    .return($P2)
  __label_3: # case
.annotate 'line', 1841
    new $P5, [ 'StaticStatement' ]
    $P5.'StaticStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P4, $P5
    .return($P4)
  __label_1: # default
.annotate 'line', 1843
    __ARG_2.'unget'($P1)
.annotate 'line', 1844
    new $P7, [ 'UsingStatement' ]
    $P7.'UsingStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P6, $P7
    .return($P6)
  __label_0: # switch end
# }
.annotate 'line', 1846

.end # parseUsing


.sub 'parseSig'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1850
# var params: $P1
    new $P1, [ 'SigParameterList' ]
    $P1.'SigParameterList'(__ARG_2, __ARG_3)
.annotate 'line', 1851
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 1852
    $P4 = $P2.'isop'('=')
    isfalse $I1, $P4
    unless $I1 goto __label_0
.annotate 'line', 1853
    'SyntaxError'("Expected '='", $P2)
  __label_0: # endif
.annotate 'line', 1854
# var expr: $P3
    $P3 = 'parseExpr'(__ARG_2, __ARG_3)
.annotate 'line', 1855
    new $P5, [ 'MultiAssignStatement' ]
    $P5.'MultiAssignStatement'($P1, $P3)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 1856

.end # parseSig


.sub 'parseStatement'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1860
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 1861
    $P4 = $P1.'isop'(';')
    if_null $P4, __label_0
    unless $P4 goto __label_0
.annotate 'line', 1862
    new $P5, [ 'EmptyStatement' ]
    .return($P5)
  __label_0: # endif
.annotate 'line', 1863
    $P4 = $P1.'isop'('{')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 1864
    new $P6, [ 'CompoundStatement' ]
    $P6.'CompoundStatement'($P1, __ARG_1, __ARG_2)
    set $P5, $P6
    .return($P5)
  __label_1: # endif
.annotate 'line', 1865
    $P4 = $P1.'isop'('${')
    if_null $P4, __label_2
    unless $P4 goto __label_2
.annotate 'line', 1866
    new $P6, [ 'PiropStatement' ]
    $P6.'PiropStatement'($P1, __ARG_1, __ARG_2)
    set $P5, $P6
    .return($P5)
  __label_2: # endif
.annotate 'line', 1867
    $P4 = $P1.'isop'(':')
    if_null $P4, __label_3
    unless $P4 goto __label_3
# {
.annotate 'line', 1868
# var open: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 1869
    $P4 = $P2.'isop'('(')
    isfalse $I1, $P4
    unless $I1 goto __label_4
.annotate 'line', 1870
    'SyntaxError'("Unexpected ':'", $P1)
  __label_4: # endif
.annotate 'line', 1871
    .tailcall 'parseSig'($P1, __ARG_1, __ARG_2)
# }
  __label_3: # endif
# switch
.annotate 'line', 1874
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
.annotate 'line', 1876
    .tailcall 'parseUsing'($P1, __ARG_1, __ARG_2)
  __label_8: # case
.annotate 'line', 1878
    .tailcall 'parseConst'($P1, __ARG_1, __ARG_2)
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 1881
    .tailcall 'parseVolatile'($P1, __ARG_1, __ARG_2)
    goto __label_5 # break
  __label_10: # case
.annotate 'line', 1884
    .tailcall 'parseVar'($P1, __ARG_1, __ARG_2)
  __label_11: # case
.annotate 'line', 1886
    .tailcall 'parseString'($P1, __ARG_1, __ARG_2)
  __label_12: # case
.annotate 'line', 1888
    .tailcall 'parseInt'($P1, __ARG_1, __ARG_2)
  __label_13: # case
.annotate 'line', 1890
    .tailcall 'parseFloat'($P1, __ARG_1, __ARG_2)
  __label_14: # case
.annotate 'line', 1892
    new $P6, [ 'ReturnStatement' ]
    $P6.'ReturnStatement'($P1, __ARG_1, __ARG_2)
    set $P5, $P6
    .return($P5)
  __label_15: # case
.annotate 'line', 1894
    new $P8, [ 'YieldStatement' ]
    $P8.'YieldStatement'($P1, __ARG_1, __ARG_2)
    set $P7, $P8
    .return($P7)
  __label_16: # case
.annotate 'line', 1896
    new $P10, [ 'GotoStatement' ]
    $P10.'GotoStatement'($P1, __ARG_1, __ARG_2)
    set $P9, $P10
    .return($P9)
  __label_17: # case
.annotate 'line', 1898
    new $P12, [ 'IfStatement' ]
    $P12.'IfStatement'($P1, __ARG_1, __ARG_2)
    set $P11, $P12
    .return($P11)
  __label_18: # case
.annotate 'line', 1900
    new $P14, [ 'WhileStatement' ]
    $P14.'WhileStatement'($P1, __ARG_1, __ARG_2)
    set $P13, $P14
    .return($P13)
  __label_19: # case
.annotate 'line', 1902
    new $P16, [ 'DoStatement' ]
    $P16.'DoStatement'($P1, __ARG_1, __ARG_2)
    set $P15, $P16
    .return($P15)
  __label_20: # case
.annotate 'line', 1904
    new $P18, [ 'ContinueStatement' ]
    $P18.'ContinueStatement'($P1, __ARG_1, __ARG_2)
    set $P17, $P18
    .return($P17)
  __label_21: # case
.annotate 'line', 1906
    new $P20, [ 'BreakStatement' ]
    $P20.'BreakStatement'($P1, __ARG_1, __ARG_2)
    set $P19, $P20
    .return($P19)
  __label_22: # case
.annotate 'line', 1908
    .tailcall 'parseSwitch'($P1, __ARG_1, __ARG_2)
  __label_23: # case
.annotate 'line', 1910
    .tailcall 'parseFor'($P1, __ARG_1, __ARG_2)
  __label_24: # case
.annotate 'line', 1912
    new $P22, [ 'ThrowStatement' ]
    $P22.'ThrowStatement'($P1, __ARG_1, __ARG_2)
    set $P21, $P22
    .return($P21)
  __label_25: # case
.annotate 'line', 1914
    new $P24, [ 'TryStatement' ]
    $P24.'TryStatement'($P1, __ARG_1, __ARG_2)
    set $P23, $P24
    .return($P23)
  __label_6: # default
.annotate 'line', 1916
    $P25 = $P1.'isidentifier'()
    if_null $P25, __label_26
    unless $P25 goto __label_26
# {
.annotate 'line', 1917
# var t2: $P3
    $P3 = __ARG_1.'get'()
.annotate 'line', 1918
    $P4 = $P3.'isop'(':')
    if_null $P4, __label_27
    unless $P4 goto __label_27
.annotate 'line', 1919
    new $P6, [ 'LabelStatement' ]
    $P6.'LabelStatement'($P1, __ARG_2)
    set $P5, $P6
    .return($P5)
  __label_27: # endif
.annotate 'line', 1920
    __ARG_1.'unget'($P3)
# }
  __label_26: # endif
.annotate 'line', 1922
    __ARG_1.'unget'($P1)
.annotate 'line', 1923
    new $P5, [ 'ExprStatement' ]
    $P5.'ExprStatement'($P1, __ARG_1, __ARG_2)
    set $P4, $P5
    .return($P4)
  __label_5: # switch end
.annotate 'line', 1925
    'InternalError'('parseStatement failure', $P1)
# }
.annotate 'line', 1926

.end # parseStatement

.namespace [ 'Statement' ]

.sub 'Statement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1936
    self.'initbase'(__ARG_1, __ARG_2)
# }
.annotate 'line', 1937

.end # Statement


.sub 'isempty' :method
# Body
# {
.annotate 'line', 1938
    .return(0)
# }

.end # isempty


.sub 'createreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1941
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createreg'(__ARG_1)
# }
.annotate 'line', 1942

.end # createreg


.sub 'tempreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1945
    getattribute $P1, self, 'owner'
    .tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 1946

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 1949
    getattribute $P1, self, 'owner'
    $P1.'freetemps'()
# }
.annotate 'line', 1950

.end # freetemps


.sub 'genlabel' :method
# Body
# {
.annotate 'line', 1953
    getattribute $P1, self, 'owner'
    .tailcall $P1.'genlabel'()
# }
.annotate 'line', 1954

.end # genlabel


.sub 'getlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1957
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getlabel'(__ARG_1)
# }
.annotate 'line', 1958

.end # getlabel


.sub 'createlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1961
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createlabel'(__ARG_1)
# }
.annotate 'line', 1962

.end # createlabel


.sub 'createconst' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param int __ARG_5 :optional
# Body
# {
.annotate 'line', 1966
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createconst'(__ARG_1, __ARG_2, __ARG_3, __ARG_4, __ARG_5)
# }
.annotate 'line', 1967

.end # createconst


.sub 'createvar' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 1970
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvar'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 1971

.end # createvar


.sub 'getvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1974
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getvar'(__ARG_1)
# }
.annotate 'line', 1975

.end # getvar


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1978
    getattribute $P1, self, 'owner'
    .tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 1979

.end # checkclass


.sub 'getouter' :method
# Body
# {
.annotate 'line', 1986
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getouter'()
# }
.annotate 'line', 1987

.end # getouter


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1990
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getcontinuelabel'(__ARG_1)
# }
.annotate 'line', 1991

.end # getcontinuelabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1994
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getbreaklabel'(__ARG_1)
# }
.annotate 'line', 1995

.end # getbreaklabel


.sub 'optimize' :method
# Body
# {
.annotate 'line', 1998
    getattribute $P1, self, 'start'
    'InternalError'('**checking**', $P1)
.annotate 'line', 2000
    .return(self)
# }
.annotate 'line', 2001

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Statement' ]
.annotate 'line', 1932
    get_class $P1, [ 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'EmptyStatement' ]

.sub 'isempty' :method
# Body
# {
.annotate 'line', 2006
    .return(1)
# }

.end # isempty


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2009
    'InternalError'('Attempt to annotate empty statement')
# }
.annotate 'line', 2010

.end # annotate


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2011
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'EmptyStatement' ]
.annotate 'line', 2004
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'MultiStatementBase' ]

.sub 'optimize' :method
# Body
# {
.annotate 'line', 2024
# var statements: $P1
    getattribute $P1, self, 'statements'
.annotate 'line', 2025
# n: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 2026
# empty: $I2
    set $I2, 1
# for loop
.annotate 'line', 2027
# i: $I3
    null $I3
  __label_2: # for condition
    ge $I3, $I1, __label_1
# {
.annotate 'line', 2028
# var st: $P2
    $P3 = $P1[$I3]
    $P2 = $P3.'optimize'()
.annotate 'line', 2029
    set $I4, $I2
    unless $I4 goto __label_4
    $P3 = $P2.'isempty'()
    isfalse $I4, $P3
  __label_4:
    unless $I4 goto __label_3
.annotate 'line', 2030
    null $I2
  __label_3: # endif
.annotate 'line', 2031
    $P1[$I3] = $P2
# }
  __label_0: # for iteration
.annotate 'line', 2027
    inc $I3
    goto __label_2
  __label_1: # for end
.annotate 'line', 2033
    unless $I2 goto __label_5
.annotate 'line', 2034
    new $P3, [ 'EmptyStatement' ]
    .return($P3)
    goto __label_6
  __label_5: # else
.annotate 'line', 2036
    .return(self)
  __label_6: # endif
# }
.annotate 'line', 2037

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MultiStatementBase' ]
.annotate 'line', 2020
    addattribute $P0, 'statements'
.end
.namespace [ 'MultiStatement' ]

.sub 'MultiStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2044
# var statements: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
    push $P1, __ARG_1
    push $P1, __ARG_2
.annotate 'line', 2045
    setattribute self, 'statements', $P1
# }
.annotate 'line', 2046

.end # MultiStatement


.sub 'isempty' :method
# Body
# {
.annotate 'line', 2047
    .return(0)
# }

.end # isempty


.sub 'push' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2050
    getattribute $P1, self, 'statements'
# predefined push
    push $P1, __ARG_1
.annotate 'line', 2051
    .return(self)
# }
.annotate 'line', 2052

.end # push


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2055
    getattribute $P2, self, 'statements'
    iter $P3, $P2
    set $P3, 0
  __label_0: # for iteration
    unless $P3 goto __label_1
    shift $P1, $P3
.annotate 'line', 2056
    $P1.'emit'(__ARG_1)
    goto __label_0
  __label_1: # endfor
# }
.annotate 'line', 2057

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MultiStatement' ]
.annotate 'line', 2040
    get_class $P1, [ 'MultiStatementBase' ]
    addparent $P0, $P1
.end
.namespace [ ]

.sub 'addtomulti'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2062
    unless_null __ARG_1, __label_0
.annotate 'line', 2063
    .return(__ARG_2)
    goto __label_1
  __label_0: # else
.annotate 'line', 2064
    isa $I1, __ARG_1, [ 'MultiStatement' ]
    unless $I1 goto __label_2
.annotate 'line', 2065
    .tailcall __ARG_1.'push'(__ARG_2)
    goto __label_3
  __label_2: # else
.annotate 'line', 2067
    new $P2, [ 'MultiStatement' ]
    $P2.'MultiStatement'(__ARG_1, __ARG_2)
    set $P1, $P2
    .return($P1)
  __label_3: # endif
  __label_1: # endif
# }
.annotate 'line', 2068

.end # addtomulti


.sub 'parsePiropArg'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2076
# var arg: $P1
    null $P1
.annotate 'line', 2077
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 2078
    $P3 = $P2.'isop'(':')
    if_null $P3, __label_0
    unless $P3 goto __label_0
# {
.annotate 'line', 2079
    $P2 = __ARG_1.'get'()
.annotate 'line', 2080
# label: $S1
    $P3 = $P2.'getidentifier'()
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
.annotate 'line', 2081
    new $P3, [ 'Reflabel' ]
    $P3.'Reflabel'(__ARG_2, $S1)
    set $P1, $P3
# }
    goto __label_1
  __label_0: # else
# {
.annotate 'line', 2084
    __ARG_1.'unget'($P2)
.annotate 'line', 2085
    $P1 = 'parseExpr'(__ARG_1, __ARG_2)
# }
  __label_1: # endif
.annotate 'line', 2087
    .return($P1)
# }
.annotate 'line', 2088

.end # parsePiropArg

.namespace [ 'PiropStatement' ]

.sub 'PiropStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2097
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2098
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 2099
# dotted: $I1
    null $I1
.annotate 'line', 2100
    $P3 = $P1.'isop'('.')
    if_null $P3, __label_0
    unless $P3 goto __label_0
# {
.annotate 'line', 2101
    set $I1, 1
.annotate 'line', 2102
    $P1 = __ARG_2.'get'()
# }
  __label_0: # endif
.annotate 'line', 2104
# opname: $S1
    $P3 = $P1.'getidentifier'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 2105
    unless $I1 goto __label_3
    set $S2, '.'
    goto __label_2
  __label_3:
    set $S2, ''
  __label_2:
    concat $S3, $S2, $S1
    box $P3, $S3
    setattribute self, 'opname', $P3
.annotate 'line', 2106
    $P1 = __ARG_2.'get'()
.annotate 'line', 2107
    $P3 = $P1.'isop'('}')
    isfalse $I2, $P3
    unless $I2 goto __label_4
# {
.annotate 'line', 2108
    __ARG_2.'unget'($P1)
.annotate 'line', 2109
.const 'Sub' $P4 = 'parsePiropArg'
.annotate 'line', 2110
# var args: $P2
    $P2 = 'parseList'(__ARG_2, __ARG_3, $P4)
.annotate 'line', 2111
    'ExpectOp'('}', __ARG_2)
.annotate 'line', 2112
    setattribute self, 'args', $P2
# }
  __label_4: # endif
.annotate 'line', 2114
    'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 2115

.end # PiropStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2118
    getattribute $P1, self, 'args'
    'optimize_array'($P1)
.annotate 'line', 2119
    .return(self)
# }
.annotate 'line', 2120

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2123
# opname: $S1
    getattribute $P4, self, 'opname'
    null $S1
    if_null $P4, __label_0
    set $S1, $P4
  __label_0:
.annotate 'line', 2124
    self.'annotate'(__ARG_1)
.annotate 'line', 2125
    concat $S2, 'pirop ', $S1
    __ARG_1.'comment'($S2)
.annotate 'line', 2126
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 2127
    __ARG_1.'print'('    ')
.annotate 'line', 2128
    unless_null $P1, __label_1
.annotate 'line', 2129
    __ARG_1.'say'($S1)
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2131
# var argreg: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 2132
    iter $P5, $P1
    set $P5, 0
  __label_3: # for iteration
    unless $P5 goto __label_4
    shift $P3, $P5
.annotate 'line', 2133
    $P4 = $P3.'emit_get'(__ARG_1)
# predefined push
    push $P2, $P4
    goto __label_3
  __label_4: # endfor
.annotate 'line', 2134
# predefined join
    join $S2, ', ', $P2
    __ARG_1.'say'($S1, ' ', $S2)
# }
  __label_2: # endif
# }
.annotate 'line', 2136

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'PiropStatement' ]
.annotate 'line', 2090
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2092
    addattribute $P0, 'opname'
.annotate 'line', 2093
    addattribute $P0, 'args'
.end
.namespace [ 'ExternStatement' ]

.sub 'ExternStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2148
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2149
# var path: $P1
    $P1 = 'parseDotted'(__ARG_2)
.annotate 'line', 2150
# predefined elements
    elements $I1, $P1
    ne $I1, 0, __label_0
.annotate 'line', 2151
    $P2 = __ARG_2.'get'()
    'ExpectedIdentifier'($P2)
  __label_0: # endif
.annotate 'line', 2152
    'ExpectOp'(';', __ARG_2)
.annotate 'line', 2153
    $P3 = 'toIdentifierList'($P1)
    setattribute self, 'path', $P3
.annotate 'line', 2154
    .return(self)
# }
.annotate 'line', 2155

.end # ExternStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2156
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2159
    self.'annotate'(__ARG_1)
.annotate 'line', 2160
    getattribute $P1, self, 'path'
# predefined join
    join $S1, '/', $P1
    __ARG_1.'say'('    ', "load_bytecode '", $S1, ".pbc'")
# }
.annotate 'line', 2161

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ExternStatement' ]
.annotate 'line', 2143
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2145
    addattribute $P0, 'path'
.end
.namespace [ 'StaticStatement' ]

.sub 'StaticStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2173
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2174
# var names: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 2175
# var t: $P2
    null $P2
  __label_0: # do
.annotate 'line', 2176
# {
.annotate 'line', 2177
    $P2 = __ARG_2.'get'()
.annotate 'line', 2178
# name: $S1
    $P3 = $P2.'getidentifier'()
    null $S1
    if_null $P3, __label_3
    set $S1, $P3
  __label_3:
.annotate 'line', 2179
# predefined push
    push $P1, $S1
# }
  __label_2: # continue
.annotate 'line', 2180
    $P2 = __ARG_2.'get'()
    $P3 = $P2.'isop'(',')
    if_null $P3, __label_1
    if $P3 goto __label_0
  __label_1: # enddo
.annotate 'line', 2181
    'RequireOp'(';', $P2)
.annotate 'line', 2182
    setattribute self, 'names', $P1
# }
.annotate 'line', 2183

.end # StaticStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2184
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2187
    self.'annotate'(__ARG_1)
.annotate 'line', 2188
    getattribute $P2, self, 'names'
    iter $P3, $P2
    set $P3, 0
  __label_0: # for iteration
    unless $P3 goto __label_1
    shift $S1, $P3
# {
.annotate 'line', 2189
# var v: $P1
    $P1 = self.'createvar'($S1, 'P')
.annotate 'line', 2190
    $P2 = $P1.'getreg'()
    __ARG_1.'say'(".const 'Sub' ", $P2, " = '", $S1, "'")
# }
    goto __label_0
  __label_1: # endfor
# }
.annotate 'line', 2192

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'StaticStatement' ]
.annotate 'line', 2168
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2170
    addattribute $P0, 'names'
.end
.namespace [ 'UsingStatement' ]

.sub 'UsingStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2206
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2207
# var path: $P1
    $P1 = 'parseDotted'(__ARG_2)
.annotate 'line', 2208
# predefined elements
    elements $I1, $P1
    ne $I1, 0, __label_0
.annotate 'line', 2209
    $P2 = __ARG_2.'get'()
    'ExpectedIdentifier'($P2)
  __label_0: # endif
.annotate 'line', 2210
    'ExpectOp'(';', __ARG_2)
.annotate 'line', 2211
    $P3 = 'toIdentifierList'($P1)
    setattribute self, 'path', $P3
# }
.annotate 'line', 2212

.end # UsingStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2215
# var path: $P1
    getattribute $P1, self, 'path'
.annotate 'line', 2216
# name: $S1
    $S1 = $P1[-1]
.annotate 'line', 2217
# var vdata: $P2
    $P2 = self.'createvar'($S1, 'P')
.annotate 'line', 2219
# var symbol: $P3
    $P3 = self.'findsymbol'($P1)
# switch-case
.annotate 'line', 2221
    isnull $I1, $P3
    if $I1 goto __label_2
.annotate 'line', 2223
    isa $I1, $P3, [ 'FunctionStatement' ]
    if $I1 goto __label_3
    goto __label_1
  __label_2: # case
    goto __label_0 # break
  __label_3: # case
.annotate 'line', 2224
# subid: $S2
    $P4 = $P3.'makesubid'()
    null $S2
    if_null $P4, __label_4
    set $S2, $P4
  __label_4:
.annotate 'line', 2225
    box $P5, $S2
    setattribute self, 'subid', $P5
    goto __label_0 # break
  __label_1: # default
  __label_0: # switch end
.annotate 'line', 2228
    .return(self)
# }
.annotate 'line', 2229

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2232
# var path: $P1
    getattribute $P1, self, 'path'
.annotate 'line', 2233
# name: $S1
    $S1 = $P1[-1]
.annotate 'line', 2234
# var vdata: $P2
    $P2 = self.'getvar'($S1)
.annotate 'line', 2235
    getattribute $P3, self, 'subid'
    if_null $P3, __label_0
# {
.annotate 'line', 2236
# subid: $S2
    getattribute $P4, self, 'subid'
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 2237
    $P3 = $P2.'getreg'()
    __ARG_1.'say'(".const 'Sub' ", $P3, ' = "', $S2, '"')
# }
    goto __label_1
  __label_0: # else
# {
.annotate 'line', 2240
    self.'annotate'(__ARG_1)
.annotate 'line', 2241
    $P3 = $P2.'getreg'()
    __ARG_1.'print'('    get_hll_global ', $P3, ', ')
.annotate 'line', 2242
    $P1.'pop'()
# switch
.annotate 'line', 2243
# predefined elements
    elements $I1, $P1
    null $I2
    if $I1 == $I2 goto __label_5
    goto __label_4
  __label_5: # case
.annotate 'line', 2245
    __ARG_1.'say'("'", $S1, "'")
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 2248
    $P3 = 'getparrotkey'($P1)
    __ARG_1.'say'($P3, " , '", $S1, "'")
  __label_3: # switch end
# }
  __label_1: # endif
# }
.annotate 'line', 2251

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'UsingStatement' ]
.annotate 'line', 2199
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2201
    addattribute $P0, 'path'
.annotate 'line', 2202
    addattribute $P0, 'subid'
.end
.namespace [ 'ExprStatement' ]

.sub 'ExprStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2263
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2264
    $P2 = 'parseExpr'(__ARG_2, self)
    setattribute self, 'expr', $P2
.annotate 'line', 2265
    'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 2266

.end # ExprStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2269
    getattribute $P3, self, 'expr'
    $P2 = $P3.'optimize'()
    setattribute self, 'expr', $P2
.annotate 'line', 2270
    .return(self)
# }
.annotate 'line', 2271

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2274
    getattribute $P1, self, 'expr'
    $P1.'emit'(__ARG_1, '')
# }
.annotate 'line', 2275

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ExprStatement' ]
.annotate 'line', 2258
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2260
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
.annotate 'line', 2294
    setattribute self, 'type', __ARG_1
.annotate 'line', 2295
    setattribute self, 'reg', __ARG_2
.annotate 'line', 2296
    setattribute self, 'scope', __ARG_3
.annotate 'line', 2297
    box $P1, __ARG_4
    setattribute self, 'flags', $P1
.annotate 'line', 2298
    setattribute self, 'value', __ARG_5
# }
.annotate 'line', 2299

.end # VarData


.sub 'setid' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2302
    box $P1, __ARG_1
    setattribute self, 'id', $P1
# }
.annotate 'line', 2303

.end # setid


.sub 'setlex' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2306
    box $P1, __ARG_1
    setattribute self, 'lexname', $P1
# }
.annotate 'line', 2307

.end # setlex


.sub 'gettype' :method
# Body
# {
.annotate 'line', 2308
    getattribute $P1, self, 'type'
    .return($P1)
# }

.end # gettype


.sub 'getreg' :method
# Body
# {
.annotate 'line', 2309
    getattribute $P1, self, 'reg'
    .return($P1)
# }

.end # getreg


.sub 'getscope' :method
# Body
# {
.annotate 'line', 2310
    getattribute $P1, self, 'scope'
    .return($P1)
# }

.end # getscope


.sub 'getvalue' :method
# Body
# {
.annotate 'line', 2311
    getattribute $P1, self, 'value'
    .return($P1)
# }

.end # getvalue


.sub 'isconst' :method
# Body
# {
.annotate 'line', 2312
    getattribute $P1, self, 'value'
    isnull $I1, $P1
    not $I1
    .return($I1)
# }

.end # isconst


.sub 'getid' :method
# Body
# {
.annotate 'line', 2313
    getattribute $P1, self, 'id'
    .return($P1)
# }

.end # getid


.sub 'getlex' :method
# Body
# {
.annotate 'line', 2314
    getattribute $P1, self, 'lexname'
    .return($P1)
# }

.end # getlex


.sub 'getflags' :method
# Body
# {
.annotate 'line', 2315
    getattribute $P1, self, 'flags'
    .return($P1)
# }

.end # getflags

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'VarData' ]
.annotate 'line', 2284
    addattribute $P0, 'type'
.annotate 'line', 2285
    addattribute $P0, 'reg'
.annotate 'line', 2286
    addattribute $P0, 'scope'
.annotate 'line', 2287
    addattribute $P0, 'flags'
.annotate 'line', 2288
    addattribute $P0, 'value'
.annotate 'line', 2289
    addattribute $P0, 'id'
.annotate 'line', 2290
    addattribute $P0, 'lexname'
.end
.namespace [ 'ConstantInternalFail' ]

.sub 'ConstantInternalFail' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2323
    setattribute self, 'name', __ARG_1
# }
.annotate 'line', 2324

.end # ConstantInternalFail


.sub 'get_string' :method :vtable
# Body
# {
.annotate 'line', 2327
    'InternalError'('Attempt to use unexpanded constant!!!')
# }
.annotate 'line', 2328

.end # get_string

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ConstantInternalFail' ]
.annotate 'line', 2320
    addattribute $P0, 'name'
.end
.namespace [ 'VarContainer' ]

.sub 'init' :method :vtable
# Body
# {
.annotate 'line', 2337
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'locals', $P2
# }
.annotate 'line', 2338

.end # init


.sub 'createvar' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 2341
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2342
# sname: $S1
    set $P4, __ARG_1
    null $S1
    if_null $P4, __label_0
    set $S1, $P4
  __label_0:
.annotate 'line', 2343
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2344
    if_null $P2, __label_1
.annotate 'line', 2345
    concat $S3, "Redeclared '", $S1
    concat $S3, $S3, "'"
    'SyntaxError'($S3, __ARG_1)
  __label_1: # endif
.annotate 'line', 2346
# reg: $S2
    $P4 = self.'createreg'(__ARG_2)
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 2347
# var data: $P3
    new $P3, [ 'VarData' ]
    $P3.'VarData'(__ARG_2, $S2, self, __ARG_3)
.annotate 'line', 2348
    $P1[$S1] = $P3
.annotate 'line', 2349
    .return($P3)
# }
.annotate 'line', 2350

.end # createvar


.sub 'createvarnamed' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 2353
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2354
# sname: $S1
    set $P3, __ARG_1
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
  __label_0:
.annotate 'line', 2355
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2356
    if_null $P2, __label_1
.annotate 'line', 2357
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    'SyntaxError'($S2, __ARG_1)
  __label_1: # endif
.annotate 'line', 2358
    new $P4, [ 'VarData' ]
    $P4.'VarData'(__ARG_2, __ARG_3, self, 0)
    set $P3, $P4
    $P1[$S1] = $P3
# }
.annotate 'line', 2359

.end # createvarnamed


.sub 'createconst' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param int __ARG_5 :optional
# Body
# {
.annotate 'line', 2363
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2364
# sname: $S1
    set $P4, __ARG_1
    null $S1
    if_null $P4, __label_0
    set $S1, $P4
  __label_0:
.annotate 'line', 2365
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2366
    if_null $P2, __label_1
.annotate 'line', 2367
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    'SyntaxError'($S2, __ARG_1)
  __label_1: # endif
.annotate 'line', 2368
# var data: $P3
    new $P3, [ 'VarData' ]
    new $P5, [ 'ConstantInternalFail' ]
    $P5.'ConstantInternalFail'(__ARG_1)
    set $P4, $P5
.annotate 'line', 2369
    $P3.'VarData'(__ARG_2, $P4, self, __ARG_5, __ARG_3)
.annotate 'line', 2370
    isnull $I1, __ARG_4
    not $I1
    unless $I1 goto __label_3
    isne $I1, __ARG_4, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 2371
    $P3.'setid'(__ARG_4)
  __label_2: # endif
.annotate 'line', 2372
    $P1[$S1] = $P3
# }
.annotate 'line', 2373

.end # createconst


.sub 'getvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2376
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2377
# sname: $S1
    set $P3, __ARG_1
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
  __label_0:
.annotate 'line', 2378
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2379
    isnull $I1, $P2
    unless $I1 goto __label_2
    getattribute $P3, self, 'owner'
    isnull $I1, $P3
    not $I1
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 2380
    getattribute $P4, self, 'owner'
    $P2 = $P4.'getvar'(__ARG_1)
  __label_1: # endif
.annotate 'line', 2381
    isnull $I1, $P2
    not $I1
    unless $I1 goto __label_4
    isa $I2, $P2, [ 'VarData' ]
    not $I1, $I2
  __label_4:
    unless $I1 goto __label_3
.annotate 'line', 2382
    'InternalError'('Incorrect data for Variable', __ARG_1)
  __label_3: # endif
.annotate 'line', 2383
    .return($P2)
# }
.annotate 'line', 2384

.end # getvar


.sub 'getlocalvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2387
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2388
# sname: $S1
    set $P3, __ARG_1
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
  __label_0:
.annotate 'line', 2389
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2390
    .return($P2)
# }
.annotate 'line', 2391

.end # getlocalvar


.sub 'makelexical' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2394
# var lexowner: $P1
    $P1 = self.'getouter'()
.annotate 'line', 2395
# lexname: $S1
    $P2 = $P1.'createlex'(__ARG_1)
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
  __label_0:
.annotate 'line', 2396
    .return($S1)
# }
.annotate 'line', 2397

.end # makelexical


.sub 'makelexicalself' :method
# Body
# {
.annotate 'line', 2400
# var lexowner: $P1
    set $P1, self
# Constant lexname evaluated at compile time
.annotate 'line', 2402
    self.'setlex'('__WLEX_self', 'self')
.annotate 'line', 2403
    .return('__WLEX_self')
# }
.annotate 'line', 2404

.end # makelexicalself

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'VarContainer' ]
.annotate 'line', 2334
    addattribute $P0, 'locals'
.end
.namespace [ 'BlockStatement' ]
.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'BlockStatement' ]
.annotate 'line', 2413
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
.annotate 'line', 2425
    self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 2426

.end # Expr


.sub 'issimple' :method
# Body
# {
.annotate 'line', 2427
    .return(0)
# }

.end # issimple


.sub 'isliteral' :method
# Body
# {
.annotate 'line', 2428
    .return(0)
# }

.end # isliteral


.sub 'isintegerliteral' :method
# Body
# {
.annotate 'line', 2429
    .return(0)
# }

.end # isintegerliteral


.sub 'isfloatliteral' :method
# Body
# {
.annotate 'line', 2430
    .return(0)
# }

.end # isfloatliteral


.sub 'isstringliteral' :method
# Body
# {
.annotate 'line', 2431
    .return(0)
# }

.end # isstringliteral


.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 2432
    .return(0)
# }

.end # isidentifier


.sub 'isnull' :method
# Body
# {
.annotate 'line', 2433
    .return(0)
# }

.end # isnull


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 2434
    .return(0)
# }

.end # hascompilevalue


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 2435
    .return(0)
# }

.end # isnegable


.sub 'tempreg' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2438
    getattribute $P1, self, 'owner'
    .tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 2439

.end # tempreg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2443
    .return(self)
# }
.annotate 'line', 2444

.end # optimize


.sub 'cantailcall' :method
# Body
# {
.annotate 'line', 2445
    .return(0)
# }

.end # cantailcall


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2448
# type: $S1
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 2449
# reg: $S2
    ne $S1, 'v', __label_2
    set $S2, ''
    goto __label_1
  __label_2:
    $S2 = self.'tempreg'($S1)
  __label_1:
.annotate 'line', 2450
    self.'emit'(__ARG_1, $S2)
.annotate 'line', 2451
    .return($S2)
# }
.annotate 'line', 2452

.end # emit_get


.sub 'emit_getint' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2455
# reg: $S1
    null $S1
.annotate 'line', 2456
    $P1 = self.'checkresult'()
    set $S2, $P1
    ne $S2, 'I', __label_0
.annotate 'line', 2457
    $P2 = self.'emit_get'(__ARG_1)
    set $S1, $P2
    goto __label_1
  __label_0: # else
# {
.annotate 'line', 2459
    $P3 = self.'tempreg'('I')
    set $S1, $P3
.annotate 'line', 2460
    self.'emit'(__ARG_1, $S1)
# }
  __label_1: # endif
.annotate 'line', 2462
    .return($S1)
# }
.annotate 'line', 2463

.end # emit_getint


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2466
    getattribute $P1, self, 'start'
    'SyntaxError'('Not a left-side expression', $P1)
# }
.annotate 'line', 2467

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Expr' ]
.annotate 'line', 2421
    get_class $P1, [ 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'SimpleExpr' ]

.sub 'issimple' :method
# Body
# {
.annotate 'line', 2472
    .return(1)
# }

.end # issimple

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'SimpleExpr' ]
.annotate 'line', 2470
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
.annotate 'line', 2482
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 2483
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 2484
    $P2 = $P1.'isop'('(')
    isfalse $I1, $P2
    unless $I1 goto __label_0
.annotate 'line', 2485
    'SyntaxError'('anonymous function expected', $P1)
  __label_0: # endif
.annotate 'line', 2486
    new $P4, [ 'LocalFunctionStatement' ]
    $P4.'LocalFunctionStatement'(__ARG_3, __ARG_1, __ARG_2)
    set $P3, $P4
    setattribute self, 'fn', $P3
# }
.annotate 'line', 2487

.end # FunctionExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2488
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2491
    getattribute $P3, self, 'fn'
    $P2 = $P3.'optimize'()
    setattribute self, 'fn', $P2
.annotate 'line', 2492
    .return(self)
# }
.annotate 'line', 2493

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2496
# var fn: $P1
    getattribute $P1, self, 'fn'
.annotate 'line', 2497
# reg: $S1
    $P2 = self.'tempreg'('P')
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
  __label_0:
.annotate 'line', 2498
    self.'annotate'(__ARG_1)
.annotate 'line', 2499
    $P2 = $P1.'getsubid'()
    __ARG_1.'say'(".const 'Sub' ", $S1, " = '", $P2, "'")
.annotate 'line', 2500
    set $S2, __ARG_2
    eq $S2, '', __label_1
.annotate 'line', 2501
    __ARG_1.'emitarg2'('newclosure', __ARG_2, $S1)
  __label_1: # endif
# }
.annotate 'line', 2502

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FunctionExpr' ]
.annotate 'line', 2477
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 2479
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
.annotate 'line', 2517
    setattribute self, 'condexpr', __ARG_1
.annotate 'line', 2518
    .return(self)
# }
.annotate 'line', 2519

.end # set


.sub 'optimize_condition' :method
# Body
# {
.annotate 'line', 2522
    getattribute $P3, self, 'condexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'condexpr', $P2
# }
.annotate 'line', 2523

.end # optimize_condition


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2526
    getattribute $P3, self, 'condexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'condexpr', $P2
.annotate 'line', 2527
    .return(self)
# }
.annotate 'line', 2528

.end # optimize


.sub 'getvalue' :method
# Body
# {
.annotate 'line', 2531
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 2532
    $P2 = $P1.'isliteral'()
    if_null $P2, __label_0
    unless $P2 goto __label_0
# {
# switch
.annotate 'line', 2533
    $P3 = $P1.'checkresult'()
    set $S1, $P3
    set $S2, 'I'
    if $S1 == $S2 goto __label_3
    goto __label_2
  __label_3: # case
.annotate 'line', 2535
# n: $I1
    $P4 = $P1.'getIntegerValue'()
    set $I1, $P4
.annotate 'line', 2536
    ne $I1, 0, __label_4
.annotate 'line', 2537
    .return(2)
    goto __label_5
  __label_4: # else
.annotate 'line', 2539
    .return(1)
  __label_5: # endif
  __label_2: # default
  __label_1: # switch end
# }
  __label_0: # endif
.annotate 'line', 2542
    .return(0)
# }
.annotate 'line', 2543

.end # getvalue


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 2546
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 2548
    isa $I1, $P1, [ 'ComparatorBaseExpr' ]
    if $I1 goto __label_2
.annotate 'line', 2549
    isa $I1, $P1, [ 'NullCheckerExpr' ]
  __label_2:
    unless $I1 goto __label_0
.annotate 'line', 2550
    $P1.'emit_if'(__ARG_1, __ARG_2)
    goto __label_1
  __label_0: # else
# {
.annotate 'line', 2552
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_3
    set $S1, $P2
  __label_3:
.annotate 'line', 2553
# type: $S2
    $P2 = $P1.'checkresult'()
    null $S2
    if_null $P2, __label_4
    set $S2, $P2
  __label_4:
# switch
.annotate 'line', 2554
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
.annotate 'line', 2557
    __ARG_1.'emitif_null'($S1, __ARG_3)
  __label_9: # case
  __label_10: # case
.annotate 'line', 2560
    __ARG_1.'emitif'($S1, __ARG_2)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 2563
    'InternalError'('Invalid if condition')
  __label_5: # switch end
# }
  __label_1: # endif
# }
.annotate 'line', 2566

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 2569
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 2571
    isa $I1, $P1, [ 'ComparatorBaseExpr' ]
    if $I1 goto __label_2
.annotate 'line', 2572
    isa $I1, $P1, [ 'NullCheckerExpr' ]
  __label_2:
    unless $I1 goto __label_0
.annotate 'line', 2573
    $P1.'emit_else'(__ARG_1, __ARG_2)
    goto __label_1
  __label_0: # else
# {
.annotate 'line', 2575
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_3
    set $S1, $P2
  __label_3:
.annotate 'line', 2576
# type: $S2
    $P2 = $P1.'checkresult'()
    null $S2
    if_null $P2, __label_4
    set $S2, $P2
  __label_4:
# switch
.annotate 'line', 2577
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
.annotate 'line', 2580
    __ARG_1.'emitif_null'($S1, __ARG_2)
  __label_9: # case
  __label_10: # case
.annotate 'line', 2583
    __ARG_1.'emitunless'($S1, __ARG_2)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 2586
    'InternalError'('Invalid if condition')
  __label_5: # switch end
# }
  __label_1: # endif
# }
.annotate 'line', 2589

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Condition' ]
.annotate 'line', 2514
    addattribute $P0, 'condexpr'
.end
.namespace [ 'Literal' ]

.sub 'isliteral' :method
# Body
# {
.annotate 'line', 2596
    .return(1)
# }

.end # isliteral


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 2597
    .return(1)
# }

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Literal' ]
.annotate 'line', 2594
    get_class $P1, [ 'SimpleExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'StringLiteral' ]

.sub 'StringLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2607
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2608
    setattribute self, 'strval', __ARG_2
# }
.annotate 'line', 2609

.end # StringLiteral


.sub 'isstringliteral' :method
# Body
# {
.annotate 'line', 2610
    .return(1)
# }

.end # isstringliteral


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2611
    .return('S')
# }

.end # checkresult


.sub 'getPirString' :method
# Body
# {
.annotate 'line', 2614
# var strtok: $P1
    getattribute $P1, self, 'strval'
.annotate 'line', 2615
# str: $S1
    getattribute $P2, $P1, 'str'
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
  __label_0:
.annotate 'line', 2616
# typesinglequoted: $I1
    isa $I1, $P1, [ 'TokenSingleQuoted' ]
.annotate 'line', 2617
# need_unicode: $I2
    null $I2
.annotate 'line', 2618
    box $P2, $S1
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $I3, $P3
# {
.annotate 'line', 2619
    le $I3, 127, __label_3
# {
.annotate 'line', 2620
    set $I2, 1
    goto __label_2 # break
.annotate 'line', 2621
# }
  __label_3: # endif
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 2624
    unless $I2 goto __label_4
# {
.annotate 'line', 2625
    unless $I1 goto __label_5
# {
.annotate 'line', 2626
    null $I1
.annotate 'line', 2627
# saux: $S2
    set $S2, $S1
.annotate 'line', 2628
    set $S1, ''
.annotate 'line', 2629
    box $P2, $S2
    iter $P4, $P2
    set $P4, 0
  __label_6: # for iteration
    unless $P4 goto __label_7
    shift $S3, $P4
# {
.annotate 'line', 2630
    ne $S3, '\', __label_8
.annotate 'line', 2631
    set $S3, '\\'
  __label_8: # endif
.annotate 'line', 2632
    concat $S1, $S1, $S3
# }
    goto __label_6
  __label_7: # endfor
# }
  __label_5: # endif
.annotate 'line', 2635
# result: $S4
    set $S4, ''
.annotate 'line', 2636
    box $P2, $S1
    iter $P5, $P2
    set $P5, 0
  __label_9: # for iteration
    unless $P5 goto __label_10
    shift $S5, $P5
# {
.annotate 'line', 2637
# n: $I4
# predefined ord
    ord $I4, $S5
.annotate 'line', 2638
    le $I4, 127, __label_11
# {
.annotate 'line', 2639
# h: $S6
    box $P6, $I4
    $P2 = $P6.'get_as_base'(16)
    null $S6
    if_null $P2, __label_13
    set $S6, $P2
  __label_13:
.annotate 'line', 2640
    concat $S4, $S4, '\x{'
    concat $S4, $S4, $S6
    concat $S4, $S4, '}'
# }
    goto __label_12
  __label_11: # else
.annotate 'line', 2643
    concat $S4, $S4, $S5
  __label_12: # endif
# }
    goto __label_9
  __label_10: # endfor
.annotate 'line', 2645
    set $S1, $S4
# }
  __label_4: # endif
.annotate 'line', 2647
# q: $S7
    unless $I1 goto __label_15
    set $S7, "'"
    goto __label_14
  __label_15:
    set $S7, '"'
  __label_14:
.annotate 'line', 2648
    concat $S0, $S7, $S1
    concat $S0, $S0, $S7
    set $S1, $S0
.annotate 'line', 2649
    unless $I2 goto __label_16
.annotate 'line', 2650
    concat $S0, 'unicode:', $S1
    set $S1, $S0
  __label_16: # endif
.annotate 'line', 2651
    .return($S1)
# }
.annotate 'line', 2652

.end # getPirString


.sub 'get_value' :method
# Body
# {
.annotate 'line', 2655
# var strtok: $P1
    getattribute $P1, self, 'strval'
.annotate 'line', 2656
# str: $S1
    getattribute $P3, $P1, 'str'
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
  __label_0:
.annotate 'line', 2657
    isa $I1, $P1, [ 'TokenQuoted' ]
    unless $I1 goto __label_1
# {
.annotate 'line', 2658
# var s: $P2
    box $P2, $S1
.annotate 'line', 2659
    $P3 = $P2.'unescape'('utf8')
    set $S1, $P3
# }
  __label_1: # endif
.annotate 'line', 2661
    .return($S1)
# }
.annotate 'line', 2662

.end # get_value


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2665
    set $S1, __ARG_2
    eq $S1, '', __label_0
.annotate 'line', 2666
    $P1 = self.'getPirString'()
    __ARG_1.'emitset'(__ARG_2, $P1)
  __label_0: # endif
# }
.annotate 'line', 2667

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2670
    .tailcall self.'getPirString'()
# }
.annotate 'line', 2671

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'StringLiteral' ]
.annotate 'line', 2602
    get_class $P1, [ 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 2604
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
.annotate 'line', 2683
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2684
    setattribute self, 'pos', __ARG_2
.annotate 'line', 2685
# n: $I1
    null $I1
.annotate 'line', 2686
    unless __ARG_4 goto __label_0
.annotate 'line', 2687
    set $I1, __ARG_3
    goto __label_1
  __label_0: # else
# {
.annotate 'line', 2689
# aux: $S1
    set $P1, __ARG_2
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 2690
    set $I1, $S1
# }
  __label_1: # endif
.annotate 'line', 2692
    box $P1, $I1
    setattribute self, 'numval', $P1
# }
.annotate 'line', 2693

.end # IntegerLiteral


.sub 'isintegerliteral' :method
# Body
# {
.annotate 'line', 2694
    .return(1)
# }

.end # isintegerliteral


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2695
    .return('I')
# }

.end # checkresult


.sub 'getIntegerValue' :method
# Body
# {
.annotate 'line', 2698
# aux: $S1
    getattribute $P1, self, 'numval'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 2699
# i: $I1
    set $S2, $S1
    set $I1, $S2
.annotate 'line', 2700
    .return($I1)
# }
.annotate 'line', 2701

.end # getIntegerValue


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2704
    set $S1, __ARG_2
    eq $S1, '', __label_0
# {
.annotate 'line', 2705
# value: $I1
    $P1 = self.'getIntegerValue'()
    set $I1, $P1
.annotate 'line', 2706
    ne $I1, 0, __label_1
.annotate 'line', 2707
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_2
  __label_1: # else
.annotate 'line', 2709
    __ARG_1.'emitset'(__ARG_2, $I1)
  __label_2: # endif
# }
  __label_0: # endif
# }
.annotate 'line', 2711

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2714
    .tailcall self.'getIntegerValue'()
# }
.annotate 'line', 2715

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IntegerLiteral' ]
.annotate 'line', 2676
    get_class $P1, [ 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 2678
    addattribute $P0, 'pos'
.annotate 'line', 2679
    addattribute $P0, 'numval'
.end
.namespace [ 'FloatLiteral' ]

.sub 'FloatLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2725
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2726
    setattribute self, 'numval', __ARG_2
# }
.annotate 'line', 2727

.end # FloatLiteral


.sub 'isfloatliteral' :method
# Body
# {
.annotate 'line', 2728
    .return(1)
# }

.end # isfloatliteral


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2729
    .return('N')
# }

.end # checkresult


.sub 'getFloatValue' :method
# Body
# {
.annotate 'line', 2732
# aux: $S1
    getattribute $P2, self, 'numval'
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
  __label_0:
.annotate 'line', 2733
# var n: $P1
    new $P1, [ 'Float' ]
.annotate 'line', 2734
    assign $P1, $S1
.annotate 'line', 2735
    .return($P1)
# }
.annotate 'line', 2736

.end # getFloatValue


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2739
    set $S1, __ARG_2
    eq $S1, '', __label_0
# {
.annotate 'line', 2740
# var n: $P1
    $P1 = self.'getFloatValue'()
.annotate 'line', 2741
    __ARG_1.'emitset'(__ARG_2, $P1)
# }
  __label_0: # endif
# }
.annotate 'line', 2743

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2748
# aux: $S1
    getattribute $P1, self, 'numval'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 2749
# predefined indexof
    index $I1, $S1, '.'
    ge $I1, 0, __label_1
.annotate 'line', 2750
    concat $S1, $S1, '.0'
  __label_1: # endif
.annotate 'line', 2751
    .return($S1)
# }
.annotate 'line', 2752

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FloatLiteral' ]
.annotate 'line', 2720
    get_class $P1, [ 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 2722
    addattribute $P0, 'numval'
.end
.namespace [ 'IdentifierExpr' ]

.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 2760
    .return(1)
# }

.end # isidentifier


.sub 'IdentifierExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2763
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2764
    setattribute self, 'name', __ARG_2
# }
.annotate 'line', 2765

.end # IdentifierExpr


.sub 'isnull' :method
# Body
# {
.annotate 'line', 2768
    getattribute $P1, self, 'name'
    .tailcall $P1.'iskeyword'('null')
# }
.annotate 'line', 2769

.end # isnull


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2772
# var desc: $P1
    getattribute $P2, self, 'owner'
    getattribute $P3, self, 'name'
    $P1 = $P2.'getvar'($P3)
.annotate 'line', 2773
    if_null $P1, __label_0
.annotate 'line', 2774
    .tailcall $P1.'gettype'()
    goto __label_1
  __label_0: # else
# {
# switch
.annotate 'line', 2776
    getattribute $P2, self, 'name'
    set $S1, $P2
    set $S2, 'self'
    if $S1 == $S2 goto __label_4
    set $S2, 'null'
    if $S1 == $S2 goto __label_5
    goto __label_3
  __label_4: # case
  __label_5: # case
.annotate 'line', 2779
    .return('P')
  __label_3: # default
.annotate 'line', 2781
    .return('')
  __label_2: # switch end
# }
  __label_1: # endif
# }
.annotate 'line', 2784

.end # checkresult


.sub 'getName' :method
# Body
# {
.annotate 'line', 2787
# s: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 2788
    .return($S1)
# }
.annotate 'line', 2789

.end # getName


.sub 'checkIdentifier' :method
# Body
# {
.annotate 'line', 2792
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 2793
    unless_null $P1, __label_0
.annotate 'line', 2794
    'InternalError'('Bad thing')
  __label_0: # endif
.annotate 'line', 2795
# var desc: $P2
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
.annotate 'line', 2796
# s: $S1
    null $S1
.annotate 'line', 2797
    unless_null $P2, __label_1
# {
.annotate 'line', 2798
# sname: $S2
    set $P3, $P1
    null $S2
    if_null $P3, __label_3
    set $S2, $P3
  __label_3:
# switch
.annotate 'line', 2799
    set $S3, $S2
    set $S4, 'self'
    if $S3 == $S4 goto __label_6
    set $S4, 'null'
    if $S3 == $S4 goto __label_7
    goto __label_5
  __label_6: # case
.annotate 'line', 2801
    set $S1, 'self'
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 2803
    set $S1, 'null'
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 2805
    set $S1, ''
  __label_4: # switch end
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2809
    $P3 = $P2.'getid'()
    if_null $P3, __label_8
.annotate 'line', 2810
    .tailcall $P2.'getid'()
    goto __label_9
  __label_8: # else
.annotate 'line', 2812
    $P4 = $P2.'getreg'()
    set $S1, $P4
  __label_9: # endif
# }
  __label_2: # endif
.annotate 'line', 2814
    .return($S1)
# }
.annotate 'line', 2815

.end # checkIdentifier


.sub 'getIdentifier' :method
# Body
# {
.annotate 'line', 2818
# var value: $P1
    $P1 = self.'checkIdentifier'()
.annotate 'line', 2819
    set $S2, $P1
    ne $S2, '', __label_0
# {
.annotate 'line', 2820
# name: $S1
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 2821
    concat $S2, "Variable '", $S1
    concat $S2, $S2, "' is not defined"
    getattribute $P2, self, 'name'
    'SyntaxError'($S2, $P2)
# }
  __label_0: # endif
.annotate 'line', 2823
    .return($P1)
# }
.annotate 'line', 2824

.end # getIdentifier


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2827
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 2828
# var desc: $P2
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
.annotate 'line', 2829
    if_null $P2, __label_0
# {
.annotate 'line', 2830
    $I2 = $P2.'isconst'()
    unless $I2 goto __label_2
    $P3 = $P2.'getid'()
    isnull $I2, $P3
  __label_2:
    unless $I2 goto __label_1
.annotate 'line', 2831
    .tailcall $P2.'getvalue'()
  __label_1: # endif
.annotate 'line', 2832
# flags: $I1
    $P3 = $P2.'getflags'()
    set $I1, $P3
.annotate 'line', 2833
    band $I2, $I1, 1
    unless $I2 goto __label_3
# {
.annotate 'line', 2834
    band $I3, $I1, 2
    unless $I3 goto __label_4
.annotate 'line', 2835
    new $P4, [ 'LexicalVolatileExpr' ]
    $P4.'LexicalVolatileExpr'(self, $P2)
    set $P3, $P4
    .return($P3)
  __label_4: # endif
# }
  __label_3: # endif
# }
  __label_0: # endif
.annotate 'line', 2838
    .return(self)
# }
.annotate 'line', 2839

.end # optimize


.sub 'emit_getid' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2842
# id: $S1
    $P2 = self.'getIdentifier'()
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
  __label_0:
.annotate 'line', 2843
# var desc: $P1
    getattribute $P2, self, 'owner'
    getattribute $P3, self, 'name'
    $P1 = $P2.'getvar'($P3)
.annotate 'line', 2844
# flags: $I1
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
    $I1 = $P1.'getflags'()
  __label_1:
.annotate 'line', 2845
    band $I2, $I1, 1
    unless $I2 goto __label_3
# {
.annotate 'line', 2846
    band $I3, $I1, 2
    unless $I3 goto __label_4
# {
.annotate 'line', 2847
# lexname: $S2
    $P2 = $P1.'getlex'()
    null $S2
    if_null $P2, __label_5
    set $S2, $P2
  __label_5:
.annotate 'line', 2848
    isnull $I2, $S2
    not $I2
    unless $I2 goto __label_7
    isne $I2, $S2, ''
  __label_7:
    unless $I2 goto __label_6
.annotate 'line', 2849
    __ARG_1.'emitfind_lex'($S1, $S2)
  __label_6: # endif
# }
  __label_4: # endif
# }
  __label_3: # endif
.annotate 'line', 2852
    .return($S1)
# }
.annotate 'line', 2853

.end # emit_getid


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2856
    set $S2, __ARG_2
    eq $S2, '', __label_0
# {
.annotate 'line', 2857
    self.'annotate'(__ARG_1)
.annotate 'line', 2858
# id: $S1
    $P1 = self.'emit_getid'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 2859
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_0: # endif
# }
.annotate 'line', 2861

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2864
    self.'annotate'(__ARG_1)
.annotate 'line', 2865
# id: $S1
    $P1 = self.'emit_getid'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 2866
    .return($S1)
# }
.annotate 'line', 2867

.end # emit_get


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2870
    self.'annotate'(__ARG_1)
.annotate 'line', 2871
    $P1 = self.'isnull'()
    if_null $P1, __label_0
    unless $P1 goto __label_0
# predefined die
.annotate 'line', 2872
    die "NO"
  __label_0: # endif
.annotate 'line', 2873
# typeleft: $S1
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 2874
# lreg: $S2
    $P1 = self.'getIdentifier'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 2875
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_3
    unless $P1 goto __label_3
# {
# switch
.annotate 'line', 2876
    set $S5, $S1
    set $S6, 'S'
    if $S5 == $S6 goto __label_7
    set $S6, 'P'
    if $S5 == $S6 goto __label_8
    goto __label_6
  __label_7: # case
  __label_8: # case
.annotate 'line', 2879
    __ARG_1.'emitnull'($S2)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 2882
    getattribute $P2, self, 'start'
    'SyntaxError'("Can't assign null to that type", $P2)
  __label_5: # switch end
# }
    goto __label_4
  __label_3: # else
.annotate 'line', 2885
    isa $I1, __ARG_2, [ 'IndexExpr' ]
    unless $I1 goto __label_9
.annotate 'line', 2886
    __ARG_2.'emit'(__ARG_1, $S2)
    goto __label_10
  __label_9: # else
# {
.annotate 'line', 2888
# typeright: $S3
    $P1 = __ARG_2.'checkresult'()
    null $S3
    if_null $P1, __label_11
    set $S3, $P1
  __label_11:
.annotate 'line', 2889
    ne $S3, 'v', __label_12
.annotate 'line', 2890
    getattribute $P1, self, 'start'
    'SyntaxError'("Can't assign from void expression", $P1)
  __label_12: # endif
.annotate 'line', 2891
    ne $S1, $S3, __label_13
# {
.annotate 'line', 2892
    __ARG_2.'emit'(__ARG_1, $S2)
# }
    goto __label_14
  __label_13: # else
# {
.annotate 'line', 2895
# rreg: $S4
    $P1 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P1, __label_15
    set $S4, $P1
  __label_15:
.annotate 'line', 2896
    self.'annotate'(__ARG_1)
.annotate 'line', 2897
    iseq $I1, $S1, 'P'
    unless $I1 goto __label_18
    isne $I1, $S3, 'P'
  __label_18:
    unless $I1 goto __label_16
.annotate 'line', 2898
    __ARG_1.'emitbox'($S2, $S4)
    goto __label_17
  __label_16: # else
.annotate 'line', 2900
    __ARG_1.'emitset'($S2, $S4)
  __label_17: # endif
# }
  __label_14: # endif
# }
  __label_10: # endif
  __label_4: # endif
.annotate 'line', 2903
    .return($S2)
# }
.annotate 'line', 2904

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IdentifierExpr' ]
.annotate 'line', 2757
    get_class $P1, [ 'SimpleExpr' ]
    addparent $P0, $P1
.annotate 'line', 2759
    addattribute $P0, 'name'
.end
.namespace [ 'LexicalVolatileExpr' ]

.sub 'LexicalVolatileExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2914
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 2915
    setattribute self, 'desc', __ARG_2
# }
.annotate 'line', 2916

.end # LexicalVolatileExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2917
    .return('P')
# }

.end # checkresult


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2920
# var desc: $P1
    getattribute $P1, self, 'desc'
.annotate 'line', 2921
# lexname: $S1
    $P2 = $P1.'getlex'()
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
  __label_0:
.annotate 'line', 2922
# reg: $S2
    getattribute $P3, self, 'owner'
    $P2 = $P3.'tempreg'('P')
    null $S2
    if_null $P2, __label_1
    set $S2, $P2
  __label_1:
.annotate 'line', 2923
    __ARG_1.'emitfind_lex'($S2, $S1)
.annotate 'line', 2924
    .return($S2)
# }
.annotate 'line', 2925

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2928
    set $S2, __ARG_2
    eq $S2, '', __label_0
# {
.annotate 'line', 2929
    self.'annotate'(__ARG_1)
.annotate 'line', 2930
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 2931
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_0: # endif
# }
.annotate 'line', 2933

.end # emit


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2936
# lreg: $S1
    getattribute $P3, self, 'owner'
    $P2 = $P3.'tempreg'('P')
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
  __label_0:
# switch-case
.annotate 'line', 2938
    $I1 = __ARG_2.'isnull'()
    if $I1 goto __label_3
.annotate 'line', 2941
    isa $I1, __ARG_2, [ 'IndexExpr' ]
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 2939
    __ARG_1.'emitnull'($S1)
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 2942
    __ARG_2.'emit'(__ARG_1, $S1)
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 2945
# typeright: $S2
    $P2 = __ARG_2.'checkresult'()
    null $S2
    if_null $P2, __label_5
    set $S2, $P2
  __label_5:
.annotate 'line', 2946
    ne 'P', $S2, __label_6
.annotate 'line', 2947
    __ARG_2.'emit'(__ARG_1, $S1)
    goto __label_7
  __label_6: # else
# {
.annotate 'line', 2949
# rreg: $S3
    $P3 = __ARG_2.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_8
    set $S3, $P3
  __label_8:
.annotate 'line', 2950
    self.'annotate'(__ARG_1)
.annotate 'line', 2951
    __ARG_1.'emitbox'($S1, $S3)
# }
  __label_7: # endif
  __label_1: # switch end
.annotate 'line', 2955
# var desc: $P1
    getattribute $P1, self, 'desc'
.annotate 'line', 2956
# lexname: $S4
    $P2 = $P1.'getlex'()
    null $S4
    if_null $P2, __label_9
    set $S4, $P2
  __label_9:
.annotate 'line', 2957
    __ARG_1.'say'("store_lex '", $S4, "', ", $S1)
# }
.annotate 'line', 2958

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'LexicalVolatileExpr' ]
.annotate 'line', 2909
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 2911
    addattribute $P0, 'desc'
.end
.namespace [ 'OpExpr' ]

.sub 'initop' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2967
    self.'Expr'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2968

.end # initop

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpExpr' ]
.annotate 'line', 2963
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
.annotate 'line', 2979
    self.'initop'(__ARG_2, __ARG_3)
.annotate 'line', 2980
    $P2 = 'parseClassSpecifier'(__ARG_1, __ARG_2)
    setattribute self, 'clspec', $P2
# }
.annotate 'line', 2981

.end # OpClassExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2982
    .return('P')
# }

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2985
# var clspec: $P1
    getattribute $P1, self, 'clspec'
.annotate 'line', 2988
    set $S1, __ARG_2
    ne $S1, '', __label_0
.annotate 'line', 2989
    getattribute $P2, self, 'owner'
    __ARG_2 = $P2.'tempreg'('P')
  __label_0: # endif
.annotate 'line', 2990
    __ARG_1.'print'('    get_class ', __ARG_2, ', ')
.annotate 'line', 2991
    getattribute $P2, self, 'owner'
    $P1.'emit'(__ARG_1, $P2)
.annotate 'line', 2992
    __ARG_1.'say'()
# }
.annotate 'line', 2993

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpClassExpr' ]
.annotate 'line', 2973
    get_class $P1, [ 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 2975
    addattribute $P0, 'clspec'
.end
.namespace [ 'OpUnaryExpr' ]

.sub 'OpUnaryExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3003
    self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 3004
    setattribute self, 'subexpr', __ARG_3
# }
.annotate 'line', 3005

.end # OpUnaryExpr


.sub 'optimizearg' :method
# Body
# {
.annotate 'line', 3008
    getattribute $P3, self, 'subexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'subexpr', $P2
# }
.annotate 'line', 3009

.end # optimizearg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3012
    self.'optimizearg'()
.annotate 'line', 3013
    .return(self)
# }
.annotate 'line', 3014

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpUnaryExpr' ]
.annotate 'line', 2998
    get_class $P1, [ 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3000
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
.annotate 'line', 3025
    self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 3026
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 3027
    setattribute self, 'rexpr', __ARG_4
# }
.annotate 'line', 3028

.end # initbinary


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 3031
    self.'initbinary'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 3032
    .return(self)
# }
.annotate 'line', 3033

.end # set


.sub 'setfrom' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3036
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    getattribute $P3, __ARG_1, 'lexpr'
    getattribute $P4, __ARG_1, 'rexpr'
    .tailcall self.'set'($P1, $P2, $P3, $P4)
# }
.annotate 'line', 3037

.end # setfrom


.sub 'optimizearg' :method
# Body
# {
.annotate 'line', 3040
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 3041
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'rexpr', $P2
# }
.annotate 'line', 3042

.end # optimizearg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3045
    self.'optimizearg'()
.annotate 'line', 3046
    .return(self)
# }
.annotate 'line', 3047

.end # optimize


.sub 'emit_intleft' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3050
# reg: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_getint'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 3051
    .return($S1)
# }
.annotate 'line', 3052

.end # emit_intleft


.sub 'emit_intright' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3055
# reg: $S1
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_getint'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 3056
    .return($S1)
# }
.annotate 'line', 3057

.end # emit_intright

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBinaryExpr' ]
.annotate 'line', 3019
    get_class $P1, [ 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3021
    addattribute $P0, 'lexpr'
.annotate 'line', 3022
    addattribute $P0, 'rexpr'
.end
.namespace [ 'OpBinaryIntExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3066
    .return('I')
# }
.annotate 'line', 3067

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3070
    self.'optimizearg'()
.annotate 'line', 3071
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3072
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3073
    $I3 = $P1.'isintegerliteral'()
    unless $I3 goto __label_1
    $I3 = $P2.'isintegerliteral'()
  __label_1:
    unless $I3 goto __label_0
# {
.annotate 'line', 3074
# li: $I1
# predefined int
    getattribute $P3, $P1, 'numval'
    set $I1, $P3
.annotate 'line', 3075
# ri: $I2
# predefined int
    getattribute $P3, $P2, 'numval'
    set $I2, $P3
.annotate 'line', 3076
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P5 = self.'do_op'($I1, $I2)
    .tailcall 'integerValue'($P3, $P4, $P5)
# }
  __label_0: # endif
.annotate 'line', 3078
    .return(self)
# }
.annotate 'line', 3079

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBinaryIntExpr' ]
.annotate 'line', 3062
    get_class $P1, [ 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpDelExBase' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3088
    .return('I')
# }
.annotate 'line', 3089

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpDelExBase' ]
.annotate 'line', 3084
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
.annotate 'line', 3097
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3098

.end # OpDeleteExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3101
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3102
    isa $I1, $P1, [ 'IndexExpr' ]
    unless $I1 goto __label_2
    $P2 = $P1.'checkresult'()
    set $S1, $P2
    isne $I1, $S1, 'S'
  __label_2:
    unless $I1 goto __label_0
# {
.annotate 'line', 3103
    $P1.'emit_prep'(__ARG_1)
.annotate 'line', 3104
    self.'annotate'(__ARG_1)
.annotate 'line', 3105
    __ARG_1.'print'('    delete ')
.annotate 'line', 3106
    $P1.'emit_aux'(__ARG_1)
.annotate 'line', 3107
    __ARG_1.'say'()
.annotate 'line', 3108
    set $S1, __ARG_2
    eq $S1, '', __label_3
.annotate 'line', 3109
    __ARG_1.'emitset'(__ARG_2, '1')
  __label_3: # endif
# }
    goto __label_1
  __label_0: # else
.annotate 'line', 3112
    getattribute $P2, self, 'start'
    'SyntaxError'("delete with invalid operator", $P2)
  __label_1: # endif
# }
.annotate 'line', 3113

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpDeleteExpr' ]
.annotate 'line', 3093
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
.annotate 'line', 3120
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3121

.end # OpExistsExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3124
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3125
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
.annotate 'line', 3126
    isa $I1, $P1, [ 'IndexExpr' ]
    unless $I1 goto __label_5
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    isne $I1, $S2, 'S'
  __label_5:
    unless $I1 goto __label_3
# {
.annotate 'line', 3127
    $P1.'emit_prep'(__ARG_1)
.annotate 'line', 3128
    self.'annotate'(__ARG_1)
.annotate 'line', 3129
    __ARG_1.'print'('    exists ', $S1, ', ')
.annotate 'line', 3130
    $P1.'emit_aux'(__ARG_1)
.annotate 'line', 3131
    __ARG_1.'say'()
# }
    goto __label_4
  __label_3: # else
.annotate 'line', 3134
    getattribute $P2, self, 'start'
    'SyntaxError'("exists with invalid operator", $P2)
  __label_4: # endif
# }
.annotate 'line', 3135

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpExistsExpr' ]
.annotate 'line', 3116
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
.annotate 'line', 3144
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3145

.end # OpUnaryMinusExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3148
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3149

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3152
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3153
    .return(self)
# }
.annotate 'line', 3154

.end # set


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3157
    self.'optimizearg'()
.annotate 'line', 3158
    getattribute $P4, self, 'subexpr'
    $P3 = $P4.'isintegerliteral'()
    if_null $P3, __label_0
    unless $P3 goto __label_0
# {
.annotate 'line', 3159
# var numval: $P1
    getattribute $P5, self, 'subexpr'
    getattribute $P1, $P5, 'numval'
.annotate 'line', 3160
# i: $I1
    set $P3, $P1
    set $I1, $P3
.annotate 'line', 3161
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'subexpr'
    getattribute $P5, $P4, 'start'
    neg $I2, $I1
    .tailcall 'integerValue'($P3, $P5, $I2)
# }
  __label_0: # endif
# {
.annotate 'line', 3164
    getattribute $P4, self, 'subexpr'
    $P3 = $P4.'isfloatliteral'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 3165
# var numval: $P2
    getattribute $P5, self, 'subexpr'
    getattribute $P2, $P5, 'numval'
.annotate 'line', 3166
# n: $N1
# predefined string
    set $S1, $P2
    set $N1, $S1
.annotate 'line', 3167
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'subexpr'
    getattribute $P5, $P4, 'start'
    neg $N2, $N1
    .tailcall 'floatValue'($P3, $P5, $N2)
# }
  __label_1: # endif
# }
.annotate 'line', 3170
    .return(self)
# }
.annotate 'line', 3171

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3174
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 3175
    self.'annotate'(__ARG_1)
.annotate 'line', 3176
    __ARG_1.'emitarg2'('neg', __ARG_2, $S1)
# }
.annotate 'line', 3177

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpUnaryMinusExpr' ]
.annotate 'line', 3140
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
.annotate 'line', 3186
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3187

.end # OpNotExpr


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3188
    .return(1)
# }

.end # isnegable


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3191
    .return('I')
# }
.annotate 'line', 3192

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3195
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3196
    .return(self)
# }
.annotate 'line', 3197

.end # set


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3200
    self.'optimizearg'()
.annotate 'line', 3201
# var subexpr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3202
    $P3 = $P1.'isintegerliteral'()
    if_null $P3, __label_0
    unless $P3 goto __label_0
# {
.annotate 'line', 3203
# var numval: $P2
    getattribute $P2, $P1, 'numval'
.annotate 'line', 3204
# n: $I1
    set $P3, $P2
    set $I1, $P3
.annotate 'line', 3205
    getattribute $P3, self, 'owner'
    getattribute $P4, $P1, 'start'
    not $I2, $I1
    .tailcall 'integerValue'($P3, $P4, $I2)
# }
  __label_0: # endif
.annotate 'line', 3207
    $P3 = $P1.'isnegable'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 3208
    .tailcall $P1.'negated'()
  __label_1: # endif
.annotate 'line', 3209
    .return(self)
# }
.annotate 'line', 3210

.end # optimize


.sub 'negated' :method
# Body
# {
.annotate 'line', 3213
    getattribute $P1, self, 'subexpr'
    .return($P1)
# }
.annotate 'line', 3214

.end # negated


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3217
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 3218
    self.'annotate'(__ARG_1)
.annotate 'line', 3219
# type: $S2
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
  __label_1:
# switch
.annotate 'line', 3220
    set $S3, $S2
    set $S4, 'I'
    if $S3 == $S4 goto __label_4
    set $S4, 'P'
    if $S3 == $S4 goto __label_5
    goto __label_3
  __label_4: # case
.annotate 'line', 3222
    __ARG_1.'emitarg2'('not', __ARG_2, $S1)
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 3225
    __ARG_1.'emitarg2'('isfalse', __ARG_2, $S1)
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 3228
    __ARG_1.'emitarg2'('isfalse', __ARG_2, $S1)
  __label_2: # switch end
# }
.annotate 'line', 3230

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpNotExpr' ]
.annotate 'line', 3182
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
.annotate 'line', 3239
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3240

.end # OpPreIncExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3243
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3244

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3247
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3248
    setattribute self, 'subexpr', __ARG_3
.annotate 'line', 3249
    .return(self)
# }
.annotate 'line', 3250

.end # set


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3253
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 3254
    set $S2, __ARG_2
    eq $S2, '', __label_1
.annotate 'line', 3255
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_1: # endif
# }
.annotate 'line', 3256

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3259
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 3260
    self.'annotate'(__ARG_1)
.annotate 'line', 3261
    __ARG_1.'emitinc'($S1)
.annotate 'line', 3262
    .return($S1)
# }
.annotate 'line', 3263

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpPreIncExpr' ]
.annotate 'line', 3235
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
.annotate 'line', 3272
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3273
    .return(self)
# }
.annotate 'line', 3274

.end # OpPostIncExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3277
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3278

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3281
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 3282
    self.'annotate'(__ARG_1)
.annotate 'line', 3283
    set $S2, __ARG_2
    eq $S2, '', __label_1
.annotate 'line', 3284
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_1: # endif
.annotate 'line', 3285
    __ARG_1.'emitinc'($S1)
.annotate 'line', 3286
    .return($S1)
# }
.annotate 'line', 3287

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpPostIncExpr' ]
.annotate 'line', 3268
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
.annotate 'line', 3296
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3297

.end # OpPreDecExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3300
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3301

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3304
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3305
    .return(self)
# }
.annotate 'line', 3306

.end # set


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3309
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 3310
    set $S2, __ARG_2
    eq $S2, '', __label_1
.annotate 'line', 3311
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_1: # endif
# }
.annotate 'line', 3312

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3315
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 3316
    self.'annotate'(__ARG_1)
.annotate 'line', 3317
    __ARG_1.'emitdec'($S1)
.annotate 'line', 3318
    .return($S1)
# }
.annotate 'line', 3319

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpPreDecExpr' ]
.annotate 'line', 3292
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
.annotate 'line', 3328
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3329
    .return(self)
# }
.annotate 'line', 3330

.end # OpPostDecExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3333
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3334

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3337
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 3338
    self.'annotate'(__ARG_1)
.annotate 'line', 3339
    set $S2, __ARG_2
    eq $S2, '', __label_1
.annotate 'line', 3340
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_1: # endif
.annotate 'line', 3341
    __ARG_1.'emitdec'($S1)
.annotate 'line', 3342
    .return($S1)
# }
.annotate 'line', 3343

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpPostDecExpr' ]
.annotate 'line', 3324
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
.annotate 'line', 3354
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3355
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 3356
    setattribute self, 'rexpr', __ARG_4
.annotate 'line', 3357
    .return(self)
# }
.annotate 'line', 3358

.end # set


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3361
    getattribute $P1, self, 'lexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3362

.end # checkresult


.sub 'optimize_base' :method
# Body
# {
.annotate 'line', 3365
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 3366
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'rexpr', $P2
.annotate 'line', 3367
    .return(self)
# }
.annotate 'line', 3368

.end # optimize_base


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3371
    .tailcall self.'optimize_base'()
# }
.annotate 'line', 3372

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3375
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 3376
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 3377
    self.'annotate'(__ARG_1)
.annotate 'line', 3378
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_1: # endif
# }
.annotate 'line', 3380

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBaseAssignExpr' ]
.annotate 'line', 3348
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3350
    addattribute $P0, 'lexpr'
.annotate 'line', 3351
    addattribute $P0, 'rexpr'
.end
.namespace [ 'OpAssignExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3389
    self.'annotate'(__ARG_1)
.annotate 'line', 3390
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3391
    getattribute $P2, self, 'rexpr'
    .tailcall $P1.'emit_assign_get'(__ARG_1, $P2)
# }
.annotate 'line', 3392

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpAssignExpr' ]
.annotate 'line', 3385
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpAssignToExpr' ]

.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3401
    self.'annotate'(__ARG_1)
.annotate 'line', 3402
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 3403
    isnull $I1, __ARG_2
    not $I1
    unless $I1 goto __label_2
    set $S2, __ARG_2
    isne $I1, $S2, ''
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 3404
    __ARG_1.'emitassign'(__ARG_2, $S1)
  __label_1: # endif
# }
.annotate 'line', 3405

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3408
    self.'annotate'(__ARG_1)
.annotate 'line', 3409
# reg: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 3410
# reg2: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
  __label_1:
.annotate 'line', 3411
    __ARG_1.'emitassign'($S1, $S2)
.annotate 'line', 3412
    .return($S1)
# }
.annotate 'line', 3413

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpAssignToExpr' ]
.annotate 'line', 3397
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpAddToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3422
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3423
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3424
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
  __label_0:
.annotate 'line', 3425
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_1
    set $S2, $P3
  __label_1:
.annotate 'line', 3426
# reg: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_2
    set $S3, $P3
  __label_2:
.annotate 'line', 3427
    iseq $I1, $S1, 'S'
    unless $I1 goto __label_5
    isa $I1, $P2, [ 'ConcatString' ]
  __label_5:
    unless $I1 goto __label_3
.annotate 'line', 3428
    $P2.'emit_concat_to'(__ARG_1, $S3)
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 3430
# reg2: $S4
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_6
    set $S4, $P3
  __label_6:
.annotate 'line', 3431
# aux: $S5
    null $S5
.annotate 'line', 3432
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 3433
    set $S6, $S1
    set $S7, 'S'
    if $S6 == $S7 goto __label_9
    set $S7, 'I'
    if $S6 == $S7 goto __label_10
    set $S7, 'N'
    if $S6 == $S7 goto __label_11
    goto __label_8
  __label_9: # case
.annotate 'line', 3435
    eq $S2, 'S', __label_12
# {
.annotate 'line', 3436
    $P3 = self.'tempreg'('S')
    set $S5, $P3
.annotate 'line', 3437
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3438
    set $S4, $S5
# }
  __label_12: # endif
.annotate 'line', 3440
    __ARG_1.'emitconcat1'($S3, $S4)
    goto __label_7 # break
  __label_10: # case
  __label_11: # case
.annotate 'line', 3444
    eq $S1, $S2, __label_13
# {
.annotate 'line', 3445
    $P3 = self.'tempreg'($S1)
    set $S5, $P3
.annotate 'line', 3446
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3447
    set $S4, $S5
# }
  __label_13: # endif
.annotate 'line', 3449
    __ARG_1.'emitaddto'($S3, $S4)
    goto __label_7 # break
  __label_8: # default
.annotate 'line', 3452
    __ARG_1.'emitaddto'($S3, $S4)
  __label_7: # switch end
# }
  __label_4: # endif
.annotate 'line', 3455
    .return($S3)
# }
.annotate 'line', 3456

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpAddToExpr' ]
.annotate 'line', 3418
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpSubToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3465
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3466
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3467
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
  __label_0:
.annotate 'line', 3468
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_1
    set $S2, $P3
  __label_1:
.annotate 'line', 3469
# reg: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_2
    set $S3, $P3
  __label_2:
.annotate 'line', 3470
# reg2: $S4
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_3
    set $S4, $P3
  __label_3:
.annotate 'line', 3471
# aux: $S5
    null $S5
.annotate 'line', 3472
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 3473
    set $S6, $S1
    set $S7, 'S'
    if $S6 == $S7 goto __label_6
    set $S7, 'I'
    if $S6 == $S7 goto __label_7
    set $S7, 'N'
    if $S6 == $S7 goto __label_8
    goto __label_5
  __label_6: # case
.annotate 'line', 3475
    getattribute $P3, self, 'start'
    'SyntaxError'("-= can't be applied to string", $P3)
  __label_7: # case
  __label_8: # case
.annotate 'line', 3478
    eq $S1, $S2, __label_9
# {
.annotate 'line', 3479
    $P4 = self.'tempreg'($S1)
    set $S5, $P4
.annotate 'line', 3480
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3481
    set $S4, $S5
# }
  __label_9: # endif
.annotate 'line', 3483
    __ARG_1.'emitsubto'($S3, $S4)
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 3486
    __ARG_1.'emitsubto'($S3, $S4)
  __label_4: # switch end
.annotate 'line', 3488
    .return($S3)
# }
.annotate 'line', 3489

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpSubToExpr' ]
.annotate 'line', 3461
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpMulToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3498
# ltype: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 3499
# rtype: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
  __label_1:
.annotate 'line', 3500
# lreg: $S3
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_2
    set $S3, $P1
  __label_2:
.annotate 'line', 3501
# rreg: $S4
    null $S4
# switch
.annotate 'line', 3502
    set $S5, $S1
    set $S6, 'S'
    if $S5 == $S6 goto __label_5
    goto __label_4
  __label_5: # case
.annotate 'line', 3504
    ne $S2, 'I', __label_6
.annotate 'line', 3505
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    set $S4, $P1
    goto __label_7
  __label_6: # else
# {
.annotate 'line', 3507
    $P3 = self.'tempreg'('I')
    set $S4, $P3
.annotate 'line', 3508
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S4)
# }
  __label_7: # endif
.annotate 'line', 3510
    self.'annotate'(__ARG_1)
.annotate 'line', 3511
    __ARG_1.'emitrepeat'($S3, $S3, $S4)
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 3514
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    set $S4, $P1
.annotate 'line', 3515
    self.'annotate'(__ARG_1)
.annotate 'line', 3516
    __ARG_1.'emitarg2'('mul', $S3, $S4)
  __label_3: # switch end
.annotate 'line', 3518
    .return($S3)
# }
.annotate 'line', 3519

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpMulToExpr' ]
.annotate 'line', 3494
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpDivToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3528
# type: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 3529
# reg: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
  __label_1:
.annotate 'line', 3530
# reg2: $S3
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_2
    set $S3, $P1
  __label_2:
.annotate 'line', 3531
    self.'annotate'(__ARG_1)
.annotate 'line', 3532
    __ARG_1.'emitarg2'('div', $S2, $S3)
.annotate 'line', 3533
    .return($S2)
# }
.annotate 'line', 3534

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpDivToExpr' ]
.annotate 'line', 3524
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpModToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3543
# type: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 3544
# reg: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
  __label_1:
.annotate 'line', 3545
# reg2: $S3
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_2
    set $S3, $P1
  __label_2:
.annotate 'line', 3546
    self.'annotate'(__ARG_1)
.annotate 'line', 3547
    __ARG_1.'emitarg2'('mod', $S2, $S3)
.annotate 'line', 3548
    .return($S2)
# }
.annotate 'line', 3549

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpModToExpr' ]
.annotate 'line', 3539
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'ComparatorBaseExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3556
    .return('I')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3559
    self.'optimizearg'()
.annotate 'line', 3560
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3561
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3562
    $I3 = $P1.'isintegerliteral'()
    unless $I3 goto __label_1
    $I3 = $P2.'isintegerliteral'()
  __label_1:
    unless $I3 goto __label_0
# {
.annotate 'line', 3563
# li: $I1
# predefined int
    getattribute $P3, $P1, 'numval'
    set $I1, $P3
.annotate 'line', 3564
# ri: $I2
# predefined int
    getattribute $P3, $P2, 'numval'
    set $I2, $P3
.annotate 'line', 3565
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P5 = self.'int_op'($I1, $I2)
    .tailcall 'integerValue'($P3, $P4, $P5)
# }
  __label_0: # endif
.annotate 'line', 3567
    .return(self)
# }
.annotate 'line', 3568

.end # optimize


.sub 'emit_comparator' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 3571
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 3572
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
  __label_1:
.annotate 'line', 3573
# regl: $S3
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_2
    set $S3, $P1
  __label_2:
.annotate 'line', 3574
# regr: $S4
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P1, __label_3
    set $S4, $P1
  __label_3:
.annotate 'line', 3575
    self.'annotate'(__ARG_1)
.annotate 'line', 3576
# aux: $S5
    null $S5
# switch-case
.annotate 'line', 3578
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_7
    iseq $I1, $S2, 'N'
  __label_7:
    if $I1 goto __label_6
.annotate 'line', 3583
    iseq $I1, $S1, 'N'
    unless $I1 goto __label_9
    iseq $I1, $S2, 'I'
  __label_9:
    if $I1 goto __label_8
.annotate 'line', 3588
    iseq $I1, $S2, 'I'
    unless $I1 goto __label_11
    iseq $I1, $S1, 'P'
  __label_11:
    if $I1 goto __label_10
.annotate 'line', 3593
    iseq $I1, $S2, 'P'
    unless $I1 goto __label_13
    iseq $I1, $S1, 'I'
  __label_13:
    if $I1 goto __label_12
.annotate 'line', 3598
    iseq $I1, $S2, 'S'
    unless $I1 goto __label_15
    iseq $I1, $S1, 'P'
  __label_15:
    if $I1 goto __label_14
.annotate 'line', 3603
    iseq $I1, $S2, 'P'
    unless $I1 goto __label_17
    iseq $I1, $S1, 'S'
  __label_17:
    if $I1 goto __label_16
    goto __label_5
  __label_6: # case
.annotate 'line', 3579
    $P1 = self.'tempreg'('N')
    set $S5, $P1
.annotate 'line', 3580
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3581
    set $S3, $S5
    goto __label_4 # break
  __label_8: # case
.annotate 'line', 3584
    $P2 = self.'tempreg'('N')
    set $S5, $P2
.annotate 'line', 3585
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3586
    set $S4, $S5
    goto __label_4 # break
  __label_10: # case
.annotate 'line', 3589
    $P3 = self.'tempreg'('I')
    set $S5, $P3
.annotate 'line', 3590
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3591
    set $S3, $S5
    goto __label_4 # break
  __label_12: # case
.annotate 'line', 3594
    $P4 = self.'tempreg'('I')
    set $S5, $P4
.annotate 'line', 3595
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3596
    set $S4, $S5
    goto __label_4 # break
  __label_14: # case
.annotate 'line', 3599
    $P5 = self.'tempreg'('S')
    set $S5, $P5
.annotate 'line', 3600
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3601
    set $S3, $S5
    goto __label_4 # break
  __label_16: # case
.annotate 'line', 3604
    $P6 = self.'tempreg'('S')
    set $S5, $P6
.annotate 'line', 3605
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3606
    set $S4, $S5
    goto __label_4 # break
  __label_5: # default
  __label_4: # switch end
.annotate 'line', 3607
# switch
.annotate 'line', 3610
    set $I1, __ARG_3
    null $I2
    if $I1 == $I2 goto __label_20
    set $I2, 1
    if $I1 == $I2 goto __label_21
    set $I2, 2
    if $I1 == $I2 goto __label_22
    goto __label_19
  __label_20: # case
.annotate 'line', 3612
    self.'emitop'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_18 # break
  __label_21: # case
.annotate 'line', 3615
    self.'emitop_if'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_18 # break
  __label_22: # case
.annotate 'line', 3618
    self.'emitop_else'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_18 # break
  __label_19: # default
  __label_18: # switch end
.annotate 'line', 3619
# }
.annotate 'line', 3621

.end # emit_comparator


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3624
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3625

.end # emit


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 3628
    self.'emit_comparator'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 3629

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 3632
    self.'emit_comparator'(__ARG_1, __ARG_2, 2)
# }
.annotate 'line', 3633

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ComparatorBaseExpr' ]
.annotate 'line', 3554
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
.annotate 'line', 3648
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 3649
    setattribute self, 'expr', __ARG_2
.annotate 'line', 3650
    box $P1, __ARG_3
    setattribute self, 'checknull', $P1
# }
.annotate 'line', 3651

.end # NullCheckerExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3652
    .return('I')
# }

.end # checkresult


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3653
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3656
# checkneg: $I1
    getattribute $P1, self, 'checknull'
    isfalse $I1, $P1
.annotate 'line', 3657
    box $P1, $I1
    setattribute self, 'checknull', $P1
.annotate 'line', 3658
    .return(self)
# }
.annotate 'line', 3659

.end # negated


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3662
# reg: $S1
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 3663
    self.'annotate'(__ARG_1)
.annotate 'line', 3664
    __ARG_1.'emitarg2'('isnull', __ARG_2, $S1)
.annotate 'line', 3665
    getattribute $P1, self, 'checknull'
    isfalse $I1, $P1
    unless $I1 goto __label_1
.annotate 'line', 3666
    __ARG_1.'emitarg1'('not', __ARG_2)
  __label_1: # endif
# }
.annotate 'line', 3667

.end # emit


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 3670
# reg: $S1
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 3671
    self.'annotate'(__ARG_1)
.annotate 'line', 3672
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
.annotate 'line', 3673

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NullCheckerExpr' ]
.annotate 'line', 3641
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3643
    addattribute $P0, 'expr'
.annotate 'line', 3644
    addattribute $P0, 'checknull'
.end
.namespace [ 'OpEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3680
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3683
    new $P1, [ 'OpNotEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3684

.end # negated


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3687
    self.'optimizearg'()
.annotate 'line', 3688
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3689
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3690
# lnull: $I1
    $P3 = $P1.'isnull'()
    set $I1, $P3
.annotate 'line', 3691
# rnull: $I2
    $P3 = $P2.'isnull'()
    set $I2, $P3
.annotate 'line', 3692
    unless $I1 goto __label_0
# {
.annotate 'line', 3693
    unless $I2 goto __label_1
.annotate 'line', 3694
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall 'integerValue'($P3, $P4, 1)
    goto __label_2
  __label_1: # else
.annotate 'line', 3696
    new $P6, [ 'NullCheckerExpr' ]
    getattribute $P7, self, 'rexpr'
    $P6.'NullCheckerExpr'(self, $P7, 1)
    set $P5, $P6
    .return($P5)
  __label_2: # endif
# }
  __label_0: # endif
.annotate 'line', 3698
    unless $I2 goto __label_3
.annotate 'line', 3699
    new $P4, [ 'NullCheckerExpr' ]
    getattribute $P5, self, 'lexpr'
    $P4.'NullCheckerExpr'(self, $P5, 1)
    set $P3, $P4
    .return($P3)
  __label_3: # endif
.annotate 'line', 3700
    $I5 = $P1.'isliteral'()
    unless $I5 goto __label_5
    $I5 = $P2.'isliteral'()
  __label_5:
    unless $I5 goto __label_4
# {
.annotate 'line', 3701
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_6
    set $S1, $P3
  __label_6:
.annotate 'line', 3702
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_7
    set $S2, $P3
  __label_7:
.annotate 'line', 3703
    ne $S1, $S2, __label_8
# {
# switch
.annotate 'line', 3704
    set $S5, $S1
    set $S6, 'I'
    if $S5 == $S6 goto __label_11
    set $S6, 'S'
    if $S5 == $S6 goto __label_12
    goto __label_10
  __label_11: # case
.annotate 'line', 3706
# li: $I3
# predefined int
    getattribute $P3, $P1, 'numval'
    set $I3, $P3
.annotate 'line', 3707
# ri: $I4
# predefined int
    getattribute $P4, $P2, 'numval'
    set $I4, $P4
.annotate 'line', 3708
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    iseq $I5, $I3, $I4
    .tailcall 'integerValue'($P5, $P6, $I5)
  __label_12: # case
.annotate 'line', 3710
# ls: $S3
    getattribute $P8, $P1, 'strval'
    getattribute $P7, $P8, 'str'
    null $S3
    if_null $P7, __label_13
    set $S3, $P7
  __label_13:
.annotate 'line', 3711
# rs: $S4
    getattribute $P10, $P2, 'strval'
    getattribute $P9, $P10, 'str'
    null $S4
    if_null $P9, __label_14
    set $S4, $P9
  __label_14:
.annotate 'line', 3712
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
.annotate 'line', 3716
    .return(self)
# }
.annotate 'line', 3717

.end # optimize


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3720
    __ARG_1.'emitbinop'('iseq', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3721

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3724
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3725

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3728
    __ARG_1.'emitcompare'('eq', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3729

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3732
    __ARG_1.'emitcompare'('ne', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3733

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpEqualExpr' ]
.annotate 'line', 3678
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpNotEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3740
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3743
    new $P1, [ 'OpEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3744

.end # negated


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3747
    self.'optimizearg'()
.annotate 'line', 3748
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3749
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3750
# lnull: $I1
    $P3 = $P1.'isnull'()
    set $I1, $P3
.annotate 'line', 3751
# rnull: $I2
    $P3 = $P2.'isnull'()
    set $I2, $P3
.annotate 'line', 3752
    unless $I1 goto __label_0
# {
.annotate 'line', 3753
    unless $I2 goto __label_1
.annotate 'line', 3754
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall 'integerValue'($P3, $P4, 0)
    goto __label_2
  __label_1: # else
.annotate 'line', 3756
    new $P6, [ 'NullCheckerExpr' ]
    getattribute $P7, self, 'rexpr'
    $P6.'NullCheckerExpr'(self, $P7, 0)
    set $P5, $P6
    .return($P5)
  __label_2: # endif
# }
  __label_0: # endif
.annotate 'line', 3758
    unless $I2 goto __label_3
.annotate 'line', 3759
    new $P4, [ 'NullCheckerExpr' ]
    getattribute $P5, self, 'lexpr'
    $P4.'NullCheckerExpr'(self, $P5, 0)
    set $P3, $P4
    .return($P3)
  __label_3: # endif
.annotate 'line', 3760
    $I5 = $P1.'isliteral'()
    unless $I5 goto __label_5
    $I5 = $P2.'isliteral'()
  __label_5:
    unless $I5 goto __label_4
# {
.annotate 'line', 3761
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_6
    set $S1, $P3
  __label_6:
.annotate 'line', 3762
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_7
    set $S2, $P3
  __label_7:
.annotate 'line', 3763
    ne $S1, $S2, __label_8
# {
# switch
.annotate 'line', 3764
    set $S5, $S1
    set $S6, 'I'
    if $S5 == $S6 goto __label_11
    set $S6, 'S'
    if $S5 == $S6 goto __label_12
    goto __label_10
  __label_11: # case
.annotate 'line', 3766
# li: $I3
# predefined int
    getattribute $P3, $P1, 'numval'
    set $I3, $P3
.annotate 'line', 3767
# ri: $I4
# predefined int
    getattribute $P4, $P2, 'numval'
    set $I4, $P4
.annotate 'line', 3768
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    isne $I5, $I3, $I4
    .tailcall 'integerValue'($P5, $P6, $I5)
  __label_12: # case
.annotate 'line', 3770
# ls: $S3
    getattribute $P8, $P1, 'strval'
    getattribute $P7, $P8, 'str'
    null $S3
    if_null $P7, __label_13
    set $S3, $P7
  __label_13:
.annotate 'line', 3771
# rs: $S4
    getattribute $P10, $P2, 'strval'
    getattribute $P9, $P10, 'str'
    null $S4
    if_null $P9, __label_14
    set $S4, $P9
  __label_14:
.annotate 'line', 3772
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
.annotate 'line', 3776
    .return(self)
# }
.annotate 'line', 3777

.end # optimize


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3780
    __ARG_1.'emitbinop'('isne', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3781

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3784
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3785

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3788
    __ARG_1.'emitcompare'('ne', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3789

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3792
    __ARG_1.'emitcompare'('eq', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3793

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpNotEqualExpr' ]
.annotate 'line', 3738
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
.annotate 'line', 3803
    self.'initbinary'(__ARG_2, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 3804
    box $P1, __ARG_1
    setattribute self, 'positive', $P1
# }
.annotate 'line', 3805

.end # OpSameExpr


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3806
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3809
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 3810
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
.annotate 'line', 3811

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 3814
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
.annotate 'line', 3815

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3818
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 3819
# op: $S1
    unless $I1 goto __label_1
    set $S1, 'issame'
    goto __label_0
  __label_1:
    set $S1, 'isntsame'
  __label_0:
.annotate 'line', 3820
    __ARG_1.'emitbinop'($S1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3821

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3824
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3825

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3828
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 3829
# op: $S1
    unless $I1 goto __label_1
    set $S1, 'eq_addr'
    goto __label_0
  __label_1:
    set $S1, 'ne_addr'
  __label_0:
.annotate 'line', 3830
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3831

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3834
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 3835
# op: $S1
    unless $I1 goto __label_1
    set $S1, 'ne_addr'
    goto __label_0
  __label_1:
    set $S1, 'eq_addr'
  __label_0:
.annotate 'line', 3836
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3837

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpSameExpr' ]
.annotate 'line', 3798
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 3800
    addattribute $P0, 'positive'
.end
.namespace [ 'OpLessExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3844
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3847
    new $P1, [ 'OpGreaterEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3848

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 3851
    islt $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 3852

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3855
    __ARG_1.'emitbinop'('islt', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3856

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3859
    __ARG_1.'emitcompare'('lt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3860

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3863
    __ARG_1.'emitcompare'('ge', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3864

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpLessExpr' ]
.annotate 'line', 3842
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpGreaterExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3871
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3874
    new $P1, [ 'OpLessEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3875

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 3878
    isgt $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 3879

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3882
    __ARG_1.'emitbinop'('isgt', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3883

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3886
    __ARG_1.'emitcompare'('gt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3887

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3890
    __ARG_1.'emitcompare'('le', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3891

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpGreaterExpr' ]
.annotate 'line', 3869
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpLessEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3898
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3901
    new $P1, [ 'OpGreaterExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3902

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 3905
    isle $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 3906

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3909
    __ARG_1.'emitbinop'('isle', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3910

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3913
    __ARG_1.'emitcompare'('le', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3914

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3917
    __ARG_1.'emitcompare'('gt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3918

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpLessEqualExpr' ]
.annotate 'line', 3896
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpGreaterEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3925
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3928
    new $P1, [ 'OpLessExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3929

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 3932
    isge $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 3933

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3936
    __ARG_1.'emitbinop'('isge', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3937

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3940
    __ARG_1.'emitcompare'('ge', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3941

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3944
    __ARG_1.'emitcompare'('lt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3945

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpGreaterEqualExpr' ]
.annotate 'line', 3923
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpBaseBoolExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3954
    .return('I')
# }
.annotate 'line', 3955

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBaseBoolExpr' ]
.annotate 'line', 3950
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
.annotate 'line', 3964
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3965

.end # OpBoolAndExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3968
    self.'optimizearg'()
.annotate 'line', 3969
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'isintegerliteral'()
    if_null $P2, __label_0
    unless $P2 goto __label_0
# {
.annotate 'line', 3970
# var lval: $P1
    getattribute $P4, self, 'lexpr'
    getattribute $P1, $P4, 'numval'
.annotate 'line', 3971
# ln: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 3972
    eq $I1, 0, __label_1
.annotate 'line', 3973
    getattribute $P2, self, 'rexpr'
    .return($P2)
    goto __label_2
  __label_1: # else
.annotate 'line', 3975
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall 'integerValue'($P3, $P4, $I1)
  __label_2: # endif
# }
  __label_0: # endif
.annotate 'line', 3977
    .return(self)
# }
.annotate 'line', 3978

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3981
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
.annotate 'line', 3982
    getattribute $P1, self, 'lexpr'
    $I1 = $P1.'issimple'()
    unless $I1 goto __label_5
    getattribute $P2, self, 'rexpr'
    $I1 = $P2.'issimple'()
  __label_5:
    unless $I1 goto __label_3
# {
.annotate 'line', 3983
# lreg: $S2
    $P3 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P3, __label_6
    set $S2, $P3
  __label_6:
.annotate 'line', 3984
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_7
    set $S3, $P1
  __label_7:
.annotate 'line', 3985
    __ARG_1.'emitbinop'('and', $S1, $S2, $S3)
# }
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 3988
# l: $S4
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S4
    if_null $P1, __label_8
    set $S4, $P1
  __label_8:
.annotate 'line', 3989
    getattribute $P1, self, 'lexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 3990
    __ARG_1.'emitunless'($S1, $S4)
.annotate 'line', 3991
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 3992
    __ARG_1.'emitlabel'($S4)
# }
  __label_4: # endif
# }
.annotate 'line', 3994

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBoolAndExpr' ]
.annotate 'line', 3960
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
.annotate 'line', 4003
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4004

.end # OpBoolOrExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4007
    self.'optimizearg'()
.annotate 'line', 4008
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'isintegerliteral'()
    if_null $P2, __label_0
    unless $P2 goto __label_0
# {
.annotate 'line', 4009
# var lval: $P1
    getattribute $P4, self, 'lexpr'
    getattribute $P1, $P4, 'numval'
.annotate 'line', 4010
# ln: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 4011
    ne $I1, 0, __label_1
.annotate 'line', 4012
    getattribute $P2, self, 'rexpr'
    .return($P2)
    goto __label_2
  __label_1: # else
.annotate 'line', 4014
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall 'integerValue'($P3, $P4, $I1)
  __label_2: # endif
# }
  __label_0: # endif
.annotate 'line', 4016
    .return(self)
# }
.annotate 'line', 4017

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4020
# res: $S1
    null $S1
.annotate 'line', 4021
    if_null __ARG_2, __label_0
.annotate 'line', 4022
    set $S1, __ARG_2
    goto __label_1
  __label_0: # else
.annotate 'line', 4024
    $P1 = self.'tempreg'('I')
    set $S1, $P1
  __label_1: # endif
.annotate 'line', 4025
    getattribute $P1, self, 'lexpr'
    $I1 = $P1.'issimple'()
    unless $I1 goto __label_4
    getattribute $P2, self, 'rexpr'
    $I1 = $P2.'issimple'()
  __label_4:
    unless $I1 goto __label_2
# {
.annotate 'line', 4026
# lreg: $S2
    $P3 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P3, __label_5
    set $S2, $P3
  __label_5:
.annotate 'line', 4027
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_6
    set $S3, $P1
  __label_6:
.annotate 'line', 4028
    __ARG_1.'emitbinop'('or', $S1, $S2, $S3)
# }
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 4031
# l: $S4
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S4
    if_null $P1, __label_7
    set $S4, $P1
  __label_7:
.annotate 'line', 4032
    getattribute $P1, self, 'lexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4033
    __ARG_1.'emitif'($S1, $S4)
.annotate 'line', 4034
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4035
    __ARG_1.'emitlabel'($S4)
# }
  __label_3: # endif
# }
.annotate 'line', 4037

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBoolOrExpr' ]
.annotate 'line', 3999
    get_class $P1, [ 'OpBaseBoolExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpBaseBinExpr' ]
.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBaseBinExpr' ]
.annotate 'line', 4042
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
.annotate 'line', 4052
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4053

.end # OpBinAndExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4056
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
.annotate 'line', 4057
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
  __label_3:
.annotate 'line', 4058
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_4
    set $S3, $P1
  __label_4:
.annotate 'line', 4059
    self.'annotate'(__ARG_1)
.annotate 'line', 4060
    __ARG_1.'emitbinop'('band', $S1, $S2, $S3)
# }
.annotate 'line', 4061

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4064
    band $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4065

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBinAndExpr' ]
.annotate 'line', 4048
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
.annotate 'line', 4074
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4075

.end # OpBinOrExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4078
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
.annotate 'line', 4079
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
  __label_3:
.annotate 'line', 4080
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_4
    set $S3, $P1
  __label_4:
.annotate 'line', 4081
    self.'annotate'(__ARG_1)
.annotate 'line', 4082
    __ARG_1.'emitbinop'('bor', $S1, $S2, $S3)
# }
.annotate 'line', 4083

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4086
    bor $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4087

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBinOrExpr' ]
.annotate 'line', 4070
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
.annotate 'line', 4096
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4097

.end # OpBinXorExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4100
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
.annotate 'line', 4101
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
  __label_3:
.annotate 'line', 4102
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_4
    set $S3, $P1
  __label_4:
.annotate 'line', 4103
    self.'annotate'(__ARG_1)
.annotate 'line', 4104
    __ARG_1.'emitbinop'('bxor', $S1, $S2, $S3)
# }
.annotate 'line', 4105

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4108
    bxor $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4109

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBinXorExpr' ]
.annotate 'line', 4092
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
.annotate 'line', 4119
    self.'Expr'(__ARG_1, __ARG_2)
# switch-case
.annotate 'line', 4121
    isa $I1, __ARG_3, [ 'ConcatString' ]
    if $I1 goto __label_2
.annotate 'line', 4128
    isa $I1, __ARG_4, [ 'ConcatString' ]
    if $I1 goto __label_3
    goto __label_1
  __label_2: # case
.annotate 'line', 4122
    getattribute $P2, __ARG_3, 'values'
    setattribute self, 'values', $P2
.annotate 'line', 4123
    isa $I2, __ARG_4, [ 'ConcatString' ]
    unless $I2 goto __label_4
.annotate 'line', 4124
    getattribute $P3, self, 'values'
    getattribute $P4, __ARG_4, 'values'
    $P3.'append'($P4)
    goto __label_5
  __label_4: # else
.annotate 'line', 4126
    getattribute $P5, self, 'values'
# predefined push
    push $P5, __ARG_4
  __label_5: # endif
    goto __label_0 # break
  __label_3: # case
.annotate 'line', 4129
    getattribute $P7, __ARG_4, 'values'
    setattribute self, 'values', $P7
.annotate 'line', 4130
    getattribute $P8, self, 'values'
    $P8.'unshift'(__ARG_3)
    goto __label_0 # break
  __label_1: # default
.annotate 'line', 4133
    root_new $P10, ['parrot';'ResizablePMCArray']
    push $P10, __ARG_3
    push $P10, __ARG_4
    setattribute self, 'values', $P10
  __label_0: # switch end
# }
.annotate 'line', 4135

.end # ConcatString


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4136
    .return('S')
# }

.end # checkresult


.sub 'getregs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4139
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 4140
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4141
    new $P2, ['FixedStringArray'], $I1
.annotate 'line', 4142
# i: $I2
    null $I2
# for loop
.annotate 'line', 4143
    null $I2
  __label_2: # for condition
    ge $I2, $I1, __label_1
.annotate 'line', 4144
# predefined string
    $P4 = $P1[$I2]
    $P3 = $P4.'emit_get'(__ARG_1)
    set $S1, $P3
    $P2[$I2] = $S1
  __label_0: # for iteration
.annotate 'line', 4143
    inc $I2
    goto __label_2
  __label_1: # for end
.annotate 'line', 4145
    .return($P2)
# }
.annotate 'line', 4146

.end # getregs


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4149
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4150
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4151
# auxreg: $S1
    set $S1, '$S0'
.annotate 'line', 4152
    self.'annotate'(__ARG_1)
.annotate 'line', 4153
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 4154
# i: $I2
    set $I2, 2
  __label_2: # for condition
    ge $I2, $I1, __label_1
.annotate 'line', 4155
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'($S1, $P2)
  __label_0: # for iteration
.annotate 'line', 4154
    inc $I2
    goto __label_2
  __label_1: # for end
.annotate 'line', 4156
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
.annotate 'line', 4157

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4160
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4161
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4162
# auxreg: $S1
    $P2 = self.'tempreg'('S')
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
  __label_0:
.annotate 'line', 4163
    self.'annotate'(__ARG_1)
.annotate 'line', 4164
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 4165
# i: $I2
    set $I2, 2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 4166
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'($S1, $P2)
  __label_1: # for iteration
.annotate 'line', 4165
    inc $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 4167
    .return($S1)
# }
.annotate 'line', 4168

.end # emit_get


.sub 'emit_concat_to' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4171
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4172
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4173
    self.'annotate'(__ARG_1)
# for loop
.annotate 'line', 4174
# i: $I2
    null $I2
  __label_2: # for condition
    ge $I2, $I1, __label_1
.annotate 'line', 4175
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'(__ARG_2, $P2)
  __label_0: # for iteration
.annotate 'line', 4174
    inc $I2
    goto __label_2
  __label_1: # for end
# }
.annotate 'line', 4176

.end # emit_concat_to


.sub 'emit_concat_set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4179
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4180
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4181
    self.'annotate'(__ARG_1)
.annotate 'line', 4182
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'(__ARG_2, $P2, $P3)
# for loop
.annotate 'line', 4183
# i: $I2
    set $I2, 2
  __label_2: # for condition
    ge $I2, $I1, __label_1
.annotate 'line', 4184
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'(__ARG_2, $P2)
  __label_0: # for iteration
.annotate 'line', 4183
    inc $I2
    goto __label_2
  __label_1: # for end
# }
.annotate 'line', 4185

.end # emit_concat_set

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ConcatString' ]
.annotate 'line', 4114
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 4116
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
.annotate 'line', 4194
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4195

.end # OpAddExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4198
    self.'optimizearg'()
.annotate 'line', 4199
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4200
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4201
# ltype: $S1
    $P10 = $P1.'checkresult'()
    null $S1
    if_null $P10, __label_0
    set $S1, $P10
  __label_0:
.annotate 'line', 4202
# rtype: $S2
    $P10 = $P2.'checkresult'()
    null $S2
    if_null $P10, __label_1
    set $S2, $P10
  __label_1:
.annotate 'line', 4203
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_3
    $I3 = $P2.'isliteral'()
  __label_3:
    unless $I3 goto __label_2
# {
.annotate 'line', 4204
    iseq $I4, $S1, 'S'
    unless $I4 goto __label_5
    iseq $I4, $S2, 'S'
  __label_5:
    unless $I4 goto __label_4
# {
.annotate 'line', 4209
# var etok: $P3
    getattribute $P3, $P1, 'strval'
.annotate 'line', 4210
# var rtok: $P4
    getattribute $P4, $P2, 'strval'
.annotate 'line', 4211
# var t: $P5
    isa $I3, $P3, [ 'TokenSingleQuoted' ]
    unless $I3 goto __label_8
.annotate 'line', 4212
    isa $I3, $P4, [ 'TokenSingleQuoted' ]
  __label_8:
    unless $I3 goto __label_7
.annotate 'line', 4214
    new $P10, [ 'TokenSingleQuoted' ]
    getattribute $P11, $P3, 'file'
    getattribute $P12, $P3, 'line'
# predefined string
.annotate 'line', 4215
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
.annotate 'line', 4217
    new $P15, [ 'TokenQuoted' ]
    getattribute $P16, $P3, 'file'
    getattribute $P17, $P3, 'line'
# predefined string
.annotate 'line', 4218
    $P18 = $P3.'getasquoted'()
    set $S6, $P18
# predefined string
    $P19 = $P4.'getasquoted'()
    set $S7, $P19
    concat $S8, $S6, $S7
    $P15.'TokenQuoted'($P16, $P17, $S8)
    set $P5, $P15
  __label_6:
.annotate 'line', 4219
    new $P11, [ 'StringLiteral' ]
    getattribute $P12, self, 'owner'
    $P11.'StringLiteral'($P12, $P5)
    set $P10, $P11
    .return($P10)
# }
  __label_4: # endif
.annotate 'line', 4221
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_10
    iseq $I3, $S2, 'I'
  __label_10:
    unless $I3 goto __label_9
# {
.annotate 'line', 4222
# var lval: $P6
    getattribute $P6, $P1, 'numval'
.annotate 'line', 4223
# ln: $I1
    set $P10, $P6
    set $I1, $P10
.annotate 'line', 4224
# var rval: $P7
    getattribute $P7, $P2, 'numval'
.annotate 'line', 4225
# rn: $I2
    set $P10, $P7
    set $I2, $P10
.annotate 'line', 4226
    getattribute $P10, self, 'owner'
    getattribute $P11, self, 'start'
    add $I3, $I1, $I2
    .tailcall 'integerValue'($P10, $P11, $I3)
# }
  __label_9: # endif
# {
.annotate 'line', 4229
    $P10 = 'floatresult'($S1, $S2)
    if_null $P10, __label_11
    unless $P10 goto __label_11
# {
.annotate 'line', 4230
# var lvalf: $P8
    getattribute $P8, $P1, 'numval'
.annotate 'line', 4231
# lf: $N1
# predefined string
    set $S3, $P8
    set $N1, $S3
.annotate 'line', 4232
# var rvalf: $P9
    getattribute $P9, $P2, 'numval'
.annotate 'line', 4233
# rf: $N2
# predefined string
    set $S3, $P9
    set $N2, $S3
.annotate 'line', 4234
    getattribute $P10, self, 'owner'
    getattribute $P11, self, 'start'
    add $N3, $N1, $N2
    .tailcall 'floatValue'($P10, $P11, $N3)
# }
  __label_11: # endif
# }
# }
  __label_2: # endif
.annotate 'line', 4238
    iseq $I3, $S1, 'S'
    unless $I3 goto __label_13
    iseq $I3, $S2, 'S'
  __label_13:
    unless $I3 goto __label_12
# {
.annotate 'line', 4239
    new $P11, [ 'ConcatString' ]
    getattribute $P12, self, 'owner'
    getattribute $P13, self, 'start'
    $P11.'ConcatString'($P12, $P13, $P1, $P2)
    set $P10, $P11
    .return($P10)
# }
  __label_12: # endif
.annotate 'line', 4241
    .return(self)
# }
.annotate 'line', 4242

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4245
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 4246
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
  __label_1:
.annotate 'line', 4247
    ne $S1, $S2, __label_2
.annotate 'line', 4248
    .return($S1)
  __label_2: # endif
.annotate 'line', 4249
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_4
    iseq $I1, $S2, 'S'
  __label_4:
    unless $I1 goto __label_3
.annotate 'line', 4250
    .return('S')
  __label_3: # endif
.annotate 'line', 4251
    iseq $I1, $S1, 'S'
    unless $I1 goto __label_6
    iseq $I1, $S2, 'I'
  __label_6:
    unless $I1 goto __label_5
.annotate 'line', 4252
    .return('S')
  __label_5: # endif
.annotate 'line', 4253
    $P1 = 'floatresult'($S1, $S2)
    if_null $P1, __label_7
    unless $P1 goto __label_7
.annotate 'line', 4254
    .return('N')
  __label_7: # endif
.annotate 'line', 4255
    .return('I')
# }
.annotate 'line', 4256

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4259
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4260
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4261
# restype: $S1
    $P3 = self.'checkresult'()
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
  __label_0:
.annotate 'line', 4262
# ltype: $S2
    $P3 = $P1.'checkresult'()
    null $S2
    if_null $P3, __label_1
    set $S2, $P3
  __label_1:
.annotate 'line', 4263
# rtype: $S3
    $P3 = $P2.'checkresult'()
    null $S3
    if_null $P3, __label_2
    set $S3, $P3
  __label_2:
.annotate 'line', 4265
# rleft: $S4
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_3
    set $S4, $P3
  __label_3:
.annotate 'line', 4266
# rright: $S5
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S5
    if_null $P3, __label_4
    set $S5, $P3
  __label_4:
.annotate 'line', 4267
    ne $S1, 'S', __label_5
# {
.annotate 'line', 4268
    isne $I1, $S2, 'S'
    if $I1 goto __label_8
    isne $I1, $S3, 'S'
  __label_8:
    unless $I1 goto __label_7
# {
.annotate 'line', 4269
# aux: $S6
    $P3 = self.'tempreg'('S')
    null $S6
    if_null $P3, __label_9
    set $S6, $P3
  __label_9:
.annotate 'line', 4270
    eq $S2, 'S', __label_10
# {
.annotate 'line', 4271
    __ARG_1.'emitset'($S6, $S4)
.annotate 'line', 4272
    set $S4, $S6
# }
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 4275
    __ARG_1.'emitset'($S6, $S5)
.annotate 'line', 4276
    set $S5, $S6
# }
  __label_11: # endif
# }
  __label_7: # endif
.annotate 'line', 4279
    __ARG_1.'emitconcat'(__ARG_2, $S4, $S5)
# }
    goto __label_6
  __label_5: # else
# {
.annotate 'line', 4282
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_14
    isne $I1, $S2, 'I'
    if $I1 goto __label_15
    isne $I1, $S3, 'I'
  __label_15:
  __label_14:
    unless $I1 goto __label_12
# {
.annotate 'line', 4283
# l: $S7
    null $S7
.annotate 'line', 4284
    ne $S2, 'I', __label_16
    set $S7, $S4
    goto __label_17
  __label_16: # else
# {
.annotate 'line', 4286
    $P3 = self.'tempreg'('I')
    set $S7, $P3
.annotate 'line', 4287
    __ARG_1.'emitset'($S7, $S4)
# }
  __label_17: # endif
.annotate 'line', 4289
# r: $S8
    null $S8
.annotate 'line', 4290
    ne $S3, 'I', __label_18
    set $S8, $S5
    goto __label_19
  __label_18: # else
# {
.annotate 'line', 4292
    $P3 = self.'tempreg'('I')
    set $S8, $P3
.annotate 'line', 4293
    __ARG_1.'emitset'($S8, $S5)
# }
  __label_19: # endif
.annotate 'line', 4295
    __ARG_1.'emitadd'(__ARG_2, $S7, $S8)
# }
    goto __label_13
  __label_12: # else
.annotate 'line', 4298
    __ARG_1.'emitadd'(__ARG_2, $S4, $S5)
  __label_13: # endif
# }
  __label_6: # endif
# }
.annotate 'line', 4300

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpAddExpr' ]
.annotate 'line', 4190
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
.annotate 'line', 4309
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4310

.end # OpSubExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4313
    self.'optimizearg'()
.annotate 'line', 4314
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4315
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4316
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_1
    $I3 = $P2.'isliteral'()
  __label_1:
    unless $I3 goto __label_0
# {
.annotate 'line', 4317
# ltype: $S1
    $P5 = $P1.'checkresult'()
    null $S1
    if_null $P5, __label_2
    set $S1, $P5
  __label_2:
.annotate 'line', 4318
# rtype: $S2
    $P5 = $P2.'checkresult'()
    null $S2
    if_null $P5, __label_3
    set $S2, $P5
  __label_3:
.annotate 'line', 4319
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_5
    iseq $I3, $S2, 'I'
  __label_5:
    unless $I3 goto __label_4
# {
.annotate 'line', 4320
# var lval: $P3
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4321
# ln: $I1
    set $P5, $P3
    set $I1, $P5
.annotate 'line', 4322
# var rval: $P4
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4323
# rn: $I2
    set $P5, $P4
    set $I2, $P5
.annotate 'line', 4324
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    sub $I3, $I1, $I2
    .tailcall 'integerValue'($P5, $P6, $I3)
# }
  __label_4: # endif
# }
  __label_0: # endif
.annotate 'line', 4327
    .return(self)
# }
.annotate 'line', 4328

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4331
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 4332
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
  __label_1:
.annotate 'line', 4333
    ne $S1, $S2, __label_2
.annotate 'line', 4334
    .return($S1)
  __label_2: # endif
.annotate 'line', 4335
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_4
    iseq $I1, $S2, 'N'
  __label_4:
    unless $I1 goto __label_3
.annotate 'line', 4336
    .return('N')
  __label_3: # endif
.annotate 'line', 4337
    iseq $I1, $S1, 'N'
    unless $I1 goto __label_6
    iseq $I1, $S2, 'I'
  __label_6:
    unless $I1 goto __label_5
.annotate 'line', 4338
    .return('N')
  __label_5: # endif
.annotate 'line', 4339
    .return('I')
# }
.annotate 'line', 4340

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4343
# lreg: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 4344
# rreg: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
  __label_1:
.annotate 'line', 4345
    __ARG_1.'emitsub'(__ARG_2, $S1, $S2)
# }
.annotate 'line', 4346

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpSubExpr' ]
.annotate 'line', 4305
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
.annotate 'line', 4355
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4356

.end # OpMulExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4359
    self.'optimizearg'()
.annotate 'line', 4360
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4361
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4362
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_1
    $I3 = $P2.'isliteral'()
  __label_1:
    unless $I3 goto __label_0
# {
.annotate 'line', 4363
# ltype: $S1
    $P7 = $P1.'checkresult'()
    null $S1
    if_null $P7, __label_2
    set $S1, $P7
  __label_2:
.annotate 'line', 4364
# rtype: $S2
    $P7 = $P2.'checkresult'()
    null $S2
    if_null $P7, __label_3
    set $S2, $P7
  __label_3:
.annotate 'line', 4365
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_5
    iseq $I3, $S2, 'I'
  __label_5:
    unless $I3 goto __label_4
# {
.annotate 'line', 4366
# var lval: $P3
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4367
# ln: $I1
    set $P7, $P3
    set $I1, $P7
.annotate 'line', 4368
# var rval: $P4
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4369
# rn: $I2
    set $P7, $P4
    set $I2, $P7
.annotate 'line', 4370
    getattribute $P7, self, 'owner'
    getattribute $P8, self, 'start'
    mul $I3, $I1, $I2
    .tailcall 'integerValue'($P7, $P8, $I3)
# }
  __label_4: # endif
# {
.annotate 'line', 4373
    $P7 = 'floatresult'($S1, $S2)
    if_null $P7, __label_6
    unless $P7 goto __label_6
# {
.annotate 'line', 4374
# var lvalf: $P5
    getattribute $P5, $P1, 'numval'
.annotate 'line', 4375
# lf: $N1
# predefined string
    set $S3, $P5
    set $N1, $S3
.annotate 'line', 4376
# var rvalf: $P6
    getattribute $P6, $P2, 'numval'
.annotate 'line', 4377
# rf: $N2
# predefined string
    set $S3, $P6
    set $N2, $S3
.annotate 'line', 4378
    getattribute $P7, self, 'owner'
    getattribute $P8, self, 'start'
    mul $N3, $N1, $N2
    .tailcall 'floatValue'($P7, $P8, $N3)
# }
  __label_6: # endif
# }
# }
  __label_0: # endif
.annotate 'line', 4382
    .return(self)
# }
.annotate 'line', 4383

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4386
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4387
# rl: $S1
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'checkresult'()
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
  __label_0:
.annotate 'line', 4388
# rr: $S2
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'checkresult'()
    null $S2
    if_null $P2, __label_1
    set $S2, $P2
  __label_1:
.annotate 'line', 4389
    ne $S1, $S2, __label_2
.annotate 'line', 4390
    .return($S1)
  __label_2: # endif
.annotate 'line', 4391
    ne $S1, 'S', __label_3
.annotate 'line', 4392
    .return('S')
    goto __label_4
  __label_3: # else
.annotate 'line', 4394
    .return('N')
  __label_4: # endif
# }
.annotate 'line', 4395

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4398
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4399
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4400
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
  __label_0:
.annotate 'line', 4401
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_1
    set $S2, $P3
  __label_1:
.annotate 'line', 4402
# lreg: $S3
    null $S3
# rreg: $S4
    null $S4
.annotate 'line', 4403
    ne $S1, 'S', __label_2
# {
.annotate 'line', 4404
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 4405
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 4406
# rval: $S5
    null $S5
# switch
.annotate 'line', 4407
    set $S7, $S2
    set $S8, 'I'
    if $S7 == $S8 goto __label_5
    goto __label_4
  __label_5: # case
.annotate 'line', 4409
    set $S5, $S4
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 4412
    $P3 = self.'tempreg'('I')
    set $S5, $P3
.annotate 'line', 4413
    __ARG_1.'emitset'($S5, $S4)
  __label_3: # switch end
.annotate 'line', 4415
    self.'annotate'(__ARG_1)
.annotate 'line', 4416
    __ARG_1.'emitrepeat'(__ARG_2, $S3, $S5)
.annotate 'line', 4417
    .return()
# }
  __label_2: # endif
.annotate 'line', 4419
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
.annotate 'line', 4420
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 4421
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 4422
    __ARG_1.'emitmul'(__ARG_2, $S3, $S4)
.annotate 'line', 4423
    .return()
# }
  __label_6: # endif
.annotate 'line', 4428
    ne $S1, 'N', __label_10
# {
.annotate 'line', 4429
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 4430
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 4431
# rval: $S6
    null $S6
# switch
.annotate 'line', 4432
    set $S7, $S2
    set $S8, 'I'
    if $S7 == $S8 goto __label_13
    set $S8, 'N'
    if $S7 == $S8 goto __label_14
    goto __label_12
  __label_13: # case
.annotate 'line', 4434
    $P3 = self.'tempreg'('N')
    set $S6, $P3
.annotate 'line', 4435
    __ARG_1.'emitset'($S6, $S4)
.annotate 'line', 4436
    set $S6, $S4
    goto __label_11 # break
  __label_14: # case
.annotate 'line', 4439
    set $S6, $S4
    goto __label_11 # break
  __label_12: # default
.annotate 'line', 4442
    $P4 = self.'tempreg'('N')
    set $S6, $P4
.annotate 'line', 4443
    __ARG_1.'emitset'($S6, $S4)
  __label_11: # switch end
.annotate 'line', 4445
    set $S7, __ARG_2
    eq $S7, '', __label_15
# {
.annotate 'line', 4446
    self.'annotate'(__ARG_1)
.annotate 'line', 4447
    __ARG_1.'emitmul'(__ARG_2, $S3, $S6)
# }
  __label_15: # endif
.annotate 'line', 4449
    .return()
# }
  __label_10: # endif
.annotate 'line', 4452
# nleft: $I1
    null $I1
# nright: $I2
    null $I2
.annotate 'line', 4453
    $P3 = $P1.'issimple'()
    isfalse $I3, $P3
    if $I3 goto __label_18
    $I3 = $P1.'isidentifier'()
  __label_18:
    unless $I3 goto __label_16
# {
.annotate 'line', 4454
    $P5 = self.'checkresult'()
    $P4 = self.'tempreg'($P5)
    set $S3, $P4
.annotate 'line', 4455
    $P1.'emit'(__ARG_1, $S3)
# }
    goto __label_17
  __label_16: # else
# {
.annotate 'line', 4458
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4459
    set $S3, $I1
# }
  __label_17: # endif
.annotate 'line', 4461
    $P3 = $P2.'issimple'()
    isfalse $I3, $P3
    if $I3 goto __label_21
    $I3 = $P2.'isidentifier'()
  __label_21:
    unless $I3 goto __label_19
# {
.annotate 'line', 4462
    $P5 = self.'checkresult'()
    $P4 = self.'tempreg'($P5)
    set $S4, $P4
.annotate 'line', 4463
    $P2.'emit'(__ARG_1, $S4)
# }
    goto __label_20
  __label_19: # else
# {
# switch
.annotate 'line', 4466
    set $S7, $S2
    set $S8, 'S'
    if $S7 == $S8 goto __label_24
    set $S8, 'N'
    if $S7 == $S8 goto __label_25
    set $S8, 'I'
    if $S7 == $S8 goto __label_26
    goto __label_23
  __label_24: # case
.annotate 'line', 4468
    $P4 = self.'checkresult'()
    $P3 = self.'tempreg'($P4)
    set $S4, $P3
.annotate 'line', 4469
    $P2.'emit'(__ARG_1, $S4)
    goto __label_22 # break
  __label_25: # case
.annotate 'line', 4472
    $P5 = $P2.'emit_get'(__ARG_1)
    set $S4, $P5
    goto __label_22 # break
  __label_26: # case
  __label_23: # default
.annotate 'line', 4476
    $P6 = $P2.'getIntegerValue'()
    set $I2, $P6
.annotate 'line', 4477
    set $S4, $I2
    goto __label_22 # break
  __label_22: # switch end
.annotate 'line', 4478
# }
  __label_20: # endif
.annotate 'line', 4481
    self.'annotate'(__ARG_1)
.annotate 'line', 4482
    set $S7, __ARG_2
    ne $S7, '', __label_27
.annotate 'line', 4483
    $P3 = self.'checkresult'()
    __ARG_2 = self.'tempreg'($P3)
  __label_27: # endif
.annotate 'line', 4484
    __ARG_1.'emitmul'(__ARG_2, $S3, $S4)
# }
.annotate 'line', 4485

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpMulExpr' ]
.annotate 'line', 4351
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
.annotate 'line', 4494
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4495

.end # OpDivExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4498
    self.'optimizearg'()
.annotate 'line', 4499
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4500
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4501
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_1
    $I3 = $P2.'isliteral'()
  __label_1:
    unless $I3 goto __label_0
# {
.annotate 'line', 4502
# ltype: $S1
    $P5 = $P1.'checkresult'()
    null $S1
    if_null $P5, __label_2
    set $S1, $P5
  __label_2:
.annotate 'line', 4503
# rtype: $S2
    $P5 = $P2.'checkresult'()
    null $S2
    if_null $P5, __label_3
    set $S2, $P5
  __label_3:
.annotate 'line', 4504
# var lval: $P3
    null $P3
.annotate 'line', 4505
# var rval: $P4
    null $P4
.annotate 'line', 4506
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_5
    iseq $I3, $S2, 'I'
  __label_5:
    unless $I3 goto __label_4
# {
.annotate 'line', 4507
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4508
# ln: $I1
    set $P5, $P3
    set $I1, $P5
.annotate 'line', 4509
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4510
# rn: $I2
    set $P5, $P4
    set $I2, $P5
.annotate 'line', 4511
    eq $I2, 0, __label_6
.annotate 'line', 4512
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
.annotate 'line', 4515
    $P5 = 'floatresult'($S1, $S2)
    if_null $P5, __label_7
    unless $P5 goto __label_7
# {
.annotate 'line', 4516
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4517
# lf: $N1
# predefined string
    set $S3, $P3
    set $N1, $S3
.annotate 'line', 4518
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4519
# rf: $N2
# predefined string
    set $S3, $P4
    set $N2, $S3
.annotate 'line', 4520
    set $N3, 0
    eq $N2, $N3, __label_8
.annotate 'line', 4521
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
.annotate 'line', 4525
    .return(self)
# }
.annotate 'line', 4526

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4529
    .return('N')
# }
.annotate 'line', 4530

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4533
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4534
# var aux: $P2
    null $P2
.annotate 'line', 4535
# var lreg: $P3
    $P3 = $P1.'emit_get'(__ARG_1)
.annotate 'line', 4536
    $P6 = $P1.'checkresult'()
    set $S1, $P6
    eq $S1, 'N', __label_0
# {
.annotate 'line', 4537
    $P2 = self.'tempreg'('N')
.annotate 'line', 4538
    __ARG_1.'emitset'($P2, $P3)
.annotate 'line', 4539
    set $P3, $P2
# }
  __label_0: # endif
.annotate 'line', 4541
# var rexpr: $P4
    getattribute $P4, self, 'rexpr'
.annotate 'line', 4542
# var rreg: $P5
    $P5 = $P4.'emit_get'(__ARG_1)
.annotate 'line', 4543
    $P6 = $P4.'checkresult'()
    set $S1, $P6
    eq $S1, 'N', __label_1
# {
.annotate 'line', 4544
    $P2 = self.'tempreg'('N')
.annotate 'line', 4545
    __ARG_1.'emitset'($P2, $P5)
.annotate 'line', 4546
    set $P5, $P2
# }
  __label_1: # endif
.annotate 'line', 4548
    self.'annotate'(__ARG_1)
.annotate 'line', 4549
    __ARG_1.'emitdiv'(__ARG_2, $P3, $P5)
# }
.annotate 'line', 4550

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpDivExpr' ]
.annotate 'line', 4490
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
.annotate 'line', 4559
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4560

.end # OpModExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4563
# lreg: $S1
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 4564
# rreg: $S2
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
  __label_1:
.annotate 'line', 4565
    self.'annotate'(__ARG_1)
.annotate 'line', 4566
    __ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
# }
.annotate 'line', 4567

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4570
    mod $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4571

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpModExpr' ]
.annotate 'line', 4555
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
.annotate 'line', 4580
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4581

.end # OpCModExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4584
    .return('I')
# }
.annotate 'line', 4585

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4588
# lreg: $S1
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 4589
# rreg: $S2
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
  __label_1:
.annotate 'line', 4590
    self.'annotate'(__ARG_1)
.annotate 'line', 4595
    __ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
# }
.annotate 'line', 4596

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpCModExpr' ]
.annotate 'line', 4576
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
.annotate 'line', 4605
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4606

.end # OpShiftleftExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4609
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
.annotate 'line', 4610
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
  __label_3:
.annotate 'line', 4611
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_4
    set $S3, $P1
  __label_4:
.annotate 'line', 4612
    self.'annotate'(__ARG_1)
.annotate 'line', 4613
    __ARG_1.'emitbinop'('shl', $S1, $S2, $S3)
# }
.annotate 'line', 4614

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4617
    shl $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4618

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpShiftleftExpr' ]
.annotate 'line', 4601
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
.annotate 'line', 4627
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4628

.end # OpShiftrightExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4631
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
.annotate 'line', 4632
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
  __label_3:
.annotate 'line', 4633
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_4
    set $S3, $P1
  __label_4:
.annotate 'line', 4634
    self.'annotate'(__ARG_1)
.annotate 'line', 4635
    __ARG_1.'emitbinop'('shr', $S1, $S2, $S3)
# }
.annotate 'line', 4636

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4639
    shr $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4640

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpShiftrightExpr' ]
.annotate 'line', 4623
    get_class $P1, [ 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'ArgumentModifierList' ]

.sub 'ArgumentModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4649
    self.'ModifierList'(__ARG_1, __ARG_2)
# }
.annotate 'line', 4650

.end # ArgumentModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4653
# isflat: $I1
    null $I1
# isnamed: $I2
    null $I2
.annotate 'line', 4654
# setname: $S1
    set $S1, ''
.annotate 'line', 4655
    $P3 = self.'getlist'()
    iter $P4, $P3
    set $P4, 0
  __label_0: # for iteration
    unless $P4 goto __label_1
    shift $P1, $P4
# {
# switch
.annotate 'line', 4656
    $P5 = $P1.'getname'()
    set $S2, $P5
    set $S3, 'flat'
    if $S2 == $S3 goto __label_4
    set $S3, 'named'
    if $S2 == $S3 goto __label_5
    goto __label_3
  __label_4: # case
.annotate 'line', 4658
    set $I1, 1
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 4661
    set $I2, 1
# switch
.annotate 'line', 4662
    $P6 = $P1.'numargs'()
    set $I3, $P6
    null $I4
    if $I3 == $I4 goto __label_8
    set $I4, 1
    if $I3 == $I4 goto __label_9
    goto __label_7
  __label_8: # case
    goto __label_6 # break
  __label_9: # case
.annotate 'line', 4666
# var argmod: $P2
    $P2 = $P1.'getarg'(0)
.annotate 'line', 4667
    $P7 = $P2.'isstringliteral'()
    isfalse $I5, $P7
    unless $I5 goto __label_10
.annotate 'line', 4668
    getattribute $P8, self, 'start'
    'SyntaxError'('Invalid modifier', $P8)
  __label_10: # endif
.annotate 'line', 4669
    $P9 = $P2.'getPirString'()
    set $S1, $P9
    goto __label_6 # break
  __label_7: # default
.annotate 'line', 4672
    getattribute $P10, self, 'start'
    'SyntaxError'('Invalid modifier', $P10)
  __label_6: # switch end
  __label_3: # default
  __label_2: # switch end
# }
    goto __label_0
  __label_1: # endfor
.annotate 'line', 4676
    unless $I1 goto __label_11
# {
.annotate 'line', 4677
    unless $I2 goto __label_13
.annotate 'line', 4678
    __ARG_1.'print'(' :flat :named')
    goto __label_14
  __label_13: # else
.annotate 'line', 4680
    __ARG_1.'print'(' :flat')
  __label_14: # endif
# }
    goto __label_12
  __label_11: # else
.annotate 'line', 4682
    unless $I2 goto __label_15
# {
.annotate 'line', 4683
    __ARG_1.'print'(' :named')
.annotate 'line', 4684
    eq $S1, '', __label_16
.annotate 'line', 4685
    __ARG_1.'print'("(", $S1, ")")
  __label_16: # endif
# }
  __label_15: # endif
  __label_12: # endif
# }
.annotate 'line', 4687

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ArgumentModifierList' ]
.annotate 'line', 4645
    get_class $P1, [ 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'Argument' ]

.sub 'Argument' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4696
    setattribute self, 'arg', __ARG_1
.annotate 'line', 4697
    setattribute self, 'modifiers', __ARG_2
# }
.annotate 'line', 4698

.end # Argument


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4701
    getattribute $P3, self, 'arg'
    $P2 = $P3.'optimize'()
    setattribute self, 'arg', $P2
.annotate 'line', 4702
    .return(self)
# }
.annotate 'line', 4703

.end # optimize


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 4706
    getattribute $P1, self, 'arg'
    .tailcall $P1.'hascompilevalue'()
# }
.annotate 'line', 4707

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Argument' ]
.annotate 'line', 4692
    addattribute $P0, 'arg'
.annotate 'line', 4693
    addattribute $P0, 'modifiers'
.end
.namespace [ ]

.sub 'parseArgument'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4712
# var modifier: $P1
    null $P1
.annotate 'line', 4713
# var expr: $P2
    $P2 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 4714
# var t: $P3
    $P3 = __ARG_1.'get'()
.annotate 'line', 4715
    $P4 = $P3.'isop'(':')
    if_null $P4, __label_0
    unless $P4 goto __label_0
# {
.annotate 'line', 4716
    $P3 = __ARG_1.'get'()
.annotate 'line', 4717
    $P4 = $P3.'isop'('[')
    if_null $P4, __label_2
    unless $P4 goto __label_2
# {
.annotate 'line', 4718
    new $P5, [ 'ArgumentModifierList' ]
    $P5.'ArgumentModifierList'(__ARG_1, __ARG_2)
    set $P1, $P5
# }
    goto __label_3
  __label_2: # else
.annotate 'line', 4721
    'Expected'('modifier list', $P3)
  __label_3: # endif
# }
    goto __label_1
  __label_0: # else
.annotate 'line', 4724
    __ARG_1.'unget'($P3)
  __label_1: # endif
.annotate 'line', 4725
    new $P5, [ 'Argument' ]
    $P5.'Argument'($P2, $P1)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 4726

.end # parseArgument

.namespace [ 'ArgumentList' ]

.sub 'ArgumentList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4737
    setattribute self, 'owner', __ARG_1
.annotate 'line', 4738
    setattribute self, 'start', __ARG_2
.annotate 'line', 4739
# var t: $P1
    $P1 = __ARG_3.'get'()
.annotate 'line', 4740
    $P3 = $P1.'isop'(__ARG_4)
    isfalse $I1, $P3
    unless $I1 goto __label_0
# {
.annotate 'line', 4741
    __ARG_3.'unget'($P1)
.annotate 'line', 4742
.const 'Sub' $P4 = 'parseArgument'
.annotate 'line', 4743
# var args: $P2
    $P2 = 'parseList'(__ARG_3, __ARG_1, $P4)
.annotate 'line', 4744
    $P1 = __ARG_3.'get'()
.annotate 'line', 4745
    $P3 = $P1.'isop'(__ARG_4)
    isfalse $I1, $P3
    unless $I1 goto __label_1
.annotate 'line', 4746
    'SyntaxError'("Unfinished argument list", $P1)
  __label_1: # endif
.annotate 'line', 4747
    setattribute self, 'args', $P2
# }
  __label_0: # endif
# }
.annotate 'line', 4749

.end # ArgumentList


.sub 'numargs' :method
# Body
# {
.annotate 'line', 4752
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4753
    unless_null $P1, __label_1
    null $I1
    goto __label_0
  __label_1:
# predefined elements
    elements $I1, $P1
  __label_0:
    .return($I1)
# }
.annotate 'line', 4754

.end # numargs


.sub 'getrawargs' :method
# Body
# {
.annotate 'line', 4757
    getattribute $P1, self, 'args'
    .return($P1)
# }
.annotate 'line', 4758

.end # getrawargs


.sub 'getarg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 4761
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4762
    $P2 = $P1[__ARG_1]
    .return($P2)
# }
.annotate 'line', 4763

.end # getarg


.sub 'getfreearg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 4766
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4767
    $P2 = $P1[__ARG_1]
    getattribute $P3, $P2, 'arg'
    .return($P3)
# }
.annotate 'line', 4768

.end # getfreearg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4771
    getattribute $P1, self, 'args'
    'optimize_array'($P1)
.annotate 'line', 4772
    .return(self)
# }
.annotate 'line', 4773

.end # optimize


.sub 'getargvalues' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4776
# var argregs: $P1
    getattribute $P1, self, 'argregs'
.annotate 'line', 4777
    unless_null $P1, __label_0
# {
.annotate 'line', 4778
    new $P2, ['ResizableStringArray']
.annotate 'line', 4779
# pnull: $S1
    set $S1, ''
.annotate 'line', 4780
# var args: $P3
    getattribute $P3, self, 'args'
.annotate 'line', 4781
    if_null $P3, __label_1
# {
.annotate 'line', 4782
# nargs: $I1
# predefined elements
    elements $I1, $P3
# for loop
.annotate 'line', 4783
# i: $I2
    null $I2
  __label_4: # for condition
    ge $I2, $I1, __label_3
# {
.annotate 'line', 4784
# var a: $P4
    $P5 = $P3[$I2]
    getattribute $P4, $P5, 'arg'
.annotate 'line', 4785
# reg: $S2
    null $S2
.annotate 'line', 4786
    $P5 = $P4.'isnull'()
    if_null $P5, __label_5
    unless $P5 goto __label_5
# {
.annotate 'line', 4787
    ne $S1, '', __label_7
# {
.annotate 'line', 4788
    getattribute $P7, self, 'owner'
    $P6 = $P7.'tempreg'('P')
    set $S1, $P6
.annotate 'line', 4789
    __ARG_1.'emitnull'($S1)
# }
  __label_7: # endif
.annotate 'line', 4791
    set $S2, $S1
# }
    goto __label_6
  __label_5: # else
.annotate 'line', 4794
    $P5 = $P4.'emit_get'(__ARG_1)
    set $S2, $P5
  __label_6: # endif
.annotate 'line', 4795
# predefined push
    push $P2, $S2
# }
  __label_2: # for iteration
.annotate 'line', 4783
    inc $I2
    goto __label_4
  __label_3: # for end
# }
  __label_1: # endif
.annotate 'line', 4798
    setattribute self, 'argregs', $P2
# }
  __label_0: # endif
.annotate 'line', 4800
    .return($P1)
# }
.annotate 'line', 4801

.end # getargvalues


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4804
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4805
# var argreg: $P2
    $P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 4807
# sep: $S1
    set $S1, ''
.annotate 'line', 4808
# n: $I1
    $P4 = self.'numargs'()
    set $I1, $P4
# for loop
.annotate 'line', 4809
# i: $I2
    null $I2
  __label_2: # for condition
    ge $I2, $I1, __label_1
# {
.annotate 'line', 4810
    $P4 = $P2[$I2]
    __ARG_1.'print'($S1, $P4)
.annotate 'line', 4811
# var modifiers: $P3
    $P4 = $P1[$I2]
    getattribute $P3, $P4, 'modifiers'
.annotate 'line', 4812
    if_null $P3, __label_3
.annotate 'line', 4813
    $P3.'emitmodifiers'(__ARG_1)
  __label_3: # endif
.annotate 'line', 4814
    set $S1, ', '
# }
  __label_0: # for iteration
.annotate 'line', 4809
    inc $I2
    goto __label_2
  __label_1: # for end
# }
.annotate 'line', 4816

.end # emitargs

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ArgumentList' ]
.annotate 'line', 4730
    addattribute $P0, 'owner'
.annotate 'line', 4731
    addattribute $P0, 'start'
.annotate 'line', 4732
    addattribute $P0, 'args'
.annotate 'line', 4733
    addattribute $P0, 'argregs'
.end
.namespace [ ]

.sub 'arglist_hascompilevalue'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4821
    iter $P2, __ARG_1
    set $P2, 0
  __label_0: # for iteration
    unless $P2 goto __label_1
    shift $P1, $P2
.annotate 'line', 4822
    $P3 = $P1.'hascompilevalue'()
    isfalse $I1, $P3
    unless $I1 goto __label_2
.annotate 'line', 4823
    .return(0)
  __label_2: # endif
    goto __label_0
  __label_1: # endfor
.annotate 'line', 4824
    .return(1)
# }
.annotate 'line', 4825

.end # arglist_hascompilevalue

.namespace [ 'CallPredefExpr' ]

.sub 'CallPredefExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4836
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 4837
    setattribute self, 'predef', __ARG_3
.annotate 'line', 4838
    setattribute self, 'args', __ARG_4
# }
.annotate 'line', 4839

.end # CallPredefExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4842
    getattribute $P1, self, 'predef'
    .tailcall $P1.'result'()
# }
.annotate 'line', 4843

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4846
# var predef: $P1
    getattribute $P1, self, 'predef'
.annotate 'line', 4847
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 4848
    new $P3, ['ResizableStringArray']
.annotate 'line', 4849
# var arg: $P4
    null $P4
.annotate 'line', 4850
# np: $I1
    $P6 = $P1.'params'()
    set $I1, $P6
.annotate 'line', 4851
# pnull: $S1
    set $S1, ''
# switch
.annotate 'line', 4852
    set $I4, $I1
    set $I5, -1
    if $I4 == $I5 goto __label_2
    set $I5, -2
    if $I4 == $I5 goto __label_3
    goto __label_1
  __label_2: # case
.annotate 'line', 4854
    iter $P7, $P2
    set $P7, 0
  __label_4: # for iteration
    unless $P7 goto __label_5
    shift $P4, $P7
# {
.annotate 'line', 4855
# reg: $S2
    getattribute $P8, $P4, 'arg'
    $P6 = $P8.'emit_get'(__ARG_1)
    null $S2
    if_null $P6, __label_6
    set $S2, $P6
  __label_6:
.annotate 'line', 4857
    ne $S2, 'null', __label_7
# {
.annotate 'line', 4858
    ne $S1, '', __label_8
# {
.annotate 'line', 4859
    $P6 = self.'tempreg'('P')
    set $S1, $P6
.annotate 'line', 4860
    __ARG_1.'emitnull'($S1)
# }
  __label_8: # endif
.annotate 'line', 4862
    set $S2, $S1
# }
  __label_7: # endif
.annotate 'line', 4864
# predefined push
    push $P3, $S2
# }
    goto __label_4
  __label_5: # endfor
    goto __label_0 # break
  __label_3: # case
.annotate 'line', 4868
# var rawargs: $P5
    root_new $P5, ['parrot';'ResizablePMCArray']
.annotate 'line', 4869
    iter $P9, $P2
    set $P9, 0
  __label_9: # for iteration
    unless $P9 goto __label_10
    shift $P4, $P9
.annotate 'line', 4870
    getattribute $P8, $P4, 'arg'
# predefined push
    push $P5, $P8
    goto __label_9
  __label_10: # endfor
.annotate 'line', 4871
    getattribute $P10, self, 'predef'
    getattribute $P11, self, 'start'
    $P10.'expand'(__ARG_1, self, $P11, __ARG_2, $P5)
.annotate 'line', 4872
    .return()
  __label_1: # default
.annotate 'line', 4874
# n: $I2
    getattribute $P12, self, 'args'
    set $I2, $P12
# for loop
.annotate 'line', 4875
# i: $I3
    null $I3
  __label_13: # for condition
    ge $I3, $I2, __label_12
# {
.annotate 'line', 4876
    $P13 = $P2[$I3]
    getattribute $P4, $P13, 'arg'
.annotate 'line', 4877
# argtype: $S3
    $P6 = $P4.'checkresult'()
    null $S3
    if_null $P6, __label_14
    set $S3, $P6
  __label_14:
.annotate 'line', 4878
# paramtype: $S4
    $P6 = $P1.'paramtype'($I3)
    null $S4
    if_null $P6, __label_15
    set $S4, $P6
  __label_15:
.annotate 'line', 4879
# argr: $S5
    null $S5
.annotate 'line', 4880
    $P6 = $P4.'isnull'()
    if_null $P6, __label_16
    unless $P6 goto __label_16
# {
# switch
.annotate 'line', 4881
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
.annotate 'line', 4885
    $P8 = self.'tempreg'($S4)
    set $S5, $P8
.annotate 'line', 4886
    __ARG_1.'emitnull'($S5)
    goto __label_18 # break
  __label_19: # default
.annotate 'line', 4889
    ne $S1, '', __label_23
# {
.annotate 'line', 4890
    $P10 = self.'tempreg'('P')
    set $S1, $P10
.annotate 'line', 4891
    __ARG_1.'emitnull'($S1)
# }
  __label_23: # endif
.annotate 'line', 4893
    set $S5, $S1
  __label_18: # switch end
# }
    goto __label_17
  __label_16: # else
# {
.annotate 'line', 4897
    iseq $I4, $S3, $S4
    if $I4 goto __label_26
    iseq $I4, $S4, '?'
  __label_26:
    unless $I4 goto __label_24
.annotate 'line', 4898
    $P6 = $P4.'emit_get'(__ARG_1)
    set $S5, $P6
    goto __label_25
  __label_24: # else
# {
.annotate 'line', 4900
# aux: $S6
    null $S6
.annotate 'line', 4901
    $P6 = self.'tempreg'($S4)
    set $S5, $P6
# switch
.annotate 'line', 4902
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
.annotate 'line', 4904
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
.annotate 'line', 4908
    $P6 = $P4.'emit_get'(__ARG_1)
    set $S6, $P6
.annotate 'line', 4909
    __ARG_1.'emitbox'($S5, $S6)
    goto __label_33 # break
  __label_34: # default
.annotate 'line', 4912
    $P4.'emit'(__ARG_1, $S5)
  __label_33: # switch end
    goto __label_27 # break
  __label_30: # case
  __label_31: # case
  __label_32: # case
.annotate 'line', 4918
    $P8 = $P4.'emit_get'(__ARG_1)
    set $S6, $P8
.annotate 'line', 4919
    __ARG_1.'emitset'($S5, $S6)
    goto __label_27 # break
  __label_28: # default
.annotate 'line', 4922
    $P4.'emit'(__ARG_1, $S5)
  __label_27: # switch end
# }
  __label_25: # endif
# }
  __label_17: # endif
.annotate 'line', 4926
# predefined push
    push $P3, $S5
# }
  __label_11: # for iteration
.annotate 'line', 4875
    inc $I3
    goto __label_13
  __label_12: # for end
  __label_0: # switch end
.annotate 'line', 4929
    getattribute $P6, self, 'predef'
    getattribute $P8, self, 'start'
    $P6.'expand'(__ARG_1, self, $P8, __ARG_2, $P3)
# }
.annotate 'line', 4930

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CallPredefExpr' ]
.annotate 'line', 4829
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 4831
    addattribute $P0, 'predef'
.annotate 'line', 4832
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
.annotate 'line', 4942
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 4943
    setattribute self, 'funref', __ARG_4
.annotate 'line', 4944
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 4945
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_0
# {
.annotate 'line', 4946
    __ARG_1.'unget'($P1)
.annotate 'line', 4947
    new $P4, [ 'ArgumentList' ]
    $P4.'ArgumentList'(__ARG_2, __ARG_3, __ARG_1, ')')
    set $P3, $P4
    setattribute self, 'args', $P3
# }
  __label_0: # endif
# }
.annotate 'line', 4949

.end # CallExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4950
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4953
# var funref: $P1
    getattribute $P6, self, 'funref'
    $P1 = $P6.'optimize'()
.annotate 'line', 4954
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 4955
# nargs: $I1
    null $I1
.annotate 'line', 4956
    if_null $P2, __label_0
# {
.annotate 'line', 4957
    $P2 = $P2.'optimize'()
.annotate 'line', 4958
    $P6 = $P2.'numargs'()
    set $I1, $P6
# }
  __label_0: # endif
.annotate 'line', 4961
    isa $I2, $P1, [ 'MemberExpr' ]
    unless $I2 goto __label_1
.annotate 'line', 4962
    new $P7, [ 'CallMemberExpr' ]
    $P7.'CallMemberExpr'(self, $P1, $P2)
    set $P6, $P7
    .return($P6)
  __label_1: # endif
.annotate 'line', 4963
    isa $I2, $P1, [ 'MemberRefExpr' ]
    unless $I2 goto __label_2
.annotate 'line', 4964
    new $P7, [ 'CallMemberRefExpr' ]
    $P7.'CallMemberRefExpr'(self, $P1, $P2)
    set $P6, $P7
    .return($P6)
  __label_2: # endif
.annotate 'line', 4967
    $P6 = $P1.'isidentifier'()
    if_null $P6, __label_3
    unless $P6 goto __label_3
# {
.annotate 'line', 4968
# call: $S1
    $P7 = $P1.'getName'()
    null $S1
    if_null $P7, __label_4
    set $S1, $P7
  __label_4:
.annotate 'line', 4969
# var predef: $P3
    $P3 = 'findpredef'($S1, $I1)
.annotate 'line', 4970
    if_null $P3, __label_5
# {
.annotate 'line', 4971
    self.'use_predef'($S1)
.annotate 'line', 4972
# var rawargs: $P4
    ne $I1, 0, __label_7
    root_new $P6, ['parrot';'ResizablePMCArray']
    set $P4, $P6
    goto __label_6
  __label_7:
    $P4 = $P2.'getrawargs'()
  __label_6:
.annotate 'line', 4975
    isa $I2, $P3, [ 'PredefFunctionEval' ]
    unless $I2 goto __label_8
# {
.annotate 'line', 4976
    $P6 = 'arglist_hascompilevalue'($P4)
    if_null $P6, __label_9
    unless $P6 goto __label_9
# {
.annotate 'line', 4977
# var evalfun: $P5
    getattribute $P5, $P3, 'evalfun'
.annotate 'line', 4978
    getattribute $P6, self, 'owner'
    getattribute $P7, self, 'start'
    .tailcall $P5($P6, $P7, $P4)
# }
  __label_9: # endif
# }
  __label_8: # endif
.annotate 'line', 4982
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
.annotate 'line', 4986
    setattribute self, 'funref', $P1
.annotate 'line', 4987
    setattribute self, 'args', $P2
.annotate 'line', 4988
    .return(self)
# }
.annotate 'line', 4989

.end # optimize


.sub 'cantailcall' :method
# Body
# {
.annotate 'line', 4992
    .return(1)
# }
.annotate 'line', 4993

.end # cantailcall


.sub 'emitcall' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4996
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 4997
# call: $S1
    null $S1
.annotate 'line', 4998
    $P2 = $P1.'isidentifier'()
    if_null $P2, __label_0
    unless $P2 goto __label_0
# {
.annotate 'line', 4999
    $P3 = $P1.'checkIdentifier'()
    set $S1, $P3
.annotate 'line', 5000
    ne $S1, '', __label_2
.annotate 'line', 5001
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
.annotate 'line', 5004
    $P2 = $P1.'emit_get'(__ARG_1)
    set $S1, $P2
  __label_1: # endif
.annotate 'line', 5005
    .return($S1)
# }
.annotate 'line', 5006

.end # emitcall


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5009
    __ARG_1.'print'('(')
.annotate 'line', 5010
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5011
    if_null $P1, __label_0
.annotate 'line', 5012
    $P1.'emitargs'(__ARG_1)
  __label_0: # endif
.annotate 'line', 5013
    __ARG_1.'say'(')')
# }
.annotate 'line', 5014

.end # emitargs


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5017
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 5018
# call: $S1
    $P3 = self.'emitcall'(__ARG_1)
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
  __label_0:
.annotate 'line', 5019
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 5020
    if_null $P2, __label_1
.annotate 'line', 5021
    $P2.'getargvalues'(__ARG_1)
  __label_1: # endif
.annotate 'line', 5023
    self.'annotate'(__ARG_1)
.annotate 'line', 5025
    __ARG_1.'print'('    ')
.annotate 'line', 5026
    isnull $I1, __ARG_2
    not $I1
    unless $I1 goto __label_3
    set $S2, __ARG_2
    isne $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
# {
.annotate 'line', 5027
    set $S3, __ARG_2
    ne $S3, '.tailcall', __label_4
.annotate 'line', 5028
    __ARG_1.'print'('.tailcall ')
    goto __label_5
  __label_4: # else
.annotate 'line', 5030
    __ARG_1.'print'(__ARG_2, ' = ')
  __label_5: # endif
# }
  __label_2: # endif
.annotate 'line', 5033
    __ARG_1.'print'($S1)
.annotate 'line', 5034
    self.'emitargs'(__ARG_1)
# }
.annotate 'line', 5035

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CallExpr' ]
.annotate 'line', 4935
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 4937
    addattribute $P0, 'funref'
.annotate 'line', 4938
    addattribute $P0, 'args'
.end
.namespace [ 'CallMemberExpr' ]

.sub 'CallMemberExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5047
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 5048
    setattribute self, 'funref', __ARG_2
.annotate 'line', 5049
    setattribute self, 'args', __ARG_3
# }
.annotate 'line', 5050

.end # CallMemberExpr


.sub 'emitcall' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5053
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 5054
    root_new $P2, ['parrot';'ResizablePMCArray']
    $P4 = $P1.'emit_left_get'(__ARG_1)
    push $P2, $P4
    box $P3, ".'"
    push $P2, $P3
.annotate 'line', 5055
    $P5 = $P1.'get_member'()
.annotate 'line', 5054
    push $P2, $P5
    box $P3, "'"
    push $P2, $P3
# predefined join
    join $S1, "", $P2
    .return($S1)
# }
.annotate 'line', 5056

.end # emitcall

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CallMemberExpr' ]
.annotate 'line', 5043
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
.annotate 'line', 5066
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 5067
    setattribute self, 'funref', __ARG_2
.annotate 'line', 5068
    setattribute self, 'args', __ARG_3
# }
.annotate 'line', 5069

.end # CallMemberRefExpr


.sub 'emitcall' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5072
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 5073
# var right: $P2
    getattribute $P2, $P1, 'right'
.annotate 'line', 5074
# var type: $P3
    $P3 = $P2.'checkresult'()
.annotate 'line', 5075
    set $S3, $P3
    isne $I1, $S3, 'P'
    unless $I1 goto __label_1
    set $S4, $P3
    isne $I1, $S4, 'S'
  __label_1:
    unless $I1 goto __label_0
.annotate 'line', 5076
    getattribute $P4, $P1, 'start'
    'SyntaxError'("Invalid expression type in '.*'", $P4)
  __label_0: # endif
.annotate 'line', 5079
# lreg: $S1
    $P4 = $P1.'emit_left_get'(__ARG_1)
    null $S1
    if_null $P4, __label_2
    set $S1, $P4
  __label_2:
.annotate 'line', 5080
# rreg: $S2
    $P4 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_3
    set $S2, $P4
  __label_3:
.annotate 'line', 5081
    concat $S3, $S1, '.'
    concat $S3, $S3, $S2
    .return($S3)
# }
.annotate 'line', 5082

.end # emitcall

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CallMemberRefExpr' ]
.annotate 'line', 5062
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
.annotate 'line', 5092
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5093
    setattribute self, 'left', __ARG_3
# }
.annotate 'line', 5094

.end # MemberExprBase


.sub 'emit_left_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5097
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5098
# type: $S1
    $P2 = $P1.'checkresult'()
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
  __label_0:
.annotate 'line', 5099
# reg: $S2
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S2
    if_null $P2, __label_1
    set $S2, $P2
  __label_1:
.annotate 'line', 5100
    eq $S1, 'P', __label_2
# {
.annotate 'line', 5101
# auxreg: $S3
    set $S3, $S2
.annotate 'line', 5102
    $P2 = self.'tempreg'('P')
    set $S2, $P2
.annotate 'line', 5103
    __ARG_1.'emitbox'($S2, $S3)
# }
  __label_2: # endif
.annotate 'line', 5105
    .return($S2)
# }
.annotate 'line', 5106

.end # emit_left_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MemberExprBase' ]
.annotate 'line', 5087
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5089
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
.annotate 'line', 5115
    self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5116
    setattribute self, 'right', __ARG_4
# }
.annotate 'line', 5117

.end # MemberExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5118
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5121
    getattribute $P3, self, 'left'
    $P2 = $P3.'optimize'()
    setattribute self, 'left', $P2
.annotate 'line', 5122
    .return(self)
# }
.annotate 'line', 5123

.end # optimize


.sub 'get_member' :method
# Body
# {
.annotate 'line', 5126
    getattribute $P1, self, 'right'
    .return($P1)
# }
.annotate 'line', 5127

.end # get_member


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5130
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 5131
# ident: $S2
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
  __label_1:
.annotate 'line', 5132
# result: $S3
    $P1 = self.'tempreg'('P')
    null $S3
    if_null $P1, __label_2
    set $S3, $P1
  __label_2:
.annotate 'line', 5133
    self.'annotate'(__ARG_1)
.annotate 'line', 5134
    __ARG_1.'say'('    ', 'getattribute ', $S3, ', ', $S1, ", '", $S2, "'")
.annotate 'line', 5135
    .return($S3)
# }
.annotate 'line', 5136

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5139
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 5140
# ident: $S2
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
  __label_1:
.annotate 'line', 5141
    self.'annotate'(__ARG_1)
.annotate 'line', 5142
    __ARG_1.'say'('    ', 'getattribute ', __ARG_2, ', ', $S1, ", '", $S2, "'")
# }
.annotate 'line', 5143

.end # emit


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5146
    self.'emit'(__ARG_1, __ARG_2)
# }
.annotate 'line', 5147

.end # emit_init


.sub 'emit_assign' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5150
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 5151
# ident: $S2
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
  __label_1:
.annotate 'line', 5152
# value: $S3
    null $S3
.annotate 'line', 5153
    ne __ARG_2, 'P', __label_2
# {
.annotate 'line', 5155
    ne __ARG_3, 'null', __label_4
# {
.annotate 'line', 5156
    $P1 = self.'tempreg'('P')
    set __ARG_3, $P1
.annotate 'line', 5157
    __ARG_1.'emitnull'(__ARG_3)
# }
  __label_4: # endif
.annotate 'line', 5159
    set $S3, __ARG_3
# }
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 5162
    $P1 = self.'tempreg'('P')
    set $S3, $P1
.annotate 'line', 5163
    __ARG_1.'emitbox'($S3, __ARG_3)
# }
  __label_3: # endif
.annotate 'line', 5165
    __ARG_1.'say'('    ', "setattribute ", $S1, ", '", $S2, "', ", $S3)
# }
.annotate 'line', 5166

.end # emit_assign


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5169
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 5170
# ident: $S2
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
  __label_1:
.annotate 'line', 5171
# value: $S3
    $P1 = self.'tempreg'('P')
    null $S3
    if_null $P1, __label_2
    set $S3, $P1
  __label_2:
.annotate 'line', 5172
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_3
    unless $P1 goto __label_3
.annotate 'line', 5173
    __ARG_1.'emitnull'($S3)
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 5175
# rreg: $S4
    $P2 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P2, __label_5
    set $S4, $P2
  __label_5:
.annotate 'line', 5176
    $P1 = __ARG_2.'checkresult'()
    set $S5, $P1
    eq $S5, 'P', __label_6
.annotate 'line', 5177
    __ARG_1.'emitbox'($S3, $S4)
    goto __label_7
  __label_6: # else
.annotate 'line', 5179
    set $S3, $S4
  __label_7: # endif
# }
  __label_4: # endif
.annotate 'line', 5181
    __ARG_1.'say'('    ', "setattribute ", $S1, ", '", $S2, "', ", $S3)
.annotate 'line', 5182
    .return($S3)
# }
.annotate 'line', 5183

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MemberExpr' ]
.annotate 'line', 5109
    get_class $P1, [ 'MemberExprBase' ]
    addparent $P0, $P1
.annotate 'line', 5111
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
.annotate 'line', 5193
    self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5194
    setattribute self, 'right', __ARG_4
# }
.annotate 'line', 5195

.end # MemberRefExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5196
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5199
    getattribute $P3, self, 'left'
    $P2 = $P3.'optimize'()
    setattribute self, 'left', $P2
.annotate 'line', 5200
    getattribute $P3, self, 'right'
    $P2 = $P3.'optimize'()
    setattribute self, 'right', $P2
.annotate 'line', 5201
    .return(self)
# }
.annotate 'line', 5202

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5206
    getattribute $P1, self, 'start'
.annotate 'line', 5205
    'SyntaxError'('Member reference can be used only for method calls', $P1)
# }
.annotate 'line', 5207

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MemberRefExpr' ]
.annotate 'line', 5188
    get_class $P1, [ 'MemberExprBase' ]
    addparent $P0, $P1
.annotate 'line', 5190
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
.annotate 'line', 5221
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5222
    setattribute self, 'left', __ARG_4
.annotate 'line', 5223
    new $P3, [ 'SimpleArgList' ]
    $P3.'SimpleArgList'(__ARG_1, __ARG_2, ']')
    set $P2, $P3
    setattribute self, 'args', $P2
# }
.annotate 'line', 5224

.end # IndexExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5227
    getattribute $P2, self, 'left'
    $P1 = $P2.'checkresult'()
    set $S1, $P1
    ne $S1, 'S', __label_0
.annotate 'line', 5228
    .return('S')
    goto __label_1
  __label_0: # else
.annotate 'line', 5230
    .return('P')
  __label_1: # endif
# }
.annotate 'line', 5231

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5234
# var left: $P1
    getattribute $P5, self, 'left'
    $P1 = $P5.'optimize'()
.annotate 'line', 5235
    setattribute self, 'left', $P1
.annotate 'line', 5236
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 5237
    $P2.'optimizeargs'()
.annotate 'line', 5241
    $I2 = $P1.'isstringliteral'()
    unless $I2 goto __label_1
    $P5 = $P2.'numargs'()
    set $I3, $P5
    iseq $I2, $I3, 1
  __label_1:
    unless $I2 goto __label_0
# {
.annotate 'line', 5242
# var arg: $P3
    $P3 = $P2.'getarg'(0)
.annotate 'line', 5243
    $P5 = $P3.'isintegerliteral'()
    if_null $P5, __label_2
    unless $P5 goto __label_2
# {
.annotate 'line', 5244
# ival: $I1
    $P6 = $P3.'getIntegerValue'()
    set $I1, $P6
.annotate 'line', 5245
# sval: $S1
    $P5 = $P1.'get_value'()
    null $S1
    if_null $P5, __label_3
    set $S1, $P5
  __label_3:
.annotate 'line', 5246
# var t: $P4
    new $P4, [ 'TokenQuoted' ]
    getattribute $P5, self, 'start'
    getattribute $P6, $P5, 'file'
    getattribute $P7, self, 'start'
    getattribute $P8, $P7, 'line'
.annotate 'line', 5247
# predefined substr
    substr $S2, $S1, $I1, 1
    $P4.'TokenQuoted'($P6, $P8, $S2)
.annotate 'line', 5248
    new $P6, [ 'StringLiteral' ]
    getattribute $P7, self, 'owner'
    $P6.'StringLiteral'($P7, $P4)
    set $P5, $P6
    .return($P5)
# }
  __label_2: # endif
# }
  __label_0: # endif
.annotate 'line', 5251
    .return(self)
# }
.annotate 'line', 5252

.end # optimize


.sub 'emit_prep' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5255
# var regleft: $P1
    getattribute $P1, self, 'regleft'
.annotate 'line', 5256
# var argregs: $P2
    getattribute $P2, self, 'argregs'
.annotate 'line', 5257
    isnull $I1, $P1
    not $I1
    if $I1 goto __label_1
    isnull $I1, $P2
    not $I1
  __label_1:
    unless $I1 goto __label_0
.annotate 'line', 5258
    getattribute $P3, self, 'start'
    'InternalError'('wrong call to IndexExpr.emit_args', $P3)
  __label_0: # endif
.annotate 'line', 5259
    getattribute $P4, self, 'left'
    $P3 = $P4.'isidentifier'()
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 5260
    getattribute $P5, self, 'left'
    $P1 = $P5.'getIdentifier'()
    goto __label_3
  __label_2: # else
.annotate 'line', 5262
    getattribute $P6, self, 'left'
    $P1 = $P6.'emit_get'(__ARG_1)
  __label_3: # endif
.annotate 'line', 5263
    setattribute self, 'regleft', $P1
.annotate 'line', 5264
    getattribute $P3, self, 'args'
    $P2 = $P3.'getargvalues'(__ARG_1)
.annotate 'line', 5265
    setattribute self, 'argregs', $P2
# }
.annotate 'line', 5266

.end # emit_prep


.sub 'emit_aux' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5269
# var regleft: $P1
    getattribute $P1, self, 'regleft'
.annotate 'line', 5270
# var argregs: $P2
    getattribute $P2, self, 'argregs'
.annotate 'line', 5271
    isnull $I1, $P1
    if $I1 goto __label_1
    isnull $I1, $P2
  __label_1:
    unless $I1 goto __label_0
.annotate 'line', 5272
    getattribute $P3, self, 'start'
    'InternalError'('wrong call to IndexExpr.emit_aux', $P3)
  __label_0: # endif
.annotate 'line', 5273
    getattribute $P3, self, 'regleft'
    __ARG_1.'print'($P3, '[')
.annotate 'line', 5274
    getattribute $P3, self, 'argregs'
# predefined join
    join $S1, '; ', $P3
    __ARG_1.'print'($S1)
.annotate 'line', 5275
    __ARG_1.'print'(']')
# }
.annotate 'line', 5276

.end # emit_aux


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5279
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5280
# type: $S1
    $P2 = self.'checkresult'()
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
  __label_0:
.annotate 'line', 5281
    ne $S1, 'S', __label_1
# {
.annotate 'line', 5282
# var argregs: $P1
    getattribute $P1, self, 'argregs'
.annotate 'line', 5283
# nargs: $I1
    getattribute $P2, self, 'argregs'
# predefined elements
    elements $I1, $P2
.annotate 'line', 5284
    eq $I1, 1, __label_3
.annotate 'line', 5285
    getattribute $P2, self, 'start'
    'SyntaxError'('Bad string index', $P2)
  __label_3: # endif
.annotate 'line', 5286
    set $S2, __ARG_2
    ne $S2, '', __label_4
.annotate 'line', 5287
    __ARG_2 = self.'tempreg'('S')
  __label_4: # endif
.annotate 'line', 5288
    getattribute $P2, self, 'regleft'
    $P3 = $P1[0]
    __ARG_1.'say'('    ', 'substr ', __ARG_2, ', ', $P2, ', ', $P3, ', ', 1)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 5291
    self.'annotate'(__ARG_1)
.annotate 'line', 5292
    __ARG_1.'print'('    ', __ARG_2, ' = ')
.annotate 'line', 5293
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5294
    __ARG_1.'say'('')
# }
  __label_2: # endif
# }
.annotate 'line', 5296

.end # emit


.sub 'emit_assign' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5299
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5300
    self.'annotate'(__ARG_1)
.annotate 'line', 5301
    __ARG_1.'print'('    ')
.annotate 'line', 5302
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5303
    __ARG_1.'say'(' = ', __ARG_3)
# }
.annotate 'line', 5304

.end # emit_assign


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5307
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5308
# rreg: $S1
    null $S1
.annotate 'line', 5309
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_0
    unless $P1 goto __label_0
# {
.annotate 'line', 5310
    $P2 = self.'tempreg'('P')
    set $S1, $P2
.annotate 'line', 5311
    __ARG_1.'emitnull'($S1)
# }
    goto __label_1
  __label_0: # else
.annotate 'line', 5314
    $P1 = __ARG_2.'emit_get'(__ARG_1)
    set $S1, $P1
  __label_1: # endif
.annotate 'line', 5315
    self.'annotate'(__ARG_1)
.annotate 'line', 5316
    __ARG_1.'print'('    ')
.annotate 'line', 5317
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5318
    __ARG_1.'say'(' = ', $S1)
.annotate 'line', 5319
    .return($S1)
# }
.annotate 'line', 5320

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IndexExpr' ]
.annotate 'line', 5212
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5214
    addattribute $P0, 'left'
.annotate 'line', 5215
    addattribute $P0, 'regleft'
.annotate 'line', 5216
    addattribute $P0, 'args'
.annotate 'line', 5217
    addattribute $P0, 'argregs'
.end
.namespace [ 'ArrayExpr' ]

.sub 'ArrayExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5331
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5332
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5333
    $P2 = $P1.'isop'(']')
    isfalse $I1, $P2
    unless $I1 goto __label_0
# {
.annotate 'line', 5334
    __ARG_1.'unget'($P1)
.annotate 'line', 5335
.const 'Sub' $P3 = 'parseExpr'
.annotate 'line', 5336
    $P4 = 'parseList'(__ARG_1, __ARG_2, $P3)
    setattribute self, 'values', $P4
.annotate 'line', 5337
    $P1 = __ARG_1.'get'()
.annotate 'line', 5338
    $P2 = $P1.'isop'(']')
    isfalse $I1, $P2
    unless $I1 goto __label_2
.annotate 'line', 5339
    'Expected'("']' or ','", $P1)
  __label_2: # endif
# }
    goto __label_1
  __label_0: # else
.annotate 'line', 5342
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'values', $P4
  __label_1: # endif
# }
.annotate 'line', 5343

.end # ArrayExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5344
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5347
    getattribute $P1, self, 'values'
    'optimize_array'($P1)
.annotate 'line', 5348
    .return(self)
# }
.annotate 'line', 5349

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5352
    set $S2, __ARG_2
    eq $S2, '', __label_0
# {
.annotate 'line', 5353
# value: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 5354
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
    goto __label_1
  __label_0: # else
# {
.annotate 'line', 5360
    self.'emit_init'(__ARG_1, '')
# }
  __label_1: # endif
# }
.annotate 'line', 5362

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5365
# container: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 5366
    self.'emit_init'(__ARG_1, $S1)
.annotate 'line', 5367
    .return($S1)
# }
.annotate 'line', 5368

.end # emit_get


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 5371
    self.'annotate'(__ARG_1)
.annotate 'line', 5372
# itemreg: $S1
    null $S1
.annotate 'line', 5373
# it_p: $S2
    null $S2
.annotate 'line', 5374
    eq __ARG_2, '', __label_0
# {
.annotate 'line', 5375
    __ARG_1.'say'('    ', 'root_new ', __ARG_2, ", ['parrot';'ResizablePMCArray']")
.annotate 'line', 5376
    $P2 = self.'tempreg'('P')
    set $S2, $P2
# }
  __label_0: # endif
.annotate 'line', 5378
    getattribute $P2, self, 'values'
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
# {
.annotate 'line', 5379
# type: $S3
    $P4 = $P1.'checkresult'()
    null $S3
    if_null $P4, __label_3
    set $S3, $P4
  __label_3:
# switch
.annotate 'line', 5380
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
.annotate 'line', 5382
# aux: $S4
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P2, __label_9
    set $S4, $P2
  __label_9:
.annotate 'line', 5383
    eq __ARG_2, '', __label_10
# {
.annotate 'line', 5384
    __ARG_1.'emitbox'($S2, $S4)
.annotate 'line', 5385
    set $S1, $S2
# }
  __label_10: # endif
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 5389
    $P2 = $P1.'isnull'()
    if_null $P2, __label_11
    unless $P2 goto __label_11
# {
.annotate 'line', 5390
    eq __ARG_2, '', __label_13
# {
.annotate 'line', 5391
    $P4 = self.'tempreg'('P')
    set $S1, $P4
.annotate 'line', 5392
    __ARG_1.'emitnull'($S1)
# }
  __label_13: # endif
# }
    goto __label_12
  __label_11: # else
.annotate 'line', 5396
    $P2 = $P1.'emit_get'(__ARG_1)
    set $S1, $P2
  __label_12: # endif
  __label_4: # switch end
.annotate 'line', 5398
    eq __ARG_2, '', __label_14
# {
.annotate 'line', 5399
    self.'annotate'(__ARG_1)
.annotate 'line', 5400
    __ARG_1.'emitarg2'('push', __ARG_2, $S1)
# }
  __label_14: # endif
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 5403

.end # emit_init

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ArrayExpr' ]
.annotate 'line', 5325
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5327
    addattribute $P0, 'values'
.end
.namespace [ 'HashExpr' ]

.sub 'HashExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5415
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5416
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5417
# var keys: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 5418
# var values: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 5419
    $P6 = $P1.'isop'('}')
    isfalse $I1, $P6
    unless $I1 goto __label_0
# {
.annotate 'line', 5420
    __ARG_1.'unget'($P1)
  __label_1: # do
.annotate 'line', 5421
# {
.annotate 'line', 5422
# var key: $P4
    $P4 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 5423
    'ExpectOp'(':', __ARG_1)
.annotate 'line', 5424
# var value: $P5
    $P5 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 5425
# predefined push
    push $P2, $P4
.annotate 'line', 5426
# predefined push
    push $P3, $P5
# }
  __label_3: # continue
.annotate 'line', 5428
    $P1 = __ARG_1.'get'()
    $P6 = $P1.'isop'(',')
    if_null $P6, __label_2
    if $P6 goto __label_1
  __label_2: # enddo
.annotate 'line', 5429
    $P6 = $P1.'isop'('}')
    isfalse $I1, $P6
    unless $I1 goto __label_4
.annotate 'line', 5430
    'Expected'("',' or '}'", $P1)
  __label_4: # endif
# }
  __label_0: # endif
.annotate 'line', 5432
    setattribute self, 'keys', $P2
.annotate 'line', 5433
    setattribute self, 'values', $P3
# }
.annotate 'line', 5434

.end # HashExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5435
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5438
    getattribute $P1, self, 'keys'
    'optimize_array'($P1)
.annotate 'line', 5439
    getattribute $P1, self, 'values'
    'optimize_array'($P1)
.annotate 'line', 5440
    .return(self)
# }
.annotate 'line', 5441

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5444
    self.'annotate'(__ARG_1)
.annotate 'line', 5449
    set $S6, __ARG_2
    eq $S6, '', __label_0
.annotate 'line', 5450
    __ARG_1.'say'('    ', 'root_new ', __ARG_2, ", ['parrot';'Hash']")
  __label_0: # endif
.annotate 'line', 5452
# var keys: $P1
    getattribute $P1, self, 'keys'
.annotate 'line', 5453
# var values: $P2
    getattribute $P2, self, 'values'
.annotate 'line', 5454
# n: $I1
    set $P5, $P1
    set $I1, $P5
# for loop
.annotate 'line', 5455
# i: $I2
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
# {
.annotate 'line', 5456
# var key: $P3
    $P3 = $P1[$I2]
.annotate 'line', 5457
# item: $S1
    null $S1
.annotate 'line', 5458
    $P5 = $P3.'isidentifier'()
    if_null $P5, __label_4
    unless $P5 goto __label_4
# {
.annotate 'line', 5459
# id: $S2
    $P6 = $P3.'getName'()
    null $S2
    if_null $P6, __label_6
    set $S2, $P6
  __label_6:
.annotate 'line', 5460
    $P5 = self.'tempreg'('P')
    set $S1, $P5
.annotate 'line', 5461
    __ARG_1.'say'('    ', 'get_hll_global ', $S1, ", '", $S2, "'")
# }
    goto __label_5
  __label_4: # else
.annotate 'line', 5464
    $P5 = $P3.'emit_get'(__ARG_1)
    set $S1, $P5
  __label_5: # endif
.annotate 'line', 5466
# var value: $P4
    $P4 = $P2[$I2]
.annotate 'line', 5467
# itemreg: $S3
    null $S3
# switch-case
.annotate 'line', 5469
    $I3 = $P4.'isnull'()
    if $I3 goto __label_9
.annotate 'line', 5475
    $I3 = $P4.'isidentifier'()
    if $I3 goto __label_10
    goto __label_8
  __label_9: # case
.annotate 'line', 5470
    set $S6, __ARG_2
    eq $S6, '', __label_11
# {
.annotate 'line', 5471
    $P5 = self.'tempreg'('P')
    set $S3, $P5
.annotate 'line', 5472
    __ARG_1.'emitnull'($S3)
# }
  __label_11: # endif
    goto __label_7 # break
  __label_10: # case
.annotate 'line', 5476
# s: $S4
    $P5 = $P4.'checkIdentifier'()
    null $S4
    if_null $P5, __label_12
    set $S4, $P5
  __label_12:
.annotate 'line', 5477
    isnull $I3, $S4
    not $I3
    unless $I3 goto __label_15
    isne $I3, $S4, ''
  __label_15:
    unless $I3 goto __label_13
.annotate 'line', 5478
    set $S3, $S4
    goto __label_14
  __label_13: # else
# {
.annotate 'line', 5480
# id: $S5
    $P6 = $P4.'getName'()
    null $S5
    if_null $P6, __label_16
    set $S5, $P6
  __label_16:
.annotate 'line', 5481
    getattribute $P6, self, 'owner'
    $P5 = $P6.'getvar'($S5)
    unless_null $P5, __label_17
# {
.annotate 'line', 5482
    $P7 = self.'tempreg'('P')
    set $S3, $P7
.annotate 'line', 5483
    __ARG_1.'say'('    ', 'get_hll_global ', $S3, ", '", $S5, "'")
# }
    goto __label_18
  __label_17: # else
.annotate 'line', 5486
    $P5 = $P4.'emit_get'(__ARG_1)
    set $S3, $P5
  __label_18: # endif
# }
  __label_14: # endif
    goto __label_7 # break
  __label_8: # default
.annotate 'line', 5490
    $P5 = $P4.'emit_get'(__ARG_1)
    set $S3, $P5
  __label_7: # switch end
.annotate 'line', 5492
    set $S6, __ARG_2
    eq $S6, '', __label_19
.annotate 'line', 5493
    __ARG_1.'say'('    ', __ARG_2, '[', $S1, '] = ', $S3)
  __label_19: # endif
# }
  __label_1: # for iteration
.annotate 'line', 5455
    inc $I2
    goto __label_3
  __label_2: # for end
# }
.annotate 'line', 5495

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5498
# container: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 5499
    self.'emit'(__ARG_1, $S1)
.annotate 'line', 5500
    .return($S1)
# }
.annotate 'line', 5501

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'HashExpr' ]
.annotate 'line', 5408
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5410
    addattribute $P0, 'keys'
.annotate 'line', 5411
    addattribute $P0, 'values'
.end
.namespace [ 'NewBaseExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5514
    .return('P')
# }

.end # checkresult


.sub 'parseinitializer' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5519
    new $P3, [ 'ArgumentList' ]
    getattribute $P4, self, 'owner'
    getattribute $P5, self, 'start'
    $P3.'ArgumentList'($P4, $P5, __ARG_1, ')')
    set $P2, $P3
    setattribute self, 'initializer', $P2
# }
.annotate 'line', 5520

.end # parseinitializer


.sub 'optimize_initializer' :method
# Body
# {
.annotate 'line', 5523
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5524
    if_null $P1, __label_0
.annotate 'line', 5525
    $P3 = $P1.'optimize'()
    setattribute self, 'initializer', $P3
  __label_0: # endif
# }
.annotate 'line', 5526

.end # optimize_initializer


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5529
    self.'optimize_initializer'()
.annotate 'line', 5530
    .return(self)
# }
.annotate 'line', 5531

.end # optimize


.sub 'emit_constructor' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5534
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5535
    if_null $P1, __label_0
.annotate 'line', 5536
    $P1.'getargvalues'(__ARG_1)
  __label_0: # endif
.annotate 'line', 5537
    __ARG_1.'print'('    ', __ARG_2, ".'", __ARG_3, "'(")
.annotate 'line', 5538
    if_null $P1, __label_1
.annotate 'line', 5539
    $P1.'emitargs'(__ARG_1)
  __label_1: # endif
.annotate 'line', 5540
    __ARG_1.'say'(")")
# }
.annotate 'line', 5541

.end # emit_constructor

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NewBaseExpr' ]
.annotate 'line', 5506
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5508
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
.annotate 'line', 5552
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5554
    $I2 = __ARG_4.'isstring'()
    if $I2 goto __label_1
    $I2 = __ARG_4.'isidentifier'()
  __label_1:
    not $I1, $I2
    unless $I1 goto __label_0
.annotate 'line', 5555
    'SyntaxError'("Unimplemented", __ARG_4)
  __label_0: # endif
.annotate 'line', 5556
    setattribute self, 'value', __ARG_4
.annotate 'line', 5557
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5559
    $P2 = $P1.'isop'('(')
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 5560
    self.'parseinitializer'(__ARG_1)
    goto __label_3
  __label_2: # else
.annotate 'line', 5562
    __ARG_1.'unget'($P1)
  __label_3: # endif
# }
.annotate 'line', 5563

.end # NewExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5566
# var value: $P1
    getattribute $P1, self, 'value'
.annotate 'line', 5567
    isa $I1, $P1, [ 'Token' ]
    unless $I1 goto __label_1
    $I1 = $P1.'isidentifier'()
  __label_1:
    unless $I1 goto __label_0
# {
.annotate 'line', 5570
# var name: $P2
    $P2 = $P1.'getidentifier'()
.annotate 'line', 5571
# var desc: $P3
    getattribute $P4, self, 'owner'
    $P3 = $P4.'getvar'($P2)
.annotate 'line', 5572
    isnull $I1, $P3
    not $I1
    unless $I1 goto __label_3
    $I1 = $P3.'isconst'()
  __label_3:
    unless $I1 goto __label_2
# {
.annotate 'line', 5573
    $P4 = $P3.'getid'()
    unless_null $P4, __label_4
# {
.annotate 'line', 5574
    $P1 = $P3.'getvalue'()
.annotate 'line', 5575
    isa $I2, $P1, [ 'StringLiteral' ]
    not $I1, $I2
    unless $I1 goto __label_6
.annotate 'line', 5576
    'SyntaxError'('Constant value must evaluate to a string', $P1)
  __label_6: # endif
.annotate 'line', 5577
    getattribute $P5, $P1, 'strval'
    setattribute self, 'value', $P5
# }
    goto __label_5
  __label_4: # else
.annotate 'line', 5580
    'SyntaxError'('*Constant value must evaluate to a string', $P1)
  __label_5: # endif
# }
  __label_2: # endif
# }
  __label_0: # endif
.annotate 'line', 5583
    self.'optimize_initializer'()
.annotate 'line', 5584
    .return(self)
# }
.annotate 'line', 5585

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 5588
    self.'annotate'(__ARG_1)
.annotate 'line', 5590
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5591
# numinits: $I1
    unless_null $P1, __label_1
    set $I1, -1
    goto __label_0
  __label_1:
    $I1 = $P1.'numargs'()
  __label_0:
# Constant BYNAME evaluated at compile time
# Constant BYIDENT evaluated at compile time
.annotate 'line', 5594
# type: $I2
    getattribute $P7, self, 'value'
    $P6 = $P7.'isstring'()
    if_null $P6, __label_3
    unless $P6 goto __label_3
    null $I2
    goto __label_2
  __label_3:
.annotate 'line', 5595
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
.annotate 'line', 5597
# reginit: $S1
    set $S1, ''
.annotate 'line', 5598
# regnew: $S2
    set $P6, __ARG_2
    null $S2
    if_null $P6, __label_6
    set $S2, $P6
  __label_6:
.annotate 'line', 5599
# constructor: $S3
    null $S3
# switch
.annotate 'line', 5600
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
.annotate 'line', 5605
    ne $I2, 1, __label_12
# {
.annotate 'line', 5606
    not $I5, __ARG_3
    unless $I5 goto __label_14
.annotate 'line', 5607
    $P6 = self.'tempreg'('P')
    set $S2, $P6
  __label_14: # endif
# }
    goto __label_13
  __label_12: # else
# {
.annotate 'line', 5610
# var initval: $P2
    $P2 = $P1.'getfreearg'(0)
.annotate 'line', 5611
    $P6 = $P2.'emit_get'(__ARG_1)
    set $S1, $P6
.annotate 'line', 5612
    concat $S0, ', ', $S1
    set $S1, $S0
# }
  __label_13: # endif
    goto __label_7 # break
  __label_8: # default
.annotate 'line', 5616
    eq $I2, 1, __label_15
.annotate 'line', 5617
    getattribute $P6, self, 'start'
    'SyntaxError'('Multiple init arguments not allowed here', $P6)
  __label_15: # endif
.annotate 'line', 5618
    not $I3, __ARG_3
    unless $I3 goto __label_16
.annotate 'line', 5619
    $P7 = self.'tempreg'('P')
    set $S2, $P7
  __label_16: # endif
  __label_7: # switch end
# switch
.annotate 'line', 5622
    set $I3, $I2
    null $I4
    if $I3 == $I4 goto __label_19
    set $I4, 1
    if $I3 == $I4 goto __label_20
    goto __label_18
  __label_19: # case
.annotate 'line', 5625
# name: $S4
    getattribute $P7, self, 'value'
    $P6 = $P7.'rawstring'()
    null $S4
    if_null $P6, __label_21
    set $S4, $P6
  __label_21:
.annotate 'line', 5626
# var aux: $P3
# predefined get_class
    get_class $P3, $S4
.annotate 'line', 5627
    isnull $I5, $P3
    unless $I5 goto __label_23
    $I5 = self.'dowarnings'()
  __label_23:
    unless $I5 goto __label_22
.annotate 'line', 5628
    concat $S5, "Can't locate class ", $S4
    concat $S5, $S5, " at compile time"
    getattribute $P8, self, 'value'
    'Warn'($S5, $P8)
  __label_22: # endif
.annotate 'line', 5632
    getattribute $P9, self, 'value'
    __ARG_1.'say'('    ', 'new ', $S2, ", [ ", $P9, " ]", $S1)
.annotate 'line', 5633
    le $I1, 1, __label_24
# {
.annotate 'line', 5634
    getattribute $P10, self, 'value'
    __ARG_1.'say'($S2, ".'", $P10, "'()")
# }
  __label_24: # endif
    goto __label_17 # break
  __label_20: # case
.annotate 'line', 5638
# var id: $P4
    getattribute $P6, self, 'owner'
    getattribute $P7, self, 'value'
    $P4 = $P6.'getvar'($P7)
.annotate 'line', 5639
    unless_null $P4, __label_25
# {
.annotate 'line', 5641
# var cl: $P5
    getattribute $P8, self, 'owner'
    getattribute $P9, self, 'value'
    $P5 = $P8.'checkclass'($P9)
.annotate 'line', 5642
    if_null $P5, __label_27
# {
.annotate 'line', 5643
    $P6 = $P5.'getclasskey'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P6, $S1)
# }
    goto __label_28
  __label_27: # else
# {
.annotate 'line', 5646
    $P6 = self.'dowarnings'()
    if_null $P6, __label_29
    unless $P6 goto __label_29
.annotate 'line', 5647
    'Warn'('Checking: new unknown type')
  __label_29: # endif
.annotate 'line', 5648
    getattribute $P6, self, 'value'
    __ARG_1.'say'('    ', 'new ', $S2, ", ['", $P6, "']", $S1)
# }
  __label_28: # endif
.annotate 'line', 5650
    getattribute $P6, self, 'value'
    set $S3, $P6
# }
    goto __label_26
  __label_25: # else
# {
.annotate 'line', 5654
    $P6 = $P4.'getreg'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P6, "", $S1)
# }
  __label_26: # endif
    goto __label_17 # break
  __label_18: # default
.annotate 'line', 5658
    'InternalError'('Unexpected type in new')
  __label_17: # switch end
.annotate 'line', 5660
    isgt $I3, $I1, 1
    if $I3 goto __label_31
    isge $I3, $I1, 0
    unless $I3 goto __label_32
    iseq $I3, $I2, 1
  __label_32:
  __label_31:
    unless $I3 goto __label_30
# {
.annotate 'line', 5661
    self.'emit_constructor'(__ARG_1, $S2, $S3)
.annotate 'line', 5662
    not $I3, __ARG_3
    unless $I3 goto __label_33
.annotate 'line', 5663
    __ARG_1.'emitset'(__ARG_2, $S2)
  __label_33: # endif
# }
  __label_30: # endif
# }
.annotate 'line', 5665

.end # emit


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5668
    .tailcall self.'emit'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 5669

.end # emit_init

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NewExpr' ]
.annotate 'line', 5546
    get_class $P1, [ 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 5548
    addattribute $P0, 'value'
.end
.namespace [ 'NewIndexedExpr' ]

.sub 'NewIndexedExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5680
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5681
    setattribute self, 'owner', __ARG_2
.annotate 'line', 5682
# var nskey: $P1
    new $P1, [ 'ClassSpecifierParrotKey' ]
    $P1.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5683
    setattribute self, 'nskey', $P1
.annotate 'line', 5684
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 5685
    $P3 = $P2.'isop'('(')
    if_null $P3, __label_0
    unless $P3 goto __label_0
.annotate 'line', 5686
    self.'parseinitializer'(__ARG_1)
    goto __label_1
  __label_0: # else
.annotate 'line', 5688
    __ARG_1.'unget'($P2)
  __label_1: # endif
# }
.annotate 'line', 5689

.end # NewIndexedExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5692
# reginit: $S1
    null $S1
.annotate 'line', 5693
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5694
# numinits: $I1
    unless_null $P1, __label_1
    null $I1
    goto __label_0
  __label_1:
    $I1 = $P1.'numargs'()
  __label_0:
# switch
.annotate 'line', 5695
    set $I2, $I1
    null $I3
    if $I2 == $I3 goto __label_4
    set $I3, 1
    if $I2 == $I3 goto __label_5
    goto __label_3
  __label_4: # case
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 5699
# var initval: $P2
    $P2 = $P1.'getfreearg'(0)
.annotate 'line', 5700
    $P4 = $P2.'emit_get'(__ARG_1)
    set $S1, $P4
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 5703
    getattribute $P5, self, 'start'
    'SyntaxError'('Multiple init arguments not allowed here', $P5)
  __label_2: # switch end
.annotate 'line', 5705
# var nskey: $P3
    getattribute $P3, self, 'nskey'
.annotate 'line', 5706
    __ARG_1.'print'('    ')
.annotate 'line', 5707
    $P4 = $P3.'hasHLL'()
    if_null $P4, __label_6
    unless $P4 goto __label_6
.annotate 'line', 5708
    __ARG_1.'print'("root_")
  __label_6: # endif
.annotate 'line', 5709
    __ARG_1.'print'("new ", __ARG_2, ", ")
.annotate 'line', 5710
    null $P4
    $P3.'emit'(__ARG_1, $P4)
.annotate 'line', 5711
    if_null $S1, __label_7
.annotate 'line', 5712
    __ARG_1.'print'(', ', $S1)
  __label_7: # endif
.annotate 'line', 5713
    __ARG_1.'say'()
# }
.annotate 'line', 5714

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NewIndexedExpr' ]
.annotate 'line', 5674
    get_class $P1, [ 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 5676
    addattribute $P0, 'nskey'
.end
.namespace [ 'NewQualifiedExpr' ]

.sub 'NewQualifiedExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5725
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5726
    setattribute self, 'owner', __ARG_2
.annotate 'line', 5727
# var nskey: $P1
    new $P1, [ 'ClassSpecifierId' ]
    $P1.'ClassSpecifierId'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5728
    setattribute self, 'nskey', $P1
.annotate 'line', 5729
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 5730
    $P3 = $P2.'isop'('(')
    if_null $P3, __label_0
    unless $P3 goto __label_0
.annotate 'line', 5731
    self.'parseinitializer'(__ARG_1)
    goto __label_1
  __label_0: # else
.annotate 'line', 5733
    __ARG_1.'unget'($P2)
  __label_1: # endif
# }
.annotate 'line', 5734

.end # NewQualifiedExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5737
# reginit: $S1
    null $S1
.annotate 'line', 5738
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5740
# numinits: $I1
    unless_null $P1, __label_1
    set $I1, -1
    goto __label_0
  __label_1:
# predefined elements
    elements $I1, $P1
  __label_0:
.annotate 'line', 5741
# regnew: $S2
    set $P3, __ARG_2
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 5742
    le $I1, 0, __label_3
.annotate 'line', 5743
    $P3 = self.'tempreg'('P')
    set $S2, $P3
  __label_3: # endif
.annotate 'line', 5744
# var nskey: $P2
    getattribute $P2, self, 'nskey'
.annotate 'line', 5745
    __ARG_1.'print'('    ', 'new ', $S2, ", ")
.annotate 'line', 5746
    getattribute $P3, self, 'owner'
    $P2.'emit'(__ARG_1, $P3)
.annotate 'line', 5747
    __ARG_1.'say'()
.annotate 'line', 5749
    lt $I1, 0, __label_4
# {
.annotate 'line', 5750
# constructor: $S3
    $P3 = $P2.'last'()
    null $S3
    if_null $P3, __label_5
    set $S3, $P3
  __label_5:
.annotate 'line', 5751
    self.'emit_constructor'(__ARG_1, $S2, $S3)
.annotate 'line', 5752
    __ARG_1.'emitset'(__ARG_2, $S2)
# }
  __label_4: # endif
# }
.annotate 'line', 5754

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NewQualifiedExpr' ]
.annotate 'line', 5719
    get_class $P1, [ 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 5721
    addattribute $P0, 'nskey'
.end
.namespace [ ]

.sub 'parseNew'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5761
# var t: $P1
    $P1 = __ARG_1.'get'()
# switch-case
.annotate 'line', 5764
    $I1 = $P1.'isop'('(')
    if $I1 goto __label_2
.annotate 'line', 5768
    $I1 = $P1.'isop'('[')
    if $I1 goto __label_3
.annotate 'line', 5771
    $I1 = $P1.'isidentifier'()
    if $I1 goto __label_4
    goto __label_1
  __label_2: # case
.annotate 'line', 5766
    new $P4, [ 'CallExpr' ]
.annotate 'line', 5767
    new $P6, [ 'StringLiteral' ]
    $P6.'StringLiteral'(__ARG_2, __ARG_3)
    set $P5, $P6
    $P4.'CallExpr'(__ARG_1, __ARG_2, __ARG_3, $P5)
    set $P3, $P4
.annotate 'line', 5766
    .return($P3)
  __label_3: # case
.annotate 'line', 5770
    new $P8, [ 'NewIndexedExpr' ]
    $P8.'NewIndexedExpr'(__ARG_1, __ARG_2, __ARG_3)
    set $P7, $P8
    .return($P7)
  __label_4: # case
.annotate 'line', 5774
# var t2: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 5775
    __ARG_1.'unget'($P2)
.annotate 'line', 5776
    $P9 = $P2.'isop'('.')
    if_null $P9, __label_5
    unless $P9 goto __label_5
# {
.annotate 'line', 5778
    new $P11, [ 'NewQualifiedExpr' ]
    $P11.'NewQualifiedExpr'(__ARG_1, __ARG_2, $P1)
    set $P10, $P11
    .return($P10)
# }
  __label_5: # endif
  __label_1: # default
.annotate 'line', 5783
    new $P4, [ 'NewExpr' ]
    $P4.'NewExpr'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P3, $P4
    .return($P3)
  __label_0: # switch end
# }
.annotate 'line', 5785

.end # parseNew

.namespace [ 'OpInstanceOfExpr' ]

.sub 'OpInstanceOfExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 5796
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5797
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 5798
    $P2 = 'parseClassSpecifier'(__ARG_4, self)
    setattribute self, 'checked', $P2
# }
.annotate 'line', 5799

.end # OpInstanceOfExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5802
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 5803
    .return(self)
# }
.annotate 'line', 5804

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5805
    .return('I')
# }

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5808
# var checked: $P1
    getattribute $P1, self, 'checked'
.annotate 'line', 5810
# r: $S1
    null $S1
.annotate 'line', 5811
    set $S3, __ARG_2
    ne $S3, '', __label_0
.annotate 'line', 5812
    $P2 = self.'tempreg'('I')
    set $S1, $P2
    goto __label_1
  __label_0: # else
.annotate 'line', 5814
    set $S1, __ARG_2
  __label_1: # endif
.annotate 'line', 5815
# check: $S2
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 5816
    self.'annotate'(__ARG_1)
.annotate 'line', 5817
    __ARG_1.'print'('    isa ', $S1, ', ', $S2, ', ')
.annotate 'line', 5818
    getattribute $P2, self, 'owner'
    $P1.'emit'(__ARG_1, $P2)
.annotate 'line', 5819
    __ARG_1.'say'()
# }
.annotate 'line', 5820

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpInstanceOfExpr' ]
.annotate 'line', 5789
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5791
    addattribute $P0, 'lexpr'
.annotate 'line', 5792
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
.annotate 'line', 5837
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5838
    new $P3, [ 'Condition' ]
    $P2 = $P3.'set'(__ARG_3)
    setattribute self, 'condition', $P2
.annotate 'line', 5839
    setattribute self, 'etrue', __ARG_4
.annotate 'line', 5840
    setattribute self, 'efalse', __ARG_5
.annotate 'line', 5841
    .return(self)
# }
.annotate 'line', 5842

.end # OpConditionalExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5845
    getattribute $P3, self, 'condition'
    $P2 = $P3.'optimize'()
    setattribute self, 'condition', $P2
# switch
.annotate 'line', 5846
    getattribute $P2, self, 'condition'
    $P1 = $P2.'getvalue'()
    set $I1, $P1
    set $I2, 1
    if $I1 == $I2 goto __label_2
    set $I2, 2
    if $I1 == $I2 goto __label_3
    goto __label_1
  __label_2: # case
.annotate 'line', 5848
    getattribute $P3, self, 'etrue'
    .tailcall $P3.'optimize'()
  __label_3: # case
.annotate 'line', 5850
    getattribute $P4, self, 'efalse'
    .tailcall $P4.'optimize'()
  __label_1: # default
.annotate 'line', 5852
    getattribute $P7, self, 'etrue'
    $P6 = $P7.'optimize'()
    setattribute self, 'etrue', $P6
.annotate 'line', 5853
    getattribute $P10, self, 'efalse'
    $P9 = $P10.'optimize'()
    setattribute self, 'efalse', $P9
.annotate 'line', 5854
    .return(self)
  __label_0: # switch end
# }
.annotate 'line', 5856

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5859
    getattribute $P1, self, 'etrue'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 5860

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5863
# cond_end: $S1
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 5864
# cond_false: $S2
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
  __label_1:
.annotate 'line', 5865
    getattribute $P1, self, 'condition'
    $P1.'emit_else'(__ARG_1, $S2)
.annotate 'line', 5866
    getattribute $P1, self, 'etrue'
    $P1.'emit'(__ARG_1, __ARG_2)
.annotate 'line', 5867
    __ARG_1.'emitgoto'($S1)
.annotate 'line', 5868
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 5869
    getattribute $P1, self, 'efalse'
    $P1.'emit'(__ARG_1, __ARG_2)
.annotate 'line', 5870
    __ARG_1.'emitlabel'($S1)
# }
.annotate 'line', 5871

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpConditionalExpr' ]
.annotate 'line', 5825
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5831
    addattribute $P0, 'condition'
.annotate 'line', 5832
    addattribute $P0, 'etrue'
.annotate 'line', 5833
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
.annotate 'line', 5915
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
.annotate 'line', 5916
    .return(1)
  __label_3: # case
.annotate 'line', 5917
    .return(2)
  __label_4: # case
.annotate 'line', 5918
    .return(3)
  __label_1: # default
.annotate 'line', 5919
    .return(0)
  __label_0: # switch end
# }
.annotate 'line', 5921

.end # getOpCode_2


.sub 'getOpCode_4'
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 5925
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
.annotate 'line', 5926
    .return(8)
  __label_3: # case
.annotate 'line', 5927
    .return(11)
  __label_4: # case
.annotate 'line', 5928
    .return(9)
  __label_5: # case
.annotate 'line', 5929
    .return(10)
  __label_1: # default
.annotate 'line', 5931
    $P2 = __ARG_1.'iskeyword'('delete')
    if_null $P2, __label_6
    unless $P2 goto __label_6
    .return(31)
    goto __label_7
  __label_6: # else
.annotate 'line', 5932
    $P3 = __ARG_1.'iskeyword'('exists')
    if_null $P3, __label_8
    unless $P3 goto __label_8
    .return(32)
    goto __label_9
  __label_8: # else
.annotate 'line', 5933
    .return(0)
  __label_9: # endif
  __label_7: # endif
  __label_0: # switch end
# }
.annotate 'line', 5935

.end # getOpCode_4


.sub 'getOpCode_5'
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 5939
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
.annotate 'line', 5940
    .return(19)
  __label_3: # case
.annotate 'line', 5941
    .return(20)
  __label_4: # case
.annotate 'line', 5942
    .return(21)
  __label_5: # case
.annotate 'line', 5943
    .return(22)
  __label_1: # default
.annotate 'line', 5944
    .return(0)
  __label_0: # switch end
# }
.annotate 'line', 5946

.end # getOpCode_5


.sub 'getOpCode_7'
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 5950
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    set $S2, '<<'
    if $S1 == $S2 goto __label_2
    set $S2, '>>'
    if $S1 == $S2 goto __label_3
    goto __label_1
  __label_2: # case
.annotate 'line', 5951
    .return(28)
  __label_3: # case
.annotate 'line', 5952
    .return(29)
  __label_1: # default
.annotate 'line', 5953
    .return(0)
  __label_0: # switch end
# }
.annotate 'line', 5955

.end # getOpCode_7


.sub 'getOpCode_8'
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 5959
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
.annotate 'line', 5960
    .return(14)
  __label_3: # case
.annotate 'line', 5961
    .return(16)
  __label_4: # case
.annotate 'line', 5962
    .return(15)
  __label_5: # case
.annotate 'line', 5963
    .return(17)
  __label_1: # default
.annotate 'line', 5965
    $P2 = __ARG_1.'iskeyword'('instanceof')
    if_null $P2, __label_6
    unless $P2 goto __label_6
    .return(27)
    goto __label_7
  __label_6: # else
.annotate 'line', 5966
    .return(0)
  __label_7: # endif
  __label_0: # switch end
# }
.annotate 'line', 5968

.end # getOpCode_8


.sub 'getOpCode_9'
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 5972
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
.annotate 'line', 5973
    .return(12)
  __label_3: # case
.annotate 'line', 5974
    .return(13)
  __label_4: # case
.annotate 'line', 5975
    .return(25)
  __label_5: # case
.annotate 'line', 5976
    .return(26)
  __label_1: # default
.annotate 'line', 5977
    .return(0)
  __label_0: # switch end
# }
.annotate 'line', 5979

.end # getOpCode_9


.sub 'getOpCode_16'
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 5983
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
.annotate 'line', 5984
    .return(4)
  __label_3: # case
.annotate 'line', 5985
    .return(5)
  __label_4: # case
.annotate 'line', 5986
    .return(6)
  __label_5: # case
.annotate 'line', 5987
    .return(18)
  __label_6: # case
.annotate 'line', 5988
    .return(23)
  __label_7: # case
.annotate 'line', 5989
    .return(24)
  __label_8: # case
.annotate 'line', 5990
    .return(30)
  __label_1: # default
.annotate 'line', 5991
    .return(0)
  __label_0: # switch end
# }
.annotate 'line', 5993

.end # getOpCode_16


.sub 'parseExpr_0'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5997
.const 'Sub' $P3 = 'parseExpr'
.annotate 'line', 5999
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 6000
# var expr: $P2
    null $P2
# switch-case
.annotate 'line', 6003
    $I1 = $P1.'isop'('(')
    if $I1 goto __label_2
.annotate 'line', 6007
    $I1 = $P1.'isop'('[')
    if $I1 goto __label_3
.annotate 'line', 6009
    $I1 = $P1.'isop'('{')
    if $I1 goto __label_4
.annotate 'line', 6011
    $I1 = $P1.'isstring'()
    if $I1 goto __label_5
.annotate 'line', 6013
    $I1 = $P1.'isint'()
    if $I1 goto __label_6
.annotate 'line', 6015
    $I1 = $P1.'isfloat'()
    if $I1 goto __label_7
.annotate 'line', 6017
    $I1 = $P1.'iskeyword'('new')
    if $I1 goto __label_8
.annotate 'line', 6019
    $I1 = $P1.'iskeyword'('function')
    if $I1 goto __label_9
.annotate 'line', 6021
    $I1 = $P1.'iskeyword'('class')
    if $I1 goto __label_10
.annotate 'line', 6023
    $I1 = $P1.'isidentifier'()
    if $I1 goto __label_11
    goto __label_1
  __label_2: # case
.annotate 'line', 6004
    $P2 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 6005
    'ExpectOp'(')', __ARG_1)
.annotate 'line', 6006
    .return($P2)
  __label_3: # case
.annotate 'line', 6008
    new $P5, [ 'ArrayExpr' ]
    $P5.'ArrayExpr'(__ARG_1, __ARG_2, $P1)
    set $P4, $P5
    .return($P4)
  __label_4: # case
.annotate 'line', 6010
    new $P7, [ 'HashExpr' ]
    $P7.'HashExpr'(__ARG_1, __ARG_2, $P1)
    set $P6, $P7
    .return($P6)
  __label_5: # case
.annotate 'line', 6012
    new $P9, [ 'StringLiteral' ]
    $P9.'StringLiteral'(__ARG_2, $P1)
    set $P8, $P9
    .return($P8)
  __label_6: # case
.annotate 'line', 6014
    new $P11, [ 'IntegerLiteral' ]
    $P11.'IntegerLiteral'(__ARG_2, $P1)
    set $P10, $P11
    .return($P10)
  __label_7: # case
.annotate 'line', 6016
    new $P13, [ 'FloatLiteral' ]
    $P13.'FloatLiteral'(__ARG_2, $P1)
    set $P12, $P13
    .return($P12)
  __label_8: # case
.annotate 'line', 6018
    .tailcall 'parseNew'(__ARG_1, __ARG_2, $P1)
  __label_9: # case
.annotate 'line', 6020
    new $P15, [ 'FunctionExpr' ]
    $P15.'FunctionExpr'(__ARG_1, __ARG_2, $P1)
    set $P14, $P15
    .return($P14)
  __label_10: # case
.annotate 'line', 6022
    new $P17, [ 'OpClassExpr' ]
    $P17.'OpClassExpr'(__ARG_1, __ARG_2, $P1)
    set $P16, $P17
    .return($P16)
  __label_11: # case
.annotate 'line', 6024
    new $P19, [ 'IdentifierExpr' ]
    $P19.'IdentifierExpr'(__ARG_2, $P1)
    set $P18, $P19
    .return($P18)
  __label_1: # default
.annotate 'line', 6026
    'SyntaxError'('Expression expected', $P1)
  __label_0: # switch end
# }
.annotate 'line', 6028

.end # parseExpr_0


.sub 'parseExpr_2'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6032
.const 'Sub' $P5 = 'parseExpr_0'
.const 'Sub' $P6 = 'getOpCode_2'
.annotate 'line', 6034
# var subexp: $P1
    $P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6035
# var t: $P2
    null $P2
.annotate 'line', 6036
# var start: $P3
    null $P3
.annotate 'line', 6037
# code: $I1
    null $I1
  __label_1: # while
.annotate 'line', 6038
    $P2 = __ARG_1.'get'()
    $P7 = $P6($P2)
    set $I1, $P7
    eq $I1, 0, __label_0
# {
# switch
.annotate 'line', 6039
    set $I2, $I1
    set $I3, 1
    if $I2 == $I3 goto __label_4
    set $I3, 2
    if $I2 == $I3 goto __label_5
    set $I3, 3
    if $I2 == $I3 goto __label_6
    goto __label_3
  __label_4: # case
.annotate 'line', 6041
    new $P8, [ 'CallExpr' ]
    $P8.'CallExpr'(__ARG_1, __ARG_2, $P2, $P1)
    set $P1, $P8
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 6044
    new $P9, [ 'IndexExpr' ]
    $P9.'IndexExpr'(__ARG_1, __ARG_2, $P2, $P1)
    set $P1, $P9
    goto __label_2 # break
  __label_6: # case
.annotate 'line', 6047
    set $P3, $P2
.annotate 'line', 6048
    $P2 = __ARG_1.'get'()
.annotate 'line', 6049
    $P10 = $P2.'isop'('*')
    if_null $P10, __label_7
    unless $P10 goto __label_7
# {
.annotate 'line', 6050
# var right: $P4
    $P4 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6051
    new $P7, [ 'MemberRefExpr' ]
    $P7.'MemberRefExpr'(__ARG_2, $P2, $P1, $P4)
    set $P1, $P7
# }
    goto __label_8
  __label_7: # else
.annotate 'line', 6054
    new $P7, [ 'MemberExpr' ]
    $P7.'MemberExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P7
  __label_8: # endif
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 6057
    'InternalError'('Unexpected code in parseExpr_2')
  __label_2: # switch end
# }
    goto __label_1
  __label_0: # endwhile
.annotate 'line', 6060
    __ARG_1.'unget'($P2)
.annotate 'line', 6061
    .return($P1)
# }
.annotate 'line', 6062

.end # parseExpr_2


.sub 'parseExpr_3'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6066
.const 'Sub' $P3 = 'parseExpr_2'
.annotate 'line', 6068
# var subexp: $P1
    $P1 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 6069
# var t: $P2
    $P2 = __ARG_1.'get'()
# switch-case
.annotate 'line', 6071
    $I1 = $P2.'isop'('++')
    if $I1 goto __label_2
.annotate 'line', 6073
    $I1 = $P2.'isop'('--')
    if $I1 goto __label_3
    goto __label_1
  __label_2: # case
.annotate 'line', 6072
    new $P5, [ 'OpPostIncExpr' ]
    $P5.'OpPostIncExpr'(__ARG_2, $P2, $P1)
    set $P4, $P5
    .return($P4)
  __label_3: # case
.annotate 'line', 6074
    new $P7, [ 'OpPostDecExpr' ]
    $P7.'OpPostDecExpr'(__ARG_2, $P2, $P1)
    set $P6, $P7
    .return($P6)
  __label_1: # default
.annotate 'line', 6076
    __ARG_1.'unget'($P2)
.annotate 'line', 6077
    .return($P1)
  __label_0: # switch end
# }
.annotate 'line', 6079

.end # parseExpr_3


.sub 'parseExpr_4'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6083
.const 'Sub' $P3 = 'parseExpr_4'
.const 'Sub' $P4 = 'parseExpr_3'
.const 'Sub' $P5 = 'getOpCode_4'
.annotate 'line', 6085
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 6086
# code: $I1
    $P6 = $P5($P1)
    set $I1, $P6
.annotate 'line', 6087
    eq $I1, 0, __label_0
# {
.annotate 'line', 6088
# var subexpr: $P2
    $P2 = $P3(__ARG_1, __ARG_2)
# switch
.annotate 'line', 6089
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
.annotate 'line', 6091
    new $P7, [ 'OpUnaryMinusExpr' ]
    $P7.'OpUnaryMinusExpr'(__ARG_2, $P1, $P2)
    set $P6, $P7
    .return($P6)
  __label_5: # case
.annotate 'line', 6093
    new $P9, [ 'OpNotExpr' ]
    $P9.'OpNotExpr'(__ARG_2, $P1, $P2)
    set $P8, $P9
    .return($P8)
  __label_6: # case
.annotate 'line', 6095
    new $P11, [ 'OpPreIncExpr' ]
    $P11.'OpPreIncExpr'(__ARG_2, $P1, $P2)
    set $P10, $P11
    .return($P10)
  __label_7: # case
.annotate 'line', 6097
    new $P13, [ 'OpPreDecExpr' ]
    $P13.'OpPreDecExpr'(__ARG_2, $P1, $P2)
    set $P12, $P13
    .return($P12)
  __label_8: # case
.annotate 'line', 6099
    new $P15, [ 'OpDeleteExpr' ]
    $P15.'OpDeleteExpr'(__ARG_2, $P1, $P2)
    set $P14, $P15
    .return($P14)
  __label_9: # case
.annotate 'line', 6101
    new $P17, [ 'OpExistsExpr' ]
    $P17.'OpExistsExpr'(__ARG_2, $P1, $P2)
    set $P16, $P17
    .return($P16)
  __label_3: # default
.annotate 'line', 6103
    'InternalError'('Invalid code in parseExpr_4', $P1)
  __label_2: # switch end
# }
    goto __label_1
  __label_0: # else
# {
.annotate 'line', 6107
    __ARG_1.'unget'($P1)
.annotate 'line', 6108
    .tailcall $P4(__ARG_1, __ARG_2)
# }
  __label_1: # endif
# }
.annotate 'line', 6110

.end # parseExpr_4


.sub 'parseExpr_5'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6114
.const 'Sub' $P4 = 'parseExpr_4'
.const 'Sub' $P5 = 'getOpCode_5'
.annotate 'line', 6116
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6117
# var t: $P2
    null $P2
.annotate 'line', 6118
# code: $I1
    null $I1
  __label_1: # while
.annotate 'line', 6119
    $P2 = __ARG_1.'get'()
    $P6 = $P5($P2)
    set $I1, $P6
    eq $I1, 0, __label_0
# {
.annotate 'line', 6120
# var rexpr: $P3
    $P3 = $P4(__ARG_1, __ARG_2)
# switch
.annotate 'line', 6121
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
.annotate 'line', 6123
    new $P6, [ 'OpMulExpr' ]
    $P6.'OpMulExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P6
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 6126
    new $P7, [ 'OpDivExpr' ]
    $P7.'OpDivExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P7
    goto __label_2 # break
  __label_6: # case
.annotate 'line', 6129
    new $P8, [ 'OpModExpr' ]
    $P8.'OpModExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P8
    goto __label_2 # break
  __label_7: # case
.annotate 'line', 6132
    new $P9, [ 'OpCModExpr' ]
    $P9.'OpCModExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P9
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 6135
    'InternalError'('Invalid code in parseExpr_5', $P2)
  __label_2: # switch end
# }
    goto __label_1
  __label_0: # endwhile
.annotate 'line', 6138
    __ARG_1.'unget'($P2)
.annotate 'line', 6139
    .return($P1)
# }
.annotate 'line', 6140

.end # parseExpr_5


.sub 'parseExpr_6'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6144
.const 'Sub' $P5 = 'parseExpr_5'
.annotate 'line', 6146
# var lexpr: $P1
    $P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6147
# var t: $P2
    null $P2
  __label_1: # while
.annotate 'line', 6148
    $P2 = __ARG_1.'get'()
    $I1 = $P2.'isop'('+')
    if $I1 goto __label_2
    $I1 = $P2.'isop'('-')
  __label_2:
    unless $I1 goto __label_0
# {
.annotate 'line', 6149
# var rexpr: $P3
    $P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6150
# var expr: $P4
    null $P4
.annotate 'line', 6151
    $P6 = $P2.'isop'('+')
    if_null $P6, __label_3
    unless $P6 goto __label_3
.annotate 'line', 6152
    new $P7, [ 'OpAddExpr' ]
    $P7.'OpAddExpr'(__ARG_2, $P2, $P1, $P3)
    set $P4, $P7
    goto __label_4
  __label_3: # else
.annotate 'line', 6154
    new $P8, [ 'OpSubExpr' ]
    $P8.'OpSubExpr'(__ARG_2, $P2, $P1, $P3)
    set $P4, $P8
  __label_4: # endif
.annotate 'line', 6155
    set $P1, $P4
# }
    goto __label_1
  __label_0: # endwhile
.annotate 'line', 6157
    __ARG_1.'unget'($P2)
.annotate 'line', 6158
    .return($P1)
# }
.annotate 'line', 6159

.end # parseExpr_6


.sub 'parseExpr_7'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6163
.const 'Sub' $P4 = 'parseExpr_6'
.annotate 'line', 6165
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6166
# var rexpr: $P2
    null $P2
.annotate 'line', 6167
# var t: $P3
    null $P3
.annotate 'line', 6168
# code: $I1
    null $I1
  __label_1: # while
.annotate 'line', 6169
    $P3 = __ARG_1.'get'()
    $P5 = 'getOpCode_7'($P3)
    set $I1, $P5
    eq $I1, 0, __label_0
# {
# switch
.annotate 'line', 6170
    set $I2, $I1
    set $I3, 28
    if $I2 == $I3 goto __label_4
    set $I3, 29
    if $I2 == $I3 goto __label_5
    goto __label_3
  __label_4: # case
.annotate 'line', 6172
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6173
    new $P6, [ 'OpShiftleftExpr' ]
    $P6.'OpShiftleftExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P6
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 6176
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6177
    new $P7, [ 'OpShiftrightExpr' ]
    $P7.'OpShiftrightExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P7
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 6180
    'InternalError'('Invalid code in parseExpr_7', $P3)
  __label_2: # switch end
# }
    goto __label_1
  __label_0: # endwhile
.annotate 'line', 6183
    __ARG_1.'unget'($P3)
.annotate 'line', 6184
    .return($P1)
# }
.annotate 'line', 6185

.end # parseExpr_7


.sub 'parseExpr_8'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6189
.const 'Sub' $P4 = 'parseExpr_7'
.const 'Sub' $P5 = 'getOpCode_8'
.annotate 'line', 6191
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6192
# var rexpr: $P2
    null $P2
.annotate 'line', 6193
# var t: $P3
    null $P3
.annotate 'line', 6194
# code: $I1
    null $I1
  __label_1: # while
.annotate 'line', 6195
    $P3 = __ARG_1.'get'()
    $P6 = $P5($P3)
    set $I1, $P6
    eq $I1, 0, __label_0
# {
# switch
.annotate 'line', 6196
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
.annotate 'line', 6198
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6199
    new $P7, [ 'OpLessExpr' ]
    $P1 = $P7.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 6202
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6203
    new $P8, [ 'OpGreaterExpr' ]
    $P1 = $P8.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_2 # break
  __label_6: # case
.annotate 'line', 6206
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6207
    new $P9, [ 'OpLessEqualExpr' ]
    $P1 = $P9.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_2 # break
  __label_7: # case
.annotate 'line', 6210
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6211
    new $P10, [ 'OpGreaterEqualExpr' ]
    $P1 = $P10.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_2 # break
  __label_8: # case
.annotate 'line', 6214
    new $P11, [ 'OpInstanceOfExpr' ]
    $P11.'OpInstanceOfExpr'(__ARG_2, $P3, $P1, __ARG_1)
    set $P1, $P11
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 6217
    'InternalError'('Invalid code in parseExpr_9', $P3)
  __label_2: # switch end
# }
    goto __label_1
  __label_0: # endwhile
.annotate 'line', 6220
    __ARG_1.'unget'($P3)
.annotate 'line', 6221
    .return($P1)
# }
.annotate 'line', 6222

.end # parseExpr_8


.sub 'parseExpr_9'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6226
.const 'Sub' $P4 = 'parseExpr_8'
.const 'Sub' $P5 = 'getOpCode_9'
.annotate 'line', 6228
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6229
# var rexpr: $P2
    null $P2
.annotate 'line', 6230
# var t: $P3
    null $P3
.annotate 'line', 6231
# code: $I1
    null $I1
  __label_1: # while
.annotate 'line', 6232
    $P3 = __ARG_1.'get'()
    $P6 = $P5($P3)
    set $I1, $P6
    eq $I1, 0, __label_0
# {
# switch
.annotate 'line', 6233
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
.annotate 'line', 6235
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6236
    new $P7, [ 'OpEqualExpr' ]
    $P1 = $P7.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 6239
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6240
    new $P8, [ 'OpNotEqualExpr' ]
    $P1 = $P8.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_2 # break
  __label_6: # case
.annotate 'line', 6243
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6244
    new $P9, [ 'OpSameExpr' ]
    $P9.'OpSameExpr'(1, __ARG_2, $P3, $P1, $P2)
    set $P1, $P9
    goto __label_2 # break
  __label_7: # case
.annotate 'line', 6247
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6248
    new $P10, [ 'OpSameExpr' ]
    $P10.'OpSameExpr'(0, __ARG_2, $P3, $P1, $P2)
    set $P1, $P10
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 6251
    'InternalError'('Invalid code in parseExpr_8', $P3)
  __label_2: # switch end
# }
    goto __label_1
  __label_0: # endwhile
.annotate 'line', 6254
    __ARG_1.'unget'($P3)
.annotate 'line', 6255
    .return($P1)
# }
.annotate 'line', 6256

.end # parseExpr_9


.sub 'parseExpr_10'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6260
.const 'Sub' $P4 = 'parseExpr_9'
.annotate 'line', 6262
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6263
# var t: $P2
    null $P2
  __label_1: # while
.annotate 'line', 6264
    $P2 = __ARG_1.'get'()
    $P5 = $P2.'isop'('&')
    if_null $P5, __label_0
    unless $P5 goto __label_0
# {
.annotate 'line', 6265
# var rexpr: $P3
    $P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6266
    new $P5, [ 'OpBinAndExpr' ]
    $P5.'OpBinAndExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P5
# }
    goto __label_1
  __label_0: # endwhile
.annotate 'line', 6268
    __ARG_1.'unget'($P2)
.annotate 'line', 6269
    .return($P1)
# }
.annotate 'line', 6270

.end # parseExpr_10


.sub 'parseExpr_11'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6274
.const 'Sub' $P4 = 'parseExpr_10'
.annotate 'line', 6276
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6277
# var t: $P2
    null $P2
  __label_1: # while
.annotate 'line', 6278
    $P2 = __ARG_1.'get'()
    $P5 = $P2.'isop'('^')
    if_null $P5, __label_0
    unless $P5 goto __label_0
# {
.annotate 'line', 6279
# var rexpr: $P3
    $P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6280
    new $P5, [ 'OpBinXorExpr' ]
    $P5.'OpBinXorExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P5
# }
    goto __label_1
  __label_0: # endwhile
.annotate 'line', 6282
    __ARG_1.'unget'($P2)
.annotate 'line', 6283
    .return($P1)
# }
.annotate 'line', 6284

.end # parseExpr_11


.sub 'parseExpr_12'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6288
.const 'Sub' $P4 = 'parseExpr_11'
.annotate 'line', 6290
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6291
# var t: $P2
    null $P2
  __label_1: # while
.annotate 'line', 6292
    $P2 = __ARG_1.'get'()
    $P5 = $P2.'isop'('|')
    if_null $P5, __label_0
    unless $P5 goto __label_0
# {
.annotate 'line', 6293
# var rexpr: $P3
    $P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6294
    new $P5, [ 'OpBinOrExpr' ]
    $P5.'OpBinOrExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P5
# }
    goto __label_1
  __label_0: # endwhile
.annotate 'line', 6296
    __ARG_1.'unget'($P2)
.annotate 'line', 6297
    .return($P1)
# }
.annotate 'line', 6298

.end # parseExpr_12


.sub 'parseExpr_13'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6302
.const 'Sub' $P4 = 'parseExpr_12'
.annotate 'line', 6304
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6305
# var t: $P2
    null $P2
  __label_1: # while
.annotate 'line', 6306
    $P2 = __ARG_1.'get'()
    $P5 = $P2.'isop'('&&')
    if_null $P5, __label_0
    unless $P5 goto __label_0
# {
.annotate 'line', 6307
# var rexpr: $P3
    $P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6308
    new $P5, [ 'OpBoolAndExpr' ]
    $P5.'OpBoolAndExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P5
# }
    goto __label_1
  __label_0: # endwhile
.annotate 'line', 6310
    __ARG_1.'unget'($P2)
.annotate 'line', 6311
    .return($P1)
# }
.annotate 'line', 6312

.end # parseExpr_13


.sub 'parseExpr_14'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6316
.const 'Sub' $P4 = 'parseExpr_13'
.annotate 'line', 6318
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6319
# var t: $P2
    null $P2
  __label_1: # while
.annotate 'line', 6320
    $P2 = __ARG_1.'get'()
    $P5 = $P2.'isop'('||')
    if_null $P5, __label_0
    unless $P5 goto __label_0
# {
.annotate 'line', 6321
# var rexpr: $P3
    $P3 = 'parseExpr_12'(__ARG_1, __ARG_2)
.annotate 'line', 6322
    new $P5, [ 'OpBoolOrExpr' ]
    $P5.'OpBoolOrExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P5
# }
    goto __label_1
  __label_0: # endwhile
.annotate 'line', 6324
    __ARG_1.'unget'($P2)
.annotate 'line', 6325
    .return($P1)
# }
.annotate 'line', 6326

.end # parseExpr_14


.sub 'parseExpr_15'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6330
.const 'Sub' $P5 = 'parseExpr_16'
.const 'Sub' $P6 = 'parseExpr_14'
.annotate 'line', 6332
# var econd: $P1
    $P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 6333
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 6334
    $P7 = $P2.'isop'('?')
    if_null $P7, __label_0
    unless $P7 goto __label_0
# {
.annotate 'line', 6335
# var etrue: $P3
    $P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6336
    'ExpectOp'(':', __ARG_1)
.annotate 'line', 6337
# var efalse: $P4
    $P4 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6338
    new $P8, [ 'OpConditionalExpr' ]
    $P8.'OpConditionalExpr'(__ARG_2, $P2, $P1, $P3, $P4)
    set $P7, $P8
    .return($P7)
# }
    goto __label_1
  __label_0: # else
# {
.annotate 'line', 6341
    __ARG_1.'unget'($P2)
.annotate 'line', 6342
    .return($P1)
# }
  __label_1: # endif
# }
.annotate 'line', 6344

.end # parseExpr_15


.sub 'parseExpr_16'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6348
.const 'Sub' $P5 = 'parseExpr_16'
.const 'Sub' $P6 = 'parseExpr_15'
.const 'Sub' $P7 = 'getOpCode_16'
.annotate 'line', 6350
# var lexpr: $P1
    $P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 6351
# var t: $P2
    null $P2
.annotate 'line', 6352
# code: $I1
    null $I1
  __label_1: # while
.annotate 'line', 6353
    $P2 = __ARG_1.'get'()
    $P8 = $P7($P2)
    set $I1, $P8
    eq $I1, 0, __label_0
# {
.annotate 'line', 6354
# var rexpr: $P3
    $P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6355
# var expr: $P4
    null $P4
# switch
.annotate 'line', 6356
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
.annotate 'line', 6358
    new $P4, [ 'OpAssignExpr' ]
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 6361
    new $P4, [ 'OpAssignToExpr' ]
    goto __label_2 # break
  __label_6: # case
.annotate 'line', 6364
    new $P4, [ 'OpAddToExpr' ]
    goto __label_2 # break
  __label_7: # case
.annotate 'line', 6367
    new $P4, [ 'OpSubToExpr' ]
    goto __label_2 # break
  __label_8: # case
.annotate 'line', 6370
    new $P4, [ 'OpMulToExpr' ]
    goto __label_2 # break
  __label_9: # case
.annotate 'line', 6373
    new $P4, [ 'OpDivToExpr' ]
    goto __label_2 # break
  __label_10: # case
.annotate 'line', 6376
    new $P4, [ 'OpModToExpr' ]
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 6379
    'InternalError'('Unexpected code in parseExpr_16', $P2)
  __label_2: # switch end
.annotate 'line', 6381
    $P4.'set'(__ARG_2, $P2, $P1, $P3)
.annotate 'line', 6382
    set $P1, $P4
# }
    goto __label_1
  __label_0: # endwhile
.annotate 'line', 6384
    __ARG_1.'unget'($P2)
.annotate 'line', 6385
    .return($P1)
# }
.annotate 'line', 6386

.end # parseExpr_16


.sub 'parseExpr'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6390
.const 'Sub' $P1 = 'parseExpr_16'
.annotate 'line', 6392
    .tailcall $P1(__ARG_1, __ARG_2)
# }
.annotate 'line', 6393

.end # parseExpr

.namespace [ 'Breakable' ]

.sub 'genbreaklabel' :method
# Body
# {
.annotate 'line', 6408
    getattribute $P1, self, 'brlabel'
    if_null $P1, __label_0
.annotate 'line', 6409
    'InternalError'('attempt to generate break label twice')
  __label_0: # endif
.annotate 'line', 6410
# label: $S1
    $P1 = self.'genlabel'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6411
    box $P1, $S1
    setattribute self, 'brlabel', $P1
.annotate 'line', 6412
    .return($S1)
# }
.annotate 'line', 6413

.end # genbreaklabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6416
# var label: $P1
    getattribute $P1, self, 'brlabel'
.annotate 'line', 6417
    unless_null $P1, __label_0
.annotate 'line', 6418
    'InternalError'('attempt to get break label before creating it')
  __label_0: # endif
.annotate 'line', 6419
    .return($P1)
# }
.annotate 'line', 6420

.end # getbreaklabel

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Breakable' ]
.annotate 'line', 6404
    addattribute $P0, 'brlabel'
.end
.namespace [ 'Continuable' ]

.sub 'gencontinuelabel' :method
# Body
# {
.annotate 'line', 6429
    getattribute $P1, self, 'cntlabel'
    if_null $P1, __label_0
.annotate 'line', 6430
    'InternalError'('attempt to generate continue label twice')
  __label_0: # endif
.annotate 'line', 6431
# label: $S1
    $P1 = self.'genlabel'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6432
    box $P1, $S1
    setattribute self, 'cntlabel', $P1
.annotate 'line', 6433
    .return($S1)
# }
.annotate 'line', 6434

.end # gencontinuelabel


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6437
# var label: $P1
    getattribute $P1, self, 'cntlabel'
.annotate 'line', 6438
    unless_null $P1, __label_0
.annotate 'line', 6439
    'InternalError'('attempt to get continue label before creating it')
  __label_0: # endif
.annotate 'line', 6440
    .return($P1)
# }
.annotate 'line', 6441

.end # getcontinuelabel

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Continuable' ]
.annotate 'line', 6423
    get_class $P1, [ 'Breakable' ]
    addparent $P0, $P1
.annotate 'line', 6425
    addattribute $P0, 'cntlabel'
.end
.namespace [ 'ReturnYieldStatement' ]

.sub 'parse' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6457
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6458
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6459
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_0
# {
.annotate 'line', 6460
    __ARG_2.'unget'($P1)
.annotate 'line', 6461
    new $P4, [ 'ArgumentList' ]
    $P4.'ArgumentList'(__ARG_3, __ARG_1, __ARG_2, ";")
    set $P3, $P4
    setattribute self, 'values', $P3
# }
  __label_0: # endif
# }
.annotate 'line', 6463

.end # parse


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6466
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 6467
    if_null $P1, __label_0
.annotate 'line', 6468
    $P1 = $P1.'optimize'()
  __label_0: # endif
.annotate 'line', 6469
    .return(self)
# }
.annotate 'line', 6470

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6474
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 6475
# n: $I1
    unless_null $P1, __label_1
    null $I1
    goto __label_0
  __label_1:
# predefined int
    $P3 = $P1.'numargs'()
    set $I1, $P3
  __label_0:
.annotate 'line', 6478
    iseq $I2, $I1, 1
    unless $I2 goto __label_3
    isa $I2, self, [ 'ReturnStatement' ]
  __label_3:
    unless $I2 goto __label_2
# {
.annotate 'line', 6479
# var func: $P2
    $P2 = $P1.'getfreearg'(0)
.annotate 'line', 6480
    $P3 = $P2.'cantailcall'()
    if_null $P3, __label_4
    unless $P3 goto __label_4
# {
.annotate 'line', 6481
    self.'annotate'(__ARG_1)
.annotate 'line', 6482
    .tailcall $P2.'emit'(__ARG_1, '.tailcall')
# }
  __label_4: # endif
# }
  __label_2: # endif
.annotate 'line', 6486
    le $I1, 0, __label_5
.annotate 'line', 6487
    $P1.'getargvalues'(__ARG_1)
  __label_5: # endif
.annotate 'line', 6489
    self.'annotate'(__ARG_1)
.annotate 'line', 6490
    self.'emitret'(__ARG_1)
.annotate 'line', 6491
    le $I1, 0, __label_6
.annotate 'line', 6492
    $P1.'emitargs'(__ARG_1)
  __label_6: # endif
.annotate 'line', 6493
    __ARG_1.'say'(')')
# }
.annotate 'line', 6494

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ReturnYieldStatement' ]
.annotate 'line', 6451
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 6453
    addattribute $P0, 'values'
.end
.namespace [ 'ReturnStatement' ]

.sub 'ReturnStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6501
    self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6502

.end # ReturnStatement


.sub 'emitret' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6505
    __ARG_1.'print'('    ', '.return(')
# }
.annotate 'line', 6506

.end # emitret

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ReturnStatement' ]
.annotate 'line', 6497
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
.annotate 'line', 6513
    self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6514

.end # YieldStatement


.sub 'emitret' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6517
    __ARG_1.'print'('    ', '.yield(')
# }
.annotate 'line', 6518

.end # emitret

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'YieldStatement' ]
.annotate 'line', 6509
    get_class $P1, [ 'ReturnYieldStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'LabelStatement' ]

.sub 'LabelStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6531
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 6532
    setattribute self, 'name', __ARG_1
.annotate 'line', 6533
# value: $S1
    getattribute $P2, self, 'owner'
    $P1 = $P2.'createlabel'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 6534
    box $P1, $S1
    setattribute self, 'value', $P1
# }
.annotate 'line', 6535

.end # LabelStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6536
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6539
    self.'annotate'(__ARG_1)
.annotate 'line', 6540
# name: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 6541
# comment: $S2
    concat $S2, 'label ', $S1
.annotate 'line', 6542
    getattribute $P1, self, 'value'
    __ARG_1.'emitlabel'($P1, $S2)
# }
.annotate 'line', 6543

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'LabelStatement' ]
.annotate 'line', 6525
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 6527
    addattribute $P0, 'name'
.annotate 'line', 6528
    addattribute $P0, 'value'
.end
.namespace [ 'Reflabel' ]

.sub 'Reflabel' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 6557
    setattribute self, 'owner', __ARG_1
.annotate 'line', 6558
    box $P1, __ARG_2
    setattribute self, 'label', $P1
# }
.annotate 'line', 6559

.end # Reflabel


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6560
    .return(self)
# }

.end # optimize


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6563
# label: $S1
    getattribute $P1, self, 'label'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 6564
# value: $S2
    getattribute $P2, self, 'owner'
    $P1 = $P2.'getlabel'($S1)
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
  __label_1:
.annotate 'line', 6565
    .return($S2)
# }
.annotate 'line', 6566

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Reflabel' ]
.annotate 'line', 6552
    addattribute $P0, 'owner'
.annotate 'line', 6553
    addattribute $P0, 'label'
.end
.namespace [ 'GotoStatement' ]

.sub 'GotoStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6579
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6580
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6581
    'RequireIdentifier'($P1)
.annotate 'line', 6582
    setattribute self, 'label', $P1
.annotate 'line', 6583
    'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 6584

.end # GotoStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6585
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6588
    self.'annotate'(__ARG_1)
.annotate 'line', 6589
# label: $S1
    getattribute $P1, self, 'label'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 6590
# value: $S2
    $P1 = self.'getlabel'($S1)
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
  __label_1:
.annotate 'line', 6591
    concat $S3, 'goto ', $S1
    __ARG_1.'emitgoto'($S2, $S3)
# }
.annotate 'line', 6592

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'GotoStatement' ]
.annotate 'line', 6573
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 6575
    addattribute $P0, 'label'
.end
.namespace [ 'ConditionalStatement' ]

.sub 'parseconditionshort' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6603
    $P1 = 'parseExpr'(__ARG_1, self)
    self.'set'($P1)
# }
.annotate 'line', 6604

.end # parseconditionshort


.sub 'parsecondition' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6607
    'ExpectOp'('(', __ARG_1)
.annotate 'line', 6608
    $P1 = 'parseExpr'(__ARG_1, self)
    self.'set'($P1)
.annotate 'line', 6609
    'ExpectOp'(')', __ARG_1)
# }
.annotate 'line', 6610

.end # parsecondition

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ConditionalStatement' ]
.annotate 'line', 6599
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
.annotate 'line', 6623
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6624
    self.'parsecondition'(__ARG_2)
.annotate 'line', 6625
    $P3 = 'parseStatement'(__ARG_2, self)
    setattribute self, 'truebranch', $P3
.annotate 'line', 6626
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6627
    $P2 = $P1.'iskeyword'("else")
    if_null $P2, __label_0
    unless $P2 goto __label_0
.annotate 'line', 6628
    $P4 = 'parseStatement'(__ARG_2, self)
    setattribute self, 'falsebranch', $P4
    goto __label_1
  __label_0: # else
# {
.annotate 'line', 6630
    new $P6, [ 'EmptyStatement' ]
    setattribute self, 'falsebranch', $P6
.annotate 'line', 6631
    __ARG_2.'unget'($P1)
# }
  __label_1: # endif
# }
.annotate 'line', 6633

.end # IfStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6636
    self.'optimize_condition'()
.annotate 'line', 6637
# checkvalue: $I1
    $P1 = self.'getvalue'()
    set $I1, $P1
.annotate 'line', 6638
    getattribute $P3, self, 'truebranch'
    $P2 = $P3.'optimize'()
    setattribute self, 'truebranch', $P2
.annotate 'line', 6639
    getattribute $P3, self, 'falsebranch'
    $P2 = $P3.'optimize'()
    setattribute self, 'falsebranch', $P2
# switch
.annotate 'line', 6640
    set $I2, $I1
    set $I3, 1
    if $I2 == $I3 goto __label_2
    set $I3, 2
    if $I2 == $I3 goto __label_3
    goto __label_1
  __label_2: # case
.annotate 'line', 6642
    getattribute $P1, self, 'truebranch'
    .return($P1)
  __label_3: # case
.annotate 'line', 6644
    getattribute $P2, self, 'falsebranch'
    .return($P2)
  __label_1: # default
  __label_0: # switch end
.annotate 'line', 6646
    .return(self)
# }
.annotate 'line', 6647

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6650
# var truebranch: $P1
    getattribute $P1, self, 'truebranch'
.annotate 'line', 6651
# var falsebranch: $P2
    getattribute $P2, self, 'falsebranch'
.annotate 'line', 6652
# t_empty: $I1
    $P3 = $P1.'isempty'()
    set $I1, $P3
.annotate 'line', 6653
# f_empty: $I2
    $P3 = $P2.'isempty'()
    set $I2, $P3
.annotate 'line', 6654
# elselabel: $S1
    set $S1, ''
.annotate 'line', 6655
    not $I3, $I2
    unless $I3 goto __label_0
.annotate 'line', 6656
    $P3 = self.'genlabel'()
    set $S1, $P3
  __label_0: # endif
.annotate 'line', 6657
# endlabel: $S2
    $P3 = self.'genlabel'()
    null $S2
    if_null $P3, __label_1
    set $S2, $P3
  __label_1:
.annotate 'line', 6658
# cond_false: $S3
    unless $I2 goto __label_3
    set $S3, $S2
    goto __label_2
  __label_3:
    set $S3, $S1
  __label_2:
.annotate 'line', 6659
    self.'annotate'(__ARG_1)
.annotate 'line', 6660
    self.'emit_else'(__ARG_1, $S3)
.annotate 'line', 6661
    $P1.'emit'(__ARG_1)
.annotate 'line', 6663
    not $I3, $I2
    unless $I3 goto __label_4
# {
.annotate 'line', 6664
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 6665
    __ARG_1.'emitlabel'($S1, 'else')
.annotate 'line', 6666
    $P2.'emit'(__ARG_1)
# }
  __label_4: # endif
.annotate 'line', 6668
    __ARG_1.'emitlabel'($S2, 'endif')
# }
.annotate 'line', 6669

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IfStatement' ]
.annotate 'line', 6617
    get_class $P1, [ 'ConditionalStatement' ]
    addparent $P0, $P1
.annotate 'line', 6619
    addattribute $P0, 'truebranch'
.annotate 'line', 6620
    addattribute $P0, 'falsebranch'
.end
.namespace [ 'LoopStatement' ]

.sub 'parsebody' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6681
    $P2 = 'parseStatement'(__ARG_1, self)
    setattribute self, 'body', $P2
# }
.annotate 'line', 6682

.end # parsebody


.sub 'emit_infinite' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6685
# breaklabel: $S1
    $P1 = self.'genbreaklabel'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 6686
# continuelabel: $S2
    $P1 = self.'gencontinuelabel'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
  __label_1:
.annotate 'line', 6688
    self.'annotate'(__ARG_1)
.annotate 'line', 6689
    __ARG_1.'emitlabel'($S2, 'Infinite loop')
.annotate 'line', 6690
    getattribute $P1, self, 'body'
    $P1.'emit'(__ARG_1)
.annotate 'line', 6691
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 6692
    __ARG_1.'emitlabel'($S1, 'Infinite loop end')
# }
.annotate 'line', 6693

.end # emit_infinite

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'LoopStatement' ]
.annotate 'line', 6676
    get_class $P1, [ 'Continuable' ]
    addparent $P0, $P1
.annotate 'line', 6678
    addattribute $P0, 'body'
.end
.namespace [ 'WhileStatement' ]

.sub 'WhileStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6704
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6705
    self.'parsecondition'(__ARG_2)
.annotate 'line', 6706
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 6707

.end # WhileStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6710
    self.'optimize_condition'()
.annotate 'line', 6711
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 6712
    .return(self)
# }
.annotate 'line', 6713

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6716
    $P1 = self.'getvalue'()
    set $I1, $P1
    set $I2, 1
    if $I1 == $I2 goto __label_2
    set $I2, 2
    if $I1 == $I2 goto __label_3
    goto __label_1
  __label_2: # case
.annotate 'line', 6718
    self.'emit_infinite'(__ARG_1)
    goto __label_0 # break
  __label_3: # case
.annotate 'line', 6721
    __ARG_1.'comment'('while(false) optimized out')
    goto __label_0 # break
  __label_1: # default
.annotate 'line', 6724
# breaklabel: $S1
    $P2 = self.'genbreaklabel'()
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
.annotate 'line', 6725
# continuelabel: $S2
    $P3 = self.'gencontinuelabel'()
    null $S2
    if_null $P3, __label_5
    set $S2, $P3
  __label_5:
.annotate 'line', 6727
    self.'annotate'(__ARG_1)
.annotate 'line', 6728
    __ARG_1.'emitlabel'($S2, 'while')
.annotate 'line', 6729
    self.'emit_else'(__ARG_1, $S1)
.annotate 'line', 6730
    getattribute $P4, self, 'body'
    $P4.'emit'(__ARG_1)
.annotate 'line', 6731
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 6732
    __ARG_1.'emitlabel'($S1, 'endwhile')
  __label_0: # switch end
# }
.annotate 'line', 6734

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'WhileStatement' ]
.annotate 'line', 6700
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
.annotate 'line', 6745
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6746
    self.'parsebody'(__ARG_2)
.annotate 'line', 6747
    'ExpectKeyword'('while', __ARG_2)
.annotate 'line', 6748
    self.'parsecondition'(__ARG_2)
# }
.annotate 'line', 6749

.end # DoStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6752
    self.'optimize_condition'()
.annotate 'line', 6753
# var body: $P1
    getattribute $P2, self, 'body'
    $P1 = $P2.'optimize'()
.annotate 'line', 6754
    $I1 = $P1.'isempty'()
    unless $I1 goto __label_1
    $P2 = self.'getvalue'()
    set $I2, $P2
    iseq $I1, $I2, 2
  __label_1:
    unless $I1 goto __label_0
.annotate 'line', 6755
    new $P3, [ 'EmptyStatement' ]
    .return($P3)
  __label_0: # endif
.annotate 'line', 6756
    setattribute self, 'body', $P1
.annotate 'line', 6757
    .return(self)
# }
.annotate 'line', 6758

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6761
# var body: $P1
    getattribute $P1, self, 'body'
.annotate 'line', 6762
# condvalue: $I1
    $P2 = self.'getvalue'()
    set $I1, $P2
# switch
.annotate 'line', 6763
    set $I2, $I1
    set $I3, 1
    if $I2 == $I3 goto __label_2
    goto __label_1
  __label_2: # case
.annotate 'line', 6765
    self.'emit_infinite'(__ARG_1)
    goto __label_0 # break
  __label_1: # default
.annotate 'line', 6768
# looplabel: $S1
    $P2 = self.'genlabel'()
    null $S1
    if_null $P2, __label_3
    set $S1, $P2
  __label_3:
.annotate 'line', 6769
# breaklabel: $S2
    $P3 = self.'genbreaklabel'()
    null $S2
    if_null $P3, __label_4
    set $S2, $P3
  __label_4:
.annotate 'line', 6770
# continuelabel: $S3
    $P4 = self.'gencontinuelabel'()
    null $S3
    if_null $P4, __label_5
    set $S3, $P4
  __label_5:
.annotate 'line', 6772
    self.'annotate'(__ARG_1)
.annotate 'line', 6773
    __ARG_1.'emitlabel'($S1, 'do')
.annotate 'line', 6775
    $P1.'emit'(__ARG_1)
.annotate 'line', 6776
    __ARG_1.'emitlabel'($S3, 'continue')
.annotate 'line', 6777
    eq $I1, 2, __label_6
.annotate 'line', 6778
    self.'emit_if'(__ARG_1, $S1, $S2)
  __label_6: # endif
.annotate 'line', 6779
    __ARG_1.'emitlabel'($S2, 'enddo')
  __label_0: # switch end
# }
.annotate 'line', 6781

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'DoStatement' ]
.annotate 'line', 6741
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
.annotate 'line', 6792
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6793
    'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 6794

.end # ContinueStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6795
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6798
    self.'annotate'(__ARG_1)
.annotate 'line', 6799
# label: $S1
    getattribute $P2, self, 'start'
    $P1 = self.'getcontinuelabel'($P2)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 6800
    __ARG_1.'emitgoto'($S1, 'continue')
# }
.annotate 'line', 6801

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ContinueStatement' ]
.annotate 'line', 6788
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
.annotate 'line', 6812
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6813
    'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 6814

.end # BreakStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6815
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6818
    self.'annotate'(__ARG_1)
.annotate 'line', 6819
# label: $S1
    getattribute $P2, self, 'start'
    $P1 = self.'getbreaklabel'($P2)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 6820
    __ARG_1.'emitgoto'($S1, 'break')
# }
.annotate 'line', 6821

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'BreakStatement' ]
.annotate 'line', 6808
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'SwitchBaseStatement' ]

.sub 'SwitchBaseStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6836
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 6837
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'case_value', $P2
.annotate 'line', 6838
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'case_st', $P2
.annotate 'line', 6839
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'default_st', $P2
# }
.annotate 'line', 6840

.end # SwitchBaseStatement


.sub 'parse_cases' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6843
# var t: $P1
    null $P1
  __label_1: # while
.annotate 'line', 6844
    $P1 = __ARG_1.'get'()
    $I1 = $P1.'iskeyword'('case')
    if $I1 goto __label_2
    $I1 = $P1.'iskeyword'('default')
  __label_2:
    unless $I1 goto __label_0
# {
.annotate 'line', 6845
    $P3 = $P1.'iskeyword'('case')
    if_null $P3, __label_3
    unless $P3 goto __label_3
# {
.annotate 'line', 6846
    getattribute $P4, self, 'case_value'
    $P5 = 'parseExpr'(__ARG_1, self)
# predefined push
    push $P4, $P5
.annotate 'line', 6847
    $P1 = __ARG_1.'get'()
.annotate 'line', 6848
    $P3 = $P1.'isop'(':')
    isfalse $I1, $P3
    unless $I1 goto __label_5
.annotate 'line', 6849
    'Expected'("':' in case", $P1)
  __label_5: # endif
.annotate 'line', 6850
# var st: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
  __label_7: # while
.annotate 'line', 6851
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
.annotate 'line', 6852
    __ARG_1.'unget'($P1)
.annotate 'line', 6853
    $P3 = 'parseStatement'(__ARG_1, self)
# predefined push
    push $P2, $P3
# }
    goto __label_7
  __label_6: # endwhile
.annotate 'line', 6855
    getattribute $P3, self, 'case_st'
# predefined push
    push $P3, $P2
.annotate 'line', 6856
    __ARG_1.'unget'($P1)
# }
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 6859
    $P1 = __ARG_1.'get'()
.annotate 'line', 6860
    $P3 = $P1.'isop'(':')
    isfalse $I1, $P3
    unless $I1 goto __label_10
.annotate 'line', 6861
    'Expected'("':' in default", $P1)
  __label_10: # endif
  __label_12: # while
.annotate 'line', 6862
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
.annotate 'line', 6863
    __ARG_1.'unget'($P1)
.annotate 'line', 6864
    getattribute $P3, self, 'default_st'
    $P4 = 'parseStatement'(__ARG_1, self)
# predefined push
    push $P3, $P4
# }
    goto __label_12
  __label_11: # endwhile
.annotate 'line', 6866
    __ARG_1.'unget'($P1)
# }
  __label_4: # endif
# }
    goto __label_1
  __label_0: # endwhile
.annotate 'line', 6869
    $P3 = $P1.'isop'('}')
    isfalse $I1, $P3
    unless $I1 goto __label_15
.annotate 'line', 6870
    'Expected'("'}' in switch", $P1)
  __label_15: # endif
# }
.annotate 'line', 6871

.end # parse_cases


.sub 'optimize_cases' :method
# Body
# {
.annotate 'line', 6874
    getattribute $P2, self, 'case_value'
    'optimize_array'($P2)
.annotate 'line', 6875
    getattribute $P2, self, 'case_st'
    iter $P3, $P2
    set $P3, 0
  __label_0: # for iteration
    unless $P3 goto __label_1
    shift $P1, $P3
.annotate 'line', 6876
    'optimize_array'($P1)
    goto __label_0
  __label_1: # endfor
.annotate 'line', 6877
    getattribute $P2, self, 'default_st'
    'optimize_array'($P2)
# }
.annotate 'line', 6878

.end # optimize_cases

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'SwitchBaseStatement' ]
.annotate 'line', 6828
    get_class $P1, [ 'Breakable' ]
    addparent $P0, $P1
    get_class $P2, [ 'Statement' ]
    addparent $P0, $P2
.annotate 'line', 6830
    addattribute $P0, 'case_value'
.annotate 'line', 6831
    addattribute $P0, 'case_st'
.annotate 'line', 6832
    addattribute $P0, 'default_st'
.end
.namespace [ 'SwitchStatement' ]

.sub 'SwitchStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6891
    self.'SwitchBaseStatement'(__ARG_1, __ARG_3)
.annotate 'line', 6892
    $P3 = 'parseExpr'(__ARG_2, self)
    setattribute self, 'condition', $P3
.annotate 'line', 6893
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6894
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_0
.annotate 'line', 6895
    'Expected'("')' in switch", $P1)
  __label_0: # endif
.annotate 'line', 6896
    $P1 = __ARG_2.'get'()
.annotate 'line', 6897
    $P2 = $P1.'isop'('{')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 6898
    'Expected'("'{' in switch", $P1)
  __label_1: # endif
.annotate 'line', 6899
    self.'parse_cases'(__ARG_2)
# }
.annotate 'line', 6900

.end # SwitchStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6903
    getattribute $P3, self, 'condition'
    $P2 = $P3.'optimize'()
    setattribute self, 'condition', $P2
.annotate 'line', 6904
    self.'optimize_cases'()
.annotate 'line', 6905
    .return(self)
# }
.annotate 'line', 6906

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6910
# type: $S1
    set $S1, ''
.annotate 'line', 6911
    getattribute $P10, self, 'case_value'
    iter $P11, $P10
    set $P11, 0
  __label_0: # for iteration
    unless $P11 goto __label_1
    shift $P1, $P11
# {
.annotate 'line', 6912
# t: $S2
    $P12 = $P1.'checkresult'()
    null $S2
    if_null $P12, __label_2
    set $S2, $P12
  __label_2:
.annotate 'line', 6913
    ne $S2, 'N', __label_3
.annotate 'line', 6914
    getattribute $P10, self, 'start'
    'SyntaxError'("Invalid type in case", $P10)
  __label_3: # endif
.annotate 'line', 6915
    ne $S1, '', __label_4
.annotate 'line', 6916
    set $S1, $S2
    goto __label_5
  __label_4: # else
.annotate 'line', 6917
    eq $S1, $S2, __label_6
.annotate 'line', 6918
    set $S1, 'P'
  __label_6: # endif
  __label_5: # endif
# }
    goto __label_0
  __label_1: # endfor
.annotate 'line', 6921
# var condition: $P2
    getattribute $P2, self, 'condition'
.annotate 'line', 6922
# var condtype: $P3
    $P3 = $P2.'checkresult'()
.annotate 'line', 6926
    ne $S1, '', __label_7
.annotate 'line', 6927
    set $S1, $P3
  __label_7: # endif
.annotate 'line', 6929
    __ARG_1.'comment'('switch')
.annotate 'line', 6930
# reg: $S3
    $P10 = self.'tempreg'($S1)
    null $S3
    if_null $P10, __label_8
    set $S3, $P10
  __label_8:
.annotate 'line', 6931
    set $S9, $P3
    ne $S9, $S1, __label_9
.annotate 'line', 6932
    $P2.'emit'(__ARG_1, $S3)
    goto __label_10
  __label_9: # else
# {
.annotate 'line', 6934
# regcond: $S4
    $P10 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P10, __label_11
    set $S4, $P10
  __label_11:
.annotate 'line', 6935
    __ARG_1.'emitset'($S3, $S4)
# }
  __label_10: # endif
.annotate 'line', 6939
    self.'genbreaklabel'()
.annotate 'line', 6940
# defaultlabel: $S5
    $P10 = self.'genlabel'()
    null $S5
    if_null $P10, __label_12
    set $S5, $P10
  __label_12:
.annotate 'line', 6941
    new $P4, ['ResizableStringArray']
.annotate 'line', 6942
# regval: $S6
    $P10 = self.'tempreg'($S1)
    null $S6
    if_null $P10, __label_13
    set $S6, $P10
  __label_13:
.annotate 'line', 6943
    getattribute $P10, self, 'case_value'
    iter $P13, $P10
    set $P13, 0
  __label_14: # for iteration
    unless $P13 goto __label_15
    shift $P5, $P13
# {
.annotate 'line', 6944
# label: $S7
    $P12 = self.'genlabel'()
    null $S7
    if_null $P12, __label_16
    set $S7, $P12
  __label_16:
.annotate 'line', 6945
# predefined push
    push $P4, $S7
.annotate 'line', 6946
    $P5.'emit'(__ARG_1, $S6)
.annotate 'line', 6947
    __ARG_1.'say'('    ', 'if ', $S3, ' == ', $S6, ' goto ', $S7)
# }
    goto __label_14
  __label_15: # endfor
.annotate 'line', 6949
    __ARG_1.'emitgoto'($S5)
.annotate 'line', 6952
    self.'annotate'(__ARG_1)
.annotate 'line', 6953
# var case_st: $P6
    getattribute $P6, self, 'case_st'
.annotate 'line', 6954
# n: $I1
    set $P10, $P6
    set $I1, $P10
# for loop
.annotate 'line', 6955
# i: $I2
    null $I2
  __label_19: # for condition
    ge $I2, $I1, __label_18
# {
.annotate 'line', 6956
# l: $S8
    $S8 = $P4[$I2]
.annotate 'line', 6957
    __ARG_1.'emitlabel'($S8, 'case')
.annotate 'line', 6958
# var casest: $P7
    $P7 = $P6[$I2]
.annotate 'line', 6959
    iter $P14, $P7
    set $P14, 0
  __label_20: # for iteration
    unless $P14 goto __label_21
    shift $P8, $P14
.annotate 'line', 6960
    $P8.'emit'(__ARG_1)
    goto __label_20
  __label_21: # endfor
# }
  __label_17: # for iteration
.annotate 'line', 6955
    inc $I2
    goto __label_19
  __label_18: # for end
.annotate 'line', 6963
    __ARG_1.'emitlabel'($S5, 'default')
.annotate 'line', 6964
    getattribute $P10, self, 'default_st'
    iter $P15, $P10
    set $P15, 0
  __label_22: # for iteration
    unless $P15 goto __label_23
    shift $P9, $P15
.annotate 'line', 6965
    $P9.'emit'(__ARG_1)
    goto __label_22
  __label_23: # endfor
.annotate 'line', 6967
    getattribute $P12, self, 'start'
    $P10 = self.'getbreaklabel'($P12)
    __ARG_1.'emitlabel'($P10, 'switch end')
# }
.annotate 'line', 6968

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'SwitchStatement' ]
.annotate 'line', 6885
    get_class $P1, [ 'SwitchBaseStatement' ]
    addparent $P0, $P1
.annotate 'line', 6887
    addattribute $P0, 'condition'
.end
.namespace [ 'SwitchCaseStatement' ]

.sub 'SwitchCaseStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6980
    self.'SwitchBaseStatement'(__ARG_1, __ARG_3)
.annotate 'line', 6981
    self.'parse_cases'(__ARG_2)
# }
.annotate 'line', 6982

.end # SwitchCaseStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6985
    self.'optimize_cases'()
.annotate 'line', 6986
    .return(self)
# }
.annotate 'line', 6987

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6991
    self.'genbreaklabel'()
.annotate 'line', 6992
# defaultlabel: $S1
    $P7 = self.'genlabel'()
    null $S1
    if_null $P7, __label_0
    set $S1, $P7
  __label_0:
.annotate 'line', 6993
    new $P1, ['ResizableStringArray']
.annotate 'line', 6995
    __ARG_1.'comment'('switch-case')
.annotate 'line', 6996
# reg: $S2
    $P7 = self.'tempreg'('I')
    null $S2
    if_null $P7, __label_1
    set $S2, $P7
  __label_1:
.annotate 'line', 6997
    getattribute $P7, self, 'case_value'
    iter $P8, $P7
    set $P8, 0
  __label_2: # for iteration
    unless $P8 goto __label_3
    shift $P2, $P8
# {
.annotate 'line', 6998
# label: $S3
    $P9 = self.'genlabel'()
    null $S3
    if_null $P9, __label_4
    set $S3, $P9
  __label_4:
.annotate 'line', 6999
# predefined push
    push $P1, $S3
.annotate 'line', 7000
    $P2.'emit'(__ARG_1, $S2)
.annotate 'line', 7001
    __ARG_1.'say'('    ', 'if ', $S2, ' goto ', $S3)
# }
    goto __label_2
  __label_3: # endfor
.annotate 'line', 7003
    __ARG_1.'emitgoto'($S1)
.annotate 'line', 7006
    self.'annotate'(__ARG_1)
.annotate 'line', 7007
# var case_st: $P3
    getattribute $P3, self, 'case_st'
.annotate 'line', 7008
# n: $I1
    set $P7, $P3
    set $I1, $P7
# for loop
.annotate 'line', 7009
# i: $I2
    null $I2
  __label_7: # for condition
    ge $I2, $I1, __label_6
# {
.annotate 'line', 7010
# l: $S4
    $S4 = $P1[$I2]
.annotate 'line', 7011
    __ARG_1.'emitlabel'($S4, 'case')
.annotate 'line', 7012
# var casest: $P4
    $P4 = $P3[$I2]
.annotate 'line', 7013
    iter $P10, $P4
    set $P10, 0
  __label_8: # for iteration
    unless $P10 goto __label_9
    shift $P5, $P10
.annotate 'line', 7014
    $P5.'emit'(__ARG_1)
    goto __label_8
  __label_9: # endfor
# }
  __label_5: # for iteration
.annotate 'line', 7009
    inc $I2
    goto __label_7
  __label_6: # for end
.annotate 'line', 7017
    __ARG_1.'emitlabel'($S1, 'default')
.annotate 'line', 7018
    getattribute $P7, self, 'default_st'
    iter $P11, $P7
    set $P11, 0
  __label_10: # for iteration
    unless $P11 goto __label_11
    shift $P6, $P11
.annotate 'line', 7019
    $P6.'emit'(__ARG_1)
    goto __label_10
  __label_11: # endfor
.annotate 'line', 7021
    getattribute $P9, self, 'start'
    $P7 = self.'getbreaklabel'($P9)
    __ARG_1.'emitlabel'($P7, 'switch end')
# }
.annotate 'line', 7022

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'SwitchCaseStatement' ]
.annotate 'line', 6975
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
.annotate 'line', 7029
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7030
    $P2 = $P1.'isop'('(')
    if_null $P2, __label_0
    unless $P2 goto __label_0
.annotate 'line', 7031
    new $P4, [ 'SwitchStatement' ]
    $P4.'SwitchStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P3, $P4
    .return($P3)
  __label_0: # endif
.annotate 'line', 7032
    $P2 = $P1.'isop'('{')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 7033
    new $P4, [ 'SwitchCaseStatement' ]
    $P4.'SwitchCaseStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P3, $P4
    .return($P3)
  __label_1: # endif
.annotate 'line', 7034
    'Expected'("'(' in switch", $P1)
# }
.annotate 'line', 7035

.end # parseSwitch

.namespace [ 'ForStatement' ]

.sub 'ForStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7048
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7049
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7050
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_0
# {
.annotate 'line', 7051
    __ARG_2.'unget'($P1)
.annotate 'line', 7052
    $P3 = 'parseStatement'(__ARG_2, self)
    setattribute self, 'initializer', $P3
# }
  __label_0: # endif
.annotate 'line', 7054
    $P1 = __ARG_2.'get'()
.annotate 'line', 7055
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 7056
    __ARG_2.'unget'($P1)
.annotate 'line', 7057
    self.'parseconditionshort'(__ARG_2)
.annotate 'line', 7058
    'ExpectOp'(';', __ARG_2)
# }
  __label_1: # endif
.annotate 'line', 7060
    $P1 = __ARG_2.'get'()
.annotate 'line', 7061
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_2
# {
.annotate 'line', 7062
    __ARG_2.'unget'($P1)
.annotate 'line', 7063
    $P3 = 'parseExpr'(__ARG_2, self)
    setattribute self, 'iteration', $P3
.annotate 'line', 7064
    'ExpectOp'(')', __ARG_2)
# }
  __label_2: # endif
.annotate 'line', 7066
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 7067

.end # ForStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7070
    getattribute $P1, self, 'initializer'
    if_null $P1, __label_0
.annotate 'line', 7071
    getattribute $P4, self, 'initializer'
    $P3 = $P4.'optimize'()
    setattribute self, 'initializer', $P3
  __label_0: # endif
.annotate 'line', 7072
    getattribute $P1, self, 'condexpr'
    if_null $P1, __label_1
.annotate 'line', 7073
    self.'optimize_condition'()
  __label_1: # endif
.annotate 'line', 7074
    getattribute $P1, self, 'iteration'
    if_null $P1, __label_2
.annotate 'line', 7075
    getattribute $P4, self, 'iteration'
    $P3 = $P4.'optimize'()
    setattribute self, 'iteration', $P3
  __label_2: # endif
.annotate 'line', 7076
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 7077
    .return(self)
# }
.annotate 'line', 7078

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7081
    getattribute $P1, self, 'initializer'
    isnull $I1, $P1
    unless $I1 goto __label_2
.annotate 'line', 7082
    getattribute $P2, self, 'condexpr'
    isnull $I1, $P2
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 7083
    getattribute $P3, self, 'iteration'
    isnull $I1, $P3
  __label_1:
    unless $I1 goto __label_0
# {
.annotate 'line', 7084
    self.'emit_infinite'(__ARG_1)
.annotate 'line', 7085
    .return()
# }
  __label_0: # endif
.annotate 'line', 7087
    __ARG_1.'comment'('for loop')
.annotate 'line', 7088
# continuelabel: $S1
    $P1 = self.'gencontinuelabel'()
    null $S1
    if_null $P1, __label_3
    set $S1, $P1
  __label_3:
.annotate 'line', 7089
# breaklabel: $S2
    $P1 = self.'genbreaklabel'()
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 7090
# condlabel: $S3
    $P1 = self.'genlabel'()
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 7091
    getattribute $P1, self, 'initializer'
    if_null $P1, __label_6
.annotate 'line', 7092
    getattribute $P2, self, 'initializer'
    $P2.'emit'(__ARG_1)
  __label_6: # endif
.annotate 'line', 7094
    __ARG_1.'emitlabel'($S3, 'for condition')
.annotate 'line', 7095
    getattribute $P1, self, 'condexpr'
    if_null $P1, __label_7
.annotate 'line', 7096
    self.'emit_else'(__ARG_1, $S2)
  __label_7: # endif
.annotate 'line', 7098
    getattribute $P1, self, 'body'
    $P1.'emit'(__ARG_1)
.annotate 'line', 7099
    __ARG_1.'emitlabel'($S1, 'for iteration')
.annotate 'line', 7100
    getattribute $P1, self, 'iteration'
    if_null $P1, __label_8
.annotate 'line', 7101
# unused: $S4
    getattribute $P3, self, 'iteration'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S4
    if_null $P2, __label_9
    set $S4, $P2
  __label_9:
  __label_8: # endif
.annotate 'line', 7102
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 7104
    __ARG_1.'emitlabel'($S2, 'for end')
# }
.annotate 'line', 7105

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ForStatement' ]
.annotate 'line', 7041
    get_class $P1, [ 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'BlockStatement' ]
    addparent $P0, $P2
    get_class $P3, [ 'ConditionalStatement' ]
    addparent $P0, $P3
.annotate 'line', 7043
    addattribute $P0, 'initializer'
.annotate 'line', 7044
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
.annotate 'line', 7120
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7121
# sname: $S1
    set $P1, __ARG_4
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 7122
    eq __ARG_5, '', __label_1
# {
.annotate 'line', 7123
# deftype: $S2
    $P1 = 'typetoregcheck'(__ARG_5)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 7124
    self.'createvar'($S1, $S2)
.annotate 'line', 7125
    box $P1, $S2
    setattribute self, 'deftype', $P1
# }
  __label_1: # endif
.annotate 'line', 7127
    setattribute self, 'varname', __ARG_4
.annotate 'line', 7128
    $P2 = 'parseExpr'(__ARG_2, self)
    setattribute self, 'container', $P2
.annotate 'line', 7129
    'ExpectOp'(')', __ARG_2)
.annotate 'line', 7130
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 7131

.end # ForeachStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7134
    getattribute $P3, self, 'container'
    $P2 = $P3.'optimize'()
    setattribute self, 'container', $P2
.annotate 'line', 7135
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 7136
    .return(self)
# }
.annotate 'line', 7137

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7140
    self.'annotate'(__ARG_1)
.annotate 'line', 7141
# regcont: $S1
    null $S1
.annotate 'line', 7142
    getattribute $P3, self, 'container'
    $P2 = $P3.'checkresult'()
    set $S6, $P2
    ne $S6, 'S', __label_0
# {
.annotate 'line', 7143
# value: $S2
    getattribute $P5, self, 'container'
    $P4 = $P5.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 7144
    $P2 = self.'tempreg'('P')
    set $S1, $P2
.annotate 'line', 7145
    __ARG_1.'emitbox'($S1, $S2)
# }
    goto __label_1
  __label_0: # else
.annotate 'line', 7148
    getattribute $P3, self, 'container'
    $P2 = $P3.'emit_get'(__ARG_1)
    set $S1, $P2
  __label_1: # endif
.annotate 'line', 7149
# var itvar: $P1
    getattribute $P2, self, 'varname'
    $P1 = self.'getvar'($P2)
.annotate 'line', 7150
# iterator: $S3
    $P2 = self.'createreg'('P')
    null $S3
    if_null $P2, __label_3
    set $S3, $P2
  __label_3:
.annotate 'line', 7151
# continuelabel: $S4
    $P2 = self.'gencontinuelabel'()
    null $S4
    if_null $P2, __label_4
    set $S4, $P2
  __label_4:
.annotate 'line', 7152
# breaklabel: $S5
    $P2 = self.'genbreaklabel'()
    null $S5
    if_null $P2, __label_5
    set $S5, $P2
  __label_5:
.annotate 'line', 7153
    __ARG_1.'emitarg2'('iter', $S3, $S1)
.annotate 'line', 7154
    __ARG_1.'emitset'($S3, '0')
.annotate 'line', 7155
    __ARG_1.'emitlabel'($S4, 'for iteration')
.annotate 'line', 7156
    __ARG_1.'emitunless'($S3, $S5)
.annotate 'line', 7157
    $P2 = $P1.'getreg'()
    __ARG_1.'emitarg2'('shift', $P2, $S3)
.annotate 'line', 7158
    getattribute $P2, self, 'body'
    $P2.'emit'(__ARG_1)
.annotate 'line', 7159
    __ARG_1.'emitgoto'($S4)
.annotate 'line', 7160
    __ARG_1.'emitlabel'($S5, 'endfor')
# }
.annotate 'line', 7161

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ForeachStatement' ]
.annotate 'line', 7112
    get_class $P1, [ 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'BlockStatement' ]
    addparent $P0, $P2
.annotate 'line', 7114
    addattribute $P0, 'deftype'
.annotate 'line', 7115
    addattribute $P0, 'varname'
.annotate 'line', 7116
    addattribute $P0, 'container'
.end
.namespace [ ]

.sub 'parseFor'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7168
    'ExpectOp'('(', __ARG_2)
.annotate 'line', 7169
# var aux: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7170
# var in1: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 7171
    $P4 = $P2.'iskeyword'('in')
    if_null $P4, __label_0
    unless $P4 goto __label_0
.annotate 'line', 7172
    new $P6, [ 'ForeachStatement' ]
    $P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, '')
    set $P5, $P6
    .return($P5)
    goto __label_1
  __label_0: # else
# {
.annotate 'line', 7174
# var in2: $P3
    $P3 = __ARG_2.'get'()
.annotate 'line', 7175
    $P4 = $P3.'iskeyword'('in')
    if_null $P4, __label_2
    unless $P4 goto __label_2
.annotate 'line', 7176
    new $P6, [ 'ForeachStatement' ]
    $P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P2, $P1)
    set $P5, $P6
    .return($P5)
  __label_2: # endif
.annotate 'line', 7177
    __ARG_2.'unget'($P3)
.annotate 'line', 7178
    __ARG_2.'unget'($P2)
.annotate 'line', 7179
    __ARG_2.'unget'($P1)
# }
  __label_1: # endif
.annotate 'line', 7181
    new $P5, [ 'ForStatement' ]
    $P5.'ForStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 7182

.end # parseFor

.namespace [ 'ThrowStatement' ]

.sub 'ThrowStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7194
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7195
    $P2 = 'parseExpr'(__ARG_2, self)
    setattribute self, 'excep', $P2
# }
.annotate 'line', 7196

.end # ThrowStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7199
    getattribute $P3, self, 'excep'
    $P2 = $P3.'optimize'()
    setattribute self, 'excep', $P2
.annotate 'line', 7200
    .return(self)
# }
.annotate 'line', 7201

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7204
# var excep: $P1
    getattribute $P1, self, 'excep'
.annotate 'line', 7205
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
  __label_0:
.annotate 'line', 7206
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 7207
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    set $S3, 'P'
    if $S2 == $S3 goto __label_3
    set $S3, 'S'
    if $S2 == $S3 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 7209
    __ARG_1.'emitarg1'('throw', $S1)
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 7212
    __ARG_1.'emitarg1'('die', $S1)
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 7215
    getattribute $P3, self, 'start'
    'SyntaxError'("Invalid throw argument", $P3)
  __label_1: # switch end
# }
.annotate 'line', 7217

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ThrowStatement' ]
.annotate 'line', 7188
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7190
    addattribute $P0, 'excep'
.end
.namespace [ 'TryModifierList' ]

.sub 'TryModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7229
    setattribute self, 'start', __ARG_1
.annotate 'line', 7230
    self.'ModifierList'(__ARG_2, __ARG_3)
# }
.annotate 'line', 7231

.end # TryModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 7234
# var modiflist: $P1
    $P1 = self.'getlist'()
.annotate 'line', 7235
    iter $P6, $P1
    set $P6, 0
  __label_0: # for iteration
    unless $P6 goto __label_1
    shift $P2, $P6
# {
.annotate 'line', 7236
# modifname: $S1
    $P7 = $P2.'getname'()
    null $S1
    if_null $P7, __label_2
    set $S1, $P7
  __label_2:
.annotate 'line', 7237
# nargs: $I1
    $P7 = $P2.'numargs'()
    set $I1, $P7
# switch
.annotate 'line', 7238
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
.annotate 'line', 7241
    eq $I1, 1, __label_9
.annotate 'line', 7242
    getattribute $P7, self, 'start'
    'SyntaxError'('Wrong modifier args', $P7)
  __label_9: # endif
.annotate 'line', 7243
# var arg: $P3
    $P3 = $P2.'getarg'(0)
.annotate 'line', 7244
# argreg: $S2
    $P8 = $P3.'emit_get'(__ARG_1)
    null $S2
    if_null $P8, __label_10
    set $S2, $P8
  __label_10:
.annotate 'line', 7245
    __ARG_1.'say'('    ', __ARG_2, ".'", $S1, "'(", $S2, ")")
    goto __label_3 # break
  __label_7: # case
  __label_8: # case
.annotate 'line', 7249
    new $P4, ['ResizableStringArray']
# for loop
.annotate 'line', 7250
# i: $I2
    null $I2
  __label_13: # for condition
    ge $I2, $I1, __label_12
# {
.annotate 'line', 7251
# var arg: $P5
    $P5 = $P2.'getarg'($I2)
.annotate 'line', 7252
    $P7 = $P5.'emit_get'(__ARG_1)
# predefined push
    push $P4, $P7
# }
  __label_11: # for iteration
.annotate 'line', 7250
    inc $I2
    goto __label_13
  __label_12: # for end
.annotate 'line', 7255
# predefined join
    join $S3, ', ', $P4
.annotate 'line', 7254
    __ARG_1.'say'('    ', __ARG_2, ".'", $S1, "'(", $S3, ")")
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 7258
    concat $S4, "Modifier '", $S1
    concat $S4, $S4, "' not valid for try"
    getattribute $P7, self, 'start'
    'SyntaxError'($S4, $P7)
  __label_3: # switch end
# }
    goto __label_0
  __label_1: # endfor
# }
.annotate 'line', 7261

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TryModifierList' ]
.annotate 'line', 7224
    get_class $P1, [ 'ModifierList' ]
    addparent $P0, $P1
.annotate 'line', 7226
    addattribute $P0, 'start'
.end
.namespace [ 'TryStatement' ]

.sub 'TryStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7273
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7274
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7275
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_0
    unless $P2 goto __label_0
.annotate 'line', 7276
    new $P5, [ 'TryModifierList' ]
    $P5.'TryModifierList'($P1, __ARG_2, self)
    set $P4, $P5
    setattribute self, 'modifiers', $P4
    goto __label_1
  __label_0: # else
.annotate 'line', 7278
    __ARG_2.'unget'($P1)
  __label_1: # endif
.annotate 'line', 7280
    $P3 = 'parseStatement'(__ARG_2, self)
    setattribute self, 'stry', $P3
.annotate 'line', 7281
    $P1 = __ARG_2.'get'()
.annotate 'line', 7282
    $P2 = $P1.'iskeyword'('catch')
    isfalse $I1, $P2
    unless $I1 goto __label_2
.annotate 'line', 7283
    'ExpectedOp'('catch', $P1)
  __label_2: # endif
.annotate 'line', 7284
    $P1 = __ARG_2.'get'()
.annotate 'line', 7285
    $P2 = $P1.'isop'('(')
    isfalse $I1, $P2
    unless $I1 goto __label_3
.annotate 'line', 7286
    'Expected'("'(' after 'catch'", $P1)
  __label_3: # endif
.annotate 'line', 7287
    $P1 = __ARG_2.'get'()
.annotate 'line', 7288
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_4
# {
.annotate 'line', 7289
# exname: $S1
    $P3 = $P1.'getidentifier'()
    null $S1
    if_null $P3, __label_5
    set $S1, $P3
  __label_5:
.annotate 'line', 7290
    setattribute self, 'exname', $P1
.annotate 'line', 7291
    self.'createvar'($S1, 'P')
.annotate 'line', 7292
    $P1 = __ARG_2.'get'()
.annotate 'line', 7293
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_6
.annotate 'line', 7294
    'Expected'("')' in 'catch'", $P1)
  __label_6: # endif
# }
  __label_4: # endif
.annotate 'line', 7296
    $P3 = 'parseStatement'(__ARG_2, self)
    setattribute self, 'scatch', $P3
# }
.annotate 'line', 7297

.end # TryStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7300
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_0
.annotate 'line', 7301
    getattribute $P2, self, 'modifiers'
    $P2.'optimize'()
  __label_0: # endif
.annotate 'line', 7302
    getattribute $P3, self, 'stry'
    $P2 = $P3.'optimize'()
    setattribute self, 'stry', $P2
.annotate 'line', 7303
    getattribute $P3, self, 'scatch'
    $P2 = $P3.'optimize'()
    setattribute self, 'scatch', $P2
.annotate 'line', 7304
    .return(self)
# }
.annotate 'line', 7305

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7308
# reghandler: $S1
    $P2 = self.'tempreg'('P')
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
  __label_0:
.annotate 'line', 7309
# labelhandler: $S2
    $P2 = self.'genlabel'()
    null $S2
    if_null $P2, __label_1
    set $S2, $P2
  __label_1:
.annotate 'line', 7310
# labelpasthandler: $S3
    $P2 = self.'genlabel'()
    null $S3
    if_null $P2, __label_2
    set $S3, $P2
  __label_2:
.annotate 'line', 7311
# exreg: $S4
    null $S4
.annotate 'line', 7312
    getattribute $P2, self, 'exname'
    if_null $P2, __label_3
# {
.annotate 'line', 7313
# var exname: $P1
    getattribute $P3, self, 'exname'
    $P1 = self.'getvar'($P3)
.annotate 'line', 7314
    $P2 = $P1.'getreg'()
    set $S4, $P2
# }
    goto __label_4
  __label_3: # else
.annotate 'line', 7317
    $P2 = self.'tempreg'('P')
    set $S4, $P2
  __label_4: # endif
.annotate 'line', 7319
    self.'annotate'(__ARG_1)
.annotate 'line', 7320
    __ARG_1.'comment'('try: create handler')
.annotate 'line', 7322
    __ARG_1.'say'('    ', 'new ', $S1, ", 'ExceptionHandler'")
.annotate 'line', 7323
    __ARG_1.'say'('    ', 'set_label ', $S1, ', ', $S2)
.annotate 'line', 7325
    getattribute $P2, self, 'modifiers'
    if_null $P2, __label_5
.annotate 'line', 7326
    getattribute $P3, self, 'modifiers'
    $P3.'emitmodifiers'(__ARG_1, $S1)
  __label_5: # endif
.annotate 'line', 7328
    __ARG_1.'emitarg1'('push_eh', $S1)
.annotate 'line', 7329
    __ARG_1.'comment'('try: begin')
.annotate 'line', 7330
    getattribute $P2, self, 'stry'
    $P2.'emit'(__ARG_1)
.annotate 'line', 7331
    __ARG_1.'comment'('try: end')
.annotate 'line', 7332
    __ARG_1.'say'('    ', 'pop_eh')
.annotate 'line', 7334
    self.'annotate'(__ARG_1)
.annotate 'line', 7335
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 7337
    __ARG_1.'comment'('catch')
.annotate 'line', 7338
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 7339
    __ARG_1.'say'('    ', '.get_results(', $S4, ')')
.annotate 'line', 7340
    __ARG_1.'emitarg1'('finalize', $S4)
.annotate 'line', 7341
    __ARG_1.'say'('    ', 'pop_eh')
.annotate 'line', 7342
    getattribute $P2, self, 'scatch'
    $P2.'emit'(__ARG_1)
.annotate 'line', 7344
    __ARG_1.'comment'('catch end')
.annotate 'line', 7345
    __ARG_1.'emitlabel'($S3)
# }
.annotate 'line', 7346

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TryStatement' ]
.annotate 'line', 7264
    get_class $P1, [ 'BlockStatement' ]
    addparent $P0, $P1
.annotate 'line', 7266
    addattribute $P0, 'stry'
.annotate 'line', 7267
    addattribute $P0, 'modifiers'
.annotate 'line', 7268
    addattribute $P0, 'exname'
.annotate 'line', 7269
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
.annotate 'line', 7359
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7360
    setattribute self, 'name', __ARG_3
.annotate 'line', 7361
# var vdata: $P1
    $P1 = self.'createvar'(__ARG_3, 'P', __ARG_4)
.annotate 'line', 7362
    $P3 = $P1.'getreg'()
    setattribute self, 'reg', $P3
# }
.annotate 'line', 7363

.end # initvarbase

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'VarBaseStatement' ]
.annotate 'line', 7353
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7355
    addattribute $P0, 'name'
.annotate 'line', 7356
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
.annotate 'line', 7378
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7379
    setattribute self, 'name', __ARG_3
.annotate 'line', 7380
    box $P1, __ARG_4
    setattribute self, 'basetype', $P1
# }
.annotate 'line', 7381

.end # DeclareBase

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'DeclareBase' ]
.annotate 'line', 7370
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7372
    addattribute $P0, 'name'
.annotate 'line', 7373
    addattribute $P0, 'basetype'
.annotate 'line', 7374
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
.annotate 'line', 7392
    self.'DeclareBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 7393
# var vdata: $P1
    getattribute $P3, self, 'name'
    getattribute $P4, self, 'basetype'
    $P1 = self.'createvar'($P3, $P4)
.annotate 'line', 7394
    $P4 = $P1.'getreg'()
    setattribute self, 'reg', $P4
.annotate 'line', 7395
# var t: $P2
    $P2 = __ARG_5.'get'()
.annotate 'line', 7396
    $P3 = $P2.'isop'('=')
    if_null $P3, __label_0
    unless $P3 goto __label_0
# {
.annotate 'line', 7398
    $P5 = 'parseExpr'(__ARG_5, self)
    setattribute self, 'init', $P5
# }
    goto __label_1
  __label_0: # else
.annotate 'line', 7401
    __ARG_5.'unget'($P2)
  __label_1: # endif
# }
.annotate 'line', 7402

.end # DeclareSingleStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7405
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 7406
    if_null $P1, __label_0
.annotate 'line', 7407
    $P3 = $P1.'optimize'()
    setattribute self, 'init', $P3
  __label_0: # endif
.annotate 'line', 7408
    .return(self)
# }
.annotate 'line', 7409

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7412
    self.'annotate'(__ARG_1)
.annotate 'line', 7413
# name: $S1
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
  __label_0:
.annotate 'line', 7414
# reg: $S2
    getattribute $P2, self, 'reg'
    null $S2
    if_null $P2, __label_1
    set $S2, $P2
  __label_1:
.annotate 'line', 7415
# basetype: $S3
    getattribute $P2, self, 'basetype'
    null $S3
    if_null $P2, __label_2
    set $S3, $P2
  __label_2:
.annotate 'line', 7416
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 7417
    concat $S7, $S1, ': '
    concat $S7, $S7, $S2
    __ARG_1.'comment'($S7)
.annotate 'line', 7419
    isnull $I1, $P1
    if $I1 goto __label_5
    $I1 = $P1.'isnull'()
  __label_5:
    unless $I1 goto __label_3
.annotate 'line', 7420
    __ARG_1.'emitnull'($S2)
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 7422
# itype: $S4
    $P2 = $P1.'checkresult'()
    null $S4
    if_null $P2, __label_6
    set $S4, $P2
  __label_6:
.annotate 'line', 7423
    ne $S4, $S3, __label_7
# {
.annotate 'line', 7424
    iseq $I1, $S4, 'S'
    unless $I1 goto __label_11
    isa $I1, $P1, [ 'ConcatString' ]
  __label_11:
    unless $I1 goto __label_9
.annotate 'line', 7425
    $P1.'emit_concat_set'(__ARG_1, $S2)
    goto __label_10
  __label_9: # else
.annotate 'line', 7427
    $P1.'emit'(__ARG_1, $S2)
  __label_10: # endif
# }
    goto __label_8
  __label_7: # else
# {
.annotate 'line', 7430
    isa $I1, $P1, [ 'IndexExpr' ]
    unless $I1 goto __label_12
# {
.annotate 'line', 7432
    $P1.'emit'(__ARG_1, $S2)
# }
    goto __label_13
  __label_12: # else
# {
.annotate 'line', 7435
# ireg: $S5
    null $S5
.annotate 'line', 7436
    ne $S4, '', __label_14
.annotate 'line', 7437
    $P2 = $P1.'emit_get'(__ARG_1)
    set $S5, $P2
    goto __label_15
  __label_14: # else
# {
.annotate 'line', 7439
    $P3 = self.'tempreg'($S4)
    set $S5, $P3
.annotate 'line', 7440
    $P1.'emit'(__ARG_1, $S5)
# }
  __label_15: # endif
.annotate 'line', 7442
    iseq $I1, $S3, 'S'
    unless $I1 goto __label_18
    iseq $I1, $S4, 'P'
  __label_18:
    unless $I1 goto __label_16
# {
.annotate 'line', 7443
# auxlabel: $S6
    $P2 = self.'genlabel'()
    null $S6
    if_null $P2, __label_19
    set $S6, $P2
  __label_19:
.annotate 'line', 7444
    __ARG_1.'emitnull'($S2)
.annotate 'line', 7445
    __ARG_1.'emitif_null'($S5, $S6)
.annotate 'line', 7446
    __ARG_1.'emitset'($S2, $S5)
.annotate 'line', 7447
    __ARG_1.'emitlabel'($S6)
# }
    goto __label_17
  __label_16: # else
.annotate 'line', 7450
    __ARG_1.'emitset'($S2, $S5)
  __label_17: # endif
# }
  __label_13: # endif
# }
  __label_8: # endif
# }
  __label_4: # endif
# }
.annotate 'line', 7454

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'DeclareSingleStatement' ]
.annotate 'line', 7386
    get_class $P1, [ 'DeclareBase' ]
    addparent $P0, $P1
.annotate 'line', 7388
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
.annotate 'line', 7469
    self.'DeclareBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 7470
    box $P3, __ARG_5
    setattribute self, 'arraytype', $P3
.annotate 'line', 7471
# var vdata: $P1
    getattribute $P3, self, 'name'
    $P1 = self.'createvar'($P3, 'P')
.annotate 'line', 7472
    $P4 = $P1.'getreg'()
    setattribute self, 'reg', $P4
.annotate 'line', 7473
# var t: $P2
    $P2 = __ARG_6.'get'()
.annotate 'line', 7474
    $P3 = $P2.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_0
# {
.annotate 'line', 7476
    __ARG_6.'unget'($P2)
.annotate 'line', 7477
    $P4 = 'parseExpr'(__ARG_6, self)
    setattribute self, 'size', $P4
.annotate 'line', 7478
    'ExpectOp'(']', __ARG_6)
# }
  __label_0: # endif
.annotate 'line', 7480
    $P2 = __ARG_6.'get'()
.annotate 'line', 7481
    $P3 = $P2.'isop'('=')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 7482
    $P2 = __ARG_6.'get'()
.annotate 'line', 7483
    $P3 = $P2.'isop'('[')
    isfalse $I1, $P3
    unless $I1 goto __label_3
.annotate 'line', 7484
    'Expected'("array initializer", $P2)
  __label_3: # endif
.annotate 'line', 7485
    $P2 = __ARG_6.'get'()
.annotate 'line', 7486
    $P3 = $P2.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_4
# {
.annotate 'line', 7487
    __ARG_6.'unget'($P2)
.annotate 'line', 7488
.const 'Sub' $P5 = 'parseExpr'
.annotate 'line', 7489
    $P4 = 'parseList'(__ARG_6, self, $P5)
    setattribute self, 'initarray', $P4
.annotate 'line', 7490
    $P2 = __ARG_6.'get'()
.annotate 'line', 7491
    $P3 = $P2.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_6
.annotate 'line', 7492
    'Expected'("',' or ']'", $P2)
  __label_6: # endif
# }
    goto __label_5
  __label_4: # else
.annotate 'line', 7495
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'initarray', $P4
  __label_5: # endif
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 7498
    __ARG_6.'unget'($P2)
  __label_2: # endif
# }
.annotate 'line', 7499

.end # DeclareArrayStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7502
    getattribute $P1, self, 'size'
    if_null $P1, __label_0
.annotate 'line', 7503
    getattribute $P4, self, 'size'
    $P3 = $P4.'optimize'()
    setattribute self, 'size', $P3
  __label_0: # endif
.annotate 'line', 7504
    getattribute $P1, self, 'initarray'
    'optimize_array'($P1)
.annotate 'line', 7505
    .return(self)
# }
.annotate 'line', 7506

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7509
    self.'annotate'(__ARG_1)
.annotate 'line', 7511
# var reg: $P1
    getattribute $P1, self, 'reg'
.annotate 'line', 7512
# var size: $P2
    getattribute $P2, self, 'size'
.annotate 'line', 7513
# var init: $P3
    getattribute $P3, self, 'initarray'
.annotate 'line', 7514
# var basetype: $P4
    getattribute $P4, self, 'basetype'
.annotate 'line', 7515
# arraytype: $S1
# predefined string
    getattribute $P6, self, 'arraytype'
    set $S4, $P6
    concat $S1, $S4, 'Array'
.annotate 'line', 7516
    if_null $P2, __label_0
# {
.annotate 'line', 7518
# regsize: $S2
    $P6 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P6, __label_2
    set $S2, $P6
  __label_2:
.annotate 'line', 7519
    __ARG_1.'say'('    ', 'new ', $P1, ", ['Fixed", $S1, "'], ", $S2)
# }
    goto __label_1
  __label_0: # else
# {
.annotate 'line', 7523
    __ARG_1.'say'('    ', 'new ', $P1, ", ['Resizable", $S1, "']")
# }
  __label_1: # endif
.annotate 'line', 7525
    if_null $P3, __label_3
# {
.annotate 'line', 7526
# itemreg: $S3
    $P6 = self.'tempreg'($P4)
    null $S3
    if_null $P6, __label_4
    set $S3, $P6
  __label_4:
.annotate 'line', 7527
# n: $I1
# predefined elements
    elements $I1, $P3
.annotate 'line', 7528
    unless_null $P2, __label_5
# {
.annotate 'line', 7529
    le $I1, 0, __label_6
# {
.annotate 'line', 7531
    __ARG_1.'emitset'($P1, $I1)
# }
  __label_6: # endif
# }
  __label_5: # endif
.annotate 'line', 7534
# i: $I2
    null $I2
.annotate 'line', 7535
    iter $P7, $P3
    set $P7, 0
  __label_7: # for iteration
    unless $P7 goto __label_8
    shift $P5, $P7
# {
.annotate 'line', 7536
    $P5.'emit'(__ARG_1, $S3)
.annotate 'line', 7537
    __ARG_1.'say'('    ', $P1, '[', $I2, '] = ', $S3)
.annotate 'line', 7538
    inc $I2
# }
    goto __label_7
  __label_8: # endfor
# }
  __label_3: # endif
# }
.annotate 'line', 7541

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'DeclareArrayStatement' ]
.annotate 'line', 7459
    get_class $P1, [ 'DeclareBase' ]
    addparent $P0, $P1
.annotate 'line', 7461
    addattribute $P0, 'size'
.annotate 'line', 7462
    addattribute $P0, 'initarray'
.annotate 'line', 7463
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
.annotate 'line', 7548
# var next: $P1
    null $P1
.annotate 'line', 7549
# var r: $P2
    null $P2
  __label_0: # do
.annotate 'line', 7550
# {
.annotate 'line', 7551
# var name: $P3
    $P3 = __ARG_4.'get'()
.annotate 'line', 7552
    'RequireIdentifier'($P3)
.annotate 'line', 7553
# var t: $P4
    $P4 = __ARG_4.'get'()
.annotate 'line', 7554
# var item: $P5
    null $P5
.annotate 'line', 7555
    $P6 = $P4.'isop'('[')
    if_null $P6, __label_3
    unless $P6 goto __label_3
.annotate 'line', 7556
    $P5 = __ARG_2(__ARG_3, __ARG_5, __ARG_4, $P3)
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 7558
    __ARG_4.'unget'($P4)
.annotate 'line', 7559
    $P5 = __ARG_1(__ARG_3, __ARG_5, $P3, __ARG_4)
# }
  __label_4: # endif
.annotate 'line', 7561
    $P2 = 'addtomulti'($P2, $P5)
.annotate 'line', 7562
    $P1 = __ARG_4.'get'()
# }
  __label_2: # continue
.annotate 'line', 7563
    $P6 = $P1.'isop'(',')
    if_null $P6, __label_1
    if $P6 goto __label_0
  __label_1: # enddo
.annotate 'line', 7564
    'RequireOp'(';', $P1)
.annotate 'line', 7565
    .return($P2)
# }
.annotate 'line', 7566

.end # parseDeclareHelper

.namespace [ 'IntStatement' ]

.sub 'IntStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7574
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'I', __ARG_4)
# }
.annotate 'line', 7575

.end # IntStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IntStatement' ]
.annotate 'line', 7570
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
.annotate 'line', 7582
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'I', 'Integer', __ARG_4)
# }
.annotate 'line', 7583

.end # IntArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IntArrayStatement' ]
.annotate 'line', 7578
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
.annotate 'line', 7589
    new $P2, [ 'IntStatement' ]
    $P2.'IntStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7590

.end # newIntSingle


.sub 'newIntArray'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7594
    new $P2, [ 'IntArrayStatement' ]
    $P2.'IntArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7595

.end # newIntArray


.sub 'parseInt'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7599
.const 'Sub' $P1 = 'newIntSingle'
.const 'Sub' $P2 = 'newIntArray'
.annotate 'line', 7600
    .tailcall 'parseDeclareHelper'($P1, $P2, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7601

.end # parseInt

.namespace [ 'FloatStatement' ]

.sub 'FloatStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7609
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'N', __ARG_4)
# }
.annotate 'line', 7610

.end # FloatStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FloatStatement' ]
.annotate 'line', 7605
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
.annotate 'line', 7617
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'N', 'Float', __ARG_4)
# }
.annotate 'line', 7618

.end # FloatArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FloatArrayStatement' ]
.annotate 'line', 7613
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
.annotate 'line', 7624
    new $P2, [ 'FloatStatement' ]
    $P2.'FloatStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7625

.end # newFloatSingle


.sub 'newFloatArray'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7629
    new $P2, [ 'FloatArrayStatement' ]
    $P2.'FloatArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7630

.end # newFloatArray


.sub 'parseFloat'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7634
.const 'Sub' $P1 = 'newFloatSingle'
.const 'Sub' $P2 = 'newFloatArray'
.annotate 'line', 7635
    .tailcall 'parseDeclareHelper'($P1, $P2, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7636

.end # parseFloat

.namespace [ 'StringStatement' ]

.sub 'StringStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7644
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'S', __ARG_4)
# }
.annotate 'line', 7645

.end # StringStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'StringStatement' ]
.annotate 'line', 7640
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
.annotate 'line', 7652
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'S', 'String', __ARG_4)
# }
.annotate 'line', 7653

.end # StringArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'StringArrayStatement' ]
.annotate 'line', 7648
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
.annotate 'line', 7659
    new $P2, [ 'StringStatement' ]
    $P2.'StringStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7660

.end # newStringSingle


.sub 'newStringArray'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7664
    new $P2, [ 'StringArrayStatement' ]
    $P2.'StringArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7665

.end # newStringArray


.sub 'parseString'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7669
.const 'Sub' $P1 = 'newStringSingle'
.const 'Sub' $P2 = 'newStringArray'
.annotate 'line', 7670
    .tailcall 'parseDeclareHelper'($P1, $P2, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7671

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
.annotate 'line', 7686
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7687
    box $P1, __ARG_3
    setattribute self, 'type', $P1
.annotate 'line', 7688
    setattribute self, 'name', __ARG_4
.annotate 'line', 7689
    setattribute self, 'value', __ARG_5
# }
.annotate 'line', 7690

.end # ConstStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7693
# var value: $P1
    getattribute $P1, self, 'value'
.annotate 'line', 7694
# var name: $P2
    getattribute $P2, self, 'name'
.annotate 'line', 7695
# type: $S1
    getattribute $P3, self, 'type'
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
  __label_0:
.annotate 'line', 7696
    $P1 = $P1.'optimize'()
.annotate 'line', 7697
    $P3 = $P1.'hascompilevalue'()
    isfalse $I1, $P3
    unless $I1 goto __label_1
# {
.annotate 'line', 7699
    getattribute $P4, self, 'start'
.annotate 'line', 7698
    'SyntaxError'('Value for const is not evaluable at compile time', $P4)
# }
  __label_1: # endif
.annotate 'line', 7701
    self.'createconst'($P2, $S1, $P1, '')
.annotate 'line', 7702
    setattribute self, 'value', $P1
.annotate 'line', 7703
    .return(self)
# }
.annotate 'line', 7704

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 7707
    getattribute $P1, self, 'start'
    'InternalError'('Direct use of const', $P1)
# }
.annotate 'line', 7708

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7711
# name: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 7712
    concat $S2, 'Constant ', $S1
    concat $S2, $S2, ' evaluated at compile time'
    __ARG_1.'comment'($S2)
# }
.annotate 'line', 7713

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ConstStatement' ]
.annotate 'line', 7677
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7679
    addattribute $P0, 'type'
.annotate 'line', 7680
    addattribute $P0, 'name'
.annotate 'line', 7681
    addattribute $P0, 'value'
.end
.namespace [ ]

.sub 'parseConst'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7718
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7719
# type: $S1
    $P5 = 'typetoregcheck'($P1)
    null $S1
    if_null $P5, __label_0
    set $S1, $P5
  __label_0:
.annotate 'line', 7720
    isne $I1, $S1, 'I'
    unless $I1 goto __label_3
    isne $I1, $S1, 'N'
  __label_3:
    unless $I1 goto __label_2
    isne $I1, $S1, 'S'
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 7721
    'SyntaxError'('Invalid type for const', __ARG_1)
  __label_1: # endif
.annotate 'line', 7723
# var multi: $P2
    null $P2
  __label_4: # do
.annotate 'line', 7724
# {
.annotate 'line', 7725
    $P1 = __ARG_2.'get'()
.annotate 'line', 7726
# var name: $P3
    set $P3, $P1
.annotate 'line', 7727
    'ExpectOp'('=', __ARG_2)
.annotate 'line', 7728
# var value: $P4
    $P4 = 'parseExpr'(__ARG_2, __ARG_3)
.annotate 'line', 7730
    new $P6, [ 'ConstStatement' ]
    $P6.'ConstStatement'($P1, __ARG_3, $S1, $P3, $P4)
    set $P5, $P6
.annotate 'line', 7729
    $P2 = 'addtomulti'($P2, $P5)
# }
  __label_6: # continue
.annotate 'line', 7731
    $P1 = __ARG_2.'get'()
    $P5 = $P1.'isop'(',')
    if_null $P5, __label_5
    if $P5 goto __label_4
  __label_5: # enddo
.annotate 'line', 7732
    .return($P2)
# }
.annotate 'line', 7733

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
.annotate 'line', 7744
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 7745
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7746
    $P2 = $P1.'isop'('=')
    if_null $P2, __label_0
    unless $P2 goto __label_0
# {
.annotate 'line', 7747
    $P4 = 'parseExpr'(__ARG_2, self)
    setattribute self, 'init', $P4
.annotate 'line', 7748
    $P1 = __ARG_2.'get'()
# }
  __label_0: # endif
.annotate 'line', 7750
    'RequireOp'(';', $P1)
# }
.annotate 'line', 7751

.end # VarStatement


.sub 'optimize_init' :method
# Body
# {
.annotate 'line', 7754
    getattribute $P1, self, 'init'
    if_null $P1, __label_0
.annotate 'line', 7755
    getattribute $P4, self, 'init'
    $P3 = $P4.'optimize'()
    setattribute self, 'init', $P3
  __label_0: # endif
.annotate 'line', 7756
    .return(self)
# }
.annotate 'line', 7757

.end # optimize_init


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7760
    .tailcall self.'optimize_init'()
# }
.annotate 'line', 7761

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7764
    self.'annotate'(__ARG_1)
.annotate 'line', 7765
# name: $S1
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
  __label_0:
.annotate 'line', 7766
# reg: $S2
    getattribute $P2, self, 'reg'
    null $S2
    if_null $P2, __label_1
    set $S2, $P2
  __label_1:
.annotate 'line', 7767
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 7768
    concat $S5, 'var ', $S1
    concat $S5, $S5, ': '
    concat $S5, $S5, $S2
    __ARG_1.'comment'($S5)
.annotate 'line', 7769
    if_null $P1, __label_2
.annotate 'line', 7770
    $P2 = $P1.'isnull'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 7771
    null $P1
  __label_3: # endif
  __label_2: # endif
.annotate 'line', 7772
    if_null $P1, __label_4
# {
.annotate 'line', 7773
# type: $S3
    $P2 = $P1.'checkresult'()
    null $S3
    if_null $P2, __label_6
    set $S3, $P2
  __label_6:
# switch
.annotate 'line', 7774
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
.annotate 'line', 7776
    isa $I1, $P1, [ 'MemberExpr' ]
    if $I1 goto __label_17
    isa $I1, $P1, [ 'ArrayExpr' ]
  __label_17:
    if $I1 goto __label_16
    isa $I1, $P1, [ 'NewExpr' ]
  __label_16:
    unless $I1 goto __label_14
.annotate 'line', 7777
    $P1.'emit_init'(__ARG_1, $S2)
    goto __label_15
  __label_14: # else
.annotate 'line', 7779
    $P1.'emit'(__ARG_1, $S2)
  __label_15: # endif
    goto __label_7 # break
  __label_10: # case
  __label_11: # case
  __label_12: # case
.annotate 'line', 7784
# value: $S4
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P2, __label_18
    set $S4, $P2
  __label_18:
.annotate 'line', 7785
    __ARG_1.'emitbox'($S2, $S4)
    goto __label_7 # break
  __label_13: # case
.annotate 'line', 7788
    getattribute $P3, self, 'name'
    'SyntaxError'("Can't use void function as initializer", $P3)
  __label_8: # default
.annotate 'line', 7790
    getattribute $P4, self, 'name'
    'SyntaxError'("Invalid var initializer", $P4)
  __label_7: # switch end
# }
    goto __label_5
  __label_4: # else
.annotate 'line', 7794
    __ARG_1.'emitnull'($S2)
  __label_5: # endif
# }
.annotate 'line', 7795

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'VarStatement' ]
.annotate 'line', 7739
    get_class $P1, [ 'VarBaseStatement' ]
    addparent $P0, $P1
.annotate 'line', 7741
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
.annotate 'line', 7802
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 7803
    'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 7804

.end # ResizableVarStatement


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7807
    self.'annotate'(__ARG_1)
.annotate 'line', 7808
# name: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 7809
# reg: $S2
    getattribute $P1, self, 'reg'
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
  __label_1:
.annotate 'line', 7810
    concat $S3, 'var ', $S1
    concat $S3, $S3, '[] : '
    concat $S3, $S3, $S2
    __ARG_1.'comment'($S3)
.annotate 'line', 7811
    __ARG_1.'say'('    ', 'new ', $S2, ", 'ResizablePMCArray'")
# }
.annotate 'line', 7812

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ResizableVarStatement' ]
.annotate 'line', 7798
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
.annotate 'line', 7821
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 7822
    $P2 = 'parseExpr'(__ARG_2, self)
    setattribute self, 'exprsize', $P2
.annotate 'line', 7823
    'ExpectOp'(']', __ARG_2)
.annotate 'line', 7824
    'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 7825

.end # FixedVarStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7828
    getattribute $P3, self, 'exprsize'
    $P2 = $P3.'optimize'()
    setattribute self, 'exprsize', $P2
.annotate 'line', 7829
    .tailcall self.'optimize_init'()
# }
.annotate 'line', 7830

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7833
# regsize: $S1
    getattribute $P2, self, 'exprsize'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 7834
    self.'annotate'(__ARG_1)
.annotate 'line', 7835
# name: $S2
    getattribute $P1, self, 'name'
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
  __label_1:
.annotate 'line', 7836
# reg: $S3
    getattribute $P1, self, 'reg'
    null $S3
    if_null $P1, __label_2
    set $S3, $P1
  __label_2:
.annotate 'line', 7837
    concat $S4, 'var ', $S2
    concat $S4, $S4, '[] : '
    concat $S4, $S4, $S3
    __ARG_1.'comment'($S4)
.annotate 'line', 7838
    __ARG_1.'say'('    ', 'new ', $S3, ", 'FixedPMCArray', ", $S1)
# }
.annotate 'line', 7839

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FixedVarStatement' ]
.annotate 'line', 7815
    get_class $P1, [ 'VarStatement' ]
    addparent $P0, $P1
.annotate 'line', 7817
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
.annotate 'line', 7844
# var name: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7845
    'RequireIdentifier'($P1)
.annotate 'line', 7846
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 7847
    $P3 = $P2.'isop'('[')
    if_null $P3, __label_0
    unless $P3 goto __label_0
# {
.annotate 'line', 7848
    $P2 = __ARG_2.'get'()
.annotate 'line', 7849
    $P3 = $P2.'isop'(']')
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 7850
    new $P5, [ 'ResizableVarStatement' ]
    $P5.'ResizableVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P4, $P5
    .return($P4)
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 7852
    __ARG_2.'unget'($P2)
.annotate 'line', 7853
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
.annotate 'line', 7857
    __ARG_2.'unget'($P2)
.annotate 'line', 7858
    new $P4, [ 'VarStatement' ]
    $P4.'VarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, __ARG_4)
    set $P3, $P4
    .return($P3)
# }
  __label_1: # endif
# }
.annotate 'line', 7860

.end # parseVar


.sub 'parseVolatile'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7864
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7865
    $P2 = $P1.'iskeyword'('var')
    isfalse $I1, $P2
    unless $I1 goto __label_0
.annotate 'line', 7866
    'SyntaxError'("invalid volatile type", $P1)
  __label_0: # endif
.annotate 'line', 7867
    .tailcall 'parseVar'(__ARG_1, __ARG_2, __ARG_3, 1)
# }
.annotate 'line', 7868

.end # parseVolatile

.namespace [ 'CompoundStatement' ]

.sub 'CompoundStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7881
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7882
    root_new $P4, ['parrot';'Hash']
    setattribute self, 'labels', $P4
.annotate 'line', 7883
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'statements', $P4
.annotate 'line', 7884
# var t: $P1
    null $P1
  __label_1: # while
.annotate 'line', 7885
    $P1 = __ARG_2.'get'()
    $P3 = $P1.'isop'('}')
    isfalse $I1, $P3
    unless $I1 goto __label_0
# {
.annotate 'line', 7886
    __ARG_2.'unget'($P1)
.annotate 'line', 7887
# var c: $P2
    $P2 = 'parseStatement'(__ARG_2, self)
.annotate 'line', 7888
    unless_null $P2, __label_2
.annotate 'line', 7889
    'InternalError'('Unexpected null statement')
  __label_2: # endif
.annotate 'line', 7890
    getattribute $P3, self, 'statements'
# predefined push
    push $P3, $P2
# }
    goto __label_1
  __label_0: # endwhile
.annotate 'line', 7892
    setattribute self, 'end', $P1
# }
.annotate 'line', 7893

.end # CompoundStatement


.sub 'getlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7896
# s: $S1
    set $P2, __ARG_1
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
  __label_0:
.annotate 'line', 7897
# var labels: $P1
    getattribute $P1, self, 'labels'
.annotate 'line', 7898
# exist: $S2
    $S2 = $P1[$S1]
.annotate 'line', 7899
    isnull $I1, $S2
    if $I1 goto __label_2
    iseq $I1, $S2, ''
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 7900
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getlabel'(__ARG_1)
    set $S2, $P2
  __label_1: # endif
.annotate 'line', 7901
    .return($S2)
# }
.annotate 'line', 7902

.end # getlabel


.sub 'createlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7905
# s: $S1
    set $P2, __ARG_1
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
  __label_0:
.annotate 'line', 7906
# var labels: $P1
    getattribute $P1, self, 'labels'
.annotate 'line', 7907
# exist: $S2
    $S2 = $P1[$S1]
.annotate 'line', 7908
    isnull $I1, $S2
    not $I1
    unless $I1 goto __label_2
    isne $I1, $S2, ''
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 7909
    'SyntaxError'('Label already defined', __ARG_1)
  __label_1: # endif
.annotate 'line', 7910
# value: $S3
    $P2 = self.'genlabel'()
    null $S3
    if_null $P2, __label_3
    set $S3, $P2
  __label_3:
.annotate 'line', 7911
    $P1[$S1] = $S3
.annotate 'line', 7912
    .return($S3)
# }
.annotate 'line', 7913

.end # createlabel


.sub 'getend' :method
# Body
# {
.annotate 'line', 7914
    getattribute $P1, self, 'end'
    .return($P1)
# }

.end # getend


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7917
    __ARG_1.'comment'('{')
.annotate 'line', 7918
    getattribute $P2, self, 'statements'
    iter $P3, $P2
    set $P3, 0
  __label_0: # for iteration
    unless $P3 goto __label_1
    shift $P1, $P3
# {
.annotate 'line', 7919
    $P1.'emit'(__ARG_1)
.annotate 'line', 7920
    self.'freetemps'()
# }
    goto __label_0
  __label_1: # endfor
.annotate 'line', 7922
    __ARG_1.'comment'('}')
# }
.annotate 'line', 7923

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CompoundStatement' ]
.annotate 'line', 7874
    get_class $P1, [ 'MultiStatementBase' ]
    addparent $P0, $P1
    get_class $P2, [ 'BlockStatement' ]
    addparent $P0, $P2
.annotate 'line', 7876
    addattribute $P0, 'end'
.annotate 'line', 7877
    addattribute $P0, 'labels'
.end
.namespace [ 'RegisterStore' ]

.sub 'RegisterStore' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 7938
    box $P3, __ARG_1
    setattribute self, 'type', $P3
.annotate 'line', 7940
    box $P3, 1
    setattribute self, 'nreg', $P3
.annotate 'line', 7941
    new $P1, ['ResizableStringArray']
.annotate 'line', 7942
    new $P2, ['ResizableStringArray']
.annotate 'line', 7943
    setattribute self, 'tempreg', $P1
.annotate 'line', 7944
    setattribute self, 'freereg', $P2
# }
.annotate 'line', 7945

.end # RegisterStore


.sub 'createreg' :method
# Body
# {
.annotate 'line', 7948
# var n: $P1
    getattribute $P1, self, 'nreg'
.annotate 'line', 7949
# i: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 7950
# reg: $S1
    set $I2, $I1
    inc $I1
    set $S1, $I2
.annotate 'line', 7951
    assign $P1, $I1
.annotate 'line', 7952
# type: $S2
    getattribute $P2, self, 'type'
    null $S2
    if_null $P2, __label_0
    set $S2, $P2
  __label_0:
.annotate 'line', 7953
    concat $S0, '$', $S2
    concat $S0, $S0, $S1
    set $S1, $S0
.annotate 'line', 7954
    .return($S1)
# }
.annotate 'line', 7955

.end # createreg


.sub 'tempreg' :method
# Body
# {
.annotate 'line', 7958
# var freereg: $P1
    getattribute $P1, self, 'freereg'
.annotate 'line', 7959
# var tempreg: $P2
    getattribute $P2, self, 'tempreg'
.annotate 'line', 7960
# reg: $S1
    null $S1
.annotate 'line', 7961
# predefined elements
    elements $I1, $P1
    le $I1, 0, __label_0
.annotate 'line', 7962
    $P3 = $P1.'pop'()
    set $S1, $P3
    goto __label_1
  __label_0: # else
.annotate 'line', 7964
    $P4 = self.'createreg'()
    set $S1, $P4
  __label_1: # endif
.annotate 'line', 7965
# predefined push
    push $P2, $S1
.annotate 'line', 7966
    .return($S1)
# }
.annotate 'line', 7967

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 7970
# var freereg: $P1
    getattribute $P1, self, 'freereg'
.annotate 'line', 7971
# var tempreg: $P2
    getattribute $P2, self, 'tempreg'
.annotate 'line', 7972
# n: $I1
# predefined elements
    elements $I1, $P2
# for loop
.annotate 'line', 7973
# i: $I2
    sub $I2, $I1, 1
  __label_2: # for condition
    lt $I2, 0, __label_1
# {
.annotate 'line', 7974
# s: $S1
    $S1 = $P2[$I2]
.annotate 'line', 7975
# predefined push
    push $P1, $S1
# }
  __label_0: # for iteration
.annotate 'line', 7973
    dec $I2
    goto __label_2
  __label_1: # for end
.annotate 'line', 7977
    assign $P2, 0
# }
.annotate 'line', 7978

.end # freetemps

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'RegisterStore' ]
.annotate 'line', 7932
    addattribute $P0, 'type'
.annotate 'line', 7933
    addattribute $P0, 'nreg'
.annotate 'line', 7934
    addattribute $P0, 'tempreg'
.annotate 'line', 7935
    addattribute $P0, 'freereg'
.end
.namespace [ 'ParameterModifierList' ]

.sub 'ParameterModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 7989
    self.'ModifierList'(__ARG_1, __ARG_2)
# }
.annotate 'line', 7990

.end # ParameterModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 7993
# var named: $P1
    null $P1
.annotate 'line', 7994
# var slurpy: $P2
    null $P2
.annotate 'line', 7995
# var modarglist: $P3
    $P3 = self.'getlist'()
.annotate 'line', 7996
    iter $P6, $P3
    set $P6, 0
  __label_0: # for iteration
    unless $P6 goto __label_1
    shift $P4, $P6
# {
.annotate 'line', 7997
# modname: $S1
    $P7 = $P4.'getname'()
    null $S1
    if_null $P7, __label_2
    set $S1, $P7
  __label_2:
# switch
.annotate 'line', 7998
    set $S3, $S1
    set $S4, 'named'
    if $S3 == $S4 goto __label_5
    set $S4, 'slurpy'
    if $S3 == $S4 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 8000
    set $P1, $P4
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 8003
    set $P2, $P4
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 8006
    __ARG_1.'print'(' :', $S1)
  __label_3: # switch end
# }
    goto __label_0
  __label_1: # endfor
# switch-case
.annotate 'line', 8010
    isnull $I2, $P1
    not $I2
    unless $I2 goto __label_10
    isnull $I2, $P2
    not $I2
  __label_10:
    if $I2 goto __label_9
.annotate 'line', 8017
    isnull $I2, $P1
    not $I2
    if $I2 goto __label_11
.annotate 'line', 8035
    isnull $I2, $P2
    not $I2
    if $I2 goto __label_12
    goto __label_8
  __label_9: # case
.annotate 'line', 8015
    __ARG_1.'print'(" :named :slurpy")
    goto __label_7 # break
  __label_11: # case
.annotate 'line', 8018
# setname: $S2
    null $S2
.annotate 'line', 8019
# nargs: $I1
    $P7 = $P1.'numargs'()
    set $I1, $P7
# switch
.annotate 'line', 8020
    set $I3, $I1
    null $I4
    if $I3 == $I4 goto __label_15
    set $I4, 1
    if $I3 == $I4 goto __label_16
    goto __label_14
  __label_15: # case
.annotate 'line', 8022
    concat $S0, "'", __ARG_3
    concat $S0, $S0, "'"
    set $S2, $S0
    goto __label_13 # break
  __label_16: # case
.annotate 'line', 8025
# var argmod: $P5
    $P5 = $P1.'getarg'(0)
.annotate 'line', 8026
    $P8 = $P5.'isstringliteral'()
    isfalse $I5, $P8
    unless $I5 goto __label_17
.annotate 'line', 8027
    'SyntaxError'('Invalid modifier', __ARG_2)
  __label_17: # endif
.annotate 'line', 8028
    $P9 = $P5.'getPirString'()
    set $S2, $P9
    goto __label_13 # break
  __label_14: # default
.annotate 'line', 8031
    'SyntaxError'('Invalid modifier', __ARG_2)
  __label_13: # switch end
.annotate 'line', 8033
    __ARG_1.'print'(" :named(", $S2, ")")
    goto __label_7 # break
  __label_12: # case
.annotate 'line', 8036
    __ARG_1.'print'(" :slurpy")
    goto __label_7 # break
  __label_8: # default
  __label_7: # switch end
.annotate 'line', 8037
# }
.annotate 'line', 8039

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ParameterModifierList' ]
.annotate 'line', 7985
    get_class $P1, [ 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'FunctionParameter' ]

.sub 'FunctionParameter' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8048
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8049
# type: $S1
    $P3 = $P1.'checkkeyword'()
    $P2 = 'typetoregcheck'($P3)
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
  __label_0:
.annotate 'line', 8050
    eq $S1, '', __label_1
.annotate 'line', 8051
    $P1 = __ARG_2.'get'()
    goto __label_2
  __label_1: # else
.annotate 'line', 8053
    set $S1, 'P'
  __label_2: # endif
.annotate 'line', 8054
# argname: $S2
# predefined string
    $P2 = __ARG_1.'getparamnum'()
    set $S3, $P2
    concat $S2, '__ARG_', $S3
.annotate 'line', 8055
    __ARG_1.'createvarnamed'($P1, $S1, $S2)
.annotate 'line', 8057
# predefined string
    set $S3, $P1
    box $P2, $S3
    setattribute self, 'name', $P2
.annotate 'line', 8058
    $P1 = __ARG_2.'get'()
.annotate 'line', 8059
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 8060
    new $P5, [ 'ParameterModifierList' ]
    $P5.'ParameterModifierList'(__ARG_2, self)
    set $P4, $P5
    setattribute self, 'modifiers', $P4
    goto __label_4
  __label_3: # else
.annotate 'line', 8062
    __ARG_2.'unget'($P1)
  __label_4: # endif
# }
.annotate 'line', 8063

.end # FunctionParameter


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8066
# paramname: $S1
    getattribute $P3, self, 'name'
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
  __label_0:
.annotate 'line', 8067
# var param: $P1
    $P1 = __ARG_1.'getvar'($S1)
.annotate 'line', 8068
# ptype: $S2
    $P4 = $P1.'gettype'()
    $P3 = 'typetopirname'($P4)
    null $S2
    if_null $P3, __label_1
    set $S2, $P3
  __label_1:
.annotate 'line', 8069
    $P3 = $P1.'getreg'()
    __ARG_2.'print'('        .param ', $S2, ' ', $P3)
.annotate 'line', 8070
# var modarg: $P2
    getattribute $P2, self, 'modifiers'
.annotate 'line', 8071
    if_null $P2, __label_2
.annotate 'line', 8072
    getattribute $P3, __ARG_1, 'start'
    $P2.'emitmodifiers'(__ARG_2, $P3, $S1)
  __label_2: # endif
.annotate 'line', 8073
    __ARG_2.'say'('')
# }
.annotate 'line', 8074

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FunctionParameter' ]
.annotate 'line', 8044
    addattribute $P0, 'name'
.annotate 'line', 8045
    addattribute $P0, 'modifiers'
.end
.namespace [ 'FunctionModifierList' ]

.sub 'FunctionModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8085
    self.'ModifierList'(__ARG_1, __ARG_2)
# }
.annotate 'line', 8086

.end # FunctionModifierList


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8089
    $P3 = self.'getlist'()
    iter $P4, $P3
    set $P4, 0
  __label_0: # for iteration
    unless $P4 goto __label_1
    shift $P1, $P4
# {
.annotate 'line', 8090
# nargmods: $I1
    $P5 = $P1.'numargs'()
    set $I1, $P5
.annotate 'line', 8091
    $P3 = $P1.'getname'()
    __ARG_1.'print'(' :', $P3)
.annotate 'line', 8092
    le $I1, 0, __label_2
# {
.annotate 'line', 8093
    __ARG_1.'print'('(')
# for loop
.annotate 'line', 8094
# iargmod: $I2
    null $I2
  __label_5: # for condition
    ge $I2, $I1, __label_4
# {
.annotate 'line', 8095
# var argmod: $P2
    $P2 = $P1.'getarg'($I2)
.annotate 'line', 8096
    $P3 = $P2.'isstringliteral'()
    isfalse $I3, $P3
    unless $I3 goto __label_6
.annotate 'line', 8097
    getattribute $P5, $P2, 'start'
    'SyntaxError'('Invalid modifier', $P5)
  __label_6: # endif
.annotate 'line', 8098
    $P3 = $P2.'getPirString'()
    __ARG_1.'print'($P3)
# }
  __label_3: # for iteration
.annotate 'line', 8094
    inc $I2
    goto __label_5
  __label_4: # for end
.annotate 'line', 8100
    __ARG_1.'print'(')')
# }
  __label_2: # endif
# }
    goto __label_0
  __label_1: # endfor
# }
.annotate 'line', 8103

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FunctionModifierList' ]
.annotate 'line', 8081
    get_class $P1, [ 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'FunctionBase' ]

.sub 'FunctionBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8125
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 8126
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'params', $P2
.annotate 'line', 8127
    box $P1, 0
    setattribute self, 'nlabel', $P1
.annotate 'line', 8128
    new $P3, [ 'RegisterStore' ]
    $P3.'RegisterStore'('I')
    set $P2, $P3
    setattribute self, 'regstI', $P2
.annotate 'line', 8129
    new $P3, [ 'RegisterStore' ]
    $P3.'RegisterStore'('N')
    set $P2, $P3
    setattribute self, 'regstN', $P2
.annotate 'line', 8130
    new $P3, [ 'RegisterStore' ]
    $P3.'RegisterStore'('S')
    set $P2, $P3
    setattribute self, 'regstS', $P2
.annotate 'line', 8131
    new $P3, [ 'RegisterStore' ]
    $P3.'RegisterStore'('P')
    set $P2, $P3
    setattribute self, 'regstP', $P2
# }
.annotate 'line', 8132

.end # FunctionBase


.sub 'getouter' :method
# Body
# {
.annotate 'line', 8134
    .return(self)
# }

.end # getouter


.sub 'makesubid' :method
# Body
# {
.annotate 'line', 8138
# var subid: $P1
    getattribute $P1, self, 'subid'
.annotate 'line', 8139
    unless_null $P1, __label_0
# {
.annotate 'line', 8140
    $P1 = self.'generatesubid'()
.annotate 'line', 8141
    setattribute self, 'subid', $P1
# }
  __label_0: # endif
.annotate 'line', 8143
    .return($P1)
# }
.annotate 'line', 8144

.end # makesubid


.sub 'same_scope_as' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8148
# r: $I1
    issame $I1, self, __ARG_1
.annotate 'line', 8149
    .return($I1)
# }
.annotate 'line', 8150

.end # same_scope_as


.sub 'parse_parameters' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8153
# var params: $P1
    getattribute $P1, self, 'params'
.annotate 'line', 8154
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 8155
    $P3 = $P2.'isop'(')')
    isfalse $I1, $P3
    unless $I1 goto __label_0
# {
.annotate 'line', 8156
    __ARG_1.'unget'($P2)
  __label_1: # do
.annotate 'line', 8157
# {
.annotate 'line', 8158
    new $P4, [ 'FunctionParameter' ]
    $P4.'FunctionParameter'(self, __ARG_1)
    set $P3, $P4
# predefined push
    push $P1, $P3
.annotate 'line', 8159
    $P2 = __ARG_1.'get'()
# }
  __label_3: # continue
.annotate 'line', 8160
    $P3 = $P2.'isop'(',')
    if_null $P3, __label_2
    if $P3 goto __label_1
  __label_2: # enddo
.annotate 'line', 8161
    $P3 = $P2.'isop'(')')
    isfalse $I1, $P3
    unless $I1 goto __label_4
.annotate 'line', 8162
    'Expected'("')' or ','", $P2)
  __label_4: # endif
# }
  __label_0: # endif
# }
.annotate 'line', 8164

.end # parse_parameters


.sub 'addlocalfunction' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8168
# var localfun: $P1
    getattribute $P1, self, 'localfun'
.annotate 'line', 8169
    unless_null $P1, __label_0
.annotate 'line', 8170
    root_new $P3, ['parrot';'ResizablePMCArray']
    push $P3, __ARG_1
    setattribute self, 'localfun', $P3
    goto __label_1
  __label_0: # else
.annotate 'line', 8172
# predefined push
    push $P1, __ARG_1
  __label_1: # endif
# }
.annotate 'line', 8173

.end # addlocalfunction


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8177
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 8178
    .return(self)
# }
.annotate 'line', 8179

.end # optimize


.sub 'setusedlex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 8183
# var lexicals: $P1
    getattribute $P1, self, 'usedlexicals'
.annotate 'line', 8184
    unless_null $P1, __label_0
# {
.annotate 'line', 8185
    root_new $P1, ['parrot';'Hash']
.annotate 'line', 8186
    setattribute self, 'usedlexicals', $P1
# }
  __label_0: # endif
.annotate 'line', 8188
    $P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 8189

.end # setusedlex


.sub 'setlex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 8192
# var lexicals: $P1
    getattribute $P1, self, 'lexicals'
.annotate 'line', 8193
    unless_null $P1, __label_0
# {
.annotate 'line', 8194
    root_new $P1, ['parrot';'Hash']
.annotate 'line', 8195
    setattribute self, 'lexicals', $P1
# }
  __label_0: # endif
.annotate 'line', 8197
    $P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 8198

.end # setlex


.sub 'createlex' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8203
# var lex: $P1
    $P1 = __ARG_1.'getlex'()
.annotate 'line', 8204
# lexname: $S1
    null $S1
.annotate 'line', 8205
    if_null $P1, __label_0
.annotate 'line', 8206
    set $S1, $P1
    goto __label_1
  __label_0: # else
# {
.annotate 'line', 8208
# reg: $S2
    $P2 = __ARG_1.'getreg'()
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 8209
# lexnum: $I1
    $P2 = self.'getlexnum'()
    set $I1, $P2
.annotate 'line', 8210
# predefined string
    set $S3, $I1
    concat $S0, '__WLEX_', $S3
    set $S1, $S0
.annotate 'line', 8211
    self.'setlex'($S1, $S2)
.annotate 'line', 8212
    __ARG_1.'setlex'($S1)
# }
  __label_1: # endif
.annotate 'line', 8214
    .return($S1)
# }
.annotate 'line', 8215

.end # createlex


.sub 'createreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8219
# var store: $P1
    null $P1
# switch
.annotate 'line', 8220
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
.annotate 'line', 8222
    getattribute $P1, self, 'regstI'
    goto __label_0 # break
  __label_3: # case
.annotate 'line', 8224
    getattribute $P1, self, 'regstN'
    goto __label_0 # break
  __label_4: # case
.annotate 'line', 8226
    getattribute $P1, self, 'regstS'
    goto __label_0 # break
  __label_5: # case
.annotate 'line', 8228
    getattribute $P1, self, 'regstP'
    goto __label_0 # break
  __label_1: # default
.annotate 'line', 8230
    concat $S4, 'Invalid type in createreg: ', __ARG_1
    'InternalError'($S4)
  __label_0: # switch end
.annotate 'line', 8232
# reg: $S1
    $P2 = $P1.'createreg'()
    null $S1
    if_null $P2, __label_6
    set $S1, $P2
  __label_6:
.annotate 'line', 8233
    .return($S1)
# }
.annotate 'line', 8234

.end # createreg


.sub 'tempreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8237
# var store: $P1
    null $P1
# switch
.annotate 'line', 8238
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
.annotate 'line', 8240
    getattribute $P1, self, 'regstI'
    goto __label_0 # break
  __label_3: # case
.annotate 'line', 8242
    getattribute $P1, self, 'regstN'
    goto __label_0 # break
  __label_4: # case
.annotate 'line', 8244
    getattribute $P1, self, 'regstS'
    goto __label_0 # break
  __label_5: # case
.annotate 'line', 8246
    getattribute $P1, self, 'regstP'
    goto __label_0 # break
  __label_1: # default
.annotate 'line', 8248
    concat $S4, "Invalid type '", __ARG_1
    concat $S4, $S4, "' in tempreg"
    'InternalError'($S4)
  __label_0: # switch end
.annotate 'line', 8250
# reg: $S1
    $P2 = $P1.'tempreg'()
    null $S1
    if_null $P2, __label_6
    set $S1, $P2
  __label_6:
.annotate 'line', 8251
    .return($S1)
# }
.annotate 'line', 8252

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 8255
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
.annotate 'line', 8256
    $P1.'freetemps'()
    goto __label_0
  __label_1: # endfor
# }
.annotate 'line', 8257

.end # freetemps


.sub 'genlabel' :method
# Body
# {
.annotate 'line', 8260
# var nlabel: $P1
    getattribute $P1, self, 'nlabel'
.annotate 'line', 8261
# n: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 8262
# s: $S1
    set $I2, $I1
    inc $I1
    set $S2, $I2
    concat $S1, '__label_', $S2
.annotate 'line', 8263
    assign $P1, $I1
.annotate 'line', 8264
    .return($S1)
# }
.annotate 'line', 8265

.end # genlabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8268
    'SyntaxError'('break not allowed here', __ARG_1)
# }
.annotate 'line', 8269

.end # getbreaklabel


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8272
    'SyntaxError'('continue not allowed here', __ARG_1)
# }
.annotate 'line', 8273

.end # getcontinuelabel


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8277
# name: $S1
    getattribute $P10, self, 'name'
    null $S1
    if_null $P10, __label_0
    set $S1, $P10
  __label_0:
.annotate 'line', 8278
    __ARG_1.'say'()
.annotate 'line', 8279
    __ARG_1.'print'(".sub ")
.annotate 'line', 8280
    $P10 = self.'isanonymous'()
    if_null $P10, __label_1
    unless $P10 goto __label_1
.annotate 'line', 8281
    __ARG_1.'print'("'' :anon")
    goto __label_2
  __label_1: # else
.annotate 'line', 8283
    __ARG_1.'print'("'", $S1, "'")
  __label_2: # endif
.annotate 'line', 8284
    getattribute $P10, self, 'subid'
    if_null $P10, __label_3
.annotate 'line', 8285
    getattribute $P11, self, 'subid'
    __ARG_1.'print'(" :subid('", $P11, "')")
  __label_3: # endif
.annotate 'line', 8286
    getattribute $P10, self, 'outer'
    if_null $P10, __label_4
# {
.annotate 'line', 8287
# var outer: $P1
    getattribute $P1, self, 'outer'
.annotate 'line', 8288
# var outerid: $P2
    getattribute $P2, $P1, 'subid'
.annotate 'line', 8289
    if_null $P2, __label_5
.annotate 'line', 8290
    __ARG_1.'print'(" :outer('", $P2, "')")
  __label_5: # endif
# }
  __label_4: # endif
.annotate 'line', 8294
    $P10 = self.'ismethod'()
    if_null $P10, __label_6
    unless $P10 goto __label_6
.annotate 'line', 8295
    __ARG_1.'print'(' :method')
  __label_6: # endif
.annotate 'line', 8296
# var modifiers: $P3
    getattribute $P3, self, 'modifiers'
.annotate 'line', 8297
    if_null $P3, __label_7
.annotate 'line', 8298
    $P3.'emit'(__ARG_1)
    goto __label_8
  __label_7: # else
# {
.annotate 'line', 8300
    ne $S1, 'main', __label_9
.annotate 'line', 8301
    __ARG_1.'print'(' :main')
  __label_9: # endif
# }
  __label_8: # endif
.annotate 'line', 8303
    __ARG_1.'say'()
.annotate 'line', 8306
    getattribute $P10, self, 'params'
    iter $P12, $P10
    set $P12, 0
  __label_10: # for iteration
    unless $P12 goto __label_11
    shift $P4, $P12
.annotate 'line', 8307
    $P4.'emit'(self, __ARG_1)
    goto __label_10
  __label_11: # endfor
.annotate 'line', 8309
# var lexicals: $P5
    getattribute $P5, self, 'lexicals'
.annotate 'line', 8310
# var usedlexicals: $P6
    getattribute $P6, self, 'usedlexicals'
.annotate 'line', 8311
    isnull $I1, $P5
    not $I1
    if $I1 goto __label_13
    isnull $I1, $P6
    not $I1
  __label_13:
    unless $I1 goto __label_12
# {
.annotate 'line', 8312
    getattribute $P10, self, 'start'
    __ARG_1.'annotate'($P10)
.annotate 'line', 8314
    if_null $P5, __label_14
# {
.annotate 'line', 8316
    iter $P13, $P5
    set $P13, 0
  __label_15: # for iteration
    unless $P13 goto __label_16
    shift $S2, $P13
.annotate 'line', 8317
    $P10 = $P5[$S2]
    __ARG_1.'say'(".lex '", $P10, "', ", $S2)
    goto __label_15
  __label_16: # endfor
# }
  __label_14: # endif
.annotate 'line', 8320
    if_null $P6, __label_17
# {
.annotate 'line', 8322
    iter $P14, $P6
    set $P14, 0
  __label_18: # for iteration
    unless $P14 goto __label_19
    shift $S3, $P14
.annotate 'line', 8323
    $P10 = $P6[$S3]
    __ARG_1.'emitfind_lex'($S3, $P10)
    goto __label_18
  __label_19: # endfor
# }
  __label_17: # endif
# }
  __label_12: # endif
.annotate 'line', 8327
# var body: $P7
    getattribute $P7, self, 'body'
.annotate 'line', 8328
    $P10 = $P7.'isempty'()
    if_null $P10, __label_20
    unless $P10 goto __label_20
.annotate 'line', 8329
    __ARG_1.'comment'('Empty body')
    goto __label_21
  __label_20: # else
# {
.annotate 'line', 8331
    __ARG_1.'comment'('Body')
.annotate 'line', 8332
    $P7.'emit'(__ARG_1)
.annotate 'line', 8333
    $P10 = $P7.'getend'()
    __ARG_1.'annotate'($P10)
# }
  __label_21: # endif
.annotate 'line', 8335
    __ARG_1.'say'("\n.end # ", $S1, "\n")
.annotate 'line', 8338
# var localfun: $P8
    getattribute $P8, self, 'localfun'
.annotate 'line', 8339
    if_null $P8, __label_22
# {
.annotate 'line', 8340
    iter $P15, $P8
    set $P15, 0
  __label_23: # for iteration
    unless $P15 goto __label_24
    shift $P9, $P15
.annotate 'line', 8341
    $P9.'emit'(__ARG_1)
    goto __label_23
  __label_24: # endfor
# }
  __label_22: # endif
# }
.annotate 'line', 8343

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FunctionBase' ]
.annotate 'line', 8106
    get_class $P1, [ 'BlockStatement' ]
    addparent $P0, $P1
.annotate 'line', 8108
    addattribute $P0, 'name'
.annotate 'line', 8109
    addattribute $P0, 'subid'
.annotate 'line', 8110
    addattribute $P0, 'modifiers'
.annotate 'line', 8111
    addattribute $P0, 'params'
.annotate 'line', 8112
    addattribute $P0, 'body'
.annotate 'line', 8113
    addattribute $P0, 'regstI'
.annotate 'line', 8114
    addattribute $P0, 'regstN'
.annotate 'line', 8115
    addattribute $P0, 'regstS'
.annotate 'line', 8116
    addattribute $P0, 'regstP'
.annotate 'line', 8117
    addattribute $P0, 'nlabel'
.annotate 'line', 8118
    addattribute $P0, 'localfun'
.annotate 'line', 8119
    addattribute $P0, 'lexicals'
.annotate 'line', 8120
    addattribute $P0, 'usedlexicals'
.annotate 'line', 8121
    addattribute $P0, 'outer'
.end
.namespace [ 'FunctionStatement' ]

.sub 'FunctionStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8357
    self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 8358
    box $P1, 0
    setattribute self, 'paramnum', $P1
.annotate 'line', 8359
    box $P1, 0
    setattribute self, 'lexnum', $P1
.annotate 'line', 8360
    self.'parse'(__ARG_2)
# }
.annotate 'line', 8361

.end # FunctionStatement


.sub 'isanonymous' :method
# Body
# {
.annotate 'line', 8363
    .return(0)
# }

.end # isanonymous


.sub 'getparamnum' :method
# Body
# {
.annotate 'line', 8367
# var paramnum: $P1
    getattribute $P1, self, 'paramnum'
.annotate 'line', 8368
# n: $I1
    set $I2, $P1
    add $I1, $I2, 1
.annotate 'line', 8369
    assign $P1, $I1
.annotate 'line', 8370
    .return($I1)
# }
.annotate 'line', 8371

.end # getparamnum


.sub 'getlexnum' :method
# Body
# {
.annotate 'line', 8375
# var lexnum: $P1
    getattribute $P1, self, 'lexnum'
.annotate 'line', 8376
# n: $I1
    set $I2, $P1
    add $I1, $I2, 1
.annotate 'line', 8377
    assign $P1, $I1
.annotate 'line', 8378
    .return($I1)
# }
.annotate 'line', 8379

.end # getlexnum


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 8380
    .return(0)
# }

.end # ismethod


.sub 'parse' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8384
# var name: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8385
    setattribute self, 'name', $P1
.annotate 'line', 8386
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 8387
    $P4 = $P2.'isop'('[')
    if_null $P4, __label_0
    unless $P4 goto __label_0
# {
.annotate 'line', 8388
    new $P7, [ 'FunctionModifierList' ]
    $P7.'FunctionModifierList'(__ARG_1, self)
    set $P6, $P7
    setattribute self, 'modifiers', $P6
.annotate 'line', 8389
    $P2 = __ARG_1.'get'()
# }
  __label_0: # endif
.annotate 'line', 8391
    'RequireOp'('(', $P2)
.annotate 'line', 8392
    self.'parse_parameters'(__ARG_1)
.annotate 'line', 8394
# var fullname: $P3
    getattribute $P5, self, 'owner'
    $P4 = $P5.'getpath'()
# predefined clone
    clone $P3, $P4
.annotate 'line', 8395
    $P4 = $P1.'getidentifier'()
# predefined push
    push $P3, $P4
.annotate 'line', 8397
    new $P5, [ 'StringLiteral' ]
.annotate 'line', 8398
    new $P7, [ 'TokenQuoted' ]
    getattribute $P8, $P1, 'file'
    getattribute $P9, $P1, 'line'
# predefined join
    join $S1, '.', $P3
    $P7.'TokenQuoted'($P8, $P9, $S1)
    set $P6, $P7
    $P5.'StringLiteral'(self, $P6)
    set $P4, $P5
.annotate 'line', 8396
    self.'createconst'('__FUNCTION__', 'S', $P4, '')
.annotate 'line', 8401
    $P2 = __ARG_1.'get'()
.annotate 'line', 8402
    $P4 = $P2.'isop'('{')
    isfalse $I1, $P4
    unless $I1 goto __label_1
.annotate 'line', 8403
    'ExpectedOp'('{', $P2)
  __label_1: # endif
.annotate 'line', 8404
    new $P6, [ 'CompoundStatement' ]
    $P6.'CompoundStatement'($P2, __ARG_1, self)
    set $P5, $P6
    setattribute self, 'body', $P5
.annotate 'line', 8405
    .return(self)
# }
.annotate 'line', 8406

.end # parse

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FunctionStatement' ]
.annotate 'line', 8350
    get_class $P1, [ 'FunctionBase' ]
    addparent $P0, $P1
.annotate 'line', 8352
    addattribute $P0, 'paramnum'
.annotate 'line', 8353
    addattribute $P0, 'lexnum'
.end
.namespace [ 'LocalFunctionStatement' ]

.sub 'LocalFunctionStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8417
    self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 8418
    $P4 = __ARG_3.'getouter'()
    setattribute self, 'outer', $P4
.annotate 'line', 8419
    getattribute $P3, self, 'outer'
    $P3.'makesubid'()
.annotate 'line', 8420
# var subid: $P1
    $P1 = self.'makesubid'()
.annotate 'line', 8421
    setattribute self, 'name', $P1
.annotate 'line', 8422
    self.'parse_parameters'(__ARG_2)
.annotate 'line', 8423
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 8424
    'RequireOp'('{', $P2)
.annotate 'line', 8425
    new $P5, [ 'CompoundStatement' ]
    $P5.'CompoundStatement'($P2, __ARG_2, self)
    set $P4, $P5
    setattribute self, 'body', $P4
.annotate 'line', 8426
    __ARG_3.'addlocalfunction'(self)
# }
.annotate 'line', 8427

.end # LocalFunctionStatement


.sub 'isanonymous' :method
# Body
# {
.annotate 'line', 8428
    .return(1)
# }

.end # isanonymous


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 8429
    .return(0)
# }

.end # ismethod


.sub 'getsubid' :method
# Body
# {
.annotate 'line', 8432
    getattribute $P1, self, 'subid'
    .return($P1)
# }
.annotate 'line', 8433

.end # getsubid


.sub 'getparamnum' :method
# Body
# {
.annotate 'line', 8437
    getattribute $P1, self, 'outer'
    .tailcall $P1.'getparamnum'()
# }
.annotate 'line', 8438

.end # getparamnum


.sub 'getlexnum' :method
# Body
# {
.annotate 'line', 8442
    getattribute $P1, self, 'outer'
    .tailcall $P1.'getlexnum'()
# }
.annotate 'line', 8443

.end # getlexnum


.sub 'getvar' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8446
# var r: $P1
    $P1 = self.'getlocalvar'(__ARG_1)
.annotate 'line', 8447
    unless_null $P1, __label_0
# {
.annotate 'line', 8450
    getattribute $P6, self, 'owner'
    $P1 = $P6.'getvar'(__ARG_1)
.annotate 'line', 8451
    unless_null $P1, __label_1
# {
.annotate 'line', 8453
    ne __ARG_1, 'self', __label_3
# {
.annotate 'line', 8454
# var ownerscope: $P2
    getattribute $P2, self, 'outer'
.annotate 'line', 8455
    getattribute $P7, self, 'outer'
    $P6 = $P7.'ismethod'()
    if_null $P6, __label_4
    unless $P6 goto __label_4
# {
.annotate 'line', 8456
# lexself: $S1
    $P8 = $P2.'makelexicalself'()
    null $S1
    if_null $P8, __label_5
    set $S1, $P8
  __label_5:
.annotate 'line', 8457
    $P1 = self.'createvar'(__ARG_1, 'P')
.annotate 'line', 8458
# reg: $S2
    $P6 = $P1.'getreg'()
    null $S2
    if_null $P6, __label_6
    set $S2, $P6
  __label_6:
.annotate 'line', 8459
    self.'setusedlex'($S1, $S2)
# }
  __label_4: # endif
# }
  __label_3: # endif
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 8463
    $P6 = $P1.'gettype'()
    set $S5, $P6
    iseq $I2, $S5, 'P'
    unless $I2 goto __label_8
    $P7 = $P1.'isconst'()
    isfalse $I2, $P7
  __label_8:
    unless $I2 goto __label_7
# {
.annotate 'line', 8464
# var scope: $P3
    $P3 = $P1.'getscope'()
.annotate 'line', 8465
# var ownerscope: $P4
    $P4 = $P3.'getouter'()
.annotate 'line', 8466
# var outer: $P5
    getattribute $P5, self, 'outer'
.annotate 'line', 8467
    isa $I2, $P4, [ 'FunctionBase' ]
    unless $I2 goto __label_9
# {
.annotate 'line', 8468
    $P6 = $P4.'same_scope_as'($P5)
    if_null $P6, __label_10
    unless $P6 goto __label_10
# {
.annotate 'line', 8469
# lexname: $S3
    $P7 = $P3.'makelexical'($P1)
    null $S3
    if_null $P7, __label_11
    set $S3, $P7
  __label_11:
.annotate 'line', 8470
# flags: $I1
    $I2 = $P1.'getflags'()
    bor $I1, $I2, 2
.annotate 'line', 8471
    $P1 = self.'createvar'(__ARG_1, 'P', $I1)
.annotate 'line', 8472
    box $P6, $S3
    setattribute $P1, 'lexname', $P6
.annotate 'line', 8473
# reg: $S4
    $P6 = $P1.'getreg'()
    null $S4
    if_null $P6, __label_12
    set $S4, $P6
  __label_12:
.annotate 'line', 8474
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
.annotate 'line', 8479
    isnull $I2, $P1
    not $I2
    unless $I2 goto __label_14
    isa $I3, $P1, [ 'VarData' ]
    not $I2, $I3
  __label_14:
    unless $I2 goto __label_13
.annotate 'line', 8480
    'InternalError'('Incorrect data for variable in LocalFunction')
  __label_13: # endif
.annotate 'line', 8481
    .return($P1)
# }
.annotate 'line', 8482

.end # getvar

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'LocalFunctionStatement' ]
.annotate 'line', 8413
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
.annotate 'line', 8493
    self.'FunctionStatement'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 8494

.end # MethodStatement


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 8495
    .return(1)
# }

.end # ismethod

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MethodStatement' ]
.annotate 'line', 8489
    get_class $P1, [ 'FunctionStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'SigParameter' ]

.sub 'SigParameter' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8509
# var name: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8510
    $P4 = $P1.'isidentifier'()
    isfalse $I1, $P4
    unless $I1 goto __label_0
.annotate 'line', 8511
    'SyntaxError'("Identifier expected", $P1)
  __label_0: # endif
.annotate 'line', 8512
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 8513
    $P4 = $P2.'isidentifier'()
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 8514
# type: $S1
    $P6 = $P1.'checkkeyword'()
    $P5 = 'typetoregcheck'($P6)
    null $S1
    if_null $P5, __label_2
    set $S1, $P5
  __label_2:
.annotate 'line', 8515
    set $P1, $P2
.annotate 'line', 8516
    __ARG_2.'createvar'($P1, $S1)
.annotate 'line', 8517
    $P2 = __ARG_1.'get'()
# }
  __label_1: # endif
.annotate 'line', 8519
    setattribute self, 'name', $P1
.annotate 'line', 8520
# var data: $P3
    $P4 = $P1.'getidentifier'()
    $P3 = __ARG_2.'getvar'($P4)
.annotate 'line', 8521
    $P5 = $P3.'getreg'()
    setattribute self, 'reg', $P5
.annotate 'line', 8522
    $P4 = $P2.'isop'('[')
    if_null $P4, __label_3
    unless $P4 goto __label_3
.annotate 'line', 8523
    new $P7, [ 'ParameterModifierList' ]
    $P7.'ParameterModifierList'(__ARG_1, self)
    set $P6, $P7
    setattribute self, 'modifiers', $P6
    goto __label_4
  __label_3: # else
.annotate 'line', 8525
    __ARG_1.'unget'($P2)
  __label_4: # endif
# }
.annotate 'line', 8526

.end # SigParameter


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8529
    getattribute $P3, self, 'reg'
    __ARG_1.'print'($P3)
.annotate 'line', 8530
# var modifiers: $P1
    getattribute $P1, self, 'modifiers'
.annotate 'line', 8531
    if_null $P1, __label_0
# {
.annotate 'line', 8532
# var name: $P2
    getattribute $P2, self, 'name'
.annotate 'line', 8533
    $P1.'emitmodifiers'(__ARG_1, $P2, $P2)
# }
  __label_0: # endif
# }
.annotate 'line', 8535

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'SigParameter' ]
.annotate 'line', 8504
    addattribute $P0, 'name'
.annotate 'line', 8505
    addattribute $P0, 'modifiers'
.annotate 'line', 8506
    addattribute $P0, 'reg'
.end
.namespace [ 'SigParameterList' ]

.sub 'SigParameterList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8543
# var t: $P1
    null $P1
.annotate 'line', 8544
# var params: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
  __label_0: # do
.annotate 'line', 8545
# {
.annotate 'line', 8546
# var sigelem: $P3
    new $P3, [ 'SigParameter' ]
    $P3.'SigParameter'(__ARG_1, __ARG_2)
.annotate 'line', 8547
    $P2.'push'($P3)
.annotate 'line', 8548
    $P1 = __ARG_1.'get'()
# }
  __label_2: # continue
.annotate 'line', 8549
    $P4 = $P1.'isop'(',')
    if_null $P4, __label_1
    if $P4 goto __label_0
  __label_1: # enddo
.annotate 'line', 8550
    $P4 = $P1.'isop'(')')
    isfalse $I1, $P4
    unless $I1 goto __label_3
.annotate 'line', 8551
    'SyntaxError'("Expected ',' or ')'", $P1)
  __label_3: # endif
.annotate 'line', 8552
    setattribute self, 'params', $P2
# }
.annotate 'line', 8553

.end # SigParameterList


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8556
    __ARG_1.'print'('(')
.annotate 'line', 8557
# sep: $S1
    set $S1, ''
.annotate 'line', 8558
    getattribute $P2, self, 'params'
    iter $P3, $P2
    set $P3, 0
  __label_0: # for iteration
    unless $P3 goto __label_1
    shift $P1, $P3
# {
.annotate 'line', 8559
    __ARG_1.'print'($S1)
.annotate 'line', 8560
    $P1.'emit'(__ARG_1)
.annotate 'line', 8561
    set $S1, ', '
# }
    goto __label_0
  __label_1: # endfor
.annotate 'line', 8563
    __ARG_1.'print'(')')
# }
.annotate 'line', 8564

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'SigParameterList' ]
.annotate 'line', 8540
    addattribute $P0, 'params'
.end
.namespace [ 'MultiAssignStatement' ]

.sub 'MultiAssignStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8573
    setattribute self, 'params', __ARG_1
.annotate 'line', 8574
    setattribute self, 'expr', __ARG_2
# }
.annotate 'line', 8575

.end # MultiAssignStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8578
    getattribute $P3, self, 'expr'
    $P2 = $P3.'optimize'()
    setattribute self, 'expr', $P2
.annotate 'line', 8579
    .return(self)
# }
.annotate 'line', 8580

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8583
# var expr: $P1
    getattribute $P1, self, 'expr'
.annotate 'line', 8584
# var call: $P2
    $P2 = $P1.'emitcall'(__ARG_1)
.annotate 'line', 8585
    __ARG_1.'print'('    ')
.annotate 'line', 8586
    getattribute $P3, self, 'params'
    $P3.'emit'(__ARG_1)
.annotate 'line', 8587
    __ARG_1.'print'(' = ', $P2)
.annotate 'line', 8588
    getattribute $P3, self, 'expr'
    $P3.'emitargs'(__ARG_1)
.annotate 'line', 8589
    __ARG_1.'say'()
# }
.annotate 'line', 8590

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MultiAssignStatement' ]
.annotate 'line', 8569
    addattribute $P0, 'params'
.annotate 'line', 8570
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
.annotate 'line', 8607
    self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 8608

.end # ClassSpecifier


.sub 'reftype' :method
# Body
# {
.annotate 'line', 8609
    .return(0)
# }

.end # reftype


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8613
    getattribute $P1, self, 'start'
    __ARG_1.'annotate'($P1)
# }
.annotate 'line', 8614

.end # annotate

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassSpecifier' ]
.annotate 'line', 8603
    get_class $P1, [ 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'ClassSpecifierStr' ]

.sub 'ClassSpecifierStr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8622
    self.'ClassSpecifier'(__ARG_1, __ARG_2)
.annotate 'line', 8623
    setattribute self, 'name', __ARG_2
# }
.annotate 'line', 8624

.end # ClassSpecifierStr


.sub 'reftype' :method
# Body
# {
.annotate 'line', 8625
    .return(1)
# }

.end # reftype


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8629
# basestr: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
  __label_0:
.annotate 'line', 8630
    __ARG_1.'print'($S1)
# }
.annotate 'line', 8631

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassSpecifierStr' ]
.annotate 'line', 8617
    get_class $P1, [ 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 8619
    addattribute $P0, 'name'
.end
.namespace [ 'ClassSpecifierParrotKey' ]

.sub 'ClassSpecifierParrotKey' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8640
    self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 8641
# var key: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 8642
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 8643
    $P3 = $P2.'isstring'()
    isfalse $I1, $P3
    unless $I1 goto __label_0
.annotate 'line', 8644
    'Expected'('literal string', $P2)
  __label_0: # endif
.annotate 'line', 8645
    $P3 = $P2.'rawstring'()
# predefined push
    push $P1, $P3
.annotate 'line', 8646
    $P2 = __ARG_1.'get'()
.annotate 'line', 8647
    $P3 = $P2.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_1
# {
# switch
.annotate 'line', 8648
    $P4 = $P2.'checkop'()
    set $S1, $P4
    set $S2, ':'
    if $S1 == $S2 goto __label_4
    set $S2, ','
    if $S1 == $S2 goto __label_5
    goto __label_3
  __label_4: # case
.annotate 'line', 8650
    box $P5, 1
    setattribute self, 'hll', $P5
  __label_5: # case
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 8654
    'SyntaxError'('Unexpected token in class key', $P2)
  __label_2: # switch end
  __label_6: # do
.annotate 'line', 8656
# {
.annotate 'line', 8657
    $P2 = __ARG_1.'get'()
.annotate 'line', 8658
    $P3 = $P2.'isstring'()
    isfalse $I1, $P3
    unless $I1 goto __label_9
.annotate 'line', 8659
    'Expected'('literal string', $P2)
  __label_9: # endif
.annotate 'line', 8660
    $P3 = $P2.'rawstring'()
# predefined push
    push $P1, $P3
# }
  __label_8: # continue
.annotate 'line', 8661
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'(',')
    if_null $P3, __label_7
    if $P3 goto __label_6
  __label_7: # enddo
.annotate 'line', 8662
    'RequireOp'(']', $P2)
# }
  __label_1: # endif
.annotate 'line', 8664
    setattribute self, 'key', $P1
# }
.annotate 'line', 8665

.end # ClassSpecifierParrotKey


.sub 'reftype' :method
# Body
# {
.annotate 'line', 8666
    .return(2)
# }

.end # reftype


.sub 'hasHLL' :method
# Body
# {
# predefined int
.annotate 'line', 8669
    getattribute $P1, self, 'hll'
    isnull $I1, $P1
    not $I1
    .return($I1)
# }
.annotate 'line', 8670

.end # hasHLL


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8674
    getattribute $P2, self, 'key'
    $P1 = 'getparrotkey'($P2)
    __ARG_1.'print'($P1)
# }
.annotate 'line', 8675

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassSpecifierParrotKey' ]
.annotate 'line', 8634
    get_class $P1, [ 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 8636
    addattribute $P0, 'key'
.annotate 'line', 8637
    addattribute $P0, 'hll'
.end
.namespace [ 'ClassSpecifierId' ]

.sub 'ClassSpecifierId' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8683
    self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 8684
# var key: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
# predefined string
    set $S1, __ARG_3
    box $P3, $S1
    push $P1, $P3
.annotate 'line', 8685
# var t: $P2
    null $P2
  __label_1: # while
.annotate 'line', 8686
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_0
    unless $P3 goto __label_0
# {
.annotate 'line', 8687
    $P2 = __ARG_1.'get'()
.annotate 'line', 8688
# predefined string
    set $S1, $P2
# predefined push
    push $P1, $S1
# }
    goto __label_1
  __label_0: # endwhile
.annotate 'line', 8690
    __ARG_1.'unget'($P2)
.annotate 'line', 8691
    setattribute self, 'key', $P1
# }
.annotate 'line', 8692

.end # ClassSpecifierId


.sub 'reftype' :method
# Body
# {
.annotate 'line', 8693
    .return(3)
# }

.end # reftype


.sub 'last' :method
# Body
# {
.annotate 'line', 8697
# var key: $P1
    getattribute $P1, self, 'key'
.annotate 'line', 8698
    $P2 = $P1[-1]
    .return($P2)
# }
.annotate 'line', 8699

.end # last


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8703
# var key: $P1
    getattribute $P2, self, 'key'
    $P1 = __ARG_2.'findclasskey'($P2)
.annotate 'line', 8704
    unless_null $P1, __label_0
# {
.annotate 'line', 8705
    $P2 = self.'dowarnings'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 8706
    getattribute $P3, self, 'key'
# predefined join
    join $S1, ".", $P3
    concat $S2, "class ", $S1
    concat $S2, $S2, " not found at compile time"
    'Warn'($S2)
  __label_2: # endif
.annotate 'line', 8707
    getattribute $P3, self, 'key'
    $P2 = 'getparrotkey'($P3)
    __ARG_1.'print'($P2)
# }
    goto __label_1
  __label_0: # else
.annotate 'line', 8709
    $P2 = $P1.'getclasskey'()
    __ARG_1.'print'($P2)
  __label_1: # endif
# }
.annotate 'line', 8710

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassSpecifierId' ]
.annotate 'line', 8678
    get_class $P1, [ 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 8680
    addattribute $P0, 'key'
.end
.namespace [ ]

.sub 'parseClassSpecifier'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8715
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8716
    $P2 = $P1.'isstring'()
    if_null $P2, __label_0
    unless $P2 goto __label_0
.annotate 'line', 8717
    new $P4, [ 'ClassSpecifierStr' ]
    $P4.'ClassSpecifierStr'(__ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_0: # endif
.annotate 'line', 8718
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 8719
    new $P4, [ 'ClassSpecifierParrotKey' ]
    $P4.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_1: # endif
.annotate 'line', 8720
    $P2 = $P1.'isidentifier'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 8721
    new $P4, [ 'ClassSpecifierId' ]
    $P4.'ClassSpecifierId'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_2: # endif
.annotate 'line', 8722
    'SyntaxError'('Invalid class', $P1)
# }
.annotate 'line', 8723

.end # parseClassSpecifier

.namespace [ 'ClassBase' ]

.sub 'ClassBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8735
    self.'initbase'(__ARG_1, __ARG_3)
.annotate 'line', 8736
    setattribute self, 'name', __ARG_2
.annotate 'line', 8737
# var classns: $P1
    $P2 = __ARG_3.'getpath'()
# predefined clone
    clone $P1, $P2
.annotate 'line', 8738
    getattribute $P2, self, 'name'
# predefined push
    push $P1, $P2
.annotate 'line', 8739
    setattribute self, 'classns', $P1
# }
.annotate 'line', 8740

.end # ClassBase


.sub 'getclasskey' :method
# Body
# {
.annotate 'line', 8743
    getattribute $P1, self, 'classns'
    .tailcall 'getparrotkey'($P1)
# }
.annotate 'line', 8744

.end # getclasskey

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassBase' ]
.annotate 'line', 8729
    get_class $P1, [ 'CommonBase' ]
    addparent $P0, $P1
.annotate 'line', 8731
    addattribute $P0, 'name'
.annotate 'line', 8732
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
.annotate 'line', 8757
    self.'ClassBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 8758
    setattribute self, 'parent', __ARG_3
.annotate 'line', 8759
# var functions: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 8760
    setattribute self, 'functions', $P1
.annotate 'line', 8761
# var members: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 8762
    setattribute self, 'members', $P2
.annotate 'line', 8763
    root_new $P10, ['parrot';'ResizablePMCArray']
    setattribute self, 'bases', $P10
.annotate 'line', 8764
# var constants: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 8765
    setattribute self, 'constants', $P3
.annotate 'line', 8767
# var t: $P4
    $P4 = __ARG_4.'get'()
.annotate 'line', 8768
    $P9 = $P4.'isop'(':')
    if_null $P9, __label_0
    unless $P9 goto __label_0
# {
.annotate 'line', 8769
# var bases: $P5
    getattribute $P5, self, 'bases'
  __label_1: # do
.annotate 'line', 8770
# {
.annotate 'line', 8771
    $P9 = 'parseClassSpecifier'(__ARG_4, self)
# predefined push
    push $P5, $P9
# }
  __label_3: # continue
.annotate 'line', 8772
    $P4 = __ARG_4.'get'()
    $P9 = $P4.'isop'(',')
    if_null $P9, __label_2
    if $P9 goto __label_1
  __label_2: # enddo
# }
  __label_0: # endif
.annotate 'line', 8774
    'RequireOp'('{', $P4)
# for loop
.annotate 'line', 8775
    $P4 = __ARG_4.'get'()
  __label_6: # for condition
    $P9 = $P4.'isop'('}')
    isfalse $I1, $P9
    unless $I1 goto __label_5
# {
# switch
.annotate 'line', 8776
    $P10 = $P4.'checkkeyword'()
    set $S1, $P10
    set $S2, 'function'
    if $S1 == $S2 goto __label_9
    set $S2, 'var'
    if $S1 == $S2 goto __label_10
    set $S2, 'const'
    if $S1 == $S2 goto __label_11
    goto __label_8
  __label_9: # case
.annotate 'line', 8778
# var f: $P6
    new $P6, [ 'MethodStatement' ]
    $P6.'MethodStatement'($P4, __ARG_4, self)
.annotate 'line', 8779
# predefined push
    push $P1, $P6
    goto __label_7 # break
  __label_10: # case
.annotate 'line', 8782
# var name: $P7
    $P7 = __ARG_4.'get'()
.annotate 'line', 8783
    $P11 = $P7.'isidentifier'()
    isfalse $I2, $P11
    unless $I2 goto __label_12
.annotate 'line', 8784
    'Expected'("member identifier", $P7)
  __label_12: # endif
.annotate 'line', 8785
# predefined push
    push $P2, $P7
.annotate 'line', 8786
    $P4 = __ARG_4.'get'()
.annotate 'line', 8787
    $P12 = $P4.'isop'(';')
    isfalse $I3, $P12
    unless $I3 goto __label_13
.annotate 'line', 8788
    'Expected'("';' in member declaration", $P4)
  __label_13: # endif
    goto __label_7 # break
  __label_11: # case
.annotate 'line', 8791
# var cst: $P8
    $P8 = 'parseConst'($P4, __ARG_4, self)
.annotate 'line', 8792
# predefined push
    push $P3, $P8
    goto __label_7 # break
  __label_8: # default
.annotate 'line', 8795
    'SyntaxError'("Unexpected item in class", $P4)
  __label_7: # switch end
# }
  __label_4: # for iteration
.annotate 'line', 8775
    $P4 = __ARG_4.'get'()
    goto __label_6
  __label_5: # for end
# }
.annotate 'line', 8798

.end # ClassStatement


.sub 'getpath' :method
# Body
# {
.annotate 'line', 8801
    getattribute $P1, self, 'classns'
    .return($P1)
# }
.annotate 'line', 8802

.end # getpath


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 8805
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 8806

.end # generatesubid


.sub 'findsymbol' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8809
    getattribute $P1, self, 'parent'
    .tailcall $P1.'findsymbol'(__ARG_1)
# }
.annotate 'line', 8810

.end # findsymbol


.sub 'findclasskey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8813
    getattribute $P1, self, 'parent'
    .tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 8814

.end # findclasskey


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8817
    getattribute $P1, self, 'parent'
    .tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 8818

.end # checkclass


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8821
    getattribute $P1, self, 'owner'
    .tailcall $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 8822

.end # use_predef


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8825
    getattribute $P1, self, 'constants'
    'optimize_array'($P1)
.annotate 'line', 8826
    getattribute $P1, self, 'functions'
    'optimize_array'($P1)
.annotate 'line', 8827
    .return(self)
# }
.annotate 'line', 8828

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8831
# var classns: $P1
    getattribute $P1, self, 'classns'
.annotate 'line', 8832
    $P5 = 'getparrotnamespacekey'($P1)
    __ARG_1.'say'($P5)
.annotate 'line', 8833
    getattribute $P5, self, 'functions'
    iter $P6, $P5
    set $P6, 0
  __label_0: # for iteration
    unless $P6 goto __label_1
    shift $P2, $P6
.annotate 'line', 8834
    $P2.'emit'(__ARG_1)
    goto __label_0
  __label_1: # endfor
.annotate 'line', 8836
    __ARG_1.'say'('.sub Winxed_class_init :anon :load :init')
.annotate 'line', 8838
    $P5 = self.'getclasskey'()
    __ARG_1.'say'('    ', 'newclass $P0, ', $P5)
.annotate 'line', 8839
# n: $I1
    set $I1, 1
.annotate 'line', 8840
    getattribute $P5, self, 'bases'
    iter $P7, $P5
    set $P7, 0
  __label_2: # for iteration
    unless $P7 goto __label_3
    shift $P3, $P7
# {
.annotate 'line', 8841
    $P3.'annotate'(__ARG_1)
.annotate 'line', 8842
# reg: $S1
    set $I2, $I1
    inc $I1
    set $S2, $I2
    concat $S1, "$P", $S2
.annotate 'line', 8843
    __ARG_1.'print'('    ', 'get_class ', $S1, ', ')
.annotate 'line', 8844
    getattribute $P5, self, 'parent'
    $P3.'emit'(__ARG_1, $P5)
.annotate 'line', 8845
    __ARG_1.'say'()
.annotate 'line', 8846
    __ARG_1.'say'('    ', 'addparent $P0, ', $S1)
# }
    goto __label_2
  __label_3: # endfor
.annotate 'line', 8848
    getattribute $P5, self, 'members'
    iter $P8, $P5
    set $P8, 0
  __label_4: # for iteration
    unless $P8 goto __label_5
    shift $P4, $P8
# {
.annotate 'line', 8849
    __ARG_1.'annotate'($P4)
.annotate 'line', 8850
    __ARG_1.'say'('    ', "addattribute $P0, '", $P4, "'")
# }
    goto __label_4
  __label_5: # endfor
.annotate 'line', 8853
    __ARG_1.'say'('.end')
# }
.annotate 'line', 8854

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassStatement' ]
.annotate 'line', 8747
    get_class $P1, [ 'ClassBase' ]
    addparent $P0, $P1
    get_class $P2, [ 'VarContainer' ]
    addparent $P0, $P2
.annotate 'line', 8749
    addattribute $P0, 'parent'
.annotate 'line', 8750
    addattribute $P0, 'bases'
.annotate 'line', 8751
    addattribute $P0, 'constants'
.annotate 'line', 8752
    addattribute $P0, 'functions'
.annotate 'line', 8753
    addattribute $P0, 'members'
.end
.namespace [ 'DeclareClassStatement' ]

.sub 'DeclareClassStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8861
    self.'ClassBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 8862
    setattribute self, 'name', __ARG_2
# }
.annotate 'line', 8863

.end # DeclareClassStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8866
    .return(self)
# }
.annotate 'line', 8867

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'DeclareClassStatement' ]
.annotate 'line', 8857
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
.annotate 'line', 8875
# var name: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8876
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 8877
    $I1 = $P2.'isop'(';')
    if $I1 goto __label_2
    $I1 = $P2.'isop'('.')
  __label_2:
    unless $I1 goto __label_0
# {
# for loop
  __label_5: # for condition
.annotate 'line', 8878
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_4
    unless $P3 goto __label_4
# {
.annotate 'line', 8879
# predefined string
    set $S1, $P1
    __ARG_3 = __ARG_3.'declarenamespace'($P1, $S1)
.annotate 'line', 8880
    $P1 = __ARG_2.'get'()
# }
  __label_3: # for iteration
.annotate 'line', 8878
    $P2 = __ARG_2.'get'()
    goto __label_5
  __label_4: # for end
.annotate 'line', 8882
    'RequireOp'(';', $P2)
.annotate 'line', 8883
    new $P4, [ 'DeclareClassStatement' ]
    $P4.'DeclareClassStatement'(__ARG_1, $P1, __ARG_3)
    set $P3, $P4
    __ARG_3.'declareclass'($P3)
# }
    goto __label_1
  __label_0: # else
# {
.annotate 'line', 8886
    __ARG_2.'unget'($P2)
.annotate 'line', 8887
    new $P4, [ 'ClassStatement' ]
    $P4.'ClassStatement'(__ARG_1, $P1, __ARG_3, __ARG_2)
    set $P3, $P4
    __ARG_3.'addclass'($P3)
# }
  __label_1: # endif
# }
.annotate 'line', 8889

.end # parseClass


.sub 'include_parrot'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8897
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8898
    $P6 = $P1.'isstring'()
    isfalse $I4, $P6
    unless $I4 goto __label_0
.annotate 'line', 8899
    'Expected'('literal string', $P1)
  __label_0: # endif
.annotate 'line', 8900
    'ExpectOp'(';', __ARG_2)
.annotate 'line', 8901
# filename: $S1
    $P6 = $P1.'rawstring'()
    null $S1
    if_null $P6, __label_1
    set $S1, $P6
  __label_1:
.annotate 'line', 8902
# var interp: $P2
# predefined getinterp
    getinterp $P2
# Constant IGLOBALS_LIB_PATHS evaluated at compile time
# Constant PARROT_LIB_PATH_INCLUDE evaluated at compile time
.annotate 'line', 8907
# var libpaths: $P3
    $P3 = $P2[9]
.annotate 'line', 8908
# var paths: $P4
    $P4 = $P3[0]
.annotate 'line', 8909
# var file: $P5
    new $P5, [ 'FileHandle' ]
.annotate 'line', 8910
    iter $P7, $P4
    set $P7, 0
  __label_2: # for iteration
    unless $P7 goto __label_3
    shift $S2, $P7
# {
.annotate 'line', 8911
# filepath: $S3
    concat $S3, $S2, $S1
.annotate 'line', 8912
# try: create handler
    new $P6, 'ExceptionHandler'
    set_label $P6, __label_4
    push_eh $P6
# try: begin
# {
.annotate 'line', 8913
    $P5.'open'($S3, 'r')
    goto __label_3 # break
.annotate 'line', 8914
# }
# try: end
    pop_eh
    goto __label_5
.annotate 'line', 8912
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
.annotate 'line', 8919
    $P6 = $P5.'is_closed'()
    if_null $P6, __label_6
    unless $P6 goto __label_6
.annotate 'line', 8920
    'SyntaxError'('File not found', $P1)
  __label_6: # endif
# Constant MACRO_CONST evaluated at compile time
# for loop
.annotate 'line', 8925
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
.annotate 'line', 8926
# predefined substr
    substr $S8, $S4, 0, 12
    ne $S8, '.macro_const', __label_11
# {
.annotate 'line', 8927
# pos: $I1
    set $I1, 12
.annotate 'line', 8928
# c: $S5
    null $S5
  __label_13: # while
.annotate 'line', 8929
# predefined substr
    substr $S5, $S4, $I1, 1
    iseq $I4, $S5, " "
    if $I4 goto __label_14
    iseq $I4, $S5, "\t"
  __label_14:
    unless $I4 goto __label_12
.annotate 'line', 8930
    inc $I1
    goto __label_13
  __label_12: # endwhile
.annotate 'line', 8931
# pos2: $I2
    set $I2, $I1
  __label_16: # while
.annotate 'line', 8932
# predefined substr
    substr $S5, $S4, $I2, 1
    isne $I4, $S5, " "
    unless $I4 goto __label_20
    isne $I4, $S5, "\t"
  __label_20:
    unless $I4 goto __label_19
.annotate 'line', 8933
    isne $I4, $S5, "\n"
  __label_19:
    unless $I4 goto __label_18
    isne $I4, $S5, "\r"
  __label_18:
    unless $I4 goto __label_17
    isne $I4, $S5, ""
  __label_17:
    unless $I4 goto __label_15
.annotate 'line', 8934
    inc $I2
    goto __label_16
  __label_15: # endwhile
.annotate 'line', 8935
    ne $I2, $I1, __label_21
    goto __label_7 # continue
  __label_21: # endif
.annotate 'line', 8937
# name: $S6
    sub $I4, $I2, $I1
# predefined substr
    substr $S6, $S4, $I1, $I4
  __label_23: # while
.annotate 'line', 8938
# predefined substr
    substr $S5, $S4, $I2, 1
    iseq $I4, $S5, " "
    if $I4 goto __label_24
    iseq $I4, $S5, "\t"
  __label_24:
    unless $I4 goto __label_22
.annotate 'line', 8939
    inc $I2
    goto __label_23
  __label_22: # endwhile
.annotate 'line', 8940
    set $I1, $I2
  __label_26: # while
.annotate 'line', 8941
# predefined substr
    substr $S5, $S4, $I2, 1
    isne $I4, $S5, " "
    unless $I4 goto __label_30
    isne $I4, $S5, "\t"
  __label_30:
    unless $I4 goto __label_29
.annotate 'line', 8942
    isne $I4, $S5, "\n"
  __label_29:
    unless $I4 goto __label_28
    isne $I4, $S5, "\r"
  __label_28:
    unless $I4 goto __label_27
    isne $I4, $S5, ""
  __label_27:
    unless $I4 goto __label_25
.annotate 'line', 8943
    inc $I2
    goto __label_26
  __label_25: # endwhile
.annotate 'line', 8944
    ne $I2, $I1, __label_31
    goto __label_7 # continue
  __label_31: # endif
.annotate 'line', 8946
# value: $S7
    sub $I4, $I2, $I1
# predefined substr
    substr $S7, $S4, $I1, $I4
.annotate 'line', 8948
# ivalue: $I3
    null $I3
.annotate 'line', 8949
# predefined substr
    substr $S8, $S7, 0, 2
    iseq $I4, $S8, '0x'
    if $I4 goto __label_34
# predefined substr
    substr $S9, $S7, 0, 2
    iseq $I4, $S9, '0X'
  __label_34:
    unless $I4 goto __label_32
.annotate 'line', 8950
# predefined substr
    substr $S10, $S7, 2
    box $P8, $S10
    $P6 = $P8.'to_int'(16)
    set $I3, $P6
    goto __label_33
  __label_32: # else
.annotate 'line', 8952
    set $I3, $S7
  __label_33: # endif
.annotate 'line', 8955
    new $P9, [ 'TokenInteger' ]
    getattribute $P10, __ARG_1, 'file'
    getattribute $P11, __ARG_1, 'line'
    $P9.'TokenInteger'($P10, $P11, $S6)
    set $P8, $P9
.annotate 'line', 8954
    $P6 = 'integerValue'(__ARG_3, $P8, $I3)
.annotate 'line', 8953
    __ARG_3.'createconst'($S6, 'I', $P6, '', 4)
# }
  __label_11: # endif
# }
  __label_7: # for iteration
.annotate 'line', 8925
    $P6 = $P5.'readline'()
    set $S4, $P6
    goto __label_9
  __label_8: # for end
.annotate 'line', 8960
    $P5.'close'()
# }
.annotate 'line', 8961

.end # include_parrot

.namespace [ 'NamespaceBase' ]

.sub 'NamespaceBase' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8976
    setattribute self, 'nspath', __ARG_1
.annotate 'line', 8977
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'namespaces', $P2
.annotate 'line', 8978
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'classes', $P2
.annotate 'line', 8979
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'functions', $P2
.annotate 'line', 8980
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'items', $P2
# }
.annotate 'line', 8981

.end # NamespaceBase


.sub 'getpath' :method
# Body
# {
.annotate 'line', 8984
    getattribute $P1, self, 'nspath'
    .return($P1)
# }
.annotate 'line', 8985

.end # getpath


.sub 'checkclass_base' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8988
# var classes: $P1
    getattribute $P1, self, 'classes'
.annotate 'line', 8989
    iter $P3, $P1
    set $P3, 0
  __label_0: # for iteration
    unless $P3 goto __label_1
    shift $P2, $P3
.annotate 'line', 8990
    getattribute $P4, $P2, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_2
.annotate 'line', 8991
    .return($P2)
  __label_2: # endif
    goto __label_0
  __label_1: # endfor
    null $P4
.annotate 'line', 8992
    .return($P4)
# }
.annotate 'line', 8993

.end # checkclass_base


.sub 'findclasskey_base' :method
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 8998
# predefined elements
    elements $I1, __ARG_1
    null $I2
    if $I1 == $I2 goto __label_2
    set $I2, 1
    if $I1 == $I2 goto __label_3
    goto __label_1
  __label_2: # case
    null $P5
.annotate 'line', 9000
    .return($P5)
  __label_3: # case
.annotate 'line', 9003
    $P6 = __ARG_1[0]
    .tailcall self.'checkclass_base'($P6)
  __label_1: # default
.annotate 'line', 9008
# var namespaces: $P1
    getattribute $P1, self, 'namespaces'
.annotate 'line', 9009
# var childkey: $P2
# predefined clone
    clone $P2, __ARG_1
.annotate 'line', 9010
# basename: $S1
    $P7 = $P2.'shift'()
    null $S1
    if_null $P7, __label_4
    set $S1, $P7
  __label_4:
.annotate 'line', 9011
    iter $P8, $P1
    set $P8, 0
  __label_5: # for iteration
    unless $P8 goto __label_6
    shift $P3, $P8
# {
.annotate 'line', 9012
    getattribute $P9, $P3, 'name'
    set $S2, $P9
    ne $S2, $S1, __label_7
# {
.annotate 'line', 9013
# var found: $P4
    $P4 = $P3.'findclasskey'($P2)
.annotate 'line', 9014
    if_null $P4, __label_8
.annotate 'line', 9015
    .return($P4)
  __label_8: # endif
# }
  __label_7: # endif
# }
    goto __label_5
  __label_6: # endfor
  __label_0: # switch end
    null $P5
.annotate 'line', 9019
    .return($P5)
# }
.annotate 'line', 9020

.end # findclasskey_base


.sub 'findsymbol' :method
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 9025
# predefined elements
    elements $I1, __ARG_1
    null $I2
    if $I1 == $I2 goto __label_2
    set $I2, 1
    if $I1 == $I2 goto __label_3
    goto __label_1
  __label_2: # case
    null $P7
.annotate 'line', 9027
    .return($P7)
  __label_3: # case
.annotate 'line', 9029
# name: $S1
    $S1 = __ARG_1[0]
.annotate 'line', 9031
# var sym: $P1
    $P1 = self.'checkclass_base'($S1)
.annotate 'line', 9032
    if_null $P1, __label_4
.annotate 'line', 9033
    .return($P1)
  __label_4: # endif
.annotate 'line', 9034
    getattribute $P8, self, 'functions'
    iter $P9, $P8
    set $P9, 0
  __label_5: # for iteration
    unless $P9 goto __label_6
    shift $P2, $P9
.annotate 'line', 9035
    getattribute $P10, $P2, 'name'
    set $S3, $P10
    ne $S3, $S1, __label_7
.annotate 'line', 9036
    .return($P2)
  __label_7: # endif
    goto __label_5
  __label_6: # endfor
    null $P11
.annotate 'line', 9037
    .return($P11)
  __label_1: # default
.annotate 'line', 9042
# var namespaces: $P3
    getattribute $P3, self, 'namespaces'
.annotate 'line', 9043
# var childkey: $P4
# predefined clone
    clone $P4, __ARG_1
.annotate 'line', 9044
# basename: $S2
    $P12 = $P4.'shift'()
    null $S2
    if_null $P12, __label_8
    set $S2, $P12
  __label_8:
.annotate 'line', 9045
    iter $P13, $P3
    set $P13, 0
  __label_9: # for iteration
    unless $P13 goto __label_10
    shift $P5, $P13
# {
.annotate 'line', 9046
    getattribute $P14, $P5, 'name'
    set $S4, $P14
    ne $S4, $S2, __label_11
# {
.annotate 'line', 9047
# var found: $P6
    $P6 = $P5.'findsymbol'($P4)
.annotate 'line', 9048
    if_null $P6, __label_12
.annotate 'line', 9049
    .return($P6)
  __label_12: # endif
# }
  __label_11: # endif
# }
    goto __label_9
  __label_10: # endfor
  __label_0: # switch end
    null $P7
.annotate 'line', 9053
    .return($P7)
# }
.annotate 'line', 9054

.end # findsymbol


.sub 'declarenamespace' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 9057
# var child: $P1
    new $P1, [ 'NamespaceStatement' ]
    null $P2
    $P1.'NamespaceStatement'(self, __ARG_1, __ARG_2, $P2)
.annotate 'line', 9058
    getattribute $P2, self, 'namespaces'
# predefined push
    push $P2, $P1
.annotate 'line', 9059
    .return($P1)
# }
.annotate 'line', 9060

.end # declarenamespace


.sub 'childnamespace' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9063
# var child: $P1
    new $P1, [ 'NamespaceStatement' ]
    $P1.'NamespaceStatement'(self, __ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 9064
    getattribute $P2, self, 'namespaces'
# predefined push
    push $P2, $P1
.annotate 'line', 9065
    getattribute $P2, self, 'items'
# predefined push
    push $P2, $P1
.annotate 'line', 9066
    .return($P1)
# }
.annotate 'line', 9067

.end # childnamespace


.sub 'declareclass' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9070
    getattribute $P1, self, 'classes'
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 9071

.end # declareclass


.sub 'addclass' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9074
    getattribute $P1, self, 'classes'
# predefined push
    push $P1, __ARG_1
.annotate 'line', 9075
    getattribute $P1, self, 'items'
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 9076

.end # addclass


.sub 'parsenamespace' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9079
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9080
# name: $S1
    set $P4, $P1
    null $S1
    if_null $P4, __label_0
    set $S1, $P4
  __label_0:
.annotate 'line', 9081
    $P1 = __ARG_2.'get'()
.annotate 'line', 9083
# var modifier: $P2
    null $P2
.annotate 'line', 9084
    $P4 = $P1.'isop'('[')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 9085
    new $P5, [ 'ModifierList' ]
    $P5.'ModifierList'(__ARG_2, self)
    set $P2, $P5
.annotate 'line', 9086
    $P1 = __ARG_2.'get'()
# }
  __label_1: # endif
.annotate 'line', 9089
    'RequireOp'('{', $P1)
.annotate 'line', 9090
# var child: $P3
    $P3 = self.'childnamespace'(__ARG_1, $S1, $P2)
.annotate 'line', 9091
    $P3.'parse'(__ARG_2)
# }
.annotate 'line', 9092

.end # parsenamespace


.sub 'parse' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9095
# var items: $P1
    getattribute $P1, self, 'items'
.annotate 'line', 9096
# var functions: $P2
    getattribute $P2, self, 'functions'
.annotate 'line', 9097
# var classes: $P3
    getattribute $P3, self, 'classes'
.annotate 'line', 9098
# var t: $P4
    null $P4
# for loop
.annotate 'line', 9099
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
.annotate 'line', 9101
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
.annotate 'line', 9103
    self.'parsenamespace'($P4, __ARG_1)
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 9106
# var cst: $P5
    $P5 = 'parseConst'($P4, __ARG_1, self)
.annotate 'line', 9107
# predefined push
    push $P1, $P5
    goto __label_4 # break
  __label_8: # case
.annotate 'line', 9110
# var f: $P6
    new $P6, [ 'FunctionStatement' ]
    $P6.'FunctionStatement'($P4, __ARG_1, self)
.annotate 'line', 9111
# predefined push
    push $P2, $P6
.annotate 'line', 9112
# predefined push
    push $P1, $P6
    goto __label_4 # break
  __label_9: # case
.annotate 'line', 9115
    'parseClass'($P4, __ARG_1, self)
    goto __label_4 # break
  __label_10: # case
.annotate 'line', 9118
    $P4 = __ARG_1.'get'()
.annotate 'line', 9119
    $P9 = $P4.'iskeyword'('extern')
    isfalse $I2, $P9
    unless $I2 goto __label_14
.annotate 'line', 9120
    'SyntaxError'('Unsupported at namespace level', $P4)
  __label_14: # endif
.annotate 'line', 9121
    $P4 = __ARG_1.'get'()
.annotate 'line', 9122
    $P10 = $P4.'isstring'()
    isfalse $I3, $P10
    unless $I3 goto __label_15
.annotate 'line', 9123
    'Expected'('string literal', $P4)
  __label_15: # endif
.annotate 'line', 9124
# reqlib: $S1
    set $P11, $P4
    null $S1
    if_null $P11, __label_16
    set $S1, $P11
  __label_16:
.annotate 'line', 9125
    self.'addlib'($S1)
.annotate 'line', 9126
    'ExpectOp'(';', __ARG_1)
    goto __label_4 # break
  __label_11: # case
.annotate 'line', 9129
    'include_parrot'($P4, __ARG_1, self)
    goto __label_4 # break
  __label_12: # case
.annotate 'line', 9132
    $P4 = __ARG_1.'get'()
.annotate 'line', 9133
    $P12 = $P4.'isstring'()
    isfalse $I4, $P12
    unless $I4 goto __label_17
.annotate 'line', 9134
    'Expected'('string literal', $P4)
  __label_17: # endif
.annotate 'line', 9135
    'ExpectOp'(';', __ARG_1)
.annotate 'line', 9136
    new $P15, [ 'StringLiteral' ]
    $P15.'StringLiteral'(self, $P4)
    set $P14, $P15
    $P13 = $P14.'getPirString'()
    self.'addload'($P13)
    goto __label_4 # break
  __label_13: # case
.annotate 'line', 9139
    $P4 = __ARG_1.'get'()
.annotate 'line', 9140
    $P16 = $P4.'isstring'()
    isfalse $I5, $P16
    unless $I5 goto __label_18
.annotate 'line', 9141
    'Expected'('string literal', $P4)
  __label_18: # endif
.annotate 'line', 9142
    'ExpectOp'(';', __ARG_1)
.annotate 'line', 9143
    new $P19, [ 'StringLiteral' ]
    $P19.'StringLiteral'(self, $P4)
    set $P18, $P19
    $P17 = $P18.'getPirString'()
    self.'addlib'($P17)
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 9146
    'SyntaxError'("Unexpected token", $P4)
  __label_4: # switch end
# }
  __label_0: # for iteration
.annotate 'line', 9099
    $P4 = __ARG_1.'get'()
    goto __label_2
  __label_1: # for end
.annotate 'line', 9149
    if_null $P4, __label_19
    unless $P4 goto __label_19
.annotate 'line', 9150
    self.'close_ns'($P4)
    goto __label_20
  __label_19: # else
.annotate 'line', 9152
    self.'unclosed_ns'()
  __label_20: # endif
# }
.annotate 'line', 9153

.end # parse


.sub 'optimize_base' :method
# Body
# {
.annotate 'line', 9156
    getattribute $P1, self, 'items'
    'optimize_array'($P1)
# }
.annotate 'line', 9157

.end # optimize_base


.sub 'emit_base' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9160
# var path: $P1
    $P1 = self.'getpath'()
.annotate 'line', 9161
# s: $S1
    $P3 = 'getparrotnamespacekey'($P1)
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
  __label_0:
.annotate 'line', 9163
# activate: $I1
    set $I1, 1
.annotate 'line', 9164
    getattribute $P3, self, 'items'
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
# {
.annotate 'line', 9165
    isa $I2, $P2, [ 'NamespaceStatement' ]
    if $I2 goto __label_5
.annotate 'line', 9166
    isa $I2, $P2, [ 'ClassStatement' ]
  __label_5:
    unless $I2 goto __label_3
.annotate 'line', 9167
    set $I1, 1
    goto __label_4
  __label_3: # else
.annotate 'line', 9169
    unless $I1 goto __label_6
# {
.annotate 'line', 9170
    __ARG_1.'say'($S1)
.annotate 'line', 9171
    null $I1
# }
  __label_6: # endif
  __label_4: # endif
.annotate 'line', 9173
    $P2.'emit'(__ARG_1)
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 9175

.end # emit_base

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NamespaceBase' ]
.annotate 'line', 8965
    get_class $P1, [ 'VarContainer' ]
    addparent $P0, $P1
.annotate 'line', 8967
    addattribute $P0, 'nspath'
.annotate 'line', 8968
    addattribute $P0, 'namespaces'
.annotate 'line', 8969
    addattribute $P0, 'classes'
.annotate 'line', 8970
    addattribute $P0, 'functions'
.annotate 'line', 8971
    addattribute $P0, 'items'
.annotate 'line', 8972
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
.annotate 'line', 9193
# var nspath: $P1
    $P2 = __ARG_1.'getpath'()
# predefined clone
    clone $P1, $P2
.annotate 'line', 9194
# predefined push
    push $P1, __ARG_3
.annotate 'line', 9195
    self.'NamespaceBase'($P1)
.annotate 'line', 9197
    setattribute self, 'parent', __ARG_1
.annotate 'line', 9198
    setattribute self, 'start', __ARG_2
.annotate 'line', 9199
    setattribute self, 'owner', __ARG_1
.annotate 'line', 9200
    box $P2, __ARG_3
    setattribute self, 'name', $P2
.annotate 'line', 9201
    setattribute self, 'modifier', __ARG_4
.annotate 'line', 9202
    if_null __ARG_4, __label_0
# {
.annotate 'line', 9203
    $P2 = __ARG_4.'pick'('HLL')
    if_null $P2, __label_1
.annotate 'line', 9204
    getattribute $P4, self, 'name'
    setattribute self, 'hll', $P4
  __label_1: # endif
# }
  __label_0: # endif
# }
.annotate 'line', 9206

.end # NamespaceStatement


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 9209
    getattribute $P1, self, 'parent'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 9210

.end # dowarnings


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 9213
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 9214

.end # generatesubid


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9217
    getattribute $P1, self, 'owner'
    $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 9218

.end # use_predef


.sub 'addlib' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9221
    getattribute $P1, self, 'parent'
    $P1.'addlib'(__ARG_1)
# }
.annotate 'line', 9222

.end # addlib


.sub 'addlib' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9225
    getattribute $P1, self, 'parent'
    $P1.'addload'(__ARG_1)
# }
.annotate 'line', 9226

.end # addlib


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9229
# var cl: $P1
    $P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 9230
    unless_null $P1, __label_0
.annotate 'line', 9231
    getattribute $P2, self, 'parent'
    .tailcall $P2.'checkclass'(__ARG_1)
    goto __label_1
  __label_0: # else
.annotate 'line', 9233
    .return($P1)
  __label_1: # endif
# }
.annotate 'line', 9234

.end # checkclass


.sub 'findclasskey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9239
# var cl: $P1
    $P1 = self.'findclasskey_base'(__ARG_1)
.annotate 'line', 9240
    unless_null $P1, __label_0
.annotate 'line', 9241
    getattribute $P2, self, 'parent'
    $P1 = $P2.'findclasskey'(__ARG_1)
  __label_0: # endif
.annotate 'line', 9242
    .return($P1)
# }
.annotate 'line', 9243

.end # findclasskey


.sub 'unclosed_ns' :method
# Body
# {
.annotate 'line', 9246
    getattribute $P1, self, 'start'
    'SyntaxError'('unclosed namespace', $P1)
# }
.annotate 'line', 9247

.end # unclosed_ns


.sub 'close_ns' :method
        .param pmc __ARG_1
# Empty body

.end # close_ns


.sub 'optimize' :method
# Body
# {
.annotate 'line', 9254
# var modifier: $P1
    getattribute $P1, self, 'modifier'
.annotate 'line', 9255
    if_null $P1, __label_0
# {
.annotate 'line', 9256
    $P1 = $P1.'optimize'()
.annotate 'line', 9257
    setattribute self, 'modifier', $P1
# }
  __label_0: # endif
.annotate 'line', 9259
    self.'optimize_base'()
.annotate 'line', 9260
    .return(self)
# }
.annotate 'line', 9261

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9264
# var hll: $P1
    getattribute $P1, self, 'hll'
.annotate 'line', 9265
    if_null $P1, __label_0
.annotate 'line', 9266
    __ARG_1.'say'(".HLL '", $P1, "'")
  __label_0: # endif
.annotate 'line', 9268
    self.'emit_base'(__ARG_1)
.annotate 'line', 9270
    if_null $P1, __label_1
.annotate 'line', 9271
    __ARG_1.'say'(".HLL 'parrot'")
  __label_1: # endif
# }
.annotate 'line', 9272

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NamespaceStatement' ]
.annotate 'line', 9182
    get_class $P1, [ 'NamespaceBase' ]
    addparent $P0, $P1
.annotate 'line', 9184
    addattribute $P0, 'parent'
.annotate 'line', 9185
    addattribute $P0, 'start'
.annotate 'line', 9186
    addattribute $P0, 'name'
.annotate 'line', 9187
    addattribute $P0, 'modifier'
.annotate 'line', 9188
    addattribute $P0, 'hll'
.end
.namespace [ 'RootNamespace' ]

.sub 'RootNamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9289
    new $P1, ['ResizableStringArray']
.annotate 'line', 9290
    self.'NamespaceBase'($P1)
.annotate 'line', 9291
    setattribute self, 'unit', __ARG_1
.annotate 'line', 9292
    root_new $P3, ['parrot';'Hash']
    setattribute self, 'predefs_used', $P3
.annotate 'line', 9293
    box $P2, 0
    setattribute self, 'subidgen', $P2
# }
.annotate 'line', 9294

.end # RootNamespace


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9297
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 9298
    $P1[__ARG_1] = 1
# }
.annotate 'line', 9299

.end # use_predef


.sub 'predef_is_used' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9302
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 9303
    $P2 = $P1[__ARG_1]
    unless_null $P2, __label_1
    null $I1
    goto __label_0
  __label_1:
    set $I1, 1
  __label_0:
    .return($I1)
# }
.annotate 'line', 9304

.end # predef_is_used


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 9308
# var subidgen: $P1
    getattribute $P1, self, 'subidgen'
.annotate 'line', 9309
# idgen: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 9310
    inc $I1
.annotate 'line', 9311
    assign $P1, $I1
.annotate 'line', 9312
# id: $S1
# predefined string
    set $S2, $I1
    concat $S1, 'WSubId_', $S2
.annotate 'line', 9313
    .return($S1)
# }
.annotate 'line', 9314

.end # generatesubid


.sub 'addlib' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9318
# var libs: $P1
    getattribute $P1, self, 'libs'
.annotate 'line', 9319
    unless_null $P1, __label_0
# {
.annotate 'line', 9320
    root_new $P1, ['parrot';'Hash']
.annotate 'line', 9321
    setattribute self, 'libs', $P1
# }
  __label_0: # endif
.annotate 'line', 9323
    $P1[__ARG_1] = 1
# }
.annotate 'line', 9324

.end # addlib


.sub 'addload' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9327
# var loads: $P1
    getattribute $P1, self, 'loads'
.annotate 'line', 9328
    unless_null $P1, __label_0
# {
.annotate 'line', 9329
    root_new $P1, ['parrot';'Hash']
.annotate 'line', 9330
    setattribute self, 'loads', $P1
# }
  __label_0: # endif
.annotate 'line', 9332
    $P1[__ARG_1] = 1
# }
.annotate 'line', 9333

.end # addload


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9336
    .tailcall self.'checkclass_base'(__ARG_1)
# }
.annotate 'line', 9337

.end # checkclass


.sub 'findclasskey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9341
    .tailcall self.'findclasskey_base'(__ARG_1)
# }
.annotate 'line', 9342

.end # findclasskey


.sub 'unclosed_ns' :method
# Empty body

.end # unclosed_ns


.sub 'close_ns' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9349
    'SyntaxError'('Cannot close root namespace', __ARG_1)
# }
.annotate 'line', 9350

.end # close_ns


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 9353
    getattribute $P1, self, 'unit'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 9354

.end # dowarnings


.sub 'optimize' :method
# Body
# {
.annotate 'line', 9357
    self.'optimize_base'()
.annotate 'line', 9358
    .return(self)
# }
.annotate 'line', 9359

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9362
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 9365
    $P5 = $P1['chomp']
    if_null $P5, __label_0
.annotate 'line', 9366
    self.'addload'('"String/Utils.pbc"')
  __label_0: # endif
.annotate 'line', 9369
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
.annotate 'line', 9372
    iter $P6, $P2
    set $P6, 0
  __label_1: # for iteration
    unless $P6 goto __label_2
    shift $S1, $P6
.annotate 'line', 9373
    $P5 = $P1[$S1]
    if_null $P5, __label_3
# {
.annotate 'line', 9374
    self.'addlib'("'trans_ops'")
    goto __label_2 # break
.annotate 'line', 9375
# }
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9378
# somelib: $I1
    null $I1
.annotate 'line', 9379
# var libs: $P3
    getattribute $P3, self, 'libs'
.annotate 'line', 9380
    if_null $P3, __label_4
# {
.annotate 'line', 9381
    set $I1, 1
.annotate 'line', 9382
    iter $P7, $P3
    set $P7, 0
  __label_5: # for iteration
    unless $P7 goto __label_6
    shift $S2, $P7
.annotate 'line', 9383
    __ARG_1.'say'('.loadlib ', $S2)
    goto __label_5
  __label_6: # endfor
# }
  __label_4: # endif
.annotate 'line', 9386
# someload: $I2
    null $I2
.annotate 'line', 9387
# var loads: $P4
    getattribute $P4, self, 'loads'
.annotate 'line', 9388
    if_null $P4, __label_7
# {
.annotate 'line', 9389
    set $I2, 1
.annotate 'line', 9390
    __ARG_1.'print'("\n.sub initial_load_bytecode :anon :load :init\n")
.annotate 'line', 9391
    iter $P8, $P4
    set $P8, 0
  __label_8: # for iteration
    unless $P8 goto __label_9
    shift $S3, $P8
.annotate 'line', 9392
    __ARG_1.'say'('    load_bytecode ', $S3)
    goto __label_8
  __label_9: # endfor
.annotate 'line', 9393
    __ARG_1.'print'(".end\n\n")
# }
  __label_7: # endif
.annotate 'line', 9395
    or $I3, $I1, $I2
    unless $I3 goto __label_10
.annotate 'line', 9396
    __ARG_1.'comment'('end libs')
  __label_10: # endif
.annotate 'line', 9398
    self.'emit_base'(__ARG_1)
# }
.annotate 'line', 9399

.end # emit


.sub 'emitinclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9402
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 9403
    iter $P4, $P1
    set $P4, 0
  __label_0: # for iteration
    unless $P4 goto __label_1
    shift $S1, $P4
# {
.annotate 'line', 9404
# var data: $P2
    $P2 = $P1[$S1]
.annotate 'line', 9405
    isa $I2, $P2, [ 'VarData' ]
    not $I1, $I2
    if $I1 goto __label_4
.annotate 'line', 9406
    $P5 = $P2.'gettype'()
    set $S2, $P5
    isne $I1, $S2, 'I'
  __label_4:
    if $I1 goto __label_3
.annotate 'line', 9407
    $I3 = $P2.'getflags'()
    band $I1, $I3, 4
  __label_3:
    unless $I1 goto __label_2
    goto __label_0 # continue
  __label_2: # endif
.annotate 'line', 9409
# var value: $P3
    $P3 = $P2.'getvalue'()
.annotate 'line', 9410
    $P5 = $P3.'getIntegerValue'()
    __ARG_1.'say'('.macro_const ', $S1, ' ', $P5)
# }
    goto __label_0
  __label_1: # endfor
# }
.annotate 'line', 9412

.end # emitinclude

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'RootNamespace' ]
.annotate 'line', 9279
    get_class $P1, [ 'NamespaceBase' ]
    addparent $P0, $P1
.annotate 'line', 9281
    addattribute $P0, 'unit'
.annotate 'line', 9282
    addattribute $P0, 'predefs_used'
.annotate 'line', 9283
    addattribute $P0, 'libs'
.annotate 'line', 9284
    addattribute $P0, 'loads'
.annotate 'line', 9285
    addattribute $P0, 'subidgen'
.end
.namespace [ ]
# Constant EVAL_NAME evaluated at compile time
.namespace [ 'WinxedCompileUnit' ]

.sub 'init' :method :vtable
# Body
# {
.annotate 'line', 9428
    box $P3, 1
    setattribute self, 'warnings', $P3
.annotate 'line', 9429
# var rootns: $P1
    new $P1, [ 'RootNamespace' ]
    $P1.'RootNamespace'(self)
.annotate 'line', 9432
# var taux: $P2
    new $P2, [ 'TokenIdentifier' ]
    $P2.'TokenIdentifier'('__predefconst__', 0, 'predefconst')
.annotate 'line', 9436
    new $P5, [ 'TokenInteger' ]
    getattribute $P6, $P2, 'file'
    getattribute $P7, $P2, 'line'
    $P5.'TokenInteger'($P6, $P7, 'false')
    set $P4, $P5
.annotate 'line', 9435
    $P3 = 'integerValue'($P1, $P4, 0)
.annotate 'line', 9434
    $P1.'createconst'('false', 'I', $P3, '', 4)
.annotate 'line', 9440
    new $P5, [ 'TokenInteger' ]
    getattribute $P6, $P2, 'file'
    getattribute $P7, $P2, 'line'
    $P5.'TokenInteger'($P6, $P7, 'false')
    set $P4, $P5
.annotate 'line', 9439
    $P3 = 'integerValue'($P1, $P4, 1)
.annotate 'line', 9438
    $P1.'createconst'('true', 'I', $P3, '', 4)
.annotate 'line', 9446
    new $P4, [ 'StringLiteral' ]
.annotate 'line', 9447
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
.annotate 'line', 9445
    $P1.'createconst'('__STAGE__', 'S', $P3, '', 4)
.annotate 'line', 9450
    setattribute self, 'rootns', $P1
# }
.annotate 'line', 9451

.end # init


.sub 'setwarnmode' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 9454
    getattribute $P1, self, 'warnings'
    assign $P1, __ARG_1
# }
.annotate 'line', 9455

.end # setwarnmode


.sub 'dowarnings' :method
# Body
# {
# predefined int
.annotate 'line', 9458
    getattribute $P1, self, 'warnings'
    set $I1, $P1
    .return($I1)
# }
.annotate 'line', 9459

.end # dowarnings


.sub 'parse' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9462
    getattribute $P1, self, 'rootns'
    $P1.'parse'(__ARG_1)
# }
.annotate 'line', 9463

.end # parse


.sub 'optimize' :method
# Body
# {
.annotate 'line', 9466
    getattribute $P3, self, 'rootns'
    $P2 = $P3.'optimize'()
    setattribute self, 'rootns', $P2
# }
.annotate 'line', 9467

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9470
    __ARG_1.'comment'('Begin generated code')
.annotate 'line', 9471
    __ARG_1.'say'('')
.annotate 'line', 9473
    getattribute $P1, self, 'rootns'
    $P1.'emit'(__ARG_1)
.annotate 'line', 9475
    __ARG_1.'comment'('End generated code')
# }
.annotate 'line', 9476

.end # emit


.sub 'emitinclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9479
    __ARG_1.'comment'('DO NOT EDIT THIS FILE')
.annotate 'line', 9480
    __ARG_1.'comment'('Generated automatically from Winxed sources')
.annotate 'line', 9482
    getattribute $P1, self, 'rootns'
    $P1.'emitinclude'(__ARG_1)
.annotate 'line', 9484
    __ARG_1.'comment'('End')
# }
.annotate 'line', 9485

.end # emitinclude

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'WinxedCompileUnit' ]
.annotate 'line', 9423
    addattribute $P0, 'rootns'
.annotate 'line', 9424
    addattribute $P0, 'warnings'
.end
.namespace [ 'WinxedHLL' ]

.sub '__private_compile_tail' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9494
    set $S2, __ARG_2
    ne $S2, 'parse', __label_0
.annotate 'line', 9495
    .return(__ARG_1)
  __label_0: # endif
.annotate 'line', 9496
# var handleout: $P1
    new $P1, [ 'StringHandle' ]
.annotate 'line', 9497
    $P1.'open'('__eval__', 'w')
.annotate 'line', 9498
# var emit: $P2
    new $P2, [ 'Emit' ]
    $P2.'Emit'($P1)
.annotate 'line', 9499
    if_null __ARG_3, __label_1
    unless __ARG_3 goto __label_1
.annotate 'line', 9500
    $P2.'disable_annotations'()
  __label_1: # endif
.annotate 'line', 9501
    __ARG_1.'emit'($P2)
.annotate 'line', 9502
    $P2.'close'()
.annotate 'line', 9503
    $P1.'close'()
.annotate 'line', 9504
# pircode: $S1
    $P5 = $P1.'read'(0)
    null $S1
    if_null $P5, __label_2
    set $S1, $P5
  __label_2:
.annotate 'line', 9505
# var object: $P3
    null $P3
# switch
.annotate 'line', 9506
    set $S2, __ARG_2
    set $S3, 'pir'
    if $S2 == $S3 goto __label_5
    set $S3, 'pbc'
    if $S2 == $S3 goto __label_6
    set $S3, ''
    if $S2 == $S3 goto __label_7
    goto __label_4
  __label_5: # case
.annotate 'line', 9508
    new $P3, [ 'String' ]
.annotate 'line', 9509
    assign $P3, $S1
    goto __label_3 # break
  __label_6: # case
  __label_7: # case
.annotate 'line', 9513
# var pircomp: $P4
# predefined compreg
    compreg $P4, 'PIR'
.annotate 'line', 9514
    $P3 = $P4($S1)
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 9515
# predefined string
.annotate 'line', 9517
    set $S4, __ARG_2
    concat $S5, 'Invalid target: ', $S4
# predefined die
    die $S5
  __label_3: # switch end
.annotate 'line', 9519
    .return($P3)
# }
.annotate 'line', 9520

.end # __private_compile_tail


.sub '__private_geninclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9523
# var handleout: $P1
    new $P1, [ 'StringHandle' ]
.annotate 'line', 9524
    $P1.'open'('__eval__', 'w')
.annotate 'line', 9525
# var emit: $P2
    new $P2, [ 'Emit' ]
    $P2.'Emit'($P1)
.annotate 'line', 9526
    __ARG_1.'emitinclude'($P2)
.annotate 'line', 9527
    $P2.'close'()
.annotate 'line', 9528
    $P1.'close'()
.annotate 'line', 9529
    .tailcall $P1.'read'(0)
# }
.annotate 'line', 9530

.end # __private_geninclude


.sub 'compile' :method
        .param string __ARG_1
        .param string __ARG_2 :optional :named('target')
        .param int __ARG_3 :optional :named('noan')
        .param int __ARG_4 :optional :named('nowarn')
# Body
# {
.annotate 'line', 9536
    unless_null __ARG_2, __label_0
.annotate 'line', 9537
    set __ARG_2, ''
  __label_0: # endif
.annotate 'line', 9538
# var handlein: $P1
    new $P1, [ 'StringHandle' ]
.annotate 'line', 9539
    $P1.'open'('__eval__', 'w')
.annotate 'line', 9540
    $P1.'puts'(__ARG_1)
.annotate 'line', 9541
    $P1.'close'()
.annotate 'line', 9542
    $P1.'open'('__eval__', 'r')
.annotate 'line', 9543
# var tk: $P2
    new $P2, [ 'Tokenizer' ]
    $P2.'Tokenizer'($P1, '__eval__')
.annotate 'line', 9544
# var winxed: $P3
    new $P3, [ 'WinxedCompileUnit' ]
.annotate 'line', 9545
    unless __ARG_4 goto __label_1
.annotate 'line', 9546
    $P3.'setwarnmode'(0)
  __label_1: # endif
.annotate 'line', 9547
    $P3.'parse'($P2)
.annotate 'line', 9548
    $P1.'close'()
.annotate 'line', 9549
    $P3.'optimize'()
.annotate 'line', 9550
    ne __ARG_2, 'include', __label_2
# {
.annotate 'line', 9551
    .tailcall self.'__private_geninclude'($P3)
# }
    goto __label_3
  __label_2: # else
.annotate 'line', 9554
    .tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3)
  __label_3: # endif
# }
.annotate 'line', 9555

.end # compile


.sub 'compile_from_file' :method
        .param string __ARG_1
        .param string __ARG_2 :optional :named('target')
        .param int __ARG_3 :optional :named('noan')
        .param int __ARG_4 :optional :named('nowarn')
# Body
# {
.annotate 'line', 9561
    unless_null __ARG_2, __label_0
.annotate 'line', 9562
    set __ARG_2, ''
  __label_0: # endif
.annotate 'line', 9563
# var handlein: $P1
    new $P1, [ 'FileHandle' ]
.annotate 'line', 9564
    $P1.'open'(__ARG_1, 'r')
.annotate 'line', 9565
    $P1.'encoding'('utf8')
.annotate 'line', 9566
# var tk: $P2
    new $P2, [ 'Tokenizer' ]
    $P2.'Tokenizer'($P1, __ARG_1)
.annotate 'line', 9567
# var winxed: $P3
    new $P3, [ 'WinxedCompileUnit' ]
.annotate 'line', 9568
    unless __ARG_4 goto __label_1
.annotate 'line', 9569
    $P3.'setwarnmode'(0)
  __label_1: # endif
.annotate 'line', 9570
    $P3.'parse'($P2)
.annotate 'line', 9571
    $P1.'close'()
.annotate 'line', 9572
    $P3.'optimize'()
.annotate 'line', 9573
    ne __ARG_2, 'include', __label_2
# {
.annotate 'line', 9574
    .tailcall self.'__private_geninclude'($P3)
# }
    goto __label_3
  __label_2: # else
.annotate 'line', 9577
    .tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3)
  __label_3: # endif
# }
.annotate 'line', 9578

.end # compile_from_file

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'WinxedHLL' ]
.end
.namespace [ ]

.sub 'initializer' :init :load
# Body
# {
.annotate 'line', 9587
# var comp: $P1
    new $P1, [ 'WinxedHLL' ]
.annotate 'line', 9588
# predefined compreg
    compreg 'winxed', $P1
# }
.annotate 'line', 9589

.end # initializer

# End generated code
