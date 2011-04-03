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
.annotate 'line', 311
    set $S3, $S2
    set $S4, '"'
    if $S3 == $S4 goto __label_4
    set $S4, '\'
    if $S3 == $S4 goto __label_5
    set $S4, "'"
    if $S3 == $S4 goto __label_6
    goto __label_3
# switch
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
.annotate 'line', 352
    set $S4, $S2
    set $S5, ""
    if $S4 == $S5 goto __label_5
    set $S5, "\n"
    if $S4 == $S5 goto __label_6
    set $S5, '\'
    if $S4 == $S5 goto __label_7
    goto __label_4
# switch
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
.annotate 'line', 387
    set $S5, $S2
    set $S6, ''
    if $S5 == $S6 goto __label_5
    set $S6, '"'
    if $S5 == $S6 goto __label_6
    set $S6, '\'
    if $S5 == $S6 goto __label_7
    goto __label_4
# switch
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
.annotate 'line', 406
    set $S5, $S2
    set $S6, ''
    if $S5 == $S6 goto __label_16
    set $S6, '"'
    if $S5 == $S6 goto __label_17
    set $S6, '\'
    if $S5 == $S6 goto __label_18
    goto __label_15
# switch
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
.annotate 'line', 603
.const 'Sub' $P5 = 'isidentstart'
.annotate 'line', 604
.const 'Sub' $P6 = 'isdigit'
.annotate 'line', 605
.const 'Sub' $P7 = 'getop'
.annotate 'line', 606
.const 'Sub' $P8 = 'getident'
.annotate 'line', 607
.const 'Sub' $P9 = 'getnumber'
.annotate 'line', 609
    getattribute $P10, self, 'stacked'
    if_null $P10, __label_0
    unless $P10 goto __label_0
# {
.annotate 'line', 610
# var t: $P1
    getattribute $P11, self, 'stacked'
    $P1 = $P11.'pop'()
.annotate 'line', 611
    .return($P1)
# }
 __label_0: # endif
.annotate 'line', 613
# c: $S1
    $P10 = self.'getchar'()
    null $S1
    if_null $P10, __label_1
    set $S1, $P10
 __label_1:
 __label_3: # while
.annotate 'line', 614
    $P10 = $P4($S1)
    if_null $P10, __label_2
    unless $P10 goto __label_2
.annotate 'line', 615
    $P11 = self.'getchar'()
    set $S1, $P11
    goto __label_3
 __label_2: # endwhile
.annotate 'line', 616
# line: $I1
    getattribute $P10, self, 'line'
    set $I1, $P10
.annotate 'line', 617
    ne $S1, '', __label_4
.annotate 'line', 618
    new $P11, [ 'TokenEof' ]
    getattribute $P12, self, 'filename'
    $P11.'TokenEof'($P12)
    set $P10, $P11
    .return($P10)
 __label_4: # endif
.annotate 'line', 619
    $P10 = $P5($S1)
    if_null $P10, __label_5
    unless $P10 goto __label_5
.annotate 'line', 620
    .tailcall $P8(self, $S1, $I1)
 __label_5: # endif
.annotate 'line', 621
    $P10 = $P6($S1)
    if_null $P10, __label_6
    unless $P10 goto __label_6
.annotate 'line', 622
    .tailcall $P9(self, $S1, $I1)
 __label_6: # endif
.annotate 'line', 624
# op: $S2
    set $S2, $S1
.annotate 'line', 625
# var select: $P2
    getattribute $P2, self, 'select'
.annotate 'line', 626
# var current: $P3
    $P3 = $P2[$S1]
 __label_8: # while
.annotate 'line', 628
    isnull $I2, $P3
    not $I2
    unless $I2 goto __label_9
    isa $I2, $P3, 'Hash'
 __label_9:
    unless $I2 goto __label_7
# {
.annotate 'line', 629
    $P10 = self.'getchar'()
    set $S1, $P10
.annotate 'line', 630
    set $P2, $P3
.annotate 'line', 631
    $P3 = $P2[$S1]
.annotate 'line', 632
    unless_null $P3, __label_10
# {
.annotate 'line', 633
    self.'ungetchar'($S1)
.annotate 'line', 634
    $P3 = $P2['']
# }
    goto __label_11
 __label_10: # else
.annotate 'line', 637
    concat $S2, $S2, $S1
 __label_11: # endif
# }
    goto __label_8
 __label_7: # endwhile
.annotate 'line', 639
    if_null $P3, __label_12
    unless $P3 goto __label_12
.annotate 'line', 640
    .tailcall $P3(self, $S2, $I1)
 __label_12: # endif
.annotate 'line', 641
    .tailcall $P7(self, $S2, $I1)
# }
.annotate 'line', 642

.end # get_token


.sub 'get' :method
        .param int __ARG_1 :optional
# Body
# {
.annotate 'line', 645
# var t: $P1
    $P1 = self.'get_token'()
 __label_1: # while
.annotate 'line', 646
    $P2 = $P1.'iseof'()
    isfalse $I1, $P2
    unless $I1 goto __label_3
    not $I1, __ARG_1
 __label_3:
    unless $I1 goto __label_2
    $I1 = $P1.'iscomment'()
 __label_2:
    unless $I1 goto __label_0
.annotate 'line', 647
    $P1 = self.'get_token'()
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 648
    .return($P1)
# }
.annotate 'line', 649

.end # get


.sub 'unget' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 652
    getattribute $P1, self, 'stacked'
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 653

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
.annotate 'line', 674
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
# switch
 __label_2: # case
.annotate 'line', 675
    .return('I')
 __label_3: # case
.annotate 'line', 676
    .return('N')
 __label_4: # case
.annotate 'line', 677
    .return('S')
 __label_5: # case
.annotate 'line', 678
    .return('P')
 __label_1: # default
.annotate 'line', 679
    .return('')
 __label_0: # switch end
# }
.annotate 'line', 681

.end # typetoregcheck


.sub 'typetopirname'
        .param string __ARG_1
# Body
# {
.annotate 'line', 685
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
# switch
 __label_2: # case
.annotate 'line', 686
    .return('int')
 __label_3: # case
.annotate 'line', 687
    .return('num')
 __label_4: # case
.annotate 'line', 688
    .return('string')
 __label_5: # case
.annotate 'line', 689
    .return('pmc')
 __label_1: # default
.annotate 'line', 690
    'InternalError'('Invalid reg type')
 __label_0: # switch end
# }
.annotate 'line', 692

.end # typetopirname

# Constant INDENT evaluated at compile time
.namespace [ 'Emit' ]

.sub 'Emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 711
    setattribute self, 'handle', __ARG_1
.annotate 'line', 712
    box $P1, ''
    setattribute self, 'file', $P1
.annotate 'line', 713
    box $P1, 0
    setattribute self, 'line', $P1
.annotate 'line', 714
    box $P1, 0
    setattribute self, 'pendingf', $P1
.annotate 'line', 715
    box $P1, 0
    setattribute self, 'pendingl', $P1
# }
.annotate 'line', 716

.end # Emit


.sub 'disable_annotations' :method
# Body
# {
.annotate 'line', 719
    box $P1, 1
    setattribute self, 'noan', $P1
# }
.annotate 'line', 720

.end # disable_annotations


.sub 'close' :method
# Body
# {
.annotate 'line', 723
    null $P1
    setattribute self, 'handle', $P1
# }
.annotate 'line', 724

.end # close


.sub 'updateannot' :method
# Body
# {
.annotate 'line', 727
    getattribute $P1, self, 'pendingf'
    if_null $P1, __label_0
    unless $P1 goto __label_0
# {
.annotate 'line', 728
    getattribute $P2, self, 'handle'
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, ".annotate 'file', '"
    push $P3, $P4
.annotate 'line', 730
    getattribute $P5, self, 'file'
.annotate 'line', 728
    push $P3, $P5
    box $P4, "'\n"
    push $P3, $P4
# predefined join
    join $S1, "", $P3
    $P2.'print'($S1)
.annotate 'line', 733
    getattribute $P1, self, 'pendingf'
    assign $P1, 0
# }
 __label_0: # endif
.annotate 'line', 735
    getattribute $P1, self, 'pendingl'
    if_null $P1, __label_1
    unless $P1 goto __label_1
# {
.annotate 'line', 736
    getattribute $P2, self, 'handle'
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, ".annotate 'line', "
    push $P3, $P4
.annotate 'line', 738
    getattribute $P5, self, 'line'
.annotate 'line', 736
    push $P3, $P5
    box $P4, "\n"
    push $P3, $P4
# predefined join
    join $S1, "", $P3
    $P2.'print'($S1)
.annotate 'line', 741
    getattribute $P1, self, 'pendingl'
    assign $P1, 0
# }
 __label_1: # endif
# }
.annotate 'line', 743

.end # updateannot


.sub 'vprint' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 746
    iter $P2, __ARG_1
    set $P2, 0
 __label_0: # for iteration
    unless $P2 goto __label_1
    shift $P1, $P2
.annotate 'line', 747
    getattribute $P3, self, 'handle'
    $P3.'print'($P1)
    goto __label_0
 __label_1: # endfor
# }
.annotate 'line', 748

.end # vprint


.sub 'print' :method
        .param pmc __ARG_1 :slurpy
# Body
# {
.annotate 'line', 751
    self.'updateannot'()
.annotate 'line', 752
    self.'vprint'(__ARG_1)
# }
.annotate 'line', 753

.end # print


.sub 'say' :method
        .param pmc __ARG_1 :slurpy
# Body
# {
.annotate 'line', 756
    self.'updateannot'()
.annotate 'line', 757
    self.'vprint'(__ARG_1)
.annotate 'line', 758
    getattribute $P1, self, 'handle'
    $P1.'print'("\n")
# }
.annotate 'line', 759

.end # say


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 762
    getattribute $P3, self, 'noan'
    unless_null $P3, __label_0
# {
.annotate 'line', 764
# var file: $P1
    getattribute $P1, self, 'file'
.annotate 'line', 765
# var line: $P2
    getattribute $P2, self, 'line'
.annotate 'line', 766
# tfile: $S1
    getattribute $P3, __ARG_1, 'file'
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
 __label_1:
.annotate 'line', 767
# tline: $I1
    getattribute $P3, __ARG_1, 'line'
    set $I1, $P3
.annotate 'line', 768
    set $S2, $P1
    eq $S2, $S1, __label_2
# {
.annotate 'line', 769
    assign $P1, $S1
.annotate 'line', 770
    getattribute $P3, self, 'pendingf'
    assign $P3, 1
.annotate 'line', 771
    assign $P2, 0
# }
 __label_2: # endif
.annotate 'line', 773
    set $I2, $P2
    eq $I2, $I1, __label_3
# {
.annotate 'line', 774
    assign $P2, $I1
.annotate 'line', 775
    getattribute $P3, self, 'pendingl'
    assign $P3, 1
# }
 __label_3: # endif
# }
 __label_0: # endif
# }
.annotate 'line', 778

.end # annotate


.sub 'comment' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 781
    self.'updateannot'()
.annotate 'line', 782
    getattribute $P1, self, 'handle'
    concat $S1, '# ', __ARG_1
    concat $S1, $S1, "\n"
    $P1.'print'($S1)
# }
.annotate 'line', 783

.end # comment


.sub 'emitlabel' :method
        .param string __ARG_1
        .param string __ARG_2 :optional
# Body
# {
.annotate 'line', 786
# var handle: $P1
    getattribute $P1, self, 'handle'
.annotate 'line', 787
    $P1.'print'(' ')
.annotate 'line', 788
    $P1.'print'(__ARG_1)
.annotate 'line', 789
    $P1.'print'(':')
.annotate 'line', 790
    if_null __ARG_2, __label_0
# {
.annotate 'line', 791
    concat $S1, ' # ', __ARG_2
    $P1.'print'($S1)
# }
 __label_0: # endif
.annotate 'line', 793
    $P1.'print'("\n")
# }
.annotate 'line', 794

.end # emitlabel


.sub 'emitgoto' :method
        .param string __ARG_1
        .param string __ARG_2 :optional
# Body
# {
.annotate 'line', 797
# var handle: $P1
    getattribute $P1, self, 'handle'
.annotate 'line', 798
    $P1.'print'('    goto ')
.annotate 'line', 799
    $P1.'print'(__ARG_1)
.annotate 'line', 800
    if_null __ARG_2, __label_0
# {
.annotate 'line', 801
    $P1.'print'(' # ')
.annotate 'line', 802
    $P1.'print'(__ARG_2)
# }
 __label_0: # endif
.annotate 'line', 804
    $P1.'print'("\n")
# }
.annotate 'line', 805

.end # emitgoto


.sub 'emitarg1' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 809
    concat $S1, '    ', __ARG_1
    concat $S1, $S1, ' '
    concat $S1, $S1, __ARG_2
    self.'say'($S1)
# }
.annotate 'line', 810

.end # emitarg1


.sub 'emitarg2' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 813
    concat $S1, '    ', __ARG_1
    concat $S1, $S1, ' '
    concat $S1, $S1, __ARG_2
    concat $S1, $S1, ', '
    concat $S1, $S1, __ARG_3
    self.'say'($S1)
# }
.annotate 'line', 814

.end # emitarg2


.sub 'emitcompare' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 817
    concat $S1, '    ', __ARG_1
    concat $S1, $S1, ' '
    concat $S1, $S1, __ARG_2
    concat $S1, $S1, ', '
    concat $S1, $S1, __ARG_3
    concat $S1, $S1, ', '
    concat $S1, $S1, __ARG_4
    self.'say'($S1)
# }
.annotate 'line', 818

.end # emitcompare


.sub 'emitif' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 821
    self.'say'('    if ', __ARG_1, ' goto ', __ARG_2)
# }
.annotate 'line', 822

.end # emitif


.sub 'emitunless' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 825
    self.'say'('    unless ', __ARG_1, ' goto ', __ARG_2)
# }
.annotate 'line', 826

.end # emitunless


.sub 'emitif_null' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 829
    self.'say'('    if_null ', __ARG_1, ', ', __ARG_2)
# }
.annotate 'line', 830

.end # emitif_null


.sub 'emitnull' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 833
    self.'say'("    null ", __ARG_1)
# }
.annotate 'line', 834

.end # emitnull


.sub 'emitinc' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 838
    self.'say'('    inc ', __ARG_1)
# }
.annotate 'line', 839

.end # emitinc


.sub 'emitdec' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 842
    self.'say'('    dec ', __ARG_1)
# }
.annotate 'line', 843

.end # emitdec


.sub 'emitset' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 846
    self.'say'("    set ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 847

.end # emitset


.sub 'emitassign' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 850
    self.'say'("    assign ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 851

.end # emitassign


.sub 'emitbox' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 854
    self.'say'("    box ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 855

.end # emitbox


.sub 'emitunbox' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 858
    self.'say'("    unbox ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 859

.end # emitunbox


.sub 'emitbinop' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 862
    self.'say'('    ', __ARG_1, " ", __ARG_2, ", ", __ARG_3, ", ", __ARG_4)
# }
.annotate 'line', 863

.end # emitbinop


.sub 'emitaddto' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 866
    self.'say'("    add ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 867

.end # emitaddto


.sub 'emitsubto' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 870
    self.'say'("    sub ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 871

.end # emitsubto


.sub 'emitadd' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 874
    self.'say'("    add ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 875

.end # emitadd


.sub 'emitsub' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 878
    self.'say'("    sub ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 879

.end # emitsub


.sub 'emitmul' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 882
    self.'say'("    mul ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 883

.end # emitmul


.sub 'emitdiv' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 886
    self.'say'("    div ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 887

.end # emitdiv


.sub 'emitconcat1' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 890
    self.'say'("    concat ", __ARG_1, ", ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 891

.end # emitconcat1


.sub 'emitconcat' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 894
    self.'say'("    concat ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 895

.end # emitconcat


.sub 'emitrepeat' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 898
    self.'say'("    repeat ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 899

.end # emitrepeat


.sub 'emitprint' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 902
    self.'say'('    print ', __ARG_1)
# }
.annotate 'line', 903

.end # emitprint


.sub 'emitsay' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 906
    self.'say'('    say ', __ARG_1)
# }
.annotate 'line', 907

.end # emitsay


.sub 'emitfind_lex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 910
    concat $S1, "    find_lex ", __ARG_1
    concat $S1, $S1, ", '"
    concat $S1, $S1, __ARG_2
    concat $S1, $S1, "'"
    self.'say'($S1)
# }
.annotate 'line', 911

.end # emitfind_lex

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Emit' ]
.annotate 'line', 702
    addattribute $P0, 'handle'
.annotate 'line', 703
    addattribute $P0, 'file'
.annotate 'line', 704
    addattribute $P0, 'line'
.annotate 'line', 705
    addattribute $P0, 'pendingf'
.annotate 'line', 706
    addattribute $P0, 'pendingl'
.annotate 'line', 707
    addattribute $P0, 'noan'
.end
.namespace [ ]

.sub 'integerValue'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 920
    new $P2, [ 'IntegerLiteral' ]
    $P2.'IntegerLiteral'(__ARG_1, __ARG_2, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 921

.end # integerValue


.sub 'floatValue'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param num __ARG_3
# Body
# {
.annotate 'line', 925
# var t: $P1
    new $P1, [ 'TokenFloat' ]
    getattribute $P2, __ARG_2, 'file'
    getattribute $P3, __ARG_2, 'line'
    $P1.'TokenFloat'($P2, $P3, __ARG_3)
.annotate 'line', 926
    new $P3, [ 'FloatLiteral' ]
    $P3.'FloatLiteral'(__ARG_1, $P1)
    set $P2, $P3
    .return($P2)
# }
.annotate 'line', 927

.end # floatValue


.sub 'floatresult'
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 935
# result: $I1
    iseq $I1, __ARG_1, 'N'
    unless $I1 goto __label_1
    iseq $I1, __ARG_2, 'N'
    if $I1 goto __label_2
    iseq $I1, __ARG_2, 'I'
 __label_2:
 __label_1:
    if $I1 goto __label_0
.annotate 'line', 936
    iseq $I1, __ARG_2, 'N'
    unless $I1 goto __label_3
    iseq $I1, __ARG_1, 'N'
    if $I1 goto __label_4
    iseq $I1, __ARG_1, 'I'
 __label_4:
 __label_3:
 __label_0:
.annotate 'line', 937
    .return($I1)
# }
.annotate 'line', 938

.end # floatresult

# Constant NULL evaluated at compile time
# Constant SELF evaluated at compile time
# Constant VAR_is_volatile evaluated at compile time
# Constant VAR_is_lexical evaluated at compile time
# Constant VAR_is_extern evaluated at compile time
# Constant PREDEF_arglist evaluated at compile time
# Constant PREDEF_raw1 evaluated at compile time
.namespace [ 'Predef_frombody' ]

.sub 'Predef_frombody' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 963
# pos: $I1
# predefined indexof
    index $I1, __ARG_2, '%0'
.annotate 'line', 964
    iseq $I3, __ARG_1, 'v'
    unless $I3 goto __label_1
    isne $I3, $I1, -1
 __label_1:
    unless $I3 goto __label_0
.annotate 'line', 965
    'InternalError'('void predef with %0')
 __label_0: # endif
.annotate 'line', 966
    isne $I3, __ARG_1, 'v'
    unless $I3 goto __label_3
    iseq $I3, $I1, -1
 __label_3:
    unless $I3 goto __label_2
.annotate 'line', 967
    'InternalError'('non void predef without %0')
 __label_2: # endif
.annotate 'line', 970
# l: $I2
# predefined length
    length $I3, __ARG_2
    sub $I2, $I3, 1
.annotate 'line', 971
# predefined substr
    substr $S1, __ARG_2, $I2, 1
    ne $S1, "\n", __label_4
.annotate 'line', 972
# predefined substr
    substr __ARG_2, __ARG_2, 0, $I2
 __label_4: # endif
.annotate 'line', 973
# predefined split
    split $P1, "\n", __ARG_2
# predefined join
    join $S1, "\n    ", $P1
    concat $S0, '    ', $S1
    set __ARG_2, $S0
.annotate 'line', 974
    box $P1, __ARG_2
    setattribute self, 'body', $P1
.annotate 'line', 975
    box $P1, __ARG_1
    setattribute self, 'typeresult', $P1
# }
.annotate 'line', 976

.end # Predef_frombody


.sub 'invoke' :method :vtable
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 979
# typeresult: $S1
    getattribute $P2, self, 'typeresult'
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 981
    ne $S1, 'v', __label_1
# {
.annotate 'line', 982
    isnull $I1, __ARG_3
    not $I1
    unless $I1 goto __label_4
    isne $I1, __ARG_3, ''
 __label_4:
    unless $I1 goto __label_3
.annotate 'line', 983
    'SyntaxError'('using return value from void predef')
 __label_3: # endif
# }
    goto __label_2
 __label_1: # else
# {
.annotate 'line', 986
    isnull $I1, __ARG_3
    if $I1 goto __label_6
    iseq $I1, __ARG_3, ''
 __label_6:
    unless $I1 goto __label_5
.annotate 'line', 987
    'InternalError'('Bad result in non void predef')
 __label_5: # endif
# }
 __label_2: # endif
.annotate 'line', 990
# var builder: $P1
    new $P1, [ 'StringBuilder' ]
.annotate 'line', 991
    getattribute $P2, self, 'body'
.annotate 'line', 992
    $P3 = __ARG_4[0]
    $P4 = __ARG_4[1]
    $P5 = __ARG_4[2]
    $P6 = __ARG_4[3]
.annotate 'line', 991
    $P1.'append_format'($P2, __ARG_3, $P3, $P4, $P5, $P6)
.annotate 'line', 993
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 994
# predefined string
    set $S2, $P1
    __ARG_1.'say'($S2)
# }
.annotate 'line', 995

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
.annotate 'line', 1016
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 1017
    isa $I2, __ARG_2, 'String'
    unless $I2 goto __label_0
.annotate 'line', 1018
    new $P3, [ 'Predef_frombody' ]
    $P3.'Predef_frombody'(__ARG_3, __ARG_2)
    set $P2, $P3
    setattribute self, 'body', $P2
    goto __label_1
 __label_0: # else
.annotate 'line', 1020
    setattribute self, 'body', __ARG_2
 __label_1: # endif
.annotate 'line', 1021
    box $P1, __ARG_3
    setattribute self, 'typeresult', $P1
.annotate 'line', 1022
# n: $I1
    null $I1
.annotate 'line', 1023
    if_null __ARG_4, __label_2
# {
.annotate 'line', 1024
    box $P1, __ARG_4
    setattribute self, 'type0', $P1
.annotate 'line', 1025
    set $S1, __ARG_4
    set $S2, '*'
    if $S1 == $S2 goto __label_5
    set $S2, '!'
    if $S1 == $S2 goto __label_6
    goto __label_4
# switch
 __label_5: # case
.annotate 'line', 1027
    set $I1, -1
    goto __label_3 # break
 __label_6: # case
.annotate 'line', 1030
    set $I1, -2
.annotate 'line', 1031
    if_null __ARG_5, __label_7
.annotate 'line', 1032
    concat $S3, "Invalid predef '", __ARG_1
    concat $S3, $S3, '"'
    'InternalError'($S3)
 __label_7: # endif
    goto __label_3 # break
 __label_4: # default
.annotate 'line', 1035
    set $I1, 1
.annotate 'line', 1036
    if_null __ARG_5, __label_8
# {
.annotate 'line', 1037
    box $P1, __ARG_5
    setattribute self, 'type1', $P1
.annotate 'line', 1038
    inc $I1
# }
 __label_8: # endif
.annotate 'line', 1040
    if_null __ARG_6, __label_9
# {
.annotate 'line', 1041
    box $P1, __ARG_6
    setattribute self, 'type2', $P1
.annotate 'line', 1042
    inc $I1
# }
 __label_9: # endif
.annotate 'line', 1044
    if_null __ARG_7, __label_10
# {
.annotate 'line', 1045
    box $P1, __ARG_7
    setattribute self, 'type3', $P1
.annotate 'line', 1046
    inc $I1
# }
 __label_10: # endif
 __label_3: # switch end
# }
 __label_2: # endif
.annotate 'line', 1050
    box $P1, $I1
    setattribute self, 'nparams', $P1
# }
.annotate 'line', 1051

.end # PredefBase


.sub 'name' :method
# Body
# {
.annotate 'line', 1054
# name: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 1055
    .return($S1)
# }
.annotate 'line', 1056

.end # name


.sub 'result' :method
# Body
# {
.annotate 'line', 1059
    getattribute $P1, self, 'typeresult'
    .return($P1)
# }
.annotate 'line', 1060

.end # result


.sub 'params' :method
# Body
# {
.annotate 'line', 1061
    getattribute $P1, self, 'nparams'
    .return($P1)
# }

.end # params


.sub 'paramtype' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 1064
# type: $S1
    null $S1
.annotate 'line', 1065
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
# switch
 __label_2: # case
.annotate 'line', 1066
    getattribute $P1, self, 'type0'
    set $S1, $P1
    goto __label_0 # break
 __label_3: # case
.annotate 'line', 1067
    getattribute $P2, self, 'type1'
    set $S1, $P2
    goto __label_0 # break
 __label_4: # case
.annotate 'line', 1068
    getattribute $P3, self, 'type2'
    set $S1, $P3
    goto __label_0 # break
 __label_5: # case
.annotate 'line', 1069
    getattribute $P4, self, 'type3'
    set $S1, $P4
    goto __label_0 # break
 __label_1: # default
.annotate 'line', 1071
    'InternalError'('Invalid predef arg')
 __label_0: # switch end
.annotate 'line', 1073
    .return($S1)
# }
.annotate 'line', 1074

.end # paramtype


.sub 'expand' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 1077
# predefined string
    getattribute $P2, self, 'name'
    set $S2, $P2
    concat $S3, 'predefined ', $S2
    __ARG_1.'comment'($S3)
.annotate 'line', 1078
# typeresult: $S1
    getattribute $P2, self, 'typeresult'
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 1079
    isne $I1, $S1, 'v'
    unless $I1 goto __label_2
    iseq $I1, __ARG_4, ''
 __label_2:
    unless $I1 goto __label_1
.annotate 'line', 1080
    $P2 = __ARG_2.'tempreg'($S1)
    set __ARG_4, $P2
 __label_1: # endif
.annotate 'line', 1081
# var fun: $P1
    getattribute $P1, self, 'body'
.annotate 'line', 1082
    $P1(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
# }
.annotate 'line', 1083

.end # expand

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'PredefBase' ]
.annotate 'line', 1000
    addattribute $P0, 'name'
.annotate 'line', 1001
    addattribute $P0, 'body'
.annotate 'line', 1002
    addattribute $P0, 'typeresult'
.annotate 'line', 1003
    addattribute $P0, 'type0'
.annotate 'line', 1004
    addattribute $P0, 'type1'
.annotate 'line', 1005
    addattribute $P0, 'type2'
.annotate 'line', 1006
    addattribute $P0, 'type3'
.annotate 'line', 1007
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
.annotate 'line', 1095
    self.'PredefBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7)
# }
.annotate 'line', 1096

.end # PredefFunction

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'PredefFunction' ]
.annotate 'line', 1086
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
.annotate 'line', 1109
    self.'PredefBase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7, __ARG_8)
.annotate 'line', 1110
    setattribute self, 'evalfun', __ARG_2
# }
.annotate 'line', 1111

.end # PredefFunctionEval

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'PredefFunctionEval' ]
.annotate 'line', 1099
    get_class $P1, [ 'PredefBase' ]
    addparent $P0, $P1
.annotate 'line', 1101
    addattribute $P0, 'evalfun'
.end
.namespace [ 'Predef_typecast' ]

.sub 'Predef_typecast' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1119
    box $P1, __ARG_1
    setattribute self, 'type', $P1
# }
.annotate 'line', 1120

.end # Predef_typecast


.sub 'invoke' :method :vtable
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 1123
# type: $S1
    getattribute $P2, self, 'type'
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 1124
# predefined elements
    elements $I1, __ARG_4
    eq $I1, 1, __label_1
.annotate 'line', 1125
    'InternalError'("Invalid Predef_typecast.invoke call")
 __label_1: # endif
.annotate 'line', 1126
# var rawarg: $P1
    $P1 = __ARG_4[0]
.annotate 'line', 1127
# argtype: $S2
    $P2 = $P1.'checkresult'()
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
 __label_2:
.annotate 'line', 1128
    iseq $I1, $S2, $S1
    if $I1 goto __label_5
    isa $I1, $P1, [ 'IndexExpr' ]
 __label_5:
    unless $I1 goto __label_3
.annotate 'line', 1129
    $P1.'emit'(__ARG_1, __ARG_3)
    goto __label_4
 __label_3: # else
# {
.annotate 'line', 1131
# arg: $S3
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P2, __label_6
    set $S3, $P2
 __label_6:
.annotate 'line', 1132
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1134
    ne $S3, 'null', __label_7
.annotate 'line', 1135
    __ARG_1.'emitnull'(__ARG_3)
    goto __label_8
 __label_7: # else
.annotate 'line', 1137
    __ARG_1.'emitset'(__ARG_3, $S3)
 __label_8: # endif
# }
 __label_4: # endif
# }
.annotate 'line', 1139

.end # invoke

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Predef_typecast' ]
.annotate 'line', 1116
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
.annotate 'line', 1144
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1145
# n: $I1
# predefined elements
    elements $I3, __ARG_4
    sub $I1, $I3, 1
.annotate 'line', 1146
    lt $I1, 0, __label_0
# {
# for loop
.annotate 'line', 1147
# i: $I2
    null $I2
 __label_4: # for condition
    ge $I2, $I1, __label_3
.annotate 'line', 1148
    $P1 = __ARG_4[$I2]
    __ARG_1.'emitprint'($P1)
 __label_2: # for iteration
.annotate 'line', 1147
    inc $I2
    goto __label_4
 __label_3: # for end
.annotate 'line', 1149
    $P1 = __ARG_4[$I1]
    __ARG_1.'emitsay'($P1)
# }
    goto __label_1
 __label_0: # else
.annotate 'line', 1152
    __ARG_1.'emitsay'("''")
 __label_1: # endif
# }
.annotate 'line', 1153

.end # Predef_say


.sub 'Predef_cry'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 1157
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1158
    __ARG_1.'say'('    ', "getstderr $P0")
.annotate 'line', 1159
# n: $I1
# predefined elements
    elements $I1, __ARG_4
# for loop
.annotate 'line', 1160
# i: $I2
    null $I2
 __label_2: # for condition
    ge $I2, $I1, __label_1
.annotate 'line', 1161
    $P1 = __ARG_4[$I2]
    __ARG_1.'say'('    ', "print $P0, ", $P1)
 __label_0: # for iteration
.annotate 'line', 1160
    inc $I2
    goto __label_2
 __label_1: # for end
.annotate 'line', 1162
    __ARG_1.'say'('    ', "print $P0, \"\\n\"")
# }
.annotate 'line', 1163

.end # Predef_cry


.sub 'Predef_print'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 1167
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1168
# n: $I1
# predefined elements
    elements $I1, __ARG_4
# for loop
.annotate 'line', 1169
# i: $I2
    null $I2
 __label_2: # for condition
    ge $I2, $I1, __label_1
.annotate 'line', 1170
    $P1 = __ARG_4[$I2]
    __ARG_1.'emitprint'($P1)
 __label_0: # for iteration
.annotate 'line', 1169
    inc $I2
    goto __label_2
 __label_1: # for end
# }
.annotate 'line', 1171

.end # Predef_print


.sub 'Predef_invoke'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 1177
# var arg: $P1
    $P1 = __ARG_4[0]
.annotate 'line', 1178
    isa $I2, $P1, [ 'CallExpr' ]
    not $I1, $I2
    unless $I1 goto __label_0
.annotate 'line', 1179
    'SyntaxError'("invoke argument must be callable", __ARG_2)
 __label_0: # endif
.annotate 'line', 1180
    concat $S1, "(", __ARG_3
    concat $S1, $S1, " :call_sig)"
    $P1.'emit'(__ARG_1, $S1)
# }
.annotate 'line', 1181

.end # Predef_invoke


.sub 'predefeval_length' :subid('WSubId_1')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1185
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1186
# s: $S1
    $P2 = $P1.'get_value'()
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 1187
# predefined length
    length $I1, $S1
    .tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1188

.end # predefeval_length


.sub 'predefeval_bytelength' :subid('WSubId_2')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1192
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1193
# s: $S1
    $P2 = $P1.'get_value'()
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 1194
# predefined bytelength
    bytelength $I1, $S1
    .tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1195

.end # predefeval_bytelength


.sub 'predefeval_ord' :subid('WSubId_4')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1199
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1200
# s: $S1
    $P2 = $P1.'get_value'()
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 1201
# predefined ord
    ord $I1, $S1
    .tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1202

.end # predefeval_ord


.sub 'predefeval_ord_n' :subid('WSubId_5')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1206
# var arg: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1207
# s: $S1
    $P3 = $P1.'get_value'()
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 1208
# var argn: $P2
    $P3 = __ARG_3[1]
    getattribute $P2, $P3, 'arg'
.annotate 'line', 1209
# n: $I1
    getattribute $P3, $P2, 'numval'
    set $I1, $P3
.annotate 'line', 1210
# predefined ord
    ord $I2, $S1, $I1
    .tailcall 'integerValue'(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 1211

.end # predefeval_ord_n


.sub 'predefeval_chr' :subid('WSubId_3')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1215
# var arg: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1217
# n: $I1
    getattribute $P3, $P1, 'numval'
    set $I1, $P3
.annotate 'line', 1218
# s: $S1
# predefined chr
    chr $S0, $I1
    find_encoding $I0, 'utf8'
    trans_encoding $S1, $S0, $I0
.annotate 'line', 1220
# var t: $P2
    new $P2, [ 'TokenQuoted' ]
    getattribute $P3, __ARG_2, 'file'
    getattribute $P4, __ARG_2, 'line'
    $P2.'TokenQuoted'($P3, $P4, $S1)
.annotate 'line', 1221
    new $P4, [ 'StringLiteral' ]
    $P4.'StringLiteral'(__ARG_1, $P2)
    set $P3, $P4
    .return($P3)
# }
.annotate 'line', 1222

.end # predefeval_chr


.sub 'predefeval_substr' :subid('WSubId_6')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1226
# var argstr: $P1
    $P4 = __ARG_3[0]
    getattribute $P1, $P4, 'arg'
.annotate 'line', 1227
# var argpos: $P2
    $P4 = __ARG_3[1]
    getattribute $P2, $P4, 'arg'
.annotate 'line', 1228
# str: $S1
    $P4 = $P1.'get_value'()
    null $S1
    if_null $P4, __label_0
    set $S1, $P4
 __label_0:
.annotate 'line', 1229
# pos: $I1
    getattribute $P4, $P2, 'numval'
    set $I1, $P4
.annotate 'line', 1231
# var t: $P3
    new $P3, [ 'TokenQuoted' ]
    getattribute $P4, __ARG_2, 'file'
    getattribute $P5, __ARG_2, 'line'
# predefined substr
    substr $S2, $S1, $I1
    $P3.'TokenQuoted'($P4, $P5, $S2)
.annotate 'line', 1232
    new $P5, [ 'StringLiteral' ]
    $P5.'StringLiteral'(__ARG_1, $P3)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 1233

.end # predefeval_substr


.sub 'predefeval_substr_l' :subid('WSubId_7')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1237
# var argstr: $P1
    $P5 = __ARG_3[0]
    getattribute $P1, $P5, 'arg'
.annotate 'line', 1238
# var argpos: $P2
    $P5 = __ARG_3[1]
    getattribute $P2, $P5, 'arg'
.annotate 'line', 1239
# var arglen: $P3
    $P5 = __ARG_3[2]
    getattribute $P3, $P5, 'arg'
.annotate 'line', 1240
# str: $S1
    $P5 = $P1.'get_value'()
    null $S1
    if_null $P5, __label_0
    set $S1, $P5
 __label_0:
.annotate 'line', 1241
# pos: $I1
    getattribute $P5, $P2, 'numval'
    set $I1, $P5
.annotate 'line', 1242
# len: $I2
    getattribute $P5, $P3, 'numval'
    set $I2, $P5
.annotate 'line', 1244
# var t: $P4
    new $P4, [ 'TokenQuoted' ]
    getattribute $P5, __ARG_2, 'file'
    getattribute $P6, __ARG_2, 'line'
# predefined substr
    substr $S2, $S1, $I1, $I2
    $P4.'TokenQuoted'($P5, $P6, $S2)
.annotate 'line', 1245
    new $P6, [ 'StringLiteral' ]
    $P6.'StringLiteral'(__ARG_1, $P4)
    set $P5, $P6
    .return($P5)
# }
.annotate 'line', 1246

.end # predefeval_substr_l


.sub 'predefeval_indexof' :subid('WSubId_8')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1250
# var argstrfrom: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1251
# var argstrsearch: $P2
    $P3 = __ARG_3[1]
    getattribute $P2, $P3, 'arg'
.annotate 'line', 1252
# strfrom: $S1
    $P3 = $P1.'get_value'()
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 1253
# strsearch: $S2
    $P3 = $P2.'get_value'()
    null $S2
    if_null $P3, __label_1
    set $S2, $P3
 __label_1:
.annotate 'line', 1254
# predefined indexof
    index $I1, $S1, $S2
    .tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1255

.end # predefeval_indexof


.sub 'predefeval_indexof_pos' :subid('WSubId_9')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1259
# var argstrfrom: $P1
    $P4 = __ARG_3[0]
    getattribute $P1, $P4, 'arg'
.annotate 'line', 1260
# var argstrsearch: $P2
    $P4 = __ARG_3[1]
    getattribute $P2, $P4, 'arg'
.annotate 'line', 1261
# var argpos: $P3
    $P4 = __ARG_3[2]
    getattribute $P3, $P4, 'arg'
.annotate 'line', 1262
# strfrom: $S1
    $P4 = $P1.'get_value'()
    null $S1
    if_null $P4, __label_0
    set $S1, $P4
 __label_0:
.annotate 'line', 1263
# strsearch: $S2
    $P4 = $P2.'get_value'()
    null $S2
    if_null $P4, __label_1
    set $S2, $P4
 __label_1:
.annotate 'line', 1264
# pos: $I1
    getattribute $P4, $P3, 'numval'
    set $I1, $P4
.annotate 'line', 1265
# predefined indexof
    index $I2, $S1, $S2, $I1
    .tailcall 'integerValue'(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 1266

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
.annotate 'line', 1279
.const 'Sub' $P11 = 'Predef_print'
.annotate 'line', 1280
.const 'Sub' $P12 = 'Predef_say'
.annotate 'line', 1281
.const 'Sub' $P13 = 'Predef_cry'
.annotate 'line', 1282
.const 'Sub' $P14 = 'Predef_invoke'
.annotate 'line', 1284
# var predefs: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1285
    new $P17, [ 'PredefFunction' ]
.annotate 'line', 1286
    new $P19, [ 'Predef_typecast' ]
    $P19.'Predef_typecast'('I')
    set $P18, $P19
    $P17.'PredefFunction'('int', $P18, 'I', '!')
    set $P16, $P17
.annotate 'line', 1284
    push $P1, $P16
.annotate 'line', 1289
    new $P21, [ 'PredefFunction' ]
.annotate 'line', 1290
    new $P23, [ 'Predef_typecast' ]
    $P23.'Predef_typecast'('N')
    set $P22, $P23
    $P21.'PredefFunction'('float', $P22, 'N', '!')
    set $P20, $P21
.annotate 'line', 1284
    push $P1, $P20
.annotate 'line', 1293
    new $P25, [ 'PredefFunction' ]
.annotate 'line', 1294
    new $P27, [ 'Predef_typecast' ]
    $P27.'Predef_typecast'('S')
    set $P26, $P27
    $P25.'PredefFunction'('string', $P26, 'S', '!')
    set $P24, $P25
.annotate 'line', 1284
    push $P1, $P24
.annotate 'line', 1297
    new $P29, [ 'PredefFunction' ]
    $P29.'PredefFunction'('die', 'die %1', 'v', 'S')
    set $P28, $P29
.annotate 'line', 1284
    push $P1, $P28
.annotate 'line', 1301
    new $P31, [ 'PredefFunction' ]
    $P31.'PredefFunction'('exit', 'exit %1', 'v', 'I')
    set $P30, $P31
.annotate 'line', 1284
    push $P1, $P30
.annotate 'line', 1305
    new $P33, [ 'PredefFunction' ]
    $P33.'PredefFunction'('time', 'time %0', 'I')
    set $P32, $P33
.annotate 'line', 1284
    push $P1, $P32
.annotate 'line', 1309
    new $P35, [ 'PredefFunction' ]
    $P35.'PredefFunction'('floattime', 'time %0', 'N')
    set $P34, $P35
.annotate 'line', 1284
    push $P1, $P34
.annotate 'line', 1313
    new $P37, [ 'PredefFunction' ]
    $P37.'PredefFunction'('spawnw', 'spawnw %0, %1', 'I', 'P')
    set $P36, $P37
.annotate 'line', 1284
    push $P1, $P36
.annotate 'line', 1317
    new $P39, [ 'PredefFunction' ]
    $P39.'PredefFunction'('getstdin', 'getstdin %0', 'P')
    set $P38, $P39
.annotate 'line', 1284
    push $P1, $P38
.annotate 'line', 1321
    new $P41, [ 'PredefFunction' ]
    $P41.'PredefFunction'('getstdout', 'getstdout %0', 'P')
    set $P40, $P41
.annotate 'line', 1284
    push $P1, $P40
.annotate 'line', 1325
    new $P43, [ 'PredefFunction' ]
    $P43.'PredefFunction'('getstderr', 'getstderr %0', 'P')
    set $P42, $P43
.annotate 'line', 1284
    push $P1, $P42
.annotate 'line', 1329
    new $P45, [ 'PredefFunction' ]
    $P45.'PredefFunction'('open', "root_new %0, ['parrot';'FileHandle']\n%0.'open'(%1)\n", 'P', 'S')
    set $P44, $P45
.annotate 'line', 1284
    push $P1, $P44
.annotate 'line', 1336
    new $P47, [ 'PredefFunction' ]
    $P47.'PredefFunction'('open', "root_new %0, ['parrot';'FileHandle']\n%0.'open'(%1,%2)\n", 'P', 'S', 'S')
    set $P46, $P47
.annotate 'line', 1284
    push $P1, $P46
.annotate 'line', 1343
    new $P49, [ 'PredefFunction' ]
    $P49.'PredefFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n", 'P', 'S')
    set $P48, $P49
.annotate 'line', 1284
    push $P1, $P48
.annotate 'line', 1350
    new $P51, [ 'PredefFunction' ]
    $P51.'PredefFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n", 'P', 'S', 'I')
    set $P50, $P51
.annotate 'line', 1284
    push $P1, $P50
.annotate 'line', 1358
    new $P53, [ 'PredefFunction' ]
    $P53.'PredefFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n%0['type'] = %3\n", 'P', 'S', 'I', 'I')
    set $P52, $P53
.annotate 'line', 1284
    push $P1, $P52
.annotate 'line', 1367
    new $P55, [ 'PredefFunction' ]
    $P55.'PredefFunction'('elements', 'elements %0, %1', 'I', 'P')
    set $P54, $P55
.annotate 'line', 1284
    push $P1, $P54
.annotate 'line', 1371
    new $P57, [ 'PredefFunctionEval' ]
.annotate 'line', 1372
    $P57.'PredefFunctionEval'('length', $P2, 'length %0, %1', 'I', 'S')
    set $P56, $P57
.annotate 'line', 1284
    push $P1, $P56
.annotate 'line', 1376
    new $P59, [ 'PredefFunctionEval' ]
.annotate 'line', 1377
    $P59.'PredefFunctionEval'('bytelength', $P3, 'bytelength %0, %1', 'I', 'S')
    set $P58, $P59
.annotate 'line', 1284
    push $P1, $P58
.annotate 'line', 1381
    new $P61, [ 'PredefFunctionEval' ]
.annotate 'line', 1382
    $P61.'PredefFunctionEval'('chr', $P4, "chr $S0, %1\nfind_encoding $I0, 'utf8'\ntrans_encoding %0, $S0, $I0\n", 'S', 'I')
    set $P60, $P61
.annotate 'line', 1284
    push $P1, $P60
.annotate 'line', 1390
    new $P63, [ 'PredefFunctionEval' ]
.annotate 'line', 1391
    $P63.'PredefFunctionEval'('ord', $P5, 'ord %0, %1', 'I', 'S')
    set $P62, $P63
.annotate 'line', 1284
    push $P1, $P62
.annotate 'line', 1395
    new $P65, [ 'PredefFunctionEval' ]
.annotate 'line', 1396
    $P65.'PredefFunctionEval'('ord', $P6, 'ord %0, %1, %2', 'I', 'S', 'I')
    set $P64, $P65
.annotate 'line', 1284
    push $P1, $P64
.annotate 'line', 1400
    new $P67, [ 'PredefFunctionEval' ]
.annotate 'line', 1401
    $P67.'PredefFunctionEval'('substr', $P7, 'substr %0, %1, %2', 'S', 'S', 'I')
    set $P66, $P67
.annotate 'line', 1284
    push $P1, $P66
.annotate 'line', 1405
    new $P69, [ 'PredefFunctionEval' ]
.annotate 'line', 1406
    $P69.'PredefFunctionEval'('substr', $P8, 'substr %0, %1, %2, %3', 'S', 'S', 'I', 'I')
    set $P68, $P69
.annotate 'line', 1284
    push $P1, $P68
.annotate 'line', 1410
    new $P71, [ 'PredefFunction' ]
    $P71.'PredefFunction'('replace', 'replace %0, %1, %2, %3, %4', 'S', 'S', 'I', 'I', 'S')
    set $P70, $P71
.annotate 'line', 1284
    push $P1, $P70
.annotate 'line', 1414
    new $P73, [ 'PredefFunctionEval' ]
.annotate 'line', 1415
    $P73.'PredefFunctionEval'('indexof', $P9, 'index %0, %1, %2', 'I', 'S', 'S')
    set $P72, $P73
.annotate 'line', 1284
    push $P1, $P72
.annotate 'line', 1419
    new $P75, [ 'PredefFunctionEval' ]
.annotate 'line', 1420
    $P75.'PredefFunctionEval'('indexof', $P10, 'index %0, %1, %2, %3', 'I', 'S', 'S', 'I')
    set $P74, $P75
.annotate 'line', 1284
    push $P1, $P74
.annotate 'line', 1424
    new $P77, [ 'PredefFunction' ]
    $P77.'PredefFunction'('join', 'join %0, %1, %2', 'S', 'S', 'P')
    set $P76, $P77
.annotate 'line', 1284
    push $P1, $P76
.annotate 'line', 1428
    new $P79, [ 'PredefFunction' ]
    $P79.'PredefFunction'('upcase', 'upcase %0, %1', 'S', 'S')
    set $P78, $P79
.annotate 'line', 1284
    push $P1, $P78
.annotate 'line', 1432
    new $P81, [ 'PredefFunction' ]
    $P81.'PredefFunction'('downcase', 'downcase %0, %1', 'S', 'S')
    set $P80, $P81
.annotate 'line', 1284
    push $P1, $P80
.annotate 'line', 1436
    new $P83, [ 'PredefFunction' ]
    $P83.'PredefFunction'('titlecase', 'titlecase %0, %1', 'S', 'S')
    set $P82, $P83
.annotate 'line', 1284
    push $P1, $P82
.annotate 'line', 1440
    new $P85, [ 'PredefFunction' ]
    $P85.'PredefFunction'('split', 'split %0, %1, %2', 'P', 'S', 'S')
    set $P84, $P85
.annotate 'line', 1284
    push $P1, $P84
.annotate 'line', 1444
    new $P87, [ 'PredefFunction' ]
    $P87.'PredefFunction'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n%0 = $P0(%1)\n", 'S', 'S')
    set $P86, $P87
.annotate 'line', 1284
    push $P1, $P86
.annotate 'line', 1451
    new $P89, [ 'PredefFunction' ]
    $P89.'PredefFunction'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n%0 = $P0(%1, %2)\n", 'S', 'S', 'S')
    set $P88, $P89
.annotate 'line', 1284
    push $P1, $P88
.annotate 'line', 1458
    new $P91, [ 'PredefFunction' ]
    $P91.'PredefFunction'('push', 'push %1, %2', 'v', 'P', '?')
    set $P90, $P91
.annotate 'line', 1284
    push $P1, $P90
.annotate 'line', 1462
    new $P93, [ 'PredefFunction' ]
    $P93.'PredefFunction'('sqrt', 'sqrt %0, %1', 'N', 'N')
    set $P92, $P93
.annotate 'line', 1284
    push $P1, $P92
.annotate 'line', 1466
    new $P95, [ 'PredefFunction' ]
    $P95.'PredefFunction'('pow', 'pow %0, %1, %2', 'N', 'N', 'N')
    set $P94, $P95
.annotate 'line', 1284
    push $P1, $P94
.annotate 'line', 1470
    new $P97, [ 'PredefFunction' ]
    $P97.'PredefFunction'('exp', 'exp %0, %1', 'N', 'N')
    set $P96, $P97
.annotate 'line', 1284
    push $P1, $P96
.annotate 'line', 1474
    new $P99, [ 'PredefFunction' ]
    $P99.'PredefFunction'('ln', 'ln %0, %1', 'N', 'N')
    set $P98, $P99
.annotate 'line', 1284
    push $P1, $P98
.annotate 'line', 1478
    new $P101, [ 'PredefFunction' ]
    $P101.'PredefFunction'('sin', 'sin %0, %1', 'N', 'N')
    set $P100, $P101
.annotate 'line', 1284
    push $P1, $P100
.annotate 'line', 1482
    new $P103, [ 'PredefFunction' ]
    $P103.'PredefFunction'('cos', 'cos %0, %1', 'N', 'N')
    set $P102, $P103
.annotate 'line', 1284
    push $P1, $P102
.annotate 'line', 1486
    new $P105, [ 'PredefFunction' ]
    $P105.'PredefFunction'('tan', 'tan %0, %1', 'N', 'N')
    set $P104, $P105
.annotate 'line', 1284
    push $P1, $P104
.annotate 'line', 1490
    new $P107, [ 'PredefFunction' ]
    $P107.'PredefFunction'('asin', 'asin %0, %1', 'N', 'N')
    set $P106, $P107
.annotate 'line', 1284
    push $P1, $P106
.annotate 'line', 1494
    new $P109, [ 'PredefFunction' ]
    $P109.'PredefFunction'('acos', 'acos %0, %1', 'N', 'N')
    set $P108, $P109
.annotate 'line', 1284
    push $P1, $P108
.annotate 'line', 1498
    new $P111, [ 'PredefFunction' ]
    $P111.'PredefFunction'('atan', 'atan %0, %1', 'N', 'N')
    set $P110, $P111
.annotate 'line', 1284
    push $P1, $P110
.annotate 'line', 1502
    new $P113, [ 'PredefFunction' ]
    $P113.'PredefFunction'('atan', 'atan %0, %1, %2', 'N', 'N', 'N')
    set $P112, $P113
.annotate 'line', 1284
    push $P1, $P112
.annotate 'line', 1506
    new $P115, [ 'PredefFunction' ]
    $P115.'PredefFunction'('getinterp', 'getinterp %0', 'P')
    set $P114, $P115
.annotate 'line', 1284
    push $P1, $P114
.annotate 'line', 1510
    new $P117, [ 'PredefFunction' ]
    $P117.'PredefFunction'('get_class', 'get_class %0, %1', 'P', 'S')
    set $P116, $P117
.annotate 'line', 1284
    push $P1, $P116
.annotate 'line', 1514
    new $P119, [ 'PredefFunction' ]
    $P119.'PredefFunction'('typeof', 'typeof %0, %1', 'P', 'P')
    set $P118, $P119
.annotate 'line', 1284
    push $P1, $P118
.annotate 'line', 1518
    new $P121, [ 'PredefFunction' ]
    $P121.'PredefFunction'('getattribute', 'getattribute %0, %1, %2', 'P', 'P', 'S')
    set $P120, $P121
.annotate 'line', 1284
    push $P1, $P120
.annotate 'line', 1522
    new $P123, [ 'PredefFunction' ]
    $P123.'PredefFunction'('find_method', 'find_method %0, %1, %2', 'P', 'P', 'S')
    set $P122, $P123
.annotate 'line', 1284
    push $P1, $P122
.annotate 'line', 1526
    new $P125, [ 'PredefFunction' ]
    $P125.'PredefFunction'('callmethodwithargs', '%0 = %1.%2(%3 :flat)', 'P', 'P', 'P', 'P')
    set $P124, $P125
.annotate 'line', 1284
    push $P1, $P124
.annotate 'line', 1530
    new $P127, [ 'PredefFunction' ]
    $P127.'PredefFunction'('clone', 'clone %0, %1', 'P', 'P')
    set $P126, $P127
.annotate 'line', 1284
    push $P1, $P126
.annotate 'line', 1534
    new $P129, [ 'PredefFunction' ]
    $P129.'PredefFunction'('compreg', 'compreg %0, %1', 'P', 'S')
    set $P128, $P129
.annotate 'line', 1284
    push $P1, $P128
.annotate 'line', 1538
    new $P131, [ 'PredefFunction' ]
    $P131.'PredefFunction'('compreg', 'compreg %1, %2', 'v', 'S', 'P')
    set $P130, $P131
.annotate 'line', 1284
    push $P1, $P130
.annotate 'line', 1542
    new $P133, [ 'PredefFunction' ]
    $P133.'PredefFunction'('load_language', "load_language %1\ncompreg %0, %1\n", 'P', 'S')
    set $P132, $P133
.annotate 'line', 1284
    push $P1, $P132
.annotate 'line', 1549
    new $P135, [ 'PredefFunction' ]
    $P135.'PredefFunction'('load_language', "load_language %1\ncompreg %0, %2\n", 'P', 'S', 'S')
    set $P134, $P135
.annotate 'line', 1284
    push $P1, $P134
.annotate 'line', 1556
    new $P137, [ 'PredefFunction' ]
    $P137.'PredefFunction'('loadlib', 'loadlib %0, %1', 'P', 'S')
    set $P136, $P137
.annotate 'line', 1284
    push $P1, $P136
.annotate 'line', 1560
    new $P139, [ 'PredefFunction' ]
    $P139.'PredefFunction'('load_bytecode', 'load_bytecode %1', 'v', 'S')
    set $P138, $P139
.annotate 'line', 1284
    push $P1, $P138
.annotate 'line', 1564
    new $P141, [ 'PredefFunction' ]
    $P141.'PredefFunction'('dlfunc', 'dlfunc %0, %1, %2, %3', 'P', 'P', 'S', 'S')
    set $P140, $P141
.annotate 'line', 1284
    push $P1, $P140
.annotate 'line', 1568
    new $P143, [ 'PredefFunction' ]
    $P143.'PredefFunction'('sprintf', 'sprintf %0, %1, %2', 'S', 'S', 'P')
    set $P142, $P143
.annotate 'line', 1284
    push $P1, $P142
.annotate 'line', 1572
    new $P145, [ 'PredefFunction' ]
    $P145.'PredefFunction'('sprintf', 'sprintf %0, %1, %2', 'P', 'P', 'P')
    set $P144, $P145
.annotate 'line', 1284
    push $P1, $P144
.annotate 'line', 1576
    new $P147, [ 'PredefFunction' ]
.annotate 'line', 1577
    $P147.'PredefFunction'('print', $P11, 'v', '*')
    set $P146, $P147
.annotate 'line', 1284
    push $P1, $P146
.annotate 'line', 1580
    new $P149, [ 'PredefFunction' ]
.annotate 'line', 1581
    $P149.'PredefFunction'('say', $P12, 'v', '*')
    set $P148, $P149
.annotate 'line', 1284
    push $P1, $P148
.annotate 'line', 1584
    new $P151, [ 'PredefFunction' ]
.annotate 'line', 1585
    $P151.'PredefFunction'('cry', $P13, 'v', '*')
    set $P150, $P151
.annotate 'line', 1284
    push $P1, $P150
.annotate 'line', 1588
    new $P153, [ 'PredefFunction' ]
.annotate 'line', 1589
    $P153.'PredefFunction'('invoke', $P14, 'P', '!')
    set $P152, $P153
.annotate 'line', 1284
    push $P1, $P152
 __label_1: # Infinite loop
.annotate 'line', 1594
    .yield($P1)
    goto __label_1
 __label_0: # Infinite loop end
# }
.annotate 'line', 1595

.end # getpredefs


.sub 'findpredef'
        .param string __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 1599
    $P2 = 'getpredefs'()
    iter $P3, $P2
    set $P3, 0
 __label_0: # for iteration
    unless $P3 goto __label_1
    shift $P1, $P3
.annotate 'line', 1600
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_2
# {
.annotate 'line', 1601
# pargs: $I1
    getattribute $P5, $P1, 'nparams'
    set $I1, $P5
.annotate 'line', 1602
    iseq $I2, $I1, __ARG_2
    if $I2 goto __label_5
.annotate 'line', 1603
    iseq $I2, $I1, -1
 __label_5:
    if $I2 goto __label_4
.annotate 'line', 1604
    iseq $I2, $I1, -2
    unless $I2 goto __label_6
    iseq $I2, __ARG_2, 1
 __label_6:
 __label_4:
    unless $I2 goto __label_3
.annotate 'line', 1605
    .return($P1)
 __label_3: # endif
# }
 __label_2: # endif
    goto __label_0
 __label_1: # endfor
    null $P2
.annotate 'line', 1607
    .return($P2)
# }
.annotate 'line', 1608

.end # findpredef


.sub 'optimize_array'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1616
    if_null __ARG_1, __label_0
# {
.annotate 'line', 1617
# n: $I1
# predefined elements
    elements $I1, __ARG_1
# for loop
.annotate 'line', 1618
# i: $I2
    null $I2
 __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 1619
    $P2 = __ARG_1[$I2]
    $P1 = $P2.'optimize'()
    __ARG_1[$I2] = $P1
 __label_1: # for iteration
.annotate 'line', 1618
    inc $I2
    goto __label_3
 __label_2: # for end
# }
 __label_0: # endif
# }
.annotate 'line', 1621

.end # optimize_array


.sub 'parseDotted'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1625
# var list: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1626
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 1627
    $P3 = $P2.'isidentifier'()
    if_null $P3, __label_0
    unless $P3 goto __label_0
# {
.annotate 'line', 1628
# predefined push
    push $P1, $P2
 __label_2: # while
.annotate 'line', 1629
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 1630
    $P2 = __ARG_1.'get'()
.annotate 'line', 1631
# predefined push
    push $P1, $P2
# }
    goto __label_2
 __label_1: # endwhile
# }
 __label_0: # endif
.annotate 'line', 1634
    __ARG_1.'unget'($P2)
.annotate 'line', 1635
    .return($P1)
# }
.annotate 'line', 1636

.end # parseDotted


.sub 'toIdentifierList'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1640
    new $P1, ['ResizableStringArray']
.annotate 'line', 1641
    iter $P3, __ARG_1
    set $P3, 0
 __label_0: # for iteration
    unless $P3 goto __label_1
    shift $P2, $P3
.annotate 'line', 1642
    $P4 = $P2.'getidentifier'()
# predefined push
    push $P1, $P4
    goto __label_0
 __label_1: # endfor
.annotate 'line', 1643
    .return($P1)
# }
.annotate 'line', 1644

.end # toIdentifierList

.namespace [ 'CommonBase' ]

.sub 'initbase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1657
    setattribute self, 'start', __ARG_1
.annotate 'line', 1658
    setattribute self, 'owner', __ARG_2
# }
.annotate 'line', 1659

.end # initbase


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1662
    getattribute $P1, self, 'start'
    __ARG_1.'annotate'($P1)
# }
.annotate 'line', 1663

.end # annotate


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1666
    getattribute $P1, self, 'owner'
    $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 1667

.end # use_predef


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 1670
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 1671

.end # generatesubid


.sub 'addlocalfunction' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1674
    getattribute $P1, self, 'owner'
    .tailcall $P1.'addlocalfunction'(__ARG_1)
# }
.annotate 'line', 1675

.end # addlocalfunction


.sub 'findsymbol' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1678
    getattribute $P1, self, 'owner'
    .tailcall $P1.'findsymbol'(__ARG_1)
# }
.annotate 'line', 1679

.end # findsymbol


.sub 'findclasskey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1682
    getattribute $P1, self, 'owner'
    .tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 1683

.end # findclasskey


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 1686
    getattribute $P1, self, 'owner'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 1687

.end # dowarnings

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CommonBase' ]
.annotate 'line', 1652
    addattribute $P0, 'start'
.annotate 'line', 1653
    addattribute $P0, 'owner'
.end
.namespace [ 'SimpleArgList' ]

.sub 'init' :method :vtable
# Body
# {
.annotate 'line', 1702
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'args', $P2
# }
.annotate 'line', 1703

.end # init


.sub 'numargs' :method
# Body
# {
.annotate 'line', 1707
    getattribute $P1, self, 'args'
# predefined elements
    elements $I1, $P1
    .return($I1)
# }
.annotate 'line', 1708

.end # numargs


.sub 'getarg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 1711
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 1712
    $P2 = $P1[__ARG_1]
    .return($P2)
# }
.annotate 'line', 1713

.end # getarg


.sub 'parseargs' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 1717
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 1718
# var t: $P2
    null $P2
 __label_0: # do
.annotate 'line', 1719
# {
.annotate 'line', 1720
# var value: $P3
    $P3 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 1721
# predefined push
    push $P1, $P3
# }
 __label_2: # continue
.annotate 'line', 1722
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'(',')
    if_null $P4, __label_1
    if $P4 goto __label_0
 __label_1: # enddo
.annotate 'line', 1723
    'RequireOp'(__ARG_3, $P2)
# }
.annotate 'line', 1724

.end # parseargs


.sub 'optimizeargs' :method
# Body
# {
.annotate 'line', 1728
    getattribute $P1, self, 'args'
    'optimize_array'($P1)
# }
.annotate 'line', 1729

.end # optimizeargs


.sub 'getargvalues' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1732
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 1733
# var argreg: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 1734
# nargs: $I1
# predefined elements
    elements $I1, $P1
# for loop
.annotate 'line', 1735
# i: $I2
    null $I2
 __label_2: # for condition
    ge $I2, $I1, __label_1
# {
.annotate 'line', 1736
# var a: $P3
    $P3 = $P1[$I2]
.annotate 'line', 1737
# reg: $S1
    $P4 = $P3.'emit_get'(__ARG_1)
    null $S1
    if_null $P4, __label_3
    set $S1, $P4
 __label_3:
.annotate 'line', 1738
# predefined push
    push $P2, $S1
# }
 __label_0: # for iteration
.annotate 'line', 1735
    inc $I2
    goto __label_2
 __label_1: # for end
.annotate 'line', 1740
    .return($P2)
# }
.annotate 'line', 1741

.end # getargvalues


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1744
# var argreg: $P1
    $P1 = self.'getargvalues'(__ARG_1)
.annotate 'line', 1745
# predefined join
    join $S1, ', ', $P1
    __ARG_1.'print'($S1)
# }
.annotate 'line', 1746

.end # emitargs

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'SimpleArgList' ]
.annotate 'line', 1698
    addattribute $P0, 'args'
.end
.namespace [ 'Modifier' ]

.sub 'getname' :method
# Body
# {
.annotate 'line', 1758
    getattribute $P1, self, 'name'
    .return($P1)
# }

.end # getname


.sub 'numargs' :method
# Body
# {
.annotate 'line', 1761
# nargs: $I1
    getattribute $P2, self, 'args'
    $P1 = $P2.'numargs'()
    set $I1, $P1
.annotate 'line', 1762
    .return($I1)
# }
.annotate 'line', 1763

.end # numargs


.sub 'getarg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 1766
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 1767
    $P2 = $P1.'numargs'()
    set $I1, $P2
    ge __ARG_1, $I1, __label_0
.annotate 'line', 1768
    .tailcall $P1.'getarg'(__ARG_1)
    goto __label_1
 __label_0: # else
.annotate 'line', 1770
    'InternalError'('Wrong modifier arg number')
 __label_1: # endif
# }
.annotate 'line', 1771

.end # getarg


.sub 'Modifier' :method
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1774
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 1775
    if_null __ARG_2, __label_0
.annotate 'line', 1776
    setattribute self, 'args', __ARG_2
 __label_0: # endif
# }
.annotate 'line', 1777

.end # Modifier


.sub 'optimize' :method
# Body
# {
.annotate 'line', 1780
    getattribute $P1, self, 'args'
    $P1.'optimizeargs'()
# }
.annotate 'line', 1781

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Modifier' ]
.annotate 'line', 1755
    addattribute $P0, 'name'
.annotate 'line', 1756
    addattribute $P0, 'args'
.end
.namespace [ 'ModifierList' ]

.sub 'ModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1790
# var list: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1791
# var t: $P2
    null $P2
 __label_0: # do
.annotate 'line', 1792
# {
.annotate 'line', 1793
    $P2 = __ARG_1.'get'()
.annotate 'line', 1794
# name: $S1
    $P4 = $P2.'getidentifier'()
    null $S1
    if_null $P4, __label_3
    set $S1, $P4
 __label_3:
.annotate 'line', 1795
    $P2 = __ARG_1.'get'()
.annotate 'line', 1796
# var args: $P3
    new $P3, [ 'SimpleArgList' ]
.annotate 'line', 1797
    $P4 = $P2.'isop'('(')
    if_null $P4, __label_4
    unless $P4 goto __label_4
# {
.annotate 'line', 1798
    $P3.'parseargs'(__ARG_1, __ARG_2, ')')
.annotate 'line', 1799
    $P2 = __ARG_1.'get'()
# }
 __label_4: # endif
.annotate 'line', 1801
    new $P5, [ 'Modifier' ]
    $P5.'Modifier'($S1, $P3)
    set $P4, $P5
# predefined push
    push $P1, $P4
# }
 __label_2: # continue
.annotate 'line', 1802
    $P4 = $P2.'isop'(',')
    if_null $P4, __label_1
    if $P4 goto __label_0
 __label_1: # enddo
.annotate 'line', 1803
    'RequireOp'(']', $P2)
.annotate 'line', 1804
    setattribute self, 'list', $P1
# }
.annotate 'line', 1805

.end # ModifierList


.sub 'optimize' :method
# Body
# {
.annotate 'line', 1808
    getattribute $P2, self, 'list'
    iter $P3, $P2
    set $P3, 0
 __label_0: # for iteration
    unless $P3 goto __label_1
    shift $P1, $P3
.annotate 'line', 1809
    $P1.'optimize'()
    goto __label_0
 __label_1: # endfor
# }
.annotate 'line', 1810

.end # optimize


.sub 'getlist' :method
# Body
# {
.annotate 'line', 1811
    getattribute $P1, self, 'list'
    .return($P1)
# }

.end # getlist


.sub 'pick' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1814
# var list: $P1
    getattribute $P1, self, 'list'
.annotate 'line', 1815
# n: $I1
# predefined elements
    elements $I1, $P1
# for loop
.annotate 'line', 1816
# i: $I2
    null $I2
 __label_2: # for condition
    ge $I2, $I1, __label_1
# {
.annotate 'line', 1817
# var mod: $P2
    $P2 = $P1[$I2]
.annotate 'line', 1818
    $P3 = $P2.'getname'()
    set $S1, $P3
    ne $S1, __ARG_1, __label_3
# {
.annotate 'line', 1819
    .return($P2)
# }
 __label_3: # endif
# }
 __label_0: # for iteration
.annotate 'line', 1816
    inc $I2
    goto __label_2
 __label_1: # for end
    null $P3
.annotate 'line', 1822
    .return($P3)
# }
.annotate 'line', 1823

.end # pick

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ModifierList' ]
.annotate 'line', 1786
    addattribute $P0, 'list'
.end
.namespace [ ]

.sub 'getparrotkey'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1832
# s: $S1
# predefined join
    join $S1, "'; '", __ARG_1
.annotate 'line', 1833
    concat $S2, "[ '", $S1
    concat $S2, $S2, "' ]"
    .return($S2)
# }
.annotate 'line', 1834

.end # getparrotkey


.sub 'getparrotnamespacekey'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1838
# predefined elements
    elements $I1, __ARG_1
    ne $I1, 0, __label_0
.annotate 'line', 1839
    .return(".namespace [ ]")
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 1841
# s: $S1
# predefined join
    join $S1, "'; '", __ARG_1
.annotate 'line', 1842
    concat $S2, ".namespace [ '", $S1
    concat $S2, $S2, "' ]"
    .return($S2)
# }
 __label_1: # endif
# }
.annotate 'line', 1844

.end # getparrotnamespacekey


.sub 'parseUsing'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1848
# var taux: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 1849
    $P2 = $P1.'iskeyword'('extern')
    if_null $P2, __label_0
    unless $P2 goto __label_0
.annotate 'line', 1850
    new $P4, [ 'ExternStatement' ]
    $P4.'ExternStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P3, $P4
    .return($P3)
    goto __label_1
 __label_0: # else
.annotate 'line', 1851
    $P5 = $P1.'iskeyword'('static')
    if_null $P5, __label_2
    unless $P5 goto __label_2
.annotate 'line', 1852
    new $P7, [ 'StaticStatement' ]
    $P7.'StaticStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P6, $P7
    .return($P6)
    goto __label_3
 __label_2: # else
# {
.annotate 'line', 1854
    __ARG_2.'unget'($P1)
.annotate 'line', 1855
    new $P3, [ 'UsingStatement' ]
    $P3.'UsingStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P2, $P3
    .return($P2)
# }
 __label_3: # endif
 __label_1: # endif
# }
.annotate 'line', 1857

.end # parseUsing


.sub 'parseSig'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1861
# var params: $P1
    new $P1, [ 'SigParameterList' ]
    $P1.'SigParameterList'(__ARG_2, __ARG_3)
.annotate 'line', 1862
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 1863
    $P4 = $P2.'isop'('=')
    isfalse $I1, $P4
    unless $I1 goto __label_0
.annotate 'line', 1864
    'SyntaxError'("Expected '='", $P2)
 __label_0: # endif
.annotate 'line', 1865
# var expr: $P3
    $P3 = 'parseExpr'(__ARG_2, __ARG_3)
.annotate 'line', 1866
    new $P5, [ 'MultiAssignStatement' ]
    $P5.'MultiAssignStatement'($P1, $P3)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 1867

.end # parseSig


.sub 'parseStatement'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1871
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 1872
    $P4 = $P1.'isop'(';')
    if_null $P4, __label_0
    unless $P4 goto __label_0
.annotate 'line', 1873
    new $P5, [ 'EmptyStatement' ]
    .return($P5)
 __label_0: # endif
.annotate 'line', 1874
    $P4 = $P1.'isop'('{')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 1875
    new $P6, [ 'CompoundStatement' ]
    $P6.'CompoundStatement'($P1, __ARG_1, __ARG_2)
    set $P5, $P6
    .return($P5)
 __label_1: # endif
.annotate 'line', 1876
    $P4 = $P1.'isop'('${')
    if_null $P4, __label_2
    unless $P4 goto __label_2
.annotate 'line', 1877
    new $P6, [ 'PiropStatement' ]
    $P6.'PiropStatement'($P1, __ARG_1, __ARG_2)
    set $P5, $P6
    .return($P5)
 __label_2: # endif
.annotate 'line', 1878
    $P4 = $P1.'isop'(':')
    if_null $P4, __label_3
    unless $P4 goto __label_3
# {
.annotate 'line', 1879
# var open: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 1880
    $P4 = $P2.'isop'('(')
    isfalse $I1, $P4
    unless $I1 goto __label_4
.annotate 'line', 1881
    'SyntaxError'("Unexpected ':'", $P1)
 __label_4: # endif
.annotate 'line', 1882
    .tailcall 'parseSig'($P1, __ARG_1, __ARG_2)
# }
 __label_3: # endif
.annotate 'line', 1885
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
# switch
 __label_7: # case
.annotate 'line', 1887
    .tailcall 'parseUsing'($P1, __ARG_1, __ARG_2)
 __label_8: # case
.annotate 'line', 1889
    .tailcall 'parseConst'($P1, __ARG_1, __ARG_2)
    goto __label_5 # break
 __label_9: # case
.annotate 'line', 1892
    .tailcall 'parseVolatile'($P1, __ARG_1, __ARG_2)
    goto __label_5 # break
 __label_10: # case
.annotate 'line', 1895
    .tailcall 'parseVar'($P1, __ARG_1, __ARG_2)
 __label_11: # case
.annotate 'line', 1897
    .tailcall 'parseString'($P1, __ARG_1, __ARG_2)
 __label_12: # case
.annotate 'line', 1899
    .tailcall 'parseInt'($P1, __ARG_1, __ARG_2)
 __label_13: # case
.annotate 'line', 1901
    .tailcall 'parseFloat'($P1, __ARG_1, __ARG_2)
 __label_14: # case
.annotate 'line', 1903
    new $P6, [ 'ReturnStatement' ]
    $P6.'ReturnStatement'($P1, __ARG_1, __ARG_2)
    set $P5, $P6
    .return($P5)
 __label_15: # case
.annotate 'line', 1905
    new $P8, [ 'YieldStatement' ]
    $P8.'YieldStatement'($P1, __ARG_1, __ARG_2)
    set $P7, $P8
    .return($P7)
 __label_16: # case
.annotate 'line', 1907
    new $P10, [ 'GotoStatement' ]
    $P10.'GotoStatement'($P1, __ARG_1, __ARG_2)
    set $P9, $P10
    .return($P9)
 __label_17: # case
.annotate 'line', 1909
    new $P12, [ 'IfStatement' ]
    $P12.'IfStatement'($P1, __ARG_1, __ARG_2)
    set $P11, $P12
    .return($P11)
 __label_18: # case
.annotate 'line', 1911
    new $P14, [ 'WhileStatement' ]
    $P14.'WhileStatement'($P1, __ARG_1, __ARG_2)
    set $P13, $P14
    .return($P13)
 __label_19: # case
.annotate 'line', 1913
    new $P16, [ 'DoStatement' ]
    $P16.'DoStatement'($P1, __ARG_1, __ARG_2)
    set $P15, $P16
    .return($P15)
 __label_20: # case
.annotate 'line', 1915
    new $P18, [ 'ContinueStatement' ]
    $P18.'ContinueStatement'($P1, __ARG_1, __ARG_2)
    set $P17, $P18
    .return($P17)
 __label_21: # case
.annotate 'line', 1917
    new $P20, [ 'BreakStatement' ]
    $P20.'BreakStatement'($P1, __ARG_1, __ARG_2)
    set $P19, $P20
    .return($P19)
 __label_22: # case
.annotate 'line', 1919
    new $P22, [ 'SwitchStatement' ]
    $P22.'SwitchStatement'($P1, __ARG_1, __ARG_2)
    set $P21, $P22
    .return($P21)
 __label_23: # case
.annotate 'line', 1921
    .tailcall 'parseFor'($P1, __ARG_1, __ARG_2)
 __label_24: # case
.annotate 'line', 1923
    new $P24, [ 'ThrowStatement' ]
    $P24.'ThrowStatement'($P1, __ARG_1, __ARG_2)
    set $P23, $P24
    .return($P23)
 __label_25: # case
.annotate 'line', 1925
    new $P26, [ 'TryStatement' ]
    $P26.'TryStatement'($P1, __ARG_1, __ARG_2)
    set $P25, $P26
    .return($P25)
 __label_6: # default
.annotate 'line', 1927
    $P27 = $P1.'isidentifier'()
    if_null $P27, __label_26
    unless $P27 goto __label_26
# {
.annotate 'line', 1928
# var t2: $P3
    $P3 = __ARG_1.'get'()
.annotate 'line', 1929
    $P4 = $P3.'isop'(':')
    if_null $P4, __label_27
    unless $P4 goto __label_27
.annotate 'line', 1930
    new $P6, [ 'LabelStatement' ]
    $P6.'LabelStatement'($P1, __ARG_2)
    set $P5, $P6
    .return($P5)
 __label_27: # endif
.annotate 'line', 1931
    __ARG_1.'unget'($P3)
# }
 __label_26: # endif
.annotate 'line', 1933
    __ARG_1.'unget'($P1)
.annotate 'line', 1934
    new $P5, [ 'ExprStatement' ]
    $P5.'ExprStatement'($P1, __ARG_1, __ARG_2)
    set $P4, $P5
    .return($P4)
 __label_5: # switch end
.annotate 'line', 1936
    'InternalError'('parseStatement failure', $P1)
# }
.annotate 'line', 1937

.end # parseStatement

.namespace [ 'Statement' ]

.sub 'Statement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1947
    self.'initbase'(__ARG_1, __ARG_2)
# }
.annotate 'line', 1948

.end # Statement


.sub 'isempty' :method
# Body
# {
.annotate 'line', 1949
    .return(0)
# }

.end # isempty


.sub 'createreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1952
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createreg'(__ARG_1)
# }
.annotate 'line', 1953

.end # createreg


.sub 'tempreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1956
    getattribute $P1, self, 'owner'
    .tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 1957

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 1960
    getattribute $P1, self, 'owner'
    $P1.'freetemps'()
# }
.annotate 'line', 1961

.end # freetemps


.sub 'genlabel' :method
# Body
# {
.annotate 'line', 1964
    getattribute $P1, self, 'owner'
    .tailcall $P1.'genlabel'()
# }
.annotate 'line', 1965

.end # genlabel


.sub 'getlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1968
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getlabel'(__ARG_1)
# }
.annotate 'line', 1969

.end # getlabel


.sub 'createlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1972
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createlabel'(__ARG_1)
# }
.annotate 'line', 1973

.end # createlabel


.sub 'createconst' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param int __ARG_5 :optional
# Body
# {
.annotate 'line', 1977
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createconst'(__ARG_1, __ARG_2, __ARG_3, __ARG_4, __ARG_5)
# }
.annotate 'line', 1978

.end # createconst


.sub 'createvar' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 1981
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvar'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 1982

.end # createvar


.sub 'getvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1985
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getvar'(__ARG_1)
# }
.annotate 'line', 1986

.end # getvar


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1989
    getattribute $P1, self, 'owner'
    .tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 1990

.end # checkclass


.sub 'getouter' :method
# Body
# {
.annotate 'line', 1997
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getouter'()
# }
.annotate 'line', 1998

.end # getouter


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2001
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getcontinuelabel'(__ARG_1)
# }
.annotate 'line', 2002

.end # getcontinuelabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2005
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getbreaklabel'(__ARG_1)
# }
.annotate 'line', 2006

.end # getbreaklabel


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2009
    getattribute $P1, self, 'start'
    'InternalError'('**checking**', $P1)
.annotate 'line', 2011
    .return(self)
# }
.annotate 'line', 2012

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Statement' ]
.annotate 'line', 1943
    get_class $P1, [ 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'EmptyStatement' ]

.sub 'isempty' :method
# Body
# {
.annotate 'line', 2017
    .return(1)
# }

.end # isempty


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2020
    'InternalError'('Attempt to annotate empty statement')
# }
.annotate 'line', 2021

.end # annotate


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2022
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'EmptyStatement' ]
.annotate 'line', 2015
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'MultiStatementBase' ]

.sub 'optimize' :method
# Body
# {
.annotate 'line', 2035
# var statements: $P1
    getattribute $P1, self, 'statements'
.annotate 'line', 2036
# n: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 2037
# empty: $I2
    set $I2, 1
# for loop
.annotate 'line', 2038
# i: $I3
    null $I3
 __label_2: # for condition
    ge $I3, $I1, __label_1
# {
.annotate 'line', 2039
# var st: $P2
    $P3 = $P1[$I3]
    $P2 = $P3.'optimize'()
.annotate 'line', 2040
    set $I4, $I2
    unless $I4 goto __label_4
    $P3 = $P2.'isempty'()
    isfalse $I4, $P3
 __label_4:
    unless $I4 goto __label_3
.annotate 'line', 2041
    null $I2
 __label_3: # endif
.annotate 'line', 2042
    $P1[$I3] = $P2
# }
 __label_0: # for iteration
.annotate 'line', 2038
    inc $I3
    goto __label_2
 __label_1: # for end
.annotate 'line', 2044
    unless $I2 goto __label_5
.annotate 'line', 2045
    new $P3, [ 'EmptyStatement' ]
    .return($P3)
    goto __label_6
 __label_5: # else
.annotate 'line', 2047
    .return(self)
 __label_6: # endif
# }
.annotate 'line', 2048

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MultiStatementBase' ]
.annotate 'line', 2031
    addattribute $P0, 'statements'
.end
.namespace [ 'MultiStatement' ]

.sub 'MultiStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2055
# var statements: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
    push $P1, __ARG_1
    push $P1, __ARG_2
.annotate 'line', 2056
    setattribute self, 'statements', $P1
# }
.annotate 'line', 2057

.end # MultiStatement


.sub 'isempty' :method
# Body
# {
.annotate 'line', 2058
    .return(0)
# }

.end # isempty


.sub 'push' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2061
    getattribute $P1, self, 'statements'
# predefined push
    push $P1, __ARG_1
.annotate 'line', 2062
    .return(self)
# }
.annotate 'line', 2063

.end # push


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2066
    getattribute $P2, self, 'statements'
    iter $P3, $P2
    set $P3, 0
 __label_0: # for iteration
    unless $P3 goto __label_1
    shift $P1, $P3
.annotate 'line', 2067
    $P1.'emit'(__ARG_1)
    goto __label_0
 __label_1: # endfor
# }
.annotate 'line', 2068

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MultiStatement' ]
.annotate 'line', 2051
    get_class $P1, [ 'MultiStatementBase' ]
    addparent $P0, $P1
.end
.namespace [ ]

.sub 'addtomulti'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2073
    unless_null __ARG_1, __label_0
.annotate 'line', 2074
    .return(__ARG_2)
    goto __label_1
 __label_0: # else
.annotate 'line', 2075
    isa $I1, __ARG_1, [ 'MultiStatement' ]
    unless $I1 goto __label_2
.annotate 'line', 2076
    .tailcall __ARG_1.'push'(__ARG_2)
    goto __label_3
 __label_2: # else
.annotate 'line', 2078
    new $P2, [ 'MultiStatement' ]
    $P2.'MultiStatement'(__ARG_1, __ARG_2)
    set $P1, $P2
    .return($P1)
 __label_3: # endif
 __label_1: # endif
# }
.annotate 'line', 2079

.end # addtomulti

.namespace [ 'PiropStatement' ]

.sub 'PiropStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2092
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2093
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 2094
# dotted: $I1
    null $I1
.annotate 'line', 2095
    $P4 = $P1.'isop'('.')
    if_null $P4, __label_0
    unless $P4 goto __label_0
# {
.annotate 'line', 2096
    set $I1, 1
.annotate 'line', 2097
    $P1 = __ARG_2.'get'()
# }
 __label_0: # endif
.annotate 'line', 2099
# opname: $S1
    $P4 = $P1.'getidentifier'()
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
 __label_1:
.annotate 'line', 2100
    unless $I1 goto __label_3
    set $S3, '.'
    goto __label_2
 __label_3:
    set $S3, ''
 __label_2:
    concat $S4, $S3, $S1
    box $P4, $S4
    setattribute self, 'opname', $P4
.annotate 'line', 2101
    $P1 = __ARG_2.'get'()
.annotate 'line', 2102
    $P4 = $P1.'isop'('}')
    isfalse $I2, $P4
    unless $I2 goto __label_4
# {
.annotate 'line', 2103
    __ARG_2.'unget'($P1)
.annotate 'line', 2104
# var args: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
 __label_5: # do
.annotate 'line', 2105
# {
.annotate 'line', 2106
# var arg: $P3
    null $P3
.annotate 'line', 2107
    $P1 = __ARG_2.'get'()
.annotate 'line', 2108
    $P4 = $P1.'isop'(':')
    if_null $P4, __label_8
    unless $P4 goto __label_8
# {
.annotate 'line', 2109
    $P1 = __ARG_2.'get'()
.annotate 'line', 2110
# label: $S2
    $P4 = $P1.'getidentifier'()
    null $S2
    if_null $P4, __label_10
    set $S2, $P4
 __label_10:
.annotate 'line', 2111
    new $P4, [ 'Reflabel' ]
    $P4.'Reflabel'(__ARG_3, $S2)
    set $P3, $P4
# }
    goto __label_9
 __label_8: # else
# {
.annotate 'line', 2114
    __ARG_2.'unget'($P1)
.annotate 'line', 2115
    $P3 = 'parseExpr'(__ARG_2, __ARG_3)
# }
 __label_9: # endif
.annotate 'line', 2117
# predefined push
    push $P2, $P3
# }
 __label_7: # continue
.annotate 'line', 2118
    $P1 = __ARG_2.'get'()
    $P4 = $P1.'isop'(',')
    if_null $P4, __label_6
    if $P4 goto __label_5
 __label_6: # enddo
.annotate 'line', 2119
    'RequireOp'('}', $P1)
.annotate 'line', 2120
    setattribute self, 'args', $P2
# }
 __label_4: # endif
.annotate 'line', 2122
    'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 2123

.end # PiropStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2126
    getattribute $P1, self, 'args'
    'optimize_array'($P1)
.annotate 'line', 2127
    .return(self)
# }
.annotate 'line', 2128

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2131
# opname: $S1
    getattribute $P4, self, 'opname'
    null $S1
    if_null $P4, __label_0
    set $S1, $P4
 __label_0:
.annotate 'line', 2132
    self.'annotate'(__ARG_1)
.annotate 'line', 2133
    concat $S3, 'pirop ', $S1
    __ARG_1.'comment'($S3)
.annotate 'line', 2134
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 2135
    __ARG_1.'print'('    ')
.annotate 'line', 2136
    unless_null $P1, __label_1
.annotate 'line', 2137
    __ARG_1.'say'($S1)
    goto __label_2
 __label_1: # else
# {
.annotate 'line', 2139
# var argreg: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 2140
# nargs: $I1
# predefined elements
    elements $I1, $P1
# for loop
.annotate 'line', 2141
# i: $I2
    null $I2
 __label_5: # for condition
    ge $I2, $I1, __label_4
# {
.annotate 'line', 2142
# var a: $P3
    $P3 = $P1[$I2]
.annotate 'line', 2143
# reg: $S2
    $P4 = $P3.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_6
    set $S2, $P4
 __label_6:
.annotate 'line', 2144
# predefined push
    push $P2, $S2
# }
 __label_3: # for iteration
.annotate 'line', 2141
    inc $I2
    goto __label_5
 __label_4: # for end
.annotate 'line', 2146
# predefined join
    join $S3, ', ', $P2
    __ARG_1.'say'($S1, ' ', $S3)
# }
 __label_2: # endif
# }
.annotate 'line', 2148

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'PiropStatement' ]
.annotate 'line', 2085
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2087
    addattribute $P0, 'opname'
.annotate 'line', 2088
    addattribute $P0, 'args'
.end
.namespace [ 'ExternStatement' ]

.sub 'ExternStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2160
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2161
# var path: $P1
    $P1 = 'parseDotted'(__ARG_2)
.annotate 'line', 2162
# predefined elements
    elements $I1, $P1
    ne $I1, 0, __label_0
.annotate 'line', 2163
    $P2 = __ARG_2.'get'()
    'ExpectedIdentifier'($P2)
 __label_0: # endif
.annotate 'line', 2164
    'ExpectOp'(';', __ARG_2)
.annotate 'line', 2165
    $P3 = 'toIdentifierList'($P1)
    setattribute self, 'path', $P3
.annotate 'line', 2166
    .return(self)
# }
.annotate 'line', 2167

.end # ExternStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2168
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2171
    self.'annotate'(__ARG_1)
.annotate 'line', 2172
    getattribute $P1, self, 'path'
# predefined join
    join $S1, '/', $P1
    __ARG_1.'say'('    ', "load_bytecode '", $S1, ".pbc'")
# }
.annotate 'line', 2173

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ExternStatement' ]
.annotate 'line', 2155
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2157
    addattribute $P0, 'path'
.end
.namespace [ 'StaticStatement' ]

.sub 'StaticStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2185
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2186
# sym: $S1
    $P1 = __ARG_2.'get'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 2187
    'ExpectOp'(';', __ARG_2)
.annotate 'line', 2188
    box $P1, $S1
    setattribute self, 'symbol', $P1
# }
.annotate 'line', 2189

.end # StaticStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2190
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2193
    self.'annotate'(__ARG_1)
.annotate 'line', 2194
# var v: $P1
    getattribute $P2, self, 'symbol'
    $P1 = self.'createvar'($P2, 'P')
.annotate 'line', 2195
    $P2 = $P1.'getreg'()
    getattribute $P3, self, 'symbol'
    __ARG_1.'say'(".const 'Sub' ", $P2, " = '", $P3, "'")
# }
.annotate 'line', 2196

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'StaticStatement' ]
.annotate 'line', 2180
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2182
    addattribute $P0, 'symbol'
.end
.namespace [ 'UsingStatement' ]

.sub 'UsingStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2210
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2211
# var path: $P1
    $P1 = 'parseDotted'(__ARG_2)
.annotate 'line', 2212
# predefined elements
    elements $I1, $P1
    ne $I1, 0, __label_0
.annotate 'line', 2213
    $P2 = __ARG_2.'get'()
    'ExpectedIdentifier'($P2)
 __label_0: # endif
.annotate 'line', 2214
    'ExpectOp'(';', __ARG_2)
.annotate 'line', 2215
    $P3 = 'toIdentifierList'($P1)
    setattribute self, 'path', $P3
# }
.annotate 'line', 2216

.end # UsingStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2219
# var path: $P1
    getattribute $P1, self, 'path'
.annotate 'line', 2220
# name: $S1
    $S1 = $P1[-1]
.annotate 'line', 2221
# var vdata: $P2
    $P2 = self.'createvar'($S1, 'P')
.annotate 'line', 2223
# var symbol: $P3
    $P3 = self.'findsymbol'($P1)
.annotate 'line', 2224
    if_null $P3, __label_0
# {
.annotate 'line', 2225
    isa $I1, $P3, [ 'FunctionStatement' ]
    unless $I1 goto __label_1
# {
.annotate 'line', 2226
# subid: $S2
    $P4 = $P3.'makesubid'()
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
 __label_2:
.annotate 'line', 2227
    box $P4, $S2
    setattribute self, 'subid', $P4
# }
 __label_1: # endif
# }
 __label_0: # endif
.annotate 'line', 2230
    .return(self)
# }
.annotate 'line', 2231

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2234
# var path: $P1
    getattribute $P1, self, 'path'
.annotate 'line', 2235
# name: $S1
    $S1 = $P1[-1]
.annotate 'line', 2236
# var vdata: $P2
    $P2 = self.'getvar'($S1)
.annotate 'line', 2237
    getattribute $P3, self, 'subid'
    if_null $P3, __label_0
# {
.annotate 'line', 2238
# subid: $S2
    getattribute $P4, self, 'subid'
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
 __label_2:
.annotate 'line', 2239
    $P3 = $P2.'getreg'()
    __ARG_1.'say'(".const 'Sub' ", $P3, ' = "', $S2, '"')
# }
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 2242
    self.'annotate'(__ARG_1)
.annotate 'line', 2243
    $P3 = $P2.'getreg'()
    __ARG_1.'print'('    get_hll_global ', $P3, ', ')
.annotate 'line', 2244
    $P1.'pop'()
.annotate 'line', 2245
# predefined elements
    elements $I1, $P1
    null $I2
    if $I1 == $I2 goto __label_5
    goto __label_4
# switch
 __label_5: # case
.annotate 'line', 2247
    __ARG_1.'say'("'", $S1, "'")
    goto __label_3 # break
 __label_4: # default
.annotate 'line', 2250
    $P3 = 'getparrotkey'($P1)
    __ARG_1.'say'($P3, " , '", $S1, "'")
 __label_3: # switch end
# }
 __label_1: # endif
# }
.annotate 'line', 2253

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'UsingStatement' ]
.annotate 'line', 2203
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2205
    addattribute $P0, 'path'
.annotate 'line', 2206
    addattribute $P0, 'subid'
.end
.namespace [ 'ExprStatement' ]

.sub 'ExprStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2265
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2266
    $P2 = 'parseExpr'(__ARG_2, self)
    setattribute self, 'expr', $P2
.annotate 'line', 2267
    'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 2268

.end # ExprStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2271
    getattribute $P3, self, 'expr'
    $P2 = $P3.'optimize'()
    setattribute self, 'expr', $P2
.annotate 'line', 2272
    .return(self)
# }
.annotate 'line', 2273

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2276
    getattribute $P1, self, 'expr'
    $P1.'emit'(__ARG_1, '')
# }
.annotate 'line', 2277

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ExprStatement' ]
.annotate 'line', 2260
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2262
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
.annotate 'line', 2296
    setattribute self, 'type', __ARG_1
.annotate 'line', 2297
    setattribute self, 'reg', __ARG_2
.annotate 'line', 2298
    setattribute self, 'scope', __ARG_3
.annotate 'line', 2299
    box $P1, __ARG_4
    setattribute self, 'flags', $P1
.annotate 'line', 2300
    setattribute self, 'value', __ARG_5
# }
.annotate 'line', 2301

.end # VarData


.sub 'setid' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2304
    box $P1, __ARG_1
    setattribute self, 'id', $P1
# }
.annotate 'line', 2305

.end # setid


.sub 'setlex' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2308
    box $P1, __ARG_1
    setattribute self, 'lexname', $P1
# }
.annotate 'line', 2309

.end # setlex


.sub 'gettype' :method
# Body
# {
.annotate 'line', 2310
    getattribute $P1, self, 'type'
    .return($P1)
# }

.end # gettype


.sub 'getreg' :method
# Body
# {
.annotate 'line', 2311
    getattribute $P1, self, 'reg'
    .return($P1)
# }

.end # getreg


.sub 'getscope' :method
# Body
# {
.annotate 'line', 2312
    getattribute $P1, self, 'scope'
    .return($P1)
# }

.end # getscope


.sub 'getvalue' :method
# Body
# {
.annotate 'line', 2313
    getattribute $P1, self, 'value'
    .return($P1)
# }

.end # getvalue


.sub 'isconst' :method
# Body
# {
.annotate 'line', 2314
    getattribute $P1, self, 'value'
    isnull $I1, $P1
    not $I1
    .return($I1)
# }

.end # isconst


.sub 'getid' :method
# Body
# {
.annotate 'line', 2315
    getattribute $P1, self, 'id'
    .return($P1)
# }

.end # getid


.sub 'getlex' :method
# Body
# {
.annotate 'line', 2316
    getattribute $P1, self, 'lexname'
    .return($P1)
# }

.end # getlex


.sub 'getflags' :method
# Body
# {
.annotate 'line', 2317
    getattribute $P1, self, 'flags'
    .return($P1)
# }

.end # getflags

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'VarData' ]
.annotate 'line', 2286
    addattribute $P0, 'type'
.annotate 'line', 2287
    addattribute $P0, 'reg'
.annotate 'line', 2288
    addattribute $P0, 'scope'
.annotate 'line', 2289
    addattribute $P0, 'flags'
.annotate 'line', 2290
    addattribute $P0, 'value'
.annotate 'line', 2291
    addattribute $P0, 'id'
.annotate 'line', 2292
    addattribute $P0, 'lexname'
.end
.namespace [ 'ConstantInternalFail' ]

.sub 'ConstantInternalFail' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2325
    setattribute self, 'name', __ARG_1
# }
.annotate 'line', 2326

.end # ConstantInternalFail


.sub 'get_string' :method :vtable
# Body
# {
.annotate 'line', 2329
    'InternalError'('Attempt to use unexpanded constant!!!')
# }
.annotate 'line', 2330

.end # get_string

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ConstantInternalFail' ]
.annotate 'line', 2322
    addattribute $P0, 'name'
.end
.namespace [ 'VarContainer' ]

.sub 'init' :method :vtable
# Body
# {
.annotate 'line', 2339
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'locals', $P2
# }
.annotate 'line', 2340

.end # init


.sub 'createvar' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 2343
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2344
# sname: $S1
    set $P4, __ARG_1
    null $S1
    if_null $P4, __label_0
    set $S1, $P4
 __label_0:
.annotate 'line', 2345
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2346
    if_null $P2, __label_1
.annotate 'line', 2347
    concat $S3, "Redeclared '", $S1
    concat $S3, $S3, "'"
    'SyntaxError'($S3, __ARG_1)
 __label_1: # endif
.annotate 'line', 2348
# reg: $S2
    $P4 = self.'createreg'(__ARG_2)
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
 __label_2:
.annotate 'line', 2349
# var data: $P3
    new $P3, [ 'VarData' ]
    $P3.'VarData'(__ARG_2, $S2, self, __ARG_3)
.annotate 'line', 2350
    $P1[$S1] = $P3
.annotate 'line', 2351
    .return($P3)
# }
.annotate 'line', 2352

.end # createvar


.sub 'createvarnamed' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 2355
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2356
# sname: $S1
    set $P3, __ARG_1
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 2357
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2358
    if_null $P2, __label_1
.annotate 'line', 2359
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    'SyntaxError'($S2, __ARG_1)
 __label_1: # endif
.annotate 'line', 2360
    new $P4, [ 'VarData' ]
    $P4.'VarData'(__ARG_2, __ARG_3, self, 0)
    set $P3, $P4
    $P1[$S1] = $P3
# }
.annotate 'line', 2361

.end # createvarnamed


.sub 'createconst' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param int __ARG_5 :optional
# Body
# {
.annotate 'line', 2365
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2366
# sname: $S1
    set $P4, __ARG_1
    null $S1
    if_null $P4, __label_0
    set $S1, $P4
 __label_0:
.annotate 'line', 2367
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2368
    if_null $P2, __label_1
.annotate 'line', 2369
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    'SyntaxError'($S2, __ARG_1)
 __label_1: # endif
.annotate 'line', 2370
# var data: $P3
    new $P3, [ 'VarData' ]
    new $P5, [ 'ConstantInternalFail' ]
    $P5.'ConstantInternalFail'(__ARG_1)
    set $P4, $P5
.annotate 'line', 2371
    $P3.'VarData'(__ARG_2, $P4, self, __ARG_5, __ARG_3)
.annotate 'line', 2372
    isnull $I1, __ARG_4
    not $I1
    unless $I1 goto __label_3
    isne $I1, __ARG_4, ''
 __label_3:
    unless $I1 goto __label_2
.annotate 'line', 2373
    $P3.'setid'(__ARG_4)
 __label_2: # endif
.annotate 'line', 2374
    $P1[$S1] = $P3
# }
.annotate 'line', 2375

.end # createconst


.sub 'getvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2378
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2379
# sname: $S1
    set $P3, __ARG_1
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 2380
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2381
    isnull $I1, $P2
    unless $I1 goto __label_2
    getattribute $P3, self, 'owner'
    isnull $I1, $P3
    not $I1
 __label_2:
    unless $I1 goto __label_1
.annotate 'line', 2382
    getattribute $P4, self, 'owner'
    $P2 = $P4.'getvar'(__ARG_1)
 __label_1: # endif
.annotate 'line', 2383
    isnull $I1, $P2
    not $I1
    unless $I1 goto __label_4
    isa $I2, $P2, [ 'VarData' ]
    not $I1, $I2
 __label_4:
    unless $I1 goto __label_3
.annotate 'line', 2384
    'InternalError'('Incorrect data for Variable', __ARG_1)
 __label_3: # endif
.annotate 'line', 2385
    .return($P2)
# }
.annotate 'line', 2386

.end # getvar


.sub 'getlocalvar' :method
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
    .return($P2)
# }
.annotate 'line', 2393

.end # getlocalvar


.sub 'makelexical' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2396
# var lexowner: $P1
    $P1 = self.'getouter'()
.annotate 'line', 2397
# lexname: $S1
    $P2 = $P1.'createlex'(__ARG_1)
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 2398
    .return($S1)
# }
.annotate 'line', 2399

.end # makelexical


.sub 'makelexicalself' :method
# Body
# {
.annotate 'line', 2402
# var lexowner: $P1
    set $P1, self
# Constant lexname evaluated at compile time
.annotate 'line', 2404
    self.'setlex'('__WLEX_self', 'self')
.annotate 'line', 2405
    .return('__WLEX_self')
# }
.annotate 'line', 2406

.end # makelexicalself

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'VarContainer' ]
.annotate 'line', 2336
    addattribute $P0, 'locals'
.end
.namespace [ 'BlockStatement' ]
.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'BlockStatement' ]
.annotate 'line', 2415
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
.annotate 'line', 2427
    self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 2428

.end # Expr


.sub 'issimple' :method
# Body
# {
.annotate 'line', 2429
    .return(0)
# }

.end # issimple


.sub 'isliteral' :method
# Body
# {
.annotate 'line', 2430
    .return(0)
# }

.end # isliteral


.sub 'isintegerliteral' :method
# Body
# {
.annotate 'line', 2431
    .return(0)
# }

.end # isintegerliteral


.sub 'isfloatliteral' :method
# Body
# {
.annotate 'line', 2432
    .return(0)
# }

.end # isfloatliteral


.sub 'isstringliteral' :method
# Body
# {
.annotate 'line', 2433
    .return(0)
# }

.end # isstringliteral


.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 2434
    .return(0)
# }

.end # isidentifier


.sub 'isnull' :method
# Body
# {
.annotate 'line', 2435
    .return(0)
# }

.end # isnull


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 2436
    .return(0)
# }

.end # hascompilevalue


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 2437
    .return(0)
# }

.end # isnegable


.sub 'tempreg' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2440
    getattribute $P1, self, 'owner'
    .tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 2441

.end # tempreg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2445
    .return(self)
# }
.annotate 'line', 2446

.end # optimize


.sub 'cantailcall' :method
# Body
# {
.annotate 'line', 2447
    .return(0)
# }

.end # cantailcall


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2450
# type: $S1
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 2451
# reg: $S2
    ne $S1, 'v', __label_2
    set $S2, ''
    goto __label_1
 __label_2:
    $S2 = self.'tempreg'($S1)
 __label_1:
.annotate 'line', 2452
    self.'emit'(__ARG_1, $S2)
.annotate 'line', 2453
    .return($S2)
# }
.annotate 'line', 2454

.end # emit_get


.sub 'emit_getint' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2457
# reg: $S1
    null $S1
.annotate 'line', 2458
    $P1 = self.'checkresult'()
    set $S2, $P1
    ne $S2, 'I', __label_0
.annotate 'line', 2459
    $P2 = self.'emit_get'(__ARG_1)
    set $S1, $P2
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 2461
    $P3 = self.'tempreg'('I')
    set $S1, $P3
.annotate 'line', 2462
    self.'emit'(__ARG_1, $S1)
# }
 __label_1: # endif
.annotate 'line', 2464
    .return($S1)
# }
.annotate 'line', 2465

.end # emit_getint


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2468
    getattribute $P1, self, 'start'
    'SyntaxError'('Not a left-side expression', $P1)
# }
.annotate 'line', 2469

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Expr' ]
.annotate 'line', 2423
    get_class $P1, [ 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'SimpleExpr' ]

.sub 'issimple' :method
# Body
# {
.annotate 'line', 2474
    .return(1)
# }

.end # issimple

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'SimpleExpr' ]
.annotate 'line', 2472
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
.annotate 'line', 2484
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 2485
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 2486
    $P2 = $P1.'isop'('(')
    isfalse $I1, $P2
    unless $I1 goto __label_0
.annotate 'line', 2487
    'SyntaxError'('anonymous function expected', $P1)
 __label_0: # endif
.annotate 'line', 2488
    new $P4, [ 'LocalFunctionStatement' ]
    $P4.'LocalFunctionStatement'(__ARG_3, __ARG_1, __ARG_2)
    set $P3, $P4
    setattribute self, 'fn', $P3
# }
.annotate 'line', 2489

.end # FunctionExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2490
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2493
    getattribute $P3, self, 'fn'
    $P2 = $P3.'optimize'()
    setattribute self, 'fn', $P2
.annotate 'line', 2494
    .return(self)
# }
.annotate 'line', 2495

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2498
# var fn: $P1
    getattribute $P1, self, 'fn'
.annotate 'line', 2499
# reg: $S1
    $P2 = self.'tempreg'('P')
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 2500
    self.'annotate'(__ARG_1)
.annotate 'line', 2501
    $P2 = $P1.'getsubid'()
    __ARG_1.'say'(".const 'Sub' ", $S1, " = '", $P2, "'")
.annotate 'line', 2502
    set $S2, __ARG_2
    eq $S2, '', __label_1
.annotate 'line', 2503
    __ARG_1.'emitarg2'('newclosure', __ARG_2, $S1)
 __label_1: # endif
# }
.annotate 'line', 2504

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FunctionExpr' ]
.annotate 'line', 2479
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 2481
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
.annotate 'line', 2519
    setattribute self, 'condexpr', __ARG_1
.annotate 'line', 2520
    .return(self)
# }
.annotate 'line', 2521

.end # set


.sub 'optimize_condition' :method
# Body
# {
.annotate 'line', 2524
    getattribute $P3, self, 'condexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'condexpr', $P2
# }
.annotate 'line', 2525

.end # optimize_condition


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2528
    getattribute $P3, self, 'condexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'condexpr', $P2
.annotate 'line', 2529
    .return(self)
# }
.annotate 'line', 2530

.end # optimize


.sub 'getvalue' :method
# Body
# {
.annotate 'line', 2533
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 2534
    $P2 = $P1.'isliteral'()
    if_null $P2, __label_0
    unless $P2 goto __label_0
# {
.annotate 'line', 2535
    $P3 = $P1.'checkresult'()
    set $S1, $P3
    set $S2, 'I'
    if $S1 == $S2 goto __label_3
    goto __label_2
# switch
 __label_3: # case
.annotate 'line', 2537
# n: $I1
    $P4 = $P1.'getIntegerValue'()
    set $I1, $P4
.annotate 'line', 2538
    ne $I1, 0, __label_4
.annotate 'line', 2539
    .return(2)
    goto __label_5
 __label_4: # else
.annotate 'line', 2541
    .return(1)
 __label_5: # endif
 __label_2: # default
 __label_1: # switch end
# }
 __label_0: # endif
.annotate 'line', 2544
    .return(0)
# }
.annotate 'line', 2545

.end # getvalue


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 2548
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 2550
    isa $I1, $P1, [ 'ComparatorBaseExpr' ]
    if $I1 goto __label_2
.annotate 'line', 2551
    isa $I1, $P1, [ 'NullCheckerExpr' ]
 __label_2:
    unless $I1 goto __label_0
.annotate 'line', 2552
    $P1.'emit_if'(__ARG_1, __ARG_2)
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 2554
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_3
    set $S1, $P2
 __label_3:
.annotate 'line', 2555
# type: $S2
    $P2 = $P1.'checkresult'()
    null $S2
    if_null $P2, __label_4
    set $S2, $P2
 __label_4:
.annotate 'line', 2556
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
# switch
 __label_7: # case
 __label_8: # case
.annotate 'line', 2559
    __ARG_1.'emitif_null'($S1, __ARG_3)
 __label_9: # case
 __label_10: # case
.annotate 'line', 2562
    __ARG_1.'emitif'($S1, __ARG_2)
    goto __label_5 # break
 __label_6: # default
.annotate 'line', 2565
    'InternalError'('Invalid if condition')
 __label_5: # switch end
# }
 __label_1: # endif
# }
.annotate 'line', 2568

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 2571
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 2573
    isa $I1, $P1, [ 'ComparatorBaseExpr' ]
    if $I1 goto __label_2
.annotate 'line', 2574
    isa $I1, $P1, [ 'NullCheckerExpr' ]
 __label_2:
    unless $I1 goto __label_0
.annotate 'line', 2575
    $P1.'emit_else'(__ARG_1, __ARG_2)
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 2577
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_3
    set $S1, $P2
 __label_3:
.annotate 'line', 2578
# type: $S2
    $P2 = $P1.'checkresult'()
    null $S2
    if_null $P2, __label_4
    set $S2, $P2
 __label_4:
.annotate 'line', 2579
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
# switch
 __label_7: # case
 __label_8: # case
.annotate 'line', 2582
    __ARG_1.'emitif_null'($S1, __ARG_2)
 __label_9: # case
 __label_10: # case
.annotate 'line', 2585
    __ARG_1.'emitunless'($S1, __ARG_2)
    goto __label_5 # break
 __label_6: # default
.annotate 'line', 2588
    'InternalError'('Invalid if condition')
 __label_5: # switch end
# }
 __label_1: # endif
# }
.annotate 'line', 2591

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Condition' ]
.annotate 'line', 2516
    addattribute $P0, 'condexpr'
.end
.namespace [ 'Literal' ]

.sub 'isliteral' :method
# Body
# {
.annotate 'line', 2598
    .return(1)
# }

.end # isliteral


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 2599
    .return(1)
# }

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Literal' ]
.annotate 'line', 2596
    get_class $P1, [ 'SimpleExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'StringLiteral' ]

.sub 'StringLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2609
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2610
    setattribute self, 'strval', __ARG_2
# }
.annotate 'line', 2611

.end # StringLiteral


.sub 'isstringliteral' :method
# Body
# {
.annotate 'line', 2612
    .return(1)
# }

.end # isstringliteral


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2613
    .return('S')
# }

.end # checkresult


.sub 'getPirString' :method
# Body
# {
.annotate 'line', 2616
# var strtok: $P1
    getattribute $P1, self, 'strval'
.annotate 'line', 2617
# str: $S1
    getattribute $P2, $P1, 'str'
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 2618
# typesinglequoted: $I1
    isa $I1, $P1, [ 'TokenSingleQuoted' ]
.annotate 'line', 2619
# need_unicode: $I2
    null $I2
.annotate 'line', 2620
    box $P2, $S1
    iter $P3, $P2
    set $P3, 0
 __label_1: # for iteration
    unless $P3 goto __label_2
    shift $I3, $P3
# {
.annotate 'line', 2621
    le $I3, 127, __label_3
# {
.annotate 'line', 2622
    set $I2, 1
    goto __label_2 # break
.annotate 'line', 2623
# }
 __label_3: # endif
# }
    goto __label_1
 __label_2: # endfor
.annotate 'line', 2626
    unless $I2 goto __label_4
# {
.annotate 'line', 2627
    unless $I1 goto __label_5
# {
.annotate 'line', 2628
    null $I1
.annotate 'line', 2629
# saux: $S2
    set $S2, $S1
.annotate 'line', 2630
    set $S1, ''
.annotate 'line', 2631
    box $P2, $S2
    iter $P4, $P2
    set $P4, 0
 __label_6: # for iteration
    unless $P4 goto __label_7
    shift $S3, $P4
# {
.annotate 'line', 2632
    ne $S3, '\', __label_8
.annotate 'line', 2633
    set $S3, '\\'
 __label_8: # endif
.annotate 'line', 2634
    concat $S1, $S1, $S3
# }
    goto __label_6
 __label_7: # endfor
# }
 __label_5: # endif
.annotate 'line', 2637
# result: $S4
    set $S4, ''
.annotate 'line', 2638
# l: $I4
# predefined length
    length $I4, $S1
# for loop
.annotate 'line', 2639
# i: $I5
    null $I5
 __label_11: # for condition
    ge $I5, $I4, __label_10
# {
.annotate 'line', 2640
# c: $S5
# predefined substr
    substr $S5, $S1, $I5, 1
.annotate 'line', 2641
# n: $I6
# predefined ord
    ord $I6, $S5
.annotate 'line', 2642
    le $I6, 127, __label_12
# {
.annotate 'line', 2643
# h: $S6
    box $P5, $I6
    $P2 = $P5.'get_as_base'(16)
    null $S6
    if_null $P2, __label_14
    set $S6, $P2
 __label_14:
.annotate 'line', 2644
    concat $S4, $S4, '\x{'
    concat $S4, $S4, $S6
    concat $S4, $S4, '}'
# }
    goto __label_13
 __label_12: # else
.annotate 'line', 2647
    concat $S4, $S4, $S5
 __label_13: # endif
# }
 __label_9: # for iteration
.annotate 'line', 2639
    inc $I5
    goto __label_11
 __label_10: # for end
.annotate 'line', 2649
    set $S1, $S4
# }
 __label_4: # endif
.annotate 'line', 2651
# q: $S7
    unless $I1 goto __label_16
    set $S7, "'"
    goto __label_15
 __label_16:
    set $S7, '"'
 __label_15:
.annotate 'line', 2652
    concat $S0, $S7, $S1
    concat $S0, $S0, $S7
    set $S1, $S0
.annotate 'line', 2653
    unless $I2 goto __label_17
.annotate 'line', 2654
    concat $S0, 'unicode:', $S1
    set $S1, $S0
 __label_17: # endif
.annotate 'line', 2655
    .return($S1)
# }
.annotate 'line', 2656

.end # getPirString


.sub 'get_value' :method
# Body
# {
.annotate 'line', 2659
# var strtok: $P1
    getattribute $P1, self, 'strval'
.annotate 'line', 2660
# str: $S1
    getattribute $P3, $P1, 'str'
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 2661
    isa $I1, $P1, [ 'TokenQuoted' ]
    unless $I1 goto __label_1
# {
.annotate 'line', 2662
# var s: $P2
    box $P2, $S1
.annotate 'line', 2663
    $P3 = $P2.'unescape'('utf8')
    set $S1, $P3
# }
 __label_1: # endif
.annotate 'line', 2665
    .return($S1)
# }
.annotate 'line', 2666

.end # get_value


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2669
    set $S1, __ARG_2
    eq $S1, '', __label_0
.annotate 'line', 2670
    $P1 = self.'getPirString'()
    __ARG_1.'emitset'(__ARG_2, $P1)
 __label_0: # endif
# }
.annotate 'line', 2671

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2674
    .tailcall self.'getPirString'()
# }
.annotate 'line', 2675

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'StringLiteral' ]
.annotate 'line', 2604
    get_class $P1, [ 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 2606
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
.annotate 'line', 2687
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2688
    setattribute self, 'pos', __ARG_2
.annotate 'line', 2689
# n: $I1
    null $I1
.annotate 'line', 2690
    unless __ARG_4 goto __label_0
.annotate 'line', 2691
    set $I1, __ARG_3
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 2693
# aux: $S1
    set $P1, __ARG_2
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
 __label_2:
.annotate 'line', 2694
    set $I1, $S1
# }
 __label_1: # endif
.annotate 'line', 2696
    box $P1, $I1
    setattribute self, 'numval', $P1
# }
.annotate 'line', 2697

.end # IntegerLiteral


.sub 'isintegerliteral' :method
# Body
# {
.annotate 'line', 2698
    .return(1)
# }

.end # isintegerliteral


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2699
    .return('I')
# }

.end # checkresult


.sub 'getIntegerValue' :method
# Body
# {
.annotate 'line', 2702
# aux: $S1
    getattribute $P1, self, 'numval'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 2703
# i: $I1
    set $S2, $S1
    set $I1, $S2
.annotate 'line', 2704
    .return($I1)
# }
.annotate 'line', 2705

.end # getIntegerValue


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2708
    set $S1, __ARG_2
    eq $S1, '', __label_0
# {
.annotate 'line', 2709
# value: $I1
    $P1 = self.'getIntegerValue'()
    set $I1, $P1
.annotate 'line', 2710
    ne $I1, 0, __label_1
.annotate 'line', 2711
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_2
 __label_1: # else
.annotate 'line', 2713
    __ARG_1.'emitset'(__ARG_2, $I1)
 __label_2: # endif
# }
 __label_0: # endif
# }
.annotate 'line', 2715

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2718
    .tailcall self.'getIntegerValue'()
# }
.annotate 'line', 2719

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IntegerLiteral' ]
.annotate 'line', 2680
    get_class $P1, [ 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 2682
    addattribute $P0, 'pos'
.annotate 'line', 2683
    addattribute $P0, 'numval'
.end
.namespace [ 'FloatLiteral' ]

.sub 'FloatLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2729
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2730
    setattribute self, 'numval', __ARG_2
# }
.annotate 'line', 2731

.end # FloatLiteral


.sub 'isfloatliteral' :method
# Body
# {
.annotate 'line', 2732
    .return(1)
# }

.end # isfloatliteral


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2733
    .return('N')
# }

.end # checkresult


.sub 'getFloatValue' :method
# Body
# {
.annotate 'line', 2736
# aux: $S1
    getattribute $P2, self, 'numval'
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 2737
# var n: $P1
    new $P1, [ 'Float' ]
.annotate 'line', 2738
    assign $P1, $S1
.annotate 'line', 2739
    .return($P1)
# }
.annotate 'line', 2740

.end # getFloatValue


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2743
    set $S1, __ARG_2
    eq $S1, '', __label_0
# {
.annotate 'line', 2744
# var n: $P1
    $P1 = self.'getFloatValue'()
.annotate 'line', 2745
    __ARG_1.'emitset'(__ARG_2, $P1)
# }
 __label_0: # endif
# }
.annotate 'line', 2747

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2752
# aux: $S1
    getattribute $P1, self, 'numval'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 2753
# predefined indexof
    index $I1, $S1, '.'
    ge $I1, 0, __label_1
.annotate 'line', 2754
    concat $S1, $S1, '.0'
 __label_1: # endif
.annotate 'line', 2755
    .return($S1)
# }
.annotate 'line', 2756

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FloatLiteral' ]
.annotate 'line', 2724
    get_class $P1, [ 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 2726
    addattribute $P0, 'numval'
.end
.namespace [ 'IdentifierExpr' ]

.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 2764
    .return(1)
# }

.end # isidentifier


.sub 'IdentifierExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2767
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2768
    setattribute self, 'name', __ARG_2
# }
.annotate 'line', 2769

.end # IdentifierExpr


.sub 'isnull' :method
# Body
# {
.annotate 'line', 2772
    getattribute $P1, self, 'name'
    .tailcall $P1.'iskeyword'('null')
# }
.annotate 'line', 2773

.end # isnull


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2776
# var desc: $P1
    getattribute $P2, self, 'owner'
    getattribute $P3, self, 'name'
    $P1 = $P2.'getvar'($P3)
.annotate 'line', 2777
    if_null $P1, __label_0
.annotate 'line', 2778
    .tailcall $P1.'gettype'()
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 2780
    getattribute $P2, self, 'name'
    set $S1, $P2
    set $S2, 'self'
    if $S1 == $S2 goto __label_4
    set $S2, 'null'
    if $S1 == $S2 goto __label_5
    goto __label_3
# switch
 __label_4: # case
 __label_5: # case
.annotate 'line', 2783
    .return('P')
 __label_3: # default
.annotate 'line', 2785
    .return('')
 __label_2: # switch end
# }
 __label_1: # endif
# }
.annotate 'line', 2788

.end # checkresult


.sub 'getName' :method
# Body
# {
.annotate 'line', 2791
# s: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 2792
    .return($S1)
# }
.annotate 'line', 2793

.end # getName


.sub 'checkIdentifier' :method
# Body
# {
.annotate 'line', 2796
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 2797
    unless_null $P1, __label_0
.annotate 'line', 2798
    'InternalError'('Bad thing')
 __label_0: # endif
.annotate 'line', 2799
# var desc: $P2
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
.annotate 'line', 2800
# s: $S1
    null $S1
.annotate 'line', 2801
    unless_null $P2, __label_1
# {
.annotate 'line', 2802
# sname: $S2
    set $P3, $P1
    null $S2
    if_null $P3, __label_3
    set $S2, $P3
 __label_3:
.annotate 'line', 2803
    set $S3, $S2
    set $S4, 'self'
    if $S3 == $S4 goto __label_6
    set $S4, 'null'
    if $S3 == $S4 goto __label_7
    goto __label_5
# switch
 __label_6: # case
.annotate 'line', 2805
    set $S1, 'self'
    goto __label_4 # break
 __label_7: # case
.annotate 'line', 2807
    set $S1, 'null'
    goto __label_4 # break
 __label_5: # default
.annotate 'line', 2809
    set $S1, ''
 __label_4: # switch end
# }
    goto __label_2
 __label_1: # else
# {
.annotate 'line', 2813
    $P3 = $P2.'getid'()
    if_null $P3, __label_8
.annotate 'line', 2814
    .tailcall $P2.'getid'()
    goto __label_9
 __label_8: # else
.annotate 'line', 2816
    $P4 = $P2.'getreg'()
    set $S1, $P4
 __label_9: # endif
# }
 __label_2: # endif
.annotate 'line', 2818
    .return($S1)
# }
.annotate 'line', 2819

.end # checkIdentifier


.sub 'getIdentifier' :method
# Body
# {
.annotate 'line', 2822
# var value: $P1
    $P1 = self.'checkIdentifier'()
.annotate 'line', 2823
    set $S2, $P1
    ne $S2, '', __label_0
# {
.annotate 'line', 2824
# name: $S1
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
 __label_1:
.annotate 'line', 2825
    concat $S2, "Variable '", $S1
    concat $S2, $S2, "' is not defined"
    getattribute $P2, self, 'name'
    'SyntaxError'($S2, $P2)
# }
 __label_0: # endif
.annotate 'line', 2827
    .return($P1)
# }
.annotate 'line', 2828

.end # getIdentifier


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2831
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 2832
# var desc: $P2
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
.annotate 'line', 2833
    if_null $P2, __label_0
# {
.annotate 'line', 2834
    $I2 = $P2.'isconst'()
    unless $I2 goto __label_2
    $P3 = $P2.'getid'()
    isnull $I2, $P3
 __label_2:
    unless $I2 goto __label_1
.annotate 'line', 2835
    .tailcall $P2.'getvalue'()
 __label_1: # endif
.annotate 'line', 2836
# flags: $I1
    $P3 = $P2.'getflags'()
    set $I1, $P3
.annotate 'line', 2837
    band $I2, $I1, 1
    unless $I2 goto __label_3
# {
.annotate 'line', 2838
    band $I3, $I1, 2
    unless $I3 goto __label_4
.annotate 'line', 2839
    new $P4, [ 'LexicalVolatileExpr' ]
    $P4.'LexicalVolatileExpr'(self, $P2)
    set $P3, $P4
    .return($P3)
 __label_4: # endif
# }
 __label_3: # endif
# }
 __label_0: # endif
.annotate 'line', 2842
    .return(self)
# }
.annotate 'line', 2843

.end # optimize


.sub 'emit_getid' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2846
# id: $S1
    $P2 = self.'getIdentifier'()
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 2847
# var desc: $P1
    getattribute $P2, self, 'owner'
    getattribute $P3, self, 'name'
    $P1 = $P2.'getvar'($P3)
.annotate 'line', 2848
# flags: $I1
    unless_null $P1, __label_2
    null $I1
    goto __label_1
 __label_2:
    $I1 = $P1.'getflags'()
 __label_1:
.annotate 'line', 2849
    band $I2, $I1, 1
    unless $I2 goto __label_3
# {
.annotate 'line', 2850
    band $I3, $I1, 2
    unless $I3 goto __label_4
# {
.annotate 'line', 2851
# lexname: $S2
    $P2 = $P1.'getlex'()
    null $S2
    if_null $P2, __label_5
    set $S2, $P2
 __label_5:
.annotate 'line', 2852
    isnull $I2, $S2
    not $I2
    unless $I2 goto __label_7
    isne $I2, $S2, ''
 __label_7:
    unless $I2 goto __label_6
.annotate 'line', 2853
    __ARG_1.'emitfind_lex'($S1, $S2)
 __label_6: # endif
# }
 __label_4: # endif
# }
 __label_3: # endif
.annotate 'line', 2856
    .return($S1)
# }
.annotate 'line', 2857

.end # emit_getid


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2860
    set $S2, __ARG_2
    eq $S2, '', __label_0
# {
.annotate 'line', 2861
    self.'annotate'(__ARG_1)
.annotate 'line', 2862
# id: $S1
    $P1 = self.'emit_getid'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
 __label_1:
.annotate 'line', 2863
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
 __label_0: # endif
# }
.annotate 'line', 2865

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2868
    self.'annotate'(__ARG_1)
.annotate 'line', 2869
# id: $S1
    $P1 = self.'emit_getid'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 2870
    .return($S1)
# }
.annotate 'line', 2871

.end # emit_get


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2874
    self.'annotate'(__ARG_1)
.annotate 'line', 2875
    $P1 = self.'isnull'()
    if_null $P1, __label_0
    unless $P1 goto __label_0
# predefined die
.annotate 'line', 2876
    die "NO"
 __label_0: # endif
.annotate 'line', 2877
# typeleft: $S1
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
 __label_1:
.annotate 'line', 2878
# lreg: $S2
    $P1 = self.'getIdentifier'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
 __label_2:
.annotate 'line', 2879
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_3
    unless $P1 goto __label_3
# {
.annotate 'line', 2880
    set $S5, $S1
    set $S6, 'S'
    if $S5 == $S6 goto __label_7
    set $S6, 'P'
    if $S5 == $S6 goto __label_8
    goto __label_6
# switch
 __label_7: # case
 __label_8: # case
.annotate 'line', 2883
    __ARG_1.'emitnull'($S2)
    goto __label_5 # break
 __label_6: # default
.annotate 'line', 2886
    getattribute $P2, self, 'start'
    'SyntaxError'("Can't assign null to that type", $P2)
 __label_5: # switch end
# }
    goto __label_4
 __label_3: # else
.annotate 'line', 2889
    isa $I1, __ARG_2, [ 'IndexExpr' ]
    unless $I1 goto __label_9
.annotate 'line', 2890
    __ARG_2.'emit'(__ARG_1, $S2)
    goto __label_10
 __label_9: # else
# {
.annotate 'line', 2892
# typeright: $S3
    $P1 = __ARG_2.'checkresult'()
    null $S3
    if_null $P1, __label_11
    set $S3, $P1
 __label_11:
.annotate 'line', 2893
    ne $S3, 'v', __label_12
.annotate 'line', 2894
    getattribute $P1, self, 'start'
    'SyntaxError'("Can't assign from void expression", $P1)
 __label_12: # endif
.annotate 'line', 2895
    ne $S1, $S3, __label_13
# {
.annotate 'line', 2896
    __ARG_2.'emit'(__ARG_1, $S2)
# }
    goto __label_14
 __label_13: # else
# {
.annotate 'line', 2899
# rreg: $S4
    $P1 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P1, __label_15
    set $S4, $P1
 __label_15:
.annotate 'line', 2900
    self.'annotate'(__ARG_1)
.annotate 'line', 2901
    iseq $I1, $S1, 'P'
    unless $I1 goto __label_18
    isne $I1, $S3, 'P'
 __label_18:
    unless $I1 goto __label_16
.annotate 'line', 2902
    __ARG_1.'emitbox'($S2, $S4)
    goto __label_17
 __label_16: # else
.annotate 'line', 2904
    __ARG_1.'emitset'($S2, $S4)
 __label_17: # endif
# }
 __label_14: # endif
# }
 __label_10: # endif
 __label_4: # endif
.annotate 'line', 2907
    .return($S2)
# }
.annotate 'line', 2908

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IdentifierExpr' ]
.annotate 'line', 2761
    get_class $P1, [ 'SimpleExpr' ]
    addparent $P0, $P1
.annotate 'line', 2763
    addattribute $P0, 'name'
.end
.namespace [ 'LexicalVolatileExpr' ]

.sub 'LexicalVolatileExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2918
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 2919
    setattribute self, 'desc', __ARG_2
# }
.annotate 'line', 2920

.end # LexicalVolatileExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2921
    .return('P')
# }

.end # checkresult


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2924
# var desc: $P1
    getattribute $P1, self, 'desc'
.annotate 'line', 2925
# lexname: $S1
    $P2 = $P1.'getlex'()
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 2926
# reg: $S2
    getattribute $P3, self, 'owner'
    $P2 = $P3.'tempreg'('P')
    null $S2
    if_null $P2, __label_1
    set $S2, $P2
 __label_1:
.annotate 'line', 2927
    __ARG_1.'emitfind_lex'($S2, $S1)
.annotate 'line', 2928
    .return($S2)
# }
.annotate 'line', 2929

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2932
    set $S2, __ARG_2
    eq $S2, '', __label_0
# {
.annotate 'line', 2933
    self.'annotate'(__ARG_1)
.annotate 'line', 2934
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
 __label_1:
.annotate 'line', 2935
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
 __label_0: # endif
# }
.annotate 'line', 2937

.end # emit


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2940
# lreg: $S1
    getattribute $P3, self, 'owner'
    $P2 = $P3.'tempreg'('P')
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 2941
    $P2 = __ARG_2.'isnull'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 2942
    __ARG_1.'emitnull'($S1)
    goto __label_2
 __label_1: # else
.annotate 'line', 2943
    isa $I1, __ARG_2, [ 'IndexExpr' ]
    unless $I1 goto __label_3
.annotate 'line', 2944
    __ARG_2.'emit'(__ARG_1, $S1)
    goto __label_4
 __label_3: # else
# {
.annotate 'line', 2946
# typeright: $S2
    $P3 = __ARG_2.'checkresult'()
    null $S2
    if_null $P3, __label_5
    set $S2, $P3
 __label_5:
.annotate 'line', 2947
    ne 'P', $S2, __label_6
# {
.annotate 'line', 2948
    __ARG_2.'emit'(__ARG_1, $S1)
# }
    goto __label_7
 __label_6: # else
# {
.annotate 'line', 2951
# rreg: $S3
    $P2 = __ARG_2.'emit_get'(__ARG_1)
    null $S3
    if_null $P2, __label_8
    set $S3, $P2
 __label_8:
.annotate 'line', 2952
    self.'annotate'(__ARG_1)
.annotate 'line', 2953
    __ARG_1.'emitbox'($S1, $S3)
# }
 __label_7: # endif
# }
 __label_4: # endif
 __label_2: # endif
.annotate 'line', 2957
# var desc: $P1
    getattribute $P1, self, 'desc'
.annotate 'line', 2958
# lexname: $S4
    $P2 = $P1.'getlex'()
    null $S4
    if_null $P2, __label_9
    set $S4, $P2
 __label_9:
.annotate 'line', 2959
    __ARG_1.'say'("store_lex '", $S4, "', ", $S1)
# }
.annotate 'line', 2960

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'LexicalVolatileExpr' ]
.annotate 'line', 2913
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 2915
    addattribute $P0, 'desc'
.end
.namespace [ 'OpExpr' ]

.sub 'initop' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2969
    self.'Expr'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2970

.end # initop

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpExpr' ]
.annotate 'line', 2965
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
.annotate 'line', 2981
    self.'initop'(__ARG_2, __ARG_3)
.annotate 'line', 2982
    $P2 = 'parseClassSpecifier'(__ARG_1, __ARG_2)
    setattribute self, 'clspec', $P2
# }
.annotate 'line', 2983

.end # OpClassExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2984
    .return('P')
# }

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2987
# var clspec: $P1
    getattribute $P1, self, 'clspec'
.annotate 'line', 2990
    set $S1, __ARG_2
    ne $S1, '', __label_0
.annotate 'line', 2991
    getattribute $P2, self, 'owner'
    __ARG_2 = $P2.'tempreg'('P')
 __label_0: # endif
.annotate 'line', 2992
    __ARG_1.'print'('    get_class ', __ARG_2, ', ')
.annotate 'line', 2993
    getattribute $P2, self, 'owner'
    $P1.'emit'(__ARG_1, $P2)
.annotate 'line', 2994
    __ARG_1.'say'()
# }
.annotate 'line', 2995

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpClassExpr' ]
.annotate 'line', 2975
    get_class $P1, [ 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 2977
    addattribute $P0, 'clspec'
.end
.namespace [ 'OpUnaryExpr' ]

.sub 'OpUnaryExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3005
    self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 3006
    setattribute self, 'subexpr', __ARG_3
# }
.annotate 'line', 3007

.end # OpUnaryExpr


.sub 'optimizearg' :method
# Body
# {
.annotate 'line', 3010
    getattribute $P3, self, 'subexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'subexpr', $P2
# }
.annotate 'line', 3011

.end # optimizearg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3014
    self.'optimizearg'()
.annotate 'line', 3015
    .return(self)
# }
.annotate 'line', 3016

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpUnaryExpr' ]
.annotate 'line', 3000
    get_class $P1, [ 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3002
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
.annotate 'line', 3027
    self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 3028
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 3029
    setattribute self, 'rexpr', __ARG_4
# }
.annotate 'line', 3030

.end # initbinary


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 3033
    self.'initbinary'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 3034
    .return(self)
# }
.annotate 'line', 3035

.end # set


.sub 'setfrom' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3038
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    getattribute $P3, __ARG_1, 'lexpr'
    getattribute $P4, __ARG_1, 'rexpr'
    .tailcall self.'set'($P1, $P2, $P3, $P4)
# }
.annotate 'line', 3039

.end # setfrom


.sub 'optimizearg' :method
# Body
# {
.annotate 'line', 3042
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 3043
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'rexpr', $P2
# }
.annotate 'line', 3044

.end # optimizearg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3047
    self.'optimizearg'()
.annotate 'line', 3048
    .return(self)
# }
.annotate 'line', 3049

.end # optimize


.sub 'emit_intleft' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3052
# reg: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_getint'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3053
    .return($S1)
# }
.annotate 'line', 3054

.end # emit_intleft


.sub 'emit_intright' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3057
# reg: $S1
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_getint'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3058
    .return($S1)
# }
.annotate 'line', 3059

.end # emit_intright

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBinaryExpr' ]
.annotate 'line', 3021
    get_class $P1, [ 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3023
    addattribute $P0, 'lexpr'
.annotate 'line', 3024
    addattribute $P0, 'rexpr'
.end
.namespace [ 'OpBinaryIntExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3068
    .return('I')
# }
.annotate 'line', 3069

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3072
    self.'optimizearg'()
.annotate 'line', 3073
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3074
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3075
    $I3 = $P1.'isintegerliteral'()
    unless $I3 goto __label_1
    $I3 = $P2.'isintegerliteral'()
 __label_1:
    unless $I3 goto __label_0
# {
.annotate 'line', 3076
# li: $I1
# predefined int
    getattribute $P3, $P1, 'numval'
    set $I1, $P3
.annotate 'line', 3077
# ri: $I2
# predefined int
    getattribute $P3, $P2, 'numval'
    set $I2, $P3
.annotate 'line', 3078
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P5 = self.'do_op'($I1, $I2)
    .tailcall 'integerValue'($P3, $P4, $P5)
# }
 __label_0: # endif
.annotate 'line', 3080
    .return(self)
# }
.annotate 'line', 3081

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBinaryIntExpr' ]
.annotate 'line', 3064
    get_class $P1, [ 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpDelExBase' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3090
    .return('I')
# }
.annotate 'line', 3091

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpDelExBase' ]
.annotate 'line', 3086
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
.annotate 'line', 3099
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3100

.end # OpDeleteExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3103
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3104
    isa $I1, $P1, [ 'IndexExpr' ]
    unless $I1 goto __label_2
    $P2 = $P1.'checkresult'()
    set $S1, $P2
    isne $I1, $S1, 'S'
 __label_2:
    unless $I1 goto __label_0
# {
.annotate 'line', 3105
    $P1.'emit_prep'(__ARG_1)
.annotate 'line', 3106
    self.'annotate'(__ARG_1)
.annotate 'line', 3107
    __ARG_1.'print'('    delete ')
.annotate 'line', 3108
    $P1.'emit_aux'(__ARG_1)
.annotate 'line', 3109
    __ARG_1.'say'()
.annotate 'line', 3110
    set $S1, __ARG_2
    eq $S1, '', __label_3
.annotate 'line', 3111
    __ARG_1.'emitset'(__ARG_2, '1')
 __label_3: # endif
# }
    goto __label_1
 __label_0: # else
.annotate 'line', 3114
    getattribute $P2, self, 'start'
    'SyntaxError'("delete with invalid operator", $P2)
 __label_1: # endif
# }
.annotate 'line', 3115

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpDeleteExpr' ]
.annotate 'line', 3095
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
.annotate 'line', 3122
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3123

.end # OpExistsExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3126
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3127
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
.annotate 'line', 3128
    isa $I1, $P1, [ 'IndexExpr' ]
    unless $I1 goto __label_5
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    isne $I1, $S2, 'S'
 __label_5:
    unless $I1 goto __label_3
# {
.annotate 'line', 3129
    $P1.'emit_prep'(__ARG_1)
.annotate 'line', 3130
    self.'annotate'(__ARG_1)
.annotate 'line', 3131
    __ARG_1.'print'('    exists ', $S1, ', ')
.annotate 'line', 3132
    $P1.'emit_aux'(__ARG_1)
.annotate 'line', 3133
    __ARG_1.'say'()
# }
    goto __label_4
 __label_3: # else
.annotate 'line', 3136
    getattribute $P2, self, 'start'
    'SyntaxError'("exists with invalid operator", $P2)
 __label_4: # endif
# }
.annotate 'line', 3137

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3140
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3141
# reg: $S1
    $P2 = self.'tempreg'('I')
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 3142
    isa $I1, $P1, [ 'IndexExpr' ]
    unless $I1 goto __label_3
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    isne $I1, $S2, 'S'
 __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 3143
    $P1.'emit_prep'(__ARG_1)
.annotate 'line', 3144
    self.'annotate'(__ARG_1)
.annotate 'line', 3145
    __ARG_1.'print'('    exists ', $S1, ', ')
.annotate 'line', 3146
    $P1.'emit_aux'(__ARG_1)
.annotate 'line', 3147
    __ARG_1.'say'()
.annotate 'line', 3148
    .return($S1)
# }
    goto __label_2
 __label_1: # else
.annotate 'line', 3151
    getattribute $P2, self, 'start'
    'SyntaxError'("exists with invalid operator", $P2)
 __label_2: # endif
# }
.annotate 'line', 3152

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpExistsExpr' ]
.annotate 'line', 3118
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
.annotate 'line', 3161
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3162

.end # OpUnaryMinusExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3165
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3166

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3169
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3170
    .return(self)
# }
.annotate 'line', 3171

.end # set


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3174
    self.'optimizearg'()
.annotate 'line', 3175
    getattribute $P4, self, 'subexpr'
    $P3 = $P4.'isintegerliteral'()
    if_null $P3, __label_0
    unless $P3 goto __label_0
# {
.annotate 'line', 3176
# var numval: $P1
    getattribute $P5, self, 'subexpr'
    getattribute $P1, $P5, 'numval'
.annotate 'line', 3177
# i: $I1
    set $P3, $P1
    set $I1, $P3
.annotate 'line', 3178
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'subexpr'
    getattribute $P5, $P4, 'start'
    neg $I2, $I1
    .tailcall 'integerValue'($P3, $P5, $I2)
# }
 __label_0: # endif
# {
.annotate 'line', 3181
    getattribute $P4, self, 'subexpr'
    $P3 = $P4.'isfloatliteral'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 3182
# var numval: $P2
    getattribute $P5, self, 'subexpr'
    getattribute $P2, $P5, 'numval'
.annotate 'line', 3183
# n: $N1
# predefined string
    set $S1, $P2
    set $N1, $S1
.annotate 'line', 3184
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'subexpr'
    getattribute $P5, $P4, 'start'
    neg $N2, $N1
    .tailcall 'floatValue'($P3, $P5, $N2)
# }
 __label_1: # endif
# }
.annotate 'line', 3187
    .return(self)
# }
.annotate 'line', 3188

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3191
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3192
    self.'annotate'(__ARG_1)
.annotate 'line', 3193
    __ARG_1.'emitarg2'('neg', __ARG_2, $S1)
# }
.annotate 'line', 3194

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpUnaryMinusExpr' ]
.annotate 'line', 3157
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
.annotate 'line', 3203
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3204

.end # OpNotExpr


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3205
    .return(1)
# }

.end # isnegable


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3208
    .return('I')
# }
.annotate 'line', 3209

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3212
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3213
    .return(self)
# }
.annotate 'line', 3214

.end # set


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3217
    self.'optimizearg'()
.annotate 'line', 3218
# var subexpr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3219
    $P3 = $P1.'isintegerliteral'()
    if_null $P3, __label_0
    unless $P3 goto __label_0
# {
.annotate 'line', 3220
# var numval: $P2
    getattribute $P2, $P1, 'numval'
.annotate 'line', 3221
# n: $I1
    set $P3, $P2
    set $I1, $P3
.annotate 'line', 3222
    getattribute $P3, self, 'owner'
    getattribute $P4, $P1, 'start'
    not $I2, $I1
    .tailcall 'integerValue'($P3, $P4, $I2)
# }
 __label_0: # endif
.annotate 'line', 3224
    $P3 = $P1.'isnegable'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 3225
    .tailcall $P1.'negated'()
 __label_1: # endif
.annotate 'line', 3226
    .return(self)
# }
.annotate 'line', 3227

.end # optimize


.sub 'negated' :method
# Body
# {
.annotate 'line', 3230
    getattribute $P1, self, 'subexpr'
    .return($P1)
# }
.annotate 'line', 3231

.end # negated


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3234
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3235
    self.'annotate'(__ARG_1)
.annotate 'line', 3236
# type: $S2
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 3237
    set $S3, $S2
    set $S4, 'I'
    if $S3 == $S4 goto __label_4
    set $S4, 'P'
    if $S3 == $S4 goto __label_5
    goto __label_3
# switch
 __label_4: # case
.annotate 'line', 3239
    __ARG_1.'emitarg2'('not', __ARG_2, $S1)
    goto __label_2 # break
 __label_5: # case
.annotate 'line', 3242
    __ARG_1.'emitarg2'('isfalse', __ARG_2, $S1)
    goto __label_2 # break
 __label_3: # default
.annotate 'line', 3245
    __ARG_1.'emitarg2'('isfalse', __ARG_2, $S1)
 __label_2: # switch end
# }
.annotate 'line', 3247

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpNotExpr' ]
.annotate 'line', 3199
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
.annotate 'line', 3256
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3257

.end # OpPreIncExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3260
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3261

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3264
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3265
    setattribute self, 'subexpr', __ARG_3
.annotate 'line', 3266
    .return(self)
# }
.annotate 'line', 3267

.end # set


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3270
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3271
    set $S2, __ARG_2
    eq $S2, '', __label_1
.annotate 'line', 3272
    __ARG_1.'emitset'(__ARG_2, $S1)
 __label_1: # endif
# }
.annotate 'line', 3273

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3276
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3277
    self.'annotate'(__ARG_1)
.annotate 'line', 3278
    __ARG_1.'emitinc'($S1)
.annotate 'line', 3279
    .return($S1)
# }
.annotate 'line', 3280

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpPreIncExpr' ]
.annotate 'line', 3252
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
.annotate 'line', 3289
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3290
    .return(self)
# }
.annotate 'line', 3291

.end # OpPostIncExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3294
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3295

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3298
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3299
    self.'annotate'(__ARG_1)
.annotate 'line', 3300
    set $S2, __ARG_2
    eq $S2, '', __label_1
.annotate 'line', 3301
    __ARG_1.'emitset'(__ARG_2, $S1)
 __label_1: # endif
.annotate 'line', 3302
    __ARG_1.'emitinc'($S1)
.annotate 'line', 3303
    .return($S1)
# }
.annotate 'line', 3304

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpPostIncExpr' ]
.annotate 'line', 3285
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
.annotate 'line', 3313
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3314

.end # OpPreDecExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3317
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3318

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3321
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3322
    .return(self)
# }
.annotate 'line', 3323

.end # set


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3326
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3327
    set $S2, __ARG_2
    eq $S2, '', __label_1
.annotate 'line', 3328
    __ARG_1.'emitset'(__ARG_2, $S1)
 __label_1: # endif
# }
.annotate 'line', 3329

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3332
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3333
    self.'annotate'(__ARG_1)
.annotate 'line', 3334
    __ARG_1.'emitdec'($S1)
.annotate 'line', 3335
    .return($S1)
# }
.annotate 'line', 3336

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpPreDecExpr' ]
.annotate 'line', 3309
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
.annotate 'line', 3345
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3346
    .return(self)
# }
.annotate 'line', 3347

.end # OpPostDecExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3350
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3351

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3354
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3355
    self.'annotate'(__ARG_1)
.annotate 'line', 3356
    set $S2, __ARG_2
    eq $S2, '', __label_1
.annotate 'line', 3357
    __ARG_1.'emitset'(__ARG_2, $S1)
 __label_1: # endif
.annotate 'line', 3358
    __ARG_1.'emitdec'($S1)
.annotate 'line', 3359
    .return($S1)
# }
.annotate 'line', 3360

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpPostDecExpr' ]
.annotate 'line', 3341
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
.annotate 'line', 3371
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3372
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 3373
    setattribute self, 'rexpr', __ARG_4
.annotate 'line', 3374
    .return(self)
# }
.annotate 'line', 3375

.end # set


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3378
    getattribute $P1, self, 'lexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3379

.end # checkresult


.sub 'optimize_base' :method
# Body
# {
.annotate 'line', 3382
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 3383
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'rexpr', $P2
.annotate 'line', 3384
    .return(self)
# }
.annotate 'line', 3385

.end # optimize_base


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3388
    .tailcall self.'optimize_base'()
# }
.annotate 'line', 3389

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3392
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3393
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 3394
    self.'annotate'(__ARG_1)
.annotate 'line', 3395
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
 __label_1: # endif
# }
.annotate 'line', 3397

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBaseAssignExpr' ]
.annotate 'line', 3365
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3367
    addattribute $P0, 'lexpr'
.annotate 'line', 3368
    addattribute $P0, 'rexpr'
.end
.namespace [ 'OpAssignExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3406
    self.'annotate'(__ARG_1)
.annotate 'line', 3407
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3408
    getattribute $P2, self, 'rexpr'
    .tailcall $P1.'emit_assign_get'(__ARG_1, $P2)
# }
.annotate 'line', 3409

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpAssignExpr' ]
.annotate 'line', 3402
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpAssignToExpr' ]

.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3418
    self.'annotate'(__ARG_1)
.annotate 'line', 3419
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3420
    isnull $I1, __ARG_2
    not $I1
    unless $I1 goto __label_2
    set $S2, __ARG_2
    isne $I1, $S2, ''
 __label_2:
    unless $I1 goto __label_1
.annotate 'line', 3421
    __ARG_1.'emitassign'(__ARG_2, $S1)
 __label_1: # endif
# }
.annotate 'line', 3422

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3425
    self.'annotate'(__ARG_1)
.annotate 'line', 3426
# reg: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3427
# reg2: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 3428
    __ARG_1.'emitassign'($S1, $S2)
.annotate 'line', 3429
    .return($S1)
# }
.annotate 'line', 3430

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpAssignToExpr' ]
.annotate 'line', 3414
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpAddToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3439
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3440
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3441
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 3442
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_1
    set $S2, $P3
 __label_1:
.annotate 'line', 3443
# reg: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_2
    set $S3, $P3
 __label_2:
.annotate 'line', 3444
    iseq $I1, $S1, 'S'
    unless $I1 goto __label_5
    isa $I1, $P2, [ 'ConcatString' ]
 __label_5:
    unless $I1 goto __label_3
.annotate 'line', 3445
    $P2.'emit_concat_to'(__ARG_1, $S3)
    goto __label_4
 __label_3: # else
# {
.annotate 'line', 3447
# reg2: $S4
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_6
    set $S4, $P3
 __label_6:
.annotate 'line', 3448
# aux: $S5
    null $S5
.annotate 'line', 3449
    self.'annotate'(__ARG_1)
.annotate 'line', 3450
    set $S6, $S1
    set $S7, 'S'
    if $S6 == $S7 goto __label_9
    set $S7, 'I'
    if $S6 == $S7 goto __label_10
    set $S7, 'N'
    if $S6 == $S7 goto __label_11
    goto __label_8
# switch
 __label_9: # case
.annotate 'line', 3452
    eq $S2, 'S', __label_12
# {
.annotate 'line', 3453
    $P3 = self.'tempreg'('S')
    set $S5, $P3
.annotate 'line', 3454
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3455
    set $S4, $S5
# }
 __label_12: # endif
.annotate 'line', 3457
    __ARG_1.'emitconcat1'($S3, $S4)
    goto __label_7 # break
 __label_10: # case
 __label_11: # case
.annotate 'line', 3461
    eq $S1, $S2, __label_13
# {
.annotate 'line', 3462
    $P3 = self.'tempreg'($S1)
    set $S5, $P3
.annotate 'line', 3463
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3464
    set $S4, $S5
# }
 __label_13: # endif
.annotate 'line', 3466
    __ARG_1.'emitaddto'($S3, $S4)
    goto __label_7 # break
 __label_8: # default
.annotate 'line', 3469
    __ARG_1.'emitaddto'($S3, $S4)
 __label_7: # switch end
# }
 __label_4: # endif
.annotate 'line', 3472
    .return($S3)
# }
.annotate 'line', 3473

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpAddToExpr' ]
.annotate 'line', 3435
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpSubToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3482
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3483
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3484
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 3485
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_1
    set $S2, $P3
 __label_1:
.annotate 'line', 3486
# reg: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_2
    set $S3, $P3
 __label_2:
.annotate 'line', 3487
# reg2: $S4
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_3
    set $S4, $P3
 __label_3:
.annotate 'line', 3488
# aux: $S5
    null $S5
.annotate 'line', 3489
    self.'annotate'(__ARG_1)
.annotate 'line', 3490
    set $S6, $S1
    set $S7, 'S'
    if $S6 == $S7 goto __label_6
    set $S7, 'I'
    if $S6 == $S7 goto __label_7
    set $S7, 'N'
    if $S6 == $S7 goto __label_8
    goto __label_5
# switch
 __label_6: # case
.annotate 'line', 3492
    getattribute $P3, self, 'start'
    'SyntaxError'("-= can't be applied to string", $P3)
 __label_7: # case
 __label_8: # case
.annotate 'line', 3495
    eq $S1, $S2, __label_9
# {
.annotate 'line', 3496
    $P4 = self.'tempreg'($S1)
    set $S5, $P4
.annotate 'line', 3497
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3498
    set $S4, $S5
# }
 __label_9: # endif
.annotate 'line', 3500
    __ARG_1.'emitsubto'($S3, $S4)
    goto __label_4 # break
 __label_5: # default
.annotate 'line', 3503
    __ARG_1.'emitsubto'($S3, $S4)
 __label_4: # switch end
.annotate 'line', 3505
    .return($S3)
# }
.annotate 'line', 3506

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpSubToExpr' ]
.annotate 'line', 3478
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpMulToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3515
# ltype: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3516
# rtype: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 3517
# lreg: $S3
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_2
    set $S3, $P1
 __label_2:
.annotate 'line', 3518
# rreg: $S4
    null $S4
.annotate 'line', 3519
    set $S5, $S1
    set $S6, 'S'
    if $S5 == $S6 goto __label_5
    goto __label_4
# switch
 __label_5: # case
.annotate 'line', 3521
    ne $S2, 'I', __label_6
.annotate 'line', 3522
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    set $S4, $P1
    goto __label_7
 __label_6: # else
# {
.annotate 'line', 3524
    $P3 = self.'tempreg'('I')
    set $S4, $P3
.annotate 'line', 3525
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S4)
# }
 __label_7: # endif
.annotate 'line', 3527
    self.'annotate'(__ARG_1)
.annotate 'line', 3528
    __ARG_1.'emitrepeat'($S3, $S3, $S4)
    goto __label_3 # break
 __label_4: # default
.annotate 'line', 3531
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    set $S4, $P1
.annotate 'line', 3532
    self.'annotate'(__ARG_1)
.annotate 'line', 3533
    __ARG_1.'emitarg2'('mul', $S3, $S4)
 __label_3: # switch end
.annotate 'line', 3535
    .return($S3)
# }
.annotate 'line', 3536

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpMulToExpr' ]
.annotate 'line', 3511
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpDivToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3545
# type: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3546
# reg: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 3547
# reg2: $S3
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_2
    set $S3, $P1
 __label_2:
.annotate 'line', 3548
    self.'annotate'(__ARG_1)
.annotate 'line', 3549
    __ARG_1.'emitarg2'('div', $S2, $S3)
.annotate 'line', 3550
    .return($S2)
# }
.annotate 'line', 3551

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpDivToExpr' ]
.annotate 'line', 3541
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpModToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3560
# type: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3561
# reg: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 3562
# reg2: $S3
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_2
    set $S3, $P1
 __label_2:
.annotate 'line', 3563
    self.'annotate'(__ARG_1)
.annotate 'line', 3564
    __ARG_1.'emitarg2'('mod', $S2, $S3)
.annotate 'line', 3565
    .return($S2)
# }
.annotate 'line', 3566

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpModToExpr' ]
.annotate 'line', 3556
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'ComparatorBaseExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3573
    .return('I')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3576
    self.'optimizearg'()
.annotate 'line', 3577
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3578
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3579
    $I3 = $P1.'isintegerliteral'()
    unless $I3 goto __label_1
    $I3 = $P2.'isintegerliteral'()
 __label_1:
    unless $I3 goto __label_0
# {
.annotate 'line', 3580
# li: $I1
# predefined int
    getattribute $P3, $P1, 'numval'
    set $I1, $P3
.annotate 'line', 3581
# ri: $I2
# predefined int
    getattribute $P3, $P2, 'numval'
    set $I2, $P3
.annotate 'line', 3582
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P5 = self.'int_op'($I1, $I2)
    .tailcall 'integerValue'($P3, $P4, $P5)
# }
 __label_0: # endif
.annotate 'line', 3584
    .return(self)
# }
.annotate 'line', 3585

.end # optimize


.sub 'emit_comparator' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 3588
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3589
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 3590
# regl: $S3
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_2
    set $S3, $P1
 __label_2:
.annotate 'line', 3591
# regr: $S4
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P1, __label_3
    set $S4, $P1
 __label_3:
.annotate 'line', 3592
    self.'annotate'(__ARG_1)
.annotate 'line', 3593
# aux: $S5
    null $S5
.annotate 'line', 3594
    iseq $I1, $S1, 'N'
    if $I1 goto __label_6
    iseq $I1, $S2, 'N'
 __label_6:
    unless $I1 goto __label_4
# {
.annotate 'line', 3596
    ne $S1, 'I', __label_7
# {
.annotate 'line', 3597
    $P1 = self.'tempreg'('N')
    set $S5, $P1
.annotate 'line', 3598
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3599
    set $S3, $S5
# }
 __label_7: # endif
.annotate 'line', 3601
    ne $S2, 'I', __label_8
# {
.annotate 'line', 3602
    $P1 = self.'tempreg'('N')
    set $S5, $P1
.annotate 'line', 3603
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3604
    set $S4, $S5
# }
 __label_8: # endif
# }
    goto __label_5
 __label_4: # else
.annotate 'line', 3607
    iseq $I1, $S2, 'I'
    unless $I1 goto __label_11
    iseq $I1, $S1, 'P'
 __label_11:
    unless $I1 goto __label_9
# {
.annotate 'line', 3608
    $P1 = self.'tempreg'('I')
    set $S5, $P1
.annotate 'line', 3609
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3610
    set $S3, $S5
# }
    goto __label_10
 __label_9: # else
.annotate 'line', 3612
    iseq $I1, $S2, 'P'
    unless $I1 goto __label_14
    iseq $I1, $S1, 'I'
 __label_14:
    unless $I1 goto __label_12
# {
.annotate 'line', 3613
    $P1 = self.'tempreg'('I')
    set $S5, $P1
.annotate 'line', 3614
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3615
    set $S4, $S5
# }
    goto __label_13
 __label_12: # else
.annotate 'line', 3617
    iseq $I1, $S2, 'S'
    unless $I1 goto __label_17
    iseq $I1, $S1, 'P'
 __label_17:
    unless $I1 goto __label_15
# {
.annotate 'line', 3618
    $P1 = self.'tempreg'('S')
    set $S5, $P1
.annotate 'line', 3619
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3620
    set $S3, $S5
# }
    goto __label_16
 __label_15: # else
.annotate 'line', 3622
    iseq $I1, $S2, 'P'
    unless $I1 goto __label_19
    iseq $I1, $S1, 'S'
 __label_19:
    unless $I1 goto __label_18
# {
.annotate 'line', 3623
    $P1 = self.'tempreg'('S')
    set $S5, $P1
.annotate 'line', 3624
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3625
    set $S4, $S5
# }
 __label_18: # endif
 __label_16: # endif
 __label_13: # endif
 __label_10: # endif
 __label_5: # endif
.annotate 'line', 3628
    set $I1, __ARG_3
    null $I2
    if $I1 == $I2 goto __label_22
    set $I2, 1
    if $I1 == $I2 goto __label_23
    set $I2, 2
    if $I1 == $I2 goto __label_24
    goto __label_21
# switch
 __label_22: # case
.annotate 'line', 3630
    self.'emitop'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_20 # break
 __label_23: # case
.annotate 'line', 3633
    self.'emitop_if'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_20 # break
 __label_24: # case
.annotate 'line', 3636
    self.'emitop_else'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_20 # break
 __label_21: # default
 __label_20: # switch end
.annotate 'line', 3637
# }
.annotate 'line', 3639

.end # emit_comparator


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3642
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3643

.end # emit


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 3646
    self.'emit_comparator'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 3647

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 3650
    self.'emit_comparator'(__ARG_1, __ARG_2, 2)
# }
.annotate 'line', 3651

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ComparatorBaseExpr' ]
.annotate 'line', 3571
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
.annotate 'line', 3666
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 3667
    setattribute self, 'expr', __ARG_2
.annotate 'line', 3668
    box $P1, __ARG_3
    setattribute self, 'checknull', $P1
# }
.annotate 'line', 3669

.end # NullCheckerExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3670
    .return('I')
# }

.end # checkresult


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3671
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3674
# checkneg: $I1
    getattribute $P1, self, 'checknull'
    isfalse $I1, $P1
.annotate 'line', 3675
    box $P1, $I1
    setattribute self, 'checknull', $P1
.annotate 'line', 3676
    .return(self)
# }
.annotate 'line', 3677

.end # negated


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3680
# reg: $S1
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3681
    self.'annotate'(__ARG_1)
.annotate 'line', 3682
    __ARG_1.'emitarg2'('isnull', __ARG_2, $S1)
.annotate 'line', 3683
    getattribute $P1, self, 'checknull'
    isfalse $I1, $P1
    unless $I1 goto __label_1
.annotate 'line', 3684
    __ARG_1.'emitarg1'('not', __ARG_2)
 __label_1: # endif
# }
.annotate 'line', 3685

.end # emit


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 3688
# reg: $S1
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3689
    self.'annotate'(__ARG_1)
.annotate 'line', 3690
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
.annotate 'line', 3691

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NullCheckerExpr' ]
.annotate 'line', 3659
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3661
    addattribute $P0, 'expr'
.annotate 'line', 3662
    addattribute $P0, 'checknull'
.end
.namespace [ 'OpEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3698
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3701
    new $P1, [ 'OpNotEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3702

.end # negated


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3705
    self.'optimizearg'()
.annotate 'line', 3706
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3707
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3708
# lnull: $I1
    $P3 = $P1.'isnull'()
    set $I1, $P3
.annotate 'line', 3709
# rnull: $I2
    $P3 = $P2.'isnull'()
    set $I2, $P3
.annotate 'line', 3710
    unless $I1 goto __label_0
# {
.annotate 'line', 3711
    unless $I2 goto __label_1
.annotate 'line', 3712
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall 'integerValue'($P3, $P4, 1)
    goto __label_2
 __label_1: # else
.annotate 'line', 3714
    new $P6, [ 'NullCheckerExpr' ]
    getattribute $P7, self, 'rexpr'
    $P6.'NullCheckerExpr'(self, $P7, 1)
    set $P5, $P6
    .return($P5)
 __label_2: # endif
# }
 __label_0: # endif
.annotate 'line', 3716
    unless $I2 goto __label_3
.annotate 'line', 3717
    new $P4, [ 'NullCheckerExpr' ]
    getattribute $P5, self, 'lexpr'
    $P4.'NullCheckerExpr'(self, $P5, 1)
    set $P3, $P4
    .return($P3)
 __label_3: # endif
.annotate 'line', 3718
    $I5 = $P1.'isliteral'()
    unless $I5 goto __label_5
    $I5 = $P2.'isliteral'()
 __label_5:
    unless $I5 goto __label_4
# {
.annotate 'line', 3719
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_6
    set $S1, $P3
 __label_6:
.annotate 'line', 3720
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_7
    set $S2, $P3
 __label_7:
.annotate 'line', 3721
    ne $S1, $S2, __label_8
# {
.annotate 'line', 3722
    set $S5, $S1
    set $S6, 'I'
    if $S5 == $S6 goto __label_11
    set $S6, 'S'
    if $S5 == $S6 goto __label_12
    goto __label_10
# switch
 __label_11: # case
.annotate 'line', 3724
# li: $I3
# predefined int
    getattribute $P3, $P1, 'numval'
    set $I3, $P3
.annotate 'line', 3725
# ri: $I4
# predefined int
    getattribute $P4, $P2, 'numval'
    set $I4, $P4
.annotate 'line', 3726
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    iseq $I5, $I3, $I4
    .tailcall 'integerValue'($P5, $P6, $I5)
 __label_12: # case
.annotate 'line', 3728
# ls: $S3
    getattribute $P8, $P1, 'strval'
    getattribute $P7, $P8, 'str'
    null $S3
    if_null $P7, __label_13
    set $S3, $P7
 __label_13:
.annotate 'line', 3729
# rs: $S4
    getattribute $P10, $P2, 'strval'
    getattribute $P9, $P10, 'str'
    null $S4
    if_null $P9, __label_14
    set $S4, $P9
 __label_14:
.annotate 'line', 3730
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
.annotate 'line', 3734
    .return(self)
# }
.annotate 'line', 3735

.end # optimize


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3738
    __ARG_1.'emitbinop'('iseq', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3739

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3742
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3743

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3746
    __ARG_1.'emitcompare'('eq', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3747

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3750
    __ARG_1.'emitcompare'('ne', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3751

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpEqualExpr' ]
.annotate 'line', 3696
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpNotEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3758
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3761
    new $P1, [ 'OpEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3762

.end # negated


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3765
    self.'optimizearg'()
.annotate 'line', 3766
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3767
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3768
# lnull: $I1
    $P3 = $P1.'isnull'()
    set $I1, $P3
.annotate 'line', 3769
# rnull: $I2
    $P3 = $P2.'isnull'()
    set $I2, $P3
.annotate 'line', 3770
    unless $I1 goto __label_0
# {
.annotate 'line', 3771
    unless $I2 goto __label_1
.annotate 'line', 3772
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall 'integerValue'($P3, $P4, 0)
    goto __label_2
 __label_1: # else
.annotate 'line', 3774
    new $P6, [ 'NullCheckerExpr' ]
    getattribute $P7, self, 'rexpr'
    $P6.'NullCheckerExpr'(self, $P7, 0)
    set $P5, $P6
    .return($P5)
 __label_2: # endif
# }
 __label_0: # endif
.annotate 'line', 3776
    unless $I2 goto __label_3
.annotate 'line', 3777
    new $P4, [ 'NullCheckerExpr' ]
    getattribute $P5, self, 'lexpr'
    $P4.'NullCheckerExpr'(self, $P5, 0)
    set $P3, $P4
    .return($P3)
 __label_3: # endif
.annotate 'line', 3778
    $I5 = $P1.'isliteral'()
    unless $I5 goto __label_5
    $I5 = $P2.'isliteral'()
 __label_5:
    unless $I5 goto __label_4
# {
.annotate 'line', 3779
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_6
    set $S1, $P3
 __label_6:
.annotate 'line', 3780
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_7
    set $S2, $P3
 __label_7:
.annotate 'line', 3781
    ne $S1, $S2, __label_8
# {
.annotate 'line', 3782
    set $S5, $S1
    set $S6, 'I'
    if $S5 == $S6 goto __label_11
    set $S6, 'S'
    if $S5 == $S6 goto __label_12
    goto __label_10
# switch
 __label_11: # case
.annotate 'line', 3784
# li: $I3
# predefined int
    getattribute $P3, $P1, 'numval'
    set $I3, $P3
.annotate 'line', 3785
# ri: $I4
# predefined int
    getattribute $P4, $P2, 'numval'
    set $I4, $P4
.annotate 'line', 3786
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    isne $I5, $I3, $I4
    .tailcall 'integerValue'($P5, $P6, $I5)
 __label_12: # case
.annotate 'line', 3788
# ls: $S3
    getattribute $P8, $P1, 'strval'
    getattribute $P7, $P8, 'str'
    null $S3
    if_null $P7, __label_13
    set $S3, $P7
 __label_13:
.annotate 'line', 3789
# rs: $S4
    getattribute $P10, $P2, 'strval'
    getattribute $P9, $P10, 'str'
    null $S4
    if_null $P9, __label_14
    set $S4, $P9
 __label_14:
.annotate 'line', 3790
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
.annotate 'line', 3794
    .return(self)
# }
.annotate 'line', 3795

.end # optimize


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3798
    __ARG_1.'emitbinop'('isne', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3799

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3802
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3803

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3806
    __ARG_1.'emitcompare'('ne', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3807

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3810
    __ARG_1.'emitcompare'('eq', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3811

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpNotEqualExpr' ]
.annotate 'line', 3756
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
.annotate 'line', 3821
    self.'initbinary'(__ARG_2, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 3822
    box $P1, __ARG_1
    setattribute self, 'positive', $P1
# }
.annotate 'line', 3823

.end # OpSameExpr


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3824
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3827
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 3828
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
.annotate 'line', 3829

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 3832
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
.annotate 'line', 3833

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3836
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 3837
# op: $S1
    unless $I1 goto __label_1
    set $S1, 'issame'
    goto __label_0
 __label_1:
    set $S1, 'isntsame'
 __label_0:
.annotate 'line', 3838
    __ARG_1.'emitbinop'($S1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3839

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3842
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3843

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3846
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 3847
# op: $S1
    unless $I1 goto __label_1
    set $S1, 'eq_addr'
    goto __label_0
 __label_1:
    set $S1, 'ne_addr'
 __label_0:
.annotate 'line', 3848
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3849

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3852
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 3853
# op: $S1
    unless $I1 goto __label_1
    set $S1, 'ne_addr'
    goto __label_0
 __label_1:
    set $S1, 'eq_addr'
 __label_0:
.annotate 'line', 3854
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3855

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpSameExpr' ]
.annotate 'line', 3816
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 3818
    addattribute $P0, 'positive'
.end
.namespace [ 'OpLessExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3862
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3865
    new $P1, [ 'OpGreaterEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3866

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 3869
    islt $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 3870

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3873
    __ARG_1.'emitbinop'('islt', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3874

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3877
    __ARG_1.'emitcompare'('lt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3878

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3881
    __ARG_1.'emitcompare'('ge', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3882

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpLessExpr' ]
.annotate 'line', 3860
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpGreaterExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3889
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3892
    new $P1, [ 'OpLessEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3893

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 3896
    isgt $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 3897

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3900
    __ARG_1.'emitbinop'('isgt', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3901

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3904
    __ARG_1.'emitcompare'('gt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3905

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3908
    __ARG_1.'emitcompare'('le', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3909

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpGreaterExpr' ]
.annotate 'line', 3887
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpLessEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3916
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3919
    new $P1, [ 'OpGreaterExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3920

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 3923
    isle $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 3924

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3927
    __ARG_1.'emitbinop'('isle', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3928

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3931
    __ARG_1.'emitcompare'('le', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3932

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3935
    __ARG_1.'emitcompare'('gt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3936

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpLessEqualExpr' ]
.annotate 'line', 3914
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpGreaterEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3943
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3946
    new $P1, [ 'OpLessExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3947

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 3950
    isge $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 3951

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3954
    __ARG_1.'emitbinop'('isge', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3955

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3958
    __ARG_1.'emitcompare'('ge', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3959

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3962
    __ARG_1.'emitcompare'('lt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3963

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpGreaterEqualExpr' ]
.annotate 'line', 3941
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpBaseBoolExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3972
    .return('I')
# }
.annotate 'line', 3973

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBaseBoolExpr' ]
.annotate 'line', 3968
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
.annotate 'line', 3982
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3983

.end # OpBoolAndExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3986
    self.'optimizearg'()
.annotate 'line', 3987
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'isintegerliteral'()
    if_null $P2, __label_0
    unless $P2 goto __label_0
# {
.annotate 'line', 3988
# var lval: $P1
    getattribute $P4, self, 'lexpr'
    getattribute $P1, $P4, 'numval'
.annotate 'line', 3989
# ln: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 3990
    eq $I1, 0, __label_1
.annotate 'line', 3991
    getattribute $P2, self, 'rexpr'
    .return($P2)
    goto __label_2
 __label_1: # else
.annotate 'line', 3993
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall 'integerValue'($P3, $P4, $I1)
 __label_2: # endif
# }
 __label_0: # endif
.annotate 'line', 3995
    .return(self)
# }
.annotate 'line', 3996

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3999
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
.annotate 'line', 4000
    getattribute $P1, self, 'lexpr'
    $I1 = $P1.'issimple'()
    unless $I1 goto __label_5
    getattribute $P2, self, 'rexpr'
    $I1 = $P2.'issimple'()
 __label_5:
    unless $I1 goto __label_3
# {
.annotate 'line', 4001
# lreg: $S2
    $P3 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P3, __label_6
    set $S2, $P3
 __label_6:
.annotate 'line', 4002
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_7
    set $S3, $P1
 __label_7:
.annotate 'line', 4003
    __ARG_1.'emitbinop'('and', $S1, $S2, $S3)
# }
    goto __label_4
 __label_3: # else
# {
.annotate 'line', 4006
# l: $S4
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S4
    if_null $P1, __label_8
    set $S4, $P1
 __label_8:
.annotate 'line', 4007
    getattribute $P1, self, 'lexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4008
    __ARG_1.'emitunless'($S1, $S4)
.annotate 'line', 4009
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4010
    __ARG_1.'emitlabel'($S4)
# }
 __label_4: # endif
# }
.annotate 'line', 4012

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBoolAndExpr' ]
.annotate 'line', 3978
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
.annotate 'line', 4021
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4022

.end # OpBoolOrExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4025
    self.'optimizearg'()
.annotate 'line', 4026
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'isintegerliteral'()
    if_null $P2, __label_0
    unless $P2 goto __label_0
# {
.annotate 'line', 4027
# var lval: $P1
    getattribute $P4, self, 'lexpr'
    getattribute $P1, $P4, 'numval'
.annotate 'line', 4028
# ln: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 4029
    ne $I1, 0, __label_1
.annotate 'line', 4030
    getattribute $P2, self, 'rexpr'
    .return($P2)
    goto __label_2
 __label_1: # else
.annotate 'line', 4032
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall 'integerValue'($P3, $P4, $I1)
 __label_2: # endif
# }
 __label_0: # endif
.annotate 'line', 4034
    .return(self)
# }
.annotate 'line', 4035

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4038
# res: $S1
    null $S1
.annotate 'line', 4039
    if_null __ARG_2, __label_0
.annotate 'line', 4040
    set $S1, __ARG_2
    goto __label_1
 __label_0: # else
.annotate 'line', 4042
    $P1 = self.'tempreg'('I')
    set $S1, $P1
 __label_1: # endif
.annotate 'line', 4043
    getattribute $P1, self, 'lexpr'
    $I1 = $P1.'issimple'()
    unless $I1 goto __label_4
    getattribute $P2, self, 'rexpr'
    $I1 = $P2.'issimple'()
 __label_4:
    unless $I1 goto __label_2
# {
.annotate 'line', 4044
# lreg: $S2
    $P3 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P3, __label_5
    set $S2, $P3
 __label_5:
.annotate 'line', 4045
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_6
    set $S3, $P1
 __label_6:
.annotate 'line', 4046
    __ARG_1.'emitbinop'('or', $S1, $S2, $S3)
# }
    goto __label_3
 __label_2: # else
# {
.annotate 'line', 4049
# l: $S4
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S4
    if_null $P1, __label_7
    set $S4, $P1
 __label_7:
.annotate 'line', 4050
    getattribute $P1, self, 'lexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4051
    __ARG_1.'emitif'($S1, $S4)
.annotate 'line', 4052
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4053
    __ARG_1.'emitlabel'($S4)
# }
 __label_3: # endif
# }
.annotate 'line', 4055

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBoolOrExpr' ]
.annotate 'line', 4017
    get_class $P1, [ 'OpBaseBoolExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpBaseBinExpr' ]
.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBaseBinExpr' ]
.annotate 'line', 4060
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
.annotate 'line', 4070
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4071

.end # OpBinAndExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4074
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
.annotate 'line', 4075
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
 __label_3:
.annotate 'line', 4076
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_4
    set $S3, $P1
 __label_4:
.annotate 'line', 4077
    self.'annotate'(__ARG_1)
.annotate 'line', 4078
    __ARG_1.'emitbinop'('band', $S1, $S2, $S3)
# }
.annotate 'line', 4079

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4082
    band $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4083

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBinAndExpr' ]
.annotate 'line', 4066
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
.annotate 'line', 4092
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4093

.end # OpBinOrExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4096
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
.annotate 'line', 4097
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
 __label_3:
.annotate 'line', 4098
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_4
    set $S3, $P1
 __label_4:
.annotate 'line', 4099
    self.'annotate'(__ARG_1)
.annotate 'line', 4100
    __ARG_1.'emitbinop'('bor', $S1, $S2, $S3)
# }
.annotate 'line', 4101

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4104
    bor $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4105

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBinOrExpr' ]
.annotate 'line', 4088
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
.annotate 'line', 4114
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4115

.end # OpBinXorExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4118
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
.annotate 'line', 4119
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
 __label_3:
.annotate 'line', 4120
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_4
    set $S3, $P1
 __label_4:
.annotate 'line', 4121
    self.'annotate'(__ARG_1)
.annotate 'line', 4122
    __ARG_1.'emitbinop'('bxor', $S1, $S2, $S3)
# }
.annotate 'line', 4123

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4126
    bxor $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4127

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBinXorExpr' ]
.annotate 'line', 4110
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
.annotate 'line', 4137
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 4138
    isa $I1, __ARG_3, [ 'ConcatString' ]
    unless $I1 goto __label_0
# {
.annotate 'line', 4139
    getattribute $P2, __ARG_3, 'values'
    setattribute self, 'values', $P2
.annotate 'line', 4140
    isa $I1, __ARG_4, [ 'ConcatString' ]
    unless $I1 goto __label_2
.annotate 'line', 4141
    getattribute $P1, self, 'values'
    getattribute $P2, __ARG_4, 'values'
    $P1.'append'($P2)
    goto __label_3
 __label_2: # else
.annotate 'line', 4143
    getattribute $P3, self, 'values'
# predefined push
    push $P3, __ARG_4
 __label_3: # endif
# }
    goto __label_1
 __label_0: # else
.annotate 'line', 4145
    isa $I1, __ARG_4, [ 'ConcatString' ]
    unless $I1 goto __label_4
# {
.annotate 'line', 4146
    getattribute $P2, __ARG_4, 'values'
    setattribute self, 'values', $P2
.annotate 'line', 4147
    getattribute $P1, self, 'values'
    $P1.'unshift'(__ARG_3)
# }
    goto __label_5
 __label_4: # else
.annotate 'line', 4150
    root_new $P2, ['parrot';'ResizablePMCArray']
    push $P2, __ARG_3
    push $P2, __ARG_4
    setattribute self, 'values', $P2
 __label_5: # endif
 __label_1: # endif
# }
.annotate 'line', 4151

.end # ConcatString


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4152
    .return('S')
# }

.end # checkresult


.sub 'getregs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4155
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 4156
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4157
    new $P2, ['FixedStringArray'], $I1
.annotate 'line', 4158
# i: $I2
    null $I2
# for loop
.annotate 'line', 4159
    null $I2
 __label_2: # for condition
    ge $I2, $I1, __label_1
.annotate 'line', 4160
# predefined string
    $P4 = $P1[$I2]
    $P3 = $P4.'emit_get'(__ARG_1)
    set $S1, $P3
    $P2[$I2] = $S1
 __label_0: # for iteration
.annotate 'line', 4159
    inc $I2
    goto __label_2
 __label_1: # for end
.annotate 'line', 4161
    .return($P2)
# }
.annotate 'line', 4162

.end # getregs


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4165
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4166
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4167
# auxreg: $S1
    set $S1, '$S0'
.annotate 'line', 4168
    self.'annotate'(__ARG_1)
.annotate 'line', 4169
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 4170
# i: $I2
    set $I2, 2
 __label_2: # for condition
    ge $I2, $I1, __label_1
.annotate 'line', 4171
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'($S1, $P2)
 __label_0: # for iteration
.annotate 'line', 4170
    inc $I2
    goto __label_2
 __label_1: # for end
.annotate 'line', 4172
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
.annotate 'line', 4173

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4176
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4177
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4178
# auxreg: $S1
    $P2 = self.'tempreg'('S')
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 4179
    self.'annotate'(__ARG_1)
.annotate 'line', 4180
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 4181
# i: $I2
    set $I2, 2
 __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 4182
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'($S1, $P2)
 __label_1: # for iteration
.annotate 'line', 4181
    inc $I2
    goto __label_3
 __label_2: # for end
.annotate 'line', 4183
    .return($S1)
# }
.annotate 'line', 4184

.end # emit_get


.sub 'emit_concat_to' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4187
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4188
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4189
    self.'annotate'(__ARG_1)
# for loop
.annotate 'line', 4190
# i: $I2
    null $I2
 __label_2: # for condition
    ge $I2, $I1, __label_1
.annotate 'line', 4191
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'(__ARG_2, $P2)
 __label_0: # for iteration
.annotate 'line', 4190
    inc $I2
    goto __label_2
 __label_1: # for end
# }
.annotate 'line', 4192

.end # emit_concat_to


.sub 'emit_concat_set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4195
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4196
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4197
    self.'annotate'(__ARG_1)
.annotate 'line', 4198
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'(__ARG_2, $P2, $P3)
# for loop
.annotate 'line', 4199
# i: $I2
    set $I2, 2
 __label_2: # for condition
    ge $I2, $I1, __label_1
.annotate 'line', 4200
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'(__ARG_2, $P2)
 __label_0: # for iteration
.annotate 'line', 4199
    inc $I2
    goto __label_2
 __label_1: # for end
# }
.annotate 'line', 4201

.end # emit_concat_set

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ConcatString' ]
.annotate 'line', 4132
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 4134
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
.annotate 'line', 4210
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4211

.end # OpAddExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4214
    self.'optimizearg'()
.annotate 'line', 4215
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4216
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4217
# ltype: $S1
    $P10 = $P1.'checkresult'()
    null $S1
    if_null $P10, __label_0
    set $S1, $P10
 __label_0:
.annotate 'line', 4218
# rtype: $S2
    $P10 = $P2.'checkresult'()
    null $S2
    if_null $P10, __label_1
    set $S2, $P10
 __label_1:
.annotate 'line', 4219
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_3
    $I3 = $P2.'isliteral'()
 __label_3:
    unless $I3 goto __label_2
# {
.annotate 'line', 4220
    iseq $I4, $S1, 'S'
    unless $I4 goto __label_5
    iseq $I4, $S2, 'S'
 __label_5:
    unless $I4 goto __label_4
# {
.annotate 'line', 4225
# var etok: $P3
    getattribute $P3, $P1, 'strval'
.annotate 'line', 4226
# var rtok: $P4
    getattribute $P4, $P2, 'strval'
.annotate 'line', 4227
# var t: $P5
    isa $I3, $P3, [ 'TokenSingleQuoted' ]
    unless $I3 goto __label_8
.annotate 'line', 4228
    isa $I3, $P4, [ 'TokenSingleQuoted' ]
 __label_8:
    unless $I3 goto __label_7
.annotate 'line', 4230
    new $P10, [ 'TokenSingleQuoted' ]
    getattribute $P11, $P3, 'file'
    getattribute $P12, $P3, 'line'
# predefined string
.annotate 'line', 4231
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
.annotate 'line', 4233
    new $P15, [ 'TokenQuoted' ]
    getattribute $P16, $P3, 'file'
    getattribute $P17, $P3, 'line'
# predefined string
.annotate 'line', 4234
    $P18 = $P3.'getasquoted'()
    set $S6, $P18
# predefined string
    $P19 = $P4.'getasquoted'()
    set $S7, $P19
    concat $S8, $S6, $S7
    $P15.'TokenQuoted'($P16, $P17, $S8)
    set $P5, $P15
 __label_6:
.annotate 'line', 4235
    new $P11, [ 'StringLiteral' ]
    getattribute $P12, self, 'owner'
    $P11.'StringLiteral'($P12, $P5)
    set $P10, $P11
    .return($P10)
# }
 __label_4: # endif
.annotate 'line', 4237
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_10
    iseq $I3, $S2, 'I'
 __label_10:
    unless $I3 goto __label_9
# {
.annotate 'line', 4238
# var lval: $P6
    getattribute $P6, $P1, 'numval'
.annotate 'line', 4239
# ln: $I1
    set $P10, $P6
    set $I1, $P10
.annotate 'line', 4240
# var rval: $P7
    getattribute $P7, $P2, 'numval'
.annotate 'line', 4241
# rn: $I2
    set $P10, $P7
    set $I2, $P10
.annotate 'line', 4242
    getattribute $P10, self, 'owner'
    getattribute $P11, self, 'start'
    add $I3, $I1, $I2
    .tailcall 'integerValue'($P10, $P11, $I3)
# }
 __label_9: # endif
# {
.annotate 'line', 4245
    $P10 = 'floatresult'($S1, $S2)
    if_null $P10, __label_11
    unless $P10 goto __label_11
# {
.annotate 'line', 4246
# var lvalf: $P8
    getattribute $P8, $P1, 'numval'
.annotate 'line', 4247
# lf: $N1
# predefined string
    set $S3, $P8
    set $N1, $S3
.annotate 'line', 4248
# var rvalf: $P9
    getattribute $P9, $P2, 'numval'
.annotate 'line', 4249
# rf: $N2
# predefined string
    set $S3, $P9
    set $N2, $S3
.annotate 'line', 4250
    getattribute $P10, self, 'owner'
    getattribute $P11, self, 'start'
    add $N3, $N1, $N2
    .tailcall 'floatValue'($P10, $P11, $N3)
# }
 __label_11: # endif
# }
# }
 __label_2: # endif
.annotate 'line', 4254
    iseq $I3, $S1, 'S'
    unless $I3 goto __label_13
    iseq $I3, $S2, 'S'
 __label_13:
    unless $I3 goto __label_12
# {
.annotate 'line', 4255
    new $P11, [ 'ConcatString' ]
    getattribute $P12, self, 'owner'
    getattribute $P13, self, 'start'
    $P11.'ConcatString'($P12, $P13, $P1, $P2)
    set $P10, $P11
    .return($P10)
# }
 __label_12: # endif
.annotate 'line', 4257
    .return(self)
# }
.annotate 'line', 4258

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4261
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 4262
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 4263
    ne $S1, $S2, __label_2
.annotate 'line', 4264
    .return($S1)
 __label_2: # endif
.annotate 'line', 4265
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_4
    iseq $I1, $S2, 'S'
 __label_4:
    unless $I1 goto __label_3
.annotate 'line', 4266
    .return('S')
 __label_3: # endif
.annotate 'line', 4267
    iseq $I1, $S1, 'S'
    unless $I1 goto __label_6
    iseq $I1, $S2, 'I'
 __label_6:
    unless $I1 goto __label_5
.annotate 'line', 4268
    .return('S')
 __label_5: # endif
.annotate 'line', 4269
    $P1 = 'floatresult'($S1, $S2)
    if_null $P1, __label_7
    unless $P1 goto __label_7
.annotate 'line', 4270
    .return('N')
 __label_7: # endif
.annotate 'line', 4271
    .return('I')
# }
.annotate 'line', 4272

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4275
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4276
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4277
# restype: $S1
    $P3 = self.'checkresult'()
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 4278
# ltype: $S2
    $P3 = $P1.'checkresult'()
    null $S2
    if_null $P3, __label_1
    set $S2, $P3
 __label_1:
.annotate 'line', 4279
# rtype: $S3
    $P3 = $P2.'checkresult'()
    null $S3
    if_null $P3, __label_2
    set $S3, $P3
 __label_2:
.annotate 'line', 4281
# rleft: $S4
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_3
    set $S4, $P3
 __label_3:
.annotate 'line', 4282
# rright: $S5
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S5
    if_null $P3, __label_4
    set $S5, $P3
 __label_4:
.annotate 'line', 4283
    ne $S1, 'S', __label_5
# {
.annotate 'line', 4284
    isne $I1, $S2, 'S'
    if $I1 goto __label_8
    isne $I1, $S3, 'S'
 __label_8:
    unless $I1 goto __label_7
# {
.annotate 'line', 4285
# aux: $S6
    $P3 = self.'tempreg'('S')
    null $S6
    if_null $P3, __label_9
    set $S6, $P3
 __label_9:
.annotate 'line', 4286
    eq $S2, 'S', __label_10
# {
.annotate 'line', 4287
    __ARG_1.'emitset'($S6, $S4)
.annotate 'line', 4288
    set $S4, $S6
# }
    goto __label_11
 __label_10: # else
# {
.annotate 'line', 4291
    __ARG_1.'emitset'($S6, $S5)
.annotate 'line', 4292
    set $S5, $S6
# }
 __label_11: # endif
# }
 __label_7: # endif
.annotate 'line', 4295
    __ARG_1.'emitconcat'(__ARG_2, $S4, $S5)
# }
    goto __label_6
 __label_5: # else
# {
.annotate 'line', 4298
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_14
    isne $I1, $S2, 'I'
    if $I1 goto __label_15
    isne $I1, $S3, 'I'
 __label_15:
 __label_14:
    unless $I1 goto __label_12
# {
.annotate 'line', 4299
# l: $S7
    null $S7
.annotate 'line', 4300
    ne $S2, 'I', __label_16
    set $S7, $S4
    goto __label_17
 __label_16: # else
# {
.annotate 'line', 4302
    $P3 = self.'tempreg'('I')
    set $S7, $P3
.annotate 'line', 4303
    __ARG_1.'emitset'($S7, $S4)
# }
 __label_17: # endif
.annotate 'line', 4305
# r: $S8
    null $S8
.annotate 'line', 4306
    ne $S3, 'I', __label_18
    set $S8, $S5
    goto __label_19
 __label_18: # else
# {
.annotate 'line', 4308
    $P3 = self.'tempreg'('I')
    set $S8, $P3
.annotate 'line', 4309
    __ARG_1.'emitset'($S8, $S5)
# }
 __label_19: # endif
.annotate 'line', 4311
    __ARG_1.'emitadd'(__ARG_2, $S7, $S8)
# }
    goto __label_13
 __label_12: # else
.annotate 'line', 4314
    __ARG_1.'emitadd'(__ARG_2, $S4, $S5)
 __label_13: # endif
# }
 __label_6: # endif
# }
.annotate 'line', 4316

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpAddExpr' ]
.annotate 'line', 4206
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
.annotate 'line', 4325
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4326

.end # OpSubExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4329
    self.'optimizearg'()
.annotate 'line', 4330
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4331
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4332
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_1
    $I3 = $P2.'isliteral'()
 __label_1:
    unless $I3 goto __label_0
# {
.annotate 'line', 4333
# ltype: $S1
    $P5 = $P1.'checkresult'()
    null $S1
    if_null $P5, __label_2
    set $S1, $P5
 __label_2:
.annotate 'line', 4334
# rtype: $S2
    $P5 = $P2.'checkresult'()
    null $S2
    if_null $P5, __label_3
    set $S2, $P5
 __label_3:
.annotate 'line', 4335
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_5
    iseq $I3, $S2, 'I'
 __label_5:
    unless $I3 goto __label_4
# {
.annotate 'line', 4336
# var lval: $P3
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4337
# ln: $I1
    set $P5, $P3
    set $I1, $P5
.annotate 'line', 4338
# var rval: $P4
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4339
# rn: $I2
    set $P5, $P4
    set $I2, $P5
.annotate 'line', 4340
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    sub $I3, $I1, $I2
    .tailcall 'integerValue'($P5, $P6, $I3)
# }
 __label_4: # endif
# }
 __label_0: # endif
.annotate 'line', 4343
    .return(self)
# }
.annotate 'line', 4344

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4347
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 4348
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 4349
    ne $S1, $S2, __label_2
.annotate 'line', 4350
    .return($S1)
 __label_2: # endif
.annotate 'line', 4351
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_4
    iseq $I1, $S2, 'N'
 __label_4:
    unless $I1 goto __label_3
.annotate 'line', 4352
    .return('N')
 __label_3: # endif
.annotate 'line', 4353
    iseq $I1, $S1, 'N'
    unless $I1 goto __label_6
    iseq $I1, $S2, 'I'
 __label_6:
    unless $I1 goto __label_5
.annotate 'line', 4354
    .return('N')
 __label_5: # endif
.annotate 'line', 4355
    .return('I')
# }
.annotate 'line', 4356

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4359
# lreg: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 4360
# rreg: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 4361
    __ARG_1.'emitsub'(__ARG_2, $S1, $S2)
# }
.annotate 'line', 4362

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpSubExpr' ]
.annotate 'line', 4321
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
.annotate 'line', 4371
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4372

.end # OpMulExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4375
    self.'optimizearg'()
.annotate 'line', 4376
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4377
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4378
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_1
    $I3 = $P2.'isliteral'()
 __label_1:
    unless $I3 goto __label_0
# {
.annotate 'line', 4379
# ltype: $S1
    $P7 = $P1.'checkresult'()
    null $S1
    if_null $P7, __label_2
    set $S1, $P7
 __label_2:
.annotate 'line', 4380
# rtype: $S2
    $P7 = $P2.'checkresult'()
    null $S2
    if_null $P7, __label_3
    set $S2, $P7
 __label_3:
.annotate 'line', 4381
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_5
    iseq $I3, $S2, 'I'
 __label_5:
    unless $I3 goto __label_4
# {
.annotate 'line', 4382
# var lval: $P3
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4383
# ln: $I1
    set $P7, $P3
    set $I1, $P7
.annotate 'line', 4384
# var rval: $P4
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4385
# rn: $I2
    set $P7, $P4
    set $I2, $P7
.annotate 'line', 4386
    getattribute $P7, self, 'owner'
    getattribute $P8, self, 'start'
    mul $I3, $I1, $I2
    .tailcall 'integerValue'($P7, $P8, $I3)
# }
 __label_4: # endif
# {
.annotate 'line', 4389
    $P7 = 'floatresult'($S1, $S2)
    if_null $P7, __label_6
    unless $P7 goto __label_6
# {
.annotate 'line', 4390
# var lvalf: $P5
    getattribute $P5, $P1, 'numval'
.annotate 'line', 4391
# lf: $N1
# predefined string
    set $S3, $P5
    set $N1, $S3
.annotate 'line', 4392
# var rvalf: $P6
    getattribute $P6, $P2, 'numval'
.annotate 'line', 4393
# rf: $N2
# predefined string
    set $S3, $P6
    set $N2, $S3
.annotate 'line', 4394
    getattribute $P7, self, 'owner'
    getattribute $P8, self, 'start'
    mul $N3, $N1, $N2
    .tailcall 'floatValue'($P7, $P8, $N3)
# }
 __label_6: # endif
# }
# }
 __label_0: # endif
.annotate 'line', 4398
    .return(self)
# }
.annotate 'line', 4399

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4402
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4403
# rl: $S1
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'checkresult'()
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 4404
# rr: $S2
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'checkresult'()
    null $S2
    if_null $P2, __label_1
    set $S2, $P2
 __label_1:
.annotate 'line', 4405
    ne $S1, $S2, __label_2
.annotate 'line', 4406
    .return($S1)
 __label_2: # endif
.annotate 'line', 4407
    ne $S1, 'S', __label_3
.annotate 'line', 4408
    .return('S')
    goto __label_4
 __label_3: # else
.annotate 'line', 4410
    .return('N')
 __label_4: # endif
# }
.annotate 'line', 4411

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4414
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4415
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4416
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 4417
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_1
    set $S2, $P3
 __label_1:
.annotate 'line', 4418
# lreg: $S3
    null $S3
# rreg: $S4
    null $S4
.annotate 'line', 4419
    ne $S1, 'S', __label_2
# {
.annotate 'line', 4420
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 4421
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 4422
# rval: $S5
    null $S5
.annotate 'line', 4423
    set $S7, $S2
    set $S8, 'I'
    if $S7 == $S8 goto __label_5
    goto __label_4
# switch
 __label_5: # case
.annotate 'line', 4425
    set $S5, $S4
    goto __label_3 # break
 __label_4: # default
.annotate 'line', 4428
    $P3 = self.'tempreg'('I')
    set $S5, $P3
.annotate 'line', 4429
    __ARG_1.'emitset'($S5, $S4)
 __label_3: # switch end
.annotate 'line', 4431
    self.'annotate'(__ARG_1)
.annotate 'line', 4432
    __ARG_1.'emitrepeat'(__ARG_2, $S3, $S5)
.annotate 'line', 4433
    .return()
# }
 __label_2: # endif
.annotate 'line', 4435
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
.annotate 'line', 4436
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 4437
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 4438
    __ARG_1.'emitmul'(__ARG_2, $S3, $S4)
.annotate 'line', 4439
    .return()
# }
 __label_6: # endif
.annotate 'line', 4444
    ne $S1, 'N', __label_10
# {
.annotate 'line', 4445
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 4446
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 4447
# rval: $S6
    null $S6
.annotate 'line', 4448
    set $S7, $S2
    set $S8, 'I'
    if $S7 == $S8 goto __label_13
    set $S8, 'N'
    if $S7 == $S8 goto __label_14
    goto __label_12
# switch
 __label_13: # case
.annotate 'line', 4450
    $P3 = self.'tempreg'('N')
    set $S6, $P3
.annotate 'line', 4451
    __ARG_1.'emitset'($S6, $S4)
.annotate 'line', 4452
    set $S6, $S4
    goto __label_11 # break
 __label_14: # case
.annotate 'line', 4455
    set $S6, $S4
    goto __label_11 # break
 __label_12: # default
.annotate 'line', 4458
    $P4 = self.'tempreg'('N')
    set $S6, $P4
.annotate 'line', 4459
    __ARG_1.'emitset'($S6, $S4)
 __label_11: # switch end
.annotate 'line', 4461
    set $S7, __ARG_2
    eq $S7, '', __label_15
# {
.annotate 'line', 4462
    self.'annotate'(__ARG_1)
.annotate 'line', 4463
    __ARG_1.'emitmul'(__ARG_2, $S3, $S6)
# }
 __label_15: # endif
.annotate 'line', 4465
    .return()
# }
 __label_10: # endif
.annotate 'line', 4468
# nleft: $I1
    null $I1
# nright: $I2
    null $I2
.annotate 'line', 4469
    $P3 = $P1.'issimple'()
    isfalse $I3, $P3
    if $I3 goto __label_18
    $I3 = $P1.'isidentifier'()
 __label_18:
    unless $I3 goto __label_16
# {
.annotate 'line', 4470
    $P5 = self.'checkresult'()
    $P4 = self.'tempreg'($P5)
    set $S3, $P4
.annotate 'line', 4471
    $P1.'emit'(__ARG_1, $S3)
# }
    goto __label_17
 __label_16: # else
# {
.annotate 'line', 4474
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4475
    set $S3, $I1
# }
 __label_17: # endif
.annotate 'line', 4477
    $P3 = $P2.'issimple'()
    isfalse $I3, $P3
    if $I3 goto __label_21
    $I3 = $P2.'isidentifier'()
 __label_21:
    unless $I3 goto __label_19
# {
.annotate 'line', 4478
    $P5 = self.'checkresult'()
    $P4 = self.'tempreg'($P5)
    set $S4, $P4
.annotate 'line', 4479
    $P2.'emit'(__ARG_1, $S4)
# }
    goto __label_20
 __label_19: # else
# {
.annotate 'line', 4482
    set $S7, $S2
    set $S8, 'S'
    if $S7 == $S8 goto __label_24
    set $S8, 'N'
    if $S7 == $S8 goto __label_25
    set $S8, 'I'
    if $S7 == $S8 goto __label_26
    goto __label_23
# switch
 __label_24: # case
.annotate 'line', 4484
    $P4 = self.'checkresult'()
    $P3 = self.'tempreg'($P4)
    set $S4, $P3
.annotate 'line', 4485
    $P2.'emit'(__ARG_1, $S4)
    goto __label_22 # break
 __label_25: # case
.annotate 'line', 4488
    $P5 = $P2.'emit_get'(__ARG_1)
    set $S4, $P5
    goto __label_22 # break
 __label_26: # case
 __label_23: # default
.annotate 'line', 4492
    $P6 = $P2.'getIntegerValue'()
    set $I2, $P6
.annotate 'line', 4493
    set $S4, $I2
    goto __label_22 # break
 __label_22: # switch end
.annotate 'line', 4494
# }
 __label_20: # endif
.annotate 'line', 4497
    self.'annotate'(__ARG_1)
.annotate 'line', 4498
    set $S7, __ARG_2
    ne $S7, '', __label_27
.annotate 'line', 4499
    $P3 = self.'checkresult'()
    __ARG_2 = self.'tempreg'($P3)
 __label_27: # endif
.annotate 'line', 4500
    __ARG_1.'emitmul'(__ARG_2, $S3, $S4)
# }
.annotate 'line', 4501

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpMulExpr' ]
.annotate 'line', 4367
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
.annotate 'line', 4510
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4511

.end # OpDivExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4514
    self.'optimizearg'()
.annotate 'line', 4515
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4516
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4517
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_1
    $I3 = $P2.'isliteral'()
 __label_1:
    unless $I3 goto __label_0
# {
.annotate 'line', 4518
# ltype: $S1
    $P5 = $P1.'checkresult'()
    null $S1
    if_null $P5, __label_2
    set $S1, $P5
 __label_2:
.annotate 'line', 4519
# rtype: $S2
    $P5 = $P2.'checkresult'()
    null $S2
    if_null $P5, __label_3
    set $S2, $P5
 __label_3:
.annotate 'line', 4520
# var lval: $P3
    null $P3
.annotate 'line', 4521
# var rval: $P4
    null $P4
.annotate 'line', 4522
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_5
    iseq $I3, $S2, 'I'
 __label_5:
    unless $I3 goto __label_4
# {
.annotate 'line', 4523
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4524
# ln: $I1
    set $P5, $P3
    set $I1, $P5
.annotate 'line', 4525
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4526
# rn: $I2
    set $P5, $P4
    set $I2, $P5
.annotate 'line', 4527
    eq $I2, 0, __label_6
.annotate 'line', 4528
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
.annotate 'line', 4531
    $P5 = 'floatresult'($S1, $S2)
    if_null $P5, __label_7
    unless $P5 goto __label_7
# {
.annotate 'line', 4532
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4533
# lf: $N1
# predefined string
    set $S3, $P3
    set $N1, $S3
.annotate 'line', 4534
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4535
# rf: $N2
# predefined string
    set $S3, $P4
    set $N2, $S3
.annotate 'line', 4536
    set $N3, 0
    eq $N2, $N3, __label_8
.annotate 'line', 4537
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
.annotate 'line', 4541
    .return(self)
# }
.annotate 'line', 4542

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4545
    .return('N')
# }
.annotate 'line', 4546

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4549
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4550
# var aux: $P2
    null $P2
.annotate 'line', 4551
# var lreg: $P3
    $P3 = $P1.'emit_get'(__ARG_1)
.annotate 'line', 4552
    $P6 = $P1.'checkresult'()
    set $S1, $P6
    eq $S1, 'N', __label_0
# {
.annotate 'line', 4553
    $P2 = self.'tempreg'('N')
.annotate 'line', 4554
    __ARG_1.'emitset'($P2, $P3)
.annotate 'line', 4555
    set $P3, $P2
# }
 __label_0: # endif
.annotate 'line', 4557
# var rexpr: $P4
    getattribute $P4, self, 'rexpr'
.annotate 'line', 4558
# var rreg: $P5
    $P5 = $P4.'emit_get'(__ARG_1)
.annotate 'line', 4559
    $P6 = $P4.'checkresult'()
    set $S1, $P6
    eq $S1, 'N', __label_1
# {
.annotate 'line', 4560
    $P2 = self.'tempreg'('N')
.annotate 'line', 4561
    __ARG_1.'emitset'($P2, $P5)
.annotate 'line', 4562
    set $P5, $P2
# }
 __label_1: # endif
.annotate 'line', 4564
    self.'annotate'(__ARG_1)
.annotate 'line', 4565
    __ARG_1.'emitdiv'(__ARG_2, $P3, $P5)
# }
.annotate 'line', 4566

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpDivExpr' ]
.annotate 'line', 4506
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
.annotate 'line', 4575
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4576

.end # OpModExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4579
# lreg: $S1
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 4580
# rreg: $S2
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 4581
    self.'annotate'(__ARG_1)
.annotate 'line', 4582
    __ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
# }
.annotate 'line', 4583

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4586
    mod $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4587

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpModExpr' ]
.annotate 'line', 4571
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
.annotate 'line', 4596
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4597

.end # OpCModExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4600
    .return('I')
# }
.annotate 'line', 4601

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4604
# lreg: $S1
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 4605
# rreg: $S2
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 4606
    self.'annotate'(__ARG_1)
.annotate 'line', 4611
    __ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
# }
.annotate 'line', 4612

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpCModExpr' ]
.annotate 'line', 4592
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
.annotate 'line', 4621
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4622

.end # OpShiftleftExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4625
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
.annotate 'line', 4626
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
 __label_3:
.annotate 'line', 4627
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_4
    set $S3, $P1
 __label_4:
.annotate 'line', 4628
    self.'annotate'(__ARG_1)
.annotate 'line', 4629
    __ARG_1.'emitbinop'('shl', $S1, $S2, $S3)
# }
.annotate 'line', 4630

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4633
    shl $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4634

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpShiftleftExpr' ]
.annotate 'line', 4617
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
.annotate 'line', 4643
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4644

.end # OpShiftrightExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4647
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
.annotate 'line', 4648
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
 __label_3:
.annotate 'line', 4649
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_4
    set $S3, $P1
 __label_4:
.annotate 'line', 4650
    self.'annotate'(__ARG_1)
.annotate 'line', 4651
    __ARG_1.'emitbinop'('shr', $S1, $S2, $S3)
# }
.annotate 'line', 4652

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4655
    shr $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4656

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpShiftrightExpr' ]
.annotate 'line', 4639
    get_class $P1, [ 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'ArgumentModifierList' ]

.sub 'ArgumentModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4665
    self.'ModifierList'(__ARG_1, __ARG_2)
# }
.annotate 'line', 4666

.end # ArgumentModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4669
# isflat: $I1
    null $I1
# isnamed: $I2
    null $I2
.annotate 'line', 4670
# setname: $S1
    set $S1, ''
.annotate 'line', 4671
    $P3 = self.'getlist'()
    iter $P4, $P3
    set $P4, 0
 __label_0: # for iteration
    unless $P4 goto __label_1
    shift $P1, $P4
# {
.annotate 'line', 4672
# name: $S2
    $P5 = $P1.'getname'()
    null $S2
    if_null $P5, __label_2
    set $S2, $P5
 __label_2:
.annotate 'line', 4673
    ne $S2, 'flat', __label_3
.annotate 'line', 4674
    set $I1, 1
 __label_3: # endif
.annotate 'line', 4675
    ne $S2, 'named', __label_4
# {
.annotate 'line', 4676
    set $I2, 1
.annotate 'line', 4677
    $P3 = $P1.'numargs'()
    set $I3, $P3
    null $I4
    if $I3 == $I4 goto __label_7
    set $I4, 1
    if $I3 == $I4 goto __label_8
    goto __label_6
# switch
 __label_7: # case
    goto __label_5 # break
 __label_8: # case
.annotate 'line', 4681
# var argmod: $P2
    $P2 = $P1.'getarg'(0)
.annotate 'line', 4682
    $P5 = $P2.'isstringliteral'()
    isfalse $I5, $P5
    unless $I5 goto __label_9
.annotate 'line', 4683
    getattribute $P6, self, 'start'
    'SyntaxError'('Invalid modifier', $P6)
 __label_9: # endif
.annotate 'line', 4684
    $P7 = $P2.'getPirString'()
    set $S1, $P7
    goto __label_5 # break
 __label_6: # default
.annotate 'line', 4687
    getattribute $P8, self, 'start'
    'SyntaxError'('Invalid modifier', $P8)
 __label_5: # switch end
# }
 __label_4: # endif
# }
    goto __label_0
 __label_1: # endfor
.annotate 'line', 4691
    unless $I1 goto __label_10
# {
.annotate 'line', 4692
    unless $I2 goto __label_12
.annotate 'line', 4693
    __ARG_1.'print'(' :flat :named')
    goto __label_13
 __label_12: # else
.annotate 'line', 4695
    __ARG_1.'print'(' :flat')
 __label_13: # endif
# }
    goto __label_11
 __label_10: # else
.annotate 'line', 4697
    unless $I2 goto __label_14
# {
.annotate 'line', 4698
    __ARG_1.'print'(' :named')
.annotate 'line', 4699
    eq $S1, '', __label_15
.annotate 'line', 4700
    __ARG_1.'print'("(", $S1, ")")
 __label_15: # endif
# }
 __label_14: # endif
 __label_11: # endif
# }
.annotate 'line', 4702

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ArgumentModifierList' ]
.annotate 'line', 4661
    get_class $P1, [ 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'Argument' ]

.sub 'Argument' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4711
    setattribute self, 'arg', __ARG_1
.annotate 'line', 4712
    setattribute self, 'modifiers', __ARG_2
# }
.annotate 'line', 4713

.end # Argument


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4716
    getattribute $P3, self, 'arg'
    $P2 = $P3.'optimize'()
    setattribute self, 'arg', $P2
.annotate 'line', 4717
    .return(self)
# }
.annotate 'line', 4718

.end # optimize


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 4721
    getattribute $P1, self, 'arg'
    .tailcall $P1.'hascompilevalue'()
# }
.annotate 'line', 4722

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Argument' ]
.annotate 'line', 4707
    addattribute $P0, 'arg'
.annotate 'line', 4708
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
.annotate 'line', 4734
    setattribute self, 'owner', __ARG_1
.annotate 'line', 4735
    setattribute self, 'start', __ARG_2
.annotate 'line', 4736
# var args: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 4737
# var t: $P2
    $P2 = __ARG_3.'get'()
.annotate 'line', 4738
    $P5 = $P2.'isop'(__ARG_4)
    isfalse $I1, $P5
    unless $I1 goto __label_0
# {
.annotate 'line', 4739
    __ARG_3.'unget'($P2)
 __label_1: # do
.annotate 'line', 4740
# {
.annotate 'line', 4741
# var modifier: $P3
    null $P3
.annotate 'line', 4742
# var expr: $P4
    $P4 = 'parseExpr'(__ARG_3, __ARG_1)
.annotate 'line', 4743
    $P2 = __ARG_3.'get'()
.annotate 'line', 4744
    $P5 = $P2.'isop'(':')
    if_null $P5, __label_4
    unless $P5 goto __label_4
# {
.annotate 'line', 4745
    $P2 = __ARG_3.'get'()
.annotate 'line', 4746
    $P5 = $P2.'isop'('[')
    if_null $P5, __label_5
    unless $P5 goto __label_5
# {
.annotate 'line', 4747
    new $P6, [ 'ArgumentModifierList' ]
    $P6.'ArgumentModifierList'(__ARG_3, __ARG_1)
    set $P3, $P6
.annotate 'line', 4748
    $P2 = __ARG_3.'get'()
# }
    goto __label_6
 __label_5: # else
.annotate 'line', 4751
    'Expected'('modifier list', $P2)
 __label_6: # endif
# }
 __label_4: # endif
.annotate 'line', 4753
    new $P6, [ 'Argument' ]
    $P6.'Argument'($P4, $P3)
    set $P5, $P6
# predefined push
    push $P1, $P5
# }
 __label_3: # continue
.annotate 'line', 4754
    $P5 = $P2.'isop'(',')
    if_null $P5, __label_2
    if $P5 goto __label_1
 __label_2: # enddo
.annotate 'line', 4755
    $P5 = $P2.'isop'(__ARG_4)
    isfalse $I1, $P5
    unless $I1 goto __label_7
.annotate 'line', 4756
    'SyntaxError'("Unfinished argument list", $P2)
 __label_7: # endif
.annotate 'line', 4757
# predefined elements
    elements $I1, $P1
    le $I1, 0, __label_8
.annotate 'line', 4758
    setattribute self, 'args', $P1
 __label_8: # endif
# }
 __label_0: # endif
# }
.annotate 'line', 4760

.end # ArgumentList


.sub 'numargs' :method
# Body
# {
.annotate 'line', 4763
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4764
    unless_null $P1, __label_1
    null $I1
    goto __label_0
 __label_1:
# predefined elements
    elements $I1, $P1
 __label_0:
    .return($I1)
# }
.annotate 'line', 4765

.end # numargs


.sub 'getrawargs' :method
# Body
# {
.annotate 'line', 4768
    getattribute $P1, self, 'args'
    .return($P1)
# }
.annotate 'line', 4769

.end # getrawargs


.sub 'getarg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 4772
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4773
    $P2 = $P1[__ARG_1]
    .return($P2)
# }
.annotate 'line', 4774

.end # getarg


.sub 'getfreearg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 4777
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4778
    $P2 = $P1[__ARG_1]
    getattribute $P3, $P2, 'arg'
    .return($P3)
# }
.annotate 'line', 4779

.end # getfreearg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4782
    getattribute $P1, self, 'args'
    'optimize_array'($P1)
.annotate 'line', 4783
    .return(self)
# }
.annotate 'line', 4784

.end # optimize


.sub 'getargvalues' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4787
# var argregs: $P1
    getattribute $P1, self, 'argregs'
.annotate 'line', 4788
    unless_null $P1, __label_0
# {
.annotate 'line', 4789
    new $P2, ['ResizableStringArray']
.annotate 'line', 4790
# pnull: $S1
    set $S1, ''
.annotate 'line', 4791
    set $P1, $P2
.annotate 'line', 4792
# var args: $P3
    getattribute $P3, self, 'args'
.annotate 'line', 4793
# nargs: $I1
# predefined elements
    elements $I1, $P3
# for loop
.annotate 'line', 4794
# i: $I2
    null $I2
 __label_3: # for condition
    ge $I2, $I1, __label_2
# {
.annotate 'line', 4795
# var a: $P4
    $P5 = $P3[$I2]
    getattribute $P4, $P5, 'arg'
.annotate 'line', 4796
# reg: $S2
    null $S2
.annotate 'line', 4797
    $P5 = $P4.'isnull'()
    if_null $P5, __label_4
    unless $P5 goto __label_4
# {
.annotate 'line', 4799
    ne $S1, '', __label_6
# {
.annotate 'line', 4800
    getattribute $P7, self, 'owner'
    $P6 = $P7.'tempreg'('P')
    set $S1, $P6
.annotate 'line', 4801
    __ARG_1.'emitnull'($S1)
# }
 __label_6: # endif
.annotate 'line', 4803
    set $S2, $S1
# }
    goto __label_5
 __label_4: # else
.annotate 'line', 4806
    $P5 = $P4.'emit_get'(__ARG_1)
    set $S2, $P5
 __label_5: # endif
.annotate 'line', 4807
# predefined push
    push $P1, $S2
# }
 __label_1: # for iteration
.annotate 'line', 4794
    inc $I2
    goto __label_3
 __label_2: # for end
.annotate 'line', 4809
    setattribute self, 'argregs', $P1
# }
 __label_0: # endif
.annotate 'line', 4811
    .return($P1)
# }
.annotate 'line', 4812

.end # getargvalues


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4815
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4816
# var argreg: $P2
    $P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 4818
# sep: $S1
    set $S1, ''
.annotate 'line', 4819
# n: $I1
    $P4 = self.'numargs'()
    set $I1, $P4
# for loop
.annotate 'line', 4820
# i: $I2
    null $I2
 __label_2: # for condition
    ge $I2, $I1, __label_1
# {
.annotate 'line', 4821
# a: $S2
    $S2 = $P2[$I2]
.annotate 'line', 4822
    __ARG_1.'print'($S1, $S2)
.annotate 'line', 4823
# var modifiers: $P3
    $P4 = $P1[$I2]
    getattribute $P3, $P4, 'modifiers'
.annotate 'line', 4824
    if_null $P3, __label_3
.annotate 'line', 4825
    $P3.'emitmodifiers'(__ARG_1)
 __label_3: # endif
.annotate 'line', 4826
    set $S1, ', '
# }
 __label_0: # for iteration
.annotate 'line', 4820
    inc $I2
    goto __label_2
 __label_1: # for end
# }
.annotate 'line', 4828

.end # emitargs

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ArgumentList' ]
.annotate 'line', 4727
    addattribute $P0, 'owner'
.annotate 'line', 4728
    addattribute $P0, 'start'
.annotate 'line', 4729
    addattribute $P0, 'args'
.annotate 'line', 4730
    addattribute $P0, 'argregs'
.end
.namespace [ ]

.sub 'arglist_hascompilevalue'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4833
    iter $P2, __ARG_1
    set $P2, 0
 __label_0: # for iteration
    unless $P2 goto __label_1
    shift $P1, $P2
.annotate 'line', 4834
    $P3 = $P1.'hascompilevalue'()
    isfalse $I1, $P3
    unless $I1 goto __label_2
.annotate 'line', 4835
    .return(0)
 __label_2: # endif
    goto __label_0
 __label_1: # endfor
.annotate 'line', 4836
    .return(1)
# }
.annotate 'line', 4837

.end # arglist_hascompilevalue

.namespace [ 'CallPredefExpr' ]

.sub 'CallPredefExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4848
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 4849
    setattribute self, 'predef', __ARG_3
.annotate 'line', 4850
    setattribute self, 'args', __ARG_4
# }
.annotate 'line', 4851

.end # CallPredefExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4854
    getattribute $P1, self, 'predef'
    .tailcall $P1.'result'()
# }
.annotate 'line', 4855

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4858
# var predef: $P1
    getattribute $P1, self, 'predef'
.annotate 'line', 4859
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 4860
    new $P3, ['ResizableStringArray']
.annotate 'line', 4861
# var arg: $P4
    null $P4
.annotate 'line', 4862
# np: $I1
    $P6 = $P1.'params'()
    set $I1, $P6
.annotate 'line', 4863
# pnull: $S1
    set $S1, ''
.annotate 'line', 4864
    set $I4, $I1
    set $I5, -1
    if $I4 == $I5 goto __label_2
    set $I5, -2
    if $I4 == $I5 goto __label_3
    goto __label_1
# switch
 __label_2: # case
.annotate 'line', 4866
    iter $P7, $P2
    set $P7, 0
 __label_4: # for iteration
    unless $P7 goto __label_5
    shift $P4, $P7
# {
.annotate 'line', 4867
# reg: $S2
    getattribute $P8, $P4, 'arg'
    $P6 = $P8.'emit_get'(__ARG_1)
    null $S2
    if_null $P6, __label_6
    set $S2, $P6
 __label_6:
.annotate 'line', 4869
    ne $S2, 'null', __label_7
# {
.annotate 'line', 4870
    ne $S1, '', __label_8
# {
.annotate 'line', 4871
    $P6 = self.'tempreg'('P')
    set $S1, $P6
.annotate 'line', 4872
    __ARG_1.'emitnull'($S1)
# }
 __label_8: # endif
.annotate 'line', 4874
    set $S2, $S1
# }
 __label_7: # endif
.annotate 'line', 4876
# predefined push
    push $P3, $S2
# }
    goto __label_4
 __label_5: # endfor
    goto __label_0 # break
 __label_3: # case
.annotate 'line', 4880
# var rawargs: $P5
    root_new $P5, ['parrot';'ResizablePMCArray']
.annotate 'line', 4881
    iter $P9, $P2
    set $P9, 0
 __label_9: # for iteration
    unless $P9 goto __label_10
    shift $P4, $P9
.annotate 'line', 4882
    getattribute $P8, $P4, 'arg'
# predefined push
    push $P5, $P8
    goto __label_9
 __label_10: # endfor
.annotate 'line', 4883
    getattribute $P10, self, 'predef'
    getattribute $P11, self, 'start'
    $P10.'expand'(__ARG_1, self, $P11, __ARG_2, $P5)
.annotate 'line', 4884
    .return()
 __label_1: # default
.annotate 'line', 4886
# n: $I2
    getattribute $P12, self, 'args'
    set $I2, $P12
# for loop
.annotate 'line', 4887
# i: $I3
    null $I3
 __label_13: # for condition
    ge $I3, $I2, __label_12
# {
.annotate 'line', 4888
    $P13 = $P2[$I3]
    getattribute $P4, $P13, 'arg'
.annotate 'line', 4889
# argtype: $S3
    $P6 = $P4.'checkresult'()
    null $S3
    if_null $P6, __label_14
    set $S3, $P6
 __label_14:
.annotate 'line', 4890
# paramtype: $S4
    $P6 = $P1.'paramtype'($I3)
    null $S4
    if_null $P6, __label_15
    set $S4, $P6
 __label_15:
.annotate 'line', 4891
# argr: $S5
    null $S5
.annotate 'line', 4892
    $P6 = $P4.'isnull'()
    if_null $P6, __label_16
    unless $P6 goto __label_16
# {
.annotate 'line', 4893
    set $S7, $S4
    set $S8, 'I'
    if $S7 == $S8 goto __label_20
    set $S8, 'N'
    if $S7 == $S8 goto __label_21
    set $S8, 'S'
    if $S7 == $S8 goto __label_22
    goto __label_19
# switch
 __label_20: # case
 __label_21: # case
 __label_22: # case
.annotate 'line', 4897
    $P8 = self.'tempreg'($S4)
    set $S5, $P8
.annotate 'line', 4898
    __ARG_1.'emitnull'($S5)
    goto __label_18 # break
 __label_19: # default
.annotate 'line', 4901
    ne $S1, '', __label_23
# {
.annotate 'line', 4902
    $P10 = self.'tempreg'('P')
    set $S1, $P10
.annotate 'line', 4903
    __ARG_1.'emitnull'($S1)
# }
 __label_23: # endif
.annotate 'line', 4905
    set $S5, $S1
 __label_18: # switch end
# }
    goto __label_17
 __label_16: # else
# {
.annotate 'line', 4909
    iseq $I4, $S3, $S4
    if $I4 goto __label_26
    iseq $I4, $S4, '?'
 __label_26:
    unless $I4 goto __label_24
.annotate 'line', 4910
    $P6 = $P4.'emit_get'(__ARG_1)
    set $S5, $P6
    goto __label_25
 __label_24: # else
# {
.annotate 'line', 4912
# aux: $S6
    null $S6
.annotate 'line', 4913
    $P6 = self.'tempreg'($S4)
    set $S5, $P6
.annotate 'line', 4914
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
# switch
 __label_29: # case
.annotate 'line', 4916
    set $S9, $S3
    set $S10, 'I'
    if $S9 == $S10 goto __label_35
    set $S10, 'N'
    if $S9 == $S10 goto __label_36
    set $S10, 'S'
    if $S9 == $S10 goto __label_37
    goto __label_34
# switch
 __label_35: # case
 __label_36: # case
 __label_37: # case
.annotate 'line', 4920
    $P6 = $P4.'emit_get'(__ARG_1)
    set $S6, $P6
.annotate 'line', 4921
    __ARG_1.'emitbox'($S5, $S6)
    goto __label_33 # break
 __label_34: # default
.annotate 'line', 4924
    $P4.'emit'(__ARG_1, $S5)
 __label_33: # switch end
    goto __label_27 # break
 __label_30: # case
 __label_31: # case
 __label_32: # case
.annotate 'line', 4930
    $P8 = $P4.'emit_get'(__ARG_1)
    set $S6, $P8
.annotate 'line', 4931
    __ARG_1.'emitset'($S5, $S6)
    goto __label_27 # break
 __label_28: # default
.annotate 'line', 4934
    $P4.'emit'(__ARG_1, $S5)
 __label_27: # switch end
# }
 __label_25: # endif
# }
 __label_17: # endif
.annotate 'line', 4938
# predefined push
    push $P3, $S5
# }
 __label_11: # for iteration
.annotate 'line', 4887
    inc $I3
    goto __label_13
 __label_12: # for end
 __label_0: # switch end
.annotate 'line', 4941
    getattribute $P6, self, 'predef'
    getattribute $P8, self, 'start'
    $P6.'expand'(__ARG_1, self, $P8, __ARG_2, $P3)
# }
.annotate 'line', 4942

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CallPredefExpr' ]
.annotate 'line', 4841
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 4843
    addattribute $P0, 'predef'
.annotate 'line', 4844
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
.annotate 'line', 4954
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 4955
    setattribute self, 'funref', __ARG_4
.annotate 'line', 4956
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 4957
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_0
# {
.annotate 'line', 4958
    __ARG_1.'unget'($P1)
.annotate 'line', 4959
    new $P4, [ 'ArgumentList' ]
    $P4.'ArgumentList'(__ARG_2, __ARG_3, __ARG_1, ')')
    set $P3, $P4
    setattribute self, 'args', $P3
# }
 __label_0: # endif
# }
.annotate 'line', 4961

.end # CallExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4962
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4965
# var funref: $P1
    getattribute $P6, self, 'funref'
    $P1 = $P6.'optimize'()
.annotate 'line', 4966
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 4967
# nargs: $I1
    null $I1
.annotate 'line', 4968
    if_null $P2, __label_0
# {
.annotate 'line', 4969
    $P2 = $P2.'optimize'()
.annotate 'line', 4970
    $P6 = $P2.'numargs'()
    set $I1, $P6
# }
 __label_0: # endif
.annotate 'line', 4973
    isa $I2, $P1, [ 'MemberExpr' ]
    unless $I2 goto __label_1
.annotate 'line', 4974
    new $P7, [ 'CallMemberExpr' ]
    $P7.'CallMemberExpr'(self, $P1, $P2)
    set $P6, $P7
    .return($P6)
 __label_1: # endif
.annotate 'line', 4975
    isa $I2, $P1, [ 'MemberRefExpr' ]
    unless $I2 goto __label_2
.annotate 'line', 4976
    new $P7, [ 'CallMemberRefExpr' ]
    $P7.'CallMemberRefExpr'(self, $P1, $P2)
    set $P6, $P7
    .return($P6)
 __label_2: # endif
.annotate 'line', 4979
    $P6 = $P1.'isidentifier'()
    if_null $P6, __label_3
    unless $P6 goto __label_3
# {
.annotate 'line', 4980
# call: $S1
    $P7 = $P1.'getName'()
    null $S1
    if_null $P7, __label_4
    set $S1, $P7
 __label_4:
.annotate 'line', 4981
# var predef: $P3
    $P3 = 'findpredef'($S1, $I1)
.annotate 'line', 4982
    if_null $P3, __label_5
# {
.annotate 'line', 4983
    self.'use_predef'($S1)
.annotate 'line', 4984
# var rawargs: $P4
    ne $I1, 0, __label_7
    root_new $P6, ['parrot';'ResizablePMCArray']
    set $P4, $P6
    goto __label_6
 __label_7:
    $P4 = $P2.'getrawargs'()
 __label_6:
.annotate 'line', 4987
    isa $I2, $P3, [ 'PredefFunctionEval' ]
    unless $I2 goto __label_8
# {
.annotate 'line', 4988
    $P6 = 'arglist_hascompilevalue'($P4)
    if_null $P6, __label_9
    unless $P6 goto __label_9
# {
.annotate 'line', 4989
# var evalfun: $P5
    getattribute $P5, $P3, 'evalfun'
.annotate 'line', 4990
    getattribute $P6, self, 'owner'
    getattribute $P7, self, 'start'
    .tailcall $P5($P6, $P7, $P4)
# }
 __label_9: # endif
# }
 __label_8: # endif
.annotate 'line', 4994
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
.annotate 'line', 4998
    setattribute self, 'funref', $P1
.annotate 'line', 4999
    setattribute self, 'args', $P2
.annotate 'line', 5000
    .return(self)
# }
.annotate 'line', 5001

.end # optimize


.sub 'cantailcall' :method
# Body
# {
.annotate 'line', 5004
    .return(1)
# }
.annotate 'line', 5005

.end # cantailcall


.sub 'emitcall' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5008
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 5009
# call: $S1
    null $S1
.annotate 'line', 5010
    $P2 = $P1.'isidentifier'()
    if_null $P2, __label_0
    unless $P2 goto __label_0
# {
.annotate 'line', 5011
    $P3 = $P1.'checkIdentifier'()
    set $S1, $P3
.annotate 'line', 5012
    ne $S1, '', __label_2
.annotate 'line', 5013
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
.annotate 'line', 5016
    $P2 = $P1.'emit_get'(__ARG_1)
    set $S1, $P2
 __label_1: # endif
.annotate 'line', 5017
    .return($S1)
# }
.annotate 'line', 5018

.end # emitcall


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5021
    __ARG_1.'print'('(')
.annotate 'line', 5022
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5023
    if_null $P1, __label_0
.annotate 'line', 5024
    $P1.'emitargs'(__ARG_1)
 __label_0: # endif
.annotate 'line', 5025
    __ARG_1.'say'(')')
# }
.annotate 'line', 5026

.end # emitargs


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5029
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 5030
# call: $S1
    $P3 = self.'emitcall'(__ARG_1)
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 5031
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 5032
    if_null $P2, __label_1
.annotate 'line', 5033
    $P2.'getargvalues'(__ARG_1)
 __label_1: # endif
.annotate 'line', 5035
    self.'annotate'(__ARG_1)
.annotate 'line', 5037
    __ARG_1.'print'('    ')
.annotate 'line', 5038
    isnull $I1, __ARG_2
    not $I1
    unless $I1 goto __label_3
    set $S2, __ARG_2
    isne $I1, $S2, ''
 __label_3:
    unless $I1 goto __label_2
# {
.annotate 'line', 5039
    set $S3, __ARG_2
    ne $S3, '.tailcall', __label_4
.annotate 'line', 5040
    __ARG_1.'print'('.tailcall ')
    goto __label_5
 __label_4: # else
.annotate 'line', 5042
    __ARG_1.'print'(__ARG_2, ' = ')
 __label_5: # endif
# }
 __label_2: # endif
.annotate 'line', 5045
    __ARG_1.'print'($S1)
.annotate 'line', 5046
    self.'emitargs'(__ARG_1)
# }
.annotate 'line', 5047

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CallExpr' ]
.annotate 'line', 4947
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 4949
    addattribute $P0, 'funref'
.annotate 'line', 4950
    addattribute $P0, 'args'
.end
.namespace [ 'CallMemberExpr' ]

.sub 'CallMemberExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5059
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 5060
    setattribute self, 'funref', __ARG_2
.annotate 'line', 5061
    setattribute self, 'args', __ARG_3
# }
.annotate 'line', 5062

.end # CallMemberExpr


.sub 'emitcall' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5065
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 5066
    root_new $P2, ['parrot';'ResizablePMCArray']
    $P4 = $P1.'emit_left_get'(__ARG_1)
    push $P2, $P4
    box $P3, ".'"
    push $P2, $P3
.annotate 'line', 5067
    $P5 = $P1.'get_member'()
.annotate 'line', 5066
    push $P2, $P5
    box $P3, "'"
    push $P2, $P3
# predefined join
    join $S1, "", $P2
    .return($S1)
# }
.annotate 'line', 5068

.end # emitcall

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CallMemberExpr' ]
.annotate 'line', 5055
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
.annotate 'line', 5078
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 5079
    setattribute self, 'funref', __ARG_2
.annotate 'line', 5080
    setattribute self, 'args', __ARG_3
# }
.annotate 'line', 5081

.end # CallMemberRefExpr


.sub 'emitcall' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5084
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 5085
# var right: $P2
    getattribute $P2, $P1, 'right'
.annotate 'line', 5086
# var type: $P3
    $P3 = $P2.'checkresult'()
.annotate 'line', 5087
    set $S3, $P3
    isne $I1, $S3, 'P'
    unless $I1 goto __label_1
    set $S4, $P3
    isne $I1, $S4, 'S'
 __label_1:
    unless $I1 goto __label_0
.annotate 'line', 5088
    getattribute $P4, $P1, 'start'
    'SyntaxError'("Invalid expression type in '.*'", $P4)
 __label_0: # endif
.annotate 'line', 5091
# lreg: $S1
    $P4 = $P1.'emit_left_get'(__ARG_1)
    null $S1
    if_null $P4, __label_2
    set $S1, $P4
 __label_2:
.annotate 'line', 5092
# rreg: $S2
    $P4 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_3
    set $S2, $P4
 __label_3:
.annotate 'line', 5093
    concat $S3, $S1, '.'
    concat $S3, $S3, $S2
    .return($S3)
# }
.annotate 'line', 5094

.end # emitcall

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CallMemberRefExpr' ]
.annotate 'line', 5074
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
.annotate 'line', 5104
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5105
    setattribute self, 'left', __ARG_3
# }
.annotate 'line', 5106

.end # MemberExprBase


.sub 'emit_left_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5109
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5110
# type: $S1
    $P2 = $P1.'checkresult'()
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 5111
# reg: $S2
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S2
    if_null $P2, __label_1
    set $S2, $P2
 __label_1:
.annotate 'line', 5112
    eq $S1, 'P', __label_2
# {
.annotate 'line', 5113
# auxreg: $S3
    set $S3, $S2
.annotate 'line', 5114
    $P2 = self.'tempreg'('P')
    set $S2, $P2
.annotate 'line', 5115
    __ARG_1.'emitbox'($S2, $S3)
# }
 __label_2: # endif
.annotate 'line', 5117
    .return($S2)
# }
.annotate 'line', 5118

.end # emit_left_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MemberExprBase' ]
.annotate 'line', 5099
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5101
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
.annotate 'line', 5127
    self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5128
    setattribute self, 'right', __ARG_4
# }
.annotate 'line', 5129

.end # MemberExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5130
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5133
    getattribute $P3, self, 'left'
    $P2 = $P3.'optimize'()
    setattribute self, 'left', $P2
.annotate 'line', 5134
    .return(self)
# }
.annotate 'line', 5135

.end # optimize


.sub 'get_member' :method
# Body
# {
.annotate 'line', 5138
    getattribute $P1, self, 'right'
    .return($P1)
# }
.annotate 'line', 5139

.end # get_member


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5142
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 5143
# ident: $S2
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 5144
# result: $S3
    $P1 = self.'tempreg'('P')
    null $S3
    if_null $P1, __label_2
    set $S3, $P1
 __label_2:
.annotate 'line', 5145
    self.'annotate'(__ARG_1)
.annotate 'line', 5146
    __ARG_1.'say'('    ', 'getattribute ', $S3, ', ', $S1, ", '", $S2, "'")
.annotate 'line', 5147
    .return($S3)
# }
.annotate 'line', 5148

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5151
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 5152
# ident: $S2
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 5153
    self.'annotate'(__ARG_1)
.annotate 'line', 5154
    __ARG_1.'say'('    ', 'getattribute ', __ARG_2, ', ', $S1, ", '", $S2, "'")
# }
.annotate 'line', 5155

.end # emit


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5158
    self.'emit'(__ARG_1, __ARG_2)
# }
.annotate 'line', 5159

.end # emit_init


.sub 'emit_assign' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5162
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 5163
# ident: $S2
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 5164
# value: $S3
    null $S3
.annotate 'line', 5165
    ne __ARG_2, 'P', __label_2
# {
.annotate 'line', 5167
    ne __ARG_3, 'null', __label_4
# {
.annotate 'line', 5168
    $P1 = self.'tempreg'('P')
    set __ARG_3, $P1
.annotate 'line', 5169
    __ARG_1.'emitnull'(__ARG_3)
# }
 __label_4: # endif
.annotate 'line', 5171
    set $S3, __ARG_3
# }
    goto __label_3
 __label_2: # else
# {
.annotate 'line', 5174
    $P1 = self.'tempreg'('P')
    set $S3, $P1
.annotate 'line', 5175
    __ARG_1.'emitbox'($S3, __ARG_3)
# }
 __label_3: # endif
.annotate 'line', 5177
    __ARG_1.'say'('    ', "setattribute ", $S1, ", '", $S2, "', ", $S3)
# }
.annotate 'line', 5178

.end # emit_assign


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5181
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 5182
# ident: $S2
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 5183
# value: $S3
    $P1 = self.'tempreg'('P')
    null $S3
    if_null $P1, __label_2
    set $S3, $P1
 __label_2:
.annotate 'line', 5184
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_3
    unless $P1 goto __label_3
.annotate 'line', 5185
    __ARG_1.'emitnull'($S3)
    goto __label_4
 __label_3: # else
# {
.annotate 'line', 5187
# rreg: $S4
    $P2 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P2, __label_5
    set $S4, $P2
 __label_5:
.annotate 'line', 5188
    $P1 = __ARG_2.'checkresult'()
    set $S5, $P1
    eq $S5, 'P', __label_6
.annotate 'line', 5189
    __ARG_1.'emitbox'($S3, $S4)
    goto __label_7
 __label_6: # else
.annotate 'line', 5191
    set $S3, $S4
 __label_7: # endif
# }
 __label_4: # endif
.annotate 'line', 5193
    __ARG_1.'say'('    ', "setattribute ", $S1, ", '", $S2, "', ", $S3)
.annotate 'line', 5194
    .return($S3)
# }
.annotate 'line', 5195

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MemberExpr' ]
.annotate 'line', 5121
    get_class $P1, [ 'MemberExprBase' ]
    addparent $P0, $P1
.annotate 'line', 5123
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
.annotate 'line', 5205
    self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5206
    setattribute self, 'right', __ARG_4
# }
.annotate 'line', 5207

.end # MemberRefExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5208
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5211
    getattribute $P3, self, 'left'
    $P2 = $P3.'optimize'()
    setattribute self, 'left', $P2
.annotate 'line', 5212
    getattribute $P3, self, 'right'
    $P2 = $P3.'optimize'()
    setattribute self, 'right', $P2
.annotate 'line', 5213
    .return(self)
# }
.annotate 'line', 5214

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5218
    getattribute $P1, self, 'start'
.annotate 'line', 5217
    'SyntaxError'('Member reference can be used only for method calls', $P1)
# }
.annotate 'line', 5219

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MemberRefExpr' ]
.annotate 'line', 5200
    get_class $P1, [ 'MemberExprBase' ]
    addparent $P0, $P1
.annotate 'line', 5202
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
.annotate 'line', 5232
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5233
    setattribute self, 'left', __ARG_4
.annotate 'line', 5234
    self.'parseargs'(__ARG_1, __ARG_2, ']')
# }
.annotate 'line', 5235

.end # IndexExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5238
    getattribute $P2, self, 'left'
    $P1 = $P2.'checkresult'()
    set $S1, $P1
    ne $S1, 'S', __label_0
.annotate 'line', 5239
    .return('S')
    goto __label_1
 __label_0: # else
.annotate 'line', 5241
    .return('P')
 __label_1: # endif
# }
.annotate 'line', 5242

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5245
# var left: $P1
    getattribute $P4, self, 'left'
    $P1 = $P4.'optimize'()
.annotate 'line', 5246
    setattribute self, 'left', $P1
.annotate 'line', 5247
    self.'optimizeargs'()
.annotate 'line', 5251
    $I2 = $P1.'isstringliteral'()
    unless $I2 goto __label_1
    $P4 = self.'numargs'()
    set $I3, $P4
    iseq $I2, $I3, 1
 __label_1:
    unless $I2 goto __label_0
# {
.annotate 'line', 5252
# var arg: $P2
    $P2 = self.'getarg'(0)
.annotate 'line', 5253
    $P4 = $P2.'isintegerliteral'()
    if_null $P4, __label_2
    unless $P4 goto __label_2
# {
.annotate 'line', 5254
# ival: $I1
    $P5 = $P2.'getIntegerValue'()
    set $I1, $P5
.annotate 'line', 5255
# sval: $S1
    $P4 = $P1.'get_value'()
    null $S1
    if_null $P4, __label_3
    set $S1, $P4
 __label_3:
.annotate 'line', 5256
# var t: $P3
    new $P3, [ 'TokenQuoted' ]
    getattribute $P4, self, 'start'
    getattribute $P5, $P4, 'file'
    getattribute $P6, self, 'start'
    getattribute $P7, $P6, 'line'
.annotate 'line', 5257
# predefined substr
    substr $S2, $S1, $I1, 1
    $P3.'TokenQuoted'($P5, $P7, $S2)
.annotate 'line', 5258
    new $P5, [ 'StringLiteral' ]
    getattribute $P6, self, 'owner'
    $P5.'StringLiteral'($P6, $P3)
    set $P4, $P5
    .return($P4)
# }
 __label_2: # endif
# }
 __label_0: # endif
.annotate 'line', 5261
    .return(self)
# }
.annotate 'line', 5262

.end # optimize


.sub 'emit_prep' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5265
# var regleft: $P1
    getattribute $P1, self, 'regleft'
.annotate 'line', 5266
# var argregs: $P2
    getattribute $P2, self, 'argregs'
.annotate 'line', 5267
    isnull $I1, $P1
    not $I1
    if $I1 goto __label_1
    isnull $I1, $P2
    not $I1
 __label_1:
    unless $I1 goto __label_0
.annotate 'line', 5268
    getattribute $P3, self, 'start'
    'InternalError'('wrong call to IndexExpr.emit_args', $P3)
 __label_0: # endif
.annotate 'line', 5269
    getattribute $P4, self, 'left'
    $P3 = $P4.'isidentifier'()
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 5270
    getattribute $P5, self, 'left'
    $P1 = $P5.'getIdentifier'()
    goto __label_3
 __label_2: # else
.annotate 'line', 5272
    getattribute $P6, self, 'left'
    $P1 = $P6.'emit_get'(__ARG_1)
 __label_3: # endif
.annotate 'line', 5273
    setattribute self, 'regleft', $P1
.annotate 'line', 5274
    $P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 5275
    setattribute self, 'argregs', $P2
# }
.annotate 'line', 5276

.end # emit_prep


.sub 'emit_aux' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5279
# var regleft: $P1
    getattribute $P1, self, 'regleft'
.annotate 'line', 5280
# var argregs: $P2
    getattribute $P2, self, 'argregs'
.annotate 'line', 5281
    isnull $I1, $P1
    if $I1 goto __label_1
    isnull $I1, $P2
 __label_1:
    unless $I1 goto __label_0
.annotate 'line', 5282
    getattribute $P3, self, 'start'
    'InternalError'('wrong call to IndexExpr.emit_aux', $P3)
 __label_0: # endif
.annotate 'line', 5283
    getattribute $P3, self, 'regleft'
    __ARG_1.'print'($P3, '[')
.annotate 'line', 5284
    getattribute $P3, self, 'argregs'
# predefined join
    join $S1, '; ', $P3
    __ARG_1.'print'($S1)
.annotate 'line', 5285
    __ARG_1.'print'(']')
# }
.annotate 'line', 5286

.end # emit_aux


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5289
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5290
# type: $S1
    $P2 = self.'checkresult'()
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 5291
    ne $S1, 'S', __label_1
# {
.annotate 'line', 5292
# var argregs: $P1
    getattribute $P1, self, 'argregs'
.annotate 'line', 5293
# nargs: $I1
    getattribute $P2, self, 'argregs'
# predefined elements
    elements $I1, $P2
.annotate 'line', 5294
    eq $I1, 1, __label_3
.annotate 'line', 5295
    getattribute $P2, self, 'start'
    'SyntaxError'('Bad string index', $P2)
 __label_3: # endif
.annotate 'line', 5296
    set $S2, __ARG_2
    ne $S2, '', __label_4
.annotate 'line', 5297
    __ARG_2 = self.'tempreg'('S')
 __label_4: # endif
.annotate 'line', 5298
    getattribute $P2, self, 'regleft'
    $P3 = $P1[0]
    __ARG_1.'say'('    ', 'substr ', __ARG_2, ', ', $P2, ', ', $P3, ', ', 1)
# }
    goto __label_2
 __label_1: # else
# {
.annotate 'line', 5301
    self.'annotate'(__ARG_1)
.annotate 'line', 5302
    __ARG_1.'print'('    ', __ARG_2, ' = ')
.annotate 'line', 5303
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5304
    __ARG_1.'say'('')
# }
 __label_2: # endif
# }
.annotate 'line', 5306

.end # emit


.sub 'emit_assign' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5309
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5310
    self.'annotate'(__ARG_1)
.annotate 'line', 5311
    __ARG_1.'print'('    ')
.annotate 'line', 5312
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5313
    __ARG_1.'say'(' = ', __ARG_3)
# }
.annotate 'line', 5314

.end # emit_assign


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5317
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5318
# rreg: $S1
    null $S1
.annotate 'line', 5319
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_0
    unless $P1 goto __label_0
# {
.annotate 'line', 5320
    $P2 = self.'tempreg'('P')
    set $S1, $P2
.annotate 'line', 5321
    __ARG_1.'emitnull'($S1)
# }
    goto __label_1
 __label_0: # else
.annotate 'line', 5324
    $P1 = __ARG_2.'emit_get'(__ARG_1)
    set $S1, $P1
 __label_1: # endif
.annotate 'line', 5325
    self.'annotate'(__ARG_1)
.annotate 'line', 5326
    __ARG_1.'print'('    ')
.annotate 'line', 5327
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5328
    __ARG_1.'say'(' = ', $S1)
.annotate 'line', 5329
    .return($S1)
# }
.annotate 'line', 5330

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IndexExpr' ]
.annotate 'line', 5224
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
    get_class $P2, [ 'SimpleArgList' ]
    addparent $P0, $P2
.annotate 'line', 5226
    addattribute $P0, 'left'
.annotate 'line', 5227
    addattribute $P0, 'regleft'
.annotate 'line', 5228
    addattribute $P0, 'argregs'
.end
.namespace [ 'ArrayExpr' ]

.sub 'ArrayExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5341
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5342
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'values', $P4
.annotate 'line', 5343
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5344
    $P3 = $P1.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_0
# {
.annotate 'line', 5345
    __ARG_1.'unget'($P1)
 __label_1: # do
.annotate 'line', 5346
# {
.annotate 'line', 5347
# var item: $P2
    $P2 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 5348
    getattribute $P3, self, 'values'
# predefined push
    push $P3, $P2
# }
 __label_3: # continue
.annotate 'line', 5349
    $P1 = __ARG_1.'get'()
    $P3 = $P1.'isop'(',')
    if_null $P3, __label_2
    if $P3 goto __label_1
 __label_2: # enddo
.annotate 'line', 5350
    $P3 = $P1.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_4
.annotate 'line', 5351
    'Expected'("']' or ','", $P1)
 __label_4: # endif
# }
 __label_0: # endif
# }
.annotate 'line', 5353

.end # ArrayExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5354
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5357
    getattribute $P1, self, 'values'
    'optimize_array'($P1)
.annotate 'line', 5358
    .return(self)
# }
.annotate 'line', 5359

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5362
    set $S2, __ARG_2
    eq $S2, '', __label_0
# {
.annotate 'line', 5363
# value: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
 __label_2:
.annotate 'line', 5364
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 5370
    self.'emit_init'(__ARG_1, '')
# }
 __label_1: # endif
# }
.annotate 'line', 5372

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5375
# container: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 5376
    self.'emit_init'(__ARG_1, $S1)
.annotate 'line', 5377
    .return($S1)
# }
.annotate 'line', 5378

.end # emit_get


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 5381
    self.'annotate'(__ARG_1)
.annotate 'line', 5382
# itemreg: $S1
    null $S1
.annotate 'line', 5383
# it_p: $S2
    null $S2
.annotate 'line', 5384
    eq __ARG_2, '', __label_0
# {
.annotate 'line', 5385
    __ARG_1.'say'('    ', 'root_new ', __ARG_2, ", ['parrot';'ResizablePMCArray']")
.annotate 'line', 5386
    $P2 = self.'tempreg'('P')
    set $S2, $P2
# }
 __label_0: # endif
.annotate 'line', 5388
    getattribute $P2, self, 'values'
    iter $P3, $P2
    set $P3, 0
 __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
# {
.annotate 'line', 5389
# type: $S3
    $P4 = $P1.'checkresult'()
    null $S3
    if_null $P4, __label_3
    set $S3, $P4
 __label_3:
.annotate 'line', 5390
    set $S5, $S3
    set $S6, 'I'
    if $S5 == $S6 goto __label_6
    set $S6, 'N'
    if $S5 == $S6 goto __label_7
    set $S6, 'S'
    if $S5 == $S6 goto __label_8
    goto __label_5
# switch
 __label_6: # case
 __label_7: # case
 __label_8: # case
.annotate 'line', 5392
# aux: $S4
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P2, __label_9
    set $S4, $P2
 __label_9:
.annotate 'line', 5393
    eq __ARG_2, '', __label_10
# {
.annotate 'line', 5394
    __ARG_1.'emitbox'($S2, $S4)
.annotate 'line', 5395
    set $S1, $S2
# }
 __label_10: # endif
    goto __label_4 # break
 __label_5: # default
.annotate 'line', 5399
    $P2 = $P1.'isnull'()
    if_null $P2, __label_11
    unless $P2 goto __label_11
# {
.annotate 'line', 5400
    eq __ARG_2, '', __label_13
# {
.annotate 'line', 5401
    $P4 = self.'tempreg'('P')
    set $S1, $P4
.annotate 'line', 5402
    __ARG_1.'emitnull'($S1)
# }
 __label_13: # endif
# }
    goto __label_12
 __label_11: # else
.annotate 'line', 5406
    $P2 = $P1.'emit_get'(__ARG_1)
    set $S1, $P2
 __label_12: # endif
 __label_4: # switch end
.annotate 'line', 5408
    eq __ARG_2, '', __label_14
# {
.annotate 'line', 5409
    self.'annotate'(__ARG_1)
.annotate 'line', 5410
    __ARG_1.'emitarg2'('push', __ARG_2, $S1)
# }
 __label_14: # endif
# }
    goto __label_1
 __label_2: # endfor
# }
.annotate 'line', 5413

.end # emit_init

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ArrayExpr' ]
.annotate 'line', 5335
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5337
    addattribute $P0, 'values'
.end
.namespace [ 'HashExpr' ]

.sub 'HashExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5425
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5426
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5427
# var keys: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 5428
# var values: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 5429
    $P6 = $P1.'isop'('}')
    isfalse $I1, $P6
    unless $I1 goto __label_0
# {
.annotate 'line', 5430
    __ARG_1.'unget'($P1)
 __label_1: # do
.annotate 'line', 5431
# {
.annotate 'line', 5432
# var key: $P4
    $P4 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 5433
    'ExpectOp'(':', __ARG_1)
.annotate 'line', 5434
# var value: $P5
    $P5 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 5435
# predefined push
    push $P2, $P4
.annotate 'line', 5436
# predefined push
    push $P3, $P5
# }
 __label_3: # continue
.annotate 'line', 5438
    $P1 = __ARG_1.'get'()
    $P6 = $P1.'isop'(',')
    if_null $P6, __label_2
    if $P6 goto __label_1
 __label_2: # enddo
.annotate 'line', 5439
    $P6 = $P1.'isop'('}')
    isfalse $I1, $P6
    unless $I1 goto __label_4
.annotate 'line', 5440
    'Expected'("',' or '}'", $P1)
 __label_4: # endif
# }
 __label_0: # endif
.annotate 'line', 5442
    setattribute self, 'keys', $P2
.annotate 'line', 5443
    setattribute self, 'values', $P3
# }
.annotate 'line', 5444

.end # HashExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5445
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5448
    getattribute $P1, self, 'keys'
    'optimize_array'($P1)
.annotate 'line', 5449
    getattribute $P1, self, 'values'
    'optimize_array'($P1)
.annotate 'line', 5450
    .return(self)
# }
.annotate 'line', 5451

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5454
    self.'annotate'(__ARG_1)
.annotate 'line', 5459
    set $S6, __ARG_2
    eq $S6, '', __label_0
.annotate 'line', 5460
    __ARG_1.'say'('    ', 'root_new ', __ARG_2, ", ['parrot';'Hash']")
 __label_0: # endif
.annotate 'line', 5462
# var keys: $P1
    getattribute $P1, self, 'keys'
.annotate 'line', 5463
# var values: $P2
    getattribute $P2, self, 'values'
.annotate 'line', 5464
# n: $I1
    set $P5, $P1
    set $I1, $P5
# for loop
.annotate 'line', 5465
# i: $I2
    null $I2
 __label_3: # for condition
    ge $I2, $I1, __label_2
# {
.annotate 'line', 5466
# var key: $P3
    $P3 = $P1[$I2]
.annotate 'line', 5467
# item: $S1
    null $S1
.annotate 'line', 5468
    $P5 = $P3.'isidentifier'()
    if_null $P5, __label_4
    unless $P5 goto __label_4
# {
.annotate 'line', 5469
# id: $S2
    $P6 = $P3.'getName'()
    null $S2
    if_null $P6, __label_6
    set $S2, $P6
 __label_6:
.annotate 'line', 5470
    $P5 = self.'tempreg'('P')
    set $S1, $P5
.annotate 'line', 5471
    __ARG_1.'say'('    ', 'get_hll_global ', $S1, ", '", $S2, "'")
# }
    goto __label_5
 __label_4: # else
.annotate 'line', 5474
    $P5 = $P3.'emit_get'(__ARG_1)
    set $S1, $P5
 __label_5: # endif
.annotate 'line', 5476
# var value: $P4
    $P4 = $P2[$I2]
.annotate 'line', 5477
# itemreg: $S3
    null $S3
.annotate 'line', 5478
    $P5 = $P4.'isnull'()
    if_null $P5, __label_7
    unless $P5 goto __label_7
# {
.annotate 'line', 5479
    set $S6, __ARG_2
    eq $S6, '', __label_9
# {
.annotate 'line', 5480
    $P6 = self.'tempreg'('P')
    set $S3, $P6
.annotate 'line', 5481
    __ARG_1.'emitnull'($S3)
# }
 __label_9: # endif
# }
    goto __label_8
 __label_7: # else
.annotate 'line', 5484
    $P5 = $P4.'isidentifier'()
    if_null $P5, __label_10
    unless $P5 goto __label_10
# {
.annotate 'line', 5485
# s: $S4
    $P6 = $P4.'checkIdentifier'()
    null $S4
    if_null $P6, __label_12
    set $S4, $P6
 __label_12:
.annotate 'line', 5486
    isnull $I3, $S4
    not $I3
    unless $I3 goto __label_15
    isne $I3, $S4, ''
 __label_15:
    unless $I3 goto __label_13
.annotate 'line', 5487
    set $S3, $S4
    goto __label_14
 __label_13: # else
# {
.annotate 'line', 5489
# id: $S5
    $P5 = $P4.'getName'()
    null $S5
    if_null $P5, __label_16
    set $S5, $P5
 __label_16:
.annotate 'line', 5490
    getattribute $P6, self, 'owner'
    $P5 = $P6.'getvar'($S5)
    unless_null $P5, __label_17
# {
.annotate 'line', 5491
    $P7 = self.'tempreg'('P')
    set $S3, $P7
.annotate 'line', 5492
    __ARG_1.'say'('    ', 'get_hll_global ', $S3, ", '", $S5, "'")
# }
    goto __label_18
 __label_17: # else
.annotate 'line', 5495
    $P5 = $P4.'emit_get'(__ARG_1)
    set $S3, $P5
 __label_18: # endif
# }
 __label_14: # endif
# }
    goto __label_11
 __label_10: # else
.annotate 'line', 5499
    $P5 = $P4.'emit_get'(__ARG_1)
    set $S3, $P5
 __label_11: # endif
 __label_8: # endif
.annotate 'line', 5500
    set $S6, __ARG_2
    eq $S6, '', __label_19
.annotate 'line', 5501
    __ARG_1.'say'('    ', __ARG_2, '[', $S1, '] = ', $S3)
 __label_19: # endif
# }
 __label_1: # for iteration
.annotate 'line', 5465
    inc $I2
    goto __label_3
 __label_2: # for end
# }
.annotate 'line', 5503

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5506
# container: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 5507
    self.'emit'(__ARG_1, $S1)
.annotate 'line', 5508
    .return($S1)
# }
.annotate 'line', 5509

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'HashExpr' ]
.annotate 'line', 5418
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5420
    addattribute $P0, 'keys'
.annotate 'line', 5421
    addattribute $P0, 'values'
.end
.namespace [ 'NewBaseExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5522
    .return('P')
# }

.end # checkresult


.sub 'parseinitializer' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5527
# var owner: $P1
    getattribute $P1, self, 'owner'
.annotate 'line', 5528
# var initializer: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 5529
# var t: $P3
    $P3 = __ARG_1.'get'()
.annotate 'line', 5530
    $P5 = $P3.'isop'(')')
    isfalse $I1, $P5
    unless $I1 goto __label_0
# {
.annotate 'line', 5531
    __ARG_1.'unget'($P3)
 __label_1: # do
.annotate 'line', 5532
# {
.annotate 'line', 5533
# var auxinit: $P4
    $P4 = 'parseExpr'(__ARG_1, $P1)
.annotate 'line', 5534
# predefined push
    push $P2, $P4
# }
 __label_3: # continue
.annotate 'line', 5535
    $P3 = __ARG_1.'get'()
    $P5 = $P3.'isop'(',')
    if_null $P5, __label_2
    if $P5 goto __label_1
 __label_2: # enddo
.annotate 'line', 5536
    'RequireOp'(')', $P3)
# }
 __label_0: # endif
.annotate 'line', 5538
    setattribute self, 'initializer', $P2
# }
.annotate 'line', 5539

.end # parseinitializer


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5542
    getattribute $P1, self, 'initializer'
    'optimize_array'($P1)
.annotate 'line', 5543
    .return(self)
# }
.annotate 'line', 5544

.end # optimize


.sub 'emit_constructor' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5547
    new $P1, ['ResizableStringArray']
.annotate 'line', 5548
    getattribute $P3, self, 'initializer'
    iter $P4, $P3
    set $P4, 0
 __label_0: # for iteration
    unless $P4 goto __label_1
    shift $P2, $P4
# {
.annotate 'line', 5549
# reg: $S1
    $P5 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P5, __label_2
    set $S1, $P5
 __label_2:
.annotate 'line', 5550
# predefined push
    push $P1, $S1
# }
    goto __label_0
 __label_1: # endfor
.annotate 'line', 5552
    __ARG_1.'print'('    ', __ARG_2, ".'", __ARG_3, "'(")
.annotate 'line', 5553
# predefined join
    join $S2, ", ", $P1
    __ARG_1.'print'($S2)
.annotate 'line', 5554
    __ARG_1.'say'(")")
# }
.annotate 'line', 5555

.end # emit_constructor

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NewBaseExpr' ]
.annotate 'line', 5514
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5516
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
.annotate 'line', 5566
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5568
    $I2 = __ARG_4.'isstring'()
    if $I2 goto __label_1
    $I2 = __ARG_4.'isidentifier'()
 __label_1:
    not $I1, $I2
    unless $I1 goto __label_0
.annotate 'line', 5569
    'SyntaxError'("Unimplemented", __ARG_4)
 __label_0: # endif
.annotate 'line', 5570
    setattribute self, 'value', __ARG_4
.annotate 'line', 5571
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5573
    $P2 = $P1.'isop'('(')
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 5574
    self.'parseinitializer'(__ARG_1)
    goto __label_3
 __label_2: # else
.annotate 'line', 5576
    __ARG_1.'unget'($P1)
 __label_3: # endif
# }
.annotate 'line', 5577

.end # NewExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5580
# var value: $P1
    getattribute $P1, self, 'value'
.annotate 'line', 5581
    isa $I1, $P1, [ 'Token' ]
    unless $I1 goto __label_1
    $I1 = $P1.'isidentifier'()
 __label_1:
    unless $I1 goto __label_0
# {
.annotate 'line', 5584
# var name: $P2
    $P2 = $P1.'getidentifier'()
.annotate 'line', 5585
# var desc: $P3
    getattribute $P4, self, 'owner'
    $P3 = $P4.'getvar'($P2)
.annotate 'line', 5586
    isnull $I1, $P3
    not $I1
    unless $I1 goto __label_3
    $I1 = $P3.'isconst'()
 __label_3:
    unless $I1 goto __label_2
# {
.annotate 'line', 5587
    $P4 = $P3.'getid'()
    unless_null $P4, __label_4
# {
.annotate 'line', 5588
    $P1 = $P3.'getvalue'()
.annotate 'line', 5589
    isa $I2, $P1, [ 'StringLiteral' ]
    not $I1, $I2
    unless $I1 goto __label_6
.annotate 'line', 5590
    'SyntaxError'('Constant value must evaluate to a string', $P1)
 __label_6: # endif
.annotate 'line', 5591
    getattribute $P5, $P1, 'strval'
    setattribute self, 'value', $P5
# }
    goto __label_5
 __label_4: # else
.annotate 'line', 5594
    'SyntaxError'('*Constant value must evaluate to a string', $P1)
 __label_5: # endif
# }
 __label_2: # endif
# }
 __label_0: # endif
.annotate 'line', 5598
    getattribute $P4, self, 'initializer'
    'optimize_array'($P4)
.annotate 'line', 5599
    .return(self)
# }
.annotate 'line', 5600

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 5603
    self.'annotate'(__ARG_1)
.annotate 'line', 5605
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5606
# numinits: $I1
    unless_null $P1, __label_1
    set $I1, -1
    goto __label_0
 __label_1:
# predefined elements
    elements $I1, $P1
 __label_0:
# Constant BYNAME evaluated at compile time
# Constant BYIDENT evaluated at compile time
.annotate 'line', 5609
# type: $I2
    getattribute $P7, self, 'value'
    $P6 = $P7.'isstring'()
    if_null $P6, __label_3
    unless $P6 goto __label_3
    null $I2
    goto __label_2
 __label_3:
.annotate 'line', 5610
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
.annotate 'line', 5612
# reginit: $S1
    set $S1, ''
.annotate 'line', 5613
# regnew: $S2
    set $P6, __ARG_2
    null $S2
    if_null $P6, __label_6
    set $S2, $P6
 __label_6:
.annotate 'line', 5614
# constructor: $S3
    null $S3
.annotate 'line', 5615
    set $I3, $I1
    set $I4, -1
    if $I3 == $I4 goto __label_9
    null $I4
    if $I3 == $I4 goto __label_10
    set $I4, 1
    if $I3 == $I4 goto __label_11
    goto __label_8
# switch
 __label_9: # case
 __label_10: # case
    goto __label_7 # break
 __label_11: # case
.annotate 'line', 5620
    ne $I2, 1, __label_12
# {
.annotate 'line', 5621
    not $I5, __ARG_3
    unless $I5 goto __label_14
.annotate 'line', 5622
    $P6 = self.'tempreg'('P')
    set $S2, $P6
 __label_14: # endif
# }
    goto __label_13
 __label_12: # else
# {
.annotate 'line', 5625
# var initval: $P2
    $P2 = $P1[0]
.annotate 'line', 5626
    $P6 = $P2.'emit_get'(__ARG_1)
    set $S1, $P6
.annotate 'line', 5627
    concat $S0, ', ', $S1
    set $S1, $S0
# }
 __label_13: # endif
    goto __label_7 # break
 __label_8: # default
.annotate 'line', 5631
    eq $I2, 1, __label_15
.annotate 'line', 5632
    getattribute $P6, self, 'start'
    'SyntaxError'('Multiple init arguments not allowed here', $P6)
 __label_15: # endif
.annotate 'line', 5633
    not $I3, __ARG_3
    unless $I3 goto __label_16
.annotate 'line', 5634
    $P7 = self.'tempreg'('P')
    set $S2, $P7
 __label_16: # endif
 __label_7: # switch end
.annotate 'line', 5637
    set $I3, $I2
    null $I4
    if $I3 == $I4 goto __label_19
    set $I4, 1
    if $I3 == $I4 goto __label_20
    goto __label_18
# switch
 __label_19: # case
.annotate 'line', 5640
# name: $S4
    getattribute $P7, self, 'value'
    $P6 = $P7.'rawstring'()
    null $S4
    if_null $P6, __label_21
    set $S4, $P6
 __label_21:
.annotate 'line', 5641
# var aux: $P3
# predefined get_class
    get_class $P3, $S4
.annotate 'line', 5642
    isnull $I5, $P3
    unless $I5 goto __label_23
    $I5 = self.'dowarnings'()
 __label_23:
    unless $I5 goto __label_22
.annotate 'line', 5643
    concat $S5, "Can't locate class ", $S4
    concat $S5, $S5, " at compile time"
    getattribute $P8, self, 'value'
    'Warn'($S5, $P8)
 __label_22: # endif
.annotate 'line', 5647
    getattribute $P9, self, 'value'
    __ARG_1.'say'('    ', 'new ', $S2, ", [ ", $P9, " ]", $S1)
.annotate 'line', 5648
    le $I1, 1, __label_24
# {
.annotate 'line', 5649
    getattribute $P10, self, 'value'
    __ARG_1.'say'($S2, ".'", $P10, "'()")
# }
 __label_24: # endif
    goto __label_17 # break
 __label_20: # case
.annotate 'line', 5653
# var id: $P4
    getattribute $P6, self, 'owner'
    getattribute $P7, self, 'value'
    $P4 = $P6.'getvar'($P7)
.annotate 'line', 5654
    unless_null $P4, __label_25
# {
.annotate 'line', 5656
# var cl: $P5
    getattribute $P8, self, 'owner'
    getattribute $P9, self, 'value'
    $P5 = $P8.'checkclass'($P9)
.annotate 'line', 5657
    if_null $P5, __label_27
# {
.annotate 'line', 5658
    $P6 = $P5.'getclasskey'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P6, $S1)
# }
    goto __label_28
 __label_27: # else
# {
.annotate 'line', 5661
    $P6 = self.'dowarnings'()
    if_null $P6, __label_29
    unless $P6 goto __label_29
.annotate 'line', 5662
    'Warn'('Checking: new unknown type')
 __label_29: # endif
.annotate 'line', 5663
    getattribute $P6, self, 'value'
    __ARG_1.'say'('    ', 'new ', $S2, ", ['", $P6, "']", $S1)
# }
 __label_28: # endif
.annotate 'line', 5665
    getattribute $P6, self, 'value'
    set $S3, $P6
# }
    goto __label_26
 __label_25: # else
# {
.annotate 'line', 5669
    $P6 = $P4.'getreg'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P6, "", $S1)
# }
 __label_26: # endif
    goto __label_17 # break
 __label_18: # default
.annotate 'line', 5673
    'InternalError'('Unexpected type in new')
 __label_17: # switch end
.annotate 'line', 5675
    isgt $I3, $I1, 1
    if $I3 goto __label_31
    isge $I3, $I1, 0
    unless $I3 goto __label_32
    iseq $I3, $I2, 1
 __label_32:
 __label_31:
    unless $I3 goto __label_30
# {
.annotate 'line', 5676
    self.'emit_constructor'(__ARG_1, $S2, $S3)
.annotate 'line', 5677
    not $I3, __ARG_3
    unless $I3 goto __label_33
.annotate 'line', 5678
    __ARG_1.'emitset'(__ARG_2, $S2)
 __label_33: # endif
# }
 __label_30: # endif
# }
.annotate 'line', 5680

.end # emit


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5683
    .tailcall self.'emit'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 5684

.end # emit_init

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NewExpr' ]
.annotate 'line', 5560
    get_class $P1, [ 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 5562
    addattribute $P0, 'value'
.end
.namespace [ 'NewIndexedExpr' ]

.sub 'NewIndexedExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5695
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5696
    setattribute self, 'owner', __ARG_2
.annotate 'line', 5697
# var nskey: $P1
    new $P1, [ 'ClassSpecifierParrotKey' ]
    $P1.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5698
    setattribute self, 'nskey', $P1
.annotate 'line', 5699
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 5700
    $P3 = $P2.'isop'('(')
    if_null $P3, __label_0
    unless $P3 goto __label_0
.annotate 'line', 5701
    self.'parseinitializer'(__ARG_1)
    goto __label_1
 __label_0: # else
.annotate 'line', 5703
    __ARG_1.'unget'($P2)
 __label_1: # endif
# }
.annotate 'line', 5704

.end # NewIndexedExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5707
# reginit: $S1
    null $S1
.annotate 'line', 5708
# var init: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5709
# numinits: $I1
    unless_null $P1, __label_1
    null $I1
    goto __label_0
 __label_1:
# predefined elements
    elements $I1, $P1
 __label_0:
.annotate 'line', 5710
    set $I2, $I1
    null $I3
    if $I2 == $I3 goto __label_4
    set $I3, 1
    if $I2 == $I3 goto __label_5
    goto __label_3
# switch
 __label_4: # case
    goto __label_2 # break
 __label_5: # case
.annotate 'line', 5714
# var initval: $P2
    $P2 = $P1[0]
.annotate 'line', 5715
    $P4 = $P2.'emit_get'(__ARG_1)
    set $S1, $P4
    goto __label_2 # break
 __label_3: # default
.annotate 'line', 5718
    getattribute $P5, self, 'start'
    'SyntaxError'('Multiple init arguments not allowed here', $P5)
 __label_2: # switch end
.annotate 'line', 5720
# var nskey: $P3
    getattribute $P3, self, 'nskey'
.annotate 'line', 5721
    __ARG_1.'print'('    ')
.annotate 'line', 5722
    $P4 = $P3.'hasHLL'()
    if_null $P4, __label_6
    unless $P4 goto __label_6
.annotate 'line', 5723
    __ARG_1.'print'("root_")
 __label_6: # endif
.annotate 'line', 5724
    __ARG_1.'print'("new ", __ARG_2, ", ")
.annotate 'line', 5725
    null $P4
    $P3.'emit'(__ARG_1, $P4)
.annotate 'line', 5726
    if_null $S1, __label_7
.annotate 'line', 5727
    __ARG_1.'print'(', ', $S1)
 __label_7: # endif
.annotate 'line', 5728
    __ARG_1.'say'()
# }
.annotate 'line', 5729

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NewIndexedExpr' ]
.annotate 'line', 5689
    get_class $P1, [ 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 5691
    addattribute $P0, 'nskey'
.end
.namespace [ 'NewQualifiedExpr' ]

.sub 'NewQualifiedExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5740
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5741
    setattribute self, 'owner', __ARG_2
.annotate 'line', 5742
# var nskey: $P1
    new $P1, [ 'ClassSpecifierId' ]
    $P1.'ClassSpecifierId'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5743
    setattribute self, 'nskey', $P1
.annotate 'line', 5744
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 5745
    $P3 = $P2.'isop'('(')
    if_null $P3, __label_0
    unless $P3 goto __label_0
.annotate 'line', 5746
    self.'parseinitializer'(__ARG_1)
    goto __label_1
 __label_0: # else
.annotate 'line', 5748
    __ARG_1.'unget'($P2)
 __label_1: # endif
# }
.annotate 'line', 5749

.end # NewQualifiedExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5752
# reginit: $S1
    null $S1
.annotate 'line', 5753
# var init: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5755
# numinits: $I1
    unless_null $P1, __label_1
    set $I1, -1
    goto __label_0
 __label_1:
# predefined elements
    elements $I1, $P1
 __label_0:
.annotate 'line', 5756
# regnew: $S2
    set $P3, __ARG_2
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
 __label_2:
.annotate 'line', 5757
    le $I1, 0, __label_3
.annotate 'line', 5758
    $P3 = self.'tempreg'('P')
    set $S2, $P3
 __label_3: # endif
.annotate 'line', 5759
# var nskey: $P2
    getattribute $P2, self, 'nskey'
.annotate 'line', 5760
    __ARG_1.'print'('    ', 'new ', $S2, ", ")
.annotate 'line', 5761
    getattribute $P3, self, 'owner'
    $P2.'emit'(__ARG_1, $P3)
.annotate 'line', 5762
    __ARG_1.'say'()
.annotate 'line', 5764
    lt $I1, 0, __label_4
# {
.annotate 'line', 5765
# constructor: $S3
    $P3 = $P2.'last'()
    null $S3
    if_null $P3, __label_5
    set $S3, $P3
 __label_5:
.annotate 'line', 5766
    self.'emit_constructor'(__ARG_1, $S2, $S3)
.annotate 'line', 5767
    __ARG_1.'emitset'(__ARG_2, $S2)
# }
 __label_4: # endif
# }
.annotate 'line', 5769

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NewQualifiedExpr' ]
.annotate 'line', 5734
    get_class $P1, [ 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 5736
    addattribute $P0, 'nskey'
.end
.namespace [ ]

.sub 'parseNew'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5776
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5778
    $P3 = $P1.'isop'('(')
    if_null $P3, __label_0
    unless $P3 goto __label_0
# {
.annotate 'line', 5780
    new $P5, [ 'CallExpr' ]
.annotate 'line', 5781
    new $P7, [ 'StringLiteral' ]
    $P7.'StringLiteral'(__ARG_2, __ARG_3)
    set $P6, $P7
    $P5.'CallExpr'(__ARG_1, __ARG_2, __ARG_3, $P6)
    set $P4, $P5
.annotate 'line', 5780
    .return($P4)
# }
    goto __label_1
 __label_0: # else
.annotate 'line', 5783
    $P3 = $P1.'isop'('[')
    if_null $P3, __label_2
    unless $P3 goto __label_2
# {
.annotate 'line', 5785
    new $P5, [ 'NewIndexedExpr' ]
    $P5.'NewIndexedExpr'(__ARG_1, __ARG_2, __ARG_3)
    set $P4, $P5
    .return($P4)
# }
    goto __label_3
 __label_2: # else
.annotate 'line', 5787
    $P3 = $P1.'isidentifier'()
    if_null $P3, __label_4
    unless $P3 goto __label_4
# {
.annotate 'line', 5790
# var t2: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 5791
    __ARG_1.'unget'($P2)
.annotate 'line', 5792
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_6
    unless $P3 goto __label_6
# {
.annotate 'line', 5794
    new $P5, [ 'NewQualifiedExpr' ]
    $P5.'NewQualifiedExpr'(__ARG_1, __ARG_2, $P1)
    set $P4, $P5
    .return($P4)
# }
    goto __label_7
 __label_6: # else
# {
.annotate 'line', 5798
    new $P4, [ 'NewExpr' ]
    $P4.'NewExpr'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P3, $P4
    .return($P3)
# }
 __label_7: # endif
# }
    goto __label_5
 __label_4: # else
# {
.annotate 'line', 5803
    new $P4, [ 'NewExpr' ]
    $P4.'NewExpr'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P3, $P4
    .return($P3)
# }
 __label_5: # endif
 __label_3: # endif
 __label_1: # endif
# }
.annotate 'line', 5805

.end # parseNew

.namespace [ 'OpInstanceOfExpr' ]

.sub 'OpInstanceOfExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 5816
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5817
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 5818
    $P2 = 'parseClassSpecifier'(__ARG_4, self)
    setattribute self, 'checked', $P2
# }
.annotate 'line', 5819

.end # OpInstanceOfExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5822
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 5823
    .return(self)
# }
.annotate 'line', 5824

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5825
    .return('I')
# }

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5828
# var checked: $P1
    getattribute $P1, self, 'checked'
.annotate 'line', 5830
# r: $S1
    null $S1
.annotate 'line', 5831
    set $S3, __ARG_2
    ne $S3, '', __label_0
.annotate 'line', 5832
    $P2 = self.'tempreg'('I')
    set $S1, $P2
    goto __label_1
 __label_0: # else
.annotate 'line', 5834
    set $S1, __ARG_2
 __label_1: # endif
.annotate 'line', 5835
# check: $S2
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
 __label_2:
.annotate 'line', 5836
    self.'annotate'(__ARG_1)
.annotate 'line', 5837
    __ARG_1.'print'('    isa ', $S1, ', ', $S2, ', ')
.annotate 'line', 5838
    getattribute $P2, self, 'owner'
    $P1.'emit'(__ARG_1, $P2)
.annotate 'line', 5839
    __ARG_1.'say'()
# }
.annotate 'line', 5840

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpInstanceOfExpr' ]
.annotate 'line', 5809
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5811
    addattribute $P0, 'lexpr'
.annotate 'line', 5812
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
.annotate 'line', 5857
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5858
    new $P3, [ 'Condition' ]
    $P2 = $P3.'set'(__ARG_3)
    setattribute self, 'condition', $P2
.annotate 'line', 5859
    setattribute self, 'etrue', __ARG_4
.annotate 'line', 5860
    setattribute self, 'efalse', __ARG_5
.annotate 'line', 5861
    .return(self)
# }
.annotate 'line', 5862

.end # OpConditionalExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5865
    getattribute $P3, self, 'condition'
    $P2 = $P3.'optimize'()
    setattribute self, 'condition', $P2
.annotate 'line', 5866
    getattribute $P2, self, 'condition'
    $P1 = $P2.'getvalue'()
    set $I1, $P1
    set $I2, 1
    if $I1 == $I2 goto __label_2
    set $I2, 2
    if $I1 == $I2 goto __label_3
    goto __label_1
# switch
 __label_2: # case
.annotate 'line', 5868
    getattribute $P3, self, 'etrue'
    .tailcall $P3.'optimize'()
 __label_3: # case
.annotate 'line', 5870
    getattribute $P4, self, 'efalse'
    .tailcall $P4.'optimize'()
 __label_1: # default
.annotate 'line', 5872
    getattribute $P7, self, 'etrue'
    $P6 = $P7.'optimize'()
    setattribute self, 'etrue', $P6
.annotate 'line', 5873
    getattribute $P10, self, 'efalse'
    $P9 = $P10.'optimize'()
    setattribute self, 'efalse', $P9
.annotate 'line', 5874
    .return(self)
 __label_0: # switch end
# }
.annotate 'line', 5876

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5879
    getattribute $P1, self, 'etrue'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 5880

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5883
# cond_end: $S1
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 5884
# cond_false: $S2
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 5885
    getattribute $P1, self, 'condition'
    $P1.'emit_else'(__ARG_1, $S2)
.annotate 'line', 5886
    getattribute $P1, self, 'etrue'
    $P1.'emit'(__ARG_1, __ARG_2)
.annotate 'line', 5887
    __ARG_1.'emitgoto'($S1)
.annotate 'line', 5888
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 5889
    getattribute $P1, self, 'efalse'
    $P1.'emit'(__ARG_1, __ARG_2)
.annotate 'line', 5890
    __ARG_1.'emitlabel'($S1)
# }
.annotate 'line', 5891

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpConditionalExpr' ]
.annotate 'line', 5845
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5851
    addattribute $P0, 'condition'
.annotate 'line', 5852
    addattribute $P0, 'etrue'
.annotate 'line', 5853
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
.annotate 'line', 5935
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    set $S2, '('
    if $S1 == $S2 goto __label_2
    set $S2, '['
    if $S1 == $S2 goto __label_3
    set $S2, '.'
    if $S1 == $S2 goto __label_4
    goto __label_1
# switch
 __label_2: # case
.annotate 'line', 5936
    .return(1)
 __label_3: # case
.annotate 'line', 5937
    .return(2)
 __label_4: # case
.annotate 'line', 5938
    .return(3)
 __label_1: # default
.annotate 'line', 5939
    .return(0)
 __label_0: # switch end
# }
.annotate 'line', 5941

.end # getOpCode_2


.sub 'getOpCode_4'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5945
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
# switch
 __label_2: # case
.annotate 'line', 5946
    .return(8)
 __label_3: # case
.annotate 'line', 5947
    .return(11)
 __label_4: # case
.annotate 'line', 5948
    .return(9)
 __label_5: # case
.annotate 'line', 5949
    .return(10)
 __label_1: # default
.annotate 'line', 5951
    $P2 = __ARG_1.'iskeyword'('delete')
    if_null $P2, __label_6
    unless $P2 goto __label_6
    .return(31)
    goto __label_7
 __label_6: # else
.annotate 'line', 5952
    $P3 = __ARG_1.'iskeyword'('exists')
    if_null $P3, __label_8
    unless $P3 goto __label_8
    .return(32)
    goto __label_9
 __label_8: # else
.annotate 'line', 5953
    .return(0)
 __label_9: # endif
 __label_7: # endif
 __label_0: # switch end
# }
.annotate 'line', 5955

.end # getOpCode_4


.sub 'getOpCode_5'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5959
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
# switch
 __label_2: # case
.annotate 'line', 5960
    .return(19)
 __label_3: # case
.annotate 'line', 5961
    .return(20)
 __label_4: # case
.annotate 'line', 5962
    .return(21)
 __label_5: # case
.annotate 'line', 5963
    .return(22)
 __label_1: # default
.annotate 'line', 5964
    .return(0)
 __label_0: # switch end
# }
.annotate 'line', 5966

.end # getOpCode_5


.sub 'getOpCode_7'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5970
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    set $S2, '<<'
    if $S1 == $S2 goto __label_2
    set $S2, '>>'
    if $S1 == $S2 goto __label_3
    goto __label_1
# switch
 __label_2: # case
.annotate 'line', 5971
    .return(28)
 __label_3: # case
.annotate 'line', 5972
    .return(29)
 __label_1: # default
.annotate 'line', 5973
    .return(0)
 __label_0: # switch end
# }
.annotate 'line', 5975

.end # getOpCode_7


.sub 'getOpCode_8'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5979
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
# switch
 __label_2: # case
.annotate 'line', 5980
    .return(14)
 __label_3: # case
.annotate 'line', 5981
    .return(16)
 __label_4: # case
.annotate 'line', 5982
    .return(15)
 __label_5: # case
.annotate 'line', 5983
    .return(17)
 __label_1: # default
.annotate 'line', 5985
    $P2 = __ARG_1.'iskeyword'('instanceof')
    if_null $P2, __label_6
    unless $P2 goto __label_6
    .return(27)
    goto __label_7
 __label_6: # else
.annotate 'line', 5986
    .return(0)
 __label_7: # endif
 __label_0: # switch end
# }
.annotate 'line', 5988

.end # getOpCode_8


.sub 'getOpCode_9'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5992
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
# switch
 __label_2: # case
.annotate 'line', 5993
    .return(12)
 __label_3: # case
.annotate 'line', 5994
    .return(13)
 __label_4: # case
.annotate 'line', 5995
    .return(25)
 __label_5: # case
.annotate 'line', 5996
    .return(26)
 __label_1: # default
.annotate 'line', 5997
    .return(0)
 __label_0: # switch end
# }
.annotate 'line', 5999

.end # getOpCode_9


.sub 'getOpCode_16'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6003
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
# switch
 __label_2: # case
.annotate 'line', 6004
    .return(4)
 __label_3: # case
.annotate 'line', 6005
    .return(5)
 __label_4: # case
.annotate 'line', 6006
    .return(6)
 __label_5: # case
.annotate 'line', 6007
    .return(18)
 __label_6: # case
.annotate 'line', 6008
    .return(23)
 __label_7: # case
.annotate 'line', 6009
    .return(24)
 __label_8: # case
.annotate 'line', 6010
    .return(30)
 __label_1: # default
.annotate 'line', 6011
    .return(0)
 __label_0: # switch end
# }
.annotate 'line', 6013

.end # getOpCode_16


.sub 'parseExpr_0'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6017
.const 'Sub' $P3 = 'parseExpr'
.annotate 'line', 6019
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 6020
# var expr: $P2
    null $P2
.annotate 'line', 6021
    $P4 = $P1.'isop'('(')
    if_null $P4, __label_0
    unless $P4 goto __label_0
# {
.annotate 'line', 6022
    $P2 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 6023
    'ExpectOp'(')', __ARG_1)
.annotate 'line', 6024
    .return($P2)
# }
 __label_0: # endif
.annotate 'line', 6026
    $P4 = $P1.'isop'('[')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 6027
    new $P6, [ 'ArrayExpr' ]
    $P6.'ArrayExpr'(__ARG_1, __ARG_2, $P1)
    set $P5, $P6
    .return($P5)
 __label_1: # endif
.annotate 'line', 6028
    $P4 = $P1.'isop'('{')
    if_null $P4, __label_2
    unless $P4 goto __label_2
.annotate 'line', 6029
    new $P6, [ 'HashExpr' ]
    $P6.'HashExpr'(__ARG_1, __ARG_2, $P1)
    set $P5, $P6
    .return($P5)
 __label_2: # endif
.annotate 'line', 6030
    $P4 = $P1.'isstring'()
    if_null $P4, __label_3
    unless $P4 goto __label_3
.annotate 'line', 6031
    new $P6, [ 'StringLiteral' ]
    $P6.'StringLiteral'(__ARG_2, $P1)
    set $P5, $P6
    .return($P5)
 __label_3: # endif
.annotate 'line', 6032
    $P4 = $P1.'isint'()
    if_null $P4, __label_4
    unless $P4 goto __label_4
.annotate 'line', 6033
    new $P6, [ 'IntegerLiteral' ]
    $P6.'IntegerLiteral'(__ARG_2, $P1)
    set $P5, $P6
    .return($P5)
 __label_4: # endif
.annotate 'line', 6034
    $P4 = $P1.'isfloat'()
    if_null $P4, __label_5
    unless $P4 goto __label_5
.annotate 'line', 6035
    new $P6, [ 'FloatLiteral' ]
    $P6.'FloatLiteral'(__ARG_2, $P1)
    set $P5, $P6
    .return($P5)
 __label_5: # endif
.annotate 'line', 6036
    $P4 = $P1.'checkkeyword'()
    set $S1, $P4
    set $S2, 'new'
    if $S1 == $S2 goto __label_8
    set $S2, 'function'
    if $S1 == $S2 goto __label_9
    set $S2, 'class'
    if $S1 == $S2 goto __label_10
    goto __label_7
# switch
 __label_8: # case
.annotate 'line', 6038
    .tailcall 'parseNew'(__ARG_1, __ARG_2, $P1)
 __label_9: # case
.annotate 'line', 6040
    new $P6, [ 'FunctionExpr' ]
    $P6.'FunctionExpr'(__ARG_1, __ARG_2, $P1)
    set $P5, $P6
    .return($P5)
 __label_10: # case
.annotate 'line', 6042
    new $P8, [ 'OpClassExpr' ]
    $P8.'OpClassExpr'(__ARG_1, __ARG_2, $P1)
    set $P7, $P8
    .return($P7)
 __label_7: # default
 __label_6: # switch end
.annotate 'line', 6044
    $P4 = $P1.'isidentifier'()
    if_null $P4, __label_11
    unless $P4 goto __label_11
.annotate 'line', 6045
    new $P6, [ 'IdentifierExpr' ]
    $P6.'IdentifierExpr'(__ARG_2, $P1)
    set $P5, $P6
    .return($P5)
 __label_11: # endif
.annotate 'line', 6046
    'SyntaxError'('Expression expected', $P1)
# }
.annotate 'line', 6047

.end # parseExpr_0


.sub 'parseExpr_2'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6051
.const 'Sub' $P5 = 'parseExpr_0'
.annotate 'line', 6052
.const 'Sub' $P6 = 'getOpCode_2'
.annotate 'line', 6054
# var subexp: $P1
    $P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6055
# var t: $P2
    null $P2
.annotate 'line', 6056
# var start: $P3
    null $P3
.annotate 'line', 6057
# code: $I1
    null $I1
 __label_1: # while
.annotate 'line', 6058
    $P2 = __ARG_1.'get'()
    $P7 = $P6($P2)
    set $I1, $P7
    eq $I1, 0, __label_0
# {
.annotate 'line', 6059
    set $I2, $I1
    set $I3, 1
    if $I2 == $I3 goto __label_4
    set $I3, 2
    if $I2 == $I3 goto __label_5
    set $I3, 3
    if $I2 == $I3 goto __label_6
    goto __label_3
# switch
 __label_4: # case
.annotate 'line', 6061
    new $P8, [ 'CallExpr' ]
    $P8.'CallExpr'(__ARG_1, __ARG_2, $P2, $P1)
    set $P1, $P8
    goto __label_2 # break
 __label_5: # case
.annotate 'line', 6064
    new $P9, [ 'IndexExpr' ]
    $P9.'IndexExpr'(__ARG_1, __ARG_2, $P2, $P1)
    set $P1, $P9
    goto __label_2 # break
 __label_6: # case
.annotate 'line', 6067
    set $P3, $P2
.annotate 'line', 6068
    $P2 = __ARG_1.'get'()
.annotate 'line', 6069
    $P10 = $P2.'isop'('*')
    if_null $P10, __label_7
    unless $P10 goto __label_7
# {
.annotate 'line', 6070
# var right: $P4
    $P4 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6071
    new $P7, [ 'MemberRefExpr' ]
    $P7.'MemberRefExpr'(__ARG_2, $P2, $P1, $P4)
    set $P1, $P7
# }
    goto __label_8
 __label_7: # else
.annotate 'line', 6074
    new $P7, [ 'MemberExpr' ]
    $P7.'MemberExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P7
 __label_8: # endif
    goto __label_2 # break
 __label_3: # default
.annotate 'line', 6077
    'InternalError'('Unexpected code in parseExpr_2')
 __label_2: # switch end
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6080
    __ARG_1.'unget'($P2)
.annotate 'line', 6081
    .return($P1)
# }
.annotate 'line', 6082

.end # parseExpr_2


.sub 'parseExpr_3'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6086
.const 'Sub' $P3 = 'parseExpr_2'
.annotate 'line', 6088
# var subexp: $P1
    $P1 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 6089
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 6090
    $P4 = $P2.'isop'('++')
    if_null $P4, __label_0
    unless $P4 goto __label_0
.annotate 'line', 6091
    new $P6, [ 'OpPostIncExpr' ]
    $P6.'OpPostIncExpr'(__ARG_2, $P2, $P1)
    set $P5, $P6
    .return($P5)
    goto __label_1
 __label_0: # else
.annotate 'line', 6092
    $P7 = $P2.'isop'('--')
    if_null $P7, __label_2
    unless $P7 goto __label_2
.annotate 'line', 6093
    new $P9, [ 'OpPostDecExpr' ]
    $P9.'OpPostDecExpr'(__ARG_2, $P2, $P1)
    set $P8, $P9
    .return($P8)
    goto __label_3
 __label_2: # else
# {
.annotate 'line', 6096
    __ARG_1.'unget'($P2)
.annotate 'line', 6097
    .return($P1)
# }
 __label_3: # endif
 __label_1: # endif
# }
.annotate 'line', 6099

.end # parseExpr_3


.sub 'parseExpr_4'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6103
.const 'Sub' $P3 = 'parseExpr_4'
.annotate 'line', 6104
.const 'Sub' $P4 = 'parseExpr_3'
.annotate 'line', 6105
.const 'Sub' $P5 = 'getOpCode_4'
.annotate 'line', 6107
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 6108
# code: $I1
    $P6 = $P5($P1)
    set $I1, $P6
.annotate 'line', 6109
    eq $I1, 0, __label_0
# {
.annotate 'line', 6110
# var subexpr: $P2
    $P2 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 6111
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
# switch
 __label_4: # case
.annotate 'line', 6113
    new $P7, [ 'OpUnaryMinusExpr' ]
    $P7.'OpUnaryMinusExpr'(__ARG_2, $P1, $P2)
    set $P6, $P7
    .return($P6)
 __label_5: # case
.annotate 'line', 6115
    new $P9, [ 'OpNotExpr' ]
    $P9.'OpNotExpr'(__ARG_2, $P1, $P2)
    set $P8, $P9
    .return($P8)
 __label_6: # case
.annotate 'line', 6117
    new $P11, [ 'OpPreIncExpr' ]
    $P11.'OpPreIncExpr'(__ARG_2, $P1, $P2)
    set $P10, $P11
    .return($P10)
 __label_7: # case
.annotate 'line', 6119
    new $P13, [ 'OpPreDecExpr' ]
    $P13.'OpPreDecExpr'(__ARG_2, $P1, $P2)
    set $P12, $P13
    .return($P12)
 __label_8: # case
.annotate 'line', 6121
    new $P15, [ 'OpDeleteExpr' ]
    $P15.'OpDeleteExpr'(__ARG_2, $P1, $P2)
    set $P14, $P15
    .return($P14)
 __label_9: # case
.annotate 'line', 6123
    new $P17, [ 'OpExistsExpr' ]
    $P17.'OpExistsExpr'(__ARG_2, $P1, $P2)
    set $P16, $P17
    .return($P16)
 __label_3: # default
.annotate 'line', 6125
    'InternalError'('Invalid code in parseExpr_4', $P1)
 __label_2: # switch end
# }
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 6129
    __ARG_1.'unget'($P1)
.annotate 'line', 6130
    .tailcall $P4(__ARG_1, __ARG_2)
# }
 __label_1: # endif
# }
.annotate 'line', 6132

.end # parseExpr_4


.sub 'parseExpr_5'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6136
.const 'Sub' $P4 = 'parseExpr_4'
.annotate 'line', 6137
.const 'Sub' $P5 = 'getOpCode_5'
.annotate 'line', 6139
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6140
# var t: $P2
    null $P2
.annotate 'line', 6141
# code: $I1
    null $I1
 __label_1: # while
.annotate 'line', 6142
    $P2 = __ARG_1.'get'()
    $P6 = $P5($P2)
    set $I1, $P6
    eq $I1, 0, __label_0
# {
.annotate 'line', 6143
# var rexpr: $P3
    $P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6144
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
# switch
 __label_4: # case
.annotate 'line', 6146
    new $P6, [ 'OpMulExpr' ]
    $P6.'OpMulExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P6
    goto __label_2 # break
 __label_5: # case
.annotate 'line', 6149
    new $P7, [ 'OpDivExpr' ]
    $P7.'OpDivExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P7
    goto __label_2 # break
 __label_6: # case
.annotate 'line', 6152
    new $P8, [ 'OpModExpr' ]
    $P8.'OpModExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P8
    goto __label_2 # break
 __label_7: # case
.annotate 'line', 6155
    new $P9, [ 'OpCModExpr' ]
    $P9.'OpCModExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P9
    goto __label_2 # break
 __label_3: # default
.annotate 'line', 6158
    'InternalError'('Invalid code in parseExpr_5', $P2)
 __label_2: # switch end
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6161
    __ARG_1.'unget'($P2)
.annotate 'line', 6162
    .return($P1)
# }
.annotate 'line', 6163

.end # parseExpr_5


.sub 'parseExpr_6'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6167
.const 'Sub' $P5 = 'parseExpr_5'
.annotate 'line', 6169
# var lexpr: $P1
    $P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6170
# var t: $P2
    null $P2
 __label_1: # while
.annotate 'line', 6171
    $P2 = __ARG_1.'get'()
    $I1 = $P2.'isop'('+')
    if $I1 goto __label_2
    $I1 = $P2.'isop'('-')
 __label_2:
    unless $I1 goto __label_0
# {
.annotate 'line', 6172
# var rexpr: $P3
    $P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6173
# var expr: $P4
    null $P4
.annotate 'line', 6174
    $P6 = $P2.'isop'('+')
    if_null $P6, __label_3
    unless $P6 goto __label_3
.annotate 'line', 6175
    new $P7, [ 'OpAddExpr' ]
    $P7.'OpAddExpr'(__ARG_2, $P2, $P1, $P3)
    set $P4, $P7
    goto __label_4
 __label_3: # else
.annotate 'line', 6177
    new $P8, [ 'OpSubExpr' ]
    $P8.'OpSubExpr'(__ARG_2, $P2, $P1, $P3)
    set $P4, $P8
 __label_4: # endif
.annotate 'line', 6178
    set $P1, $P4
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6180
    __ARG_1.'unget'($P2)
.annotate 'line', 6181
    .return($P1)
# }
.annotate 'line', 6182

.end # parseExpr_6


.sub 'parseExpr_7'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6186
.const 'Sub' $P4 = 'parseExpr_6'
.annotate 'line', 6188
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6189
# var rexpr: $P2
    null $P2
.annotate 'line', 6190
# var t: $P3
    null $P3
.annotate 'line', 6191
# code: $I1
    null $I1
 __label_1: # while
.annotate 'line', 6192
    $P3 = __ARG_1.'get'()
    $P5 = 'getOpCode_7'($P3)
    set $I1, $P5
    eq $I1, 0, __label_0
# {
.annotate 'line', 6193
    set $I2, $I1
    set $I3, 28
    if $I2 == $I3 goto __label_4
    set $I3, 29
    if $I2 == $I3 goto __label_5
    goto __label_3
# switch
 __label_4: # case
.annotate 'line', 6195
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6196
    new $P6, [ 'OpShiftleftExpr' ]
    $P6.'OpShiftleftExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P6
    goto __label_2 # break
 __label_5: # case
.annotate 'line', 6199
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6200
    new $P7, [ 'OpShiftrightExpr' ]
    $P7.'OpShiftrightExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P7
    goto __label_2 # break
 __label_3: # default
.annotate 'line', 6203
    'InternalError'('Invalid code in parseExpr_7', $P3)
 __label_2: # switch end
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6206
    __ARG_1.'unget'($P3)
.annotate 'line', 6207
    .return($P1)
# }
.annotate 'line', 6208

.end # parseExpr_7


.sub 'parseExpr_8'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6212
.const 'Sub' $P4 = 'parseExpr_7'
.annotate 'line', 6213
.const 'Sub' $P5 = 'getOpCode_8'
.annotate 'line', 6215
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6216
# var rexpr: $P2
    null $P2
.annotate 'line', 6217
# var t: $P3
    null $P3
.annotate 'line', 6218
# code: $I1
    null $I1
 __label_1: # while
.annotate 'line', 6219
    $P3 = __ARG_1.'get'()
    $P6 = $P5($P3)
    set $I1, $P6
    eq $I1, 0, __label_0
# {
.annotate 'line', 6220
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
# switch
 __label_4: # case
.annotate 'line', 6222
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6223
    new $P7, [ 'OpLessExpr' ]
    $P1 = $P7.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_2 # break
 __label_5: # case
.annotate 'line', 6226
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6227
    new $P8, [ 'OpGreaterExpr' ]
    $P1 = $P8.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_2 # break
 __label_6: # case
.annotate 'line', 6230
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6231
    new $P9, [ 'OpLessEqualExpr' ]
    $P1 = $P9.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_2 # break
 __label_7: # case
.annotate 'line', 6234
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6235
    new $P10, [ 'OpGreaterEqualExpr' ]
    $P1 = $P10.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_2 # break
 __label_8: # case
.annotate 'line', 6238
    new $P11, [ 'OpInstanceOfExpr' ]
    $P11.'OpInstanceOfExpr'(__ARG_2, $P3, $P1, __ARG_1)
    set $P1, $P11
    goto __label_2 # break
 __label_3: # default
.annotate 'line', 6241
    'InternalError'('Invalid code in parseExpr_9', $P3)
 __label_2: # switch end
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6244
    __ARG_1.'unget'($P3)
.annotate 'line', 6245
    .return($P1)
# }
.annotate 'line', 6246

.end # parseExpr_8


.sub 'parseExpr_9'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6250
.const 'Sub' $P4 = 'parseExpr_8'
.annotate 'line', 6251
.const 'Sub' $P5 = 'getOpCode_9'
.annotate 'line', 6253
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6254
# var rexpr: $P2
    null $P2
.annotate 'line', 6255
# var t: $P3
    null $P3
.annotate 'line', 6256
# code: $I1
    null $I1
 __label_1: # while
.annotate 'line', 6257
    $P3 = __ARG_1.'get'()
    $P6 = $P5($P3)
    set $I1, $P6
    eq $I1, 0, __label_0
# {
.annotate 'line', 6258
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
# switch
 __label_4: # case
.annotate 'line', 6260
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6261
    new $P7, [ 'OpEqualExpr' ]
    $P1 = $P7.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_2 # break
 __label_5: # case
.annotate 'line', 6264
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6265
    new $P8, [ 'OpNotEqualExpr' ]
    $P1 = $P8.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_2 # break
 __label_6: # case
.annotate 'line', 6268
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6269
    new $P9, [ 'OpSameExpr' ]
    $P9.'OpSameExpr'(1, __ARG_2, $P3, $P1, $P2)
    set $P1, $P9
    goto __label_2 # break
 __label_7: # case
.annotate 'line', 6272
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6273
    new $P10, [ 'OpSameExpr' ]
    $P10.'OpSameExpr'(0, __ARG_2, $P3, $P1, $P2)
    set $P1, $P10
    goto __label_2 # break
 __label_3: # default
.annotate 'line', 6276
    'InternalError'('Invalid code in parseExpr_8', $P3)
 __label_2: # switch end
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6279
    __ARG_1.'unget'($P3)
.annotate 'line', 6280
    .return($P1)
# }
.annotate 'line', 6281

.end # parseExpr_9


.sub 'parseExpr_10'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6285
.const 'Sub' $P4 = 'parseExpr_9'
.annotate 'line', 6287
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6288
# var t: $P2
    null $P2
 __label_1: # while
.annotate 'line', 6289
    $P2 = __ARG_1.'get'()
    $P5 = $P2.'isop'('&')
    if_null $P5, __label_0
    unless $P5 goto __label_0
# {
.annotate 'line', 6290
# var rexpr: $P3
    $P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6291
    new $P5, [ 'OpBinAndExpr' ]
    $P5.'OpBinAndExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P5
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6293
    __ARG_1.'unget'($P2)
.annotate 'line', 6294
    .return($P1)
# }
.annotate 'line', 6295

.end # parseExpr_10


.sub 'parseExpr_11'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6299
.const 'Sub' $P4 = 'parseExpr_10'
.annotate 'line', 6301
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6302
# var t: $P2
    null $P2
 __label_1: # while
.annotate 'line', 6303
    $P2 = __ARG_1.'get'()
    $P5 = $P2.'isop'('^')
    if_null $P5, __label_0
    unless $P5 goto __label_0
# {
.annotate 'line', 6304
# var rexpr: $P3
    $P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6305
    new $P5, [ 'OpBinXorExpr' ]
    $P5.'OpBinXorExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P5
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6307
    __ARG_1.'unget'($P2)
.annotate 'line', 6308
    .return($P1)
# }
.annotate 'line', 6309

.end # parseExpr_11


.sub 'parseExpr_12'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6313
.const 'Sub' $P4 = 'parseExpr_11'
.annotate 'line', 6315
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6316
# var t: $P2
    null $P2
 __label_1: # while
.annotate 'line', 6317
    $P2 = __ARG_1.'get'()
    $P5 = $P2.'isop'('|')
    if_null $P5, __label_0
    unless $P5 goto __label_0
# {
.annotate 'line', 6318
# var rexpr: $P3
    $P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6319
    new $P5, [ 'OpBinOrExpr' ]
    $P5.'OpBinOrExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P5
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6321
    __ARG_1.'unget'($P2)
.annotate 'line', 6322
    .return($P1)
# }
.annotate 'line', 6323

.end # parseExpr_12


.sub 'parseExpr_13'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6327
.const 'Sub' $P4 = 'parseExpr_12'
.annotate 'line', 6329
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6330
# var t: $P2
    null $P2
 __label_1: # while
.annotate 'line', 6331
    $P2 = __ARG_1.'get'()
    $P5 = $P2.'isop'('&&')
    if_null $P5, __label_0
    unless $P5 goto __label_0
# {
.annotate 'line', 6332
# var rexpr: $P3
    $P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6333
    new $P5, [ 'OpBoolAndExpr' ]
    $P5.'OpBoolAndExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P5
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6335
    __ARG_1.'unget'($P2)
.annotate 'line', 6336
    .return($P1)
# }
.annotate 'line', 6337

.end # parseExpr_13


.sub 'parseExpr_14'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6341
.const 'Sub' $P4 = 'parseExpr_13'
.annotate 'line', 6343
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6344
# var t: $P2
    null $P2
 __label_1: # while
.annotate 'line', 6345
    $P2 = __ARG_1.'get'()
    $P5 = $P2.'isop'('||')
    if_null $P5, __label_0
    unless $P5 goto __label_0
# {
.annotate 'line', 6346
# var rexpr: $P3
    $P3 = 'parseExpr_12'(__ARG_1, __ARG_2)
.annotate 'line', 6347
    new $P5, [ 'OpBoolOrExpr' ]
    $P5.'OpBoolOrExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P5
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6349
    __ARG_1.'unget'($P2)
.annotate 'line', 6350
    .return($P1)
# }
.annotate 'line', 6351

.end # parseExpr_14


.sub 'parseExpr_15'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6355
.const 'Sub' $P5 = 'parseExpr_16'
.annotate 'line', 6356
.const 'Sub' $P6 = 'parseExpr_14'
.annotate 'line', 6358
# var econd: $P1
    $P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 6359
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 6360
    $P7 = $P2.'isop'('?')
    if_null $P7, __label_0
    unless $P7 goto __label_0
# {
.annotate 'line', 6361
# var etrue: $P3
    $P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6362
    'ExpectOp'(':', __ARG_1)
.annotate 'line', 6363
# var efalse: $P4
    $P4 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6364
    new $P8, [ 'OpConditionalExpr' ]
    $P8.'OpConditionalExpr'(__ARG_2, $P2, $P1, $P3, $P4)
    set $P7, $P8
    .return($P7)
# }
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 6367
    __ARG_1.'unget'($P2)
.annotate 'line', 6368
    .return($P1)
# }
 __label_1: # endif
# }
.annotate 'line', 6370

.end # parseExpr_15


.sub 'parseExpr_16'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6374
.const 'Sub' $P5 = 'parseExpr_16'
.annotate 'line', 6375
.const 'Sub' $P6 = 'parseExpr_15'
.annotate 'line', 6376
.const 'Sub' $P7 = 'getOpCode_16'
.annotate 'line', 6378
# var lexpr: $P1
    $P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 6379
# var t: $P2
    null $P2
.annotate 'line', 6380
# code: $I1
    null $I1
 __label_1: # while
.annotate 'line', 6381
    $P2 = __ARG_1.'get'()
    $P8 = $P7($P2)
    set $I1, $P8
    eq $I1, 0, __label_0
# {
.annotate 'line', 6382
# var rexpr: $P3
    $P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6383
# var expr: $P4
    null $P4
.annotate 'line', 6384
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
# switch
 __label_4: # case
.annotate 'line', 6386
    new $P4, [ 'OpAssignExpr' ]
    goto __label_2 # break
 __label_5: # case
.annotate 'line', 6389
    new $P4, [ 'OpAssignToExpr' ]
    goto __label_2 # break
 __label_6: # case
.annotate 'line', 6392
    new $P4, [ 'OpAddToExpr' ]
    goto __label_2 # break
 __label_7: # case
.annotate 'line', 6395
    new $P4, [ 'OpSubToExpr' ]
    goto __label_2 # break
 __label_8: # case
.annotate 'line', 6398
    new $P4, [ 'OpMulToExpr' ]
    goto __label_2 # break
 __label_9: # case
.annotate 'line', 6401
    new $P4, [ 'OpDivToExpr' ]
    goto __label_2 # break
 __label_10: # case
.annotate 'line', 6404
    new $P4, [ 'OpModToExpr' ]
    goto __label_2 # break
 __label_3: # default
.annotate 'line', 6407
    'InternalError'('Unexpected code in parseExpr_16', $P2)
 __label_2: # switch end
.annotate 'line', 6409
    $P4.'set'(__ARG_2, $P2, $P1, $P3)
.annotate 'line', 6410
    set $P1, $P4
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6412
    __ARG_1.'unget'($P2)
.annotate 'line', 6413
    .return($P1)
# }
.annotate 'line', 6414

.end # parseExpr_16


.sub 'parseExpr'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6418
.const 'Sub' $P1 = 'parseExpr_16'
.annotate 'line', 6420
    .tailcall $P1(__ARG_1, __ARG_2)
# }
.annotate 'line', 6421

.end # parseExpr

.namespace [ 'Breakable' ]

.sub 'genbreaklabel' :method
# Body
# {
.annotate 'line', 6436
    getattribute $P1, self, 'brlabel'
    if_null $P1, __label_0
.annotate 'line', 6437
    'InternalError'('attempt to generate break label twice')
 __label_0: # endif
.annotate 'line', 6438
# label: $S1
    $P1 = self.'genlabel'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
 __label_1:
.annotate 'line', 6439
    box $P1, $S1
    setattribute self, 'brlabel', $P1
.annotate 'line', 6440
    .return($S1)
# }
.annotate 'line', 6441

.end # genbreaklabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6444
# var label: $P1
    getattribute $P1, self, 'brlabel'
.annotate 'line', 6445
    unless_null $P1, __label_0
.annotate 'line', 6446
    'InternalError'('attempt to get break label before creating it')
 __label_0: # endif
.annotate 'line', 6447
    .return($P1)
# }
.annotate 'line', 6448

.end # getbreaklabel

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Breakable' ]
.annotate 'line', 6432
    addattribute $P0, 'brlabel'
.end
.namespace [ 'Continuable' ]

.sub 'gencontinuelabel' :method
# Body
# {
.annotate 'line', 6457
    getattribute $P1, self, 'cntlabel'
    if_null $P1, __label_0
.annotate 'line', 6458
    'InternalError'('attempt to generate continue label twice')
 __label_0: # endif
.annotate 'line', 6459
# label: $S1
    $P1 = self.'genlabel'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
 __label_1:
.annotate 'line', 6460
    box $P1, $S1
    setattribute self, 'cntlabel', $P1
.annotate 'line', 6461
    .return($S1)
# }
.annotate 'line', 6462

.end # gencontinuelabel


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6465
# var label: $P1
    getattribute $P1, self, 'cntlabel'
.annotate 'line', 6466
    unless_null $P1, __label_0
.annotate 'line', 6467
    'InternalError'('attempt to get continue label before creating it')
 __label_0: # endif
.annotate 'line', 6468
    .return($P1)
# }
.annotate 'line', 6469

.end # getcontinuelabel

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Continuable' ]
.annotate 'line', 6451
    get_class $P1, [ 'Breakable' ]
    addparent $P0, $P1
.annotate 'line', 6453
    addattribute $P0, 'cntlabel'
.end
.namespace [ 'ReturnYieldStatement' ]

.sub 'parse' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6485
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6486
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6487
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_0
# {
.annotate 'line', 6488
    __ARG_2.'unget'($P1)
.annotate 'line', 6489
    new $P4, [ 'ArgumentList' ]
    $P4.'ArgumentList'(__ARG_3, __ARG_1, __ARG_2, ";")
    set $P3, $P4
    setattribute self, 'values', $P3
# }
 __label_0: # endif
# }
.annotate 'line', 6491

.end # parse


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6494
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 6495
    if_null $P1, __label_0
.annotate 'line', 6496
    $P1 = $P1.'optimize'()
 __label_0: # endif
.annotate 'line', 6497
    .return(self)
# }
.annotate 'line', 6498

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6502
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 6503
# n: $I1
    unless_null $P1, __label_1
    null $I1
    goto __label_0
 __label_1:
# predefined int
    $P3 = $P1.'numargs'()
    set $I1, $P3
 __label_0:
.annotate 'line', 6506
    iseq $I2, $I1, 1
    unless $I2 goto __label_3
    isa $I2, self, [ 'ReturnStatement' ]
 __label_3:
    unless $I2 goto __label_2
# {
.annotate 'line', 6507
# var func: $P2
    $P2 = $P1.'getfreearg'(0)
.annotate 'line', 6508
    $P3 = $P2.'cantailcall'()
    if_null $P3, __label_4
    unless $P3 goto __label_4
# {
.annotate 'line', 6509
    self.'annotate'(__ARG_1)
.annotate 'line', 6510
    .tailcall $P2.'emit'(__ARG_1, '.tailcall')
# }
 __label_4: # endif
# }
 __label_2: # endif
.annotate 'line', 6514
    le $I1, 0, __label_5
.annotate 'line', 6515
    $P1.'getargvalues'(__ARG_1)
 __label_5: # endif
.annotate 'line', 6517
    self.'annotate'(__ARG_1)
.annotate 'line', 6518
    self.'emitret'(__ARG_1)
.annotate 'line', 6519
    le $I1, 0, __label_6
.annotate 'line', 6520
    $P1.'emitargs'(__ARG_1)
 __label_6: # endif
.annotate 'line', 6521
    __ARG_1.'say'(')')
# }
.annotate 'line', 6522

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ReturnYieldStatement' ]
.annotate 'line', 6479
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 6481
    addattribute $P0, 'values'
.end
.namespace [ 'ReturnStatement' ]

.sub 'ReturnStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6529
    self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6530

.end # ReturnStatement


.sub 'emitret' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6533
    __ARG_1.'print'('    ', '.return(')
# }
.annotate 'line', 6534

.end # emitret

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ReturnStatement' ]
.annotate 'line', 6525
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
.annotate 'line', 6541
    self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6542

.end # YieldStatement


.sub 'emitret' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6545
    __ARG_1.'print'('    ', '.yield(')
# }
.annotate 'line', 6546

.end # emitret

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'YieldStatement' ]
.annotate 'line', 6537
    get_class $P1, [ 'ReturnYieldStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'LabelStatement' ]

.sub 'LabelStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6559
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 6560
    setattribute self, 'name', __ARG_1
.annotate 'line', 6561
# value: $S1
    getattribute $P2, self, 'owner'
    $P1 = $P2.'createlabel'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 6562
    box $P1, $S1
    setattribute self, 'value', $P1
# }
.annotate 'line', 6563

.end # LabelStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6564
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6567
    self.'annotate'(__ARG_1)
.annotate 'line', 6568
# name: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 6569
# comment: $S2
    concat $S2, 'label ', $S1
.annotate 'line', 6570
    getattribute $P1, self, 'value'
    __ARG_1.'emitlabel'($P1, $S2)
# }
.annotate 'line', 6571

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'LabelStatement' ]
.annotate 'line', 6553
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 6555
    addattribute $P0, 'name'
.annotate 'line', 6556
    addattribute $P0, 'value'
.end
.namespace [ 'Reflabel' ]

.sub 'Reflabel' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 6585
    setattribute self, 'owner', __ARG_1
.annotate 'line', 6586
    box $P1, __ARG_2
    setattribute self, 'label', $P1
# }
.annotate 'line', 6587

.end # Reflabel


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6588
    .return(self)
# }

.end # optimize


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6591
# label: $S1
    getattribute $P1, self, 'label'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 6592
# value: $S2
    getattribute $P2, self, 'owner'
    $P1 = $P2.'getlabel'($S1)
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 6593
    .return($S2)
# }
.annotate 'line', 6594

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Reflabel' ]
.annotate 'line', 6580
    addattribute $P0, 'owner'
.annotate 'line', 6581
    addattribute $P0, 'label'
.end
.namespace [ 'GotoStatement' ]

.sub 'GotoStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6607
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6608
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6609
    'RequireIdentifier'($P1)
.annotate 'line', 6610
    setattribute self, 'label', $P1
.annotate 'line', 6611
    'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 6612

.end # GotoStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6613
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6616
    self.'annotate'(__ARG_1)
.annotate 'line', 6617
# label: $S1
    getattribute $P1, self, 'label'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 6618
# value: $S2
    $P1 = self.'getlabel'($S1)
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 6619
    concat $S3, 'goto ', $S1
    __ARG_1.'emitgoto'($S2, $S3)
# }
.annotate 'line', 6620

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'GotoStatement' ]
.annotate 'line', 6601
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 6603
    addattribute $P0, 'label'
.end
.namespace [ 'ConditionalStatement' ]

.sub 'parseconditionshort' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6631
    $P1 = 'parseExpr'(__ARG_1, self)
    self.'set'($P1)
# }
.annotate 'line', 6632

.end # parseconditionshort


.sub 'parsecondition' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6635
    'ExpectOp'('(', __ARG_1)
.annotate 'line', 6636
    $P1 = 'parseExpr'(__ARG_1, self)
    self.'set'($P1)
.annotate 'line', 6637
    'ExpectOp'(')', __ARG_1)
# }
.annotate 'line', 6638

.end # parsecondition

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ConditionalStatement' ]
.annotate 'line', 6627
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
.annotate 'line', 6651
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6652
    self.'parsecondition'(__ARG_2)
.annotate 'line', 6653
    $P3 = 'parseStatement'(__ARG_2, self)
    setattribute self, 'truebranch', $P3
.annotate 'line', 6654
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6655
    $P2 = $P1.'iskeyword'("else")
    if_null $P2, __label_0
    unless $P2 goto __label_0
.annotate 'line', 6656
    $P4 = 'parseStatement'(__ARG_2, self)
    setattribute self, 'falsebranch', $P4
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 6658
    new $P6, [ 'EmptyStatement' ]
    setattribute self, 'falsebranch', $P6
.annotate 'line', 6659
    __ARG_2.'unget'($P1)
# }
 __label_1: # endif
# }
.annotate 'line', 6661

.end # IfStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6664
    self.'optimize_condition'()
.annotate 'line', 6665
# checkvalue: $I1
    $P1 = self.'getvalue'()
    set $I1, $P1
.annotate 'line', 6666
    getattribute $P3, self, 'truebranch'
    $P2 = $P3.'optimize'()
    setattribute self, 'truebranch', $P2
.annotate 'line', 6667
    getattribute $P3, self, 'falsebranch'
    $P2 = $P3.'optimize'()
    setattribute self, 'falsebranch', $P2
.annotate 'line', 6668
    set $I2, $I1
    set $I3, 1
    if $I2 == $I3 goto __label_2
    set $I3, 2
    if $I2 == $I3 goto __label_3
    goto __label_1
# switch
 __label_2: # case
.annotate 'line', 6670
    getattribute $P1, self, 'truebranch'
    .return($P1)
 __label_3: # case
.annotate 'line', 6672
    getattribute $P2, self, 'falsebranch'
    .return($P2)
 __label_1: # default
 __label_0: # switch end
.annotate 'line', 6674
    .return(self)
# }
.annotate 'line', 6675

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6678
# var truebranch: $P1
    getattribute $P1, self, 'truebranch'
.annotate 'line', 6679
# var falsebranch: $P2
    getattribute $P2, self, 'falsebranch'
.annotate 'line', 6680
# t_empty: $I1
    $P3 = $P1.'isempty'()
    set $I1, $P3
.annotate 'line', 6681
# f_empty: $I2
    $P3 = $P2.'isempty'()
    set $I2, $P3
.annotate 'line', 6682
# elselabel: $S1
    set $S1, ''
.annotate 'line', 6683
    not $I3, $I2
    unless $I3 goto __label_0
.annotate 'line', 6684
    $P3 = self.'genlabel'()
    set $S1, $P3
 __label_0: # endif
.annotate 'line', 6685
# endlabel: $S2
    $P3 = self.'genlabel'()
    null $S2
    if_null $P3, __label_1
    set $S2, $P3
 __label_1:
.annotate 'line', 6686
# cond_false: $S3
    unless $I2 goto __label_3
    set $S3, $S2
    goto __label_2
 __label_3:
    set $S3, $S1
 __label_2:
.annotate 'line', 6687
    self.'annotate'(__ARG_1)
.annotate 'line', 6688
    self.'emit_else'(__ARG_1, $S3)
.annotate 'line', 6689
    $P1.'emit'(__ARG_1)
.annotate 'line', 6691
    not $I3, $I2
    unless $I3 goto __label_4
# {
.annotate 'line', 6692
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 6693
    __ARG_1.'emitlabel'($S1, 'else')
.annotate 'line', 6694
    $P2.'emit'(__ARG_1)
# }
 __label_4: # endif
.annotate 'line', 6696
    __ARG_1.'emitlabel'($S2, 'endif')
# }
.annotate 'line', 6697

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IfStatement' ]
.annotate 'line', 6645
    get_class $P1, [ 'ConditionalStatement' ]
    addparent $P0, $P1
.annotate 'line', 6647
    addattribute $P0, 'truebranch'
.annotate 'line', 6648
    addattribute $P0, 'falsebranch'
.end
.namespace [ 'LoopStatement' ]

.sub 'parsebody' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6709
    $P2 = 'parseStatement'(__ARG_1, self)
    setattribute self, 'body', $P2
# }
.annotate 'line', 6710

.end # parsebody


.sub 'emit_infinite' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6713
# breaklabel: $S1
    $P1 = self.'genbreaklabel'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 6714
# continuelabel: $S2
    $P1 = self.'gencontinuelabel'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 6716
    self.'annotate'(__ARG_1)
.annotate 'line', 6717
    __ARG_1.'emitlabel'($S2, 'Infinite loop')
.annotate 'line', 6718
    getattribute $P1, self, 'body'
    $P1.'emit'(__ARG_1)
.annotate 'line', 6719
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 6720
    __ARG_1.'emitlabel'($S1, 'Infinite loop end')
# }
.annotate 'line', 6721

.end # emit_infinite

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'LoopStatement' ]
.annotate 'line', 6704
    get_class $P1, [ 'Continuable' ]
    addparent $P0, $P1
.annotate 'line', 6706
    addattribute $P0, 'body'
.end
.namespace [ 'WhileStatement' ]

.sub 'WhileStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6732
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6733
    self.'parsecondition'(__ARG_2)
.annotate 'line', 6734
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 6735

.end # WhileStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6738
    self.'optimize_condition'()
.annotate 'line', 6739
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 6740
    .return(self)
# }
.annotate 'line', 6741

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6744
    $P1 = self.'getvalue'()
    set $I1, $P1
    set $I2, 1
    if $I1 == $I2 goto __label_2
    set $I2, 2
    if $I1 == $I2 goto __label_3
    goto __label_1
# switch
 __label_2: # case
.annotate 'line', 6746
    self.'emit_infinite'(__ARG_1)
    goto __label_0 # break
 __label_3: # case
.annotate 'line', 6749
    __ARG_1.'comment'('while(false) optimized out')
    goto __label_0 # break
 __label_1: # default
.annotate 'line', 6752
# breaklabel: $S1
    $P2 = self.'genbreaklabel'()
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
 __label_4:
.annotate 'line', 6753
# continuelabel: $S2
    $P3 = self.'gencontinuelabel'()
    null $S2
    if_null $P3, __label_5
    set $S2, $P3
 __label_5:
.annotate 'line', 6755
    self.'annotate'(__ARG_1)
.annotate 'line', 6756
    __ARG_1.'emitlabel'($S2, 'while')
.annotate 'line', 6757
    self.'emit_else'(__ARG_1, $S1)
.annotate 'line', 6758
    getattribute $P4, self, 'body'
    $P4.'emit'(__ARG_1)
.annotate 'line', 6759
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 6760
    __ARG_1.'emitlabel'($S1, 'endwhile')
 __label_0: # switch end
# }
.annotate 'line', 6762

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'WhileStatement' ]
.annotate 'line', 6728
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
.annotate 'line', 6773
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6774
    self.'parsebody'(__ARG_2)
.annotate 'line', 6775
    'ExpectKeyword'('while', __ARG_2)
.annotate 'line', 6776
    self.'parsecondition'(__ARG_2)
# }
.annotate 'line', 6777

.end # DoStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6780
    self.'optimize_condition'()
.annotate 'line', 6781
# var body: $P1
    getattribute $P2, self, 'body'
    $P1 = $P2.'optimize'()
.annotate 'line', 6782
    $I1 = $P1.'isempty'()
    unless $I1 goto __label_1
    $P2 = self.'getvalue'()
    set $I2, $P2
    iseq $I1, $I2, 2
 __label_1:
    unless $I1 goto __label_0
.annotate 'line', 6783
    new $P3, [ 'EmptyStatement' ]
    .return($P3)
 __label_0: # endif
.annotate 'line', 6784
    setattribute self, 'body', $P1
.annotate 'line', 6785
    .return(self)
# }
.annotate 'line', 6786

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6789
# var body: $P1
    getattribute $P1, self, 'body'
.annotate 'line', 6790
# condvalue: $I1
    $P2 = self.'getvalue'()
    set $I1, $P2
.annotate 'line', 6791
    set $I2, $I1
    set $I3, 1
    if $I2 == $I3 goto __label_2
    goto __label_1
# switch
 __label_2: # case
.annotate 'line', 6793
    self.'emit_infinite'(__ARG_1)
    goto __label_0 # break
 __label_1: # default
.annotate 'line', 6796
# looplabel: $S1
    $P2 = self.'genlabel'()
    null $S1
    if_null $P2, __label_3
    set $S1, $P2
 __label_3:
.annotate 'line', 6797
# breaklabel: $S2
    $P3 = self.'genbreaklabel'()
    null $S2
    if_null $P3, __label_4
    set $S2, $P3
 __label_4:
.annotate 'line', 6798
# continuelabel: $S3
    $P4 = self.'gencontinuelabel'()
    null $S3
    if_null $P4, __label_5
    set $S3, $P4
 __label_5:
.annotate 'line', 6800
    self.'annotate'(__ARG_1)
.annotate 'line', 6801
    __ARG_1.'emitlabel'($S1, 'do')
.annotate 'line', 6803
    $P1.'emit'(__ARG_1)
.annotate 'line', 6804
    __ARG_1.'emitlabel'($S3, 'continue')
.annotate 'line', 6805
    eq $I1, 2, __label_6
.annotate 'line', 6806
    self.'emit_if'(__ARG_1, $S1, $S2)
 __label_6: # endif
.annotate 'line', 6807
    __ARG_1.'emitlabel'($S2, 'enddo')
 __label_0: # switch end
# }
.annotate 'line', 6809

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'DoStatement' ]
.annotate 'line', 6769
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
.annotate 'line', 6820
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6821
    'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 6822

.end # ContinueStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6823
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6826
    self.'annotate'(__ARG_1)
.annotate 'line', 6827
# label: $S1
    getattribute $P2, self, 'start'
    $P1 = self.'getcontinuelabel'($P2)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 6828
    __ARG_1.'emitgoto'($S1, 'continue')
# }
.annotate 'line', 6829

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ContinueStatement' ]
.annotate 'line', 6816
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
.annotate 'line', 6840
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6841
    'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 6842

.end # BreakStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6843
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6846
    self.'annotate'(__ARG_1)
.annotate 'line', 6847
# label: $S1
    getattribute $P2, self, 'start'
    $P1 = self.'getbreaklabel'($P2)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 6848
    __ARG_1.'emitgoto'($S1, 'break')
# }
.annotate 'line', 6849

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'BreakStatement' ]
.annotate 'line', 6836
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'SwitchStatement' ]

.sub 'SwitchStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6865
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6866
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6867
    $P3 = $P1.'isop'('(')
    isfalse $I1, $P3
    unless $I1 goto __label_0
.annotate 'line', 6868
    'Expected'("'(' in switch", $P1)
 __label_0: # endif
.annotate 'line', 6869
    $P4 = 'parseExpr'(__ARG_2, self)
    setattribute self, 'condition', $P4
.annotate 'line', 6870
    $P1 = __ARG_2.'get'()
.annotate 'line', 6871
    $P3 = $P1.'isop'(')')
    isfalse $I1, $P3
    unless $I1 goto __label_1
.annotate 'line', 6872
    'Expected'("')' in switch", $P1)
 __label_1: # endif
.annotate 'line', 6873
    $P1 = __ARG_2.'get'()
.annotate 'line', 6874
    $P3 = $P1.'isop'('{')
    isfalse $I1, $P3
    unless $I1 goto __label_2
.annotate 'line', 6875
    'Expected'("'{' in switch", $P1)
 __label_2: # endif
.annotate 'line', 6876
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'case_value', $P4
.annotate 'line', 6877
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'case_st', $P4
.annotate 'line', 6878
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'default_st', $P4
 __label_4: # while
.annotate 'line', 6879
    $P1 = __ARG_2.'get'()
    $I1 = $P1.'iskeyword'('case')
    if $I1 goto __label_5
    $I1 = $P1.'iskeyword'('default')
 __label_5:
    unless $I1 goto __label_3
# {
.annotate 'line', 6880
    $P3 = $P1.'iskeyword'('case')
    if_null $P3, __label_6
    unless $P3 goto __label_6
# {
.annotate 'line', 6881
    getattribute $P4, self, 'case_value'
    $P5 = 'parseExpr'(__ARG_2, self)
# predefined push
    push $P4, $P5
.annotate 'line', 6882
    $P1 = __ARG_2.'get'()
.annotate 'line', 6883
    $P3 = $P1.'isop'(':')
    isfalse $I1, $P3
    unless $I1 goto __label_8
.annotate 'line', 6884
    'Expected'("':' in case", $P1)
 __label_8: # endif
.annotate 'line', 6885
# var st: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
 __label_10: # while
.annotate 'line', 6886
    $P1 = __ARG_2.'get'()
    $I2 = $P1.'isop'('}')
    if $I2 goto __label_12
    $I2 = $P1.'iskeyword'('case')
 __label_12:
    if $I2 goto __label_11
    $I2 = $P1.'iskeyword'('default')
 __label_11:
    not $I1, $I2
    unless $I1 goto __label_9
# {
.annotate 'line', 6887
    __ARG_2.'unget'($P1)
.annotate 'line', 6888
    $P3 = 'parseStatement'(__ARG_2, self)
# predefined push
    push $P2, $P3
# }
    goto __label_10
 __label_9: # endwhile
.annotate 'line', 6890
    getattribute $P3, self, 'case_st'
# predefined push
    push $P3, $P2
.annotate 'line', 6891
    __ARG_2.'unget'($P1)
# }
    goto __label_7
 __label_6: # else
# {
.annotate 'line', 6894
    $P1 = __ARG_2.'get'()
.annotate 'line', 6895
    $P3 = $P1.'isop'(':')
    isfalse $I1, $P3
    unless $I1 goto __label_13
.annotate 'line', 6896
    'Expected'("':' in default", $P1)
 __label_13: # endif
 __label_15: # while
.annotate 'line', 6897
    $P1 = __ARG_2.'get'()
    $I2 = $P1.'isop'('}')
    if $I2 goto __label_17
    $I2 = $P1.'iskeyword'('case')
 __label_17:
    if $I2 goto __label_16
    $I2 = $P1.'iskeyword'('default')
 __label_16:
    not $I1, $I2
    unless $I1 goto __label_14
# {
.annotate 'line', 6898
    __ARG_2.'unget'($P1)
.annotate 'line', 6899
    getattribute $P3, self, 'default_st'
    $P4 = 'parseStatement'(__ARG_2, self)
# predefined push
    push $P3, $P4
# }
    goto __label_15
 __label_14: # endwhile
.annotate 'line', 6901
    __ARG_2.'unget'($P1)
# }
 __label_7: # endif
# }
    goto __label_4
 __label_3: # endwhile
# }
.annotate 'line', 6904

.end # SwitchStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6907
    getattribute $P4, self, 'condition'
    $P3 = $P4.'optimize'()
    setattribute self, 'condition', $P3
.annotate 'line', 6908
    getattribute $P2, self, 'case_value'
    'optimize_array'($P2)
.annotate 'line', 6909
    getattribute $P2, self, 'case_st'
    iter $P5, $P2
    set $P5, 0
 __label_0: # for iteration
    unless $P5 goto __label_1
    shift $P1, $P5
.annotate 'line', 6910
    'optimize_array'($P1)
    goto __label_0
 __label_1: # endfor
.annotate 'line', 6911
    getattribute $P2, self, 'default_st'
    'optimize_array'($P2)
.annotate 'line', 6912
    .return(self)
# }
.annotate 'line', 6913

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6917
# type: $S1
    set $S1, ''
.annotate 'line', 6918
    getattribute $P10, self, 'case_value'
    iter $P11, $P10
    set $P11, 0
 __label_0: # for iteration
    unless $P11 goto __label_1
    shift $P1, $P11
# {
.annotate 'line', 6919
# t: $S2
    $P12 = $P1.'checkresult'()
    null $S2
    if_null $P12, __label_2
    set $S2, $P12
 __label_2:
.annotate 'line', 6920
    ne $S2, 'N', __label_3
.annotate 'line', 6921
    getattribute $P10, self, 'start'
    'SyntaxError'("Invalid type in case", $P10)
 __label_3: # endif
.annotate 'line', 6922
    ne $S1, '', __label_4
.annotate 'line', 6923
    set $S1, $S2
    goto __label_5
 __label_4: # else
.annotate 'line', 6924
    eq $S1, $S2, __label_6
.annotate 'line', 6925
    set $S1, 'P'
 __label_6: # endif
 __label_5: # endif
# }
    goto __label_0
 __label_1: # endfor
.annotate 'line', 6928
# var condition: $P2
    getattribute $P2, self, 'condition'
.annotate 'line', 6929
# var condtype: $P3
    $P3 = $P2.'checkresult'()
.annotate 'line', 6933
    ne $S1, '', __label_7
.annotate 'line', 6934
    set $S1, $P3
 __label_7: # endif
.annotate 'line', 6936
# reg: $S3
    $P10 = self.'tempreg'($S1)
    null $S3
    if_null $P10, __label_8
    set $S3, $P10
 __label_8:
.annotate 'line', 6937
    set $S9, $P3
    ne $S9, $S1, __label_9
.annotate 'line', 6938
    $P2.'emit'(__ARG_1, $S3)
    goto __label_10
 __label_9: # else
# {
.annotate 'line', 6940
# regcond: $S4
    $P10 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P10, __label_11
    set $S4, $P10
 __label_11:
.annotate 'line', 6941
    __ARG_1.'emitset'($S3, $S4)
# }
 __label_10: # endif
.annotate 'line', 6945
    self.'genbreaklabel'()
.annotate 'line', 6946
# defaultlabel: $S5
    $P10 = self.'genlabel'()
    null $S5
    if_null $P10, __label_12
    set $S5, $P10
 __label_12:
.annotate 'line', 6947
    new $P4, ['ResizableStringArray']
.annotate 'line', 6948
# regval: $S6
    $P10 = self.'tempreg'($S1)
    null $S6
    if_null $P10, __label_13
    set $S6, $P10
 __label_13:
.annotate 'line', 6949
    getattribute $P10, self, 'case_value'
    iter $P13, $P10
    set $P13, 0
 __label_14: # for iteration
    unless $P13 goto __label_15
    shift $P5, $P13
# {
.annotate 'line', 6950
# label: $S7
    $P12 = self.'genlabel'()
    null $S7
    if_null $P12, __label_16
    set $S7, $P12
 __label_16:
.annotate 'line', 6951
# predefined push
    push $P4, $S7
.annotate 'line', 6952
    $P5.'emit'(__ARG_1, $S6)
.annotate 'line', 6953
    __ARG_1.'say'('    ', 'if ', $S3, ' == ', $S6, ' goto ', $S7)
# }
    goto __label_14
 __label_15: # endfor
.annotate 'line', 6955
    __ARG_1.'emitgoto'($S5)
.annotate 'line', 6958
    __ARG_1.'comment'('switch')
.annotate 'line', 6959
    self.'annotate'(__ARG_1)
.annotate 'line', 6960
# var case_st: $P6
    getattribute $P6, self, 'case_st'
.annotate 'line', 6961
# n: $I1
    set $P10, $P6
    set $I1, $P10
# for loop
.annotate 'line', 6962
# i: $I2
    null $I2
 __label_19: # for condition
    ge $I2, $I1, __label_18
# {
.annotate 'line', 6963
# l: $S8
    $S8 = $P4[$I2]
.annotate 'line', 6964
    __ARG_1.'emitlabel'($S8, 'case')
.annotate 'line', 6965
# var casest: $P7
    $P7 = $P6[$I2]
.annotate 'line', 6966
    iter $P14, $P7
    set $P14, 0
 __label_20: # for iteration
    unless $P14 goto __label_21
    shift $P8, $P14
.annotate 'line', 6967
    $P8.'emit'(__ARG_1)
    goto __label_20
 __label_21: # endfor
# }
 __label_17: # for iteration
.annotate 'line', 6962
    inc $I2
    goto __label_19
 __label_18: # for end
.annotate 'line', 6970
    __ARG_1.'emitlabel'($S5, 'default')
.annotate 'line', 6971
    getattribute $P10, self, 'default_st'
    iter $P15, $P10
    set $P15, 0
 __label_22: # for iteration
    unless $P15 goto __label_23
    shift $P9, $P15
.annotate 'line', 6972
    $P9.'emit'(__ARG_1)
    goto __label_22
 __label_23: # endfor
.annotate 'line', 6974
    getattribute $P12, self, 'start'
    $P10 = self.'getbreaklabel'($P12)
    __ARG_1.'emitlabel'($P10, 'switch end')
# }
.annotate 'line', 6975

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'SwitchStatement' ]
.annotate 'line', 6856
    get_class $P1, [ 'Breakable' ]
    addparent $P0, $P1
    get_class $P2, [ 'Statement' ]
    addparent $P0, $P2
.annotate 'line', 6858
    addattribute $P0, 'condition'
.annotate 'line', 6859
    addattribute $P0, 'case_value'
.annotate 'line', 6860
    addattribute $P0, 'case_st'
.annotate 'line', 6861
    addattribute $P0, 'default_st'
.end
.namespace [ 'ForStatement' ]

.sub 'ForStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6989
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6990
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6991
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_0
# {
.annotate 'line', 6992
    __ARG_2.'unget'($P1)
.annotate 'line', 6993
    $P3 = 'parseStatement'(__ARG_2, self)
    setattribute self, 'initializer', $P3
# }
 __label_0: # endif
.annotate 'line', 6995
    $P1 = __ARG_2.'get'()
.annotate 'line', 6996
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 6997
    __ARG_2.'unget'($P1)
.annotate 'line', 6998
    self.'parseconditionshort'(__ARG_2)
.annotate 'line', 6999
    'ExpectOp'(';', __ARG_2)
# }
 __label_1: # endif
.annotate 'line', 7001
    $P1 = __ARG_2.'get'()
.annotate 'line', 7002
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_2
# {
.annotate 'line', 7003
    __ARG_2.'unget'($P1)
.annotate 'line', 7004
    $P3 = 'parseExpr'(__ARG_2, self)
    setattribute self, 'iteration', $P3
.annotate 'line', 7005
    'ExpectOp'(')', __ARG_2)
# }
 __label_2: # endif
.annotate 'line', 7007
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 7008

.end # ForStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7011
    getattribute $P1, self, 'initializer'
    if_null $P1, __label_0
.annotate 'line', 7012
    getattribute $P4, self, 'initializer'
    $P3 = $P4.'optimize'()
    setattribute self, 'initializer', $P3
 __label_0: # endif
.annotate 'line', 7013
    getattribute $P1, self, 'condexpr'
    if_null $P1, __label_1
.annotate 'line', 7014
    self.'optimize_condition'()
 __label_1: # endif
.annotate 'line', 7015
    getattribute $P1, self, 'iteration'
    if_null $P1, __label_2
.annotate 'line', 7016
    getattribute $P4, self, 'iteration'
    $P3 = $P4.'optimize'()
    setattribute self, 'iteration', $P3
 __label_2: # endif
.annotate 'line', 7017
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 7018
    .return(self)
# }
.annotate 'line', 7019

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7022
    getattribute $P1, self, 'initializer'
    isnull $I1, $P1
    unless $I1 goto __label_2
.annotate 'line', 7023
    getattribute $P2, self, 'condexpr'
    isnull $I1, $P2
 __label_2:
    unless $I1 goto __label_1
.annotate 'line', 7024
    getattribute $P3, self, 'iteration'
    isnull $I1, $P3
 __label_1:
    unless $I1 goto __label_0
# {
.annotate 'line', 7025
    self.'emit_infinite'(__ARG_1)
.annotate 'line', 7026
    .return()
# }
 __label_0: # endif
.annotate 'line', 7028
    __ARG_1.'comment'('for loop')
.annotate 'line', 7029
# continuelabel: $S1
    $P1 = self.'gencontinuelabel'()
    null $S1
    if_null $P1, __label_3
    set $S1, $P1
 __label_3:
.annotate 'line', 7030
# breaklabel: $S2
    $P1 = self.'genbreaklabel'()
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
 __label_4:
.annotate 'line', 7031
# condlabel: $S3
    $P1 = self.'genlabel'()
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
 __label_5:
.annotate 'line', 7032
    getattribute $P1, self, 'initializer'
    if_null $P1, __label_6
.annotate 'line', 7033
    getattribute $P2, self, 'initializer'
    $P2.'emit'(__ARG_1)
 __label_6: # endif
.annotate 'line', 7035
    __ARG_1.'emitlabel'($S3, 'for condition')
.annotate 'line', 7036
    getattribute $P1, self, 'condexpr'
    if_null $P1, __label_7
.annotate 'line', 7037
    self.'emit_else'(__ARG_1, $S2)
 __label_7: # endif
.annotate 'line', 7039
    getattribute $P1, self, 'body'
    $P1.'emit'(__ARG_1)
.annotate 'line', 7040
    __ARG_1.'emitlabel'($S1, 'for iteration')
.annotate 'line', 7041
    getattribute $P1, self, 'iteration'
    if_null $P1, __label_8
.annotate 'line', 7042
# unused: $S4
    getattribute $P3, self, 'iteration'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S4
    if_null $P2, __label_9
    set $S4, $P2
 __label_9:
 __label_8: # endif
.annotate 'line', 7043
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 7045
    __ARG_1.'emitlabel'($S2, 'for end')
# }
.annotate 'line', 7046

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ForStatement' ]
.annotate 'line', 6982
    get_class $P1, [ 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'BlockStatement' ]
    addparent $P0, $P2
    get_class $P3, [ 'ConditionalStatement' ]
    addparent $P0, $P3
.annotate 'line', 6984
    addattribute $P0, 'initializer'
.annotate 'line', 6985
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
.annotate 'line', 7061
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7062
# sname: $S1
    set $P1, __ARG_4
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 7063
    eq __ARG_5, '', __label_1
# {
.annotate 'line', 7064
# deftype: $S2
    $P1 = 'typetoregcheck'(__ARG_5)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
 __label_2:
.annotate 'line', 7065
    self.'createvar'($S1, $S2)
.annotate 'line', 7066
    box $P1, $S2
    setattribute self, 'deftype', $P1
# }
 __label_1: # endif
.annotate 'line', 7068
    setattribute self, 'varname', __ARG_4
.annotate 'line', 7069
    $P2 = 'parseExpr'(__ARG_2, self)
    setattribute self, 'container', $P2
.annotate 'line', 7070
    'ExpectOp'(')', __ARG_2)
.annotate 'line', 7071
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 7072

.end # ForeachStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7075
    getattribute $P3, self, 'container'
    $P2 = $P3.'optimize'()
    setattribute self, 'container', $P2
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
    self.'annotate'(__ARG_1)
.annotate 'line', 7082
# regcont: $S1
    null $S1
.annotate 'line', 7083
    getattribute $P3, self, 'container'
    $P2 = $P3.'checkresult'()
    set $S6, $P2
    ne $S6, 'S', __label_0
# {
.annotate 'line', 7084
# value: $S2
    getattribute $P5, self, 'container'
    $P4 = $P5.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
 __label_2:
.annotate 'line', 7085
    $P2 = self.'tempreg'('P')
    set $S1, $P2
.annotate 'line', 7086
    __ARG_1.'emitbox'($S1, $S2)
# }
    goto __label_1
 __label_0: # else
.annotate 'line', 7089
    getattribute $P3, self, 'container'
    $P2 = $P3.'emit_get'(__ARG_1)
    set $S1, $P2
 __label_1: # endif
.annotate 'line', 7090
# var itvar: $P1
    getattribute $P2, self, 'varname'
    $P1 = self.'getvar'($P2)
.annotate 'line', 7091
# iterator: $S3
    $P2 = self.'createreg'('P')
    null $S3
    if_null $P2, __label_3
    set $S3, $P2
 __label_3:
.annotate 'line', 7092
# continuelabel: $S4
    $P2 = self.'gencontinuelabel'()
    null $S4
    if_null $P2, __label_4
    set $S4, $P2
 __label_4:
.annotate 'line', 7093
# breaklabel: $S5
    $P2 = self.'genbreaklabel'()
    null $S5
    if_null $P2, __label_5
    set $S5, $P2
 __label_5:
.annotate 'line', 7094
    __ARG_1.'emitarg2'('iter', $S3, $S1)
.annotate 'line', 7095
    __ARG_1.'emitset'($S3, '0')
.annotate 'line', 7096
    __ARG_1.'emitlabel'($S4, 'for iteration')
.annotate 'line', 7097
    __ARG_1.'emitunless'($S3, $S5)
.annotate 'line', 7098
    $P2 = $P1.'getreg'()
    __ARG_1.'emitarg2'('shift', $P2, $S3)
.annotate 'line', 7099
    getattribute $P2, self, 'body'
    $P2.'emit'(__ARG_1)
.annotate 'line', 7100
    __ARG_1.'emitgoto'($S4)
.annotate 'line', 7101
    __ARG_1.'emitlabel'($S5, 'endfor')
# }
.annotate 'line', 7102

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ForeachStatement' ]
.annotate 'line', 7053
    get_class $P1, [ 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'BlockStatement' ]
    addparent $P0, $P2
.annotate 'line', 7055
    addattribute $P0, 'deftype'
.annotate 'line', 7056
    addattribute $P0, 'varname'
.annotate 'line', 7057
    addattribute $P0, 'container'
.end
.namespace [ ]

.sub 'parseFor'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7109
    'ExpectOp'('(', __ARG_2)
.annotate 'line', 7110
# var aux: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7111
# var in1: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 7112
    $P4 = $P2.'iskeyword'('in')
    if_null $P4, __label_0
    unless $P4 goto __label_0
.annotate 'line', 7113
    new $P6, [ 'ForeachStatement' ]
    $P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, '')
    set $P5, $P6
    .return($P5)
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 7115
# var in2: $P3
    $P3 = __ARG_2.'get'()
.annotate 'line', 7116
    $P4 = $P3.'iskeyword'('in')
    if_null $P4, __label_2
    unless $P4 goto __label_2
.annotate 'line', 7117
    new $P6, [ 'ForeachStatement' ]
    $P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P2, $P1)
    set $P5, $P6
    .return($P5)
 __label_2: # endif
.annotate 'line', 7118
    __ARG_2.'unget'($P3)
.annotate 'line', 7119
    __ARG_2.'unget'($P2)
.annotate 'line', 7120
    __ARG_2.'unget'($P1)
# }
 __label_1: # endif
.annotate 'line', 7122
    new $P5, [ 'ForStatement' ]
    $P5.'ForStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 7123

.end # parseFor

.namespace [ 'ThrowStatement' ]

.sub 'ThrowStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7135
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7136
    $P2 = 'parseExpr'(__ARG_2, self)
    setattribute self, 'excep', $P2
# }
.annotate 'line', 7137

.end # ThrowStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7140
    getattribute $P3, self, 'excep'
    $P2 = $P3.'optimize'()
    setattribute self, 'excep', $P2
.annotate 'line', 7141
    .return(self)
# }
.annotate 'line', 7142

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7145
# var excep: $P1
    getattribute $P1, self, 'excep'
.annotate 'line', 7146
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 7147
    self.'annotate'(__ARG_1)
.annotate 'line', 7148
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    set $S3, 'P'
    if $S2 == $S3 goto __label_3
    set $S3, 'S'
    if $S2 == $S3 goto __label_4
    goto __label_2
# switch
 __label_3: # case
.annotate 'line', 7150
    __ARG_1.'emitarg1'('throw', $S1)
    goto __label_1 # break
 __label_4: # case
.annotate 'line', 7153
    __ARG_1.'emitarg1'('die', $S1)
    goto __label_1 # break
 __label_2: # default
.annotate 'line', 7156
    getattribute $P3, self, 'start'
    'SyntaxError'("Invalid throw argument", $P3)
 __label_1: # switch end
# }
.annotate 'line', 7158

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ThrowStatement' ]
.annotate 'line', 7129
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7131
    addattribute $P0, 'excep'
.end
.namespace [ 'TryModifierList' ]

.sub 'TryModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7170
    setattribute self, 'start', __ARG_1
.annotate 'line', 7171
    self.'ModifierList'(__ARG_2, __ARG_3)
# }
.annotate 'line', 7172

.end # TryModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 7175
# var modiflist: $P1
    $P1 = self.'getlist'()
.annotate 'line', 7176
    iter $P6, $P1
    set $P6, 0
 __label_0: # for iteration
    unless $P6 goto __label_1
    shift $P2, $P6
# {
.annotate 'line', 7177
# modifname: $S1
    $P7 = $P2.'getname'()
    null $S1
    if_null $P7, __label_2
    set $S1, $P7
 __label_2:
.annotate 'line', 7178
# nargs: $I1
    $P7 = $P2.'numargs'()
    set $I1, $P7
.annotate 'line', 7179
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
# switch
 __label_5: # case
 __label_6: # case
.annotate 'line', 7182
    eq $I1, 1, __label_9
.annotate 'line', 7183
    getattribute $P7, self, 'start'
    'SyntaxError'('Wrong modifier args', $P7)
 __label_9: # endif
.annotate 'line', 7184
# var arg: $P3
    $P3 = $P2.'getarg'(0)
.annotate 'line', 7185
# argreg: $S2
    $P8 = $P3.'emit_get'(__ARG_1)
    null $S2
    if_null $P8, __label_10
    set $S2, $P8
 __label_10:
.annotate 'line', 7186
    __ARG_1.'say'('    ', __ARG_2, ".'", $S1, "'(", $S2, ")")
    goto __label_3 # break
 __label_7: # case
 __label_8: # case
.annotate 'line', 7190
    new $P4, ['ResizableStringArray']
# for loop
.annotate 'line', 7191
# i: $I2
    null $I2
 __label_13: # for condition
    ge $I2, $I1, __label_12
# {
.annotate 'line', 7192
# var arg: $P5
    $P5 = $P2.'getarg'($I2)
.annotate 'line', 7193
    $P7 = $P5.'emit_get'(__ARG_1)
# predefined push
    push $P4, $P7
# }
 __label_11: # for iteration
.annotate 'line', 7191
    inc $I2
    goto __label_13
 __label_12: # for end
.annotate 'line', 7196
# predefined join
    join $S3, ', ', $P4
.annotate 'line', 7195
    __ARG_1.'say'('    ', __ARG_2, ".'", $S1, "'(", $S3, ")")
    goto __label_3 # break
 __label_4: # default
.annotate 'line', 7199
    concat $S4, "Modifier '", $S1
    concat $S4, $S4, "' not valid for try"
    getattribute $P7, self, 'start'
    'SyntaxError'($S4, $P7)
 __label_3: # switch end
# }
    goto __label_0
 __label_1: # endfor
# }
.annotate 'line', 7202

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TryModifierList' ]
.annotate 'line', 7165
    get_class $P1, [ 'ModifierList' ]
    addparent $P0, $P1
.annotate 'line', 7167
    addattribute $P0, 'start'
.end
.namespace [ 'TryStatement' ]

.sub 'TryStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7214
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7215
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7216
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_0
    unless $P2 goto __label_0
.annotate 'line', 7217
    new $P5, [ 'TryModifierList' ]
    $P5.'TryModifierList'($P1, __ARG_2, self)
    set $P4, $P5
    setattribute self, 'modifiers', $P4
    goto __label_1
 __label_0: # else
.annotate 'line', 7219
    __ARG_2.'unget'($P1)
 __label_1: # endif
.annotate 'line', 7221
    $P3 = 'parseStatement'(__ARG_2, self)
    setattribute self, 'stry', $P3
.annotate 'line', 7222
    $P1 = __ARG_2.'get'()
.annotate 'line', 7223
    $P2 = $P1.'iskeyword'('catch')
    isfalse $I1, $P2
    unless $I1 goto __label_2
.annotate 'line', 7224
    'ExpectedOp'('catch', $P1)
 __label_2: # endif
.annotate 'line', 7225
    $P1 = __ARG_2.'get'()
.annotate 'line', 7226
    $P2 = $P1.'isop'('(')
    isfalse $I1, $P2
    unless $I1 goto __label_3
.annotate 'line', 7227
    'Expected'("'(' after 'catch'", $P1)
 __label_3: # endif
.annotate 'line', 7228
    $P1 = __ARG_2.'get'()
.annotate 'line', 7229
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_4
# {
.annotate 'line', 7230
# exname: $S1
    $P3 = $P1.'getidentifier'()
    null $S1
    if_null $P3, __label_5
    set $S1, $P3
 __label_5:
.annotate 'line', 7231
    setattribute self, 'exname', $P1
.annotate 'line', 7232
    self.'createvar'($S1, 'P')
.annotate 'line', 7233
    $P1 = __ARG_2.'get'()
.annotate 'line', 7234
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_6
.annotate 'line', 7235
    'Expected'("')' in 'catch'", $P1)
 __label_6: # endif
# }
 __label_4: # endif
.annotate 'line', 7237
    $P3 = 'parseStatement'(__ARG_2, self)
    setattribute self, 'scatch', $P3
# }
.annotate 'line', 7238

.end # TryStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7241
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_0
.annotate 'line', 7242
    getattribute $P2, self, 'modifiers'
    $P2.'optimize'()
 __label_0: # endif
.annotate 'line', 7243
    getattribute $P3, self, 'stry'
    $P2 = $P3.'optimize'()
    setattribute self, 'stry', $P2
.annotate 'line', 7244
    getattribute $P3, self, 'scatch'
    $P2 = $P3.'optimize'()
    setattribute self, 'scatch', $P2
.annotate 'line', 7245
    .return(self)
# }
.annotate 'line', 7246

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7249
# reghandler: $S1
    $P2 = self.'tempreg'('P')
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 7250
# labelhandler: $S2
    $P2 = self.'genlabel'()
    null $S2
    if_null $P2, __label_1
    set $S2, $P2
 __label_1:
.annotate 'line', 7251
# labelpasthandler: $S3
    $P2 = self.'genlabel'()
    null $S3
    if_null $P2, __label_2
    set $S3, $P2
 __label_2:
.annotate 'line', 7252
# exreg: $S4
    null $S4
.annotate 'line', 7253
    getattribute $P2, self, 'exname'
    if_null $P2, __label_3
# {
.annotate 'line', 7254
# var exname: $P1
    getattribute $P3, self, 'exname'
    $P1 = self.'getvar'($P3)
.annotate 'line', 7255
    $P2 = $P1.'getreg'()
    set $S4, $P2
# }
    goto __label_4
 __label_3: # else
.annotate 'line', 7258
    $P2 = self.'tempreg'('P')
    set $S4, $P2
 __label_4: # endif
.annotate 'line', 7260
    self.'annotate'(__ARG_1)
.annotate 'line', 7261
    __ARG_1.'comment'('try: create handler')
.annotate 'line', 7263
    __ARG_1.'say'('    ', 'new ', $S1, ", 'ExceptionHandler'")
.annotate 'line', 7264
    __ARG_1.'say'('    ', 'set_label ', $S1, ', ', $S2)
.annotate 'line', 7266
    getattribute $P2, self, 'modifiers'
    if_null $P2, __label_5
.annotate 'line', 7267
    getattribute $P3, self, 'modifiers'
    $P3.'emitmodifiers'(__ARG_1, $S1)
 __label_5: # endif
.annotate 'line', 7269
    __ARG_1.'emitarg1'('push_eh', $S1)
.annotate 'line', 7270
    __ARG_1.'comment'('try: begin')
.annotate 'line', 7271
    getattribute $P2, self, 'stry'
    $P2.'emit'(__ARG_1)
.annotate 'line', 7272
    __ARG_1.'comment'('try: end')
.annotate 'line', 7273
    __ARG_1.'say'('    ', 'pop_eh')
.annotate 'line', 7275
    self.'annotate'(__ARG_1)
.annotate 'line', 7276
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 7278
    __ARG_1.'comment'('catch')
.annotate 'line', 7279
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 7280
    __ARG_1.'say'('    ', '.get_results(', $S4, ')')
.annotate 'line', 7281
    __ARG_1.'emitarg1'('finalize', $S4)
.annotate 'line', 7282
    __ARG_1.'say'('    ', 'pop_eh')
.annotate 'line', 7283
    getattribute $P2, self, 'scatch'
    $P2.'emit'(__ARG_1)
.annotate 'line', 7285
    __ARG_1.'comment'('catch end')
.annotate 'line', 7286
    __ARG_1.'emitlabel'($S3)
# }
.annotate 'line', 7287

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TryStatement' ]
.annotate 'line', 7205
    get_class $P1, [ 'BlockStatement' ]
    addparent $P0, $P1
.annotate 'line', 7207
    addattribute $P0, 'stry'
.annotate 'line', 7208
    addattribute $P0, 'modifiers'
.annotate 'line', 7209
    addattribute $P0, 'exname'
.annotate 'line', 7210
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
.annotate 'line', 7300
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7301
    setattribute self, 'name', __ARG_3
.annotate 'line', 7302
# var vdata: $P1
    $P1 = self.'createvar'(__ARG_3, 'P', __ARG_4)
.annotate 'line', 7303
    $P3 = $P1.'getreg'()
    setattribute self, 'reg', $P3
# }
.annotate 'line', 7304

.end # initvarbase

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'VarBaseStatement' ]
.annotate 'line', 7294
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7296
    addattribute $P0, 'name'
.annotate 'line', 7297
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
.annotate 'line', 7319
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7320
    setattribute self, 'name', __ARG_3
.annotate 'line', 7321
    box $P1, __ARG_4
    setattribute self, 'basetype', $P1
# }
.annotate 'line', 7322

.end # DeclareBase

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'DeclareBase' ]
.annotate 'line', 7311
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7313
    addattribute $P0, 'name'
.annotate 'line', 7314
    addattribute $P0, 'basetype'
.annotate 'line', 7315
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
.annotate 'line', 7333
    self.'DeclareBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 7334
# var vdata: $P1
    getattribute $P3, self, 'name'
    getattribute $P4, self, 'basetype'
    $P1 = self.'createvar'($P3, $P4)
.annotate 'line', 7335
    $P4 = $P1.'getreg'()
    setattribute self, 'reg', $P4
.annotate 'line', 7336
# var t: $P2
    $P2 = __ARG_5.'get'()
.annotate 'line', 7337
    $P3 = $P2.'isop'('=')
    if_null $P3, __label_0
    unless $P3 goto __label_0
# {
.annotate 'line', 7339
    $P5 = 'parseExpr'(__ARG_5, self)
    setattribute self, 'init', $P5
# }
    goto __label_1
 __label_0: # else
.annotate 'line', 7342
    __ARG_5.'unget'($P2)
 __label_1: # endif
# }
.annotate 'line', 7343

.end # DeclareSingleStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7346
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 7347
    if_null $P1, __label_0
.annotate 'line', 7348
    $P3 = $P1.'optimize'()
    setattribute self, 'init', $P3
 __label_0: # endif
.annotate 'line', 7349
    .return(self)
# }
.annotate 'line', 7350

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7353
    self.'annotate'(__ARG_1)
.annotate 'line', 7354
# name: $S1
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 7355
# reg: $S2
    getattribute $P2, self, 'reg'
    null $S2
    if_null $P2, __label_1
    set $S2, $P2
 __label_1:
.annotate 'line', 7356
# basetype: $S3
    getattribute $P2, self, 'basetype'
    null $S3
    if_null $P2, __label_2
    set $S3, $P2
 __label_2:
.annotate 'line', 7357
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 7358
    concat $S7, $S1, ': '
    concat $S7, $S7, $S2
    __ARG_1.'comment'($S7)
.annotate 'line', 7360
    isnull $I1, $P1
    if $I1 goto __label_5
    $I1 = $P1.'isnull'()
 __label_5:
    unless $I1 goto __label_3
.annotate 'line', 7361
    __ARG_1.'emitnull'($S2)
    goto __label_4
 __label_3: # else
# {
.annotate 'line', 7363
# itype: $S4
    $P2 = $P1.'checkresult'()
    null $S4
    if_null $P2, __label_6
    set $S4, $P2
 __label_6:
.annotate 'line', 7364
    ne $S4, $S3, __label_7
# {
.annotate 'line', 7365
    iseq $I1, $S4, 'S'
    unless $I1 goto __label_11
    isa $I1, $P1, [ 'ConcatString' ]
 __label_11:
    unless $I1 goto __label_9
.annotate 'line', 7366
    $P1.'emit_concat_set'(__ARG_1, $S2)
    goto __label_10
 __label_9: # else
.annotate 'line', 7368
    $P1.'emit'(__ARG_1, $S2)
 __label_10: # endif
# }
    goto __label_8
 __label_7: # else
# {
.annotate 'line', 7371
    isa $I1, $P1, [ 'IndexExpr' ]
    unless $I1 goto __label_12
# {
.annotate 'line', 7373
    $P1.'emit'(__ARG_1, $S2)
# }
    goto __label_13
 __label_12: # else
# {
.annotate 'line', 7376
# ireg: $S5
    null $S5
.annotate 'line', 7377
    ne $S4, '', __label_14
.annotate 'line', 7378
    $P2 = $P1.'emit_get'(__ARG_1)
    set $S5, $P2
    goto __label_15
 __label_14: # else
# {
.annotate 'line', 7380
    $P3 = self.'tempreg'($S4)
    set $S5, $P3
.annotate 'line', 7381
    $P1.'emit'(__ARG_1, $S5)
# }
 __label_15: # endif
.annotate 'line', 7383
    iseq $I1, $S3, 'S'
    unless $I1 goto __label_18
    iseq $I1, $S4, 'P'
 __label_18:
    unless $I1 goto __label_16
# {
.annotate 'line', 7384
# auxlabel: $S6
    $P2 = self.'genlabel'()
    null $S6
    if_null $P2, __label_19
    set $S6, $P2
 __label_19:
.annotate 'line', 7385
    __ARG_1.'emitnull'($S2)
.annotate 'line', 7386
    __ARG_1.'emitif_null'($S5, $S6)
.annotate 'line', 7387
    __ARG_1.'emitset'($S2, $S5)
.annotate 'line', 7388
    __ARG_1.'emitlabel'($S6)
# }
    goto __label_17
 __label_16: # else
.annotate 'line', 7391
    __ARG_1.'emitset'($S2, $S5)
 __label_17: # endif
# }
 __label_13: # endif
# }
 __label_8: # endif
# }
 __label_4: # endif
# }
.annotate 'line', 7395

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'DeclareSingleStatement' ]
.annotate 'line', 7327
    get_class $P1, [ 'DeclareBase' ]
    addparent $P0, $P1
.annotate 'line', 7329
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
.annotate 'line', 7410
    self.'DeclareBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 7411
    box $P4, __ARG_5
    setattribute self, 'arraytype', $P4
.annotate 'line', 7412
# var vdata: $P1
    getattribute $P4, self, 'name'
    $P1 = self.'createvar'($P4, 'P')
.annotate 'line', 7413
    $P5 = $P1.'getreg'()
    setattribute self, 'reg', $P5
.annotate 'line', 7414
# var t: $P2
    $P2 = __ARG_6.'get'()
.annotate 'line', 7415
    $P4 = $P2.'isop'(']')
    isfalse $I1, $P4
    unless $I1 goto __label_0
# {
.annotate 'line', 7417
    __ARG_6.'unget'($P2)
.annotate 'line', 7418
    $P5 = 'parseExpr'(__ARG_6, self)
    setattribute self, 'size', $P5
.annotate 'line', 7419
    'ExpectOp'(']', __ARG_6)
# }
 __label_0: # endif
.annotate 'line', 7421
    $P2 = __ARG_6.'get'()
.annotate 'line', 7422
    $P4 = $P2.'isop'('=')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 7423
    $P2 = __ARG_6.'get'()
.annotate 'line', 7424
    $P4 = $P2.'isop'('[')
    isfalse $I1, $P4
    unless $I1 goto __label_3
.annotate 'line', 7425
    'Expected'("array initializer", $P2)
 __label_3: # endif
.annotate 'line', 7426
    root_new $P5, ['parrot';'ResizablePMCArray']
    setattribute self, 'initarray', $P5
.annotate 'line', 7427
    $P2 = __ARG_6.'get'()
.annotate 'line', 7428
    $P4 = $P2.'isop'(']')
    isfalse $I1, $P4
    unless $I1 goto __label_4
# {
.annotate 'line', 7429
    __ARG_6.'unget'($P2)
 __label_5: # do
.annotate 'line', 7430
# {
.annotate 'line', 7431
# var item: $P3
    $P3 = 'parseExpr'(__ARG_6, self)
.annotate 'line', 7432
    getattribute $P4, self, 'initarray'
# predefined push
    push $P4, $P3
# }
 __label_7: # continue
.annotate 'line', 7433
    $P2 = __ARG_6.'get'()
    $P4 = $P2.'isop'(',')
    if_null $P4, __label_6
    if $P4 goto __label_5
 __label_6: # enddo
.annotate 'line', 7434
    $P4 = $P2.'isop'(']')
    isfalse $I1, $P4
    unless $I1 goto __label_8
.annotate 'line', 7435
    'Expected'("',' or ']'", $P2)
 __label_8: # endif
# }
 __label_4: # endif
# }
    goto __label_2
 __label_1: # else
.annotate 'line', 7439
    __ARG_6.'unget'($P2)
 __label_2: # endif
# }
.annotate 'line', 7440

.end # DeclareArrayStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7443
    getattribute $P1, self, 'size'
    if_null $P1, __label_0
.annotate 'line', 7444
    getattribute $P4, self, 'size'
    $P3 = $P4.'optimize'()
    setattribute self, 'size', $P3
 __label_0: # endif
.annotate 'line', 7445
    getattribute $P1, self, 'initarray'
    'optimize_array'($P1)
.annotate 'line', 7446
    .return(self)
# }
.annotate 'line', 7447

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7450
    self.'annotate'(__ARG_1)
.annotate 'line', 7452
# var reg: $P1
    getattribute $P1, self, 'reg'
.annotate 'line', 7453
# var size: $P2
    getattribute $P2, self, 'size'
.annotate 'line', 7454
# var init: $P3
    getattribute $P3, self, 'initarray'
.annotate 'line', 7455
# var basetype: $P4
    getattribute $P4, self, 'basetype'
.annotate 'line', 7456
# arraytype: $S1
# predefined string
    getattribute $P6, self, 'arraytype'
    set $S4, $P6
    concat $S1, $S4, 'Array'
.annotate 'line', 7457
    if_null $P2, __label_0
# {
.annotate 'line', 7459
# regsize: $S2
    $P6 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P6, __label_2
    set $S2, $P6
 __label_2:
.annotate 'line', 7460
    __ARG_1.'say'('    ', 'new ', $P1, ", ['Fixed", $S1, "'], ", $S2)
# }
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 7464
    __ARG_1.'say'('    ', 'new ', $P1, ", ['Resizable", $S1, "']")
# }
 __label_1: # endif
.annotate 'line', 7466
    if_null $P3, __label_3
# {
.annotate 'line', 7467
# itemreg: $S3
    $P6 = self.'tempreg'($P4)
    null $S3
    if_null $P6, __label_4
    set $S3, $P6
 __label_4:
.annotate 'line', 7468
# n: $I1
# predefined elements
    elements $I1, $P3
.annotate 'line', 7469
    unless_null $P2, __label_5
# {
.annotate 'line', 7470
    le $I1, 0, __label_6
# {
.annotate 'line', 7472
    __ARG_1.'emitset'($P1, $I1)
# }
 __label_6: # endif
# }
 __label_5: # endif
.annotate 'line', 7475
# i: $I2
    null $I2
.annotate 'line', 7476
    iter $P7, $P3
    set $P7, 0
 __label_7: # for iteration
    unless $P7 goto __label_8
    shift $P5, $P7
# {
.annotate 'line', 7477
    $P5.'emit'(__ARG_1, $S3)
.annotate 'line', 7478
    __ARG_1.'say'('    ', $P1, '[', $I2, '] = ', $S3)
.annotate 'line', 7479
    inc $I2
# }
    goto __label_7
 __label_8: # endfor
# }
 __label_3: # endif
# }
.annotate 'line', 7482

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'DeclareArrayStatement' ]
.annotate 'line', 7400
    get_class $P1, [ 'DeclareBase' ]
    addparent $P0, $P1
.annotate 'line', 7402
    addattribute $P0, 'size'
.annotate 'line', 7403
    addattribute $P0, 'initarray'
.annotate 'line', 7404
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
.annotate 'line', 7489
# var next: $P1
    null $P1
.annotate 'line', 7490
# var r: $P2
    null $P2
 __label_0: # do
.annotate 'line', 7491
# {
.annotate 'line', 7492
# var name: $P3
    $P3 = __ARG_4.'get'()
.annotate 'line', 7493
    'RequireIdentifier'($P3)
.annotate 'line', 7494
# var t: $P4
    $P4 = __ARG_4.'get'()
.annotate 'line', 7495
# var item: $P5
    null $P5
.annotate 'line', 7496
    $P6 = $P4.'isop'('[')
    if_null $P6, __label_3
    unless $P6 goto __label_3
.annotate 'line', 7497
    $P5 = __ARG_2(__ARG_3, __ARG_5, __ARG_4, $P3)
    goto __label_4
 __label_3: # else
# {
.annotate 'line', 7499
    __ARG_4.'unget'($P4)
.annotate 'line', 7500
    $P5 = __ARG_1(__ARG_3, __ARG_5, $P3, __ARG_4)
# }
 __label_4: # endif
.annotate 'line', 7502
    $P2 = 'addtomulti'($P2, $P5)
.annotate 'line', 7503
    $P1 = __ARG_4.'get'()
# }
 __label_2: # continue
.annotate 'line', 7504
    $P6 = $P1.'isop'(',')
    if_null $P6, __label_1
    if $P6 goto __label_0
 __label_1: # enddo
.annotate 'line', 7505
    'RequireOp'(';', $P1)
.annotate 'line', 7506
    .return($P2)
# }
.annotate 'line', 7507

.end # parseDeclareHelper

.namespace [ 'IntStatement' ]

.sub 'IntStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7515
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'I', __ARG_4)
# }
.annotate 'line', 7516

.end # IntStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IntStatement' ]
.annotate 'line', 7511
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
.annotate 'line', 7523
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'I', 'Integer', __ARG_4)
# }
.annotate 'line', 7524

.end # IntArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IntArrayStatement' ]
.annotate 'line', 7519
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
.annotate 'line', 7530
    new $P2, [ 'IntStatement' ]
    $P2.'IntStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7531

.end # newIntSingle


.sub 'newIntArray'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7535
    new $P2, [ 'IntArrayStatement' ]
    $P2.'IntArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7536

.end # newIntArray


.sub 'parseInt'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7540
.const 'Sub' $P1 = 'newIntSingle'
.annotate 'line', 7541
.const 'Sub' $P2 = 'newIntArray'
.annotate 'line', 7542
    .tailcall 'parseDeclareHelper'($P1, $P2, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7543

.end # parseInt

.namespace [ 'FloatStatement' ]

.sub 'FloatStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7551
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'N', __ARG_4)
# }
.annotate 'line', 7552

.end # FloatStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FloatStatement' ]
.annotate 'line', 7547
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
.annotate 'line', 7559
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'N', 'Float', __ARG_4)
# }
.annotate 'line', 7560

.end # FloatArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FloatArrayStatement' ]
.annotate 'line', 7555
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
.annotate 'line', 7566
    new $P2, [ 'FloatStatement' ]
    $P2.'FloatStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7567

.end # newFloatSingle


.sub 'newFloatArray'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7571
    new $P2, [ 'FloatArrayStatement' ]
    $P2.'FloatArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7572

.end # newFloatArray


.sub 'parseFloat'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7576
.const 'Sub' $P1 = 'newFloatSingle'
.annotate 'line', 7577
.const 'Sub' $P2 = 'newFloatArray'
.annotate 'line', 7578
    .tailcall 'parseDeclareHelper'($P1, $P2, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7579

.end # parseFloat

.namespace [ 'StringStatement' ]

.sub 'StringStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7587
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'S', __ARG_4)
# }
.annotate 'line', 7588

.end # StringStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'StringStatement' ]
.annotate 'line', 7583
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
.annotate 'line', 7595
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'S', 'String', __ARG_4)
# }
.annotate 'line', 7596

.end # StringArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'StringArrayStatement' ]
.annotate 'line', 7591
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
.annotate 'line', 7602
    new $P2, [ 'StringStatement' ]
    $P2.'StringStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7603

.end # newStringSingle


.sub 'newStringArray'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7607
    new $P2, [ 'StringArrayStatement' ]
    $P2.'StringArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7608

.end # newStringArray


.sub 'parseString'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7612
.const 'Sub' $P1 = 'newStringSingle'
.annotate 'line', 7613
.const 'Sub' $P2 = 'newStringArray'
.annotate 'line', 7614
    .tailcall 'parseDeclareHelper'($P1, $P2, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7615

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
.annotate 'line', 7630
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7631
    box $P1, __ARG_3
    setattribute self, 'type', $P1
.annotate 'line', 7632
    setattribute self, 'name', __ARG_4
.annotate 'line', 7633
    setattribute self, 'value', __ARG_5
# }
.annotate 'line', 7634

.end # ConstStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7637
# var value: $P1
    getattribute $P1, self, 'value'
.annotate 'line', 7638
# var name: $P2
    getattribute $P2, self, 'name'
.annotate 'line', 7639
# type: $S1
    getattribute $P3, self, 'type'
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 7640
    $P1 = $P1.'optimize'()
.annotate 'line', 7641
    $P3 = $P1.'hascompilevalue'()
    isfalse $I1, $P3
    unless $I1 goto __label_1
# {
.annotate 'line', 7643
    getattribute $P4, self, 'start'
.annotate 'line', 7642
    'SyntaxError'('Value for const is not evaluable at compile time', $P4)
# }
 __label_1: # endif
.annotate 'line', 7645
    self.'createconst'($P2, $S1, $P1, '')
.annotate 'line', 7646
    setattribute self, 'value', $P1
.annotate 'line', 7647
    .return(self)
# }
.annotate 'line', 7648

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 7651
    getattribute $P1, self, 'start'
    'InternalError'('Direct use of const', $P1)
# }
.annotate 'line', 7652

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7655
# name: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 7656
    concat $S2, 'Constant ', $S1
    concat $S2, $S2, ' evaluated at compile time'
    __ARG_1.'comment'($S2)
# }
.annotate 'line', 7657

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ConstStatement' ]
.annotate 'line', 7621
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7623
    addattribute $P0, 'type'
.annotate 'line', 7624
    addattribute $P0, 'name'
.annotate 'line', 7625
    addattribute $P0, 'value'
.end
.namespace [ ]

.sub 'parseConst'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7662
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7663
# type: $S1
    $P5 = 'typetoregcheck'($P1)
    null $S1
    if_null $P5, __label_0
    set $S1, $P5
 __label_0:
.annotate 'line', 7664
    isne $I1, $S1, 'I'
    unless $I1 goto __label_3
    isne $I1, $S1, 'N'
 __label_3:
    unless $I1 goto __label_2
    isne $I1, $S1, 'S'
 __label_2:
    unless $I1 goto __label_1
.annotate 'line', 7665
    'SyntaxError'('Invalid type for const', __ARG_1)
 __label_1: # endif
.annotate 'line', 7667
# var multi: $P2
    null $P2
 __label_4: # do
.annotate 'line', 7668
# {
.annotate 'line', 7669
    $P1 = __ARG_2.'get'()
.annotate 'line', 7670
# var name: $P3
    set $P3, $P1
.annotate 'line', 7671
    'ExpectOp'('=', __ARG_2)
.annotate 'line', 7672
# var value: $P4
    $P4 = 'parseExpr'(__ARG_2, __ARG_3)
.annotate 'line', 7674
    new $P6, [ 'ConstStatement' ]
    $P6.'ConstStatement'($P1, __ARG_3, $S1, $P3, $P4)
    set $P5, $P6
.annotate 'line', 7673
    $P2 = 'addtomulti'($P2, $P5)
# }
 __label_6: # continue
.annotate 'line', 7675
    $P1 = __ARG_2.'get'()
    $P5 = $P1.'isop'(',')
    if_null $P5, __label_5
    if $P5 goto __label_4
 __label_5: # enddo
.annotate 'line', 7676
    .return($P2)
# }
.annotate 'line', 7677

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
.annotate 'line', 7688
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 7689
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7690
    $P2 = $P1.'isop'('=')
    if_null $P2, __label_0
    unless $P2 goto __label_0
# {
.annotate 'line', 7691
    $P4 = 'parseExpr'(__ARG_2, self)
    setattribute self, 'init', $P4
.annotate 'line', 7692
    $P1 = __ARG_2.'get'()
# }
 __label_0: # endif
.annotate 'line', 7694
    'RequireOp'(';', $P1)
# }
.annotate 'line', 7695

.end # VarStatement


.sub 'optimize_init' :method
# Body
# {
.annotate 'line', 7698
    getattribute $P1, self, 'init'
    if_null $P1, __label_0
.annotate 'line', 7699
    getattribute $P4, self, 'init'
    $P3 = $P4.'optimize'()
    setattribute self, 'init', $P3
 __label_0: # endif
.annotate 'line', 7700
    .return(self)
# }
.annotate 'line', 7701

.end # optimize_init


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7704
    .tailcall self.'optimize_init'()
# }
.annotate 'line', 7705

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7708
    self.'annotate'(__ARG_1)
.annotate 'line', 7709
# name: $S1
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 7710
# reg: $S2
    getattribute $P2, self, 'reg'
    null $S2
    if_null $P2, __label_1
    set $S2, $P2
 __label_1:
.annotate 'line', 7711
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 7712
    concat $S5, 'var ', $S1
    concat $S5, $S5, ': '
    concat $S5, $S5, $S2
    __ARG_1.'comment'($S5)
.annotate 'line', 7713
    if_null $P1, __label_2
.annotate 'line', 7714
    $P2 = $P1.'isnull'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 7715
    null $P1
 __label_3: # endif
 __label_2: # endif
.annotate 'line', 7716
    if_null $P1, __label_4
# {
.annotate 'line', 7717
# type: $S3
    $P2 = $P1.'checkresult'()
    null $S3
    if_null $P2, __label_6
    set $S3, $P2
 __label_6:
.annotate 'line', 7718
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
# switch
 __label_9: # case
.annotate 'line', 7720
    isa $I1, $P1, [ 'MemberExpr' ]
    if $I1 goto __label_17
    isa $I1, $P1, [ 'ArrayExpr' ]
 __label_17:
    if $I1 goto __label_16
    isa $I1, $P1, [ 'NewExpr' ]
 __label_16:
    unless $I1 goto __label_14
.annotate 'line', 7721
    $P1.'emit_init'(__ARG_1, $S2)
    goto __label_15
 __label_14: # else
.annotate 'line', 7723
    $P1.'emit'(__ARG_1, $S2)
 __label_15: # endif
    goto __label_7 # break
 __label_10: # case
 __label_11: # case
 __label_12: # case
.annotate 'line', 7728
# value: $S4
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P2, __label_18
    set $S4, $P2
 __label_18:
.annotate 'line', 7729
    __ARG_1.'emitbox'($S2, $S4)
    goto __label_7 # break
 __label_13: # case
.annotate 'line', 7732
    getattribute $P3, self, 'name'
    'SyntaxError'("Can't use void function as initializer", $P3)
 __label_8: # default
.annotate 'line', 7734
    getattribute $P4, self, 'name'
    'SyntaxError'("Invalid var initializer", $P4)
 __label_7: # switch end
# }
    goto __label_5
 __label_4: # else
.annotate 'line', 7738
    __ARG_1.'emitnull'($S2)
 __label_5: # endif
# }
.annotate 'line', 7739

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'VarStatement' ]
.annotate 'line', 7683
    get_class $P1, [ 'VarBaseStatement' ]
    addparent $P0, $P1
.annotate 'line', 7685
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
.annotate 'line', 7746
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 7747
    'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 7748

.end # ResizableVarStatement


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7751
    self.'annotate'(__ARG_1)
.annotate 'line', 7752
# name: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 7753
# reg: $S2
    getattribute $P1, self, 'reg'
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 7754
    concat $S3, 'var ', $S1
    concat $S3, $S3, '[] : '
    concat $S3, $S3, $S2
    __ARG_1.'comment'($S3)
.annotate 'line', 7755
    __ARG_1.'say'('    ', 'new ', $S2, ", 'ResizablePMCArray'")
# }
.annotate 'line', 7756

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ResizableVarStatement' ]
.annotate 'line', 7742
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
.annotate 'line', 7765
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 7766
    $P2 = 'parseExpr'(__ARG_2, self)
    setattribute self, 'exprsize', $P2
.annotate 'line', 7767
    'ExpectOp'(']', __ARG_2)
.annotate 'line', 7768
    'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 7769

.end # FixedVarStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7772
    getattribute $P3, self, 'exprsize'
    $P2 = $P3.'optimize'()
    setattribute self, 'exprsize', $P2
.annotate 'line', 7773
    .tailcall self.'optimize_init'()
# }
.annotate 'line', 7774

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7777
# regsize: $S1
    getattribute $P2, self, 'exprsize'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 7778
    self.'annotate'(__ARG_1)
.annotate 'line', 7779
# name: $S2
    getattribute $P1, self, 'name'
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 7780
# reg: $S3
    getattribute $P1, self, 'reg'
    null $S3
    if_null $P1, __label_2
    set $S3, $P1
 __label_2:
.annotate 'line', 7781
    concat $S4, 'var ', $S2
    concat $S4, $S4, '[] : '
    concat $S4, $S4, $S3
    __ARG_1.'comment'($S4)
.annotate 'line', 7782
    __ARG_1.'say'('    ', 'new ', $S3, ", 'FixedPMCArray', ", $S1)
# }
.annotate 'line', 7783

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FixedVarStatement' ]
.annotate 'line', 7759
    get_class $P1, [ 'VarStatement' ]
    addparent $P0, $P1
.annotate 'line', 7761
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
.annotate 'line', 7788
# var name: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7789
    'RequireIdentifier'($P1)
.annotate 'line', 7790
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 7791
    $P3 = $P2.'isop'('[')
    if_null $P3, __label_0
    unless $P3 goto __label_0
# {
.annotate 'line', 7792
    $P2 = __ARG_2.'get'()
.annotate 'line', 7793
    $P3 = $P2.'isop'(']')
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 7794
    new $P5, [ 'ResizableVarStatement' ]
    $P5.'ResizableVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P4, $P5
    .return($P4)
    goto __label_3
 __label_2: # else
# {
.annotate 'line', 7796
    __ARG_2.'unget'($P2)
.annotate 'line', 7797
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
.annotate 'line', 7801
    __ARG_2.'unget'($P2)
.annotate 'line', 7802
    new $P4, [ 'VarStatement' ]
    $P4.'VarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, __ARG_4)
    set $P3, $P4
    .return($P3)
# }
 __label_1: # endif
# }
.annotate 'line', 7804

.end # parseVar


.sub 'parseVolatile'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7808
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7809
    $P2 = $P1.'iskeyword'('var')
    isfalse $I1, $P2
    unless $I1 goto __label_0
.annotate 'line', 7810
    'SyntaxError'("invalid volatile type", $P1)
 __label_0: # endif
.annotate 'line', 7811
    .tailcall 'parseVar'(__ARG_1, __ARG_2, __ARG_3, 1)
# }
.annotate 'line', 7812

.end # parseVolatile

.namespace [ 'CompoundStatement' ]

.sub 'CompoundStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7825
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7826
    root_new $P4, ['parrot';'Hash']
    setattribute self, 'labels', $P4
.annotate 'line', 7827
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'statements', $P4
.annotate 'line', 7828
# var t: $P1
    null $P1
 __label_1: # while
.annotate 'line', 7829
    $P1 = __ARG_2.'get'()
    $P3 = $P1.'isop'('}')
    isfalse $I1, $P3
    unless $I1 goto __label_0
# {
.annotate 'line', 7830
    __ARG_2.'unget'($P1)
.annotate 'line', 7831
# var c: $P2
    $P2 = 'parseStatement'(__ARG_2, self)
.annotate 'line', 7832
    unless_null $P2, __label_2
.annotate 'line', 7833
    'InternalError'('Unexpected null statement')
 __label_2: # endif
.annotate 'line', 7834
    getattribute $P3, self, 'statements'
# predefined push
    push $P3, $P2
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 7836
    setattribute self, 'end', $P1
# }
.annotate 'line', 7837

.end # CompoundStatement


.sub 'getlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7840
# s: $S1
    set $P2, __ARG_1
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 7841
# var labels: $P1
    getattribute $P1, self, 'labels'
.annotate 'line', 7842
# exist: $S2
    $S2 = $P1[$S1]
.annotate 'line', 7843
    isnull $I1, $S2
    if $I1 goto __label_2
    iseq $I1, $S2, ''
 __label_2:
    unless $I1 goto __label_1
.annotate 'line', 7844
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getlabel'(__ARG_1)
    set $S2, $P2
 __label_1: # endif
.annotate 'line', 7845
    .return($S2)
# }
.annotate 'line', 7846

.end # getlabel


.sub 'createlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7849
# s: $S1
    set $P2, __ARG_1
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 7850
# var labels: $P1
    getattribute $P1, self, 'labels'
.annotate 'line', 7851
# exist: $S2
    $S2 = $P1[$S1]
.annotate 'line', 7852
    isnull $I1, $S2
    not $I1
    unless $I1 goto __label_2
    isne $I1, $S2, ''
 __label_2:
    unless $I1 goto __label_1
.annotate 'line', 7853
    'SyntaxError'('Label already defined', __ARG_1)
 __label_1: # endif
.annotate 'line', 7854
# value: $S3
    $P2 = self.'genlabel'()
    null $S3
    if_null $P2, __label_3
    set $S3, $P2
 __label_3:
.annotate 'line', 7855
    $P1[$S1] = $S3
.annotate 'line', 7856
    .return($S3)
# }
.annotate 'line', 7857

.end # createlabel


.sub 'getend' :method
# Body
# {
.annotate 'line', 7858
    getattribute $P1, self, 'end'
    .return($P1)
# }

.end # getend


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7861
    __ARG_1.'comment'('{')
.annotate 'line', 7862
    getattribute $P2, self, 'statements'
    iter $P3, $P2
    set $P3, 0
 __label_0: # for iteration
    unless $P3 goto __label_1
    shift $P1, $P3
# {
.annotate 'line', 7863
    $P1.'emit'(__ARG_1)
.annotate 'line', 7864
    self.'freetemps'()
# }
    goto __label_0
 __label_1: # endfor
.annotate 'line', 7866
    __ARG_1.'comment'('}')
# }
.annotate 'line', 7867

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CompoundStatement' ]
.annotate 'line', 7818
    get_class $P1, [ 'MultiStatementBase' ]
    addparent $P0, $P1
    get_class $P2, [ 'BlockStatement' ]
    addparent $P0, $P2
.annotate 'line', 7820
    addattribute $P0, 'end'
.annotate 'line', 7821
    addattribute $P0, 'labels'
.end
.namespace [ 'RegisterStore' ]

.sub 'RegisterStore' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 7882
    box $P3, __ARG_1
    setattribute self, 'type', $P3
.annotate 'line', 7884
    box $P3, 1
    setattribute self, 'nreg', $P3
.annotate 'line', 7885
    new $P1, ['ResizableStringArray']
.annotate 'line', 7886
    new $P2, ['ResizableStringArray']
.annotate 'line', 7887
    setattribute self, 'tempreg', $P1
.annotate 'line', 7888
    setattribute self, 'freereg', $P2
# }
.annotate 'line', 7889

.end # RegisterStore


.sub 'createreg' :method
# Body
# {
.annotate 'line', 7892
# var n: $P1
    getattribute $P1, self, 'nreg'
.annotate 'line', 7893
# i: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 7894
# reg: $S1
    set $I2, $I1
    inc $I1
    set $S1, $I2
.annotate 'line', 7895
    assign $P1, $I1
.annotate 'line', 7896
# type: $S2
    getattribute $P2, self, 'type'
    null $S2
    if_null $P2, __label_0
    set $S2, $P2
 __label_0:
.annotate 'line', 7897
    concat $S0, '$', $S2
    concat $S0, $S0, $S1
    set $S1, $S0
.annotate 'line', 7898
    .return($S1)
# }
.annotate 'line', 7899

.end # createreg


.sub 'tempreg' :method
# Body
# {
.annotate 'line', 7902
# var freereg: $P1
    getattribute $P1, self, 'freereg'
.annotate 'line', 7903
# var tempreg: $P2
    getattribute $P2, self, 'tempreg'
.annotate 'line', 7904
# reg: $S1
    null $S1
.annotate 'line', 7905
# predefined elements
    elements $I1, $P1
    le $I1, 0, __label_0
.annotate 'line', 7906
    $P3 = $P1.'pop'()
    set $S1, $P3
    goto __label_1
 __label_0: # else
.annotate 'line', 7908
    $P4 = self.'createreg'()
    set $S1, $P4
 __label_1: # endif
.annotate 'line', 7909
# predefined push
    push $P2, $S1
.annotate 'line', 7910
    .return($S1)
# }
.annotate 'line', 7911

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 7914
# var freereg: $P1
    getattribute $P1, self, 'freereg'
.annotate 'line', 7915
# var tempreg: $P2
    getattribute $P2, self, 'tempreg'
.annotate 'line', 7916
# n: $I1
# predefined elements
    elements $I1, $P2
# for loop
.annotate 'line', 7917
# i: $I2
    sub $I2, $I1, 1
 __label_2: # for condition
    lt $I2, 0, __label_1
# {
.annotate 'line', 7918
# s: $S1
    $S1 = $P2[$I2]
.annotate 'line', 7919
# predefined push
    push $P1, $S1
# }
 __label_0: # for iteration
.annotate 'line', 7917
    dec $I2
    goto __label_2
 __label_1: # for end
.annotate 'line', 7921
    assign $P2, 0
# }
.annotate 'line', 7922

.end # freetemps

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'RegisterStore' ]
.annotate 'line', 7876
    addattribute $P0, 'type'
.annotate 'line', 7877
    addattribute $P0, 'nreg'
.annotate 'line', 7878
    addattribute $P0, 'tempreg'
.annotate 'line', 7879
    addattribute $P0, 'freereg'
.end
.namespace [ 'ParameterModifierList' ]

.sub 'ParameterModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 7933
    self.'ModifierList'(__ARG_1, __ARG_2)
# }
.annotate 'line', 7934

.end # ParameterModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 7937
# var named: $P1
    null $P1
.annotate 'line', 7938
# var slurpy: $P2
    null $P2
.annotate 'line', 7939
# var modarglist: $P3
    $P3 = self.'getlist'()
.annotate 'line', 7940
    iter $P6, $P3
    set $P6, 0
 __label_0: # for iteration
    unless $P6 goto __label_1
    shift $P4, $P6
# {
.annotate 'line', 7941
# modname: $S1
    $P7 = $P4.'getname'()
    null $S1
    if_null $P7, __label_2
    set $S1, $P7
 __label_2:
.annotate 'line', 7942
    set $S3, $S1
    set $S4, 'named'
    if $S3 == $S4 goto __label_5
    set $S4, 'slurpy'
    if $S3 == $S4 goto __label_6
    goto __label_4
# switch
 __label_5: # case
.annotate 'line', 7944
    set $P1, $P4
    goto __label_3 # break
 __label_6: # case
.annotate 'line', 7947
    set $P2, $P4
    goto __label_3 # break
 __label_4: # default
.annotate 'line', 7950
    __ARG_1.'print'(' :', $S1)
 __label_3: # switch end
# }
    goto __label_0
 __label_1: # endfor
.annotate 'line', 7953
    isnull $I2, $P1
    not $I2
    unless $I2 goto __label_9
    isnull $I2, $P2
    not $I2
 __label_9:
    unless $I2 goto __label_7
# {
.annotate 'line', 7958
    __ARG_1.'print'(" :named :slurpy")
# }
    goto __label_8
 __label_7: # else
# {
.annotate 'line', 7961
    if_null $P1, __label_10
# {
.annotate 'line', 7962
# setname: $S2
    null $S2
.annotate 'line', 7963
# nargs: $I1
    $P7 = $P1.'numargs'()
    set $I1, $P7
.annotate 'line', 7964
    set $I2, $I1
    null $I3
    if $I2 == $I3 goto __label_14
    set $I3, 1
    if $I2 == $I3 goto __label_15
    goto __label_13
# switch
 __label_14: # case
.annotate 'line', 7966
    concat $S0, "'", __ARG_3
    concat $S0, $S0, "'"
    set $S2, $S0
    goto __label_12 # break
 __label_15: # case
.annotate 'line', 7969
# var argmod: $P5
    $P5 = $P1.'getarg'(0)
.annotate 'line', 7970
    $P7 = $P5.'isstringliteral'()
    isfalse $I4, $P7
    unless $I4 goto __label_16
.annotate 'line', 7971
    'SyntaxError'('Invalid modifier', __ARG_2)
 __label_16: # endif
.annotate 'line', 7972
    $P8 = $P5.'getPirString'()
    set $S2, $P8
    goto __label_12 # break
 __label_13: # default
.annotate 'line', 7975
    'SyntaxError'('Invalid modifier', __ARG_2)
 __label_12: # switch end
.annotate 'line', 7977
    __ARG_1.'print'(" :named(", $S2, ")")
# }
    goto __label_11
 __label_10: # else
.annotate 'line', 7979
    if_null $P2, __label_17
# {
.annotate 'line', 7980
    __ARG_1.'print'(" :slurpy")
# }
 __label_17: # endif
 __label_11: # endif
# }
 __label_8: # endif
# }
.annotate 'line', 7983

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ParameterModifierList' ]
.annotate 'line', 7929
    get_class $P1, [ 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'FunctionParameter' ]

.sub 'FunctionParameter' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 7992
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7993
# type: $S1
    $P3 = $P1.'checkkeyword'()
    $P2 = 'typetoregcheck'($P3)
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 7994
    eq $S1, '', __label_1
.annotate 'line', 7995
    $P1 = __ARG_2.'get'()
    goto __label_2
 __label_1: # else
.annotate 'line', 7997
    set $S1, 'P'
 __label_2: # endif
.annotate 'line', 7998
# argname: $S2
# predefined string
    $P2 = __ARG_1.'getparamnum'()
    set $S3, $P2
    concat $S2, '__ARG_', $S3
.annotate 'line', 7999
    __ARG_1.'createvarnamed'($P1, $S1, $S2)
.annotate 'line', 8001
# predefined string
    set $S3, $P1
    box $P2, $S3
    setattribute self, 'name', $P2
.annotate 'line', 8002
    $P1 = __ARG_2.'get'()
.annotate 'line', 8003
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 8004
    new $P5, [ 'ParameterModifierList' ]
    $P5.'ParameterModifierList'(__ARG_2, self)
    set $P4, $P5
    setattribute self, 'modifiers', $P4
    goto __label_4
 __label_3: # else
.annotate 'line', 8006
    __ARG_2.'unget'($P1)
 __label_4: # endif
# }
.annotate 'line', 8007

.end # FunctionParameter


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8010
# paramname: $S1
    getattribute $P3, self, 'name'
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 8011
# var param: $P1
    $P1 = __ARG_1.'getvar'($S1)
.annotate 'line', 8012
# ptype: $S2
    $P4 = $P1.'gettype'()
    $P3 = 'typetopirname'($P4)
    null $S2
    if_null $P3, __label_1
    set $S2, $P3
 __label_1:
.annotate 'line', 8013
    $P3 = $P1.'getreg'()
    __ARG_2.'print'('        .param ', $S2, ' ', $P3)
.annotate 'line', 8014
# var modarg: $P2
    getattribute $P2, self, 'modifiers'
.annotate 'line', 8015
    if_null $P2, __label_2
.annotate 'line', 8016
    getattribute $P3, __ARG_1, 'start'
    $P2.'emitmodifiers'(__ARG_2, $P3, $S1)
 __label_2: # endif
.annotate 'line', 8017
    __ARG_2.'say'('')
# }
.annotate 'line', 8018

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FunctionParameter' ]
.annotate 'line', 7988
    addattribute $P0, 'name'
.annotate 'line', 7989
    addattribute $P0, 'modifiers'
.end
.namespace [ 'FunctionBase' ]

.sub 'FunctionBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8044
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 8045
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'params', $P2
.annotate 'line', 8046
    box $P1, 0
    setattribute self, 'nlabel', $P1
.annotate 'line', 8047
    new $P3, [ 'RegisterStore' ]
    $P3.'RegisterStore'('I')
    set $P2, $P3
    setattribute self, 'regstI', $P2
.annotate 'line', 8048
    new $P3, [ 'RegisterStore' ]
    $P3.'RegisterStore'('N')
    set $P2, $P3
    setattribute self, 'regstN', $P2
.annotate 'line', 8049
    new $P3, [ 'RegisterStore' ]
    $P3.'RegisterStore'('S')
    set $P2, $P3
    setattribute self, 'regstS', $P2
.annotate 'line', 8050
    new $P3, [ 'RegisterStore' ]
    $P3.'RegisterStore'('P')
    set $P2, $P3
    setattribute self, 'regstP', $P2
# }
.annotate 'line', 8051

.end # FunctionBase


.sub 'getouter' :method
# Body
# {
.annotate 'line', 8053
    .return(self)
# }

.end # getouter


.sub 'makesubid' :method
# Body
# {
.annotate 'line', 8057
# var subid: $P1
    getattribute $P1, self, 'subid'
.annotate 'line', 8058
    unless_null $P1, __label_0
# {
.annotate 'line', 8059
    $P1 = self.'generatesubid'()
.annotate 'line', 8060
    setattribute self, 'subid', $P1
# }
 __label_0: # endif
.annotate 'line', 8062
    .return($P1)
# }
.annotate 'line', 8063

.end # makesubid


.sub 'same_scope_as' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8067
# r: $I1
    issame $I1, self, __ARG_1
.annotate 'line', 8068
    .return($I1)
# }
.annotate 'line', 8069

.end # same_scope_as


.sub 'parse_parameters' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8072
# var params: $P1
    getattribute $P1, self, 'params'
.annotate 'line', 8073
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 8074
    $P3 = $P2.'isop'(')')
    isfalse $I1, $P3
    unless $I1 goto __label_0
# {
.annotate 'line', 8075
    __ARG_1.'unget'($P2)
 __label_1: # do
.annotate 'line', 8076
# {
.annotate 'line', 8077
    new $P4, [ 'FunctionParameter' ]
    $P4.'FunctionParameter'(self, __ARG_1)
    set $P3, $P4
# predefined push
    push $P1, $P3
.annotate 'line', 8078
    $P2 = __ARG_1.'get'()
# }
 __label_3: # continue
.annotate 'line', 8079
    $P3 = $P2.'isop'(',')
    if_null $P3, __label_2
    if $P3 goto __label_1
 __label_2: # enddo
.annotate 'line', 8080
    $P3 = $P2.'isop'(')')
    isfalse $I1, $P3
    unless $I1 goto __label_4
.annotate 'line', 8081
    'Expected'("')' or ','", $P2)
 __label_4: # endif
# }
 __label_0: # endif
# }
.annotate 'line', 8083

.end # parse_parameters


.sub 'addlocalfunction' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8087
# var localfun: $P1
    getattribute $P1, self, 'localfun'
.annotate 'line', 8088
    unless_null $P1, __label_0
.annotate 'line', 8089
    root_new $P3, ['parrot';'ResizablePMCArray']
    push $P3, __ARG_1
    setattribute self, 'localfun', $P3
    goto __label_1
 __label_0: # else
.annotate 'line', 8091
# predefined push
    push $P1, __ARG_1
 __label_1: # endif
# }
.annotate 'line', 8092

.end # addlocalfunction


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8096
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 8097
    .return(self)
# }
.annotate 'line', 8098

.end # optimize


.sub 'setusedlex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 8102
# var lexicals: $P1
    getattribute $P1, self, 'usedlexicals'
.annotate 'line', 8103
    unless_null $P1, __label_0
# {
.annotate 'line', 8104
    root_new $P1, ['parrot';'Hash']
.annotate 'line', 8105
    setattribute self, 'usedlexicals', $P1
# }
 __label_0: # endif
.annotate 'line', 8107
    $P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 8108

.end # setusedlex


.sub 'setlex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 8111
# var lexicals: $P1
    getattribute $P1, self, 'lexicals'
.annotate 'line', 8112
    unless_null $P1, __label_0
# {
.annotate 'line', 8113
    root_new $P1, ['parrot';'Hash']
.annotate 'line', 8114
    setattribute self, 'lexicals', $P1
# }
 __label_0: # endif
.annotate 'line', 8116
    $P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 8117

.end # setlex


.sub 'createlex' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8122
# var lex: $P1
    $P1 = __ARG_1.'getlex'()
.annotate 'line', 8123
# lexname: $S1
    null $S1
.annotate 'line', 8124
    if_null $P1, __label_0
.annotate 'line', 8125
    set $S1, $P1
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 8127
# reg: $S2
    $P2 = __ARG_1.'getreg'()
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
 __label_2:
.annotate 'line', 8128
# lexnum: $I1
    $P2 = self.'getlexnum'()
    set $I1, $P2
.annotate 'line', 8129
# predefined string
    set $S3, $I1
    concat $S0, '__WLEX_', $S3
    set $S1, $S0
.annotate 'line', 8130
    self.'setlex'($S1, $S2)
.annotate 'line', 8131
    __ARG_1.'setlex'($S1)
# }
 __label_1: # endif
.annotate 'line', 8133
    .return($S1)
# }
.annotate 'line', 8134

.end # createlex


.sub 'createreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8138
# var store: $P1
    null $P1
.annotate 'line', 8139
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
# switch
 __label_2: # case
.annotate 'line', 8141
    getattribute $P1, self, 'regstI'
    goto __label_0 # break
 __label_3: # case
.annotate 'line', 8143
    getattribute $P1, self, 'regstN'
    goto __label_0 # break
 __label_4: # case
.annotate 'line', 8145
    getattribute $P1, self, 'regstS'
    goto __label_0 # break
 __label_5: # case
.annotate 'line', 8147
    getattribute $P1, self, 'regstP'
    goto __label_0 # break
 __label_1: # default
.annotate 'line', 8149
    concat $S4, 'Invalid type in createreg: ', __ARG_1
    'InternalError'($S4)
 __label_0: # switch end
.annotate 'line', 8151
# reg: $S1
    $P2 = $P1.'createreg'()
    null $S1
    if_null $P2, __label_6
    set $S1, $P2
 __label_6:
.annotate 'line', 8152
    .return($S1)
# }
.annotate 'line', 8153

.end # createreg


.sub 'tempreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8156
# var store: $P1
    null $P1
.annotate 'line', 8157
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
# switch
 __label_2: # case
.annotate 'line', 8159
    getattribute $P1, self, 'regstI'
    goto __label_0 # break
 __label_3: # case
.annotate 'line', 8161
    getattribute $P1, self, 'regstN'
    goto __label_0 # break
 __label_4: # case
.annotate 'line', 8163
    getattribute $P1, self, 'regstS'
    goto __label_0 # break
 __label_5: # case
.annotate 'line', 8165
    getattribute $P1, self, 'regstP'
    goto __label_0 # break
 __label_1: # default
.annotate 'line', 8167
    concat $S4, "Invalid type '", __ARG_1
    concat $S4, $S4, "' in tempreg"
    'InternalError'($S4)
 __label_0: # switch end
.annotate 'line', 8169
# reg: $S1
    $P2 = $P1.'tempreg'()
    null $S1
    if_null $P2, __label_6
    set $S1, $P2
 __label_6:
.annotate 'line', 8170
    .return($S1)
# }
.annotate 'line', 8171

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 8174
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
.annotate 'line', 8175
    $P1.'freetemps'()
    goto __label_0
 __label_1: # endfor
# }
.annotate 'line', 8176

.end # freetemps


.sub 'genlabel' :method
# Body
# {
.annotate 'line', 8179
# var nlabel: $P1
    getattribute $P1, self, 'nlabel'
.annotate 'line', 8180
# n: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 8181
# s: $S1
    set $I2, $I1
    inc $I1
    set $S2, $I2
    concat $S1, '__label_', $S2
.annotate 'line', 8182
    assign $P1, $I1
.annotate 'line', 8183
    .return($S1)
# }
.annotate 'line', 8184

.end # genlabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8187
    'SyntaxError'('break not allowed here', __ARG_1)
# }
.annotate 'line', 8188

.end # getbreaklabel


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8191
    'SyntaxError'('continue not allowed here', __ARG_1)
# }
.annotate 'line', 8192

.end # getcontinuelabel


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8196
# name: $S1
    getattribute $P13, self, 'name'
    null $S1
    if_null $P13, __label_0
    set $S1, $P13
 __label_0:
.annotate 'line', 8197
    __ARG_1.'say'()
.annotate 'line', 8198
    __ARG_1.'print'(".sub ")
.annotate 'line', 8199
    $P13 = self.'isanonymous'()
    if_null $P13, __label_1
    unless $P13 goto __label_1
.annotate 'line', 8200
    __ARG_1.'print'("'' :anon")
    goto __label_2
 __label_1: # else
.annotate 'line', 8202
    __ARG_1.'print'("'", $S1, "'")
 __label_2: # endif
.annotate 'line', 8203
    getattribute $P13, self, 'subid'
    if_null $P13, __label_3
.annotate 'line', 8204
    getattribute $P14, self, 'subid'
    __ARG_1.'print'(" :subid('", $P14, "')")
 __label_3: # endif
.annotate 'line', 8205
    getattribute $P13, self, 'outer'
    if_null $P13, __label_4
# {
.annotate 'line', 8206
# var outer: $P1
    getattribute $P1, self, 'outer'
.annotate 'line', 8207
# var outerid: $P2
    getattribute $P2, $P1, 'subid'
.annotate 'line', 8208
    if_null $P2, __label_5
.annotate 'line', 8209
    __ARG_1.'print'(" :outer('", $P2, "')")
 __label_5: # endif
# }
 __label_4: # endif
.annotate 'line', 8213
    $P13 = self.'ismethod'()
    if_null $P13, __label_6
    unless $P13 goto __label_6
.annotate 'line', 8214
    __ARG_1.'print'(' :method')
 __label_6: # endif
.annotate 'line', 8215
# var modifiers: $P3
    getattribute $P3, self, 'modifiers'
.annotate 'line', 8216
    if_null $P3, __label_7
# {
.annotate 'line', 8217
# var mlist: $P4
    $P4 = $P3.'getlist'()
.annotate 'line', 8218
    iter $P15, $P4
    set $P15, 0
 __label_9: # for iteration
    unless $P15 goto __label_10
    shift $P5, $P15
# {
.annotate 'line', 8219
# nargmods: $I1
    $P13 = $P5.'numargs'()
    set $I1, $P13
.annotate 'line', 8220
    $P13 = $P5.'getname'()
    __ARG_1.'print'(' :', $P13)
.annotate 'line', 8221
    le $I1, 0, __label_11
# {
.annotate 'line', 8222
    __ARG_1.'print'('(')
# for loop
.annotate 'line', 8223
# iargmod: $I2
    null $I2
 __label_14: # for condition
    ge $I2, $I1, __label_13
# {
.annotate 'line', 8224
# var argmod: $P6
    $P6 = $P5.'getarg'($I2)
.annotate 'line', 8225
    $P13 = $P6.'isstringliteral'()
    isfalse $I4, $P13
    unless $I4 goto __label_15
.annotate 'line', 8226
    getattribute $P14, $P6, 'start'
    'SyntaxError'('Invalid modifier', $P14)
 __label_15: # endif
.annotate 'line', 8227
    $P13 = $P6.'getPirString'()
    __ARG_1.'print'($P13)
# }
 __label_12: # for iteration
.annotate 'line', 8223
    inc $I2
    goto __label_14
 __label_13: # for end
.annotate 'line', 8229
    __ARG_1.'print'(')')
# }
 __label_11: # endif
# }
    goto __label_9
 __label_10: # endfor
# }
    goto __label_8
 __label_7: # else
# {
.annotate 'line', 8234
    ne $S1, 'main', __label_16
.annotate 'line', 8235
    __ARG_1.'print'(' :main')
 __label_16: # endif
# }
 __label_8: # endif
.annotate 'line', 8237
    __ARG_1.'say'()
.annotate 'line', 8240
    getattribute $P13, self, 'params'
    iter $P16, $P13
    set $P16, 0
 __label_17: # for iteration
    unless $P16 goto __label_18
    shift $P7, $P16
.annotate 'line', 8241
    $P7.'emit'(self, __ARG_1)
    goto __label_17
 __label_18: # endfor
.annotate 'line', 8243
# var lexicals: $P8
    getattribute $P8, self, 'lexicals'
.annotate 'line', 8244
# var usedlexicals: $P9
    getattribute $P9, self, 'usedlexicals'
.annotate 'line', 8245
    isnull $I4, $P8
    not $I4
    if $I4 goto __label_20
    isnull $I4, $P9
    not $I4
 __label_20:
    unless $I4 goto __label_19
# {
.annotate 'line', 8246
    getattribute $P13, self, 'start'
    __ARG_1.'annotate'($P13)
.annotate 'line', 8248
    if_null $P8, __label_21
# {
.annotate 'line', 8250
    iter $P17, $P8
    set $P17, 0
 __label_22: # for iteration
    unless $P17 goto __label_23
    shift $S2, $P17
.annotate 'line', 8251
    $P13 = $P8[$S2]
    __ARG_1.'say'(".lex '", $P13, "', ", $S2)
    goto __label_22
 __label_23: # endfor
# }
 __label_21: # endif
.annotate 'line', 8254
    if_null $P9, __label_24
# {
.annotate 'line', 8256
    iter $P18, $P9
    set $P18, 0
 __label_25: # for iteration
    unless $P18 goto __label_26
    shift $S3, $P18
.annotate 'line', 8257
    $P13 = $P9[$S3]
    __ARG_1.'emitfind_lex'($S3, $P13)
    goto __label_25
 __label_26: # endfor
# }
 __label_24: # endif
# }
 __label_19: # endif
.annotate 'line', 8261
# var body: $P10
    getattribute $P10, self, 'body'
.annotate 'line', 8262
    $P13 = $P10.'isempty'()
    if_null $P13, __label_27
    unless $P13 goto __label_27
.annotate 'line', 8263
    __ARG_1.'comment'('Empty body')
    goto __label_28
 __label_27: # else
# {
.annotate 'line', 8265
    __ARG_1.'comment'('Body')
.annotate 'line', 8266
    $P10.'emit'(__ARG_1)
.annotate 'line', 8267
    $P13 = $P10.'getend'()
    __ARG_1.'annotate'($P13)
# }
 __label_28: # endif
.annotate 'line', 8269
    __ARG_1.'say'("\n.end # ", $S1, "\n")
.annotate 'line', 8272
# var localfun: $P11
    getattribute $P11, self, 'localfun'
.annotate 'line', 8273
    if_null $P11, __label_29
# {
# for loop
.annotate 'line', 8274
# ifn: $I3
    null $I3
 __label_32: # for condition
# predefined elements
    elements $I4, $P11
    ge $I3, $I4, __label_31
# {
.annotate 'line', 8275
# var fn: $P12
    $P12 = $P11[$I3]
.annotate 'line', 8276
    $P12.'emit'(__ARG_1)
# }
 __label_30: # for iteration
.annotate 'line', 8274
    inc $I3
    goto __label_32
 __label_31: # for end
# }
 __label_29: # endif
# }
.annotate 'line', 8279

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FunctionBase' ]
.annotate 'line', 8025
    get_class $P1, [ 'BlockStatement' ]
    addparent $P0, $P1
.annotate 'line', 8027
    addattribute $P0, 'name'
.annotate 'line', 8028
    addattribute $P0, 'subid'
.annotate 'line', 8029
    addattribute $P0, 'modifiers'
.annotate 'line', 8030
    addattribute $P0, 'params'
.annotate 'line', 8031
    addattribute $P0, 'body'
.annotate 'line', 8032
    addattribute $P0, 'regstI'
.annotate 'line', 8033
    addattribute $P0, 'regstN'
.annotate 'line', 8034
    addattribute $P0, 'regstS'
.annotate 'line', 8035
    addattribute $P0, 'regstP'
.annotate 'line', 8036
    addattribute $P0, 'nlabel'
.annotate 'line', 8037
    addattribute $P0, 'localfun'
.annotate 'line', 8038
    addattribute $P0, 'lexicals'
.annotate 'line', 8039
    addattribute $P0, 'usedlexicals'
.annotate 'line', 8040
    addattribute $P0, 'outer'
.end
.namespace [ 'FunctionStatement' ]

.sub 'FunctionStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8293
    self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 8294
    box $P1, 0
    setattribute self, 'paramnum', $P1
.annotate 'line', 8295
    box $P1, 0
    setattribute self, 'lexnum', $P1
.annotate 'line', 8296
    self.'parse'(__ARG_2)
# }
.annotate 'line', 8297

.end # FunctionStatement


.sub 'isanonymous' :method
# Body
# {
.annotate 'line', 8299
    .return(0)
# }

.end # isanonymous


.sub 'getparamnum' :method
# Body
# {
.annotate 'line', 8303
# var paramnum: $P1
    getattribute $P1, self, 'paramnum'
.annotate 'line', 8304
# n: $I1
    set $I2, $P1
    add $I1, $I2, 1
.annotate 'line', 8305
    assign $P1, $I1
.annotate 'line', 8306
    .return($I1)
# }
.annotate 'line', 8307

.end # getparamnum


.sub 'getlexnum' :method
# Body
# {
.annotate 'line', 8311
# var lexnum: $P1
    getattribute $P1, self, 'lexnum'
.annotate 'line', 8312
# n: $I1
    set $I2, $P1
    add $I1, $I2, 1
.annotate 'line', 8313
    assign $P1, $I1
.annotate 'line', 8314
    .return($I1)
# }
.annotate 'line', 8315

.end # getlexnum


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 8316
    .return(0)
# }

.end # ismethod


.sub 'parse' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8320
# var name: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8321
    setattribute self, 'name', $P1
.annotate 'line', 8322
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 8323
    $P4 = $P2.'isop'('[')
    if_null $P4, __label_0
    unless $P4 goto __label_0
# {
.annotate 'line', 8324
    new $P7, [ 'ModifierList' ]
    $P7.'ModifierList'(__ARG_1, self)
    set $P6, $P7
    setattribute self, 'modifiers', $P6
.annotate 'line', 8325
    $P2 = __ARG_1.'get'()
# }
 __label_0: # endif
.annotate 'line', 8327
    'RequireOp'('(', $P2)
.annotate 'line', 8328
    self.'parse_parameters'(__ARG_1)
.annotate 'line', 8330
# var fullname: $P3
    getattribute $P5, self, 'owner'
    $P4 = $P5.'getpath'()
# predefined clone
    clone $P3, $P4
.annotate 'line', 8331
    $P4 = $P1.'getidentifier'()
# predefined push
    push $P3, $P4
.annotate 'line', 8333
    new $P5, [ 'StringLiteral' ]
.annotate 'line', 8334
    new $P7, [ 'TokenQuoted' ]
    getattribute $P8, $P1, 'file'
    getattribute $P9, $P1, 'line'
# predefined join
    join $S1, '.', $P3
    $P7.'TokenQuoted'($P8, $P9, $S1)
    set $P6, $P7
    $P5.'StringLiteral'(self, $P6)
    set $P4, $P5
.annotate 'line', 8332
    self.'createconst'('__FUNCTION__', 'S', $P4, '')
.annotate 'line', 8337
    $P2 = __ARG_1.'get'()
.annotate 'line', 8338
    $P4 = $P2.'isop'('{')
    isfalse $I1, $P4
    unless $I1 goto __label_1
.annotate 'line', 8339
    'ExpectedOp'('{', $P2)
 __label_1: # endif
.annotate 'line', 8340
    new $P6, [ 'CompoundStatement' ]
    $P6.'CompoundStatement'($P2, __ARG_1, self)
    set $P5, $P6
    setattribute self, 'body', $P5
.annotate 'line', 8341
    .return(self)
# }
.annotate 'line', 8342

.end # parse

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FunctionStatement' ]
.annotate 'line', 8286
    get_class $P1, [ 'FunctionBase' ]
    addparent $P0, $P1
.annotate 'line', 8288
    addattribute $P0, 'paramnum'
.annotate 'line', 8289
    addattribute $P0, 'lexnum'
.end
.namespace [ 'LocalFunctionStatement' ]

.sub 'LocalFunctionStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8353
    self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 8354
    $P4 = __ARG_3.'getouter'()
    setattribute self, 'outer', $P4
.annotate 'line', 8355
    getattribute $P3, self, 'outer'
    $P3.'makesubid'()
.annotate 'line', 8356
# var subid: $P1
    $P1 = self.'makesubid'()
.annotate 'line', 8357
    setattribute self, 'name', $P1
.annotate 'line', 8358
    self.'parse_parameters'(__ARG_2)
.annotate 'line', 8359
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 8360
    'RequireOp'('{', $P2)
.annotate 'line', 8361
    new $P5, [ 'CompoundStatement' ]
    $P5.'CompoundStatement'($P2, __ARG_2, self)
    set $P4, $P5
    setattribute self, 'body', $P4
.annotate 'line', 8362
    __ARG_3.'addlocalfunction'(self)
# }
.annotate 'line', 8363

.end # LocalFunctionStatement


.sub 'isanonymous' :method
# Body
# {
.annotate 'line', 8364
    .return(1)
# }

.end # isanonymous


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 8365
    .return(0)
# }

.end # ismethod


.sub 'getsubid' :method
# Body
# {
.annotate 'line', 8368
    getattribute $P1, self, 'subid'
    .return($P1)
# }
.annotate 'line', 8369

.end # getsubid


.sub 'getparamnum' :method
# Body
# {
.annotate 'line', 8373
    getattribute $P1, self, 'outer'
    .tailcall $P1.'getparamnum'()
# }
.annotate 'line', 8374

.end # getparamnum


.sub 'getlexnum' :method
# Body
# {
.annotate 'line', 8378
    getattribute $P1, self, 'outer'
    .tailcall $P1.'getlexnum'()
# }
.annotate 'line', 8379

.end # getlexnum


.sub 'getvar' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8382
# var r: $P1
    $P1 = self.'getlocalvar'(__ARG_1)
.annotate 'line', 8383
    unless_null $P1, __label_0
# {
.annotate 'line', 8386
    getattribute $P6, self, 'owner'
    $P1 = $P6.'getvar'(__ARG_1)
.annotate 'line', 8387
    unless_null $P1, __label_1
# {
.annotate 'line', 8389
    ne __ARG_1, 'self', __label_3
# {
.annotate 'line', 8390
# var ownerscope: $P2
    getattribute $P2, self, 'outer'
.annotate 'line', 8391
    getattribute $P7, self, 'outer'
    $P6 = $P7.'ismethod'()
    if_null $P6, __label_4
    unless $P6 goto __label_4
# {
.annotate 'line', 8392
# lexself: $S1
    $P8 = $P2.'makelexicalself'()
    null $S1
    if_null $P8, __label_5
    set $S1, $P8
 __label_5:
.annotate 'line', 8393
    $P1 = self.'createvar'(__ARG_1, 'P')
.annotate 'line', 8394
# reg: $S2
    $P6 = $P1.'getreg'()
    null $S2
    if_null $P6, __label_6
    set $S2, $P6
 __label_6:
.annotate 'line', 8395
    self.'setusedlex'($S1, $S2)
# }
 __label_4: # endif
# }
 __label_3: # endif
# }
    goto __label_2
 __label_1: # else
.annotate 'line', 8399
    $P6 = $P1.'gettype'()
    set $S5, $P6
    iseq $I2, $S5, 'P'
    unless $I2 goto __label_8
    $P7 = $P1.'isconst'()
    isfalse $I2, $P7
 __label_8:
    unless $I2 goto __label_7
# {
.annotate 'line', 8400
# var scope: $P3
    $P3 = $P1.'getscope'()
.annotate 'line', 8401
# var ownerscope: $P4
    $P4 = $P3.'getouter'()
.annotate 'line', 8402
# var outer: $P5
    getattribute $P5, self, 'outer'
.annotate 'line', 8403
    isa $I2, $P4, [ 'FunctionBase' ]
    unless $I2 goto __label_9
# {
.annotate 'line', 8404
    $P6 = $P4.'same_scope_as'($P5)
    if_null $P6, __label_10
    unless $P6 goto __label_10
# {
.annotate 'line', 8405
# lexname: $S3
    $P7 = $P3.'makelexical'($P1)
    null $S3
    if_null $P7, __label_11
    set $S3, $P7
 __label_11:
.annotate 'line', 8406
# flags: $I1
    $I2 = $P1.'getflags'()
    bor $I1, $I2, 2
.annotate 'line', 8407
    $P1 = self.'createvar'(__ARG_1, 'P', $I1)
.annotate 'line', 8408
    box $P6, $S3
    setattribute $P1, 'lexname', $P6
.annotate 'line', 8409
# reg: $S4
    $P6 = $P1.'getreg'()
    null $S4
    if_null $P6, __label_12
    set $S4, $P6
 __label_12:
.annotate 'line', 8410
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
.annotate 'line', 8415
    isnull $I2, $P1
    not $I2
    unless $I2 goto __label_14
    isa $I3, $P1, [ 'VarData' ]
    not $I2, $I3
 __label_14:
    unless $I2 goto __label_13
.annotate 'line', 8416
    'InternalError'('Incorrect data for variable in LocalFunction')
 __label_13: # endif
.annotate 'line', 8417
    .return($P1)
# }
.annotate 'line', 8418

.end # getvar

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'LocalFunctionStatement' ]
.annotate 'line', 8349
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
.annotate 'line', 8429
    self.'FunctionStatement'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 8430

.end # MethodStatement


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 8431
    .return(1)
# }

.end # ismethod

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MethodStatement' ]
.annotate 'line', 8425
    get_class $P1, [ 'FunctionStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'SigParameter' ]

.sub 'SigParameter' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8445
# var name: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8446
    $P4 = $P1.'isidentifier'()
    isfalse $I1, $P4
    unless $I1 goto __label_0
.annotate 'line', 8447
    'SyntaxError'("Identifier expected", $P1)
 __label_0: # endif
.annotate 'line', 8448
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 8449
    $P4 = $P2.'isidentifier'()
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 8450
# type: $S1
    $P6 = $P1.'checkkeyword'()
    $P5 = 'typetoregcheck'($P6)
    null $S1
    if_null $P5, __label_2
    set $S1, $P5
 __label_2:
.annotate 'line', 8451
    set $P1, $P2
.annotate 'line', 8452
    __ARG_2.'createvar'($P1, $S1)
.annotate 'line', 8453
    $P2 = __ARG_1.'get'()
# }
 __label_1: # endif
.annotate 'line', 8455
    setattribute self, 'name', $P1
.annotate 'line', 8456
# var data: $P3
    $P4 = $P1.'getidentifier'()
    $P3 = __ARG_2.'getvar'($P4)
.annotate 'line', 8457
    $P5 = $P3.'getreg'()
    setattribute self, 'reg', $P5
.annotate 'line', 8458
    $P4 = $P2.'isop'('[')
    if_null $P4, __label_3
    unless $P4 goto __label_3
.annotate 'line', 8459
    new $P7, [ 'ParameterModifierList' ]
    $P7.'ParameterModifierList'(__ARG_1, self)
    set $P6, $P7
    setattribute self, 'modifiers', $P6
    goto __label_4
 __label_3: # else
.annotate 'line', 8461
    __ARG_1.'unget'($P2)
 __label_4: # endif
# }
.annotate 'line', 8462

.end # SigParameter


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8465
    getattribute $P3, self, 'reg'
    __ARG_1.'print'($P3)
.annotate 'line', 8466
# var modifiers: $P1
    getattribute $P1, self, 'modifiers'
.annotate 'line', 8467
    if_null $P1, __label_0
# {
.annotate 'line', 8468
# var name: $P2
    getattribute $P2, self, 'name'
.annotate 'line', 8469
    $P1.'emitmodifiers'(__ARG_1, $P2, $P2)
# }
 __label_0: # endif
# }
.annotate 'line', 8471

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'SigParameter' ]
.annotate 'line', 8440
    addattribute $P0, 'name'
.annotate 'line', 8441
    addattribute $P0, 'modifiers'
.annotate 'line', 8442
    addattribute $P0, 'reg'
.end
.namespace [ 'SigParameterList' ]

.sub 'SigParameterList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8479
# var t: $P1
    null $P1
.annotate 'line', 8480
# var params: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
 __label_0: # do
.annotate 'line', 8481
# {
.annotate 'line', 8482
# var sigelem: $P3
    new $P3, [ 'SigParameter' ]
    $P3.'SigParameter'(__ARG_1, __ARG_2)
.annotate 'line', 8483
    $P2.'push'($P3)
.annotate 'line', 8484
    $P1 = __ARG_1.'get'()
# }
 __label_2: # continue
.annotate 'line', 8485
    $P4 = $P1.'isop'(',')
    if_null $P4, __label_1
    if $P4 goto __label_0
 __label_1: # enddo
.annotate 'line', 8486
    $P4 = $P1.'isop'(')')
    isfalse $I1, $P4
    unless $I1 goto __label_3
.annotate 'line', 8487
    'SyntaxError'("Expected ',' or ')'", $P1)
 __label_3: # endif
.annotate 'line', 8488
    setattribute self, 'params', $P2
# }
.annotate 'line', 8489

.end # SigParameterList


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8492
    __ARG_1.'print'('(')
.annotate 'line', 8493
# sep: $S1
    set $S1, ''
.annotate 'line', 8494
    getattribute $P2, self, 'params'
    iter $P3, $P2
    set $P3, 0
 __label_0: # for iteration
    unless $P3 goto __label_1
    shift $P1, $P3
# {
.annotate 'line', 8495
    __ARG_1.'print'($S1)
.annotate 'line', 8496
    $P1.'emit'(__ARG_1)
.annotate 'line', 8497
    set $S1, ', '
# }
    goto __label_0
 __label_1: # endfor
.annotate 'line', 8499
    __ARG_1.'print'(')')
# }
.annotate 'line', 8500

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'SigParameterList' ]
.annotate 'line', 8476
    addattribute $P0, 'params'
.end
.namespace [ 'MultiAssignStatement' ]

.sub 'MultiAssignStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8509
    setattribute self, 'params', __ARG_1
.annotate 'line', 8510
    setattribute self, 'expr', __ARG_2
# }
.annotate 'line', 8511

.end # MultiAssignStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8514
    getattribute $P3, self, 'expr'
    $P2 = $P3.'optimize'()
    setattribute self, 'expr', $P2
.annotate 'line', 8515
    .return(self)
# }
.annotate 'line', 8516

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8519
# var expr: $P1
    getattribute $P1, self, 'expr'
.annotate 'line', 8520
# var call: $P2
    $P2 = $P1.'emitcall'(__ARG_1)
.annotate 'line', 8521
    __ARG_1.'print'('    ')
.annotate 'line', 8522
    getattribute $P3, self, 'params'
    $P3.'emit'(__ARG_1)
.annotate 'line', 8523
    __ARG_1.'print'(' = ', $P2)
.annotate 'line', 8524
    getattribute $P3, self, 'expr'
    $P3.'emitargs'(__ARG_1)
.annotate 'line', 8525
    __ARG_1.'say'()
# }
.annotate 'line', 8526

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MultiAssignStatement' ]
.annotate 'line', 8505
    addattribute $P0, 'params'
.annotate 'line', 8506
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
.annotate 'line', 8543
    self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 8544

.end # ClassSpecifier


.sub 'reftype' :method
# Body
# {
.annotate 'line', 8545
    .return(0)
# }

.end # reftype


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8549
    getattribute $P1, self, 'start'
    __ARG_1.'annotate'($P1)
# }
.annotate 'line', 8550

.end # annotate

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassSpecifier' ]
.annotate 'line', 8539
    get_class $P1, [ 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'ClassSpecifierStr' ]

.sub 'ClassSpecifierStr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8558
    self.'ClassSpecifier'(__ARG_1, __ARG_2)
.annotate 'line', 8559
    setattribute self, 'name', __ARG_2
# }
.annotate 'line', 8560

.end # ClassSpecifierStr


.sub 'reftype' :method
# Body
# {
.annotate 'line', 8561
    .return(1)
# }

.end # reftype


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8565
# basestr: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 8566
    __ARG_1.'print'($S1)
# }
.annotate 'line', 8567

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassSpecifierStr' ]
.annotate 'line', 8553
    get_class $P1, [ 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 8555
    addattribute $P0, 'name'
.end
.namespace [ 'ClassSpecifierParrotKey' ]

.sub 'ClassSpecifierParrotKey' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8576
    self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 8577
# var key: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 8578
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 8579
    $P3 = $P2.'isstring'()
    isfalse $I1, $P3
    unless $I1 goto __label_0
.annotate 'line', 8580
    'Expected'('literal string', $P2)
 __label_0: # endif
.annotate 'line', 8581
    $P3 = $P2.'rawstring'()
# predefined push
    push $P1, $P3
.annotate 'line', 8582
    $P2 = __ARG_1.'get'()
.annotate 'line', 8583
    $P3 = $P2.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_1
# {
.annotate 'line', 8584
    $P4 = $P2.'checkop'()
    set $S1, $P4
    set $S2, ':'
    if $S1 == $S2 goto __label_4
    set $S2, ','
    if $S1 == $S2 goto __label_5
    goto __label_3
# switch
 __label_4: # case
.annotate 'line', 8586
    box $P5, 1
    setattribute self, 'hll', $P5
 __label_5: # case
    goto __label_2 # break
 __label_3: # default
.annotate 'line', 8590
    'SyntaxError'('Unexpected token in class key', $P2)
 __label_2: # switch end
 __label_6: # do
.annotate 'line', 8592
# {
.annotate 'line', 8593
    $P2 = __ARG_1.'get'()
.annotate 'line', 8594
    $P3 = $P2.'isstring'()
    isfalse $I1, $P3
    unless $I1 goto __label_9
.annotate 'line', 8595
    'Expected'('literal string', $P2)
 __label_9: # endif
.annotate 'line', 8596
    $P3 = $P2.'rawstring'()
# predefined push
    push $P1, $P3
# }
 __label_8: # continue
.annotate 'line', 8597
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'(',')
    if_null $P3, __label_7
    if $P3 goto __label_6
 __label_7: # enddo
.annotate 'line', 8598
    'RequireOp'(']', $P2)
# }
 __label_1: # endif
.annotate 'line', 8600
    setattribute self, 'key', $P1
# }
.annotate 'line', 8601

.end # ClassSpecifierParrotKey


.sub 'reftype' :method
# Body
# {
.annotate 'line', 8602
    .return(2)
# }

.end # reftype


.sub 'hasHLL' :method
# Body
# {
# predefined int
.annotate 'line', 8605
    getattribute $P1, self, 'hll'
    isnull $I1, $P1
    not $I1
    .return($I1)
# }
.annotate 'line', 8606

.end # hasHLL


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8610
    getattribute $P2, self, 'key'
    $P1 = 'getparrotkey'($P2)
    __ARG_1.'print'($P1)
# }
.annotate 'line', 8611

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassSpecifierParrotKey' ]
.annotate 'line', 8570
    get_class $P1, [ 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 8572
    addattribute $P0, 'key'
.annotate 'line', 8573
    addattribute $P0, 'hll'
.end
.namespace [ 'ClassSpecifierId' ]

.sub 'ClassSpecifierId' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8619
    self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 8620
# var key: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
# predefined string
    set $S1, __ARG_3
    box $P3, $S1
    push $P1, $P3
.annotate 'line', 8621
# var t: $P2
    null $P2
 __label_1: # while
.annotate 'line', 8622
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_0
    unless $P3 goto __label_0
# {
.annotate 'line', 8623
    $P2 = __ARG_1.'get'()
.annotate 'line', 8624
# predefined string
    set $S1, $P2
# predefined push
    push $P1, $S1
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 8626
    __ARG_1.'unget'($P2)
.annotate 'line', 8627
    setattribute self, 'key', $P1
# }
.annotate 'line', 8628

.end # ClassSpecifierId


.sub 'reftype' :method
# Body
# {
.annotate 'line', 8629
    .return(3)
# }

.end # reftype


.sub 'last' :method
# Body
# {
.annotate 'line', 8633
# var key: $P1
    getattribute $P1, self, 'key'
.annotate 'line', 8634
    $P2 = $P1[-1]
    .return($P2)
# }
.annotate 'line', 8635

.end # last


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8639
# var key: $P1
    getattribute $P2, self, 'key'
    $P1 = __ARG_2.'findclasskey'($P2)
.annotate 'line', 8640
    unless_null $P1, __label_0
# {
.annotate 'line', 8641
    $P2 = self.'dowarnings'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 8642
    getattribute $P3, self, 'key'
# predefined join
    join $S1, ".", $P3
    concat $S2, "class ", $S1
    concat $S2, $S2, " not found at compile time"
    'Warn'($S2)
 __label_2: # endif
.annotate 'line', 8643
    getattribute $P3, self, 'key'
    $P2 = 'getparrotkey'($P3)
    __ARG_1.'print'($P2)
# }
    goto __label_1
 __label_0: # else
.annotate 'line', 8645
    $P2 = $P1.'getclasskey'()
    __ARG_1.'print'($P2)
 __label_1: # endif
# }
.annotate 'line', 8646

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassSpecifierId' ]
.annotate 'line', 8614
    get_class $P1, [ 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 8616
    addattribute $P0, 'key'
.end
.namespace [ ]

.sub 'parseClassSpecifier'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8651
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8652
    $P2 = $P1.'isstring'()
    if_null $P2, __label_0
    unless $P2 goto __label_0
.annotate 'line', 8653
    new $P4, [ 'ClassSpecifierStr' ]
    $P4.'ClassSpecifierStr'(__ARG_2, $P1)
    set $P3, $P4
    .return($P3)
 __label_0: # endif
.annotate 'line', 8654
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 8655
    new $P4, [ 'ClassSpecifierParrotKey' ]
    $P4.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
 __label_1: # endif
.annotate 'line', 8656
    $P2 = $P1.'isidentifier'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 8657
    new $P4, [ 'ClassSpecifierId' ]
    $P4.'ClassSpecifierId'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
 __label_2: # endif
.annotate 'line', 8658
    'SyntaxError'('Invalid class', $P1)
# }
.annotate 'line', 8659

.end # parseClassSpecifier

.namespace [ 'ClassBase' ]

.sub 'ClassBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8671
    self.'initbase'(__ARG_1, __ARG_3)
.annotate 'line', 8672
    setattribute self, 'name', __ARG_2
.annotate 'line', 8673
# var classns: $P1
    $P2 = __ARG_3.'getpath'()
# predefined clone
    clone $P1, $P2
.annotate 'line', 8674
    getattribute $P2, self, 'name'
# predefined push
    push $P1, $P2
.annotate 'line', 8675
    setattribute self, 'classns', $P1
# }
.annotate 'line', 8676

.end # ClassBase


.sub 'getclasskey' :method
# Body
# {
.annotate 'line', 8679
    getattribute $P1, self, 'classns'
    .tailcall 'getparrotkey'($P1)
# }
.annotate 'line', 8680

.end # getclasskey

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassBase' ]
.annotate 'line', 8665
    get_class $P1, [ 'CommonBase' ]
    addparent $P0, $P1
.annotate 'line', 8667
    addattribute $P0, 'name'
.annotate 'line', 8668
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
.annotate 'line', 8693
    self.'ClassBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 8694
    setattribute self, 'parent', __ARG_3
.annotate 'line', 8695
# var functions: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 8696
    setattribute self, 'functions', $P1
.annotate 'line', 8697
# var members: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 8698
    setattribute self, 'members', $P2
.annotate 'line', 8699
    root_new $P11, ['parrot';'ResizablePMCArray']
    setattribute self, 'bases', $P11
.annotate 'line', 8700
# var constants: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 8701
    setattribute self, 'constants', $P3
.annotate 'line', 8703
# var t: $P4
    $P4 = __ARG_4.'get'()
.annotate 'line', 8704
    $P10 = $P4.'isop'(':')
    if_null $P10, __label_0
    unless $P10 goto __label_0
# {
.annotate 'line', 8705
# var bases: $P5
    getattribute $P5, self, 'bases'
 __label_2: # Infinite loop
.annotate 'line', 8706
# {
.annotate 'line', 8707
# var base: $P6
    $P6 = 'parseClassSpecifier'(__ARG_4, self)
.annotate 'line', 8708
# predefined push
    push $P5, $P6
.annotate 'line', 8709
    $P4 = __ARG_4.'get'()
.annotate 'line', 8710
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
.annotate 'line', 8713
    'RequireOp'('{', $P4)
# for loop
.annotate 'line', 8714
    $P4 = __ARG_4.'get'()
 __label_6: # for condition
    $P10 = $P4.'isop'('}')
    isfalse $I1, $P10
    unless $I1 goto __label_5
# {
.annotate 'line', 8715
    $P11 = $P4.'checkkeyword'()
    set $S1, $P11
    set $S2, 'function'
    if $S1 == $S2 goto __label_9
    set $S2, 'var'
    if $S1 == $S2 goto __label_10
    set $S2, 'const'
    if $S1 == $S2 goto __label_11
    goto __label_8
# switch
 __label_9: # case
.annotate 'line', 8717
# var f: $P7
    new $P7, [ 'MethodStatement' ]
    $P7.'MethodStatement'($P4, __ARG_4, self)
.annotate 'line', 8718
# predefined push
    push $P1, $P7
    goto __label_7 # break
 __label_10: # case
.annotate 'line', 8721
# var name: $P8
    $P8 = __ARG_4.'get'()
.annotate 'line', 8722
    $P12 = $P8.'isidentifier'()
    isfalse $I2, $P12
    unless $I2 goto __label_12
.annotate 'line', 8723
    'Expected'("member identifier", $P8)
 __label_12: # endif
.annotate 'line', 8724
# predefined push
    push $P2, $P8
.annotate 'line', 8725
    $P4 = __ARG_4.'get'()
.annotate 'line', 8726
    $P13 = $P4.'isop'(';')
    isfalse $I3, $P13
    unless $I3 goto __label_13
.annotate 'line', 8727
    'Expected'("';' in member declaration", $P4)
 __label_13: # endif
    goto __label_7 # break
 __label_11: # case
.annotate 'line', 8730
# var cst: $P9
    $P9 = 'parseConst'($P4, __ARG_4, self)
.annotate 'line', 8731
# predefined push
    push $P3, $P9
    goto __label_7 # break
 __label_8: # default
.annotate 'line', 8734
    'SyntaxError'("Unexpected item in class", $P4)
 __label_7: # switch end
# }
 __label_4: # for iteration
.annotate 'line', 8714
    $P4 = __ARG_4.'get'()
    goto __label_6
 __label_5: # for end
# }
.annotate 'line', 8737

.end # ClassStatement


.sub 'getpath' :method
# Body
# {
.annotate 'line', 8740
    getattribute $P1, self, 'classns'
    .return($P1)
# }
.annotate 'line', 8741

.end # getpath


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 8744
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 8745

.end # generatesubid


.sub 'findsymbol' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8748
    getattribute $P1, self, 'parent'
    .tailcall $P1.'findsymbol'(__ARG_1)
# }
.annotate 'line', 8749

.end # findsymbol


.sub 'findclasskey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8752
    getattribute $P1, self, 'parent'
    .tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 8753

.end # findclasskey


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8756
    getattribute $P1, self, 'parent'
    .tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 8757

.end # checkclass


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8760
    getattribute $P1, self, 'owner'
    .tailcall $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 8761

.end # use_predef


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8764
    getattribute $P1, self, 'constants'
    'optimize_array'($P1)
.annotate 'line', 8765
    getattribute $P1, self, 'functions'
    'optimize_array'($P1)
.annotate 'line', 8766
    .return(self)
# }
.annotate 'line', 8767

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8770
# var classns: $P1
    getattribute $P1, self, 'classns'
.annotate 'line', 8771
    $P5 = 'getparrotnamespacekey'($P1)
    __ARG_1.'say'($P5)
.annotate 'line', 8772
    getattribute $P5, self, 'functions'
    iter $P6, $P5
    set $P6, 0
 __label_0: # for iteration
    unless $P6 goto __label_1
    shift $P2, $P6
.annotate 'line', 8773
    $P2.'emit'(__ARG_1)
    goto __label_0
 __label_1: # endfor
.annotate 'line', 8775
    __ARG_1.'say'('.sub Winxed_class_init :anon :load :init')
.annotate 'line', 8777
    $P5 = self.'getclasskey'()
    __ARG_1.'say'('    ', 'newclass $P0, ', $P5)
.annotate 'line', 8778
# n: $I1
    set $I1, 1
.annotate 'line', 8779
    getattribute $P5, self, 'bases'
    iter $P7, $P5
    set $P7, 0
 __label_2: # for iteration
    unless $P7 goto __label_3
    shift $P3, $P7
# {
.annotate 'line', 8780
    $P3.'annotate'(__ARG_1)
.annotate 'line', 8781
# reg: $S1
    set $I2, $I1
    inc $I1
    set $S2, $I2
    concat $S1, "$P", $S2
.annotate 'line', 8782
    __ARG_1.'print'('    ', 'get_class ', $S1, ', ')
.annotate 'line', 8783
    getattribute $P5, self, 'parent'
    $P3.'emit'(__ARG_1, $P5)
.annotate 'line', 8784
    __ARG_1.'say'()
.annotate 'line', 8785
    __ARG_1.'say'('    ', 'addparent $P0, ', $S1)
# }
    goto __label_2
 __label_3: # endfor
.annotate 'line', 8787
    getattribute $P5, self, 'members'
    iter $P8, $P5
    set $P8, 0
 __label_4: # for iteration
    unless $P8 goto __label_5
    shift $P4, $P8
# {
.annotate 'line', 8788
    __ARG_1.'annotate'($P4)
.annotate 'line', 8789
    __ARG_1.'say'('    ', "addattribute $P0, '", $P4, "'")
# }
    goto __label_4
 __label_5: # endfor
.annotate 'line', 8792
    __ARG_1.'say'('.end')
# }
.annotate 'line', 8793

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassStatement' ]
.annotate 'line', 8683
    get_class $P1, [ 'ClassBase' ]
    addparent $P0, $P1
    get_class $P2, [ 'VarContainer' ]
    addparent $P0, $P2
.annotate 'line', 8685
    addattribute $P0, 'parent'
.annotate 'line', 8686
    addattribute $P0, 'bases'
.annotate 'line', 8687
    addattribute $P0, 'constants'
.annotate 'line', 8688
    addattribute $P0, 'functions'
.annotate 'line', 8689
    addattribute $P0, 'members'
.end
.namespace [ 'DeclareClassStatement' ]

.sub 'DeclareClassStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8800
    self.'ClassBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 8801
    setattribute self, 'name', __ARG_2
# }
.annotate 'line', 8802

.end # DeclareClassStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8805
    .return(self)
# }
.annotate 'line', 8806

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'DeclareClassStatement' ]
.annotate 'line', 8796
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
.annotate 'line', 8814
# var name: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8815
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 8816
    $I1 = $P2.'isop'(';')
    if $I1 goto __label_2
    $I1 = $P2.'isop'('.')
 __label_2:
    unless $I1 goto __label_0
# {
# for loop
 __label_5: # for condition
.annotate 'line', 8817
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_4
    unless $P3 goto __label_4
# {
.annotate 'line', 8818
# predefined string
    set $S1, $P1
    __ARG_3 = __ARG_3.'declarenamespace'($P1, $S1)
.annotate 'line', 8819
    $P1 = __ARG_2.'get'()
# }
 __label_3: # for iteration
.annotate 'line', 8817
    $P2 = __ARG_2.'get'()
    goto __label_5
 __label_4: # for end
.annotate 'line', 8821
    'RequireOp'(';', $P2)
.annotate 'line', 8822
    new $P4, [ 'DeclareClassStatement' ]
    $P4.'DeclareClassStatement'(__ARG_1, $P1, __ARG_3)
    set $P3, $P4
    __ARG_3.'declareclass'($P3)
# }
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 8825
    __ARG_2.'unget'($P2)
.annotate 'line', 8826
    new $P4, [ 'ClassStatement' ]
    $P4.'ClassStatement'(__ARG_1, $P1, __ARG_3, __ARG_2)
    set $P3, $P4
    __ARG_3.'addclass'($P3)
# }
 __label_1: # endif
# }
.annotate 'line', 8828

.end # parseClass


.sub 'include_parrot'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8836
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8837
    $P6 = $P1.'isstring'()
    isfalse $I4, $P6
    unless $I4 goto __label_0
.annotate 'line', 8838
    'Expected'('literal string', $P1)
 __label_0: # endif
.annotate 'line', 8839
    'ExpectOp'(';', __ARG_2)
.annotate 'line', 8840
# filename: $S1
    $P6 = $P1.'rawstring'()
    null $S1
    if_null $P6, __label_1
    set $S1, $P6
 __label_1:
.annotate 'line', 8841
# var interp: $P2
# predefined getinterp
    getinterp $P2
# Constant IGLOBALS_LIB_PATHS evaluated at compile time
# Constant PARROT_LIB_PATH_INCLUDE evaluated at compile time
.annotate 'line', 8846
# var libpaths: $P3
    $P3 = $P2[9]
.annotate 'line', 8847
# var paths: $P4
    $P4 = $P3[0]
.annotate 'line', 8848
# var file: $P5
    new $P5, [ 'FileHandle' ]
.annotate 'line', 8849
    iter $P7, $P4
    set $P7, 0
 __label_2: # for iteration
    unless $P7 goto __label_3
    shift $S2, $P7
# {
.annotate 'line', 8850
# filepath: $S3
    concat $S3, $S2, $S1
.annotate 'line', 8851
# try: create handler
    new $P6, 'ExceptionHandler'
    set_label $P6, __label_4
    push_eh $P6
# try: begin
# {
.annotate 'line', 8852
    $P5.'open'($S3, 'r')
    goto __label_3 # break
.annotate 'line', 8853
# }
# try: end
    pop_eh
    goto __label_5
.annotate 'line', 8851
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
.annotate 'line', 8858
    $P6 = $P5.'is_closed'()
    if_null $P6, __label_6
    unless $P6 goto __label_6
.annotate 'line', 8859
    'SyntaxError'('File not found', $P1)
 __label_6: # endif
# Constant MACRO_CONST evaluated at compile time
# for loop
.annotate 'line', 8864
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
.annotate 'line', 8865
# predefined substr
    substr $S8, $S4, 0, 12
    ne $S8, '.macro_const', __label_11
# {
.annotate 'line', 8866
# pos: $I1
    set $I1, 12
.annotate 'line', 8867
# c: $S5
    null $S5
 __label_13: # while
.annotate 'line', 8868
# predefined substr
    substr $S5, $S4, $I1, 1
    iseq $I4, $S5, " "
    if $I4 goto __label_14
    iseq $I4, $S5, "\t"
 __label_14:
    unless $I4 goto __label_12
.annotate 'line', 8869
    inc $I1
    goto __label_13
 __label_12: # endwhile
.annotate 'line', 8870
# pos2: $I2
    set $I2, $I1
 __label_16: # while
.annotate 'line', 8871
# predefined substr
    substr $S5, $S4, $I2, 1
    isne $I4, $S5, " "
    unless $I4 goto __label_20
    isne $I4, $S5, "\t"
 __label_20:
    unless $I4 goto __label_19
.annotate 'line', 8872
    isne $I4, $S5, "\n"
 __label_19:
    unless $I4 goto __label_18
    isne $I4, $S5, "\r"
 __label_18:
    unless $I4 goto __label_17
    isne $I4, $S5, ""
 __label_17:
    unless $I4 goto __label_15
.annotate 'line', 8873
    inc $I2
    goto __label_16
 __label_15: # endwhile
.annotate 'line', 8874
    ne $I2, $I1, __label_21
    goto __label_7 # continue
 __label_21: # endif
.annotate 'line', 8876
# name: $S6
    sub $I4, $I2, $I1
# predefined substr
    substr $S6, $S4, $I1, $I4
 __label_23: # while
.annotate 'line', 8877
# predefined substr
    substr $S5, $S4, $I2, 1
    iseq $I4, $S5, " "
    if $I4 goto __label_24
    iseq $I4, $S5, "\t"
 __label_24:
    unless $I4 goto __label_22
.annotate 'line', 8878
    inc $I2
    goto __label_23
 __label_22: # endwhile
.annotate 'line', 8879
    set $I1, $I2
 __label_26: # while
.annotate 'line', 8880
# predefined substr
    substr $S5, $S4, $I2, 1
    isne $I4, $S5, " "
    unless $I4 goto __label_30
    isne $I4, $S5, "\t"
 __label_30:
    unless $I4 goto __label_29
.annotate 'line', 8881
    isne $I4, $S5, "\n"
 __label_29:
    unless $I4 goto __label_28
    isne $I4, $S5, "\r"
 __label_28:
    unless $I4 goto __label_27
    isne $I4, $S5, ""
 __label_27:
    unless $I4 goto __label_25
.annotate 'line', 8882
    inc $I2
    goto __label_26
 __label_25: # endwhile
.annotate 'line', 8883
    ne $I2, $I1, __label_31
    goto __label_7 # continue
 __label_31: # endif
.annotate 'line', 8885
# value: $S7
    sub $I4, $I2, $I1
# predefined substr
    substr $S7, $S4, $I1, $I4
.annotate 'line', 8887
# ivalue: $I3
    null $I3
.annotate 'line', 8888
# predefined substr
    substr $S8, $S7, 0, 2
    iseq $I4, $S8, '0x'
    if $I4 goto __label_34
# predefined substr
    substr $S9, $S7, 0, 2
    iseq $I4, $S9, '0X'
 __label_34:
    unless $I4 goto __label_32
.annotate 'line', 8889
# predefined substr
    substr $S10, $S7, 2
    box $P8, $S10
    $P6 = $P8.'to_int'(16)
    set $I3, $P6
    goto __label_33
 __label_32: # else
.annotate 'line', 8891
    set $I3, $S7
 __label_33: # endif
.annotate 'line', 8894
    new $P9, [ 'TokenInteger' ]
    getattribute $P10, __ARG_1, 'file'
    getattribute $P11, __ARG_1, 'line'
    $P9.'TokenInteger'($P10, $P11, $S6)
    set $P8, $P9
.annotate 'line', 8893
    $P6 = 'integerValue'(__ARG_3, $P8, $I3)
.annotate 'line', 8892
    __ARG_3.'createconst'($S6, 'I', $P6, '', 4)
# }
 __label_11: # endif
# }
 __label_7: # for iteration
.annotate 'line', 8864
    $P6 = $P5.'readline'()
    set $S4, $P6
    goto __label_9
 __label_8: # for end
.annotate 'line', 8899
    $P5.'close'()
# }
.annotate 'line', 8900

.end # include_parrot

.namespace [ 'NamespaceBase' ]

.sub 'NamespaceBase' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8915
    setattribute self, 'nspath', __ARG_1
.annotate 'line', 8916
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'namespaces', $P2
.annotate 'line', 8917
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'classes', $P2
.annotate 'line', 8918
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'functions', $P2
.annotate 'line', 8919
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'items', $P2
# }
.annotate 'line', 8920

.end # NamespaceBase


.sub 'getpath' :method
# Body
# {
.annotate 'line', 8923
    getattribute $P1, self, 'nspath'
    .return($P1)
# }
.annotate 'line', 8924

.end # getpath


.sub 'checkclass_base' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8927
# var classes: $P1
    getattribute $P1, self, 'classes'
.annotate 'line', 8928
    iter $P3, $P1
    set $P3, 0
 __label_0: # for iteration
    unless $P3 goto __label_1
    shift $P2, $P3
.annotate 'line', 8929
    getattribute $P4, $P2, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_2
.annotate 'line', 8930
    .return($P2)
 __label_2: # endif
    goto __label_0
 __label_1: # endfor
    null $P4
.annotate 'line', 8931
    .return($P4)
# }
.annotate 'line', 8932

.end # checkclass_base


.sub 'findclasskey_base' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8937
# predefined elements
    elements $I1, __ARG_1
    null $I2
    if $I1 == $I2 goto __label_2
    set $I2, 1
    if $I1 == $I2 goto __label_3
    goto __label_1
# switch
 __label_2: # case
    null $P5
.annotate 'line', 8939
    .return($P5)
 __label_3: # case
.annotate 'line', 8942
    $P6 = __ARG_1[0]
    .tailcall self.'checkclass_base'($P6)
 __label_1: # default
.annotate 'line', 8947
# var namespaces: $P1
    getattribute $P1, self, 'namespaces'
.annotate 'line', 8948
# var childkey: $P2
# predefined clone
    clone $P2, __ARG_1
.annotate 'line', 8949
# basename: $S1
    $P7 = $P2.'shift'()
    null $S1
    if_null $P7, __label_4
    set $S1, $P7
 __label_4:
.annotate 'line', 8950
    iter $P8, $P1
    set $P8, 0
 __label_5: # for iteration
    unless $P8 goto __label_6
    shift $P3, $P8
# {
.annotate 'line', 8951
    getattribute $P9, $P3, 'name'
    set $S2, $P9
    ne $S2, $S1, __label_7
# {
.annotate 'line', 8952
# var found: $P4
    $P4 = $P3.'findclasskey'($P2)
.annotate 'line', 8953
    if_null $P4, __label_8
.annotate 'line', 8954
    .return($P4)
 __label_8: # endif
# }
 __label_7: # endif
# }
    goto __label_5
 __label_6: # endfor
 __label_0: # switch end
    null $P5
.annotate 'line', 8958
    .return($P5)
# }
.annotate 'line', 8959

.end # findclasskey_base


.sub 'findsymbol' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8964
# predefined elements
    elements $I1, __ARG_1
    null $I2
    if $I1 == $I2 goto __label_2
    set $I2, 1
    if $I1 == $I2 goto __label_3
    goto __label_1
# switch
 __label_2: # case
    null $P7
.annotate 'line', 8966
    .return($P7)
 __label_3: # case
.annotate 'line', 8968
# name: $S1
    $S1 = __ARG_1[0]
.annotate 'line', 8970
# var sym: $P1
    $P1 = self.'checkclass_base'($S1)
.annotate 'line', 8971
    if_null $P1, __label_4
.annotate 'line', 8972
    .return($P1)
 __label_4: # endif
.annotate 'line', 8973
    getattribute $P8, self, 'functions'
    iter $P9, $P8
    set $P9, 0
 __label_5: # for iteration
    unless $P9 goto __label_6
    shift $P2, $P9
.annotate 'line', 8974
    getattribute $P10, $P2, 'name'
    set $S3, $P10
    ne $S3, $S1, __label_7
.annotate 'line', 8975
    .return($P2)
 __label_7: # endif
    goto __label_5
 __label_6: # endfor
    null $P11
.annotate 'line', 8976
    .return($P11)
 __label_1: # default
.annotate 'line', 8981
# var namespaces: $P3
    getattribute $P3, self, 'namespaces'
.annotate 'line', 8982
# var childkey: $P4
# predefined clone
    clone $P4, __ARG_1
.annotate 'line', 8983
# basename: $S2
    $P12 = $P4.'shift'()
    null $S2
    if_null $P12, __label_8
    set $S2, $P12
 __label_8:
.annotate 'line', 8984
    iter $P13, $P3
    set $P13, 0
 __label_9: # for iteration
    unless $P13 goto __label_10
    shift $P5, $P13
# {
.annotate 'line', 8985
    getattribute $P14, $P5, 'name'
    set $S4, $P14
    ne $S4, $S2, __label_11
# {
.annotate 'line', 8986
# var found: $P6
    $P6 = $P5.'findsymbol'($P4)
.annotate 'line', 8987
    if_null $P6, __label_12
.annotate 'line', 8988
    .return($P6)
 __label_12: # endif
# }
 __label_11: # endif
# }
    goto __label_9
 __label_10: # endfor
 __label_0: # switch end
    null $P7
.annotate 'line', 8992
    .return($P7)
# }
.annotate 'line', 8993

.end # findsymbol


.sub 'declarenamespace' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 8996
# var mnull: $P1
    null $P1
.annotate 'line', 8997
# var child: $P2
    new $P2, [ 'NamespaceStatement' ]
    $P2.'NamespaceStatement'(self, __ARG_1, __ARG_2, $P1)
.annotate 'line', 8998
    getattribute $P3, self, 'namespaces'
# predefined push
    push $P3, $P2
.annotate 'line', 8999
    .return($P2)
# }
.annotate 'line', 9000

.end # declarenamespace


.sub 'childnamespace' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9003
# var child: $P1
    new $P1, [ 'NamespaceStatement' ]
    $P1.'NamespaceStatement'(self, __ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 9004
    getattribute $P2, self, 'namespaces'
# predefined push
    push $P2, $P1
.annotate 'line', 9005
    getattribute $P2, self, 'items'
# predefined push
    push $P2, $P1
.annotate 'line', 9006
    .return($P1)
# }
.annotate 'line', 9007

.end # childnamespace


.sub 'declareclass' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9010
    getattribute $P1, self, 'classes'
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 9011

.end # declareclass


.sub 'addclass' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9014
    getattribute $P1, self, 'classes'
# predefined push
    push $P1, __ARG_1
.annotate 'line', 9015
    getattribute $P1, self, 'items'
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 9016

.end # addclass


.sub 'parsenamespace' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9019
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9020
# name: $S1
    set $P4, $P1
    null $S1
    if_null $P4, __label_0
    set $S1, $P4
 __label_0:
.annotate 'line', 9021
    $P1 = __ARG_2.'get'()
.annotate 'line', 9023
# var modifier: $P2
    null $P2
.annotate 'line', 9024
    $P4 = $P1.'isop'('[')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 9025
    new $P5, [ 'ModifierList' ]
    $P5.'ModifierList'(__ARG_2, self)
    set $P2, $P5
.annotate 'line', 9026
    $P1 = __ARG_2.'get'()
# }
 __label_1: # endif
.annotate 'line', 9029
    'RequireOp'('{', $P1)
.annotate 'line', 9030
# var child: $P3
    $P3 = self.'childnamespace'(__ARG_1, $S1, $P2)
.annotate 'line', 9031
    $P3.'parse'(__ARG_2)
# }
.annotate 'line', 9032

.end # parsenamespace


.sub 'parse' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9035
# var items: $P1
    getattribute $P1, self, 'items'
.annotate 'line', 9036
# var functions: $P2
    getattribute $P2, self, 'functions'
.annotate 'line', 9037
# var classes: $P3
    getattribute $P3, self, 'classes'
.annotate 'line', 9038
# var t: $P4
    null $P4
# for loop
.annotate 'line', 9039
    $P4 = __ARG_1.'get'()
 __label_2: # for condition
    set $I1, $P4
    unless $I1 goto __label_3
    $P7 = $P4.'isop'('}')
    isfalse $I1, $P7
 __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 9041
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
# switch
 __label_6: # case
.annotate 'line', 9043
    self.'parsenamespace'($P4, __ARG_1)
    goto __label_4 # break
 __label_7: # case
.annotate 'line', 9046
# var cst: $P5
    $P5 = 'parseConst'($P4, __ARG_1, self)
.annotate 'line', 9047
# predefined push
    push $P1, $P5
    goto __label_4 # break
 __label_8: # case
.annotate 'line', 9050
# var f: $P6
    new $P6, [ 'FunctionStatement' ]
    $P6.'FunctionStatement'($P4, __ARG_1, self)
.annotate 'line', 9051
# predefined push
    push $P2, $P6
.annotate 'line', 9052
# predefined push
    push $P1, $P6
    goto __label_4 # break
 __label_9: # case
.annotate 'line', 9055
    'parseClass'($P4, __ARG_1, self)
    goto __label_4 # break
 __label_10: # case
.annotate 'line', 9058
    $P4 = __ARG_1.'get'()
.annotate 'line', 9059
    $P9 = $P4.'iskeyword'('extern')
    isfalse $I2, $P9
    unless $I2 goto __label_14
.annotate 'line', 9060
    'SyntaxError'('Unsupported at namespace level', $P4)
 __label_14: # endif
.annotate 'line', 9061
    $P4 = __ARG_1.'get'()
.annotate 'line', 9062
    $P10 = $P4.'isstring'()
    isfalse $I3, $P10
    unless $I3 goto __label_15
.annotate 'line', 9063
    'Expected'('string literal', $P4)
 __label_15: # endif
.annotate 'line', 9064
# reqlib: $S1
    set $P11, $P4
    null $S1
    if_null $P11, __label_16
    set $S1, $P11
 __label_16:
.annotate 'line', 9065
    self.'addlib'($S1)
.annotate 'line', 9066
    'ExpectOp'(';', __ARG_1)
    goto __label_4 # break
 __label_11: # case
.annotate 'line', 9069
    'include_parrot'($P4, __ARG_1, self)
    goto __label_4 # break
 __label_12: # case
.annotate 'line', 9072
    $P4 = __ARG_1.'get'()
.annotate 'line', 9073
    $P12 = $P4.'isstring'()
    isfalse $I4, $P12
    unless $I4 goto __label_17
.annotate 'line', 9074
    'Expected'('string literal', $P4)
 __label_17: # endif
.annotate 'line', 9075
    'ExpectOp'(';', __ARG_1)
.annotate 'line', 9076
    new $P15, [ 'StringLiteral' ]
    $P15.'StringLiteral'(self, $P4)
    set $P14, $P15
    $P13 = $P14.'getPirString'()
    self.'addload'($P13)
    goto __label_4 # break
 __label_13: # case
.annotate 'line', 9079
    $P4 = __ARG_1.'get'()
.annotate 'line', 9080
    $P16 = $P4.'isstring'()
    isfalse $I5, $P16
    unless $I5 goto __label_18
.annotate 'line', 9081
    'Expected'('string literal', $P4)
 __label_18: # endif
.annotate 'line', 9082
    'ExpectOp'(';', __ARG_1)
.annotate 'line', 9083
    new $P19, [ 'StringLiteral' ]
    $P19.'StringLiteral'(self, $P4)
    set $P18, $P19
    $P17 = $P18.'getPirString'()
    self.'addlib'($P17)
    goto __label_4 # break
 __label_5: # default
.annotate 'line', 9086
    'SyntaxError'("Unexpected token", $P4)
 __label_4: # switch end
# }
 __label_0: # for iteration
.annotate 'line', 9039
    $P4 = __ARG_1.'get'()
    goto __label_2
 __label_1: # for end
.annotate 'line', 9089
    if_null $P4, __label_19
    unless $P4 goto __label_19
.annotate 'line', 9090
    self.'close_ns'($P4)
    goto __label_20
 __label_19: # else
.annotate 'line', 9092
    self.'unclosed_ns'()
 __label_20: # endif
# }
.annotate 'line', 9093

.end # parse


.sub 'optimize_base' :method
# Body
# {
.annotate 'line', 9096
    getattribute $P1, self, 'items'
    'optimize_array'($P1)
# }
.annotate 'line', 9097

.end # optimize_base


.sub 'emit_base' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9100
# var path: $P1
    $P1 = self.'getpath'()
.annotate 'line', 9101
# s: $S1
    $P3 = 'getparrotnamespacekey'($P1)
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 9103
# activate: $I1
    set $I1, 1
.annotate 'line', 9104
    getattribute $P3, self, 'items'
    iter $P4, $P3
    set $P4, 0
 __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
# {
.annotate 'line', 9105
    isa $I2, $P2, [ 'NamespaceStatement' ]
    if $I2 goto __label_5
.annotate 'line', 9106
    isa $I2, $P2, [ 'ClassStatement' ]
 __label_5:
    unless $I2 goto __label_3
.annotate 'line', 9107
    set $I1, 1
    goto __label_4
 __label_3: # else
.annotate 'line', 9109
    unless $I1 goto __label_6
# {
.annotate 'line', 9110
    __ARG_1.'say'($S1)
.annotate 'line', 9111
    null $I1
# }
 __label_6: # endif
 __label_4: # endif
.annotate 'line', 9113
    $P2.'emit'(__ARG_1)
# }
    goto __label_1
 __label_2: # endfor
# }
.annotate 'line', 9115

.end # emit_base

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NamespaceBase' ]
.annotate 'line', 8904
    get_class $P1, [ 'VarContainer' ]
    addparent $P0, $P1
.annotate 'line', 8906
    addattribute $P0, 'nspath'
.annotate 'line', 8907
    addattribute $P0, 'namespaces'
.annotate 'line', 8908
    addattribute $P0, 'classes'
.annotate 'line', 8909
    addattribute $P0, 'functions'
.annotate 'line', 8910
    addattribute $P0, 'items'
.annotate 'line', 8911
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
.annotate 'line', 9133
# var nspath: $P1
    $P2 = __ARG_1.'getpath'()
# predefined clone
    clone $P1, $P2
.annotate 'line', 9134
# predefined push
    push $P1, __ARG_3
.annotate 'line', 9135
    self.'NamespaceBase'($P1)
.annotate 'line', 9137
    setattribute self, 'parent', __ARG_1
.annotate 'line', 9138
    setattribute self, 'start', __ARG_2
.annotate 'line', 9139
    setattribute self, 'owner', __ARG_1
.annotate 'line', 9140
    box $P2, __ARG_3
    setattribute self, 'name', $P2
.annotate 'line', 9141
    setattribute self, 'modifier', __ARG_4
.annotate 'line', 9142
    if_null __ARG_4, __label_0
# {
.annotate 'line', 9143
    $P2 = __ARG_4.'pick'('HLL')
    if_null $P2, __label_1
.annotate 'line', 9144
    getattribute $P4, self, 'name'
    setattribute self, 'hll', $P4
 __label_1: # endif
# }
 __label_0: # endif
# }
.annotate 'line', 9146

.end # NamespaceStatement


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 9149
    getattribute $P1, self, 'parent'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 9150

.end # dowarnings


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 9153
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 9154

.end # generatesubid


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9157
    getattribute $P1, self, 'owner'
    $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 9158

.end # use_predef


.sub 'addlib' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9161
    getattribute $P1, self, 'parent'
    $P1.'addlib'(__ARG_1)
# }
.annotate 'line', 9162

.end # addlib


.sub 'addlib' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9165
    getattribute $P1, self, 'parent'
    $P1.'addload'(__ARG_1)
# }
.annotate 'line', 9166

.end # addlib


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9169
# var cl: $P1
    $P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 9170
    unless_null $P1, __label_0
.annotate 'line', 9171
    getattribute $P2, self, 'parent'
    .tailcall $P2.'checkclass'(__ARG_1)
    goto __label_1
 __label_0: # else
.annotate 'line', 9173
    .return($P1)
 __label_1: # endif
# }
.annotate 'line', 9174

.end # checkclass


.sub 'findclasskey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9179
# var cl: $P1
    $P1 = self.'findclasskey_base'(__ARG_1)
.annotate 'line', 9180
    unless_null $P1, __label_0
.annotate 'line', 9181
    getattribute $P2, self, 'parent'
    $P1 = $P2.'findclasskey'(__ARG_1)
 __label_0: # endif
.annotate 'line', 9182
    .return($P1)
# }
.annotate 'line', 9183

.end # findclasskey


.sub 'unclosed_ns' :method
# Body
# {
.annotate 'line', 9186
    getattribute $P1, self, 'start'
    'SyntaxError'('unclosed namespace', $P1)
# }
.annotate 'line', 9187

.end # unclosed_ns


.sub 'close_ns' :method
        .param pmc __ARG_1
# Empty body

.end # close_ns


.sub 'optimize' :method
# Body
# {
.annotate 'line', 9194
# var modifier: $P1
    getattribute $P1, self, 'modifier'
.annotate 'line', 9195
    if_null $P1, __label_0
# {
.annotate 'line', 9196
    $P1 = $P1.'optimize'()
.annotate 'line', 9197
    setattribute self, 'modifier', $P1
# }
 __label_0: # endif
.annotate 'line', 9199
    self.'optimize_base'()
.annotate 'line', 9200
    .return(self)
# }
.annotate 'line', 9201

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9204
# var hll: $P1
    getattribute $P1, self, 'hll'
.annotate 'line', 9205
    if_null $P1, __label_0
.annotate 'line', 9206
    __ARG_1.'say'(".HLL '", $P1, "'")
 __label_0: # endif
.annotate 'line', 9208
    self.'emit_base'(__ARG_1)
.annotate 'line', 9210
    if_null $P1, __label_1
.annotate 'line', 9211
    __ARG_1.'say'(".HLL 'parrot'")
 __label_1: # endif
# }
.annotate 'line', 9212

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NamespaceStatement' ]
.annotate 'line', 9122
    get_class $P1, [ 'NamespaceBase' ]
    addparent $P0, $P1
.annotate 'line', 9124
    addattribute $P0, 'parent'
.annotate 'line', 9125
    addattribute $P0, 'start'
.annotate 'line', 9126
    addattribute $P0, 'name'
.annotate 'line', 9127
    addattribute $P0, 'modifier'
.annotate 'line', 9128
    addattribute $P0, 'hll'
.end
.namespace [ 'RootNamespace' ]

.sub 'RootNamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9229
    new $P1, ['ResizableStringArray']
.annotate 'line', 9230
    self.'NamespaceBase'($P1)
.annotate 'line', 9231
    setattribute self, 'unit', __ARG_1
.annotate 'line', 9232
    root_new $P3, ['parrot';'Hash']
    setattribute self, 'predefs_used', $P3
.annotate 'line', 9233
    box $P2, 0
    setattribute self, 'subidgen', $P2
# }
.annotate 'line', 9234

.end # RootNamespace


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9237
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 9238
    $P1[__ARG_1] = 1
# }
.annotate 'line', 9239

.end # use_predef


.sub 'predef_is_used' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9242
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 9243
    $P2 = $P1[__ARG_1]
    unless_null $P2, __label_1
    null $I1
    goto __label_0
 __label_1:
    set $I1, 1
 __label_0:
    .return($I1)
# }
.annotate 'line', 9244

.end # predef_is_used


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 9248
# var subidgen: $P1
    getattribute $P1, self, 'subidgen'
.annotate 'line', 9249
# idgen: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 9250
    inc $I1
.annotate 'line', 9251
    assign $P1, $I1
.annotate 'line', 9252
# id: $S1
# predefined string
    set $S2, $I1
    concat $S1, 'WSubId_', $S2
.annotate 'line', 9253
    .return($S1)
# }
.annotate 'line', 9254

.end # generatesubid


.sub 'addlib' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9258
# var libs: $P1
    getattribute $P1, self, 'libs'
.annotate 'line', 9259
    unless_null $P1, __label_0
# {
.annotate 'line', 9260
    root_new $P1, ['parrot';'Hash']
.annotate 'line', 9261
    setattribute self, 'libs', $P1
# }
 __label_0: # endif
.annotate 'line', 9263
    $P1[__ARG_1] = 1
# }
.annotate 'line', 9264

.end # addlib


.sub 'addload' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9267
# var loads: $P1
    getattribute $P1, self, 'loads'
.annotate 'line', 9268
    unless_null $P1, __label_0
# {
.annotate 'line', 9269
    root_new $P1, ['parrot';'Hash']
.annotate 'line', 9270
    setattribute self, 'loads', $P1
# }
 __label_0: # endif
.annotate 'line', 9272
    $P1[__ARG_1] = 1
# }
.annotate 'line', 9273

.end # addload


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9276
    .tailcall self.'checkclass_base'(__ARG_1)
# }
.annotate 'line', 9277

.end # checkclass


.sub 'findclasskey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9281
    .tailcall self.'findclasskey_base'(__ARG_1)
# }
.annotate 'line', 9282

.end # findclasskey


.sub 'unclosed_ns' :method
# Empty body

.end # unclosed_ns


.sub 'close_ns' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9289
    'SyntaxError'('Cannot close root namespace', __ARG_1)
# }
.annotate 'line', 9290

.end # close_ns


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 9293
    getattribute $P1, self, 'unit'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 9294

.end # dowarnings


.sub 'optimize' :method
# Body
# {
.annotate 'line', 9297
    self.'optimize_base'()
.annotate 'line', 9298
    .return(self)
# }
.annotate 'line', 9299

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9302
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 9305
    $P5 = $P1['chomp']
    if_null $P5, __label_0
.annotate 'line', 9306
    self.'addload'('"String/Utils.pbc"')
 __label_0: # endif
.annotate 'line', 9309
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
.annotate 'line', 9312
    iter $P6, $P2
    set $P6, 0
 __label_1: # for iteration
    unless $P6 goto __label_2
    shift $S1, $P6
.annotate 'line', 9313
    $P5 = $P1[$S1]
    if_null $P5, __label_3
# {
.annotate 'line', 9314
    self.'addlib'("'trans_ops'")
    goto __label_2 # break
.annotate 'line', 9315
# }
 __label_3: # endif
    goto __label_1
 __label_2: # endfor
.annotate 'line', 9318
# somelib: $I1
    null $I1
.annotate 'line', 9319
# var libs: $P3
    getattribute $P3, self, 'libs'
.annotate 'line', 9320
    if_null $P3, __label_4
# {
.annotate 'line', 9321
    set $I1, 1
.annotate 'line', 9322
    iter $P7, $P3
    set $P7, 0
 __label_5: # for iteration
    unless $P7 goto __label_6
    shift $S2, $P7
.annotate 'line', 9323
    __ARG_1.'say'('.loadlib ', $S2)
    goto __label_5
 __label_6: # endfor
# }
 __label_4: # endif
.annotate 'line', 9326
# someload: $I2
    null $I2
.annotate 'line', 9327
# var loads: $P4
    getattribute $P4, self, 'loads'
.annotate 'line', 9328
    if_null $P4, __label_7
# {
.annotate 'line', 9329
    set $I2, 1
.annotate 'line', 9330
    __ARG_1.'print'("\n.sub initial_load_bytecode :anon :load :init\n")
.annotate 'line', 9331
    iter $P8, $P4
    set $P8, 0
 __label_8: # for iteration
    unless $P8 goto __label_9
    shift $S3, $P8
.annotate 'line', 9332
    __ARG_1.'say'('    load_bytecode ', $S3)
    goto __label_8
 __label_9: # endfor
.annotate 'line', 9333
    __ARG_1.'print'(".end\n\n")
# }
 __label_7: # endif
.annotate 'line', 9335
    or $I3, $I1, $I2
    unless $I3 goto __label_10
.annotate 'line', 9336
    __ARG_1.'comment'('end libs')
 __label_10: # endif
.annotate 'line', 9338
    self.'emit_base'(__ARG_1)
# }
.annotate 'line', 9339

.end # emit


.sub 'emitinclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9342
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 9343
    iter $P4, $P1
    set $P4, 0
 __label_0: # for iteration
    unless $P4 goto __label_1
    shift $S1, $P4
# {
.annotate 'line', 9344
# var data: $P2
    $P2 = $P1[$S1]
.annotate 'line', 9345
    isa $I2, $P2, [ 'VarData' ]
    not $I1, $I2
    if $I1 goto __label_4
.annotate 'line', 9346
    $P5 = $P2.'gettype'()
    set $S2, $P5
    isne $I1, $S2, 'I'
 __label_4:
    if $I1 goto __label_3
.annotate 'line', 9347
    $I3 = $P2.'getflags'()
    band $I1, $I3, 4
 __label_3:
    unless $I1 goto __label_2
    goto __label_0 # continue
 __label_2: # endif
.annotate 'line', 9349
# var value: $P3
    $P3 = $P2.'getvalue'()
.annotate 'line', 9350
    $P5 = $P3.'getIntegerValue'()
    __ARG_1.'say'('.macro_const ', $S1, ' ', $P5)
# }
    goto __label_0
 __label_1: # endfor
# }
.annotate 'line', 9352

.end # emitinclude

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'RootNamespace' ]
.annotate 'line', 9219
    get_class $P1, [ 'NamespaceBase' ]
    addparent $P0, $P1
.annotate 'line', 9221
    addattribute $P0, 'unit'
.annotate 'line', 9222
    addattribute $P0, 'predefs_used'
.annotate 'line', 9223
    addattribute $P0, 'libs'
.annotate 'line', 9224
    addattribute $P0, 'loads'
.annotate 'line', 9225
    addattribute $P0, 'subidgen'
.end
.namespace [ ]
# Constant EVAL_NAME evaluated at compile time
.namespace [ 'WinxedCompileUnit' ]

.sub 'init' :method :vtable
# Body
# {
.annotate 'line', 9368
    box $P3, 1
    setattribute self, 'warnings', $P3
.annotate 'line', 9369
# var rootns: $P1
    new $P1, [ 'RootNamespace' ]
    $P1.'RootNamespace'(self)
.annotate 'line', 9372
# var taux: $P2
    new $P2, [ 'TokenIdentifier' ]
    $P2.'TokenIdentifier'('__predefconst__', 0, 'predefconst')
.annotate 'line', 9376
    new $P5, [ 'TokenInteger' ]
    getattribute $P6, $P2, 'file'
    getattribute $P7, $P2, 'line'
    $P5.'TokenInteger'($P6, $P7, 'false')
    set $P4, $P5
.annotate 'line', 9375
    $P3 = 'integerValue'($P1, $P4, 0)
.annotate 'line', 9374
    $P1.'createconst'('false', 'I', $P3, '', 4)
.annotate 'line', 9380
    new $P5, [ 'TokenInteger' ]
    getattribute $P6, $P2, 'file'
    getattribute $P7, $P2, 'line'
    $P5.'TokenInteger'($P6, $P7, 'false')
    set $P4, $P5
.annotate 'line', 9379
    $P3 = 'integerValue'($P1, $P4, 1)
.annotate 'line', 9378
    $P1.'createconst'('true', 'I', $P3, '', 4)
.annotate 'line', 9386
    new $P4, [ 'StringLiteral' ]
.annotate 'line', 9387
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
.annotate 'line', 9385
    $P1.'createconst'('__STAGE__', 'S', $P3, '', 4)
.annotate 'line', 9390
    setattribute self, 'rootns', $P1
# }
.annotate 'line', 9391

.end # init


.sub 'setwarnmode' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 9394
    getattribute $P1, self, 'warnings'
    assign $P1, __ARG_1
# }
.annotate 'line', 9395

.end # setwarnmode


.sub 'dowarnings' :method
# Body
# {
# predefined int
.annotate 'line', 9398
    getattribute $P1, self, 'warnings'
    set $I1, $P1
    .return($I1)
# }
.annotate 'line', 9399

.end # dowarnings


.sub 'parse' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9402
    getattribute $P1, self, 'rootns'
    $P1.'parse'(__ARG_1)
# }
.annotate 'line', 9403

.end # parse


.sub 'optimize' :method
# Body
# {
.annotate 'line', 9406
    getattribute $P3, self, 'rootns'
    $P2 = $P3.'optimize'()
    setattribute self, 'rootns', $P2
# }
.annotate 'line', 9407

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9410
    __ARG_1.'comment'('Begin generated code')
.annotate 'line', 9411
    __ARG_1.'say'('')
.annotate 'line', 9413
    getattribute $P1, self, 'rootns'
    $P1.'emit'(__ARG_1)
.annotate 'line', 9415
    __ARG_1.'comment'('End generated code')
# }
.annotate 'line', 9416

.end # emit


.sub 'emitinclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9419
    __ARG_1.'comment'('DO NOT EDIT THIS FILE')
.annotate 'line', 9420
    __ARG_1.'comment'('Generated automatically from Winxed sources')
.annotate 'line', 9422
    getattribute $P1, self, 'rootns'
    $P1.'emitinclude'(__ARG_1)
.annotate 'line', 9424
    __ARG_1.'comment'('End')
# }
.annotate 'line', 9425

.end # emitinclude

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'WinxedCompileUnit' ]
.annotate 'line', 9363
    addattribute $P0, 'rootns'
.annotate 'line', 9364
    addattribute $P0, 'warnings'
.end
.namespace [ 'WinxedHLL' ]

.sub '__private_compile_tail' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9434
    set $S2, __ARG_2
    ne $S2, 'parse', __label_0
.annotate 'line', 9435
    .return(__ARG_1)
 __label_0: # endif
.annotate 'line', 9436
# var handleout: $P1
    new $P1, [ 'StringHandle' ]
.annotate 'line', 9437
    $P1.'open'('__eval__', 'w')
.annotate 'line', 9438
# var emit: $P2
    new $P2, [ 'Emit' ]
    $P2.'Emit'($P1)
.annotate 'line', 9439
    if_null __ARG_3, __label_1
    unless __ARG_3 goto __label_1
.annotate 'line', 9440
    $P2.'disable_annotations'()
 __label_1: # endif
.annotate 'line', 9441
    __ARG_1.'emit'($P2)
.annotate 'line', 9442
    $P2.'close'()
.annotate 'line', 9443
    $P1.'close'()
.annotate 'line', 9444
# pircode: $S1
    $P5 = $P1.'read'(0)
    null $S1
    if_null $P5, __label_2
    set $S1, $P5
 __label_2:
.annotate 'line', 9445
# var object: $P3
    null $P3
.annotate 'line', 9446
    set $S2, __ARG_2
    set $S3, 'pir'
    if $S2 == $S3 goto __label_5
    set $S3, 'pbc'
    if $S2 == $S3 goto __label_6
    set $S3, ''
    if $S2 == $S3 goto __label_7
    goto __label_4
# switch
 __label_5: # case
.annotate 'line', 9448
    new $P3, [ 'String' ]
.annotate 'line', 9449
    assign $P3, $S1
    goto __label_3 # break
 __label_6: # case
 __label_7: # case
.annotate 'line', 9453
# var pircomp: $P4
# predefined compreg
    compreg $P4, 'PIR'
.annotate 'line', 9454
    $P3 = $P4($S1)
    goto __label_3 # break
 __label_4: # default
.annotate 'line', 9455
# predefined die
.annotate 'line', 9457
    die 'Invalid target'
 __label_3: # switch end
.annotate 'line', 9459
    .return($P3)
# }
.annotate 'line', 9460

.end # __private_compile_tail


.sub '__private_geninclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9463
# var handleout: $P1
    new $P1, [ 'StringHandle' ]
.annotate 'line', 9464
    $P1.'open'('__eval__', 'w')
.annotate 'line', 9465
# var emit: $P2
    new $P2, [ 'Emit' ]
    $P2.'Emit'($P1)
.annotate 'line', 9466
    __ARG_1.'emitinclude'($P2)
.annotate 'line', 9467
    $P2.'close'()
.annotate 'line', 9468
    $P1.'close'()
.annotate 'line', 9469
    .tailcall $P1.'read'(0)
# }
.annotate 'line', 9470

.end # __private_geninclude


.sub 'compile' :method
        .param string __ARG_1
        .param string __ARG_2 :optional :named('target')
        .param int __ARG_3 :optional :named('noan')
        .param int __ARG_4 :optional :named('nowarn')
# Body
# {
.annotate 'line', 9476
    unless_null __ARG_2, __label_0
.annotate 'line', 9477
    set __ARG_2, ''
 __label_0: # endif
.annotate 'line', 9478
# var handlein: $P1
    new $P1, [ 'StringHandle' ]
.annotate 'line', 9479
    $P1.'open'('__eval__', 'w')
.annotate 'line', 9480
    $P1.'puts'(__ARG_1)
.annotate 'line', 9481
    $P1.'close'()
.annotate 'line', 9482
    $P1.'open'('__eval__', 'r')
.annotate 'line', 9483
# var tk: $P2
    new $P2, [ 'Tokenizer' ]
    $P2.'Tokenizer'($P1, '__eval__')
.annotate 'line', 9484
# var winxed: $P3
    new $P3, [ 'WinxedCompileUnit' ]
.annotate 'line', 9485
    unless __ARG_4 goto __label_1
.annotate 'line', 9486
    $P3.'setwarnmode'(0)
 __label_1: # endif
.annotate 'line', 9487
    $P3.'parse'($P2)
.annotate 'line', 9488
    $P1.'close'()
.annotate 'line', 9489
    $P3.'optimize'()
.annotate 'line', 9490
    .tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3)
# }
.annotate 'line', 9491

.end # compile


.sub 'compile_from_file_to_pir' :method
        .param string __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3 :optional :named('noan')
        .param int __ARG_4 :optional :named('nowarn')
# Body
# {
.annotate 'line', 9496
# var handlein: $P1
    new $P1, [ 'FileHandle' ]
.annotate 'line', 9497
    $P1.'open'(__ARG_1, 'r')
.annotate 'line', 9498
    $P1.'encoding'('utf8')
.annotate 'line', 9499
# var tk: $P2
    new $P2, [ 'Tokenizer' ]
    $P2.'Tokenizer'($P1, __ARG_1)
.annotate 'line', 9500
# var winxed: $P3
    new $P3, [ 'WinxedCompileUnit' ]
.annotate 'line', 9501
    unless __ARG_4 goto __label_0
.annotate 'line', 9502
    $P3.'setwarnmode'(0)
 __label_0: # endif
.annotate 'line', 9503
    $P3.'parse'($P2)
.annotate 'line', 9504
    $P1.'close'()
.annotate 'line', 9505
    $P3.'optimize'()
.annotate 'line', 9506
# var emit: $P4
    new $P4, [ 'Emit' ]
    $P4.'Emit'(__ARG_2)
.annotate 'line', 9507
    unless __ARG_3 goto __label_1
.annotate 'line', 9508
    $P4.'disable_annotations'()
 __label_1: # endif
.annotate 'line', 9509
    $P3.'emit'($P4)
.annotate 'line', 9510
    $P4.'close'()
# }
.annotate 'line', 9511

.end # compile_from_file_to_pir


.sub 'compile_from_file' :method
        .param string __ARG_1
        .param string __ARG_2 :optional :named('target')
        .param int __ARG_3 :optional :named('noan')
        .param int __ARG_4 :optional :named('nowarn')
# Body
# {
.annotate 'line', 9517
    unless_null __ARG_2, __label_0
.annotate 'line', 9518
    set __ARG_2, ''
 __label_0: # endif
.annotate 'line', 9519
# var handlein: $P1
    new $P1, [ 'FileHandle' ]
.annotate 'line', 9520
    $P1.'open'(__ARG_1, 'r')
.annotate 'line', 9521
    $P1.'encoding'('utf8')
.annotate 'line', 9522
# var tk: $P2
    new $P2, [ 'Tokenizer' ]
    $P2.'Tokenizer'($P1, __ARG_1)
.annotate 'line', 9523
# var winxed: $P3
    new $P3, [ 'WinxedCompileUnit' ]
.annotate 'line', 9524
    unless __ARG_4 goto __label_1
.annotate 'line', 9525
    $P3.'setwarnmode'(0)
 __label_1: # endif
.annotate 'line', 9526
    $P3.'parse'($P2)
.annotate 'line', 9527
    $P1.'close'()
.annotate 'line', 9528
    $P3.'optimize'()
.annotate 'line', 9529
    ne __ARG_2, 'include', __label_2
# {
.annotate 'line', 9530
    .tailcall self.'__private_geninclude'($P3)
# }
    goto __label_3
 __label_2: # else
.annotate 'line', 9533
    .tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3)
 __label_3: # endif
# }
.annotate 'line', 9534

.end # compile_from_file

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'WinxedHLL' ]
.end
.namespace [ ]

.sub 'winxed_parser'
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
        .param int __ARG_4
        .param int __ARG_5
# Body
# {
.annotate 'line', 9542
# var winxed: $P1
    new $P1, [ 'WinxedCompileUnit' ]
.annotate 'line', 9543
    not $I1, __ARG_3
    unless $I1 goto __label_0
.annotate 'line', 9544
    $P1.'setwarnmode'(0)
 __label_0: # endif
.annotate 'line', 9545
    $P1.'parse'(__ARG_1)
.annotate 'line', 9547
    $P1.'optimize'()
.annotate 'line', 9549
# var handle: $P2
    null $P2
.annotate 'line', 9550
    ne __ARG_2, '-', __label_1
.annotate 'line', 9551
# predefined getstdout
    getstdout $P2
    goto __label_2
 __label_1: # else
.annotate 'line', 9553
# predefined open
    root_new $P2, ['parrot';'FileHandle']
    $P2.'open'(__ARG_2,'w')
 __label_2: # endif
.annotate 'line', 9554
# var emit: $P3
    new $P3, [ 'Emit' ]
    $P3.'Emit'($P2)
.annotate 'line', 9555
    unless __ARG_4 goto __label_3
.annotate 'line', 9556
    $P3.'disable_annotations'()
 __label_3: # endif
.annotate 'line', 9557
    unless __ARG_5 goto __label_4
.annotate 'line', 9558
    $P1.'emitinclude'($P3)
    goto __label_5
 __label_4: # else
.annotate 'line', 9560
    $P1.'emit'($P3)
 __label_5: # endif
.annotate 'line', 9561
    $P3.'close'()
.annotate 'line', 9562
    $P2.'close'()
# }
.annotate 'line', 9563

.end # winxed_parser


.sub 'initializer' :init :load
# Body
# {
.annotate 'line', 9571
# var comp: $P1
    new $P1, [ 'WinxedHLL' ]
.annotate 'line', 9572
# predefined compreg
    compreg 'winxed', $P1
# }
.annotate 'line', 9573

.end # initializer

.namespace [ 'Options' ]

.sub 'Options' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9582
    load_bytecode 'Getopt/Obj.pbc'
.annotate 'line', 9583
# var getopts: $P1
    new $P1, [ 'Getopt'; 'Obj' ]
.annotate 'line', 9584
    $P1.'notOptStop'(1)
.annotate 'line', 9585
    $P1.'push_string'('o=s')
.annotate 'line', 9586
    $P1.'push_string'('e=s')
.annotate 'line', 9587
    $P1.'push_string'('geninclude')
.annotate 'line', 9588
    $P1.'push_string'('noan')
.annotate 'line', 9589
    $P1.'push_string'('nowarn')
.annotate 'line', 9590
    $P1.'notOptStop'(1)
.annotate 'line', 9591
    __ARG_1.'shift'()
.annotate 'line', 9592
# var opts: $P2
    $P2 = $P1.'get_options'(__ARG_1)
.annotate 'line', 9593
    setattribute self, 'getopts', $P1
.annotate 'line', 9594
    setattribute self, 'opts', $P2
# }
.annotate 'line', 9595

.end # Options


.sub 'getbool' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9598
# var opts: $P1
    getattribute $P1, self, 'opts'
.annotate 'line', 9599
# var value: $P2
    $P2 = $P1[__ARG_1]
.annotate 'line', 9600
    isnull $I1, $P2
    not $I1
    .return($I1)
# }
.annotate 'line', 9601

.end # getbool


.sub 'getstring' :method
        .param string __ARG_1
        .param string __ARG_2 :optional
# Body
# {
.annotate 'line', 9604
# var opts: $P1
    getattribute $P1, self, 'opts'
.annotate 'line', 9605
# var value: $P2
    $P2 = $P1[__ARG_1]
.annotate 'line', 9606
    if_null $P2, __label_1
# predefined string
    set $S1, $P2
    goto __label_0
 __label_1:
    set $S1, __ARG_2
 __label_0:
    .return($S1)
# }
.annotate 'line', 9607

.end # getstring

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Options' ]
.annotate 'line', 9577
    addattribute $P0, 'getopts'
.annotate 'line', 9578
    addattribute $P0, 'opts'
.end
.namespace [ ]

.sub 'stage1'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9612
# var options: $P1
    new $P1, [ 'Options' ]
    $P1.'Options'(__ARG_1)
.annotate 'line', 9613
# outputfile: $S1
    $P4 = $P1.'getstring'('o', '')
    null $S1
    if_null $P4, __label_0
    set $S1, $P4
 __label_0:
.annotate 'line', 9614
# expr: $S2
    $P4 = $P1.'getstring'('e')
    null $S2
    if_null $P4, __label_1
    set $S2, $P4
 __label_1:
.annotate 'line', 9615
# noan: $I1
    $P4 = $P1.'getbool'('noan')
    set $I1, $P4
.annotate 'line', 9616
# warn: $I2
    $P4 = $P1.'getbool'('nowarn')
    isfalse $I2, $P4
.annotate 'line', 9617
# geninclude: $I3
    $P4 = $P1.'getbool'('geninclude')
    set $I3, $P4
.annotate 'line', 9619
# argc: $I4
    set $P4, __ARG_1
    set $I4, $P4
.annotate 'line', 9620
# filename: $S3
    null $S3
.annotate 'line', 9621
# var file: $P2
    null $P2
.annotate 'line', 9622
    unless_null $S2, __label_2
# {
.annotate 'line', 9623
    ne $I4, 0, __label_4
# predefined Error
.annotate 'line', 9624
    root_new $P4, ['parrot';'Exception']
    $P4['message'] = 'No file'
    throw $P4
 __label_4: # endif
.annotate 'line', 9626
    $S3 = __ARG_1[0]
.annotate 'line', 9627
# predefined open
    root_new $P2, ['parrot';'FileHandle']
    $P2.'open'($S3)
.annotate 'line', 9628
    $P2.'encoding'('utf8')
# }
    goto __label_3
 __label_2: # else
# {
.annotate 'line', 9631
    concat $S0, 'function main[main](argv){', $S2
    concat $S0, $S0, ';}'
    set $S2, $S0
.annotate 'line', 9632
    new $P2, [ 'StringHandle' ]
.annotate 'line', 9633
    $P2.'open'('__eval__', 'w')
.annotate 'line', 9634
    $P2.'puts'($S2)
.annotate 'line', 9635
    $P2.'close'()
.annotate 'line', 9636
    $P2.'open'('__eval__')
.annotate 'line', 9637
    set $S3, '__eval__'
# }
 __label_3: # endif
.annotate 'line', 9640
# var t: $P3
    new $P3, [ 'Tokenizer' ]
    $P3.'Tokenizer'($P2, $S3)
.annotate 'line', 9642
    'winxed_parser'($P3, $S1, $I2, $I1, $I3)
.annotate 'line', 9644
    $P2.'close'()
# }
.annotate 'line', 9645

.end # stage1


.sub 'show_backtrace'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9649
# i: $I1
    set $I1, 1
.annotate 'line', 9650
    iter $P4, __ARG_1
    set $P4, 0
 __label_0: # for iteration
    unless $P4 goto __label_1
    shift $P1, $P4
# {
.annotate 'line', 9651
# var sub: $P2
    $P2 = $P1['sub']
.annotate 'line', 9652
# subname: $S1
    null $S1
.annotate 'line', 9653
    if_null $P2, __label_2
# {
.annotate 'line', 9654
    set $S1, $P2
.annotate 'line', 9655
# ns: $S2
    $P5 = $P2.'get_namespace'()
    null $S2
    if_null $P5, __label_3
    set $S2, $P5
 __label_3:
.annotate 'line', 9656
    isne $I3, $S2, ''
    unless $I3 goto __label_5
    isne $I3, $S2, 'parrot'
 __label_5:
    unless $I3 goto __label_4
.annotate 'line', 9657
    concat $S0, $S2, '.'
    concat $S0, $S0, $S1
    set $S1, $S0
 __label_4: # endif
# }
 __label_2: # endif
.annotate 'line', 9659
# var ann: $P3
    $P3 = $P1['annotations']
.annotate 'line', 9660
# file: $S3
    $S3 = $P3['file']
.annotate 'line', 9661
    eq $S3, '', __label_6
# {
.annotate 'line', 9662
# line: $I2
    $I2 = $P3['line']
.annotate 'line', 9663
    set $I4, $I1
    inc $I1
    mul $I3, 2, $I4
    repeat $S4, ' ', $I3
# predefined cry
    getstderr $P0
    print $P0, $S4
    print $P0, "at "
    print $P0, $S1
    print $P0, " in '"
    print $P0, $S3
    print $P0, "' line "
    print $P0, $I2
    print $P0, "\n"
# }
 __label_6: # endif
# }
    goto __label_0
 __label_1: # endfor
# }
.annotate 'line', 9666

.end # show_backtrace


.sub 'main' :main
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9670
# retval: $I1
    null $I1
.annotate 'line', 9671
# try: create handler
    new $P2, 'ExceptionHandler'
    set_label $P2, __label_0
    $P2.'min_severity'(2)
    $P2.'max_severity'(2)
    $P2.'handle_types'(555, 556, 557)
    push_eh $P2
# try: begin
.annotate 'line', 9677
    'stage1'(__ARG_1)
# try: end
    pop_eh
    goto __label_1
.annotate 'line', 9671
# catch
 __label_0:
    .get_results($P1)
    finalize $P1
    pop_eh
# {
.annotate 'line', 9680
# msg: $S1
    $S1 = $P1['message']
.annotate 'line', 9681
# type: $I2
    $I2 = $P1['type']
.annotate 'line', 9682
    set $I3, $I2
    set $I4, 556
    if $I3 == $I4 goto __label_4
    set $I4, 557
    if $I3 == $I4 goto __label_5
    goto __label_3
# switch
 __label_4: # case
 __label_5: # case
.annotate 'line', 9685
# predefined cry
    getstderr $P0
    print $P0, 'Error: '
    print $P0, $S1
    print $P0, "\n"
.annotate 'line', 9686
    set $I1, 1
    goto __label_2 # break
 __label_3: # default
.annotate 'line', 9689
# predefined cry
    getstderr $P0
    print $P0, 'INTERNAL ERROR: '
    print $P0, $S1
    print $P0, "\n"
.annotate 'line', 9690
    $P2 = $P1.'backtrace'()
    'show_backtrace'($P2)
.annotate 'line', 9691
    set $I1, 2
 __label_2: # switch end
# }
# catch end
 __label_1:
.annotate 'line', 9694
# predefined exit
    exit $I1
# }
.annotate 'line', 9695

.end # main

# End generated code
