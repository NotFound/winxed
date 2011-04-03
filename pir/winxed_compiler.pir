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
# switch
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
# switch
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
.namespace [ 'Emit' ]

.sub 'Emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 707
    setattribute self, 'handle', __ARG_1
.annotate 'line', 708
    box $P1, ''
    setattribute self, 'file', $P1
.annotate 'line', 709
    box $P1, 0
    setattribute self, 'line', $P1
.annotate 'line', 710
    box $P1, 0
    setattribute self, 'pendingf', $P1
.annotate 'line', 711
    box $P1, 0
    setattribute self, 'pendingl', $P1
# }
.annotate 'line', 712

.end # Emit


.sub 'disable_annotations' :method
# Body
# {
.annotate 'line', 715
    box $P1, 1
    setattribute self, 'noan', $P1
# }
.annotate 'line', 716

.end # disable_annotations


.sub 'close' :method
# Body
# {
.annotate 'line', 719
    null $P1
    setattribute self, 'handle', $P1
# }
.annotate 'line', 720

.end # close


.sub 'updateannot' :method
# Body
# {
.annotate 'line', 723
    getattribute $P1, self, 'pendingf'
    if_null $P1, __label_0
    unless $P1 goto __label_0
# {
.annotate 'line', 724
    getattribute $P2, self, 'handle'
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, ".annotate 'file', '"
    push $P3, $P4
.annotate 'line', 726
    getattribute $P5, self, 'file'
.annotate 'line', 724
    push $P3, $P5
    box $P4, "'\n"
    push $P3, $P4
# predefined join
    join $S1, "", $P3
    $P2.'print'($S1)
.annotate 'line', 729
    getattribute $P1, self, 'pendingf'
    assign $P1, 0
# }
 __label_0: # endif
.annotate 'line', 731
    getattribute $P1, self, 'pendingl'
    if_null $P1, __label_1
    unless $P1 goto __label_1
# {
.annotate 'line', 732
    getattribute $P2, self, 'handle'
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, ".annotate 'line', "
    push $P3, $P4
.annotate 'line', 734
    getattribute $P5, self, 'line'
.annotate 'line', 732
    push $P3, $P5
    box $P4, "\n"
    push $P3, $P4
# predefined join
    join $S1, "", $P3
    $P2.'print'($S1)
.annotate 'line', 737
    getattribute $P1, self, 'pendingl'
    assign $P1, 0
# }
 __label_1: # endif
# }
.annotate 'line', 739

.end # updateannot


.sub 'vprint' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 742
    iter $P2, __ARG_1
    set $P2, 0
 __label_0: # for iteration
    unless $P2 goto __label_1
    shift $P1, $P2
.annotate 'line', 743
    getattribute $P3, self, 'handle'
    $P3.'print'($P1)
    goto __label_0
 __label_1: # endfor
# }
.annotate 'line', 744

.end # vprint


.sub 'print' :method
        .param pmc __ARG_1 :slurpy
# Body
# {
.annotate 'line', 747
    self.'updateannot'()
.annotate 'line', 748
    self.'vprint'(__ARG_1)
# }
.annotate 'line', 749

.end # print


.sub 'say' :method
        .param pmc __ARG_1 :slurpy
# Body
# {
.annotate 'line', 752
    self.'updateannot'()
.annotate 'line', 753
    self.'vprint'(__ARG_1)
.annotate 'line', 754
    getattribute $P1, self, 'handle'
    $P1.'print'("\n")
# }
.annotate 'line', 755

.end # say


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 758
    getattribute $P3, self, 'noan'
    unless_null $P3, __label_0
# {
.annotate 'line', 760
# var file: $P1
    getattribute $P1, self, 'file'
.annotate 'line', 761
# var line: $P2
    getattribute $P2, self, 'line'
.annotate 'line', 762
# tfile: $S1
    getattribute $P3, __ARG_1, 'file'
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
 __label_1:
.annotate 'line', 763
# tline: $I1
    getattribute $P3, __ARG_1, 'line'
    set $I1, $P3
.annotate 'line', 764
    set $S2, $P1
    eq $S2, $S1, __label_2
# {
.annotate 'line', 765
    assign $P1, $S1
.annotate 'line', 766
    getattribute $P3, self, 'pendingf'
    assign $P3, 1
.annotate 'line', 767
    assign $P2, 0
# }
 __label_2: # endif
.annotate 'line', 769
    set $I2, $P2
    eq $I2, $I1, __label_3
# {
.annotate 'line', 770
    assign $P2, $I1
.annotate 'line', 771
    getattribute $P3, self, 'pendingl'
    assign $P3, 1
# }
 __label_3: # endif
# }
 __label_0: # endif
# }
.annotate 'line', 774

.end # annotate


.sub 'comment' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 777
    self.'updateannot'()
.annotate 'line', 778
    getattribute $P1, self, 'handle'
    concat $S1, '# ', __ARG_1
    concat $S1, $S1, "\n"
    $P1.'print'($S1)
# }
.annotate 'line', 779

.end # comment


.sub 'emitlabel' :method
        .param string __ARG_1
        .param string __ARG_2 :optional
# Body
# {
.annotate 'line', 782
# var handle: $P1
    getattribute $P1, self, 'handle'
.annotate 'line', 783
    $P1.'print'(' ')
.annotate 'line', 784
    $P1.'print'(__ARG_1)
.annotate 'line', 785
    $P1.'print'(':')
.annotate 'line', 786
    if_null __ARG_2, __label_0
# {
.annotate 'line', 787
    concat $S1, ' # ', __ARG_2
    $P1.'print'($S1)
# }
 __label_0: # endif
.annotate 'line', 789
    $P1.'print'("\n")
# }
.annotate 'line', 790

.end # emitlabel


.sub 'emitgoto' :method
        .param string __ARG_1
        .param string __ARG_2 :optional
# Body
# {
.annotate 'line', 793
# var handle: $P1
    getattribute $P1, self, 'handle'
.annotate 'line', 794
    $P1.'print'('    goto ')
.annotate 'line', 795
    $P1.'print'(__ARG_1)
.annotate 'line', 796
    if_null __ARG_2, __label_0
# {
.annotate 'line', 797
    $P1.'print'(' # ')
.annotate 'line', 798
    $P1.'print'(__ARG_2)
# }
 __label_0: # endif
.annotate 'line', 800
    $P1.'print'("\n")
# }
.annotate 'line', 801

.end # emitgoto


.sub 'emitarg1' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 805
    concat $S1, '    ', __ARG_1
    concat $S1, $S1, ' '
    concat $S1, $S1, __ARG_2
    self.'say'($S1)
# }
.annotate 'line', 806

.end # emitarg1


.sub 'emitarg2' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 809
    concat $S1, '    ', __ARG_1
    concat $S1, $S1, ' '
    concat $S1, $S1, __ARG_2
    concat $S1, $S1, ', '
    concat $S1, $S1, __ARG_3
    self.'say'($S1)
# }
.annotate 'line', 810

.end # emitarg2


.sub 'emitcompare' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 813
    concat $S1, '    ', __ARG_1
    concat $S1, $S1, ' '
    concat $S1, $S1, __ARG_2
    concat $S1, $S1, ', '
    concat $S1, $S1, __ARG_3
    concat $S1, $S1, ', '
    concat $S1, $S1, __ARG_4
    self.'say'($S1)
# }
.annotate 'line', 814

.end # emitcompare


.sub 'emitif' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 817
    self.'say'('    if ', __ARG_1, ' goto ', __ARG_2)
# }
.annotate 'line', 818

.end # emitif


.sub 'emitunless' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 821
    self.'say'('    unless ', __ARG_1, ' goto ', __ARG_2)
# }
.annotate 'line', 822

.end # emitunless


.sub 'emitif_null' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 825
    self.'say'('    if_null ', __ARG_1, ', ', __ARG_2)
# }
.annotate 'line', 826

.end # emitif_null


.sub 'emitnull' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 829
    self.'say'("    null ", __ARG_1)
# }
.annotate 'line', 830

.end # emitnull


.sub 'emitinc' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 834
    self.'say'('    inc ', __ARG_1)
# }
.annotate 'line', 835

.end # emitinc


.sub 'emitdec' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 838
    self.'say'('    dec ', __ARG_1)
# }
.annotate 'line', 839

.end # emitdec


.sub 'emitset' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 842
    self.'say'("    set ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 843

.end # emitset


.sub 'emitassign' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 846
    self.'say'("    assign ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 847

.end # emitassign


.sub 'emitbox' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 850
    self.'say'("    box ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 851

.end # emitbox


.sub 'emitunbox' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 854
    self.'say'("    unbox ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 855

.end # emitunbox


.sub 'emitbinop' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 858
    self.'say'('    ', __ARG_1, " ", __ARG_2, ", ", __ARG_3, ", ", __ARG_4)
# }
.annotate 'line', 859

.end # emitbinop


.sub 'emitaddto' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 862
    self.'say'("    add ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 863

.end # emitaddto


.sub 'emitsubto' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 866
    self.'say'("    sub ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 867

.end # emitsubto


.sub 'emitadd' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 870
    self.'say'("    add ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 871

.end # emitadd


.sub 'emitsub' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 874
    self.'say'("    sub ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 875

.end # emitsub


.sub 'emitmul' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 878
    self.'say'("    mul ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 879

.end # emitmul


.sub 'emitdiv' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 882
    self.'say'("    div ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 883

.end # emitdiv


.sub 'emitconcat1' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 886
    self.'say'("    concat ", __ARG_1, ", ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 887

.end # emitconcat1


.sub 'emitconcat' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 890
    self.'say'("    concat ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 891

.end # emitconcat


.sub 'emitrepeat' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 894
    self.'say'("    repeat ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 895

.end # emitrepeat


.sub 'emitprint' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 898
    self.'say'('    print ', __ARG_1)
# }
.annotate 'line', 899

.end # emitprint


.sub 'emitsay' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 902
    self.'say'('    say ', __ARG_1)
# }
.annotate 'line', 903

.end # emitsay


.sub 'emitfind_lex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 906
    concat $S1, "    find_lex ", __ARG_1
    concat $S1, $S1, ", '"
    concat $S1, $S1, __ARG_2
    concat $S1, $S1, "'"
    self.'say'($S1)
# }
.annotate 'line', 907

.end # emitfind_lex

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Emit' ]
.annotate 'line', 698
    addattribute $P0, 'handle'
.annotate 'line', 699
    addattribute $P0, 'file'
.annotate 'line', 700
    addattribute $P0, 'line'
.annotate 'line', 701
    addattribute $P0, 'pendingf'
.annotate 'line', 702
    addattribute $P0, 'pendingl'
.annotate 'line', 703
    addattribute $P0, 'noan'
.end
.namespace [ ]

.sub 'integerValue'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 916
    new $P2, [ 'IntegerLiteral' ]
    $P2.'IntegerLiteral'(__ARG_1, __ARG_2, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 917

.end # integerValue


.sub 'floatValue'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param num __ARG_3
# Body
# {
.annotate 'line', 921
# var t: $P1
    new $P1, [ 'TokenFloat' ]
    getattribute $P2, __ARG_2, 'file'
    getattribute $P3, __ARG_2, 'line'
    $P1.'TokenFloat'($P2, $P3, __ARG_3)
.annotate 'line', 922
    new $P3, [ 'FloatLiteral' ]
    $P3.'FloatLiteral'(__ARG_1, $P1)
    set $P2, $P3
    .return($P2)
# }
.annotate 'line', 923

.end # floatValue


.sub 'floatresult'
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 931
# result: $I1
    iseq $I1, __ARG_1, 'N'
    unless $I1 goto __label_1
    iseq $I1, __ARG_2, 'N'
    if $I1 goto __label_2
    iseq $I1, __ARG_2, 'I'
 __label_2:
 __label_1:
    if $I1 goto __label_0
.annotate 'line', 932
    iseq $I1, __ARG_2, 'N'
    unless $I1 goto __label_3
    iseq $I1, __ARG_1, 'N'
    if $I1 goto __label_4
    iseq $I1, __ARG_1, 'I'
 __label_4:
 __label_3:
 __label_0:
.annotate 'line', 933
    .return($I1)
# }
.annotate 'line', 934

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
.annotate 'line', 959
# pos: $I1
# predefined indexof
    index $I1, __ARG_2, '%0'
.annotate 'line', 960
    iseq $I3, __ARG_1, 'v'
    unless $I3 goto __label_1
    isne $I3, $I1, -1
 __label_1:
    unless $I3 goto __label_0
.annotate 'line', 961
    'InternalError'('void predef with %0')
 __label_0: # endif
.annotate 'line', 962
    isne $I3, __ARG_1, 'v'
    unless $I3 goto __label_3
    iseq $I3, $I1, -1
 __label_3:
    unless $I3 goto __label_2
.annotate 'line', 963
    'InternalError'('non void predef without %0')
 __label_2: # endif
.annotate 'line', 966
# l: $I2
# predefined length
    length $I3, __ARG_2
    sub $I2, $I3, 1
.annotate 'line', 967
# predefined substr
    substr $S1, __ARG_2, $I2, 1
    ne $S1, "\n", __label_4
.annotate 'line', 968
# predefined substr
    substr __ARG_2, __ARG_2, 0, $I2
 __label_4: # endif
.annotate 'line', 969
# predefined split
    split $P1, "\n", __ARG_2
# predefined join
    join $S1, "\n    ", $P1
    concat $S0, '    ', $S1
    set __ARG_2, $S0
.annotate 'line', 970
    box $P1, __ARG_2
    setattribute self, 'body', $P1
.annotate 'line', 971
    box $P1, __ARG_1
    setattribute self, 'typeresult', $P1
# }
.annotate 'line', 972

.end # Predef_frombody


.sub 'invoke' :method :vtable
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 975
# typeresult: $S1
    getattribute $P2, self, 'typeresult'
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 977
    ne $S1, 'v', __label_1
# {
.annotate 'line', 978
    isnull $I1, __ARG_3
    not $I1
    unless $I1 goto __label_4
    isne $I1, __ARG_3, ''
 __label_4:
    unless $I1 goto __label_3
.annotate 'line', 979
    'SyntaxError'('using return value from void predef')
 __label_3: # endif
# }
    goto __label_2
 __label_1: # else
# {
.annotate 'line', 982
    isnull $I1, __ARG_3
    if $I1 goto __label_6
    iseq $I1, __ARG_3, ''
 __label_6:
    unless $I1 goto __label_5
.annotate 'line', 983
    'InternalError'('Bad result in non void predef')
 __label_5: # endif
# }
 __label_2: # endif
.annotate 'line', 986
# var builder: $P1
    new $P1, [ 'StringBuilder' ]
.annotate 'line', 987
    getattribute $P2, self, 'body'
.annotate 'line', 988
    $P3 = __ARG_4[0]
    $P4 = __ARG_4[1]
    $P5 = __ARG_4[2]
    $P6 = __ARG_4[3]
.annotate 'line', 987
    $P1.'append_format'($P2, __ARG_3, $P3, $P4, $P5, $P6)
.annotate 'line', 989
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 990
# predefined string
    set $S2, $P1
    __ARG_1.'say'($S2)
# }
.annotate 'line', 991

.end # invoke

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Predef_frombody' ]
.annotate 'line', 954
    addattribute $P0, 'body'
.annotate 'line', 955
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
.annotate 'line', 1012
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 1013
    isa $I2, __ARG_2, 'String'
    unless $I2 goto __label_0
.annotate 'line', 1014
    new $P3, [ 'Predef_frombody' ]
    $P3.'Predef_frombody'(__ARG_3, __ARG_2)
    set $P2, $P3
    setattribute self, 'body', $P2
    goto __label_1
 __label_0: # else
.annotate 'line', 1016
    setattribute self, 'body', __ARG_2
 __label_1: # endif
.annotate 'line', 1017
    box $P1, __ARG_3
    setattribute self, 'typeresult', $P1
.annotate 'line', 1018
# n: $I1
    null $I1
.annotate 'line', 1019
    if_null __ARG_4, __label_2
# {
.annotate 'line', 1020
    box $P1, __ARG_4
    setattribute self, 'type0', $P1
.annotate 'line', 1021
    set $S1, __ARG_4
    set $S2, '*'
    if $S1 == $S2 goto __label_5
    set $S2, '!'
    if $S1 == $S2 goto __label_6
    goto __label_4
# switch
 __label_5: # case
.annotate 'line', 1023
    set $I1, -1
    goto __label_3 # break
 __label_6: # case
.annotate 'line', 1026
    set $I1, -2
.annotate 'line', 1027
    if_null __ARG_5, __label_7
.annotate 'line', 1028
    concat $S3, "Invalid predef '", __ARG_1
    concat $S3, $S3, '"'
    'InternalError'($S3)
 __label_7: # endif
    goto __label_3 # break
 __label_4: # default
.annotate 'line', 1031
    set $I1, 1
.annotate 'line', 1032
    if_null __ARG_5, __label_8
# {
.annotate 'line', 1033
    box $P1, __ARG_5
    setattribute self, 'type1', $P1
.annotate 'line', 1034
    inc $I1
# }
 __label_8: # endif
.annotate 'line', 1036
    if_null __ARG_6, __label_9
# {
.annotate 'line', 1037
    box $P1, __ARG_6
    setattribute self, 'type2', $P1
.annotate 'line', 1038
    inc $I1
# }
 __label_9: # endif
.annotate 'line', 1040
    if_null __ARG_7, __label_10
# {
.annotate 'line', 1041
    box $P1, __ARG_7
    setattribute self, 'type3', $P1
.annotate 'line', 1042
    inc $I1
# }
 __label_10: # endif
 __label_3: # switch end
# }
 __label_2: # endif
.annotate 'line', 1046
    box $P1, $I1
    setattribute self, 'nparams', $P1
# }
.annotate 'line', 1047

.end # PredefBase


.sub 'name' :method
# Body
# {
.annotate 'line', 1050
# name: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 1051
    .return($S1)
# }
.annotate 'line', 1052

.end # name


.sub 'result' :method
# Body
# {
.annotate 'line', 1055
    getattribute $P1, self, 'typeresult'
    .return($P1)
# }
.annotate 'line', 1056

.end # result


.sub 'params' :method
# Body
# {
.annotate 'line', 1057
    getattribute $P1, self, 'nparams'
    .return($P1)
# }

.end # params


.sub 'paramtype' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 1060
# type: $S1
    null $S1
.annotate 'line', 1061
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
.annotate 'line', 1062
    getattribute $P1, self, 'type0'
    set $S1, $P1
    goto __label_0 # break
 __label_3: # case
.annotate 'line', 1063
    getattribute $P2, self, 'type1'
    set $S1, $P2
    goto __label_0 # break
 __label_4: # case
.annotate 'line', 1064
    getattribute $P3, self, 'type2'
    set $S1, $P3
    goto __label_0 # break
 __label_5: # case
.annotate 'line', 1065
    getattribute $P4, self, 'type3'
    set $S1, $P4
    goto __label_0 # break
 __label_1: # default
.annotate 'line', 1067
    'InternalError'('Invalid predef arg')
 __label_0: # switch end
.annotate 'line', 1069
    .return($S1)
# }
.annotate 'line', 1070

.end # paramtype


.sub 'expand' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 1073
# predefined string
    getattribute $P2, self, 'name'
    set $S2, $P2
    concat $S3, 'predefined ', $S2
    __ARG_1.'comment'($S3)
.annotate 'line', 1074
# typeresult: $S1
    getattribute $P2, self, 'typeresult'
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 1075
    isne $I1, $S1, 'v'
    unless $I1 goto __label_2
    iseq $I1, __ARG_4, ''
 __label_2:
    unless $I1 goto __label_1
.annotate 'line', 1076
    $P2 = __ARG_2.'tempreg'($S1)
    set __ARG_4, $P2
 __label_1: # endif
.annotate 'line', 1077
# var fun: $P1
    getattribute $P1, self, 'body'
.annotate 'line', 1078
    $P1(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
# }
.annotate 'line', 1079

.end # expand

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'PredefBase' ]
.annotate 'line', 996
    addattribute $P0, 'name'
.annotate 'line', 997
    addattribute $P0, 'body'
.annotate 'line', 998
    addattribute $P0, 'typeresult'
.annotate 'line', 999
    addattribute $P0, 'type0'
.annotate 'line', 1000
    addattribute $P0, 'type1'
.annotate 'line', 1001
    addattribute $P0, 'type2'
.annotate 'line', 1002
    addattribute $P0, 'type3'
.annotate 'line', 1003
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
.annotate 'line', 1091
    self.'PredefBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7)
# }
.annotate 'line', 1092

.end # PredefFunction

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'PredefFunction' ]
.annotate 'line', 1082
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
.annotate 'line', 1105
    self.'PredefBase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7, __ARG_8)
.annotate 'line', 1106
    setattribute self, 'evalfun', __ARG_2
# }
.annotate 'line', 1107

.end # PredefFunctionEval

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'PredefFunctionEval' ]
.annotate 'line', 1095
    get_class $P1, [ 'PredefBase' ]
    addparent $P0, $P1
.annotate 'line', 1097
    addattribute $P0, 'evalfun'
.end
.namespace [ 'Predef_typecast' ]

.sub 'Predef_typecast' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1115
    box $P1, __ARG_1
    setattribute self, 'type', $P1
# }
.annotate 'line', 1116

.end # Predef_typecast


.sub 'invoke' :method :vtable
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 1119
# type: $S1
    getattribute $P2, self, 'type'
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 1120
# predefined elements
    elements $I1, __ARG_4
    eq $I1, 1, __label_1
.annotate 'line', 1121
    'InternalError'("Invalid Predef_typecast.invoke call")
 __label_1: # endif
.annotate 'line', 1122
# var rawarg: $P1
    $P1 = __ARG_4[0]
.annotate 'line', 1123
# argtype: $S2
    $P2 = $P1.'checkresult'()
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
 __label_2:
.annotate 'line', 1124
    iseq $I1, $S2, $S1
    if $I1 goto __label_5
    isa $I1, $P1, [ 'IndexExpr' ]
 __label_5:
    unless $I1 goto __label_3
.annotate 'line', 1125
    $P1.'emit'(__ARG_1, __ARG_3)
    goto __label_4
 __label_3: # else
# {
.annotate 'line', 1127
# arg: $S3
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P2, __label_6
    set $S3, $P2
 __label_6:
.annotate 'line', 1128
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1130
    ne $S3, 'null', __label_7
.annotate 'line', 1131
    __ARG_1.'emitnull'(__ARG_3)
    goto __label_8
 __label_7: # else
.annotate 'line', 1133
    __ARG_1.'emitset'(__ARG_3, $S3)
 __label_8: # endif
# }
 __label_4: # endif
# }
.annotate 'line', 1135

.end # invoke

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Predef_typecast' ]
.annotate 'line', 1112
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
.annotate 'line', 1140
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1141
# n: $I1
# predefined elements
    elements $I3, __ARG_4
    sub $I1, $I3, 1
.annotate 'line', 1142
    lt $I1, 0, __label_0
# {
# for loop
.annotate 'line', 1143
# i: $I2
    null $I2
 __label_4: # for condition
    ge $I2, $I1, __label_3
.annotate 'line', 1144
    $P1 = __ARG_4[$I2]
    __ARG_1.'emitprint'($P1)
 __label_2: # for iteration
.annotate 'line', 1143
    inc $I2
    goto __label_4
 __label_3: # for end
.annotate 'line', 1145
    $P1 = __ARG_4[$I1]
    __ARG_1.'emitsay'($P1)
# }
    goto __label_1
 __label_0: # else
.annotate 'line', 1148
    __ARG_1.'emitsay'("''")
 __label_1: # endif
# }
.annotate 'line', 1149

.end # Predef_say


.sub 'Predef_cry'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 1153
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1154
    __ARG_1.'say'('    ', "getstderr $P0")
.annotate 'line', 1155
# n: $I1
# predefined elements
    elements $I1, __ARG_4
# for loop
.annotate 'line', 1156
# i: $I2
    null $I2
 __label_2: # for condition
    ge $I2, $I1, __label_1
.annotate 'line', 1157
    $P1 = __ARG_4[$I2]
    __ARG_1.'say'('    ', "print $P0, ", $P1)
 __label_0: # for iteration
.annotate 'line', 1156
    inc $I2
    goto __label_2
 __label_1: # for end
.annotate 'line', 1158
    __ARG_1.'say'('    ', "print $P0, \"\\n\"")
# }
.annotate 'line', 1159

.end # Predef_cry


.sub 'Predef_print'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 1163
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1164
# n: $I1
# predefined elements
    elements $I1, __ARG_4
# for loop
.annotate 'line', 1165
# i: $I2
    null $I2
 __label_2: # for condition
    ge $I2, $I1, __label_1
.annotate 'line', 1166
    $P1 = __ARG_4[$I2]
    __ARG_1.'emitprint'($P1)
 __label_0: # for iteration
.annotate 'line', 1165
    inc $I2
    goto __label_2
 __label_1: # for end
# }
.annotate 'line', 1167

.end # Predef_print


.sub 'Predef_invoke'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 1173
# var arg: $P1
    $P1 = __ARG_4[0]
.annotate 'line', 1174
    isa $I2, $P1, [ 'CallExpr' ]
    not $I1, $I2
    unless $I1 goto __label_0
.annotate 'line', 1175
    'SyntaxError'("invoke argument must be callable", __ARG_2)
 __label_0: # endif
.annotate 'line', 1176
    concat $S1, "(", __ARG_3
    concat $S1, $S1, " :call_sig)"
    $P1.'emit'(__ARG_1, $S1)
# }
.annotate 'line', 1177

.end # Predef_invoke


.sub 'predefeval_length' :subid('WSubId_1')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1181
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1182
# s: $S1
    $P2 = $P1.'get_value'()
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 1183
# predefined length
    length $I1, $S1
    .tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1184

.end # predefeval_length


.sub 'predefeval_bytelength' :subid('WSubId_2')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1188
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1189
# s: $S1
    $P2 = $P1.'get_value'()
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 1190
# predefined bytelength
    bytelength $I1, $S1
    .tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1191

.end # predefeval_bytelength


.sub 'predefeval_ord' :subid('WSubId_4')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1195
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1196
# s: $S1
    $P2 = $P1.'get_value'()
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 1197
# predefined ord
    ord $I1, $S1
    .tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1198

.end # predefeval_ord


.sub 'predefeval_ord_n' :subid('WSubId_5')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1202
# var arg: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1203
# s: $S1
    $P3 = $P1.'get_value'()
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 1204
# var argn: $P2
    $P3 = __ARG_3[1]
    getattribute $P2, $P3, 'arg'
.annotate 'line', 1205
# n: $I1
    getattribute $P3, $P2, 'numval'
    set $I1, $P3
.annotate 'line', 1206
# predefined ord
    ord $I2, $S1, $I1
    .tailcall 'integerValue'(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 1207

.end # predefeval_ord_n


.sub 'predefeval_chr' :subid('WSubId_3')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1211
# var arg: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1213
# n: $I1
    getattribute $P3, $P1, 'numval'
    set $I1, $P3
.annotate 'line', 1214
# s: $S1
# predefined chr
    chr $S0, $I1
    find_encoding $I0, 'utf8'
    trans_encoding $S1, $S0, $I0
.annotate 'line', 1216
# var t: $P2
    new $P2, [ 'TokenQuoted' ]
    getattribute $P3, __ARG_2, 'file'
    getattribute $P4, __ARG_2, 'line'
    $P2.'TokenQuoted'($P3, $P4, $S1)
.annotate 'line', 1217
    new $P4, [ 'StringLiteral' ]
    $P4.'StringLiteral'(__ARG_1, $P2)
    set $P3, $P4
    .return($P3)
# }
.annotate 'line', 1218

.end # predefeval_chr


.sub 'predefeval_substr' :subid('WSubId_6')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1222
# var argstr: $P1
    $P4 = __ARG_3[0]
    getattribute $P1, $P4, 'arg'
.annotate 'line', 1223
# var argpos: $P2
    $P4 = __ARG_3[1]
    getattribute $P2, $P4, 'arg'
.annotate 'line', 1224
# str: $S1
    $P4 = $P1.'get_value'()
    null $S1
    if_null $P4, __label_0
    set $S1, $P4
 __label_0:
.annotate 'line', 1225
# pos: $I1
    getattribute $P4, $P2, 'numval'
    set $I1, $P4
.annotate 'line', 1227
# var t: $P3
    new $P3, [ 'TokenQuoted' ]
    getattribute $P4, __ARG_2, 'file'
    getattribute $P5, __ARG_2, 'line'
# predefined substr
    substr $S2, $S1, $I1
    $P3.'TokenQuoted'($P4, $P5, $S2)
.annotate 'line', 1228
    new $P5, [ 'StringLiteral' ]
    $P5.'StringLiteral'(__ARG_1, $P3)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 1229

.end # predefeval_substr


.sub 'predefeval_substr_l' :subid('WSubId_7')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1233
# var argstr: $P1
    $P5 = __ARG_3[0]
    getattribute $P1, $P5, 'arg'
.annotate 'line', 1234
# var argpos: $P2
    $P5 = __ARG_3[1]
    getattribute $P2, $P5, 'arg'
.annotate 'line', 1235
# var arglen: $P3
    $P5 = __ARG_3[2]
    getattribute $P3, $P5, 'arg'
.annotate 'line', 1236
# str: $S1
    $P5 = $P1.'get_value'()
    null $S1
    if_null $P5, __label_0
    set $S1, $P5
 __label_0:
.annotate 'line', 1237
# pos: $I1
    getattribute $P5, $P2, 'numval'
    set $I1, $P5
.annotate 'line', 1238
# len: $I2
    getattribute $P5, $P3, 'numval'
    set $I2, $P5
.annotate 'line', 1240
# var t: $P4
    new $P4, [ 'TokenQuoted' ]
    getattribute $P5, __ARG_2, 'file'
    getattribute $P6, __ARG_2, 'line'
# predefined substr
    substr $S2, $S1, $I1, $I2
    $P4.'TokenQuoted'($P5, $P6, $S2)
.annotate 'line', 1241
    new $P6, [ 'StringLiteral' ]
    $P6.'StringLiteral'(__ARG_1, $P4)
    set $P5, $P6
    .return($P5)
# }
.annotate 'line', 1242

.end # predefeval_substr_l


.sub 'predefeval_indexof' :subid('WSubId_8')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1246
# var argstrfrom: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1247
# var argstrsearch: $P2
    $P3 = __ARG_3[1]
    getattribute $P2, $P3, 'arg'
.annotate 'line', 1248
# strfrom: $S1
    $P3 = $P1.'get_value'()
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 1249
# strsearch: $S2
    $P3 = $P2.'get_value'()
    null $S2
    if_null $P3, __label_1
    set $S2, $P3
 __label_1:
.annotate 'line', 1250
# predefined indexof
    index $I1, $S1, $S2
    .tailcall 'integerValue'(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1251

.end # predefeval_indexof


.sub 'predefeval_indexof_pos' :subid('WSubId_9')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1255
# var argstrfrom: $P1
    $P4 = __ARG_3[0]
    getattribute $P1, $P4, 'arg'
.annotate 'line', 1256
# var argstrsearch: $P2
    $P4 = __ARG_3[1]
    getattribute $P2, $P4, 'arg'
.annotate 'line', 1257
# var argpos: $P3
    $P4 = __ARG_3[2]
    getattribute $P3, $P4, 'arg'
.annotate 'line', 1258
# strfrom: $S1
    $P4 = $P1.'get_value'()
    null $S1
    if_null $P4, __label_0
    set $S1, $P4
 __label_0:
.annotate 'line', 1259
# strsearch: $S2
    $P4 = $P2.'get_value'()
    null $S2
    if_null $P4, __label_1
    set $S2, $P4
 __label_1:
.annotate 'line', 1260
# pos: $I1
    getattribute $P4, $P3, 'numval'
    set $I1, $P4
.annotate 'line', 1261
# predefined indexof
    index $I2, $S1, $S2, $I1
    .tailcall 'integerValue'(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 1262

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
.annotate 'line', 1275
.const 'Sub' $P11 = 'Predef_print'
.const 'Sub' $P12 = 'Predef_say'
.const 'Sub' $P13 = 'Predef_cry'
.const 'Sub' $P14 = 'Predef_invoke'
.annotate 'line', 1277
# var predefs: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1278
    new $P17, [ 'PredefFunction' ]
.annotate 'line', 1279
    new $P19, [ 'Predef_typecast' ]
    $P19.'Predef_typecast'('I')
    set $P18, $P19
    $P17.'PredefFunction'('int', $P18, 'I', '!')
    set $P16, $P17
.annotate 'line', 1277
    push $P1, $P16
.annotate 'line', 1282
    new $P21, [ 'PredefFunction' ]
.annotate 'line', 1283
    new $P23, [ 'Predef_typecast' ]
    $P23.'Predef_typecast'('N')
    set $P22, $P23
    $P21.'PredefFunction'('float', $P22, 'N', '!')
    set $P20, $P21
.annotate 'line', 1277
    push $P1, $P20
.annotate 'line', 1286
    new $P25, [ 'PredefFunction' ]
.annotate 'line', 1287
    new $P27, [ 'Predef_typecast' ]
    $P27.'Predef_typecast'('S')
    set $P26, $P27
    $P25.'PredefFunction'('string', $P26, 'S', '!')
    set $P24, $P25
.annotate 'line', 1277
    push $P1, $P24
.annotate 'line', 1290
    new $P29, [ 'PredefFunction' ]
    $P29.'PredefFunction'('die', 'die %1', 'v', 'S')
    set $P28, $P29
.annotate 'line', 1277
    push $P1, $P28
.annotate 'line', 1294
    new $P31, [ 'PredefFunction' ]
    $P31.'PredefFunction'('exit', 'exit %1', 'v', 'I')
    set $P30, $P31
.annotate 'line', 1277
    push $P1, $P30
.annotate 'line', 1298
    new $P33, [ 'PredefFunction' ]
    $P33.'PredefFunction'('time', 'time %0', 'I')
    set $P32, $P33
.annotate 'line', 1277
    push $P1, $P32
.annotate 'line', 1302
    new $P35, [ 'PredefFunction' ]
    $P35.'PredefFunction'('floattime', 'time %0', 'N')
    set $P34, $P35
.annotate 'line', 1277
    push $P1, $P34
.annotate 'line', 1306
    new $P37, [ 'PredefFunction' ]
    $P37.'PredefFunction'('spawnw', 'spawnw %0, %1', 'I', 'P')
    set $P36, $P37
.annotate 'line', 1277
    push $P1, $P36
.annotate 'line', 1310
    new $P39, [ 'PredefFunction' ]
    $P39.'PredefFunction'('getstdin', 'getstdin %0', 'P')
    set $P38, $P39
.annotate 'line', 1277
    push $P1, $P38
.annotate 'line', 1314
    new $P41, [ 'PredefFunction' ]
    $P41.'PredefFunction'('getstdout', 'getstdout %0', 'P')
    set $P40, $P41
.annotate 'line', 1277
    push $P1, $P40
.annotate 'line', 1318
    new $P43, [ 'PredefFunction' ]
    $P43.'PredefFunction'('getstderr', 'getstderr %0', 'P')
    set $P42, $P43
.annotate 'line', 1277
    push $P1, $P42
.annotate 'line', 1322
    new $P45, [ 'PredefFunction' ]
    $P45.'PredefFunction'('open', "root_new %0, ['parrot';'FileHandle']\n%0.'open'(%1)\n", 'P', 'S')
    set $P44, $P45
.annotate 'line', 1277
    push $P1, $P44
.annotate 'line', 1329
    new $P47, [ 'PredefFunction' ]
    $P47.'PredefFunction'('open', "root_new %0, ['parrot';'FileHandle']\n%0.'open'(%1,%2)\n", 'P', 'S', 'S')
    set $P46, $P47
.annotate 'line', 1277
    push $P1, $P46
.annotate 'line', 1336
    new $P49, [ 'PredefFunction' ]
    $P49.'PredefFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n", 'P', 'S')
    set $P48, $P49
.annotate 'line', 1277
    push $P1, $P48
.annotate 'line', 1343
    new $P51, [ 'PredefFunction' ]
    $P51.'PredefFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n", 'P', 'S', 'I')
    set $P50, $P51
.annotate 'line', 1277
    push $P1, $P50
.annotate 'line', 1351
    new $P53, [ 'PredefFunction' ]
    $P53.'PredefFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n%0['type'] = %3\n", 'P', 'S', 'I', 'I')
    set $P52, $P53
.annotate 'line', 1277
    push $P1, $P52
.annotate 'line', 1360
    new $P55, [ 'PredefFunction' ]
    $P55.'PredefFunction'('elements', 'elements %0, %1', 'I', 'P')
    set $P54, $P55
.annotate 'line', 1277
    push $P1, $P54
.annotate 'line', 1364
    new $P57, [ 'PredefFunctionEval' ]
.annotate 'line', 1365
    $P57.'PredefFunctionEval'('length', $P2, 'length %0, %1', 'I', 'S')
    set $P56, $P57
.annotate 'line', 1277
    push $P1, $P56
.annotate 'line', 1369
    new $P59, [ 'PredefFunctionEval' ]
.annotate 'line', 1370
    $P59.'PredefFunctionEval'('bytelength', $P3, 'bytelength %0, %1', 'I', 'S')
    set $P58, $P59
.annotate 'line', 1277
    push $P1, $P58
.annotate 'line', 1374
    new $P61, [ 'PredefFunctionEval' ]
.annotate 'line', 1375
    $P61.'PredefFunctionEval'('chr', $P4, "chr $S0, %1\nfind_encoding $I0, 'utf8'\ntrans_encoding %0, $S0, $I0\n", 'S', 'I')
    set $P60, $P61
.annotate 'line', 1277
    push $P1, $P60
.annotate 'line', 1383
    new $P63, [ 'PredefFunctionEval' ]
.annotate 'line', 1384
    $P63.'PredefFunctionEval'('ord', $P5, 'ord %0, %1', 'I', 'S')
    set $P62, $P63
.annotate 'line', 1277
    push $P1, $P62
.annotate 'line', 1388
    new $P65, [ 'PredefFunctionEval' ]
.annotate 'line', 1389
    $P65.'PredefFunctionEval'('ord', $P6, 'ord %0, %1, %2', 'I', 'S', 'I')
    set $P64, $P65
.annotate 'line', 1277
    push $P1, $P64
.annotate 'line', 1393
    new $P67, [ 'PredefFunctionEval' ]
.annotate 'line', 1394
    $P67.'PredefFunctionEval'('substr', $P7, 'substr %0, %1, %2', 'S', 'S', 'I')
    set $P66, $P67
.annotate 'line', 1277
    push $P1, $P66
.annotate 'line', 1398
    new $P69, [ 'PredefFunctionEval' ]
.annotate 'line', 1399
    $P69.'PredefFunctionEval'('substr', $P8, 'substr %0, %1, %2, %3', 'S', 'S', 'I', 'I')
    set $P68, $P69
.annotate 'line', 1277
    push $P1, $P68
.annotate 'line', 1403
    new $P71, [ 'PredefFunction' ]
    $P71.'PredefFunction'('replace', 'replace %0, %1, %2, %3, %4', 'S', 'S', 'I', 'I', 'S')
    set $P70, $P71
.annotate 'line', 1277
    push $P1, $P70
.annotate 'line', 1407
    new $P73, [ 'PredefFunctionEval' ]
.annotate 'line', 1408
    $P73.'PredefFunctionEval'('indexof', $P9, 'index %0, %1, %2', 'I', 'S', 'S')
    set $P72, $P73
.annotate 'line', 1277
    push $P1, $P72
.annotate 'line', 1412
    new $P75, [ 'PredefFunctionEval' ]
.annotate 'line', 1413
    $P75.'PredefFunctionEval'('indexof', $P10, 'index %0, %1, %2, %3', 'I', 'S', 'S', 'I')
    set $P74, $P75
.annotate 'line', 1277
    push $P1, $P74
.annotate 'line', 1417
    new $P77, [ 'PredefFunction' ]
    $P77.'PredefFunction'('join', 'join %0, %1, %2', 'S', 'S', 'P')
    set $P76, $P77
.annotate 'line', 1277
    push $P1, $P76
.annotate 'line', 1421
    new $P79, [ 'PredefFunction' ]
    $P79.'PredefFunction'('upcase', 'upcase %0, %1', 'S', 'S')
    set $P78, $P79
.annotate 'line', 1277
    push $P1, $P78
.annotate 'line', 1425
    new $P81, [ 'PredefFunction' ]
    $P81.'PredefFunction'('downcase', 'downcase %0, %1', 'S', 'S')
    set $P80, $P81
.annotate 'line', 1277
    push $P1, $P80
.annotate 'line', 1429
    new $P83, [ 'PredefFunction' ]
    $P83.'PredefFunction'('titlecase', 'titlecase %0, %1', 'S', 'S')
    set $P82, $P83
.annotate 'line', 1277
    push $P1, $P82
.annotate 'line', 1433
    new $P85, [ 'PredefFunction' ]
    $P85.'PredefFunction'('split', 'split %0, %1, %2', 'P', 'S', 'S')
    set $P84, $P85
.annotate 'line', 1277
    push $P1, $P84
.annotate 'line', 1437
    new $P87, [ 'PredefFunction' ]
    $P87.'PredefFunction'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n%0 = $P0(%1)\n", 'S', 'S')
    set $P86, $P87
.annotate 'line', 1277
    push $P1, $P86
.annotate 'line', 1444
    new $P89, [ 'PredefFunction' ]
    $P89.'PredefFunction'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n%0 = $P0(%1, %2)\n", 'S', 'S', 'S')
    set $P88, $P89
.annotate 'line', 1277
    push $P1, $P88
.annotate 'line', 1451
    new $P91, [ 'PredefFunction' ]
    $P91.'PredefFunction'('push', 'push %1, %2', 'v', 'P', '?')
    set $P90, $P91
.annotate 'line', 1277
    push $P1, $P90
.annotate 'line', 1455
    new $P93, [ 'PredefFunction' ]
    $P93.'PredefFunction'('sqrt', 'sqrt %0, %1', 'N', 'N')
    set $P92, $P93
.annotate 'line', 1277
    push $P1, $P92
.annotate 'line', 1459
    new $P95, [ 'PredefFunction' ]
    $P95.'PredefFunction'('pow', 'pow %0, %1, %2', 'N', 'N', 'N')
    set $P94, $P95
.annotate 'line', 1277
    push $P1, $P94
.annotate 'line', 1463
    new $P97, [ 'PredefFunction' ]
    $P97.'PredefFunction'('exp', 'exp %0, %1', 'N', 'N')
    set $P96, $P97
.annotate 'line', 1277
    push $P1, $P96
.annotate 'line', 1467
    new $P99, [ 'PredefFunction' ]
    $P99.'PredefFunction'('ln', 'ln %0, %1', 'N', 'N')
    set $P98, $P99
.annotate 'line', 1277
    push $P1, $P98
.annotate 'line', 1471
    new $P101, [ 'PredefFunction' ]
    $P101.'PredefFunction'('sin', 'sin %0, %1', 'N', 'N')
    set $P100, $P101
.annotate 'line', 1277
    push $P1, $P100
.annotate 'line', 1475
    new $P103, [ 'PredefFunction' ]
    $P103.'PredefFunction'('cos', 'cos %0, %1', 'N', 'N')
    set $P102, $P103
.annotate 'line', 1277
    push $P1, $P102
.annotate 'line', 1479
    new $P105, [ 'PredefFunction' ]
    $P105.'PredefFunction'('tan', 'tan %0, %1', 'N', 'N')
    set $P104, $P105
.annotate 'line', 1277
    push $P1, $P104
.annotate 'line', 1483
    new $P107, [ 'PredefFunction' ]
    $P107.'PredefFunction'('asin', 'asin %0, %1', 'N', 'N')
    set $P106, $P107
.annotate 'line', 1277
    push $P1, $P106
.annotate 'line', 1487
    new $P109, [ 'PredefFunction' ]
    $P109.'PredefFunction'('acos', 'acos %0, %1', 'N', 'N')
    set $P108, $P109
.annotate 'line', 1277
    push $P1, $P108
.annotate 'line', 1491
    new $P111, [ 'PredefFunction' ]
    $P111.'PredefFunction'('atan', 'atan %0, %1', 'N', 'N')
    set $P110, $P111
.annotate 'line', 1277
    push $P1, $P110
.annotate 'line', 1495
    new $P113, [ 'PredefFunction' ]
    $P113.'PredefFunction'('atan', 'atan %0, %1, %2', 'N', 'N', 'N')
    set $P112, $P113
.annotate 'line', 1277
    push $P1, $P112
.annotate 'line', 1499
    new $P115, [ 'PredefFunction' ]
    $P115.'PredefFunction'('getinterp', 'getinterp %0', 'P')
    set $P114, $P115
.annotate 'line', 1277
    push $P1, $P114
.annotate 'line', 1503
    new $P117, [ 'PredefFunction' ]
    $P117.'PredefFunction'('get_class', 'get_class %0, %1', 'P', 'S')
    set $P116, $P117
.annotate 'line', 1277
    push $P1, $P116
.annotate 'line', 1507
    new $P119, [ 'PredefFunction' ]
    $P119.'PredefFunction'('typeof', 'typeof %0, %1', 'P', 'P')
    set $P118, $P119
.annotate 'line', 1277
    push $P1, $P118
.annotate 'line', 1511
    new $P121, [ 'PredefFunction' ]
    $P121.'PredefFunction'('getattribute', 'getattribute %0, %1, %2', 'P', 'P', 'S')
    set $P120, $P121
.annotate 'line', 1277
    push $P1, $P120
.annotate 'line', 1515
    new $P123, [ 'PredefFunction' ]
    $P123.'PredefFunction'('find_method', 'find_method %0, %1, %2', 'P', 'P', 'S')
    set $P122, $P123
.annotate 'line', 1277
    push $P1, $P122
.annotate 'line', 1519
    new $P125, [ 'PredefFunction' ]
    $P125.'PredefFunction'('callmethodwithargs', '%0 = %1.%2(%3 :flat)', 'P', 'P', 'P', 'P')
    set $P124, $P125
.annotate 'line', 1277
    push $P1, $P124
.annotate 'line', 1523
    new $P127, [ 'PredefFunction' ]
    $P127.'PredefFunction'('clone', 'clone %0, %1', 'P', 'P')
    set $P126, $P127
.annotate 'line', 1277
    push $P1, $P126
.annotate 'line', 1527
    new $P129, [ 'PredefFunction' ]
    $P129.'PredefFunction'('compreg', 'compreg %0, %1', 'P', 'S')
    set $P128, $P129
.annotate 'line', 1277
    push $P1, $P128
.annotate 'line', 1531
    new $P131, [ 'PredefFunction' ]
    $P131.'PredefFunction'('compreg', 'compreg %1, %2', 'v', 'S', 'P')
    set $P130, $P131
.annotate 'line', 1277
    push $P1, $P130
.annotate 'line', 1535
    new $P133, [ 'PredefFunction' ]
    $P133.'PredefFunction'('load_language', "load_language %1\ncompreg %0, %1\n", 'P', 'S')
    set $P132, $P133
.annotate 'line', 1277
    push $P1, $P132
.annotate 'line', 1542
    new $P135, [ 'PredefFunction' ]
    $P135.'PredefFunction'('load_language', "load_language %1\ncompreg %0, %2\n", 'P', 'S', 'S')
    set $P134, $P135
.annotate 'line', 1277
    push $P1, $P134
.annotate 'line', 1549
    new $P137, [ 'PredefFunction' ]
    $P137.'PredefFunction'('loadlib', 'loadlib %0, %1', 'P', 'S')
    set $P136, $P137
.annotate 'line', 1277
    push $P1, $P136
.annotate 'line', 1553
    new $P139, [ 'PredefFunction' ]
    $P139.'PredefFunction'('load_bytecode', 'load_bytecode %1', 'v', 'S')
    set $P138, $P139
.annotate 'line', 1277
    push $P1, $P138
.annotate 'line', 1557
    new $P141, [ 'PredefFunction' ]
    $P141.'PredefFunction'('dlfunc', 'dlfunc %0, %1, %2, %3', 'P', 'P', 'S', 'S')
    set $P140, $P141
.annotate 'line', 1277
    push $P1, $P140
.annotate 'line', 1561
    new $P143, [ 'PredefFunction' ]
    $P143.'PredefFunction'('sprintf', 'sprintf %0, %1, %2', 'S', 'S', 'P')
    set $P142, $P143
.annotate 'line', 1277
    push $P1, $P142
.annotate 'line', 1565
    new $P145, [ 'PredefFunction' ]
    $P145.'PredefFunction'('sprintf', 'sprintf %0, %1, %2', 'P', 'P', 'P')
    set $P144, $P145
.annotate 'line', 1277
    push $P1, $P144
.annotate 'line', 1569
    new $P147, [ 'PredefFunction' ]
.annotate 'line', 1570
    $P147.'PredefFunction'('print', $P11, 'v', '*')
    set $P146, $P147
.annotate 'line', 1277
    push $P1, $P146
.annotate 'line', 1573
    new $P149, [ 'PredefFunction' ]
.annotate 'line', 1574
    $P149.'PredefFunction'('say', $P12, 'v', '*')
    set $P148, $P149
.annotate 'line', 1277
    push $P1, $P148
.annotate 'line', 1577
    new $P151, [ 'PredefFunction' ]
.annotate 'line', 1578
    $P151.'PredefFunction'('cry', $P13, 'v', '*')
    set $P150, $P151
.annotate 'line', 1277
    push $P1, $P150
.annotate 'line', 1581
    new $P153, [ 'PredefFunction' ]
.annotate 'line', 1582
    $P153.'PredefFunction'('invoke', $P14, 'P', '!')
    set $P152, $P153
.annotate 'line', 1277
    push $P1, $P152
 __label_1: # Infinite loop
.annotate 'line', 1587
    .yield($P1)
    goto __label_1
 __label_0: # Infinite loop end
# }
.annotate 'line', 1588

.end # getpredefs


.sub 'findpredef'
        .param string __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 1592
    $P2 = 'getpredefs'()
    iter $P3, $P2
    set $P3, 0
 __label_0: # for iteration
    unless $P3 goto __label_1
    shift $P1, $P3
.annotate 'line', 1593
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_2
# {
.annotate 'line', 1594
# pargs: $I1
    getattribute $P5, $P1, 'nparams'
    set $I1, $P5
.annotate 'line', 1595
    iseq $I2, $I1, __ARG_2
    if $I2 goto __label_5
.annotate 'line', 1596
    iseq $I2, $I1, -1
 __label_5:
    if $I2 goto __label_4
.annotate 'line', 1597
    iseq $I2, $I1, -2
    unless $I2 goto __label_6
    iseq $I2, __ARG_2, 1
 __label_6:
 __label_4:
    unless $I2 goto __label_3
.annotate 'line', 1598
    .return($P1)
 __label_3: # endif
# }
 __label_2: # endif
    goto __label_0
 __label_1: # endfor
    null $P2
.annotate 'line', 1600
    .return($P2)
# }
.annotate 'line', 1601

.end # findpredef


.sub 'optimize_array'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1609
    if_null __ARG_1, __label_0
# {
.annotate 'line', 1610
# n: $I1
# predefined elements
    elements $I1, __ARG_1
# for loop
.annotate 'line', 1611
# i: $I2
    null $I2
 __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 1612
    $P2 = __ARG_1[$I2]
    $P1 = $P2.'optimize'()
    __ARG_1[$I2] = $P1
 __label_1: # for iteration
.annotate 'line', 1611
    inc $I2
    goto __label_3
 __label_2: # for end
# }
 __label_0: # endif
# }
.annotate 'line', 1614

.end # optimize_array


.sub 'parseDotted'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1618
# var list: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1619
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 1620
    $P3 = $P2.'isidentifier'()
    if_null $P3, __label_0
    unless $P3 goto __label_0
# {
.annotate 'line', 1621
# predefined push
    push $P1, $P2
 __label_2: # while
.annotate 'line', 1622
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 1623
    $P2 = __ARG_1.'get'()
.annotate 'line', 1624
# predefined push
    push $P1, $P2
# }
    goto __label_2
 __label_1: # endwhile
# }
 __label_0: # endif
.annotate 'line', 1627
    __ARG_1.'unget'($P2)
.annotate 'line', 1628
    .return($P1)
# }
.annotate 'line', 1629

.end # parseDotted


.sub 'toIdentifierList'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1633
    new $P1, ['ResizableStringArray']
.annotate 'line', 1634
    iter $P3, __ARG_1
    set $P3, 0
 __label_0: # for iteration
    unless $P3 goto __label_1
    shift $P2, $P3
.annotate 'line', 1635
    $P4 = $P2.'getidentifier'()
# predefined push
    push $P1, $P4
    goto __label_0
 __label_1: # endfor
.annotate 'line', 1636
    .return($P1)
# }
.annotate 'line', 1637

.end # toIdentifierList

.namespace [ 'CommonBase' ]

.sub 'initbase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1650
    setattribute self, 'start', __ARG_1
.annotate 'line', 1651
    setattribute self, 'owner', __ARG_2
# }
.annotate 'line', 1652

.end # initbase


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1655
    getattribute $P1, self, 'start'
    __ARG_1.'annotate'($P1)
# }
.annotate 'line', 1656

.end # annotate


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1659
    getattribute $P1, self, 'owner'
    $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 1660

.end # use_predef


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 1663
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 1664

.end # generatesubid


.sub 'addlocalfunction' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1667
    getattribute $P1, self, 'owner'
    .tailcall $P1.'addlocalfunction'(__ARG_1)
# }
.annotate 'line', 1668

.end # addlocalfunction


.sub 'findsymbol' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1671
    getattribute $P1, self, 'owner'
    .tailcall $P1.'findsymbol'(__ARG_1)
# }
.annotate 'line', 1672

.end # findsymbol


.sub 'findclasskey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1675
    getattribute $P1, self, 'owner'
    .tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 1676

.end # findclasskey


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 1679
    getattribute $P1, self, 'owner'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 1680

.end # dowarnings

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CommonBase' ]
.annotate 'line', 1645
    addattribute $P0, 'start'
.annotate 'line', 1646
    addattribute $P0, 'owner'
.end
.namespace [ 'SimpleArgList' ]

.sub 'init' :method :vtable
# Body
# {
.annotate 'line', 1695
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'args', $P2
# }
.annotate 'line', 1696

.end # init


.sub 'numargs' :method
# Body
# {
.annotate 'line', 1700
    getattribute $P1, self, 'args'
# predefined elements
    elements $I1, $P1
    .return($I1)
# }
.annotate 'line', 1701

.end # numargs


.sub 'getarg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 1704
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 1705
    $P2 = $P1[__ARG_1]
    .return($P2)
# }
.annotate 'line', 1706

.end # getarg


.sub 'parseargs' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 1710
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 1711
# var t: $P2
    null $P2
 __label_0: # do
.annotate 'line', 1712
# {
.annotate 'line', 1713
# var value: $P3
    $P3 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 1714
# predefined push
    push $P1, $P3
# }
 __label_2: # continue
.annotate 'line', 1715
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'(',')
    if_null $P4, __label_1
    if $P4 goto __label_0
 __label_1: # enddo
.annotate 'line', 1716
    'RequireOp'(__ARG_3, $P2)
# }
.annotate 'line', 1717

.end # parseargs


.sub 'optimizeargs' :method
# Body
# {
.annotate 'line', 1721
    getattribute $P1, self, 'args'
    'optimize_array'($P1)
# }
.annotate 'line', 1722

.end # optimizeargs


.sub 'getargvalues' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1725
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 1726
# var argreg: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 1727
# nargs: $I1
# predefined elements
    elements $I1, $P1
# for loop
.annotate 'line', 1728
# i: $I2
    null $I2
 __label_2: # for condition
    ge $I2, $I1, __label_1
# {
.annotate 'line', 1729
# var a: $P3
    $P3 = $P1[$I2]
.annotate 'line', 1730
# reg: $S1
    $P4 = $P3.'emit_get'(__ARG_1)
    null $S1
    if_null $P4, __label_3
    set $S1, $P4
 __label_3:
.annotate 'line', 1731
# predefined push
    push $P2, $S1
# }
 __label_0: # for iteration
.annotate 'line', 1728
    inc $I2
    goto __label_2
 __label_1: # for end
.annotate 'line', 1733
    .return($P2)
# }
.annotate 'line', 1734

.end # getargvalues


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1737
# var argreg: $P1
    $P1 = self.'getargvalues'(__ARG_1)
.annotate 'line', 1738
# predefined join
    join $S1, ', ', $P1
    __ARG_1.'print'($S1)
# }
.annotate 'line', 1739

.end # emitargs

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'SimpleArgList' ]
.annotate 'line', 1691
    addattribute $P0, 'args'
.end
.namespace [ 'Modifier' ]

.sub 'getname' :method
# Body
# {
.annotate 'line', 1751
    getattribute $P1, self, 'name'
    .return($P1)
# }

.end # getname


.sub 'numargs' :method
# Body
# {
.annotate 'line', 1754
# nargs: $I1
    getattribute $P2, self, 'args'
    $P1 = $P2.'numargs'()
    set $I1, $P1
.annotate 'line', 1755
    .return($I1)
# }
.annotate 'line', 1756

.end # numargs


.sub 'getarg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 1759
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 1760
    $P2 = $P1.'numargs'()
    set $I1, $P2
    ge __ARG_1, $I1, __label_0
.annotate 'line', 1761
    .tailcall $P1.'getarg'(__ARG_1)
    goto __label_1
 __label_0: # else
.annotate 'line', 1763
    'InternalError'('Wrong modifier arg number')
 __label_1: # endif
# }
.annotate 'line', 1764

.end # getarg


.sub 'Modifier' :method
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1767
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 1768
    if_null __ARG_2, __label_0
.annotate 'line', 1769
    setattribute self, 'args', __ARG_2
 __label_0: # endif
# }
.annotate 'line', 1770

.end # Modifier


.sub 'optimize' :method
# Body
# {
.annotate 'line', 1773
    getattribute $P1, self, 'args'
    $P1.'optimizeargs'()
# }
.annotate 'line', 1774

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Modifier' ]
.annotate 'line', 1748
    addattribute $P0, 'name'
.annotate 'line', 1749
    addattribute $P0, 'args'
.end
.namespace [ 'ModifierList' ]

.sub 'ModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1783
# var list: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1784
# var t: $P2
    null $P2
 __label_0: # do
.annotate 'line', 1785
# {
.annotate 'line', 1786
    $P2 = __ARG_1.'get'()
.annotate 'line', 1787
# name: $S1
    $P4 = $P2.'getidentifier'()
    null $S1
    if_null $P4, __label_3
    set $S1, $P4
 __label_3:
.annotate 'line', 1788
    $P2 = __ARG_1.'get'()
.annotate 'line', 1789
# var args: $P3
    new $P3, [ 'SimpleArgList' ]
.annotate 'line', 1790
    $P4 = $P2.'isop'('(')
    if_null $P4, __label_4
    unless $P4 goto __label_4
# {
.annotate 'line', 1791
    $P3.'parseargs'(__ARG_1, __ARG_2, ')')
.annotate 'line', 1792
    $P2 = __ARG_1.'get'()
# }
 __label_4: # endif
.annotate 'line', 1794
    new $P5, [ 'Modifier' ]
    $P5.'Modifier'($S1, $P3)
    set $P4, $P5
# predefined push
    push $P1, $P4
# }
 __label_2: # continue
.annotate 'line', 1795
    $P4 = $P2.'isop'(',')
    if_null $P4, __label_1
    if $P4 goto __label_0
 __label_1: # enddo
.annotate 'line', 1796
    'RequireOp'(']', $P2)
.annotate 'line', 1797
    setattribute self, 'list', $P1
# }
.annotate 'line', 1798

.end # ModifierList


.sub 'optimize' :method
# Body
# {
.annotate 'line', 1801
    getattribute $P2, self, 'list'
    iter $P3, $P2
    set $P3, 0
 __label_0: # for iteration
    unless $P3 goto __label_1
    shift $P1, $P3
.annotate 'line', 1802
    $P1.'optimize'()
    goto __label_0
 __label_1: # endfor
# }
.annotate 'line', 1803

.end # optimize


.sub 'getlist' :method
# Body
# {
.annotate 'line', 1804
    getattribute $P1, self, 'list'
    .return($P1)
# }

.end # getlist


.sub 'pick' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1807
# var list: $P1
    getattribute $P1, self, 'list'
.annotate 'line', 1808
# n: $I1
# predefined elements
    elements $I1, $P1
# for loop
.annotate 'line', 1809
# i: $I2
    null $I2
 __label_2: # for condition
    ge $I2, $I1, __label_1
# {
.annotate 'line', 1810
# var mod: $P2
    $P2 = $P1[$I2]
.annotate 'line', 1811
    $P3 = $P2.'getname'()
    set $S1, $P3
    ne $S1, __ARG_1, __label_3
# {
.annotate 'line', 1812
    .return($P2)
# }
 __label_3: # endif
# }
 __label_0: # for iteration
.annotate 'line', 1809
    inc $I2
    goto __label_2
 __label_1: # for end
    null $P3
.annotate 'line', 1815
    .return($P3)
# }
.annotate 'line', 1816

.end # pick

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ModifierList' ]
.annotate 'line', 1779
    addattribute $P0, 'list'
.end
.namespace [ ]

.sub 'getparrotkey'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1825
# s: $S1
# predefined join
    join $S1, "'; '", __ARG_1
.annotate 'line', 1826
    concat $S2, "[ '", $S1
    concat $S2, $S2, "' ]"
    .return($S2)
# }
.annotate 'line', 1827

.end # getparrotkey


.sub 'getparrotnamespacekey'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1831
# predefined elements
    elements $I1, __ARG_1
    ne $I1, 0, __label_0
.annotate 'line', 1832
    .return(".namespace [ ]")
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 1834
# s: $S1
# predefined join
    join $S1, "'; '", __ARG_1
.annotate 'line', 1835
    concat $S2, ".namespace [ '", $S1
    concat $S2, $S2, "' ]"
    .return($S2)
# }
 __label_1: # endif
# }
.annotate 'line', 1837

.end # getparrotnamespacekey


.sub 'parseUsing'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1841
# var taux: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 1842
    $P2 = $P1.'iskeyword'('extern')
    if_null $P2, __label_0
    unless $P2 goto __label_0
.annotate 'line', 1843
    new $P4, [ 'ExternStatement' ]
    $P4.'ExternStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P3, $P4
    .return($P3)
    goto __label_1
 __label_0: # else
.annotate 'line', 1844
    $P5 = $P1.'iskeyword'('static')
    if_null $P5, __label_2
    unless $P5 goto __label_2
.annotate 'line', 1845
    new $P7, [ 'StaticStatement' ]
    $P7.'StaticStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P6, $P7
    .return($P6)
    goto __label_3
 __label_2: # else
# {
.annotate 'line', 1847
    __ARG_2.'unget'($P1)
.annotate 'line', 1848
    new $P3, [ 'UsingStatement' ]
    $P3.'UsingStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P2, $P3
    .return($P2)
# }
 __label_3: # endif
 __label_1: # endif
# }
.annotate 'line', 1850

.end # parseUsing


.sub 'parseSig'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1854
# var params: $P1
    new $P1, [ 'SigParameterList' ]
    $P1.'SigParameterList'(__ARG_2, __ARG_3)
.annotate 'line', 1855
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 1856
    $P4 = $P2.'isop'('=')
    isfalse $I1, $P4
    unless $I1 goto __label_0
.annotate 'line', 1857
    'SyntaxError'("Expected '='", $P2)
 __label_0: # endif
.annotate 'line', 1858
# var expr: $P3
    $P3 = 'parseExpr'(__ARG_2, __ARG_3)
.annotate 'line', 1859
    new $P5, [ 'MultiAssignStatement' ]
    $P5.'MultiAssignStatement'($P1, $P3)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 1860

.end # parseSig


.sub 'parseStatement'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1864
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 1865
    $P4 = $P1.'isop'(';')
    if_null $P4, __label_0
    unless $P4 goto __label_0
.annotate 'line', 1866
    new $P5, [ 'EmptyStatement' ]
    .return($P5)
 __label_0: # endif
.annotate 'line', 1867
    $P4 = $P1.'isop'('{')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 1868
    new $P6, [ 'CompoundStatement' ]
    $P6.'CompoundStatement'($P1, __ARG_1, __ARG_2)
    set $P5, $P6
    .return($P5)
 __label_1: # endif
.annotate 'line', 1869
    $P4 = $P1.'isop'('${')
    if_null $P4, __label_2
    unless $P4 goto __label_2
.annotate 'line', 1870
    new $P6, [ 'PiropStatement' ]
    $P6.'PiropStatement'($P1, __ARG_1, __ARG_2)
    set $P5, $P6
    .return($P5)
 __label_2: # endif
.annotate 'line', 1871
    $P4 = $P1.'isop'(':')
    if_null $P4, __label_3
    unless $P4 goto __label_3
# {
.annotate 'line', 1872
# var open: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 1873
    $P4 = $P2.'isop'('(')
    isfalse $I1, $P4
    unless $I1 goto __label_4
.annotate 'line', 1874
    'SyntaxError'("Unexpected ':'", $P1)
 __label_4: # endif
.annotate 'line', 1875
    .tailcall 'parseSig'($P1, __ARG_1, __ARG_2)
# }
 __label_3: # endif
.annotate 'line', 1878
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
.annotate 'line', 1880
    .tailcall 'parseUsing'($P1, __ARG_1, __ARG_2)
 __label_8: # case
.annotate 'line', 1882
    .tailcall 'parseConst'($P1, __ARG_1, __ARG_2)
    goto __label_5 # break
 __label_9: # case
.annotate 'line', 1885
    .tailcall 'parseVolatile'($P1, __ARG_1, __ARG_2)
    goto __label_5 # break
 __label_10: # case
.annotate 'line', 1888
    .tailcall 'parseVar'($P1, __ARG_1, __ARG_2)
 __label_11: # case
.annotate 'line', 1890
    .tailcall 'parseString'($P1, __ARG_1, __ARG_2)
 __label_12: # case
.annotate 'line', 1892
    .tailcall 'parseInt'($P1, __ARG_1, __ARG_2)
 __label_13: # case
.annotate 'line', 1894
    .tailcall 'parseFloat'($P1, __ARG_1, __ARG_2)
 __label_14: # case
.annotate 'line', 1896
    new $P6, [ 'ReturnStatement' ]
    $P6.'ReturnStatement'($P1, __ARG_1, __ARG_2)
    set $P5, $P6
    .return($P5)
 __label_15: # case
.annotate 'line', 1898
    new $P8, [ 'YieldStatement' ]
    $P8.'YieldStatement'($P1, __ARG_1, __ARG_2)
    set $P7, $P8
    .return($P7)
 __label_16: # case
.annotate 'line', 1900
    new $P10, [ 'GotoStatement' ]
    $P10.'GotoStatement'($P1, __ARG_1, __ARG_2)
    set $P9, $P10
    .return($P9)
 __label_17: # case
.annotate 'line', 1902
    new $P12, [ 'IfStatement' ]
    $P12.'IfStatement'($P1, __ARG_1, __ARG_2)
    set $P11, $P12
    .return($P11)
 __label_18: # case
.annotate 'line', 1904
    new $P14, [ 'WhileStatement' ]
    $P14.'WhileStatement'($P1, __ARG_1, __ARG_2)
    set $P13, $P14
    .return($P13)
 __label_19: # case
.annotate 'line', 1906
    new $P16, [ 'DoStatement' ]
    $P16.'DoStatement'($P1, __ARG_1, __ARG_2)
    set $P15, $P16
    .return($P15)
 __label_20: # case
.annotate 'line', 1908
    new $P18, [ 'ContinueStatement' ]
    $P18.'ContinueStatement'($P1, __ARG_1, __ARG_2)
    set $P17, $P18
    .return($P17)
 __label_21: # case
.annotate 'line', 1910
    new $P20, [ 'BreakStatement' ]
    $P20.'BreakStatement'($P1, __ARG_1, __ARG_2)
    set $P19, $P20
    .return($P19)
 __label_22: # case
.annotate 'line', 1912
    new $P22, [ 'SwitchStatement' ]
    $P22.'SwitchStatement'($P1, __ARG_1, __ARG_2)
    set $P21, $P22
    .return($P21)
 __label_23: # case
.annotate 'line', 1914
    .tailcall 'parseFor'($P1, __ARG_1, __ARG_2)
 __label_24: # case
.annotate 'line', 1916
    new $P24, [ 'ThrowStatement' ]
    $P24.'ThrowStatement'($P1, __ARG_1, __ARG_2)
    set $P23, $P24
    .return($P23)
 __label_25: # case
.annotate 'line', 1918
    new $P26, [ 'TryStatement' ]
    $P26.'TryStatement'($P1, __ARG_1, __ARG_2)
    set $P25, $P26
    .return($P25)
 __label_6: # default
.annotate 'line', 1920
    $P27 = $P1.'isidentifier'()
    if_null $P27, __label_26
    unless $P27 goto __label_26
# {
.annotate 'line', 1921
# var t2: $P3
    $P3 = __ARG_1.'get'()
.annotate 'line', 1922
    $P4 = $P3.'isop'(':')
    if_null $P4, __label_27
    unless $P4 goto __label_27
.annotate 'line', 1923
    new $P6, [ 'LabelStatement' ]
    $P6.'LabelStatement'($P1, __ARG_2)
    set $P5, $P6
    .return($P5)
 __label_27: # endif
.annotate 'line', 1924
    __ARG_1.'unget'($P3)
# }
 __label_26: # endif
.annotate 'line', 1926
    __ARG_1.'unget'($P1)
.annotate 'line', 1927
    new $P5, [ 'ExprStatement' ]
    $P5.'ExprStatement'($P1, __ARG_1, __ARG_2)
    set $P4, $P5
    .return($P4)
 __label_5: # switch end
.annotate 'line', 1929
    'InternalError'('parseStatement failure', $P1)
# }
.annotate 'line', 1930

.end # parseStatement

.namespace [ 'Statement' ]

.sub 'Statement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1940
    self.'initbase'(__ARG_1, __ARG_2)
# }
.annotate 'line', 1941

.end # Statement


.sub 'isempty' :method
# Body
# {
.annotate 'line', 1942
    .return(0)
# }

.end # isempty


.sub 'createreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1945
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createreg'(__ARG_1)
# }
.annotate 'line', 1946

.end # createreg


.sub 'tempreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1949
    getattribute $P1, self, 'owner'
    .tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 1950

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 1953
    getattribute $P1, self, 'owner'
    $P1.'freetemps'()
# }
.annotate 'line', 1954

.end # freetemps


.sub 'genlabel' :method
# Body
# {
.annotate 'line', 1957
    getattribute $P1, self, 'owner'
    .tailcall $P1.'genlabel'()
# }
.annotate 'line', 1958

.end # genlabel


.sub 'getlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1961
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getlabel'(__ARG_1)
# }
.annotate 'line', 1962

.end # getlabel


.sub 'createlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1965
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createlabel'(__ARG_1)
# }
.annotate 'line', 1966

.end # createlabel


.sub 'createconst' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param int __ARG_5 :optional
# Body
# {
.annotate 'line', 1970
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createconst'(__ARG_1, __ARG_2, __ARG_3, __ARG_4, __ARG_5)
# }
.annotate 'line', 1971

.end # createconst


.sub 'createvar' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 1974
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvar'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 1975

.end # createvar


.sub 'getvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1978
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getvar'(__ARG_1)
# }
.annotate 'line', 1979

.end # getvar


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1982
    getattribute $P1, self, 'owner'
    .tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 1983

.end # checkclass


.sub 'getouter' :method
# Body
# {
.annotate 'line', 1990
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getouter'()
# }
.annotate 'line', 1991

.end # getouter


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1994
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getcontinuelabel'(__ARG_1)
# }
.annotate 'line', 1995

.end # getcontinuelabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1998
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getbreaklabel'(__ARG_1)
# }
.annotate 'line', 1999

.end # getbreaklabel


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2002
    getattribute $P1, self, 'start'
    'InternalError'('**checking**', $P1)
.annotate 'line', 2004
    .return(self)
# }
.annotate 'line', 2005

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Statement' ]
.annotate 'line', 1936
    get_class $P1, [ 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'EmptyStatement' ]

.sub 'isempty' :method
# Body
# {
.annotate 'line', 2010
    .return(1)
# }

.end # isempty


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2013
    'InternalError'('Attempt to annotate empty statement')
# }
.annotate 'line', 2014

.end # annotate


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2015
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'EmptyStatement' ]
.annotate 'line', 2008
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'MultiStatementBase' ]

.sub 'optimize' :method
# Body
# {
.annotate 'line', 2028
# var statements: $P1
    getattribute $P1, self, 'statements'
.annotate 'line', 2029
# n: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 2030
# empty: $I2
    set $I2, 1
# for loop
.annotate 'line', 2031
# i: $I3
    null $I3
 __label_2: # for condition
    ge $I3, $I1, __label_1
# {
.annotate 'line', 2032
# var st: $P2
    $P3 = $P1[$I3]
    $P2 = $P3.'optimize'()
.annotate 'line', 2033
    set $I4, $I2
    unless $I4 goto __label_4
    $P3 = $P2.'isempty'()
    isfalse $I4, $P3
 __label_4:
    unless $I4 goto __label_3
.annotate 'line', 2034
    null $I2
 __label_3: # endif
.annotate 'line', 2035
    $P1[$I3] = $P2
# }
 __label_0: # for iteration
.annotate 'line', 2031
    inc $I3
    goto __label_2
 __label_1: # for end
.annotate 'line', 2037
    unless $I2 goto __label_5
.annotate 'line', 2038
    new $P3, [ 'EmptyStatement' ]
    .return($P3)
    goto __label_6
 __label_5: # else
.annotate 'line', 2040
    .return(self)
 __label_6: # endif
# }
.annotate 'line', 2041

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MultiStatementBase' ]
.annotate 'line', 2024
    addattribute $P0, 'statements'
.end
.namespace [ 'MultiStatement' ]

.sub 'MultiStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2048
# var statements: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
    push $P1, __ARG_1
    push $P1, __ARG_2
.annotate 'line', 2049
    setattribute self, 'statements', $P1
# }
.annotate 'line', 2050

.end # MultiStatement


.sub 'isempty' :method
# Body
# {
.annotate 'line', 2051
    .return(0)
# }

.end # isempty


.sub 'push' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2054
    getattribute $P1, self, 'statements'
# predefined push
    push $P1, __ARG_1
.annotate 'line', 2055
    .return(self)
# }
.annotate 'line', 2056

.end # push


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2059
    getattribute $P2, self, 'statements'
    iter $P3, $P2
    set $P3, 0
 __label_0: # for iteration
    unless $P3 goto __label_1
    shift $P1, $P3
.annotate 'line', 2060
    $P1.'emit'(__ARG_1)
    goto __label_0
 __label_1: # endfor
# }
.annotate 'line', 2061

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MultiStatement' ]
.annotate 'line', 2044
    get_class $P1, [ 'MultiStatementBase' ]
    addparent $P0, $P1
.end
.namespace [ ]

.sub 'addtomulti'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2066
    unless_null __ARG_1, __label_0
.annotate 'line', 2067
    .return(__ARG_2)
    goto __label_1
 __label_0: # else
.annotate 'line', 2068
    isa $I1, __ARG_1, [ 'MultiStatement' ]
    unless $I1 goto __label_2
.annotate 'line', 2069
    .tailcall __ARG_1.'push'(__ARG_2)
    goto __label_3
 __label_2: # else
.annotate 'line', 2071
    new $P2, [ 'MultiStatement' ]
    $P2.'MultiStatement'(__ARG_1, __ARG_2)
    set $P1, $P2
    .return($P1)
 __label_3: # endif
 __label_1: # endif
# }
.annotate 'line', 2072

.end # addtomulti

.namespace [ 'PiropStatement' ]

.sub 'PiropStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2085
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2086
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 2087
# dotted: $I1
    null $I1
.annotate 'line', 2088
    $P4 = $P1.'isop'('.')
    if_null $P4, __label_0
    unless $P4 goto __label_0
# {
.annotate 'line', 2089
    set $I1, 1
.annotate 'line', 2090
    $P1 = __ARG_2.'get'()
# }
 __label_0: # endif
.annotate 'line', 2092
# opname: $S1
    $P4 = $P1.'getidentifier'()
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
 __label_1:
.annotate 'line', 2093
    unless $I1 goto __label_3
    set $S3, '.'
    goto __label_2
 __label_3:
    set $S3, ''
 __label_2:
    concat $S4, $S3, $S1
    box $P4, $S4
    setattribute self, 'opname', $P4
.annotate 'line', 2094
    $P1 = __ARG_2.'get'()
.annotate 'line', 2095
    $P4 = $P1.'isop'('}')
    isfalse $I2, $P4
    unless $I2 goto __label_4
# {
.annotate 'line', 2096
    __ARG_2.'unget'($P1)
.annotate 'line', 2097
# var args: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
 __label_5: # do
.annotate 'line', 2098
# {
.annotate 'line', 2099
# var arg: $P3
    null $P3
.annotate 'line', 2100
    $P1 = __ARG_2.'get'()
.annotate 'line', 2101
    $P4 = $P1.'isop'(':')
    if_null $P4, __label_8
    unless $P4 goto __label_8
# {
.annotate 'line', 2102
    $P1 = __ARG_2.'get'()
.annotate 'line', 2103
# label: $S2
    $P4 = $P1.'getidentifier'()
    null $S2
    if_null $P4, __label_10
    set $S2, $P4
 __label_10:
.annotate 'line', 2104
    new $P4, [ 'Reflabel' ]
    $P4.'Reflabel'(__ARG_3, $S2)
    set $P3, $P4
# }
    goto __label_9
 __label_8: # else
# {
.annotate 'line', 2107
    __ARG_2.'unget'($P1)
.annotate 'line', 2108
    $P3 = 'parseExpr'(__ARG_2, __ARG_3)
# }
 __label_9: # endif
.annotate 'line', 2110
# predefined push
    push $P2, $P3
# }
 __label_7: # continue
.annotate 'line', 2111
    $P1 = __ARG_2.'get'()
    $P4 = $P1.'isop'(',')
    if_null $P4, __label_6
    if $P4 goto __label_5
 __label_6: # enddo
.annotate 'line', 2112
    'RequireOp'('}', $P1)
.annotate 'line', 2113
    setattribute self, 'args', $P2
# }
 __label_4: # endif
.annotate 'line', 2115
    'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 2116

.end # PiropStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2119
    getattribute $P1, self, 'args'
    'optimize_array'($P1)
.annotate 'line', 2120
    .return(self)
# }
.annotate 'line', 2121

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2124
# opname: $S1
    getattribute $P4, self, 'opname'
    null $S1
    if_null $P4, __label_0
    set $S1, $P4
 __label_0:
.annotate 'line', 2125
    self.'annotate'(__ARG_1)
.annotate 'line', 2126
    concat $S3, 'pirop ', $S1
    __ARG_1.'comment'($S3)
.annotate 'line', 2127
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 2128
    __ARG_1.'print'('    ')
.annotate 'line', 2129
    unless_null $P1, __label_1
.annotate 'line', 2130
    __ARG_1.'say'($S1)
    goto __label_2
 __label_1: # else
# {
.annotate 'line', 2132
# var argreg: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 2133
# nargs: $I1
# predefined elements
    elements $I1, $P1
# for loop
.annotate 'line', 2134
# i: $I2
    null $I2
 __label_5: # for condition
    ge $I2, $I1, __label_4
# {
.annotate 'line', 2135
# var a: $P3
    $P3 = $P1[$I2]
.annotate 'line', 2136
# reg: $S2
    $P4 = $P3.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_6
    set $S2, $P4
 __label_6:
.annotate 'line', 2137
# predefined push
    push $P2, $S2
# }
 __label_3: # for iteration
.annotate 'line', 2134
    inc $I2
    goto __label_5
 __label_4: # for end
.annotate 'line', 2139
# predefined join
    join $S3, ', ', $P2
    __ARG_1.'say'($S1, ' ', $S3)
# }
 __label_2: # endif
# }
.annotate 'line', 2141

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'PiropStatement' ]
.annotate 'line', 2078
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2080
    addattribute $P0, 'opname'
.annotate 'line', 2081
    addattribute $P0, 'args'
.end
.namespace [ 'ExternStatement' ]

.sub 'ExternStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2153
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2154
# var path: $P1
    $P1 = 'parseDotted'(__ARG_2)
.annotate 'line', 2155
# predefined elements
    elements $I1, $P1
    ne $I1, 0, __label_0
.annotate 'line', 2156
    $P2 = __ARG_2.'get'()
    'ExpectedIdentifier'($P2)
 __label_0: # endif
.annotate 'line', 2157
    'ExpectOp'(';', __ARG_2)
.annotate 'line', 2158
    $P3 = 'toIdentifierList'($P1)
    setattribute self, 'path', $P3
.annotate 'line', 2159
    .return(self)
# }
.annotate 'line', 2160

.end # ExternStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2161
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2164
    self.'annotate'(__ARG_1)
.annotate 'line', 2165
    getattribute $P1, self, 'path'
# predefined join
    join $S1, '/', $P1
    __ARG_1.'say'('    ', "load_bytecode '", $S1, ".pbc'")
# }
.annotate 'line', 2166

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ExternStatement' ]
.annotate 'line', 2148
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2150
    addattribute $P0, 'path'
.end
.namespace [ 'StaticStatement' ]

.sub 'StaticStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2178
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2179
# var names: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 2180
# var t: $P2
    null $P2
 __label_0: # do
.annotate 'line', 2181
# {
.annotate 'line', 2182
    $P2 = __ARG_2.'get'()
.annotate 'line', 2183
# name: $S1
    $P3 = $P2.'getidentifier'()
    null $S1
    if_null $P3, __label_3
    set $S1, $P3
 __label_3:
.annotate 'line', 2184
# predefined push
    push $P1, $S1
# }
 __label_2: # continue
.annotate 'line', 2185
    $P2 = __ARG_2.'get'()
    $P3 = $P2.'isop'(',')
    if_null $P3, __label_1
    if $P3 goto __label_0
 __label_1: # enddo
.annotate 'line', 2186
    'RequireOp'(';', $P2)
.annotate 'line', 2187
    setattribute self, 'names', $P1
# }
.annotate 'line', 2188

.end # StaticStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2189
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2192
    self.'annotate'(__ARG_1)
.annotate 'line', 2193
    getattribute $P2, self, 'names'
    iter $P3, $P2
    set $P3, 0
 __label_0: # for iteration
    unless $P3 goto __label_1
    shift $S1, $P3
# {
.annotate 'line', 2194
# var v: $P1
    $P1 = self.'createvar'($S1, 'P')
.annotate 'line', 2195
    $P2 = $P1.'getreg'()
    __ARG_1.'say'(".const 'Sub' ", $P2, " = '", $S1, "'")
# }
    goto __label_0
 __label_1: # endfor
# }
.annotate 'line', 2197

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'StaticStatement' ]
.annotate 'line', 2173
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2175
    addattribute $P0, 'names'
.end
.namespace [ 'UsingStatement' ]

.sub 'UsingStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2211
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2212
# var path: $P1
    $P1 = 'parseDotted'(__ARG_2)
.annotate 'line', 2213
# predefined elements
    elements $I1, $P1
    ne $I1, 0, __label_0
.annotate 'line', 2214
    $P2 = __ARG_2.'get'()
    'ExpectedIdentifier'($P2)
 __label_0: # endif
.annotate 'line', 2215
    'ExpectOp'(';', __ARG_2)
.annotate 'line', 2216
    $P3 = 'toIdentifierList'($P1)
    setattribute self, 'path', $P3
# }
.annotate 'line', 2217

.end # UsingStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2220
# var path: $P1
    getattribute $P1, self, 'path'
.annotate 'line', 2221
# name: $S1
    $S1 = $P1[-1]
.annotate 'line', 2222
# var vdata: $P2
    $P2 = self.'createvar'($S1, 'P')
.annotate 'line', 2224
# var symbol: $P3
    $P3 = self.'findsymbol'($P1)
.annotate 'line', 2225
    if_null $P3, __label_0
# {
.annotate 'line', 2226
    isa $I1, $P3, [ 'FunctionStatement' ]
    unless $I1 goto __label_1
# {
.annotate 'line', 2227
# subid: $S2
    $P4 = $P3.'makesubid'()
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
 __label_2:
.annotate 'line', 2228
    box $P4, $S2
    setattribute self, 'subid', $P4
# }
 __label_1: # endif
# }
 __label_0: # endif
.annotate 'line', 2231
    .return(self)
# }
.annotate 'line', 2232

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2235
# var path: $P1
    getattribute $P1, self, 'path'
.annotate 'line', 2236
# name: $S1
    $S1 = $P1[-1]
.annotate 'line', 2237
# var vdata: $P2
    $P2 = self.'getvar'($S1)
.annotate 'line', 2238
    getattribute $P3, self, 'subid'
    if_null $P3, __label_0
# {
.annotate 'line', 2239
# subid: $S2
    getattribute $P4, self, 'subid'
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
 __label_2:
.annotate 'line', 2240
    $P3 = $P2.'getreg'()
    __ARG_1.'say'(".const 'Sub' ", $P3, ' = "', $S2, '"')
# }
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 2243
    self.'annotate'(__ARG_1)
.annotate 'line', 2244
    $P3 = $P2.'getreg'()
    __ARG_1.'print'('    get_hll_global ', $P3, ', ')
.annotate 'line', 2245
    $P1.'pop'()
.annotate 'line', 2246
# predefined elements
    elements $I1, $P1
    null $I2
    if $I1 == $I2 goto __label_5
    goto __label_4
# switch
 __label_5: # case
.annotate 'line', 2248
    __ARG_1.'say'("'", $S1, "'")
    goto __label_3 # break
 __label_4: # default
.annotate 'line', 2251
    $P3 = 'getparrotkey'($P1)
    __ARG_1.'say'($P3, " , '", $S1, "'")
 __label_3: # switch end
# }
 __label_1: # endif
# }
.annotate 'line', 2254

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'UsingStatement' ]
.annotate 'line', 2204
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2206
    addattribute $P0, 'path'
.annotate 'line', 2207
    addattribute $P0, 'subid'
.end
.namespace [ 'ExprStatement' ]

.sub 'ExprStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2266
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2267
    $P2 = 'parseExpr'(__ARG_2, self)
    setattribute self, 'expr', $P2
.annotate 'line', 2268
    'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 2269

.end # ExprStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2272
    getattribute $P3, self, 'expr'
    $P2 = $P3.'optimize'()
    setattribute self, 'expr', $P2
.annotate 'line', 2273
    .return(self)
# }
.annotate 'line', 2274

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2277
    getattribute $P1, self, 'expr'
    $P1.'emit'(__ARG_1, '')
# }
.annotate 'line', 2278

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ExprStatement' ]
.annotate 'line', 2261
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2263
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
.annotate 'line', 2297
    setattribute self, 'type', __ARG_1
.annotate 'line', 2298
    setattribute self, 'reg', __ARG_2
.annotate 'line', 2299
    setattribute self, 'scope', __ARG_3
.annotate 'line', 2300
    box $P1, __ARG_4
    setattribute self, 'flags', $P1
.annotate 'line', 2301
    setattribute self, 'value', __ARG_5
# }
.annotate 'line', 2302

.end # VarData


.sub 'setid' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2305
    box $P1, __ARG_1
    setattribute self, 'id', $P1
# }
.annotate 'line', 2306

.end # setid


.sub 'setlex' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2309
    box $P1, __ARG_1
    setattribute self, 'lexname', $P1
# }
.annotate 'line', 2310

.end # setlex


.sub 'gettype' :method
# Body
# {
.annotate 'line', 2311
    getattribute $P1, self, 'type'
    .return($P1)
# }

.end # gettype


.sub 'getreg' :method
# Body
# {
.annotate 'line', 2312
    getattribute $P1, self, 'reg'
    .return($P1)
# }

.end # getreg


.sub 'getscope' :method
# Body
# {
.annotate 'line', 2313
    getattribute $P1, self, 'scope'
    .return($P1)
# }

.end # getscope


.sub 'getvalue' :method
# Body
# {
.annotate 'line', 2314
    getattribute $P1, self, 'value'
    .return($P1)
# }

.end # getvalue


.sub 'isconst' :method
# Body
# {
.annotate 'line', 2315
    getattribute $P1, self, 'value'
    isnull $I1, $P1
    not $I1
    .return($I1)
# }

.end # isconst


.sub 'getid' :method
# Body
# {
.annotate 'line', 2316
    getattribute $P1, self, 'id'
    .return($P1)
# }

.end # getid


.sub 'getlex' :method
# Body
# {
.annotate 'line', 2317
    getattribute $P1, self, 'lexname'
    .return($P1)
# }

.end # getlex


.sub 'getflags' :method
# Body
# {
.annotate 'line', 2318
    getattribute $P1, self, 'flags'
    .return($P1)
# }

.end # getflags

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'VarData' ]
.annotate 'line', 2287
    addattribute $P0, 'type'
.annotate 'line', 2288
    addattribute $P0, 'reg'
.annotate 'line', 2289
    addattribute $P0, 'scope'
.annotate 'line', 2290
    addattribute $P0, 'flags'
.annotate 'line', 2291
    addattribute $P0, 'value'
.annotate 'line', 2292
    addattribute $P0, 'id'
.annotate 'line', 2293
    addattribute $P0, 'lexname'
.end
.namespace [ 'ConstantInternalFail' ]

.sub 'ConstantInternalFail' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2326
    setattribute self, 'name', __ARG_1
# }
.annotate 'line', 2327

.end # ConstantInternalFail


.sub 'get_string' :method :vtable
# Body
# {
.annotate 'line', 2330
    'InternalError'('Attempt to use unexpanded constant!!!')
# }
.annotate 'line', 2331

.end # get_string

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ConstantInternalFail' ]
.annotate 'line', 2323
    addattribute $P0, 'name'
.end
.namespace [ 'VarContainer' ]

.sub 'init' :method :vtable
# Body
# {
.annotate 'line', 2340
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'locals', $P2
# }
.annotate 'line', 2341

.end # init


.sub 'createvar' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 2344
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2345
# sname: $S1
    set $P4, __ARG_1
    null $S1
    if_null $P4, __label_0
    set $S1, $P4
 __label_0:
.annotate 'line', 2346
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2347
    if_null $P2, __label_1
.annotate 'line', 2348
    concat $S3, "Redeclared '", $S1
    concat $S3, $S3, "'"
    'SyntaxError'($S3, __ARG_1)
 __label_1: # endif
.annotate 'line', 2349
# reg: $S2
    $P4 = self.'createreg'(__ARG_2)
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
 __label_2:
.annotate 'line', 2350
# var data: $P3
    new $P3, [ 'VarData' ]
    $P3.'VarData'(__ARG_2, $S2, self, __ARG_3)
.annotate 'line', 2351
    $P1[$S1] = $P3
.annotate 'line', 2352
    .return($P3)
# }
.annotate 'line', 2353

.end # createvar


.sub 'createvarnamed' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 2356
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2357
# sname: $S1
    set $P3, __ARG_1
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 2358
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2359
    if_null $P2, __label_1
.annotate 'line', 2360
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    'SyntaxError'($S2, __ARG_1)
 __label_1: # endif
.annotate 'line', 2361
    new $P4, [ 'VarData' ]
    $P4.'VarData'(__ARG_2, __ARG_3, self, 0)
    set $P3, $P4
    $P1[$S1] = $P3
# }
.annotate 'line', 2362

.end # createvarnamed


.sub 'createconst' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param int __ARG_5 :optional
# Body
# {
.annotate 'line', 2366
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2367
# sname: $S1
    set $P4, __ARG_1
    null $S1
    if_null $P4, __label_0
    set $S1, $P4
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
# var data: $P3
    new $P3, [ 'VarData' ]
    new $P5, [ 'ConstantInternalFail' ]
    $P5.'ConstantInternalFail'(__ARG_1)
    set $P4, $P5
.annotate 'line', 2372
    $P3.'VarData'(__ARG_2, $P4, self, __ARG_5, __ARG_3)
.annotate 'line', 2373
    isnull $I1, __ARG_4
    not $I1
    unless $I1 goto __label_3
    isne $I1, __ARG_4, ''
 __label_3:
    unless $I1 goto __label_2
.annotate 'line', 2374
    $P3.'setid'(__ARG_4)
 __label_2: # endif
.annotate 'line', 2375
    $P1[$S1] = $P3
# }
.annotate 'line', 2376

.end # createconst


.sub 'getvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2379
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2380
# sname: $S1
    set $P3, __ARG_1
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 2381
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2382
    isnull $I1, $P2
    unless $I1 goto __label_2
    getattribute $P3, self, 'owner'
    isnull $I1, $P3
    not $I1
 __label_2:
    unless $I1 goto __label_1
.annotate 'line', 2383
    getattribute $P4, self, 'owner'
    $P2 = $P4.'getvar'(__ARG_1)
 __label_1: # endif
.annotate 'line', 2384
    isnull $I1, $P2
    not $I1
    unless $I1 goto __label_4
    isa $I2, $P2, [ 'VarData' ]
    not $I1, $I2
 __label_4:
    unless $I1 goto __label_3
.annotate 'line', 2385
    'InternalError'('Incorrect data for Variable', __ARG_1)
 __label_3: # endif
.annotate 'line', 2386
    .return($P2)
# }
.annotate 'line', 2387

.end # getvar


.sub 'getlocalvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2390
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2391
# sname: $S1
    set $P3, __ARG_1
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 2392
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2393
    .return($P2)
# }
.annotate 'line', 2394

.end # getlocalvar


.sub 'makelexical' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2397
# var lexowner: $P1
    $P1 = self.'getouter'()
.annotate 'line', 2398
# lexname: $S1
    $P2 = $P1.'createlex'(__ARG_1)
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 2399
    .return($S1)
# }
.annotate 'line', 2400

.end # makelexical


.sub 'makelexicalself' :method
# Body
# {
.annotate 'line', 2403
# var lexowner: $P1
    set $P1, self
# Constant lexname evaluated at compile time
.annotate 'line', 2405
    self.'setlex'('__WLEX_self', 'self')
.annotate 'line', 2406
    .return('__WLEX_self')
# }
.annotate 'line', 2407

.end # makelexicalself

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'VarContainer' ]
.annotate 'line', 2337
    addattribute $P0, 'locals'
.end
.namespace [ 'BlockStatement' ]
.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'BlockStatement' ]
.annotate 'line', 2416
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
.annotate 'line', 2428
    self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 2429

.end # Expr


.sub 'issimple' :method
# Body
# {
.annotate 'line', 2430
    .return(0)
# }

.end # issimple


.sub 'isliteral' :method
# Body
# {
.annotate 'line', 2431
    .return(0)
# }

.end # isliteral


.sub 'isintegerliteral' :method
# Body
# {
.annotate 'line', 2432
    .return(0)
# }

.end # isintegerliteral


.sub 'isfloatliteral' :method
# Body
# {
.annotate 'line', 2433
    .return(0)
# }

.end # isfloatliteral


.sub 'isstringliteral' :method
# Body
# {
.annotate 'line', 2434
    .return(0)
# }

.end # isstringliteral


.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 2435
    .return(0)
# }

.end # isidentifier


.sub 'isnull' :method
# Body
# {
.annotate 'line', 2436
    .return(0)
# }

.end # isnull


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 2437
    .return(0)
# }

.end # hascompilevalue


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 2438
    .return(0)
# }

.end # isnegable


.sub 'tempreg' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2441
    getattribute $P1, self, 'owner'
    .tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 2442

.end # tempreg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2446
    .return(self)
# }
.annotate 'line', 2447

.end # optimize


.sub 'cantailcall' :method
# Body
# {
.annotate 'line', 2448
    .return(0)
# }

.end # cantailcall


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2451
# type: $S1
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 2452
# reg: $S2
    ne $S1, 'v', __label_2
    set $S2, ''
    goto __label_1
 __label_2:
    $S2 = self.'tempreg'($S1)
 __label_1:
.annotate 'line', 2453
    self.'emit'(__ARG_1, $S2)
.annotate 'line', 2454
    .return($S2)
# }
.annotate 'line', 2455

.end # emit_get


.sub 'emit_getint' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2458
# reg: $S1
    null $S1
.annotate 'line', 2459
    $P1 = self.'checkresult'()
    set $S2, $P1
    ne $S2, 'I', __label_0
.annotate 'line', 2460
    $P2 = self.'emit_get'(__ARG_1)
    set $S1, $P2
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 2462
    $P3 = self.'tempreg'('I')
    set $S1, $P3
.annotate 'line', 2463
    self.'emit'(__ARG_1, $S1)
# }
 __label_1: # endif
.annotate 'line', 2465
    .return($S1)
# }
.annotate 'line', 2466

.end # emit_getint


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2469
    getattribute $P1, self, 'start'
    'SyntaxError'('Not a left-side expression', $P1)
# }
.annotate 'line', 2470

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Expr' ]
.annotate 'line', 2424
    get_class $P1, [ 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'SimpleExpr' ]

.sub 'issimple' :method
# Body
# {
.annotate 'line', 2475
    .return(1)
# }

.end # issimple

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'SimpleExpr' ]
.annotate 'line', 2473
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
.annotate 'line', 2485
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 2486
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 2487
    $P2 = $P1.'isop'('(')
    isfalse $I1, $P2
    unless $I1 goto __label_0
.annotate 'line', 2488
    'SyntaxError'('anonymous function expected', $P1)
 __label_0: # endif
.annotate 'line', 2489
    new $P4, [ 'LocalFunctionStatement' ]
    $P4.'LocalFunctionStatement'(__ARG_3, __ARG_1, __ARG_2)
    set $P3, $P4
    setattribute self, 'fn', $P3
# }
.annotate 'line', 2490

.end # FunctionExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2491
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2494
    getattribute $P3, self, 'fn'
    $P2 = $P3.'optimize'()
    setattribute self, 'fn', $P2
.annotate 'line', 2495
    .return(self)
# }
.annotate 'line', 2496

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2499
# var fn: $P1
    getattribute $P1, self, 'fn'
.annotate 'line', 2500
# reg: $S1
    $P2 = self.'tempreg'('P')
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 2501
    self.'annotate'(__ARG_1)
.annotate 'line', 2502
    $P2 = $P1.'getsubid'()
    __ARG_1.'say'(".const 'Sub' ", $S1, " = '", $P2, "'")
.annotate 'line', 2503
    set $S2, __ARG_2
    eq $S2, '', __label_1
.annotate 'line', 2504
    __ARG_1.'emitarg2'('newclosure', __ARG_2, $S1)
 __label_1: # endif
# }
.annotate 'line', 2505

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FunctionExpr' ]
.annotate 'line', 2480
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 2482
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
.annotate 'line', 2520
    setattribute self, 'condexpr', __ARG_1
.annotate 'line', 2521
    .return(self)
# }
.annotate 'line', 2522

.end # set


.sub 'optimize_condition' :method
# Body
# {
.annotate 'line', 2525
    getattribute $P3, self, 'condexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'condexpr', $P2
# }
.annotate 'line', 2526

.end # optimize_condition


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2529
    getattribute $P3, self, 'condexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'condexpr', $P2
.annotate 'line', 2530
    .return(self)
# }
.annotate 'line', 2531

.end # optimize


.sub 'getvalue' :method
# Body
# {
.annotate 'line', 2534
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 2535
    $P2 = $P1.'isliteral'()
    if_null $P2, __label_0
    unless $P2 goto __label_0
# {
.annotate 'line', 2536
    $P3 = $P1.'checkresult'()
    set $S1, $P3
    set $S2, 'I'
    if $S1 == $S2 goto __label_3
    goto __label_2
# switch
 __label_3: # case
.annotate 'line', 2538
# n: $I1
    $P4 = $P1.'getIntegerValue'()
    set $I1, $P4
.annotate 'line', 2539
    ne $I1, 0, __label_4
.annotate 'line', 2540
    .return(2)
    goto __label_5
 __label_4: # else
.annotate 'line', 2542
    .return(1)
 __label_5: # endif
 __label_2: # default
 __label_1: # switch end
# }
 __label_0: # endif
.annotate 'line', 2545
    .return(0)
# }
.annotate 'line', 2546

.end # getvalue


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 2549
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 2551
    isa $I1, $P1, [ 'ComparatorBaseExpr' ]
    if $I1 goto __label_2
.annotate 'line', 2552
    isa $I1, $P1, [ 'NullCheckerExpr' ]
 __label_2:
    unless $I1 goto __label_0
.annotate 'line', 2553
    $P1.'emit_if'(__ARG_1, __ARG_2)
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 2555
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_3
    set $S1, $P2
 __label_3:
.annotate 'line', 2556
# type: $S2
    $P2 = $P1.'checkresult'()
    null $S2
    if_null $P2, __label_4
    set $S2, $P2
 __label_4:
.annotate 'line', 2557
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
.annotate 'line', 2560
    __ARG_1.'emitif_null'($S1, __ARG_3)
 __label_9: # case
 __label_10: # case
.annotate 'line', 2563
    __ARG_1.'emitif'($S1, __ARG_2)
    goto __label_5 # break
 __label_6: # default
.annotate 'line', 2566
    'InternalError'('Invalid if condition')
 __label_5: # switch end
# }
 __label_1: # endif
# }
.annotate 'line', 2569

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 2572
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 2574
    isa $I1, $P1, [ 'ComparatorBaseExpr' ]
    if $I1 goto __label_2
.annotate 'line', 2575
    isa $I1, $P1, [ 'NullCheckerExpr' ]
 __label_2:
    unless $I1 goto __label_0
.annotate 'line', 2576
    $P1.'emit_else'(__ARG_1, __ARG_2)
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 2578
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_3
    set $S1, $P2
 __label_3:
.annotate 'line', 2579
# type: $S2
    $P2 = $P1.'checkresult'()
    null $S2
    if_null $P2, __label_4
    set $S2, $P2
 __label_4:
.annotate 'line', 2580
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
.annotate 'line', 2583
    __ARG_1.'emitif_null'($S1, __ARG_2)
 __label_9: # case
 __label_10: # case
.annotate 'line', 2586
    __ARG_1.'emitunless'($S1, __ARG_2)
    goto __label_5 # break
 __label_6: # default
.annotate 'line', 2589
    'InternalError'('Invalid if condition')
 __label_5: # switch end
# }
 __label_1: # endif
# }
.annotate 'line', 2592

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Condition' ]
.annotate 'line', 2517
    addattribute $P0, 'condexpr'
.end
.namespace [ 'Literal' ]

.sub 'isliteral' :method
# Body
# {
.annotate 'line', 2599
    .return(1)
# }

.end # isliteral


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 2600
    .return(1)
# }

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Literal' ]
.annotate 'line', 2597
    get_class $P1, [ 'SimpleExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'StringLiteral' ]

.sub 'StringLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2610
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2611
    setattribute self, 'strval', __ARG_2
# }
.annotate 'line', 2612

.end # StringLiteral


.sub 'isstringliteral' :method
# Body
# {
.annotate 'line', 2613
    .return(1)
# }

.end # isstringliteral


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2614
    .return('S')
# }

.end # checkresult


.sub 'getPirString' :method
# Body
# {
.annotate 'line', 2617
# var strtok: $P1
    getattribute $P1, self, 'strval'
.annotate 'line', 2618
# str: $S1
    getattribute $P2, $P1, 'str'
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 2619
# typesinglequoted: $I1
    isa $I1, $P1, [ 'TokenSingleQuoted' ]
.annotate 'line', 2620
# need_unicode: $I2
    null $I2
.annotate 'line', 2621
    box $P2, $S1
    iter $P3, $P2
    set $P3, 0
 __label_1: # for iteration
    unless $P3 goto __label_2
    shift $I3, $P3
# {
.annotate 'line', 2622
    le $I3, 127, __label_3
# {
.annotate 'line', 2623
    set $I2, 1
    goto __label_2 # break
.annotate 'line', 2624
# }
 __label_3: # endif
# }
    goto __label_1
 __label_2: # endfor
.annotate 'line', 2627
    unless $I2 goto __label_4
# {
.annotate 'line', 2628
    unless $I1 goto __label_5
# {
.annotate 'line', 2629
    null $I1
.annotate 'line', 2630
# saux: $S2
    set $S2, $S1
.annotate 'line', 2631
    set $S1, ''
.annotate 'line', 2632
    box $P2, $S2
    iter $P4, $P2
    set $P4, 0
 __label_6: # for iteration
    unless $P4 goto __label_7
    shift $S3, $P4
# {
.annotate 'line', 2633
    ne $S3, '\', __label_8
.annotate 'line', 2634
    set $S3, '\\'
 __label_8: # endif
.annotate 'line', 2635
    concat $S1, $S1, $S3
# }
    goto __label_6
 __label_7: # endfor
# }
 __label_5: # endif
.annotate 'line', 2638
# result: $S4
    set $S4, ''
.annotate 'line', 2639
# l: $I4
# predefined length
    length $I4, $S1
# for loop
.annotate 'line', 2640
# i: $I5
    null $I5
 __label_11: # for condition
    ge $I5, $I4, __label_10
# {
.annotate 'line', 2641
# c: $S5
# predefined substr
    substr $S5, $S1, $I5, 1
.annotate 'line', 2642
# n: $I6
# predefined ord
    ord $I6, $S5
.annotate 'line', 2643
    le $I6, 127, __label_12
# {
.annotate 'line', 2644
# h: $S6
    box $P5, $I6
    $P2 = $P5.'get_as_base'(16)
    null $S6
    if_null $P2, __label_14
    set $S6, $P2
 __label_14:
.annotate 'line', 2645
    concat $S4, $S4, '\x{'
    concat $S4, $S4, $S6
    concat $S4, $S4, '}'
# }
    goto __label_13
 __label_12: # else
.annotate 'line', 2648
    concat $S4, $S4, $S5
 __label_13: # endif
# }
 __label_9: # for iteration
.annotate 'line', 2640
    inc $I5
    goto __label_11
 __label_10: # for end
.annotate 'line', 2650
    set $S1, $S4
# }
 __label_4: # endif
.annotate 'line', 2652
# q: $S7
    unless $I1 goto __label_16
    set $S7, "'"
    goto __label_15
 __label_16:
    set $S7, '"'
 __label_15:
.annotate 'line', 2653
    concat $S0, $S7, $S1
    concat $S0, $S0, $S7
    set $S1, $S0
.annotate 'line', 2654
    unless $I2 goto __label_17
.annotate 'line', 2655
    concat $S0, 'unicode:', $S1
    set $S1, $S0
 __label_17: # endif
.annotate 'line', 2656
    .return($S1)
# }
.annotate 'line', 2657

.end # getPirString


.sub 'get_value' :method
# Body
# {
.annotate 'line', 2660
# var strtok: $P1
    getattribute $P1, self, 'strval'
.annotate 'line', 2661
# str: $S1
    getattribute $P3, $P1, 'str'
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 2662
    isa $I1, $P1, [ 'TokenQuoted' ]
    unless $I1 goto __label_1
# {
.annotate 'line', 2663
# var s: $P2
    box $P2, $S1
.annotate 'line', 2664
    $P3 = $P2.'unescape'('utf8')
    set $S1, $P3
# }
 __label_1: # endif
.annotate 'line', 2666
    .return($S1)
# }
.annotate 'line', 2667

.end # get_value


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2670
    set $S1, __ARG_2
    eq $S1, '', __label_0
.annotate 'line', 2671
    $P1 = self.'getPirString'()
    __ARG_1.'emitset'(__ARG_2, $P1)
 __label_0: # endif
# }
.annotate 'line', 2672

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2675
    .tailcall self.'getPirString'()
# }
.annotate 'line', 2676

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'StringLiteral' ]
.annotate 'line', 2605
    get_class $P1, [ 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 2607
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
.annotate 'line', 2688
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2689
    setattribute self, 'pos', __ARG_2
.annotate 'line', 2690
# n: $I1
    null $I1
.annotate 'line', 2691
    unless __ARG_4 goto __label_0
.annotate 'line', 2692
    set $I1, __ARG_3
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 2694
# aux: $S1
    set $P1, __ARG_2
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
 __label_2:
.annotate 'line', 2695
    set $I1, $S1
# }
 __label_1: # endif
.annotate 'line', 2697
    box $P1, $I1
    setattribute self, 'numval', $P1
# }
.annotate 'line', 2698

.end # IntegerLiteral


.sub 'isintegerliteral' :method
# Body
# {
.annotate 'line', 2699
    .return(1)
# }

.end # isintegerliteral


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2700
    .return('I')
# }

.end # checkresult


.sub 'getIntegerValue' :method
# Body
# {
.annotate 'line', 2703
# aux: $S1
    getattribute $P1, self, 'numval'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 2704
# i: $I1
    set $S2, $S1
    set $I1, $S2
.annotate 'line', 2705
    .return($I1)
# }
.annotate 'line', 2706

.end # getIntegerValue


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2709
    set $S1, __ARG_2
    eq $S1, '', __label_0
# {
.annotate 'line', 2710
# value: $I1
    $P1 = self.'getIntegerValue'()
    set $I1, $P1
.annotate 'line', 2711
    ne $I1, 0, __label_1
.annotate 'line', 2712
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_2
 __label_1: # else
.annotate 'line', 2714
    __ARG_1.'emitset'(__ARG_2, $I1)
 __label_2: # endif
# }
 __label_0: # endif
# }
.annotate 'line', 2716

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2719
    .tailcall self.'getIntegerValue'()
# }
.annotate 'line', 2720

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IntegerLiteral' ]
.annotate 'line', 2681
    get_class $P1, [ 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 2683
    addattribute $P0, 'pos'
.annotate 'line', 2684
    addattribute $P0, 'numval'
.end
.namespace [ 'FloatLiteral' ]

.sub 'FloatLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2730
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2731
    setattribute self, 'numval', __ARG_2
# }
.annotate 'line', 2732

.end # FloatLiteral


.sub 'isfloatliteral' :method
# Body
# {
.annotate 'line', 2733
    .return(1)
# }

.end # isfloatliteral


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2734
    .return('N')
# }

.end # checkresult


.sub 'getFloatValue' :method
# Body
# {
.annotate 'line', 2737
# aux: $S1
    getattribute $P2, self, 'numval'
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 2738
# var n: $P1
    new $P1, [ 'Float' ]
.annotate 'line', 2739
    assign $P1, $S1
.annotate 'line', 2740
    .return($P1)
# }
.annotate 'line', 2741

.end # getFloatValue


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2744
    set $S1, __ARG_2
    eq $S1, '', __label_0
# {
.annotate 'line', 2745
# var n: $P1
    $P1 = self.'getFloatValue'()
.annotate 'line', 2746
    __ARG_1.'emitset'(__ARG_2, $P1)
# }
 __label_0: # endif
# }
.annotate 'line', 2748

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2753
# aux: $S1
    getattribute $P1, self, 'numval'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 2754
# predefined indexof
    index $I1, $S1, '.'
    ge $I1, 0, __label_1
.annotate 'line', 2755
    concat $S1, $S1, '.0'
 __label_1: # endif
.annotate 'line', 2756
    .return($S1)
# }
.annotate 'line', 2757

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FloatLiteral' ]
.annotate 'line', 2725
    get_class $P1, [ 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 2727
    addattribute $P0, 'numval'
.end
.namespace [ 'IdentifierExpr' ]

.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 2765
    .return(1)
# }

.end # isidentifier


.sub 'IdentifierExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2768
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2769
    setattribute self, 'name', __ARG_2
# }
.annotate 'line', 2770

.end # IdentifierExpr


.sub 'isnull' :method
# Body
# {
.annotate 'line', 2773
    getattribute $P1, self, 'name'
    .tailcall $P1.'iskeyword'('null')
# }
.annotate 'line', 2774

.end # isnull


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2777
# var desc: $P1
    getattribute $P2, self, 'owner'
    getattribute $P3, self, 'name'
    $P1 = $P2.'getvar'($P3)
.annotate 'line', 2778
    if_null $P1, __label_0
.annotate 'line', 2779
    .tailcall $P1.'gettype'()
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 2781
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
.annotate 'line', 2784
    .return('P')
 __label_3: # default
.annotate 'line', 2786
    .return('')
 __label_2: # switch end
# }
 __label_1: # endif
# }
.annotate 'line', 2789

.end # checkresult


.sub 'getName' :method
# Body
# {
.annotate 'line', 2792
# s: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 2793
    .return($S1)
# }
.annotate 'line', 2794

.end # getName


.sub 'checkIdentifier' :method
# Body
# {
.annotate 'line', 2797
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 2798
    unless_null $P1, __label_0
.annotate 'line', 2799
    'InternalError'('Bad thing')
 __label_0: # endif
.annotate 'line', 2800
# var desc: $P2
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
.annotate 'line', 2801
# s: $S1
    null $S1
.annotate 'line', 2802
    unless_null $P2, __label_1
# {
.annotate 'line', 2803
# sname: $S2
    set $P3, $P1
    null $S2
    if_null $P3, __label_3
    set $S2, $P3
 __label_3:
.annotate 'line', 2804
    set $S3, $S2
    set $S4, 'self'
    if $S3 == $S4 goto __label_6
    set $S4, 'null'
    if $S3 == $S4 goto __label_7
    goto __label_5
# switch
 __label_6: # case
.annotate 'line', 2806
    set $S1, 'self'
    goto __label_4 # break
 __label_7: # case
.annotate 'line', 2808
    set $S1, 'null'
    goto __label_4 # break
 __label_5: # default
.annotate 'line', 2810
    set $S1, ''
 __label_4: # switch end
# }
    goto __label_2
 __label_1: # else
# {
.annotate 'line', 2814
    $P3 = $P2.'getid'()
    if_null $P3, __label_8
.annotate 'line', 2815
    .tailcall $P2.'getid'()
    goto __label_9
 __label_8: # else
.annotate 'line', 2817
    $P4 = $P2.'getreg'()
    set $S1, $P4
 __label_9: # endif
# }
 __label_2: # endif
.annotate 'line', 2819
    .return($S1)
# }
.annotate 'line', 2820

.end # checkIdentifier


.sub 'getIdentifier' :method
# Body
# {
.annotate 'line', 2823
# var value: $P1
    $P1 = self.'checkIdentifier'()
.annotate 'line', 2824
    set $S2, $P1
    ne $S2, '', __label_0
# {
.annotate 'line', 2825
# name: $S1
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
 __label_1:
.annotate 'line', 2826
    concat $S2, "Variable '", $S1
    concat $S2, $S2, "' is not defined"
    getattribute $P2, self, 'name'
    'SyntaxError'($S2, $P2)
# }
 __label_0: # endif
.annotate 'line', 2828
    .return($P1)
# }
.annotate 'line', 2829

.end # getIdentifier


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2832
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 2833
# var desc: $P2
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
.annotate 'line', 2834
    if_null $P2, __label_0
# {
.annotate 'line', 2835
    $I2 = $P2.'isconst'()
    unless $I2 goto __label_2
    $P3 = $P2.'getid'()
    isnull $I2, $P3
 __label_2:
    unless $I2 goto __label_1
.annotate 'line', 2836
    .tailcall $P2.'getvalue'()
 __label_1: # endif
.annotate 'line', 2837
# flags: $I1
    $P3 = $P2.'getflags'()
    set $I1, $P3
.annotate 'line', 2838
    band $I2, $I1, 1
    unless $I2 goto __label_3
# {
.annotate 'line', 2839
    band $I3, $I1, 2
    unless $I3 goto __label_4
.annotate 'line', 2840
    new $P4, [ 'LexicalVolatileExpr' ]
    $P4.'LexicalVolatileExpr'(self, $P2)
    set $P3, $P4
    .return($P3)
 __label_4: # endif
# }
 __label_3: # endif
# }
 __label_0: # endif
.annotate 'line', 2843
    .return(self)
# }
.annotate 'line', 2844

.end # optimize


.sub 'emit_getid' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2847
# id: $S1
    $P2 = self.'getIdentifier'()
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 2848
# var desc: $P1
    getattribute $P2, self, 'owner'
    getattribute $P3, self, 'name'
    $P1 = $P2.'getvar'($P3)
.annotate 'line', 2849
# flags: $I1
    unless_null $P1, __label_2
    null $I1
    goto __label_1
 __label_2:
    $I1 = $P1.'getflags'()
 __label_1:
.annotate 'line', 2850
    band $I2, $I1, 1
    unless $I2 goto __label_3
# {
.annotate 'line', 2851
    band $I3, $I1, 2
    unless $I3 goto __label_4
# {
.annotate 'line', 2852
# lexname: $S2
    $P2 = $P1.'getlex'()
    null $S2
    if_null $P2, __label_5
    set $S2, $P2
 __label_5:
.annotate 'line', 2853
    isnull $I2, $S2
    not $I2
    unless $I2 goto __label_7
    isne $I2, $S2, ''
 __label_7:
    unless $I2 goto __label_6
.annotate 'line', 2854
    __ARG_1.'emitfind_lex'($S1, $S2)
 __label_6: # endif
# }
 __label_4: # endif
# }
 __label_3: # endif
.annotate 'line', 2857
    .return($S1)
# }
.annotate 'line', 2858

.end # emit_getid


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2861
    set $S2, __ARG_2
    eq $S2, '', __label_0
# {
.annotate 'line', 2862
    self.'annotate'(__ARG_1)
.annotate 'line', 2863
# id: $S1
    $P1 = self.'emit_getid'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
 __label_1:
.annotate 'line', 2864
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
 __label_0: # endif
# }
.annotate 'line', 2866

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2869
    self.'annotate'(__ARG_1)
.annotate 'line', 2870
# id: $S1
    $P1 = self.'emit_getid'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 2871
    .return($S1)
# }
.annotate 'line', 2872

.end # emit_get


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2875
    self.'annotate'(__ARG_1)
.annotate 'line', 2876
    $P1 = self.'isnull'()
    if_null $P1, __label_0
    unless $P1 goto __label_0
# predefined die
.annotate 'line', 2877
    die "NO"
 __label_0: # endif
.annotate 'line', 2878
# typeleft: $S1
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
 __label_1:
.annotate 'line', 2879
# lreg: $S2
    $P1 = self.'getIdentifier'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
 __label_2:
.annotate 'line', 2880
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_3
    unless $P1 goto __label_3
# {
.annotate 'line', 2881
    set $S5, $S1
    set $S6, 'S'
    if $S5 == $S6 goto __label_7
    set $S6, 'P'
    if $S5 == $S6 goto __label_8
    goto __label_6
# switch
 __label_7: # case
 __label_8: # case
.annotate 'line', 2884
    __ARG_1.'emitnull'($S2)
    goto __label_5 # break
 __label_6: # default
.annotate 'line', 2887
    getattribute $P2, self, 'start'
    'SyntaxError'("Can't assign null to that type", $P2)
 __label_5: # switch end
# }
    goto __label_4
 __label_3: # else
.annotate 'line', 2890
    isa $I1, __ARG_2, [ 'IndexExpr' ]
    unless $I1 goto __label_9
.annotate 'line', 2891
    __ARG_2.'emit'(__ARG_1, $S2)
    goto __label_10
 __label_9: # else
# {
.annotate 'line', 2893
# typeright: $S3
    $P1 = __ARG_2.'checkresult'()
    null $S3
    if_null $P1, __label_11
    set $S3, $P1
 __label_11:
.annotate 'line', 2894
    ne $S3, 'v', __label_12
.annotate 'line', 2895
    getattribute $P1, self, 'start'
    'SyntaxError'("Can't assign from void expression", $P1)
 __label_12: # endif
.annotate 'line', 2896
    ne $S1, $S3, __label_13
# {
.annotate 'line', 2897
    __ARG_2.'emit'(__ARG_1, $S2)
# }
    goto __label_14
 __label_13: # else
# {
.annotate 'line', 2900
# rreg: $S4
    $P1 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P1, __label_15
    set $S4, $P1
 __label_15:
.annotate 'line', 2901
    self.'annotate'(__ARG_1)
.annotate 'line', 2902
    iseq $I1, $S1, 'P'
    unless $I1 goto __label_18
    isne $I1, $S3, 'P'
 __label_18:
    unless $I1 goto __label_16
.annotate 'line', 2903
    __ARG_1.'emitbox'($S2, $S4)
    goto __label_17
 __label_16: # else
.annotate 'line', 2905
    __ARG_1.'emitset'($S2, $S4)
 __label_17: # endif
# }
 __label_14: # endif
# }
 __label_10: # endif
 __label_4: # endif
.annotate 'line', 2908
    .return($S2)
# }
.annotate 'line', 2909

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IdentifierExpr' ]
.annotate 'line', 2762
    get_class $P1, [ 'SimpleExpr' ]
    addparent $P0, $P1
.annotate 'line', 2764
    addattribute $P0, 'name'
.end
.namespace [ 'LexicalVolatileExpr' ]

.sub 'LexicalVolatileExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2919
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 2920
    setattribute self, 'desc', __ARG_2
# }
.annotate 'line', 2921

.end # LexicalVolatileExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2922
    .return('P')
# }

.end # checkresult


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2925
# var desc: $P1
    getattribute $P1, self, 'desc'
.annotate 'line', 2926
# lexname: $S1
    $P2 = $P1.'getlex'()
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 2927
# reg: $S2
    getattribute $P3, self, 'owner'
    $P2 = $P3.'tempreg'('P')
    null $S2
    if_null $P2, __label_1
    set $S2, $P2
 __label_1:
.annotate 'line', 2928
    __ARG_1.'emitfind_lex'($S2, $S1)
.annotate 'line', 2929
    .return($S2)
# }
.annotate 'line', 2930

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2933
    set $S2, __ARG_2
    eq $S2, '', __label_0
# {
.annotate 'line', 2934
    self.'annotate'(__ARG_1)
.annotate 'line', 2935
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
 __label_1:
.annotate 'line', 2936
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
 __label_0: # endif
# }
.annotate 'line', 2938

.end # emit


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2941
# lreg: $S1
    getattribute $P3, self, 'owner'
    $P2 = $P3.'tempreg'('P')
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 2942
    $P2 = __ARG_2.'isnull'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 2943
    __ARG_1.'emitnull'($S1)
    goto __label_2
 __label_1: # else
.annotate 'line', 2944
    isa $I1, __ARG_2, [ 'IndexExpr' ]
    unless $I1 goto __label_3
.annotate 'line', 2945
    __ARG_2.'emit'(__ARG_1, $S1)
    goto __label_4
 __label_3: # else
# {
.annotate 'line', 2947
# typeright: $S2
    $P3 = __ARG_2.'checkresult'()
    null $S2
    if_null $P3, __label_5
    set $S2, $P3
 __label_5:
.annotate 'line', 2948
    ne 'P', $S2, __label_6
# {
.annotate 'line', 2949
    __ARG_2.'emit'(__ARG_1, $S1)
# }
    goto __label_7
 __label_6: # else
# {
.annotate 'line', 2952
# rreg: $S3
    $P2 = __ARG_2.'emit_get'(__ARG_1)
    null $S3
    if_null $P2, __label_8
    set $S3, $P2
 __label_8:
.annotate 'line', 2953
    self.'annotate'(__ARG_1)
.annotate 'line', 2954
    __ARG_1.'emitbox'($S1, $S3)
# }
 __label_7: # endif
# }
 __label_4: # endif
 __label_2: # endif
.annotate 'line', 2958
# var desc: $P1
    getattribute $P1, self, 'desc'
.annotate 'line', 2959
# lexname: $S4
    $P2 = $P1.'getlex'()
    null $S4
    if_null $P2, __label_9
    set $S4, $P2
 __label_9:
.annotate 'line', 2960
    __ARG_1.'say'("store_lex '", $S4, "', ", $S1)
# }
.annotate 'line', 2961

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'LexicalVolatileExpr' ]
.annotate 'line', 2914
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 2916
    addattribute $P0, 'desc'
.end
.namespace [ 'OpExpr' ]

.sub 'initop' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2970
    self.'Expr'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2971

.end # initop

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpExpr' ]
.annotate 'line', 2966
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
.annotate 'line', 2982
    self.'initop'(__ARG_2, __ARG_3)
.annotate 'line', 2983
    $P2 = 'parseClassSpecifier'(__ARG_1, __ARG_2)
    setattribute self, 'clspec', $P2
# }
.annotate 'line', 2984

.end # OpClassExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2985
    .return('P')
# }

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2988
# var clspec: $P1
    getattribute $P1, self, 'clspec'
.annotate 'line', 2991
    set $S1, __ARG_2
    ne $S1, '', __label_0
.annotate 'line', 2992
    getattribute $P2, self, 'owner'
    __ARG_2 = $P2.'tempreg'('P')
 __label_0: # endif
.annotate 'line', 2993
    __ARG_1.'print'('    get_class ', __ARG_2, ', ')
.annotate 'line', 2994
    getattribute $P2, self, 'owner'
    $P1.'emit'(__ARG_1, $P2)
.annotate 'line', 2995
    __ARG_1.'say'()
# }
.annotate 'line', 2996

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpClassExpr' ]
.annotate 'line', 2976
    get_class $P1, [ 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 2978
    addattribute $P0, 'clspec'
.end
.namespace [ 'OpUnaryExpr' ]

.sub 'OpUnaryExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3006
    self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 3007
    setattribute self, 'subexpr', __ARG_3
# }
.annotate 'line', 3008

.end # OpUnaryExpr


.sub 'optimizearg' :method
# Body
# {
.annotate 'line', 3011
    getattribute $P3, self, 'subexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'subexpr', $P2
# }
.annotate 'line', 3012

.end # optimizearg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3015
    self.'optimizearg'()
.annotate 'line', 3016
    .return(self)
# }
.annotate 'line', 3017

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpUnaryExpr' ]
.annotate 'line', 3001
    get_class $P1, [ 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3003
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
.annotate 'line', 3028
    self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 3029
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 3030
    setattribute self, 'rexpr', __ARG_4
# }
.annotate 'line', 3031

.end # initbinary


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 3034
    self.'initbinary'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 3035
    .return(self)
# }
.annotate 'line', 3036

.end # set


.sub 'setfrom' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3039
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    getattribute $P3, __ARG_1, 'lexpr'
    getattribute $P4, __ARG_1, 'rexpr'
    .tailcall self.'set'($P1, $P2, $P3, $P4)
# }
.annotate 'line', 3040

.end # setfrom


.sub 'optimizearg' :method
# Body
# {
.annotate 'line', 3043
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 3044
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'rexpr', $P2
# }
.annotate 'line', 3045

.end # optimizearg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3048
    self.'optimizearg'()
.annotate 'line', 3049
    .return(self)
# }
.annotate 'line', 3050

.end # optimize


.sub 'emit_intleft' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3053
# reg: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_getint'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3054
    .return($S1)
# }
.annotate 'line', 3055

.end # emit_intleft


.sub 'emit_intright' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3058
# reg: $S1
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_getint'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3059
    .return($S1)
# }
.annotate 'line', 3060

.end # emit_intright

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBinaryExpr' ]
.annotate 'line', 3022
    get_class $P1, [ 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3024
    addattribute $P0, 'lexpr'
.annotate 'line', 3025
    addattribute $P0, 'rexpr'
.end
.namespace [ 'OpBinaryIntExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3069
    .return('I')
# }
.annotate 'line', 3070

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3073
    self.'optimizearg'()
.annotate 'line', 3074
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3075
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3076
    $I3 = $P1.'isintegerliteral'()
    unless $I3 goto __label_1
    $I3 = $P2.'isintegerliteral'()
 __label_1:
    unless $I3 goto __label_0
# {
.annotate 'line', 3077
# li: $I1
# predefined int
    getattribute $P3, $P1, 'numval'
    set $I1, $P3
.annotate 'line', 3078
# ri: $I2
# predefined int
    getattribute $P3, $P2, 'numval'
    set $I2, $P3
.annotate 'line', 3079
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P5 = self.'do_op'($I1, $I2)
    .tailcall 'integerValue'($P3, $P4, $P5)
# }
 __label_0: # endif
.annotate 'line', 3081
    .return(self)
# }
.annotate 'line', 3082

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBinaryIntExpr' ]
.annotate 'line', 3065
    get_class $P1, [ 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpDelExBase' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3091
    .return('I')
# }
.annotate 'line', 3092

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpDelExBase' ]
.annotate 'line', 3087
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
.annotate 'line', 3100
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3101

.end # OpDeleteExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3104
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3105
    isa $I1, $P1, [ 'IndexExpr' ]
    unless $I1 goto __label_2
    $P2 = $P1.'checkresult'()
    set $S1, $P2
    isne $I1, $S1, 'S'
 __label_2:
    unless $I1 goto __label_0
# {
.annotate 'line', 3106
    $P1.'emit_prep'(__ARG_1)
.annotate 'line', 3107
    self.'annotate'(__ARG_1)
.annotate 'line', 3108
    __ARG_1.'print'('    delete ')
.annotate 'line', 3109
    $P1.'emit_aux'(__ARG_1)
.annotate 'line', 3110
    __ARG_1.'say'()
.annotate 'line', 3111
    set $S1, __ARG_2
    eq $S1, '', __label_3
.annotate 'line', 3112
    __ARG_1.'emitset'(__ARG_2, '1')
 __label_3: # endif
# }
    goto __label_1
 __label_0: # else
.annotate 'line', 3115
    getattribute $P2, self, 'start'
    'SyntaxError'("delete with invalid operator", $P2)
 __label_1: # endif
# }
.annotate 'line', 3116

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpDeleteExpr' ]
.annotate 'line', 3096
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
.annotate 'line', 3123
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3124

.end # OpExistsExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3127
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3128
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
.annotate 'line', 3129
    isa $I1, $P1, [ 'IndexExpr' ]
    unless $I1 goto __label_5
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    isne $I1, $S2, 'S'
 __label_5:
    unless $I1 goto __label_3
# {
.annotate 'line', 3130
    $P1.'emit_prep'(__ARG_1)
.annotate 'line', 3131
    self.'annotate'(__ARG_1)
.annotate 'line', 3132
    __ARG_1.'print'('    exists ', $S1, ', ')
.annotate 'line', 3133
    $P1.'emit_aux'(__ARG_1)
.annotate 'line', 3134
    __ARG_1.'say'()
# }
    goto __label_4
 __label_3: # else
.annotate 'line', 3137
    getattribute $P2, self, 'start'
    'SyntaxError'("exists with invalid operator", $P2)
 __label_4: # endif
# }
.annotate 'line', 3138

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3141
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3142
# reg: $S1
    $P2 = self.'tempreg'('I')
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 3143
    isa $I1, $P1, [ 'IndexExpr' ]
    unless $I1 goto __label_3
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    isne $I1, $S2, 'S'
 __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 3144
    $P1.'emit_prep'(__ARG_1)
.annotate 'line', 3145
    self.'annotate'(__ARG_1)
.annotate 'line', 3146
    __ARG_1.'print'('    exists ', $S1, ', ')
.annotate 'line', 3147
    $P1.'emit_aux'(__ARG_1)
.annotate 'line', 3148
    __ARG_1.'say'()
.annotate 'line', 3149
    .return($S1)
# }
    goto __label_2
 __label_1: # else
.annotate 'line', 3152
    getattribute $P2, self, 'start'
    'SyntaxError'("exists with invalid operator", $P2)
 __label_2: # endif
# }
.annotate 'line', 3153

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpExistsExpr' ]
.annotate 'line', 3119
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
.annotate 'line', 3162
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3163

.end # OpUnaryMinusExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3166
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3167

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3170
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3171
    .return(self)
# }
.annotate 'line', 3172

.end # set


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3175
    self.'optimizearg'()
.annotate 'line', 3176
    getattribute $P4, self, 'subexpr'
    $P3 = $P4.'isintegerliteral'()
    if_null $P3, __label_0
    unless $P3 goto __label_0
# {
.annotate 'line', 3177
# var numval: $P1
    getattribute $P5, self, 'subexpr'
    getattribute $P1, $P5, 'numval'
.annotate 'line', 3178
# i: $I1
    set $P3, $P1
    set $I1, $P3
.annotate 'line', 3179
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'subexpr'
    getattribute $P5, $P4, 'start'
    neg $I2, $I1
    .tailcall 'integerValue'($P3, $P5, $I2)
# }
 __label_0: # endif
# {
.annotate 'line', 3182
    getattribute $P4, self, 'subexpr'
    $P3 = $P4.'isfloatliteral'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 3183
# var numval: $P2
    getattribute $P5, self, 'subexpr'
    getattribute $P2, $P5, 'numval'
.annotate 'line', 3184
# n: $N1
# predefined string
    set $S1, $P2
    set $N1, $S1
.annotate 'line', 3185
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'subexpr'
    getattribute $P5, $P4, 'start'
    neg $N2, $N1
    .tailcall 'floatValue'($P3, $P5, $N2)
# }
 __label_1: # endif
# }
.annotate 'line', 3188
    .return(self)
# }
.annotate 'line', 3189

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3192
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3193
    self.'annotate'(__ARG_1)
.annotate 'line', 3194
    __ARG_1.'emitarg2'('neg', __ARG_2, $S1)
# }
.annotate 'line', 3195

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpUnaryMinusExpr' ]
.annotate 'line', 3158
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
.annotate 'line', 3204
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3205

.end # OpNotExpr


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3206
    .return(1)
# }

.end # isnegable


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3209
    .return('I')
# }
.annotate 'line', 3210

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3213
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3214
    .return(self)
# }
.annotate 'line', 3215

.end # set


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3218
    self.'optimizearg'()
.annotate 'line', 3219
# var subexpr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3220
    $P3 = $P1.'isintegerliteral'()
    if_null $P3, __label_0
    unless $P3 goto __label_0
# {
.annotate 'line', 3221
# var numval: $P2
    getattribute $P2, $P1, 'numval'
.annotate 'line', 3222
# n: $I1
    set $P3, $P2
    set $I1, $P3
.annotate 'line', 3223
    getattribute $P3, self, 'owner'
    getattribute $P4, $P1, 'start'
    not $I2, $I1
    .tailcall 'integerValue'($P3, $P4, $I2)
# }
 __label_0: # endif
.annotate 'line', 3225
    $P3 = $P1.'isnegable'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 3226
    .tailcall $P1.'negated'()
 __label_1: # endif
.annotate 'line', 3227
    .return(self)
# }
.annotate 'line', 3228

.end # optimize


.sub 'negated' :method
# Body
# {
.annotate 'line', 3231
    getattribute $P1, self, 'subexpr'
    .return($P1)
# }
.annotate 'line', 3232

.end # negated


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3235
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3236
    self.'annotate'(__ARG_1)
.annotate 'line', 3237
# type: $S2
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 3238
    set $S3, $S2
    set $S4, 'I'
    if $S3 == $S4 goto __label_4
    set $S4, 'P'
    if $S3 == $S4 goto __label_5
    goto __label_3
# switch
 __label_4: # case
.annotate 'line', 3240
    __ARG_1.'emitarg2'('not', __ARG_2, $S1)
    goto __label_2 # break
 __label_5: # case
.annotate 'line', 3243
    __ARG_1.'emitarg2'('isfalse', __ARG_2, $S1)
    goto __label_2 # break
 __label_3: # default
.annotate 'line', 3246
    __ARG_1.'emitarg2'('isfalse', __ARG_2, $S1)
 __label_2: # switch end
# }
.annotate 'line', 3248

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpNotExpr' ]
.annotate 'line', 3200
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
.annotate 'line', 3257
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3258

.end # OpPreIncExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3261
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3262

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3265
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3266
    setattribute self, 'subexpr', __ARG_3
.annotate 'line', 3267
    .return(self)
# }
.annotate 'line', 3268

.end # set


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3271
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3272
    set $S2, __ARG_2
    eq $S2, '', __label_1
.annotate 'line', 3273
    __ARG_1.'emitset'(__ARG_2, $S1)
 __label_1: # endif
# }
.annotate 'line', 3274

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3277
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3278
    self.'annotate'(__ARG_1)
.annotate 'line', 3279
    __ARG_1.'emitinc'($S1)
.annotate 'line', 3280
    .return($S1)
# }
.annotate 'line', 3281

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpPreIncExpr' ]
.annotate 'line', 3253
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
.annotate 'line', 3290
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3291
    .return(self)
# }
.annotate 'line', 3292

.end # OpPostIncExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3295
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3296

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3299
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3300
    self.'annotate'(__ARG_1)
.annotate 'line', 3301
    set $S2, __ARG_2
    eq $S2, '', __label_1
.annotate 'line', 3302
    __ARG_1.'emitset'(__ARG_2, $S1)
 __label_1: # endif
.annotate 'line', 3303
    __ARG_1.'emitinc'($S1)
.annotate 'line', 3304
    .return($S1)
# }
.annotate 'line', 3305

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpPostIncExpr' ]
.annotate 'line', 3286
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
.annotate 'line', 3314
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3315

.end # OpPreDecExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3318
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3319

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3322
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3323
    .return(self)
# }
.annotate 'line', 3324

.end # set


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3327
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3328
    set $S2, __ARG_2
    eq $S2, '', __label_1
.annotate 'line', 3329
    __ARG_1.'emitset'(__ARG_2, $S1)
 __label_1: # endif
# }
.annotate 'line', 3330

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3333
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3334
    self.'annotate'(__ARG_1)
.annotate 'line', 3335
    __ARG_1.'emitdec'($S1)
.annotate 'line', 3336
    .return($S1)
# }
.annotate 'line', 3337

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpPreDecExpr' ]
.annotate 'line', 3310
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
.annotate 'line', 3346
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3347
    .return(self)
# }
.annotate 'line', 3348

.end # OpPostDecExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3351
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3352

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3355
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3356
    self.'annotate'(__ARG_1)
.annotate 'line', 3357
    set $S2, __ARG_2
    eq $S2, '', __label_1
.annotate 'line', 3358
    __ARG_1.'emitset'(__ARG_2, $S1)
 __label_1: # endif
.annotate 'line', 3359
    __ARG_1.'emitdec'($S1)
.annotate 'line', 3360
    .return($S1)
# }
.annotate 'line', 3361

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpPostDecExpr' ]
.annotate 'line', 3342
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
.annotate 'line', 3372
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3373
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 3374
    setattribute self, 'rexpr', __ARG_4
.annotate 'line', 3375
    .return(self)
# }
.annotate 'line', 3376

.end # set


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3379
    getattribute $P1, self, 'lexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3380

.end # checkresult


.sub 'optimize_base' :method
# Body
# {
.annotate 'line', 3383
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 3384
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'rexpr', $P2
.annotate 'line', 3385
    .return(self)
# }
.annotate 'line', 3386

.end # optimize_base


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3389
    .tailcall self.'optimize_base'()
# }
.annotate 'line', 3390

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3393
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3394
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 3395
    self.'annotate'(__ARG_1)
.annotate 'line', 3396
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
 __label_1: # endif
# }
.annotate 'line', 3398

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBaseAssignExpr' ]
.annotate 'line', 3366
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3368
    addattribute $P0, 'lexpr'
.annotate 'line', 3369
    addattribute $P0, 'rexpr'
.end
.namespace [ 'OpAssignExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3407
    self.'annotate'(__ARG_1)
.annotate 'line', 3408
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3409
    getattribute $P2, self, 'rexpr'
    .tailcall $P1.'emit_assign_get'(__ARG_1, $P2)
# }
.annotate 'line', 3410

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpAssignExpr' ]
.annotate 'line', 3403
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpAssignToExpr' ]

.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3419
    self.'annotate'(__ARG_1)
.annotate 'line', 3420
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3421
    isnull $I1, __ARG_2
    not $I1
    unless $I1 goto __label_2
    set $S2, __ARG_2
    isne $I1, $S2, ''
 __label_2:
    unless $I1 goto __label_1
.annotate 'line', 3422
    __ARG_1.'emitassign'(__ARG_2, $S1)
 __label_1: # endif
# }
.annotate 'line', 3423

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3426
    self.'annotate'(__ARG_1)
.annotate 'line', 3427
# reg: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3428
# reg2: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 3429
    __ARG_1.'emitassign'($S1, $S2)
.annotate 'line', 3430
    .return($S1)
# }
.annotate 'line', 3431

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpAssignToExpr' ]
.annotate 'line', 3415
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpAddToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3440
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3441
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3442
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 3443
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_1
    set $S2, $P3
 __label_1:
.annotate 'line', 3444
# reg: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_2
    set $S3, $P3
 __label_2:
.annotate 'line', 3445
    iseq $I1, $S1, 'S'
    unless $I1 goto __label_5
    isa $I1, $P2, [ 'ConcatString' ]
 __label_5:
    unless $I1 goto __label_3
.annotate 'line', 3446
    $P2.'emit_concat_to'(__ARG_1, $S3)
    goto __label_4
 __label_3: # else
# {
.annotate 'line', 3448
# reg2: $S4
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_6
    set $S4, $P3
 __label_6:
.annotate 'line', 3449
# aux: $S5
    null $S5
.annotate 'line', 3450
    self.'annotate'(__ARG_1)
.annotate 'line', 3451
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
.annotate 'line', 3453
    eq $S2, 'S', __label_12
# {
.annotate 'line', 3454
    $P3 = self.'tempreg'('S')
    set $S5, $P3
.annotate 'line', 3455
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3456
    set $S4, $S5
# }
 __label_12: # endif
.annotate 'line', 3458
    __ARG_1.'emitconcat1'($S3, $S4)
    goto __label_7 # break
 __label_10: # case
 __label_11: # case
.annotate 'line', 3462
    eq $S1, $S2, __label_13
# {
.annotate 'line', 3463
    $P3 = self.'tempreg'($S1)
    set $S5, $P3
.annotate 'line', 3464
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3465
    set $S4, $S5
# }
 __label_13: # endif
.annotate 'line', 3467
    __ARG_1.'emitaddto'($S3, $S4)
    goto __label_7 # break
 __label_8: # default
.annotate 'line', 3470
    __ARG_1.'emitaddto'($S3, $S4)
 __label_7: # switch end
# }
 __label_4: # endif
.annotate 'line', 3473
    .return($S3)
# }
.annotate 'line', 3474

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpAddToExpr' ]
.annotate 'line', 3436
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpSubToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3483
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3484
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3485
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 3486
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_1
    set $S2, $P3
 __label_1:
.annotate 'line', 3487
# reg: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_2
    set $S3, $P3
 __label_2:
.annotate 'line', 3488
# reg2: $S4
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_3
    set $S4, $P3
 __label_3:
.annotate 'line', 3489
# aux: $S5
    null $S5
.annotate 'line', 3490
    self.'annotate'(__ARG_1)
.annotate 'line', 3491
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
.annotate 'line', 3493
    getattribute $P3, self, 'start'
    'SyntaxError'("-= can't be applied to string", $P3)
 __label_7: # case
 __label_8: # case
.annotate 'line', 3496
    eq $S1, $S2, __label_9
# {
.annotate 'line', 3497
    $P4 = self.'tempreg'($S1)
    set $S5, $P4
.annotate 'line', 3498
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3499
    set $S4, $S5
# }
 __label_9: # endif
.annotate 'line', 3501
    __ARG_1.'emitsubto'($S3, $S4)
    goto __label_4 # break
 __label_5: # default
.annotate 'line', 3504
    __ARG_1.'emitsubto'($S3, $S4)
 __label_4: # switch end
.annotate 'line', 3506
    .return($S3)
# }
.annotate 'line', 3507

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpSubToExpr' ]
.annotate 'line', 3479
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpMulToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3516
# ltype: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3517
# rtype: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 3518
# lreg: $S3
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_2
    set $S3, $P1
 __label_2:
.annotate 'line', 3519
# rreg: $S4
    null $S4
.annotate 'line', 3520
    set $S5, $S1
    set $S6, 'S'
    if $S5 == $S6 goto __label_5
    goto __label_4
# switch
 __label_5: # case
.annotate 'line', 3522
    ne $S2, 'I', __label_6
.annotate 'line', 3523
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    set $S4, $P1
    goto __label_7
 __label_6: # else
# {
.annotate 'line', 3525
    $P3 = self.'tempreg'('I')
    set $S4, $P3
.annotate 'line', 3526
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S4)
# }
 __label_7: # endif
.annotate 'line', 3528
    self.'annotate'(__ARG_1)
.annotate 'line', 3529
    __ARG_1.'emitrepeat'($S3, $S3, $S4)
    goto __label_3 # break
 __label_4: # default
.annotate 'line', 3532
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    set $S4, $P1
.annotate 'line', 3533
    self.'annotate'(__ARG_1)
.annotate 'line', 3534
    __ARG_1.'emitarg2'('mul', $S3, $S4)
 __label_3: # switch end
.annotate 'line', 3536
    .return($S3)
# }
.annotate 'line', 3537

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpMulToExpr' ]
.annotate 'line', 3512
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpDivToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3546
# type: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3547
# reg: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 3548
# reg2: $S3
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_2
    set $S3, $P1
 __label_2:
.annotate 'line', 3549
    self.'annotate'(__ARG_1)
.annotate 'line', 3550
    __ARG_1.'emitarg2'('div', $S2, $S3)
.annotate 'line', 3551
    .return($S2)
# }
.annotate 'line', 3552

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpDivToExpr' ]
.annotate 'line', 3542
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpModToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3561
# type: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3562
# reg: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 3563
# reg2: $S3
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_2
    set $S3, $P1
 __label_2:
.annotate 'line', 3564
    self.'annotate'(__ARG_1)
.annotate 'line', 3565
    __ARG_1.'emitarg2'('mod', $S2, $S3)
.annotate 'line', 3566
    .return($S2)
# }
.annotate 'line', 3567

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpModToExpr' ]
.annotate 'line', 3557
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'ComparatorBaseExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3574
    .return('I')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3577
    self.'optimizearg'()
.annotate 'line', 3578
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3579
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3580
    $I3 = $P1.'isintegerliteral'()
    unless $I3 goto __label_1
    $I3 = $P2.'isintegerliteral'()
 __label_1:
    unless $I3 goto __label_0
# {
.annotate 'line', 3581
# li: $I1
# predefined int
    getattribute $P3, $P1, 'numval'
    set $I1, $P3
.annotate 'line', 3582
# ri: $I2
# predefined int
    getattribute $P3, $P2, 'numval'
    set $I2, $P3
.annotate 'line', 3583
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P5 = self.'int_op'($I1, $I2)
    .tailcall 'integerValue'($P3, $P4, $P5)
# }
 __label_0: # endif
.annotate 'line', 3585
    .return(self)
# }
.annotate 'line', 3586

.end # optimize


.sub 'emit_comparator' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 3589
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3590
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 3591
# regl: $S3
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_2
    set $S3, $P1
 __label_2:
.annotate 'line', 3592
# regr: $S4
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P1, __label_3
    set $S4, $P1
 __label_3:
.annotate 'line', 3593
    self.'annotate'(__ARG_1)
.annotate 'line', 3594
# aux: $S5
    null $S5
.annotate 'line', 3595
    iseq $I1, $S1, 'N'
    if $I1 goto __label_6
    iseq $I1, $S2, 'N'
 __label_6:
    unless $I1 goto __label_4
# {
.annotate 'line', 3597
    ne $S1, 'I', __label_7
# {
.annotate 'line', 3598
    $P1 = self.'tempreg'('N')
    set $S5, $P1
.annotate 'line', 3599
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3600
    set $S3, $S5
# }
 __label_7: # endif
.annotate 'line', 3602
    ne $S2, 'I', __label_8
# {
.annotate 'line', 3603
    $P1 = self.'tempreg'('N')
    set $S5, $P1
.annotate 'line', 3604
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3605
    set $S4, $S5
# }
 __label_8: # endif
# }
    goto __label_5
 __label_4: # else
.annotate 'line', 3608
    iseq $I1, $S2, 'I'
    unless $I1 goto __label_11
    iseq $I1, $S1, 'P'
 __label_11:
    unless $I1 goto __label_9
# {
.annotate 'line', 3609
    $P1 = self.'tempreg'('I')
    set $S5, $P1
.annotate 'line', 3610
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3611
    set $S3, $S5
# }
    goto __label_10
 __label_9: # else
.annotate 'line', 3613
    iseq $I1, $S2, 'P'
    unless $I1 goto __label_14
    iseq $I1, $S1, 'I'
 __label_14:
    unless $I1 goto __label_12
# {
.annotate 'line', 3614
    $P1 = self.'tempreg'('I')
    set $S5, $P1
.annotate 'line', 3615
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3616
    set $S4, $S5
# }
    goto __label_13
 __label_12: # else
.annotate 'line', 3618
    iseq $I1, $S2, 'S'
    unless $I1 goto __label_17
    iseq $I1, $S1, 'P'
 __label_17:
    unless $I1 goto __label_15
# {
.annotate 'line', 3619
    $P1 = self.'tempreg'('S')
    set $S5, $P1
.annotate 'line', 3620
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3621
    set $S3, $S5
# }
    goto __label_16
 __label_15: # else
.annotate 'line', 3623
    iseq $I1, $S2, 'P'
    unless $I1 goto __label_19
    iseq $I1, $S1, 'S'
 __label_19:
    unless $I1 goto __label_18
# {
.annotate 'line', 3624
    $P1 = self.'tempreg'('S')
    set $S5, $P1
.annotate 'line', 3625
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3626
    set $S4, $S5
# }
 __label_18: # endif
 __label_16: # endif
 __label_13: # endif
 __label_10: # endif
 __label_5: # endif
.annotate 'line', 3629
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
.annotate 'line', 3631
    self.'emitop'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_20 # break
 __label_23: # case
.annotate 'line', 3634
    self.'emitop_if'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_20 # break
 __label_24: # case
.annotate 'line', 3637
    self.'emitop_else'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_20 # break
 __label_21: # default
 __label_20: # switch end
.annotate 'line', 3638
# }
.annotate 'line', 3640

.end # emit_comparator


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3643
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3644

.end # emit


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 3647
    self.'emit_comparator'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 3648

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 3651
    self.'emit_comparator'(__ARG_1, __ARG_2, 2)
# }
.annotate 'line', 3652

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ComparatorBaseExpr' ]
.annotate 'line', 3572
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
.annotate 'line', 3667
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 3668
    setattribute self, 'expr', __ARG_2
.annotate 'line', 3669
    box $P1, __ARG_3
    setattribute self, 'checknull', $P1
# }
.annotate 'line', 3670

.end # NullCheckerExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3671
    .return('I')
# }

.end # checkresult


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3672
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3675
# checkneg: $I1
    getattribute $P1, self, 'checknull'
    isfalse $I1, $P1
.annotate 'line', 3676
    box $P1, $I1
    setattribute self, 'checknull', $P1
.annotate 'line', 3677
    .return(self)
# }
.annotate 'line', 3678

.end # negated


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3681
# reg: $S1
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3682
    self.'annotate'(__ARG_1)
.annotate 'line', 3683
    __ARG_1.'emitarg2'('isnull', __ARG_2, $S1)
.annotate 'line', 3684
    getattribute $P1, self, 'checknull'
    isfalse $I1, $P1
    unless $I1 goto __label_1
.annotate 'line', 3685
    __ARG_1.'emitarg1'('not', __ARG_2)
 __label_1: # endif
# }
.annotate 'line', 3686

.end # emit


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 3689
# reg: $S1
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 3690
    self.'annotate'(__ARG_1)
.annotate 'line', 3691
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
.annotate 'line', 3692

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NullCheckerExpr' ]
.annotate 'line', 3660
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3662
    addattribute $P0, 'expr'
.annotate 'line', 3663
    addattribute $P0, 'checknull'
.end
.namespace [ 'OpEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3699
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3702
    new $P1, [ 'OpNotEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3703

.end # negated


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3706
    self.'optimizearg'()
.annotate 'line', 3707
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3708
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3709
# lnull: $I1
    $P3 = $P1.'isnull'()
    set $I1, $P3
.annotate 'line', 3710
# rnull: $I2
    $P3 = $P2.'isnull'()
    set $I2, $P3
.annotate 'line', 3711
    unless $I1 goto __label_0
# {
.annotate 'line', 3712
    unless $I2 goto __label_1
.annotate 'line', 3713
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall 'integerValue'($P3, $P4, 1)
    goto __label_2
 __label_1: # else
.annotate 'line', 3715
    new $P6, [ 'NullCheckerExpr' ]
    getattribute $P7, self, 'rexpr'
    $P6.'NullCheckerExpr'(self, $P7, 1)
    set $P5, $P6
    .return($P5)
 __label_2: # endif
# }
 __label_0: # endif
.annotate 'line', 3717
    unless $I2 goto __label_3
.annotate 'line', 3718
    new $P4, [ 'NullCheckerExpr' ]
    getattribute $P5, self, 'lexpr'
    $P4.'NullCheckerExpr'(self, $P5, 1)
    set $P3, $P4
    .return($P3)
 __label_3: # endif
.annotate 'line', 3719
    $I5 = $P1.'isliteral'()
    unless $I5 goto __label_5
    $I5 = $P2.'isliteral'()
 __label_5:
    unless $I5 goto __label_4
# {
.annotate 'line', 3720
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_6
    set $S1, $P3
 __label_6:
.annotate 'line', 3721
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_7
    set $S2, $P3
 __label_7:
.annotate 'line', 3722
    ne $S1, $S2, __label_8
# {
.annotate 'line', 3723
    set $S5, $S1
    set $S6, 'I'
    if $S5 == $S6 goto __label_11
    set $S6, 'S'
    if $S5 == $S6 goto __label_12
    goto __label_10
# switch
 __label_11: # case
.annotate 'line', 3725
# li: $I3
# predefined int
    getattribute $P3, $P1, 'numval'
    set $I3, $P3
.annotate 'line', 3726
# ri: $I4
# predefined int
    getattribute $P4, $P2, 'numval'
    set $I4, $P4
.annotate 'line', 3727
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    iseq $I5, $I3, $I4
    .tailcall 'integerValue'($P5, $P6, $I5)
 __label_12: # case
.annotate 'line', 3729
# ls: $S3
    getattribute $P8, $P1, 'strval'
    getattribute $P7, $P8, 'str'
    null $S3
    if_null $P7, __label_13
    set $S3, $P7
 __label_13:
.annotate 'line', 3730
# rs: $S4
    getattribute $P10, $P2, 'strval'
    getattribute $P9, $P10, 'str'
    null $S4
    if_null $P9, __label_14
    set $S4, $P9
 __label_14:
.annotate 'line', 3731
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
.annotate 'line', 3735
    .return(self)
# }
.annotate 'line', 3736

.end # optimize


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3739
    __ARG_1.'emitbinop'('iseq', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3740

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3743
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3744

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3747
    __ARG_1.'emitcompare'('eq', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3748

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3751
    __ARG_1.'emitcompare'('ne', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3752

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpEqualExpr' ]
.annotate 'line', 3697
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpNotEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3759
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3762
    new $P1, [ 'OpEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3763

.end # negated


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3766
    self.'optimizearg'()
.annotate 'line', 3767
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3768
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3769
# lnull: $I1
    $P3 = $P1.'isnull'()
    set $I1, $P3
.annotate 'line', 3770
# rnull: $I2
    $P3 = $P2.'isnull'()
    set $I2, $P3
.annotate 'line', 3771
    unless $I1 goto __label_0
# {
.annotate 'line', 3772
    unless $I2 goto __label_1
.annotate 'line', 3773
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall 'integerValue'($P3, $P4, 0)
    goto __label_2
 __label_1: # else
.annotate 'line', 3775
    new $P6, [ 'NullCheckerExpr' ]
    getattribute $P7, self, 'rexpr'
    $P6.'NullCheckerExpr'(self, $P7, 0)
    set $P5, $P6
    .return($P5)
 __label_2: # endif
# }
 __label_0: # endif
.annotate 'line', 3777
    unless $I2 goto __label_3
.annotate 'line', 3778
    new $P4, [ 'NullCheckerExpr' ]
    getattribute $P5, self, 'lexpr'
    $P4.'NullCheckerExpr'(self, $P5, 0)
    set $P3, $P4
    .return($P3)
 __label_3: # endif
.annotate 'line', 3779
    $I5 = $P1.'isliteral'()
    unless $I5 goto __label_5
    $I5 = $P2.'isliteral'()
 __label_5:
    unless $I5 goto __label_4
# {
.annotate 'line', 3780
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_6
    set $S1, $P3
 __label_6:
.annotate 'line', 3781
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_7
    set $S2, $P3
 __label_7:
.annotate 'line', 3782
    ne $S1, $S2, __label_8
# {
.annotate 'line', 3783
    set $S5, $S1
    set $S6, 'I'
    if $S5 == $S6 goto __label_11
    set $S6, 'S'
    if $S5 == $S6 goto __label_12
    goto __label_10
# switch
 __label_11: # case
.annotate 'line', 3785
# li: $I3
# predefined int
    getattribute $P3, $P1, 'numval'
    set $I3, $P3
.annotate 'line', 3786
# ri: $I4
# predefined int
    getattribute $P4, $P2, 'numval'
    set $I4, $P4
.annotate 'line', 3787
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    isne $I5, $I3, $I4
    .tailcall 'integerValue'($P5, $P6, $I5)
 __label_12: # case
.annotate 'line', 3789
# ls: $S3
    getattribute $P8, $P1, 'strval'
    getattribute $P7, $P8, 'str'
    null $S3
    if_null $P7, __label_13
    set $S3, $P7
 __label_13:
.annotate 'line', 3790
# rs: $S4
    getattribute $P10, $P2, 'strval'
    getattribute $P9, $P10, 'str'
    null $S4
    if_null $P9, __label_14
    set $S4, $P9
 __label_14:
.annotate 'line', 3791
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
.annotate 'line', 3795
    .return(self)
# }
.annotate 'line', 3796

.end # optimize


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3799
    __ARG_1.'emitbinop'('isne', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3800

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3803
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3804

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3807
    __ARG_1.'emitcompare'('ne', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3808

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3811
    __ARG_1.'emitcompare'('eq', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3812

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpNotEqualExpr' ]
.annotate 'line', 3757
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
.annotate 'line', 3822
    self.'initbinary'(__ARG_2, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 3823
    box $P1, __ARG_1
    setattribute self, 'positive', $P1
# }
.annotate 'line', 3824

.end # OpSameExpr


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3825
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3828
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 3829
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
.annotate 'line', 3830

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 3833
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
.annotate 'line', 3834

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3837
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 3838
# op: $S1
    unless $I1 goto __label_1
    set $S1, 'issame'
    goto __label_0
 __label_1:
    set $S1, 'isntsame'
 __label_0:
.annotate 'line', 3839
    __ARG_1.'emitbinop'($S1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3840

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3843
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3844

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3847
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 3848
# op: $S1
    unless $I1 goto __label_1
    set $S1, 'eq_addr'
    goto __label_0
 __label_1:
    set $S1, 'ne_addr'
 __label_0:
.annotate 'line', 3849
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3850

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3853
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 3854
# op: $S1
    unless $I1 goto __label_1
    set $S1, 'ne_addr'
    goto __label_0
 __label_1:
    set $S1, 'eq_addr'
 __label_0:
.annotate 'line', 3855
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3856

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpSameExpr' ]
.annotate 'line', 3817
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 3819
    addattribute $P0, 'positive'
.end
.namespace [ 'OpLessExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3863
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3866
    new $P1, [ 'OpGreaterEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3867

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 3870
    islt $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 3871

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3874
    __ARG_1.'emitbinop'('islt', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3875

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3878
    __ARG_1.'emitcompare'('lt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3879

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3882
    __ARG_1.'emitcompare'('ge', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3883

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpLessExpr' ]
.annotate 'line', 3861
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpGreaterExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3890
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3893
    new $P1, [ 'OpLessEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3894

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 3897
    isgt $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 3898

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3901
    __ARG_1.'emitbinop'('isgt', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3902

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3905
    __ARG_1.'emitcompare'('gt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3906

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3909
    __ARG_1.'emitcompare'('le', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3910

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpGreaterExpr' ]
.annotate 'line', 3888
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpLessEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3917
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3920
    new $P1, [ 'OpGreaterExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3921

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 3924
    isle $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 3925

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3928
    __ARG_1.'emitbinop'('isle', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3929

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3932
    __ARG_1.'emitcompare'('le', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3933

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3936
    __ARG_1.'emitcompare'('gt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3937

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpLessEqualExpr' ]
.annotate 'line', 3915
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpGreaterEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3944
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3947
    new $P1, [ 'OpLessExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3948

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 3951
    isge $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 3952

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3955
    __ARG_1.'emitbinop'('isge', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3956

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3959
    __ARG_1.'emitcompare'('ge', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3960

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3963
    __ARG_1.'emitcompare'('lt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3964

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpGreaterEqualExpr' ]
.annotate 'line', 3942
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpBaseBoolExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3973
    .return('I')
# }
.annotate 'line', 3974

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBaseBoolExpr' ]
.annotate 'line', 3969
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
.annotate 'line', 3983
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3984

.end # OpBoolAndExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3987
    self.'optimizearg'()
.annotate 'line', 3988
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'isintegerliteral'()
    if_null $P2, __label_0
    unless $P2 goto __label_0
# {
.annotate 'line', 3989
# var lval: $P1
    getattribute $P4, self, 'lexpr'
    getattribute $P1, $P4, 'numval'
.annotate 'line', 3990
# ln: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 3991
    eq $I1, 0, __label_1
.annotate 'line', 3992
    getattribute $P2, self, 'rexpr'
    .return($P2)
    goto __label_2
 __label_1: # else
.annotate 'line', 3994
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall 'integerValue'($P3, $P4, $I1)
 __label_2: # endif
# }
 __label_0: # endif
.annotate 'line', 3996
    .return(self)
# }
.annotate 'line', 3997

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4000
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
.annotate 'line', 4001
    getattribute $P1, self, 'lexpr'
    $I1 = $P1.'issimple'()
    unless $I1 goto __label_5
    getattribute $P2, self, 'rexpr'
    $I1 = $P2.'issimple'()
 __label_5:
    unless $I1 goto __label_3
# {
.annotate 'line', 4002
# lreg: $S2
    $P3 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P3, __label_6
    set $S2, $P3
 __label_6:
.annotate 'line', 4003
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_7
    set $S3, $P1
 __label_7:
.annotate 'line', 4004
    __ARG_1.'emitbinop'('and', $S1, $S2, $S3)
# }
    goto __label_4
 __label_3: # else
# {
.annotate 'line', 4007
# l: $S4
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S4
    if_null $P1, __label_8
    set $S4, $P1
 __label_8:
.annotate 'line', 4008
    getattribute $P1, self, 'lexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4009
    __ARG_1.'emitunless'($S1, $S4)
.annotate 'line', 4010
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4011
    __ARG_1.'emitlabel'($S4)
# }
 __label_4: # endif
# }
.annotate 'line', 4013

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBoolAndExpr' ]
.annotate 'line', 3979
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
.annotate 'line', 4022
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4023

.end # OpBoolOrExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4026
    self.'optimizearg'()
.annotate 'line', 4027
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'isintegerliteral'()
    if_null $P2, __label_0
    unless $P2 goto __label_0
# {
.annotate 'line', 4028
# var lval: $P1
    getattribute $P4, self, 'lexpr'
    getattribute $P1, $P4, 'numval'
.annotate 'line', 4029
# ln: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 4030
    ne $I1, 0, __label_1
.annotate 'line', 4031
    getattribute $P2, self, 'rexpr'
    .return($P2)
    goto __label_2
 __label_1: # else
.annotate 'line', 4033
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall 'integerValue'($P3, $P4, $I1)
 __label_2: # endif
# }
 __label_0: # endif
.annotate 'line', 4035
    .return(self)
# }
.annotate 'line', 4036

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4039
# res: $S1
    null $S1
.annotate 'line', 4040
    if_null __ARG_2, __label_0
.annotate 'line', 4041
    set $S1, __ARG_2
    goto __label_1
 __label_0: # else
.annotate 'line', 4043
    $P1 = self.'tempreg'('I')
    set $S1, $P1
 __label_1: # endif
.annotate 'line', 4044
    getattribute $P1, self, 'lexpr'
    $I1 = $P1.'issimple'()
    unless $I1 goto __label_4
    getattribute $P2, self, 'rexpr'
    $I1 = $P2.'issimple'()
 __label_4:
    unless $I1 goto __label_2
# {
.annotate 'line', 4045
# lreg: $S2
    $P3 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P3, __label_5
    set $S2, $P3
 __label_5:
.annotate 'line', 4046
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_6
    set $S3, $P1
 __label_6:
.annotate 'line', 4047
    __ARG_1.'emitbinop'('or', $S1, $S2, $S3)
# }
    goto __label_3
 __label_2: # else
# {
.annotate 'line', 4050
# l: $S4
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S4
    if_null $P1, __label_7
    set $S4, $P1
 __label_7:
.annotate 'line', 4051
    getattribute $P1, self, 'lexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4052
    __ARG_1.'emitif'($S1, $S4)
.annotate 'line', 4053
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4054
    __ARG_1.'emitlabel'($S4)
# }
 __label_3: # endif
# }
.annotate 'line', 4056

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBoolOrExpr' ]
.annotate 'line', 4018
    get_class $P1, [ 'OpBaseBoolExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpBaseBinExpr' ]
.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBaseBinExpr' ]
.annotate 'line', 4061
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
.annotate 'line', 4071
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4072

.end # OpBinAndExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4075
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
.annotate 'line', 4076
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
 __label_3:
.annotate 'line', 4077
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_4
    set $S3, $P1
 __label_4:
.annotate 'line', 4078
    self.'annotate'(__ARG_1)
.annotate 'line', 4079
    __ARG_1.'emitbinop'('band', $S1, $S2, $S3)
# }
.annotate 'line', 4080

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4083
    band $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4084

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBinAndExpr' ]
.annotate 'line', 4067
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
.annotate 'line', 4093
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4094

.end # OpBinOrExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4097
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
.annotate 'line', 4098
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
 __label_3:
.annotate 'line', 4099
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_4
    set $S3, $P1
 __label_4:
.annotate 'line', 4100
    self.'annotate'(__ARG_1)
.annotate 'line', 4101
    __ARG_1.'emitbinop'('bor', $S1, $S2, $S3)
# }
.annotate 'line', 4102

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4105
    bor $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4106

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBinOrExpr' ]
.annotate 'line', 4089
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
.annotate 'line', 4115
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4116

.end # OpBinXorExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4119
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
.annotate 'line', 4120
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
 __label_3:
.annotate 'line', 4121
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_4
    set $S3, $P1
 __label_4:
.annotate 'line', 4122
    self.'annotate'(__ARG_1)
.annotate 'line', 4123
    __ARG_1.'emitbinop'('bxor', $S1, $S2, $S3)
# }
.annotate 'line', 4124

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4127
    bxor $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4128

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBinXorExpr' ]
.annotate 'line', 4111
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
.annotate 'line', 4138
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 4139
    isa $I1, __ARG_3, [ 'ConcatString' ]
    unless $I1 goto __label_0
# {
.annotate 'line', 4140
    getattribute $P2, __ARG_3, 'values'
    setattribute self, 'values', $P2
.annotate 'line', 4141
    isa $I1, __ARG_4, [ 'ConcatString' ]
    unless $I1 goto __label_2
.annotate 'line', 4142
    getattribute $P1, self, 'values'
    getattribute $P2, __ARG_4, 'values'
    $P1.'append'($P2)
    goto __label_3
 __label_2: # else
.annotate 'line', 4144
    getattribute $P3, self, 'values'
# predefined push
    push $P3, __ARG_4
 __label_3: # endif
# }
    goto __label_1
 __label_0: # else
.annotate 'line', 4146
    isa $I1, __ARG_4, [ 'ConcatString' ]
    unless $I1 goto __label_4
# {
.annotate 'line', 4147
    getattribute $P2, __ARG_4, 'values'
    setattribute self, 'values', $P2
.annotate 'line', 4148
    getattribute $P1, self, 'values'
    $P1.'unshift'(__ARG_3)
# }
    goto __label_5
 __label_4: # else
.annotate 'line', 4151
    root_new $P2, ['parrot';'ResizablePMCArray']
    push $P2, __ARG_3
    push $P2, __ARG_4
    setattribute self, 'values', $P2
 __label_5: # endif
 __label_1: # endif
# }
.annotate 'line', 4152

.end # ConcatString


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4153
    .return('S')
# }

.end # checkresult


.sub 'getregs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4156
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 4157
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4158
    new $P2, ['FixedStringArray'], $I1
.annotate 'line', 4159
# i: $I2
    null $I2
# for loop
.annotate 'line', 4160
    null $I2
 __label_2: # for condition
    ge $I2, $I1, __label_1
.annotate 'line', 4161
# predefined string
    $P4 = $P1[$I2]
    $P3 = $P4.'emit_get'(__ARG_1)
    set $S1, $P3
    $P2[$I2] = $S1
 __label_0: # for iteration
.annotate 'line', 4160
    inc $I2
    goto __label_2
 __label_1: # for end
.annotate 'line', 4162
    .return($P2)
# }
.annotate 'line', 4163

.end # getregs


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4166
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4167
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4168
# auxreg: $S1
    set $S1, '$S0'
.annotate 'line', 4169
    self.'annotate'(__ARG_1)
.annotate 'line', 4170
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 4171
# i: $I2
    set $I2, 2
 __label_2: # for condition
    ge $I2, $I1, __label_1
.annotate 'line', 4172
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'($S1, $P2)
 __label_0: # for iteration
.annotate 'line', 4171
    inc $I2
    goto __label_2
 __label_1: # for end
.annotate 'line', 4173
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
.annotate 'line', 4174

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4177
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4178
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4179
# auxreg: $S1
    $P2 = self.'tempreg'('S')
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 4180
    self.'annotate'(__ARG_1)
.annotate 'line', 4181
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 4182
# i: $I2
    set $I2, 2
 __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 4183
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'($S1, $P2)
 __label_1: # for iteration
.annotate 'line', 4182
    inc $I2
    goto __label_3
 __label_2: # for end
.annotate 'line', 4184
    .return($S1)
# }
.annotate 'line', 4185

.end # emit_get


.sub 'emit_concat_to' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4188
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4189
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4190
    self.'annotate'(__ARG_1)
# for loop
.annotate 'line', 4191
# i: $I2
    null $I2
 __label_2: # for condition
    ge $I2, $I1, __label_1
.annotate 'line', 4192
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'(__ARG_2, $P2)
 __label_0: # for iteration
.annotate 'line', 4191
    inc $I2
    goto __label_2
 __label_1: # for end
# }
.annotate 'line', 4193

.end # emit_concat_to


.sub 'emit_concat_set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4196
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4197
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4198
    self.'annotate'(__ARG_1)
.annotate 'line', 4199
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'(__ARG_2, $P2, $P3)
# for loop
.annotate 'line', 4200
# i: $I2
    set $I2, 2
 __label_2: # for condition
    ge $I2, $I1, __label_1
.annotate 'line', 4201
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'(__ARG_2, $P2)
 __label_0: # for iteration
.annotate 'line', 4200
    inc $I2
    goto __label_2
 __label_1: # for end
# }
.annotate 'line', 4202

.end # emit_concat_set

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ConcatString' ]
.annotate 'line', 4133
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 4135
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
.annotate 'line', 4211
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4212

.end # OpAddExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4215
    self.'optimizearg'()
.annotate 'line', 4216
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4217
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4218
# ltype: $S1
    $P10 = $P1.'checkresult'()
    null $S1
    if_null $P10, __label_0
    set $S1, $P10
 __label_0:
.annotate 'line', 4219
# rtype: $S2
    $P10 = $P2.'checkresult'()
    null $S2
    if_null $P10, __label_1
    set $S2, $P10
 __label_1:
.annotate 'line', 4220
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_3
    $I3 = $P2.'isliteral'()
 __label_3:
    unless $I3 goto __label_2
# {
.annotate 'line', 4221
    iseq $I4, $S1, 'S'
    unless $I4 goto __label_5
    iseq $I4, $S2, 'S'
 __label_5:
    unless $I4 goto __label_4
# {
.annotate 'line', 4226
# var etok: $P3
    getattribute $P3, $P1, 'strval'
.annotate 'line', 4227
# var rtok: $P4
    getattribute $P4, $P2, 'strval'
.annotate 'line', 4228
# var t: $P5
    isa $I3, $P3, [ 'TokenSingleQuoted' ]
    unless $I3 goto __label_8
.annotate 'line', 4229
    isa $I3, $P4, [ 'TokenSingleQuoted' ]
 __label_8:
    unless $I3 goto __label_7
.annotate 'line', 4231
    new $P10, [ 'TokenSingleQuoted' ]
    getattribute $P11, $P3, 'file'
    getattribute $P12, $P3, 'line'
# predefined string
.annotate 'line', 4232
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
.annotate 'line', 4234
    new $P15, [ 'TokenQuoted' ]
    getattribute $P16, $P3, 'file'
    getattribute $P17, $P3, 'line'
# predefined string
.annotate 'line', 4235
    $P18 = $P3.'getasquoted'()
    set $S6, $P18
# predefined string
    $P19 = $P4.'getasquoted'()
    set $S7, $P19
    concat $S8, $S6, $S7
    $P15.'TokenQuoted'($P16, $P17, $S8)
    set $P5, $P15
 __label_6:
.annotate 'line', 4236
    new $P11, [ 'StringLiteral' ]
    getattribute $P12, self, 'owner'
    $P11.'StringLiteral'($P12, $P5)
    set $P10, $P11
    .return($P10)
# }
 __label_4: # endif
.annotate 'line', 4238
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_10
    iseq $I3, $S2, 'I'
 __label_10:
    unless $I3 goto __label_9
# {
.annotate 'line', 4239
# var lval: $P6
    getattribute $P6, $P1, 'numval'
.annotate 'line', 4240
# ln: $I1
    set $P10, $P6
    set $I1, $P10
.annotate 'line', 4241
# var rval: $P7
    getattribute $P7, $P2, 'numval'
.annotate 'line', 4242
# rn: $I2
    set $P10, $P7
    set $I2, $P10
.annotate 'line', 4243
    getattribute $P10, self, 'owner'
    getattribute $P11, self, 'start'
    add $I3, $I1, $I2
    .tailcall 'integerValue'($P10, $P11, $I3)
# }
 __label_9: # endif
# {
.annotate 'line', 4246
    $P10 = 'floatresult'($S1, $S2)
    if_null $P10, __label_11
    unless $P10 goto __label_11
# {
.annotate 'line', 4247
# var lvalf: $P8
    getattribute $P8, $P1, 'numval'
.annotate 'line', 4248
# lf: $N1
# predefined string
    set $S3, $P8
    set $N1, $S3
.annotate 'line', 4249
# var rvalf: $P9
    getattribute $P9, $P2, 'numval'
.annotate 'line', 4250
# rf: $N2
# predefined string
    set $S3, $P9
    set $N2, $S3
.annotate 'line', 4251
    getattribute $P10, self, 'owner'
    getattribute $P11, self, 'start'
    add $N3, $N1, $N2
    .tailcall 'floatValue'($P10, $P11, $N3)
# }
 __label_11: # endif
# }
# }
 __label_2: # endif
.annotate 'line', 4255
    iseq $I3, $S1, 'S'
    unless $I3 goto __label_13
    iseq $I3, $S2, 'S'
 __label_13:
    unless $I3 goto __label_12
# {
.annotate 'line', 4256
    new $P11, [ 'ConcatString' ]
    getattribute $P12, self, 'owner'
    getattribute $P13, self, 'start'
    $P11.'ConcatString'($P12, $P13, $P1, $P2)
    set $P10, $P11
    .return($P10)
# }
 __label_12: # endif
.annotate 'line', 4258
    .return(self)
# }
.annotate 'line', 4259

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4262
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 4263
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 4264
    ne $S1, $S2, __label_2
.annotate 'line', 4265
    .return($S1)
 __label_2: # endif
.annotate 'line', 4266
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_4
    iseq $I1, $S2, 'S'
 __label_4:
    unless $I1 goto __label_3
.annotate 'line', 4267
    .return('S')
 __label_3: # endif
.annotate 'line', 4268
    iseq $I1, $S1, 'S'
    unless $I1 goto __label_6
    iseq $I1, $S2, 'I'
 __label_6:
    unless $I1 goto __label_5
.annotate 'line', 4269
    .return('S')
 __label_5: # endif
.annotate 'line', 4270
    $P1 = 'floatresult'($S1, $S2)
    if_null $P1, __label_7
    unless $P1 goto __label_7
.annotate 'line', 4271
    .return('N')
 __label_7: # endif
.annotate 'line', 4272
    .return('I')
# }
.annotate 'line', 4273

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4276
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4277
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4278
# restype: $S1
    $P3 = self.'checkresult'()
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 4279
# ltype: $S2
    $P3 = $P1.'checkresult'()
    null $S2
    if_null $P3, __label_1
    set $S2, $P3
 __label_1:
.annotate 'line', 4280
# rtype: $S3
    $P3 = $P2.'checkresult'()
    null $S3
    if_null $P3, __label_2
    set $S3, $P3
 __label_2:
.annotate 'line', 4282
# rleft: $S4
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_3
    set $S4, $P3
 __label_3:
.annotate 'line', 4283
# rright: $S5
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S5
    if_null $P3, __label_4
    set $S5, $P3
 __label_4:
.annotate 'line', 4284
    ne $S1, 'S', __label_5
# {
.annotate 'line', 4285
    isne $I1, $S2, 'S'
    if $I1 goto __label_8
    isne $I1, $S3, 'S'
 __label_8:
    unless $I1 goto __label_7
# {
.annotate 'line', 4286
# aux: $S6
    $P3 = self.'tempreg'('S')
    null $S6
    if_null $P3, __label_9
    set $S6, $P3
 __label_9:
.annotate 'line', 4287
    eq $S2, 'S', __label_10
# {
.annotate 'line', 4288
    __ARG_1.'emitset'($S6, $S4)
.annotate 'line', 4289
    set $S4, $S6
# }
    goto __label_11
 __label_10: # else
# {
.annotate 'line', 4292
    __ARG_1.'emitset'($S6, $S5)
.annotate 'line', 4293
    set $S5, $S6
# }
 __label_11: # endif
# }
 __label_7: # endif
.annotate 'line', 4296
    __ARG_1.'emitconcat'(__ARG_2, $S4, $S5)
# }
    goto __label_6
 __label_5: # else
# {
.annotate 'line', 4299
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_14
    isne $I1, $S2, 'I'
    if $I1 goto __label_15
    isne $I1, $S3, 'I'
 __label_15:
 __label_14:
    unless $I1 goto __label_12
# {
.annotate 'line', 4300
# l: $S7
    null $S7
.annotate 'line', 4301
    ne $S2, 'I', __label_16
    set $S7, $S4
    goto __label_17
 __label_16: # else
# {
.annotate 'line', 4303
    $P3 = self.'tempreg'('I')
    set $S7, $P3
.annotate 'line', 4304
    __ARG_1.'emitset'($S7, $S4)
# }
 __label_17: # endif
.annotate 'line', 4306
# r: $S8
    null $S8
.annotate 'line', 4307
    ne $S3, 'I', __label_18
    set $S8, $S5
    goto __label_19
 __label_18: # else
# {
.annotate 'line', 4309
    $P3 = self.'tempreg'('I')
    set $S8, $P3
.annotate 'line', 4310
    __ARG_1.'emitset'($S8, $S5)
# }
 __label_19: # endif
.annotate 'line', 4312
    __ARG_1.'emitadd'(__ARG_2, $S7, $S8)
# }
    goto __label_13
 __label_12: # else
.annotate 'line', 4315
    __ARG_1.'emitadd'(__ARG_2, $S4, $S5)
 __label_13: # endif
# }
 __label_6: # endif
# }
.annotate 'line', 4317

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpAddExpr' ]
.annotate 'line', 4207
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
.annotate 'line', 4326
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4327

.end # OpSubExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4330
    self.'optimizearg'()
.annotate 'line', 4331
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4332
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4333
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_1
    $I3 = $P2.'isliteral'()
 __label_1:
    unless $I3 goto __label_0
# {
.annotate 'line', 4334
# ltype: $S1
    $P5 = $P1.'checkresult'()
    null $S1
    if_null $P5, __label_2
    set $S1, $P5
 __label_2:
.annotate 'line', 4335
# rtype: $S2
    $P5 = $P2.'checkresult'()
    null $S2
    if_null $P5, __label_3
    set $S2, $P5
 __label_3:
.annotate 'line', 4336
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_5
    iseq $I3, $S2, 'I'
 __label_5:
    unless $I3 goto __label_4
# {
.annotate 'line', 4337
# var lval: $P3
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4338
# ln: $I1
    set $P5, $P3
    set $I1, $P5
.annotate 'line', 4339
# var rval: $P4
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4340
# rn: $I2
    set $P5, $P4
    set $I2, $P5
.annotate 'line', 4341
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    sub $I3, $I1, $I2
    .tailcall 'integerValue'($P5, $P6, $I3)
# }
 __label_4: # endif
# }
 __label_0: # endif
.annotate 'line', 4344
    .return(self)
# }
.annotate 'line', 4345

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4348
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 4349
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 4350
    ne $S1, $S2, __label_2
.annotate 'line', 4351
    .return($S1)
 __label_2: # endif
.annotate 'line', 4352
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_4
    iseq $I1, $S2, 'N'
 __label_4:
    unless $I1 goto __label_3
.annotate 'line', 4353
    .return('N')
 __label_3: # endif
.annotate 'line', 4354
    iseq $I1, $S1, 'N'
    unless $I1 goto __label_6
    iseq $I1, $S2, 'I'
 __label_6:
    unless $I1 goto __label_5
.annotate 'line', 4355
    .return('N')
 __label_5: # endif
.annotate 'line', 4356
    .return('I')
# }
.annotate 'line', 4357

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4360
# lreg: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 4361
# rreg: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 4362
    __ARG_1.'emitsub'(__ARG_2, $S1, $S2)
# }
.annotate 'line', 4363

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpSubExpr' ]
.annotate 'line', 4322
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
.annotate 'line', 4372
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4373

.end # OpMulExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4376
    self.'optimizearg'()
.annotate 'line', 4377
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4378
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4379
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_1
    $I3 = $P2.'isliteral'()
 __label_1:
    unless $I3 goto __label_0
# {
.annotate 'line', 4380
# ltype: $S1
    $P7 = $P1.'checkresult'()
    null $S1
    if_null $P7, __label_2
    set $S1, $P7
 __label_2:
.annotate 'line', 4381
# rtype: $S2
    $P7 = $P2.'checkresult'()
    null $S2
    if_null $P7, __label_3
    set $S2, $P7
 __label_3:
.annotate 'line', 4382
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_5
    iseq $I3, $S2, 'I'
 __label_5:
    unless $I3 goto __label_4
# {
.annotate 'line', 4383
# var lval: $P3
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4384
# ln: $I1
    set $P7, $P3
    set $I1, $P7
.annotate 'line', 4385
# var rval: $P4
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4386
# rn: $I2
    set $P7, $P4
    set $I2, $P7
.annotate 'line', 4387
    getattribute $P7, self, 'owner'
    getattribute $P8, self, 'start'
    mul $I3, $I1, $I2
    .tailcall 'integerValue'($P7, $P8, $I3)
# }
 __label_4: # endif
# {
.annotate 'line', 4390
    $P7 = 'floatresult'($S1, $S2)
    if_null $P7, __label_6
    unless $P7 goto __label_6
# {
.annotate 'line', 4391
# var lvalf: $P5
    getattribute $P5, $P1, 'numval'
.annotate 'line', 4392
# lf: $N1
# predefined string
    set $S3, $P5
    set $N1, $S3
.annotate 'line', 4393
# var rvalf: $P6
    getattribute $P6, $P2, 'numval'
.annotate 'line', 4394
# rf: $N2
# predefined string
    set $S3, $P6
    set $N2, $S3
.annotate 'line', 4395
    getattribute $P7, self, 'owner'
    getattribute $P8, self, 'start'
    mul $N3, $N1, $N2
    .tailcall 'floatValue'($P7, $P8, $N3)
# }
 __label_6: # endif
# }
# }
 __label_0: # endif
.annotate 'line', 4399
    .return(self)
# }
.annotate 'line', 4400

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4403
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4404
# rl: $S1
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'checkresult'()
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 4405
# rr: $S2
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'checkresult'()
    null $S2
    if_null $P2, __label_1
    set $S2, $P2
 __label_1:
.annotate 'line', 4406
    ne $S1, $S2, __label_2
.annotate 'line', 4407
    .return($S1)
 __label_2: # endif
.annotate 'line', 4408
    ne $S1, 'S', __label_3
.annotate 'line', 4409
    .return('S')
    goto __label_4
 __label_3: # else
.annotate 'line', 4411
    .return('N')
 __label_4: # endif
# }
.annotate 'line', 4412

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4415
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4416
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4417
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 4418
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_1
    set $S2, $P3
 __label_1:
.annotate 'line', 4419
# lreg: $S3
    null $S3
# rreg: $S4
    null $S4
.annotate 'line', 4420
    ne $S1, 'S', __label_2
# {
.annotate 'line', 4421
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 4422
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 4423
# rval: $S5
    null $S5
.annotate 'line', 4424
    set $S7, $S2
    set $S8, 'I'
    if $S7 == $S8 goto __label_5
    goto __label_4
# switch
 __label_5: # case
.annotate 'line', 4426
    set $S5, $S4
    goto __label_3 # break
 __label_4: # default
.annotate 'line', 4429
    $P3 = self.'tempreg'('I')
    set $S5, $P3
.annotate 'line', 4430
    __ARG_1.'emitset'($S5, $S4)
 __label_3: # switch end
.annotate 'line', 4432
    self.'annotate'(__ARG_1)
.annotate 'line', 4433
    __ARG_1.'emitrepeat'(__ARG_2, $S3, $S5)
.annotate 'line', 4434
    .return()
# }
 __label_2: # endif
.annotate 'line', 4436
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
.annotate 'line', 4437
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 4438
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 4439
    __ARG_1.'emitmul'(__ARG_2, $S3, $S4)
.annotate 'line', 4440
    .return()
# }
 __label_6: # endif
.annotate 'line', 4445
    ne $S1, 'N', __label_10
# {
.annotate 'line', 4446
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 4447
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 4448
# rval: $S6
    null $S6
.annotate 'line', 4449
    set $S7, $S2
    set $S8, 'I'
    if $S7 == $S8 goto __label_13
    set $S8, 'N'
    if $S7 == $S8 goto __label_14
    goto __label_12
# switch
 __label_13: # case
.annotate 'line', 4451
    $P3 = self.'tempreg'('N')
    set $S6, $P3
.annotate 'line', 4452
    __ARG_1.'emitset'($S6, $S4)
.annotate 'line', 4453
    set $S6, $S4
    goto __label_11 # break
 __label_14: # case
.annotate 'line', 4456
    set $S6, $S4
    goto __label_11 # break
 __label_12: # default
.annotate 'line', 4459
    $P4 = self.'tempreg'('N')
    set $S6, $P4
.annotate 'line', 4460
    __ARG_1.'emitset'($S6, $S4)
 __label_11: # switch end
.annotate 'line', 4462
    set $S7, __ARG_2
    eq $S7, '', __label_15
# {
.annotate 'line', 4463
    self.'annotate'(__ARG_1)
.annotate 'line', 4464
    __ARG_1.'emitmul'(__ARG_2, $S3, $S6)
# }
 __label_15: # endif
.annotate 'line', 4466
    .return()
# }
 __label_10: # endif
.annotate 'line', 4469
# nleft: $I1
    null $I1
# nright: $I2
    null $I2
.annotate 'line', 4470
    $P3 = $P1.'issimple'()
    isfalse $I3, $P3
    if $I3 goto __label_18
    $I3 = $P1.'isidentifier'()
 __label_18:
    unless $I3 goto __label_16
# {
.annotate 'line', 4471
    $P5 = self.'checkresult'()
    $P4 = self.'tempreg'($P5)
    set $S3, $P4
.annotate 'line', 4472
    $P1.'emit'(__ARG_1, $S3)
# }
    goto __label_17
 __label_16: # else
# {
.annotate 'line', 4475
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4476
    set $S3, $I1
# }
 __label_17: # endif
.annotate 'line', 4478
    $P3 = $P2.'issimple'()
    isfalse $I3, $P3
    if $I3 goto __label_21
    $I3 = $P2.'isidentifier'()
 __label_21:
    unless $I3 goto __label_19
# {
.annotate 'line', 4479
    $P5 = self.'checkresult'()
    $P4 = self.'tempreg'($P5)
    set $S4, $P4
.annotate 'line', 4480
    $P2.'emit'(__ARG_1, $S4)
# }
    goto __label_20
 __label_19: # else
# {
.annotate 'line', 4483
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
.annotate 'line', 4485
    $P4 = self.'checkresult'()
    $P3 = self.'tempreg'($P4)
    set $S4, $P3
.annotate 'line', 4486
    $P2.'emit'(__ARG_1, $S4)
    goto __label_22 # break
 __label_25: # case
.annotate 'line', 4489
    $P5 = $P2.'emit_get'(__ARG_1)
    set $S4, $P5
    goto __label_22 # break
 __label_26: # case
 __label_23: # default
.annotate 'line', 4493
    $P6 = $P2.'getIntegerValue'()
    set $I2, $P6
.annotate 'line', 4494
    set $S4, $I2
    goto __label_22 # break
 __label_22: # switch end
.annotate 'line', 4495
# }
 __label_20: # endif
.annotate 'line', 4498
    self.'annotate'(__ARG_1)
.annotate 'line', 4499
    set $S7, __ARG_2
    ne $S7, '', __label_27
.annotate 'line', 4500
    $P3 = self.'checkresult'()
    __ARG_2 = self.'tempreg'($P3)
 __label_27: # endif
.annotate 'line', 4501
    __ARG_1.'emitmul'(__ARG_2, $S3, $S4)
# }
.annotate 'line', 4502

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpMulExpr' ]
.annotate 'line', 4368
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
.annotate 'line', 4511
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4512

.end # OpDivExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4515
    self.'optimizearg'()
.annotate 'line', 4516
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4517
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4518
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_1
    $I3 = $P2.'isliteral'()
 __label_1:
    unless $I3 goto __label_0
# {
.annotate 'line', 4519
# ltype: $S1
    $P5 = $P1.'checkresult'()
    null $S1
    if_null $P5, __label_2
    set $S1, $P5
 __label_2:
.annotate 'line', 4520
# rtype: $S2
    $P5 = $P2.'checkresult'()
    null $S2
    if_null $P5, __label_3
    set $S2, $P5
 __label_3:
.annotate 'line', 4521
# var lval: $P3
    null $P3
.annotate 'line', 4522
# var rval: $P4
    null $P4
.annotate 'line', 4523
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_5
    iseq $I3, $S2, 'I'
 __label_5:
    unless $I3 goto __label_4
# {
.annotate 'line', 4524
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4525
# ln: $I1
    set $P5, $P3
    set $I1, $P5
.annotate 'line', 4526
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4527
# rn: $I2
    set $P5, $P4
    set $I2, $P5
.annotate 'line', 4528
    eq $I2, 0, __label_6
.annotate 'line', 4529
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
.annotate 'line', 4532
    $P5 = 'floatresult'($S1, $S2)
    if_null $P5, __label_7
    unless $P5 goto __label_7
# {
.annotate 'line', 4533
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4534
# lf: $N1
# predefined string
    set $S3, $P3
    set $N1, $S3
.annotate 'line', 4535
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4536
# rf: $N2
# predefined string
    set $S3, $P4
    set $N2, $S3
.annotate 'line', 4537
    set $N3, 0
    eq $N2, $N3, __label_8
.annotate 'line', 4538
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
.annotate 'line', 4542
    .return(self)
# }
.annotate 'line', 4543

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4546
    .return('N')
# }
.annotate 'line', 4547

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4550
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4551
# var aux: $P2
    null $P2
.annotate 'line', 4552
# var lreg: $P3
    $P3 = $P1.'emit_get'(__ARG_1)
.annotate 'line', 4553
    $P6 = $P1.'checkresult'()
    set $S1, $P6
    eq $S1, 'N', __label_0
# {
.annotate 'line', 4554
    $P2 = self.'tempreg'('N')
.annotate 'line', 4555
    __ARG_1.'emitset'($P2, $P3)
.annotate 'line', 4556
    set $P3, $P2
# }
 __label_0: # endif
.annotate 'line', 4558
# var rexpr: $P4
    getattribute $P4, self, 'rexpr'
.annotate 'line', 4559
# var rreg: $P5
    $P5 = $P4.'emit_get'(__ARG_1)
.annotate 'line', 4560
    $P6 = $P4.'checkresult'()
    set $S1, $P6
    eq $S1, 'N', __label_1
# {
.annotate 'line', 4561
    $P2 = self.'tempreg'('N')
.annotate 'line', 4562
    __ARG_1.'emitset'($P2, $P5)
.annotate 'line', 4563
    set $P5, $P2
# }
 __label_1: # endif
.annotate 'line', 4565
    self.'annotate'(__ARG_1)
.annotate 'line', 4566
    __ARG_1.'emitdiv'(__ARG_2, $P3, $P5)
# }
.annotate 'line', 4567

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpDivExpr' ]
.annotate 'line', 4507
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
.annotate 'line', 4576
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4577

.end # OpModExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4580
# lreg: $S1
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 4581
# rreg: $S2
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 4582
    self.'annotate'(__ARG_1)
.annotate 'line', 4583
    __ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
# }
.annotate 'line', 4584

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4587
    mod $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4588

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpModExpr' ]
.annotate 'line', 4572
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
.annotate 'line', 4597
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4598

.end # OpCModExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4601
    .return('I')
# }
.annotate 'line', 4602

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4605
# lreg: $S1
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 4606
# rreg: $S2
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 4607
    self.'annotate'(__ARG_1)
.annotate 'line', 4612
    __ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
# }
.annotate 'line', 4613

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpCModExpr' ]
.annotate 'line', 4593
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
.annotate 'line', 4622
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4623

.end # OpShiftleftExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4626
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
.annotate 'line', 4627
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
 __label_3:
.annotate 'line', 4628
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_4
    set $S3, $P1
 __label_4:
.annotate 'line', 4629
    self.'annotate'(__ARG_1)
.annotate 'line', 4630
    __ARG_1.'emitbinop'('shl', $S1, $S2, $S3)
# }
.annotate 'line', 4631

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4634
    shl $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4635

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpShiftleftExpr' ]
.annotate 'line', 4618
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
.annotate 'line', 4644
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4645

.end # OpShiftrightExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4648
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
.annotate 'line', 4649
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
 __label_3:
.annotate 'line', 4650
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_4
    set $S3, $P1
 __label_4:
.annotate 'line', 4651
    self.'annotate'(__ARG_1)
.annotate 'line', 4652
    __ARG_1.'emitbinop'('shr', $S1, $S2, $S3)
# }
.annotate 'line', 4653

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4656
    shr $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4657

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpShiftrightExpr' ]
.annotate 'line', 4640
    get_class $P1, [ 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'ArgumentModifierList' ]

.sub 'ArgumentModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4666
    self.'ModifierList'(__ARG_1, __ARG_2)
# }
.annotate 'line', 4667

.end # ArgumentModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4670
# isflat: $I1
    null $I1
# isnamed: $I2
    null $I2
.annotate 'line', 4671
# setname: $S1
    set $S1, ''
.annotate 'line', 4672
    $P3 = self.'getlist'()
    iter $P4, $P3
    set $P4, 0
 __label_0: # for iteration
    unless $P4 goto __label_1
    shift $P1, $P4
# {
.annotate 'line', 4673
# name: $S2
    $P5 = $P1.'getname'()
    null $S2
    if_null $P5, __label_2
    set $S2, $P5
 __label_2:
.annotate 'line', 4674
    ne $S2, 'flat', __label_3
.annotate 'line', 4675
    set $I1, 1
 __label_3: # endif
.annotate 'line', 4676
    ne $S2, 'named', __label_4
# {
.annotate 'line', 4677
    set $I2, 1
.annotate 'line', 4678
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
.annotate 'line', 4682
# var argmod: $P2
    $P2 = $P1.'getarg'(0)
.annotate 'line', 4683
    $P5 = $P2.'isstringliteral'()
    isfalse $I5, $P5
    unless $I5 goto __label_9
.annotate 'line', 4684
    getattribute $P6, self, 'start'
    'SyntaxError'('Invalid modifier', $P6)
 __label_9: # endif
.annotate 'line', 4685
    $P7 = $P2.'getPirString'()
    set $S1, $P7
    goto __label_5 # break
 __label_6: # default
.annotate 'line', 4688
    getattribute $P8, self, 'start'
    'SyntaxError'('Invalid modifier', $P8)
 __label_5: # switch end
# }
 __label_4: # endif
# }
    goto __label_0
 __label_1: # endfor
.annotate 'line', 4692
    unless $I1 goto __label_10
# {
.annotate 'line', 4693
    unless $I2 goto __label_12
.annotate 'line', 4694
    __ARG_1.'print'(' :flat :named')
    goto __label_13
 __label_12: # else
.annotate 'line', 4696
    __ARG_1.'print'(' :flat')
 __label_13: # endif
# }
    goto __label_11
 __label_10: # else
.annotate 'line', 4698
    unless $I2 goto __label_14
# {
.annotate 'line', 4699
    __ARG_1.'print'(' :named')
.annotate 'line', 4700
    eq $S1, '', __label_15
.annotate 'line', 4701
    __ARG_1.'print'("(", $S1, ")")
 __label_15: # endif
# }
 __label_14: # endif
 __label_11: # endif
# }
.annotate 'line', 4703

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ArgumentModifierList' ]
.annotate 'line', 4662
    get_class $P1, [ 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'Argument' ]

.sub 'Argument' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4712
    setattribute self, 'arg', __ARG_1
.annotate 'line', 4713
    setattribute self, 'modifiers', __ARG_2
# }
.annotate 'line', 4714

.end # Argument


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4717
    getattribute $P3, self, 'arg'
    $P2 = $P3.'optimize'()
    setattribute self, 'arg', $P2
.annotate 'line', 4718
    .return(self)
# }
.annotate 'line', 4719

.end # optimize


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 4722
    getattribute $P1, self, 'arg'
    .tailcall $P1.'hascompilevalue'()
# }
.annotate 'line', 4723

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Argument' ]
.annotate 'line', 4708
    addattribute $P0, 'arg'
.annotate 'line', 4709
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
.annotate 'line', 4735
    setattribute self, 'owner', __ARG_1
.annotate 'line', 4736
    setattribute self, 'start', __ARG_2
.annotate 'line', 4737
# var args: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 4738
# var t: $P2
    $P2 = __ARG_3.'get'()
.annotate 'line', 4739
    $P5 = $P2.'isop'(__ARG_4)
    isfalse $I1, $P5
    unless $I1 goto __label_0
# {
.annotate 'line', 4740
    __ARG_3.'unget'($P2)
 __label_1: # do
.annotate 'line', 4741
# {
.annotate 'line', 4742
# var modifier: $P3
    null $P3
.annotate 'line', 4743
# var expr: $P4
    $P4 = 'parseExpr'(__ARG_3, __ARG_1)
.annotate 'line', 4744
    $P2 = __ARG_3.'get'()
.annotate 'line', 4745
    $P5 = $P2.'isop'(':')
    if_null $P5, __label_4
    unless $P5 goto __label_4
# {
.annotate 'line', 4746
    $P2 = __ARG_3.'get'()
.annotate 'line', 4747
    $P5 = $P2.'isop'('[')
    if_null $P5, __label_5
    unless $P5 goto __label_5
# {
.annotate 'line', 4748
    new $P6, [ 'ArgumentModifierList' ]
    $P6.'ArgumentModifierList'(__ARG_3, __ARG_1)
    set $P3, $P6
.annotate 'line', 4749
    $P2 = __ARG_3.'get'()
# }
    goto __label_6
 __label_5: # else
.annotate 'line', 4752
    'Expected'('modifier list', $P2)
 __label_6: # endif
# }
 __label_4: # endif
.annotate 'line', 4754
    new $P6, [ 'Argument' ]
    $P6.'Argument'($P4, $P3)
    set $P5, $P6
# predefined push
    push $P1, $P5
# }
 __label_3: # continue
.annotate 'line', 4755
    $P5 = $P2.'isop'(',')
    if_null $P5, __label_2
    if $P5 goto __label_1
 __label_2: # enddo
.annotate 'line', 4756
    $P5 = $P2.'isop'(__ARG_4)
    isfalse $I1, $P5
    unless $I1 goto __label_7
.annotate 'line', 4757
    'SyntaxError'("Unfinished argument list", $P2)
 __label_7: # endif
.annotate 'line', 4758
# predefined elements
    elements $I1, $P1
    le $I1, 0, __label_8
.annotate 'line', 4759
    setattribute self, 'args', $P1
 __label_8: # endif
# }
 __label_0: # endif
# }
.annotate 'line', 4761

.end # ArgumentList


.sub 'numargs' :method
# Body
# {
.annotate 'line', 4764
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4765
    unless_null $P1, __label_1
    null $I1
    goto __label_0
 __label_1:
# predefined elements
    elements $I1, $P1
 __label_0:
    .return($I1)
# }
.annotate 'line', 4766

.end # numargs


.sub 'getrawargs' :method
# Body
# {
.annotate 'line', 4769
    getattribute $P1, self, 'args'
    .return($P1)
# }
.annotate 'line', 4770

.end # getrawargs


.sub 'getarg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 4773
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4774
    $P2 = $P1[__ARG_1]
    .return($P2)
# }
.annotate 'line', 4775

.end # getarg


.sub 'getfreearg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 4778
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4779
    $P2 = $P1[__ARG_1]
    getattribute $P3, $P2, 'arg'
    .return($P3)
# }
.annotate 'line', 4780

.end # getfreearg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4783
    getattribute $P1, self, 'args'
    'optimize_array'($P1)
.annotate 'line', 4784
    .return(self)
# }
.annotate 'line', 4785

.end # optimize


.sub 'getargvalues' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4788
# var argregs: $P1
    getattribute $P1, self, 'argregs'
.annotate 'line', 4789
    unless_null $P1, __label_0
# {
.annotate 'line', 4790
    new $P2, ['ResizableStringArray']
.annotate 'line', 4791
# pnull: $S1
    set $S1, ''
.annotate 'line', 4792
    set $P1, $P2
.annotate 'line', 4793
# var args: $P3
    getattribute $P3, self, 'args'
.annotate 'line', 4794
# nargs: $I1
# predefined elements
    elements $I1, $P3
# for loop
.annotate 'line', 4795
# i: $I2
    null $I2
 __label_3: # for condition
    ge $I2, $I1, __label_2
# {
.annotate 'line', 4796
# var a: $P4
    $P5 = $P3[$I2]
    getattribute $P4, $P5, 'arg'
.annotate 'line', 4797
# reg: $S2
    null $S2
.annotate 'line', 4798
    $P5 = $P4.'isnull'()
    if_null $P5, __label_4
    unless $P5 goto __label_4
# {
.annotate 'line', 4800
    ne $S1, '', __label_6
# {
.annotate 'line', 4801
    getattribute $P7, self, 'owner'
    $P6 = $P7.'tempreg'('P')
    set $S1, $P6
.annotate 'line', 4802
    __ARG_1.'emitnull'($S1)
# }
 __label_6: # endif
.annotate 'line', 4804
    set $S2, $S1
# }
    goto __label_5
 __label_4: # else
.annotate 'line', 4807
    $P5 = $P4.'emit_get'(__ARG_1)
    set $S2, $P5
 __label_5: # endif
.annotate 'line', 4808
# predefined push
    push $P1, $S2
# }
 __label_1: # for iteration
.annotate 'line', 4795
    inc $I2
    goto __label_3
 __label_2: # for end
.annotate 'line', 4810
    setattribute self, 'argregs', $P1
# }
 __label_0: # endif
.annotate 'line', 4812
    .return($P1)
# }
.annotate 'line', 4813

.end # getargvalues


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4816
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4817
# var argreg: $P2
    $P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 4819
# sep: $S1
    set $S1, ''
.annotate 'line', 4820
# n: $I1
    $P4 = self.'numargs'()
    set $I1, $P4
# for loop
.annotate 'line', 4821
# i: $I2
    null $I2
 __label_2: # for condition
    ge $I2, $I1, __label_1
# {
.annotate 'line', 4822
# a: $S2
    $S2 = $P2[$I2]
.annotate 'line', 4823
    __ARG_1.'print'($S1, $S2)
.annotate 'line', 4824
# var modifiers: $P3
    $P4 = $P1[$I2]
    getattribute $P3, $P4, 'modifiers'
.annotate 'line', 4825
    if_null $P3, __label_3
.annotate 'line', 4826
    $P3.'emitmodifiers'(__ARG_1)
 __label_3: # endif
.annotate 'line', 4827
    set $S1, ', '
# }
 __label_0: # for iteration
.annotate 'line', 4821
    inc $I2
    goto __label_2
 __label_1: # for end
# }
.annotate 'line', 4829

.end # emitargs

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ArgumentList' ]
.annotate 'line', 4728
    addattribute $P0, 'owner'
.annotate 'line', 4729
    addattribute $P0, 'start'
.annotate 'line', 4730
    addattribute $P0, 'args'
.annotate 'line', 4731
    addattribute $P0, 'argregs'
.end
.namespace [ ]

.sub 'arglist_hascompilevalue'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4834
    iter $P2, __ARG_1
    set $P2, 0
 __label_0: # for iteration
    unless $P2 goto __label_1
    shift $P1, $P2
.annotate 'line', 4835
    $P3 = $P1.'hascompilevalue'()
    isfalse $I1, $P3
    unless $I1 goto __label_2
.annotate 'line', 4836
    .return(0)
 __label_2: # endif
    goto __label_0
 __label_1: # endfor
.annotate 'line', 4837
    .return(1)
# }
.annotate 'line', 4838

.end # arglist_hascompilevalue

.namespace [ 'CallPredefExpr' ]

.sub 'CallPredefExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4849
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 4850
    setattribute self, 'predef', __ARG_3
.annotate 'line', 4851
    setattribute self, 'args', __ARG_4
# }
.annotate 'line', 4852

.end # CallPredefExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4855
    getattribute $P1, self, 'predef'
    .tailcall $P1.'result'()
# }
.annotate 'line', 4856

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4859
# var predef: $P1
    getattribute $P1, self, 'predef'
.annotate 'line', 4860
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 4861
    new $P3, ['ResizableStringArray']
.annotate 'line', 4862
# var arg: $P4
    null $P4
.annotate 'line', 4863
# np: $I1
    $P6 = $P1.'params'()
    set $I1, $P6
.annotate 'line', 4864
# pnull: $S1
    set $S1, ''
.annotate 'line', 4865
    set $I4, $I1
    set $I5, -1
    if $I4 == $I5 goto __label_2
    set $I5, -2
    if $I4 == $I5 goto __label_3
    goto __label_1
# switch
 __label_2: # case
.annotate 'line', 4867
    iter $P7, $P2
    set $P7, 0
 __label_4: # for iteration
    unless $P7 goto __label_5
    shift $P4, $P7
# {
.annotate 'line', 4868
# reg: $S2
    getattribute $P8, $P4, 'arg'
    $P6 = $P8.'emit_get'(__ARG_1)
    null $S2
    if_null $P6, __label_6
    set $S2, $P6
 __label_6:
.annotate 'line', 4870
    ne $S2, 'null', __label_7
# {
.annotate 'line', 4871
    ne $S1, '', __label_8
# {
.annotate 'line', 4872
    $P6 = self.'tempreg'('P')
    set $S1, $P6
.annotate 'line', 4873
    __ARG_1.'emitnull'($S1)
# }
 __label_8: # endif
.annotate 'line', 4875
    set $S2, $S1
# }
 __label_7: # endif
.annotate 'line', 4877
# predefined push
    push $P3, $S2
# }
    goto __label_4
 __label_5: # endfor
    goto __label_0 # break
 __label_3: # case
.annotate 'line', 4881
# var rawargs: $P5
    root_new $P5, ['parrot';'ResizablePMCArray']
.annotate 'line', 4882
    iter $P9, $P2
    set $P9, 0
 __label_9: # for iteration
    unless $P9 goto __label_10
    shift $P4, $P9
.annotate 'line', 4883
    getattribute $P8, $P4, 'arg'
# predefined push
    push $P5, $P8
    goto __label_9
 __label_10: # endfor
.annotate 'line', 4884
    getattribute $P10, self, 'predef'
    getattribute $P11, self, 'start'
    $P10.'expand'(__ARG_1, self, $P11, __ARG_2, $P5)
.annotate 'line', 4885
    .return()
 __label_1: # default
.annotate 'line', 4887
# n: $I2
    getattribute $P12, self, 'args'
    set $I2, $P12
# for loop
.annotate 'line', 4888
# i: $I3
    null $I3
 __label_13: # for condition
    ge $I3, $I2, __label_12
# {
.annotate 'line', 4889
    $P13 = $P2[$I3]
    getattribute $P4, $P13, 'arg'
.annotate 'line', 4890
# argtype: $S3
    $P6 = $P4.'checkresult'()
    null $S3
    if_null $P6, __label_14
    set $S3, $P6
 __label_14:
.annotate 'line', 4891
# paramtype: $S4
    $P6 = $P1.'paramtype'($I3)
    null $S4
    if_null $P6, __label_15
    set $S4, $P6
 __label_15:
.annotate 'line', 4892
# argr: $S5
    null $S5
.annotate 'line', 4893
    $P6 = $P4.'isnull'()
    if_null $P6, __label_16
    unless $P6 goto __label_16
# {
.annotate 'line', 4894
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
.annotate 'line', 4898
    $P8 = self.'tempreg'($S4)
    set $S5, $P8
.annotate 'line', 4899
    __ARG_1.'emitnull'($S5)
    goto __label_18 # break
 __label_19: # default
.annotate 'line', 4902
    ne $S1, '', __label_23
# {
.annotate 'line', 4903
    $P10 = self.'tempreg'('P')
    set $S1, $P10
.annotate 'line', 4904
    __ARG_1.'emitnull'($S1)
# }
 __label_23: # endif
.annotate 'line', 4906
    set $S5, $S1
 __label_18: # switch end
# }
    goto __label_17
 __label_16: # else
# {
.annotate 'line', 4910
    iseq $I4, $S3, $S4
    if $I4 goto __label_26
    iseq $I4, $S4, '?'
 __label_26:
    unless $I4 goto __label_24
.annotate 'line', 4911
    $P6 = $P4.'emit_get'(__ARG_1)
    set $S5, $P6
    goto __label_25
 __label_24: # else
# {
.annotate 'line', 4913
# aux: $S6
    null $S6
.annotate 'line', 4914
    $P6 = self.'tempreg'($S4)
    set $S5, $P6
.annotate 'line', 4915
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
.annotate 'line', 4917
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
.annotate 'line', 4921
    $P6 = $P4.'emit_get'(__ARG_1)
    set $S6, $P6
.annotate 'line', 4922
    __ARG_1.'emitbox'($S5, $S6)
    goto __label_33 # break
 __label_34: # default
.annotate 'line', 4925
    $P4.'emit'(__ARG_1, $S5)
 __label_33: # switch end
    goto __label_27 # break
 __label_30: # case
 __label_31: # case
 __label_32: # case
.annotate 'line', 4931
    $P8 = $P4.'emit_get'(__ARG_1)
    set $S6, $P8
.annotate 'line', 4932
    __ARG_1.'emitset'($S5, $S6)
    goto __label_27 # break
 __label_28: # default
.annotate 'line', 4935
    $P4.'emit'(__ARG_1, $S5)
 __label_27: # switch end
# }
 __label_25: # endif
# }
 __label_17: # endif
.annotate 'line', 4939
# predefined push
    push $P3, $S5
# }
 __label_11: # for iteration
.annotate 'line', 4888
    inc $I3
    goto __label_13
 __label_12: # for end
 __label_0: # switch end
.annotate 'line', 4942
    getattribute $P6, self, 'predef'
    getattribute $P8, self, 'start'
    $P6.'expand'(__ARG_1, self, $P8, __ARG_2, $P3)
# }
.annotate 'line', 4943

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CallPredefExpr' ]
.annotate 'line', 4842
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 4844
    addattribute $P0, 'predef'
.annotate 'line', 4845
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
.annotate 'line', 4955
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 4956
    setattribute self, 'funref', __ARG_4
.annotate 'line', 4957
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 4958
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_0
# {
.annotate 'line', 4959
    __ARG_1.'unget'($P1)
.annotate 'line', 4960
    new $P4, [ 'ArgumentList' ]
    $P4.'ArgumentList'(__ARG_2, __ARG_3, __ARG_1, ')')
    set $P3, $P4
    setattribute self, 'args', $P3
# }
 __label_0: # endif
# }
.annotate 'line', 4962

.end # CallExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4963
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4966
# var funref: $P1
    getattribute $P6, self, 'funref'
    $P1 = $P6.'optimize'()
.annotate 'line', 4967
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 4968
# nargs: $I1
    null $I1
.annotate 'line', 4969
    if_null $P2, __label_0
# {
.annotate 'line', 4970
    $P2 = $P2.'optimize'()
.annotate 'line', 4971
    $P6 = $P2.'numargs'()
    set $I1, $P6
# }
 __label_0: # endif
.annotate 'line', 4974
    isa $I2, $P1, [ 'MemberExpr' ]
    unless $I2 goto __label_1
.annotate 'line', 4975
    new $P7, [ 'CallMemberExpr' ]
    $P7.'CallMemberExpr'(self, $P1, $P2)
    set $P6, $P7
    .return($P6)
 __label_1: # endif
.annotate 'line', 4976
    isa $I2, $P1, [ 'MemberRefExpr' ]
    unless $I2 goto __label_2
.annotate 'line', 4977
    new $P7, [ 'CallMemberRefExpr' ]
    $P7.'CallMemberRefExpr'(self, $P1, $P2)
    set $P6, $P7
    .return($P6)
 __label_2: # endif
.annotate 'line', 4980
    $P6 = $P1.'isidentifier'()
    if_null $P6, __label_3
    unless $P6 goto __label_3
# {
.annotate 'line', 4981
# call: $S1
    $P7 = $P1.'getName'()
    null $S1
    if_null $P7, __label_4
    set $S1, $P7
 __label_4:
.annotate 'line', 4982
# var predef: $P3
    $P3 = 'findpredef'($S1, $I1)
.annotate 'line', 4983
    if_null $P3, __label_5
# {
.annotate 'line', 4984
    self.'use_predef'($S1)
.annotate 'line', 4985
# var rawargs: $P4
    ne $I1, 0, __label_7
    root_new $P6, ['parrot';'ResizablePMCArray']
    set $P4, $P6
    goto __label_6
 __label_7:
    $P4 = $P2.'getrawargs'()
 __label_6:
.annotate 'line', 4988
    isa $I2, $P3, [ 'PredefFunctionEval' ]
    unless $I2 goto __label_8
# {
.annotate 'line', 4989
    $P6 = 'arglist_hascompilevalue'($P4)
    if_null $P6, __label_9
    unless $P6 goto __label_9
# {
.annotate 'line', 4990
# var evalfun: $P5
    getattribute $P5, $P3, 'evalfun'
.annotate 'line', 4991
    getattribute $P6, self, 'owner'
    getattribute $P7, self, 'start'
    .tailcall $P5($P6, $P7, $P4)
# }
 __label_9: # endif
# }
 __label_8: # endif
.annotate 'line', 4995
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
.annotate 'line', 4999
    setattribute self, 'funref', $P1
.annotate 'line', 5000
    setattribute self, 'args', $P2
.annotate 'line', 5001
    .return(self)
# }
.annotate 'line', 5002

.end # optimize


.sub 'cantailcall' :method
# Body
# {
.annotate 'line', 5005
    .return(1)
# }
.annotate 'line', 5006

.end # cantailcall


.sub 'emitcall' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5009
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 5010
# call: $S1
    null $S1
.annotate 'line', 5011
    $P2 = $P1.'isidentifier'()
    if_null $P2, __label_0
    unless $P2 goto __label_0
# {
.annotate 'line', 5012
    $P3 = $P1.'checkIdentifier'()
    set $S1, $P3
.annotate 'line', 5013
    ne $S1, '', __label_2
.annotate 'line', 5014
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
.annotate 'line', 5017
    $P2 = $P1.'emit_get'(__ARG_1)
    set $S1, $P2
 __label_1: # endif
.annotate 'line', 5018
    .return($S1)
# }
.annotate 'line', 5019

.end # emitcall


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5022
    __ARG_1.'print'('(')
.annotate 'line', 5023
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5024
    if_null $P1, __label_0
.annotate 'line', 5025
    $P1.'emitargs'(__ARG_1)
 __label_0: # endif
.annotate 'line', 5026
    __ARG_1.'say'(')')
# }
.annotate 'line', 5027

.end # emitargs


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5030
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 5031
# call: $S1
    $P3 = self.'emitcall'(__ARG_1)
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 5032
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 5033
    if_null $P2, __label_1
.annotate 'line', 5034
    $P2.'getargvalues'(__ARG_1)
 __label_1: # endif
.annotate 'line', 5036
    self.'annotate'(__ARG_1)
.annotate 'line', 5038
    __ARG_1.'print'('    ')
.annotate 'line', 5039
    isnull $I1, __ARG_2
    not $I1
    unless $I1 goto __label_3
    set $S2, __ARG_2
    isne $I1, $S2, ''
 __label_3:
    unless $I1 goto __label_2
# {
.annotate 'line', 5040
    set $S3, __ARG_2
    ne $S3, '.tailcall', __label_4
.annotate 'line', 5041
    __ARG_1.'print'('.tailcall ')
    goto __label_5
 __label_4: # else
.annotate 'line', 5043
    __ARG_1.'print'(__ARG_2, ' = ')
 __label_5: # endif
# }
 __label_2: # endif
.annotate 'line', 5046
    __ARG_1.'print'($S1)
.annotate 'line', 5047
    self.'emitargs'(__ARG_1)
# }
.annotate 'line', 5048

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CallExpr' ]
.annotate 'line', 4948
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 4950
    addattribute $P0, 'funref'
.annotate 'line', 4951
    addattribute $P0, 'args'
.end
.namespace [ 'CallMemberExpr' ]

.sub 'CallMemberExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5060
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 5061
    setattribute self, 'funref', __ARG_2
.annotate 'line', 5062
    setattribute self, 'args', __ARG_3
# }
.annotate 'line', 5063

.end # CallMemberExpr


.sub 'emitcall' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5066
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 5067
    root_new $P2, ['parrot';'ResizablePMCArray']
    $P4 = $P1.'emit_left_get'(__ARG_1)
    push $P2, $P4
    box $P3, ".'"
    push $P2, $P3
.annotate 'line', 5068
    $P5 = $P1.'get_member'()
.annotate 'line', 5067
    push $P2, $P5
    box $P3, "'"
    push $P2, $P3
# predefined join
    join $S1, "", $P2
    .return($S1)
# }
.annotate 'line', 5069

.end # emitcall

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CallMemberExpr' ]
.annotate 'line', 5056
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
.annotate 'line', 5079
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 5080
    setattribute self, 'funref', __ARG_2
.annotate 'line', 5081
    setattribute self, 'args', __ARG_3
# }
.annotate 'line', 5082

.end # CallMemberRefExpr


.sub 'emitcall' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5085
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 5086
# var right: $P2
    getattribute $P2, $P1, 'right'
.annotate 'line', 5087
# var type: $P3
    $P3 = $P2.'checkresult'()
.annotate 'line', 5088
    set $S3, $P3
    isne $I1, $S3, 'P'
    unless $I1 goto __label_1
    set $S4, $P3
    isne $I1, $S4, 'S'
 __label_1:
    unless $I1 goto __label_0
.annotate 'line', 5089
    getattribute $P4, $P1, 'start'
    'SyntaxError'("Invalid expression type in '.*'", $P4)
 __label_0: # endif
.annotate 'line', 5092
# lreg: $S1
    $P4 = $P1.'emit_left_get'(__ARG_1)
    null $S1
    if_null $P4, __label_2
    set $S1, $P4
 __label_2:
.annotate 'line', 5093
# rreg: $S2
    $P4 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_3
    set $S2, $P4
 __label_3:
.annotate 'line', 5094
    concat $S3, $S1, '.'
    concat $S3, $S3, $S2
    .return($S3)
# }
.annotate 'line', 5095

.end # emitcall

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CallMemberRefExpr' ]
.annotate 'line', 5075
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
.annotate 'line', 5105
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5106
    setattribute self, 'left', __ARG_3
# }
.annotate 'line', 5107

.end # MemberExprBase


.sub 'emit_left_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5110
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5111
# type: $S1
    $P2 = $P1.'checkresult'()
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 5112
# reg: $S2
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S2
    if_null $P2, __label_1
    set $S2, $P2
 __label_1:
.annotate 'line', 5113
    eq $S1, 'P', __label_2
# {
.annotate 'line', 5114
# auxreg: $S3
    set $S3, $S2
.annotate 'line', 5115
    $P2 = self.'tempreg'('P')
    set $S2, $P2
.annotate 'line', 5116
    __ARG_1.'emitbox'($S2, $S3)
# }
 __label_2: # endif
.annotate 'line', 5118
    .return($S2)
# }
.annotate 'line', 5119

.end # emit_left_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MemberExprBase' ]
.annotate 'line', 5100
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5102
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
.annotate 'line', 5128
    self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5129
    setattribute self, 'right', __ARG_4
# }
.annotate 'line', 5130

.end # MemberExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5131
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5134
    getattribute $P3, self, 'left'
    $P2 = $P3.'optimize'()
    setattribute self, 'left', $P2
.annotate 'line', 5135
    .return(self)
# }
.annotate 'line', 5136

.end # optimize


.sub 'get_member' :method
# Body
# {
.annotate 'line', 5139
    getattribute $P1, self, 'right'
    .return($P1)
# }
.annotate 'line', 5140

.end # get_member


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5143
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 5144
# ident: $S2
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 5145
# result: $S3
    $P1 = self.'tempreg'('P')
    null $S3
    if_null $P1, __label_2
    set $S3, $P1
 __label_2:
.annotate 'line', 5146
    self.'annotate'(__ARG_1)
.annotate 'line', 5147
    __ARG_1.'say'('    ', 'getattribute ', $S3, ', ', $S1, ", '", $S2, "'")
.annotate 'line', 5148
    .return($S3)
# }
.annotate 'line', 5149

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5152
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 5153
# ident: $S2
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 5154
    self.'annotate'(__ARG_1)
.annotate 'line', 5155
    __ARG_1.'say'('    ', 'getattribute ', __ARG_2, ', ', $S1, ", '", $S2, "'")
# }
.annotate 'line', 5156

.end # emit


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5159
    self.'emit'(__ARG_1, __ARG_2)
# }
.annotate 'line', 5160

.end # emit_init


.sub 'emit_assign' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5163
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 5164
# ident: $S2
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 5165
# value: $S3
    null $S3
.annotate 'line', 5166
    ne __ARG_2, 'P', __label_2
# {
.annotate 'line', 5168
    ne __ARG_3, 'null', __label_4
# {
.annotate 'line', 5169
    $P1 = self.'tempreg'('P')
    set __ARG_3, $P1
.annotate 'line', 5170
    __ARG_1.'emitnull'(__ARG_3)
# }
 __label_4: # endif
.annotate 'line', 5172
    set $S3, __ARG_3
# }
    goto __label_3
 __label_2: # else
# {
.annotate 'line', 5175
    $P1 = self.'tempreg'('P')
    set $S3, $P1
.annotate 'line', 5176
    __ARG_1.'emitbox'($S3, __ARG_3)
# }
 __label_3: # endif
.annotate 'line', 5178
    __ARG_1.'say'('    ', "setattribute ", $S1, ", '", $S2, "', ", $S3)
# }
.annotate 'line', 5179

.end # emit_assign


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5182
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 5183
# ident: $S2
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 5184
# value: $S3
    $P1 = self.'tempreg'('P')
    null $S3
    if_null $P1, __label_2
    set $S3, $P1
 __label_2:
.annotate 'line', 5185
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_3
    unless $P1 goto __label_3
.annotate 'line', 5186
    __ARG_1.'emitnull'($S3)
    goto __label_4
 __label_3: # else
# {
.annotate 'line', 5188
# rreg: $S4
    $P2 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P2, __label_5
    set $S4, $P2
 __label_5:
.annotate 'line', 5189
    $P1 = __ARG_2.'checkresult'()
    set $S5, $P1
    eq $S5, 'P', __label_6
.annotate 'line', 5190
    __ARG_1.'emitbox'($S3, $S4)
    goto __label_7
 __label_6: # else
.annotate 'line', 5192
    set $S3, $S4
 __label_7: # endif
# }
 __label_4: # endif
.annotate 'line', 5194
    __ARG_1.'say'('    ', "setattribute ", $S1, ", '", $S2, "', ", $S3)
.annotate 'line', 5195
    .return($S3)
# }
.annotate 'line', 5196

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MemberExpr' ]
.annotate 'line', 5122
    get_class $P1, [ 'MemberExprBase' ]
    addparent $P0, $P1
.annotate 'line', 5124
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
.annotate 'line', 5206
    self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5207
    setattribute self, 'right', __ARG_4
# }
.annotate 'line', 5208

.end # MemberRefExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5209
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5212
    getattribute $P3, self, 'left'
    $P2 = $P3.'optimize'()
    setattribute self, 'left', $P2
.annotate 'line', 5213
    getattribute $P3, self, 'right'
    $P2 = $P3.'optimize'()
    setattribute self, 'right', $P2
.annotate 'line', 5214
    .return(self)
# }
.annotate 'line', 5215

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5219
    getattribute $P1, self, 'start'
.annotate 'line', 5218
    'SyntaxError'('Member reference can be used only for method calls', $P1)
# }
.annotate 'line', 5220

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MemberRefExpr' ]
.annotate 'line', 5201
    get_class $P1, [ 'MemberExprBase' ]
    addparent $P0, $P1
.annotate 'line', 5203
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
.annotate 'line', 5233
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5234
    setattribute self, 'left', __ARG_4
.annotate 'line', 5235
    self.'parseargs'(__ARG_1, __ARG_2, ']')
# }
.annotate 'line', 5236

.end # IndexExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5239
    getattribute $P2, self, 'left'
    $P1 = $P2.'checkresult'()
    set $S1, $P1
    ne $S1, 'S', __label_0
.annotate 'line', 5240
    .return('S')
    goto __label_1
 __label_0: # else
.annotate 'line', 5242
    .return('P')
 __label_1: # endif
# }
.annotate 'line', 5243

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5246
# var left: $P1
    getattribute $P4, self, 'left'
    $P1 = $P4.'optimize'()
.annotate 'line', 5247
    setattribute self, 'left', $P1
.annotate 'line', 5248
    self.'optimizeargs'()
.annotate 'line', 5252
    $I2 = $P1.'isstringliteral'()
    unless $I2 goto __label_1
    $P4 = self.'numargs'()
    set $I3, $P4
    iseq $I2, $I3, 1
 __label_1:
    unless $I2 goto __label_0
# {
.annotate 'line', 5253
# var arg: $P2
    $P2 = self.'getarg'(0)
.annotate 'line', 5254
    $P4 = $P2.'isintegerliteral'()
    if_null $P4, __label_2
    unless $P4 goto __label_2
# {
.annotate 'line', 5255
# ival: $I1
    $P5 = $P2.'getIntegerValue'()
    set $I1, $P5
.annotate 'line', 5256
# sval: $S1
    $P4 = $P1.'get_value'()
    null $S1
    if_null $P4, __label_3
    set $S1, $P4
 __label_3:
.annotate 'line', 5257
# var t: $P3
    new $P3, [ 'TokenQuoted' ]
    getattribute $P4, self, 'start'
    getattribute $P5, $P4, 'file'
    getattribute $P6, self, 'start'
    getattribute $P7, $P6, 'line'
.annotate 'line', 5258
# predefined substr
    substr $S2, $S1, $I1, 1
    $P3.'TokenQuoted'($P5, $P7, $S2)
.annotate 'line', 5259
    new $P5, [ 'StringLiteral' ]
    getattribute $P6, self, 'owner'
    $P5.'StringLiteral'($P6, $P3)
    set $P4, $P5
    .return($P4)
# }
 __label_2: # endif
# }
 __label_0: # endif
.annotate 'line', 5262
    .return(self)
# }
.annotate 'line', 5263

.end # optimize


.sub 'emit_prep' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5266
# var regleft: $P1
    getattribute $P1, self, 'regleft'
.annotate 'line', 5267
# var argregs: $P2
    getattribute $P2, self, 'argregs'
.annotate 'line', 5268
    isnull $I1, $P1
    not $I1
    if $I1 goto __label_1
    isnull $I1, $P2
    not $I1
 __label_1:
    unless $I1 goto __label_0
.annotate 'line', 5269
    getattribute $P3, self, 'start'
    'InternalError'('wrong call to IndexExpr.emit_args', $P3)
 __label_0: # endif
.annotate 'line', 5270
    getattribute $P4, self, 'left'
    $P3 = $P4.'isidentifier'()
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 5271
    getattribute $P5, self, 'left'
    $P1 = $P5.'getIdentifier'()
    goto __label_3
 __label_2: # else
.annotate 'line', 5273
    getattribute $P6, self, 'left'
    $P1 = $P6.'emit_get'(__ARG_1)
 __label_3: # endif
.annotate 'line', 5274
    setattribute self, 'regleft', $P1
.annotate 'line', 5275
    $P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 5276
    setattribute self, 'argregs', $P2
# }
.annotate 'line', 5277

.end # emit_prep


.sub 'emit_aux' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5280
# var regleft: $P1
    getattribute $P1, self, 'regleft'
.annotate 'line', 5281
# var argregs: $P2
    getattribute $P2, self, 'argregs'
.annotate 'line', 5282
    isnull $I1, $P1
    if $I1 goto __label_1
    isnull $I1, $P2
 __label_1:
    unless $I1 goto __label_0
.annotate 'line', 5283
    getattribute $P3, self, 'start'
    'InternalError'('wrong call to IndexExpr.emit_aux', $P3)
 __label_0: # endif
.annotate 'line', 5284
    getattribute $P3, self, 'regleft'
    __ARG_1.'print'($P3, '[')
.annotate 'line', 5285
    getattribute $P3, self, 'argregs'
# predefined join
    join $S1, '; ', $P3
    __ARG_1.'print'($S1)
.annotate 'line', 5286
    __ARG_1.'print'(']')
# }
.annotate 'line', 5287

.end # emit_aux


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5290
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5291
# type: $S1
    $P2 = self.'checkresult'()
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 5292
    ne $S1, 'S', __label_1
# {
.annotate 'line', 5293
# var argregs: $P1
    getattribute $P1, self, 'argregs'
.annotate 'line', 5294
# nargs: $I1
    getattribute $P2, self, 'argregs'
# predefined elements
    elements $I1, $P2
.annotate 'line', 5295
    eq $I1, 1, __label_3
.annotate 'line', 5296
    getattribute $P2, self, 'start'
    'SyntaxError'('Bad string index', $P2)
 __label_3: # endif
.annotate 'line', 5297
    set $S2, __ARG_2
    ne $S2, '', __label_4
.annotate 'line', 5298
    __ARG_2 = self.'tempreg'('S')
 __label_4: # endif
.annotate 'line', 5299
    getattribute $P2, self, 'regleft'
    $P3 = $P1[0]
    __ARG_1.'say'('    ', 'substr ', __ARG_2, ', ', $P2, ', ', $P3, ', ', 1)
# }
    goto __label_2
 __label_1: # else
# {
.annotate 'line', 5302
    self.'annotate'(__ARG_1)
.annotate 'line', 5303
    __ARG_1.'print'('    ', __ARG_2, ' = ')
.annotate 'line', 5304
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5305
    __ARG_1.'say'('')
# }
 __label_2: # endif
# }
.annotate 'line', 5307

.end # emit


.sub 'emit_assign' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5310
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5311
    self.'annotate'(__ARG_1)
.annotate 'line', 5312
    __ARG_1.'print'('    ')
.annotate 'line', 5313
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5314
    __ARG_1.'say'(' = ', __ARG_3)
# }
.annotate 'line', 5315

.end # emit_assign


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5318
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5319
# rreg: $S1
    null $S1
.annotate 'line', 5320
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_0
    unless $P1 goto __label_0
# {
.annotate 'line', 5321
    $P2 = self.'tempreg'('P')
    set $S1, $P2
.annotate 'line', 5322
    __ARG_1.'emitnull'($S1)
# }
    goto __label_1
 __label_0: # else
.annotate 'line', 5325
    $P1 = __ARG_2.'emit_get'(__ARG_1)
    set $S1, $P1
 __label_1: # endif
.annotate 'line', 5326
    self.'annotate'(__ARG_1)
.annotate 'line', 5327
    __ARG_1.'print'('    ')
.annotate 'line', 5328
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5329
    __ARG_1.'say'(' = ', $S1)
.annotate 'line', 5330
    .return($S1)
# }
.annotate 'line', 5331

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IndexExpr' ]
.annotate 'line', 5225
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
    get_class $P2, [ 'SimpleArgList' ]
    addparent $P0, $P2
.annotate 'line', 5227
    addattribute $P0, 'left'
.annotate 'line', 5228
    addattribute $P0, 'regleft'
.annotate 'line', 5229
    addattribute $P0, 'argregs'
.end
.namespace [ 'ArrayExpr' ]

.sub 'ArrayExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5342
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5343
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'values', $P4
.annotate 'line', 5344
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5345
    $P3 = $P1.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_0
# {
.annotate 'line', 5346
    __ARG_1.'unget'($P1)
 __label_1: # do
.annotate 'line', 5347
# {
.annotate 'line', 5348
# var item: $P2
    $P2 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 5349
    getattribute $P3, self, 'values'
# predefined push
    push $P3, $P2
# }
 __label_3: # continue
.annotate 'line', 5350
    $P1 = __ARG_1.'get'()
    $P3 = $P1.'isop'(',')
    if_null $P3, __label_2
    if $P3 goto __label_1
 __label_2: # enddo
.annotate 'line', 5351
    $P3 = $P1.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_4
.annotate 'line', 5352
    'Expected'("']' or ','", $P1)
 __label_4: # endif
# }
 __label_0: # endif
# }
.annotate 'line', 5354

.end # ArrayExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5355
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5358
    getattribute $P1, self, 'values'
    'optimize_array'($P1)
.annotate 'line', 5359
    .return(self)
# }
.annotate 'line', 5360

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5363
    set $S2, __ARG_2
    eq $S2, '', __label_0
# {
.annotate 'line', 5364
# value: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
 __label_2:
.annotate 'line', 5365
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 5371
    self.'emit_init'(__ARG_1, '')
# }
 __label_1: # endif
# }
.annotate 'line', 5373

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5376
# container: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 5377
    self.'emit_init'(__ARG_1, $S1)
.annotate 'line', 5378
    .return($S1)
# }
.annotate 'line', 5379

.end # emit_get


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 5382
    self.'annotate'(__ARG_1)
.annotate 'line', 5383
# itemreg: $S1
    null $S1
.annotate 'line', 5384
# it_p: $S2
    null $S2
.annotate 'line', 5385
    eq __ARG_2, '', __label_0
# {
.annotate 'line', 5386
    __ARG_1.'say'('    ', 'root_new ', __ARG_2, ", ['parrot';'ResizablePMCArray']")
.annotate 'line', 5387
    $P2 = self.'tempreg'('P')
    set $S2, $P2
# }
 __label_0: # endif
.annotate 'line', 5389
    getattribute $P2, self, 'values'
    iter $P3, $P2
    set $P3, 0
 __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
# {
.annotate 'line', 5390
# type: $S3
    $P4 = $P1.'checkresult'()
    null $S3
    if_null $P4, __label_3
    set $S3, $P4
 __label_3:
.annotate 'line', 5391
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
.annotate 'line', 5393
# aux: $S4
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P2, __label_9
    set $S4, $P2
 __label_9:
.annotate 'line', 5394
    eq __ARG_2, '', __label_10
# {
.annotate 'line', 5395
    __ARG_1.'emitbox'($S2, $S4)
.annotate 'line', 5396
    set $S1, $S2
# }
 __label_10: # endif
    goto __label_4 # break
 __label_5: # default
.annotate 'line', 5400
    $P2 = $P1.'isnull'()
    if_null $P2, __label_11
    unless $P2 goto __label_11
# {
.annotate 'line', 5401
    eq __ARG_2, '', __label_13
# {
.annotate 'line', 5402
    $P4 = self.'tempreg'('P')
    set $S1, $P4
.annotate 'line', 5403
    __ARG_1.'emitnull'($S1)
# }
 __label_13: # endif
# }
    goto __label_12
 __label_11: # else
.annotate 'line', 5407
    $P2 = $P1.'emit_get'(__ARG_1)
    set $S1, $P2
 __label_12: # endif
 __label_4: # switch end
.annotate 'line', 5409
    eq __ARG_2, '', __label_14
# {
.annotate 'line', 5410
    self.'annotate'(__ARG_1)
.annotate 'line', 5411
    __ARG_1.'emitarg2'('push', __ARG_2, $S1)
# }
 __label_14: # endif
# }
    goto __label_1
 __label_2: # endfor
# }
.annotate 'line', 5414

.end # emit_init

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ArrayExpr' ]
.annotate 'line', 5336
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5338
    addattribute $P0, 'values'
.end
.namespace [ 'HashExpr' ]

.sub 'HashExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5426
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5427
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5428
# var keys: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 5429
# var values: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 5430
    $P6 = $P1.'isop'('}')
    isfalse $I1, $P6
    unless $I1 goto __label_0
# {
.annotate 'line', 5431
    __ARG_1.'unget'($P1)
 __label_1: # do
.annotate 'line', 5432
# {
.annotate 'line', 5433
# var key: $P4
    $P4 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 5434
    'ExpectOp'(':', __ARG_1)
.annotate 'line', 5435
# var value: $P5
    $P5 = 'parseExpr'(__ARG_1, __ARG_2)
.annotate 'line', 5436
# predefined push
    push $P2, $P4
.annotate 'line', 5437
# predefined push
    push $P3, $P5
# }
 __label_3: # continue
.annotate 'line', 5439
    $P1 = __ARG_1.'get'()
    $P6 = $P1.'isop'(',')
    if_null $P6, __label_2
    if $P6 goto __label_1
 __label_2: # enddo
.annotate 'line', 5440
    $P6 = $P1.'isop'('}')
    isfalse $I1, $P6
    unless $I1 goto __label_4
.annotate 'line', 5441
    'Expected'("',' or '}'", $P1)
 __label_4: # endif
# }
 __label_0: # endif
.annotate 'line', 5443
    setattribute self, 'keys', $P2
.annotate 'line', 5444
    setattribute self, 'values', $P3
# }
.annotate 'line', 5445

.end # HashExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5446
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5449
    getattribute $P1, self, 'keys'
    'optimize_array'($P1)
.annotate 'line', 5450
    getattribute $P1, self, 'values'
    'optimize_array'($P1)
.annotate 'line', 5451
    .return(self)
# }
.annotate 'line', 5452

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5455
    self.'annotate'(__ARG_1)
.annotate 'line', 5460
    set $S6, __ARG_2
    eq $S6, '', __label_0
.annotate 'line', 5461
    __ARG_1.'say'('    ', 'root_new ', __ARG_2, ", ['parrot';'Hash']")
 __label_0: # endif
.annotate 'line', 5463
# var keys: $P1
    getattribute $P1, self, 'keys'
.annotate 'line', 5464
# var values: $P2
    getattribute $P2, self, 'values'
.annotate 'line', 5465
# n: $I1
    set $P5, $P1
    set $I1, $P5
# for loop
.annotate 'line', 5466
# i: $I2
    null $I2
 __label_3: # for condition
    ge $I2, $I1, __label_2
# {
.annotate 'line', 5467
# var key: $P3
    $P3 = $P1[$I2]
.annotate 'line', 5468
# item: $S1
    null $S1
.annotate 'line', 5469
    $P5 = $P3.'isidentifier'()
    if_null $P5, __label_4
    unless $P5 goto __label_4
# {
.annotate 'line', 5470
# id: $S2
    $P6 = $P3.'getName'()
    null $S2
    if_null $P6, __label_6
    set $S2, $P6
 __label_6:
.annotate 'line', 5471
    $P5 = self.'tempreg'('P')
    set $S1, $P5
.annotate 'line', 5472
    __ARG_1.'say'('    ', 'get_hll_global ', $S1, ", '", $S2, "'")
# }
    goto __label_5
 __label_4: # else
.annotate 'line', 5475
    $P5 = $P3.'emit_get'(__ARG_1)
    set $S1, $P5
 __label_5: # endif
.annotate 'line', 5477
# var value: $P4
    $P4 = $P2[$I2]
.annotate 'line', 5478
# itemreg: $S3
    null $S3
.annotate 'line', 5479
    $P5 = $P4.'isnull'()
    if_null $P5, __label_7
    unless $P5 goto __label_7
# {
.annotate 'line', 5480
    set $S6, __ARG_2
    eq $S6, '', __label_9
# {
.annotate 'line', 5481
    $P6 = self.'tempreg'('P')
    set $S3, $P6
.annotate 'line', 5482
    __ARG_1.'emitnull'($S3)
# }
 __label_9: # endif
# }
    goto __label_8
 __label_7: # else
.annotate 'line', 5485
    $P5 = $P4.'isidentifier'()
    if_null $P5, __label_10
    unless $P5 goto __label_10
# {
.annotate 'line', 5486
# s: $S4
    $P6 = $P4.'checkIdentifier'()
    null $S4
    if_null $P6, __label_12
    set $S4, $P6
 __label_12:
.annotate 'line', 5487
    isnull $I3, $S4
    not $I3
    unless $I3 goto __label_15
    isne $I3, $S4, ''
 __label_15:
    unless $I3 goto __label_13
.annotate 'line', 5488
    set $S3, $S4
    goto __label_14
 __label_13: # else
# {
.annotate 'line', 5490
# id: $S5
    $P5 = $P4.'getName'()
    null $S5
    if_null $P5, __label_16
    set $S5, $P5
 __label_16:
.annotate 'line', 5491
    getattribute $P6, self, 'owner'
    $P5 = $P6.'getvar'($S5)
    unless_null $P5, __label_17
# {
.annotate 'line', 5492
    $P7 = self.'tempreg'('P')
    set $S3, $P7
.annotate 'line', 5493
    __ARG_1.'say'('    ', 'get_hll_global ', $S3, ", '", $S5, "'")
# }
    goto __label_18
 __label_17: # else
.annotate 'line', 5496
    $P5 = $P4.'emit_get'(__ARG_1)
    set $S3, $P5
 __label_18: # endif
# }
 __label_14: # endif
# }
    goto __label_11
 __label_10: # else
.annotate 'line', 5500
    $P5 = $P4.'emit_get'(__ARG_1)
    set $S3, $P5
 __label_11: # endif
 __label_8: # endif
.annotate 'line', 5501
    set $S6, __ARG_2
    eq $S6, '', __label_19
.annotate 'line', 5502
    __ARG_1.'say'('    ', __ARG_2, '[', $S1, '] = ', $S3)
 __label_19: # endif
# }
 __label_1: # for iteration
.annotate 'line', 5466
    inc $I2
    goto __label_3
 __label_2: # for end
# }
.annotate 'line', 5504

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5507
# container: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 5508
    self.'emit'(__ARG_1, $S1)
.annotate 'line', 5509
    .return($S1)
# }
.annotate 'line', 5510

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'HashExpr' ]
.annotate 'line', 5419
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5421
    addattribute $P0, 'keys'
.annotate 'line', 5422
    addattribute $P0, 'values'
.end
.namespace [ 'NewBaseExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5523
    .return('P')
# }

.end # checkresult


.sub 'parseinitializer' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5528
# var owner: $P1
    getattribute $P1, self, 'owner'
.annotate 'line', 5529
# var initializer: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 5530
# var t: $P3
    $P3 = __ARG_1.'get'()
.annotate 'line', 5531
    $P5 = $P3.'isop'(')')
    isfalse $I1, $P5
    unless $I1 goto __label_0
# {
.annotate 'line', 5532
    __ARG_1.'unget'($P3)
 __label_1: # do
.annotate 'line', 5533
# {
.annotate 'line', 5534
# var auxinit: $P4
    $P4 = 'parseExpr'(__ARG_1, $P1)
.annotate 'line', 5535
# predefined push
    push $P2, $P4
# }
 __label_3: # continue
.annotate 'line', 5536
    $P3 = __ARG_1.'get'()
    $P5 = $P3.'isop'(',')
    if_null $P5, __label_2
    if $P5 goto __label_1
 __label_2: # enddo
.annotate 'line', 5537
    'RequireOp'(')', $P3)
# }
 __label_0: # endif
.annotate 'line', 5539
    setattribute self, 'initializer', $P2
# }
.annotate 'line', 5540

.end # parseinitializer


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5543
    getattribute $P1, self, 'initializer'
    'optimize_array'($P1)
.annotate 'line', 5544
    .return(self)
# }
.annotate 'line', 5545

.end # optimize


.sub 'emit_constructor' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5548
    new $P1, ['ResizableStringArray']
.annotate 'line', 5549
    getattribute $P3, self, 'initializer'
    iter $P4, $P3
    set $P4, 0
 __label_0: # for iteration
    unless $P4 goto __label_1
    shift $P2, $P4
# {
.annotate 'line', 5550
# reg: $S1
    $P5 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P5, __label_2
    set $S1, $P5
 __label_2:
.annotate 'line', 5551
# predefined push
    push $P1, $S1
# }
    goto __label_0
 __label_1: # endfor
.annotate 'line', 5553
    __ARG_1.'print'('    ', __ARG_2, ".'", __ARG_3, "'(")
.annotate 'line', 5554
# predefined join
    join $S2, ", ", $P1
    __ARG_1.'print'($S2)
.annotate 'line', 5555
    __ARG_1.'say'(")")
# }
.annotate 'line', 5556

.end # emit_constructor

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NewBaseExpr' ]
.annotate 'line', 5515
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5517
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
.annotate 'line', 5567
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5569
    $I2 = __ARG_4.'isstring'()
    if $I2 goto __label_1
    $I2 = __ARG_4.'isidentifier'()
 __label_1:
    not $I1, $I2
    unless $I1 goto __label_0
.annotate 'line', 5570
    'SyntaxError'("Unimplemented", __ARG_4)
 __label_0: # endif
.annotate 'line', 5571
    setattribute self, 'value', __ARG_4
.annotate 'line', 5572
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5574
    $P2 = $P1.'isop'('(')
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 5575
    self.'parseinitializer'(__ARG_1)
    goto __label_3
 __label_2: # else
.annotate 'line', 5577
    __ARG_1.'unget'($P1)
 __label_3: # endif
# }
.annotate 'line', 5578

.end # NewExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5581
# var value: $P1
    getattribute $P1, self, 'value'
.annotate 'line', 5582
    isa $I1, $P1, [ 'Token' ]
    unless $I1 goto __label_1
    $I1 = $P1.'isidentifier'()
 __label_1:
    unless $I1 goto __label_0
# {
.annotate 'line', 5585
# var name: $P2
    $P2 = $P1.'getidentifier'()
.annotate 'line', 5586
# var desc: $P3
    getattribute $P4, self, 'owner'
    $P3 = $P4.'getvar'($P2)
.annotate 'line', 5587
    isnull $I1, $P3
    not $I1
    unless $I1 goto __label_3
    $I1 = $P3.'isconst'()
 __label_3:
    unless $I1 goto __label_2
# {
.annotate 'line', 5588
    $P4 = $P3.'getid'()
    unless_null $P4, __label_4
# {
.annotate 'line', 5589
    $P1 = $P3.'getvalue'()
.annotate 'line', 5590
    isa $I2, $P1, [ 'StringLiteral' ]
    not $I1, $I2
    unless $I1 goto __label_6
.annotate 'line', 5591
    'SyntaxError'('Constant value must evaluate to a string', $P1)
 __label_6: # endif
.annotate 'line', 5592
    getattribute $P5, $P1, 'strval'
    setattribute self, 'value', $P5
# }
    goto __label_5
 __label_4: # else
.annotate 'line', 5595
    'SyntaxError'('*Constant value must evaluate to a string', $P1)
 __label_5: # endif
# }
 __label_2: # endif
# }
 __label_0: # endif
.annotate 'line', 5599
    getattribute $P4, self, 'initializer'
    'optimize_array'($P4)
.annotate 'line', 5600
    .return(self)
# }
.annotate 'line', 5601

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 5604
    self.'annotate'(__ARG_1)
.annotate 'line', 5606
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5607
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
.annotate 'line', 5610
# type: $I2
    getattribute $P7, self, 'value'
    $P6 = $P7.'isstring'()
    if_null $P6, __label_3
    unless $P6 goto __label_3
    null $I2
    goto __label_2
 __label_3:
.annotate 'line', 5611
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
.annotate 'line', 5613
# reginit: $S1
    set $S1, ''
.annotate 'line', 5614
# regnew: $S2
    set $P6, __ARG_2
    null $S2
    if_null $P6, __label_6
    set $S2, $P6
 __label_6:
.annotate 'line', 5615
# constructor: $S3
    null $S3
.annotate 'line', 5616
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
.annotate 'line', 5621
    ne $I2, 1, __label_12
# {
.annotate 'line', 5622
    not $I5, __ARG_3
    unless $I5 goto __label_14
.annotate 'line', 5623
    $P6 = self.'tempreg'('P')
    set $S2, $P6
 __label_14: # endif
# }
    goto __label_13
 __label_12: # else
# {
.annotate 'line', 5626
# var initval: $P2
    $P2 = $P1[0]
.annotate 'line', 5627
    $P6 = $P2.'emit_get'(__ARG_1)
    set $S1, $P6
.annotate 'line', 5628
    concat $S0, ', ', $S1
    set $S1, $S0
# }
 __label_13: # endif
    goto __label_7 # break
 __label_8: # default
.annotate 'line', 5632
    eq $I2, 1, __label_15
.annotate 'line', 5633
    getattribute $P6, self, 'start'
    'SyntaxError'('Multiple init arguments not allowed here', $P6)
 __label_15: # endif
.annotate 'line', 5634
    not $I3, __ARG_3
    unless $I3 goto __label_16
.annotate 'line', 5635
    $P7 = self.'tempreg'('P')
    set $S2, $P7
 __label_16: # endif
 __label_7: # switch end
.annotate 'line', 5638
    set $I3, $I2
    null $I4
    if $I3 == $I4 goto __label_19
    set $I4, 1
    if $I3 == $I4 goto __label_20
    goto __label_18
# switch
 __label_19: # case
.annotate 'line', 5641
# name: $S4
    getattribute $P7, self, 'value'
    $P6 = $P7.'rawstring'()
    null $S4
    if_null $P6, __label_21
    set $S4, $P6
 __label_21:
.annotate 'line', 5642
# var aux: $P3
# predefined get_class
    get_class $P3, $S4
.annotate 'line', 5643
    isnull $I5, $P3
    unless $I5 goto __label_23
    $I5 = self.'dowarnings'()
 __label_23:
    unless $I5 goto __label_22
.annotate 'line', 5644
    concat $S5, "Can't locate class ", $S4
    concat $S5, $S5, " at compile time"
    getattribute $P8, self, 'value'
    'Warn'($S5, $P8)
 __label_22: # endif
.annotate 'line', 5648
    getattribute $P9, self, 'value'
    __ARG_1.'say'('    ', 'new ', $S2, ", [ ", $P9, " ]", $S1)
.annotate 'line', 5649
    le $I1, 1, __label_24
# {
.annotate 'line', 5650
    getattribute $P10, self, 'value'
    __ARG_1.'say'($S2, ".'", $P10, "'()")
# }
 __label_24: # endif
    goto __label_17 # break
 __label_20: # case
.annotate 'line', 5654
# var id: $P4
    getattribute $P6, self, 'owner'
    getattribute $P7, self, 'value'
    $P4 = $P6.'getvar'($P7)
.annotate 'line', 5655
    unless_null $P4, __label_25
# {
.annotate 'line', 5657
# var cl: $P5
    getattribute $P8, self, 'owner'
    getattribute $P9, self, 'value'
    $P5 = $P8.'checkclass'($P9)
.annotate 'line', 5658
    if_null $P5, __label_27
# {
.annotate 'line', 5659
    $P6 = $P5.'getclasskey'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P6, $S1)
# }
    goto __label_28
 __label_27: # else
# {
.annotate 'line', 5662
    $P6 = self.'dowarnings'()
    if_null $P6, __label_29
    unless $P6 goto __label_29
.annotate 'line', 5663
    'Warn'('Checking: new unknown type')
 __label_29: # endif
.annotate 'line', 5664
    getattribute $P6, self, 'value'
    __ARG_1.'say'('    ', 'new ', $S2, ", ['", $P6, "']", $S1)
# }
 __label_28: # endif
.annotate 'line', 5666
    getattribute $P6, self, 'value'
    set $S3, $P6
# }
    goto __label_26
 __label_25: # else
# {
.annotate 'line', 5670
    $P6 = $P4.'getreg'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P6, "", $S1)
# }
 __label_26: # endif
    goto __label_17 # break
 __label_18: # default
.annotate 'line', 5674
    'InternalError'('Unexpected type in new')
 __label_17: # switch end
.annotate 'line', 5676
    isgt $I3, $I1, 1
    if $I3 goto __label_31
    isge $I3, $I1, 0
    unless $I3 goto __label_32
    iseq $I3, $I2, 1
 __label_32:
 __label_31:
    unless $I3 goto __label_30
# {
.annotate 'line', 5677
    self.'emit_constructor'(__ARG_1, $S2, $S3)
.annotate 'line', 5678
    not $I3, __ARG_3
    unless $I3 goto __label_33
.annotate 'line', 5679
    __ARG_1.'emitset'(__ARG_2, $S2)
 __label_33: # endif
# }
 __label_30: # endif
# }
.annotate 'line', 5681

.end # emit


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5684
    .tailcall self.'emit'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 5685

.end # emit_init

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NewExpr' ]
.annotate 'line', 5561
    get_class $P1, [ 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 5563
    addattribute $P0, 'value'
.end
.namespace [ 'NewIndexedExpr' ]

.sub 'NewIndexedExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5696
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5697
    setattribute self, 'owner', __ARG_2
.annotate 'line', 5698
# var nskey: $P1
    new $P1, [ 'ClassSpecifierParrotKey' ]
    $P1.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5699
    setattribute self, 'nskey', $P1
.annotate 'line', 5700
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 5701
    $P3 = $P2.'isop'('(')
    if_null $P3, __label_0
    unless $P3 goto __label_0
.annotate 'line', 5702
    self.'parseinitializer'(__ARG_1)
    goto __label_1
 __label_0: # else
.annotate 'line', 5704
    __ARG_1.'unget'($P2)
 __label_1: # endif
# }
.annotate 'line', 5705

.end # NewIndexedExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5708
# reginit: $S1
    null $S1
.annotate 'line', 5709
# var init: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5710
# numinits: $I1
    unless_null $P1, __label_1
    null $I1
    goto __label_0
 __label_1:
# predefined elements
    elements $I1, $P1
 __label_0:
.annotate 'line', 5711
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
.annotate 'line', 5715
# var initval: $P2
    $P2 = $P1[0]
.annotate 'line', 5716
    $P4 = $P2.'emit_get'(__ARG_1)
    set $S1, $P4
    goto __label_2 # break
 __label_3: # default
.annotate 'line', 5719
    getattribute $P5, self, 'start'
    'SyntaxError'('Multiple init arguments not allowed here', $P5)
 __label_2: # switch end
.annotate 'line', 5721
# var nskey: $P3
    getattribute $P3, self, 'nskey'
.annotate 'line', 5722
    __ARG_1.'print'('    ')
.annotate 'line', 5723
    $P4 = $P3.'hasHLL'()
    if_null $P4, __label_6
    unless $P4 goto __label_6
.annotate 'line', 5724
    __ARG_1.'print'("root_")
 __label_6: # endif
.annotate 'line', 5725
    __ARG_1.'print'("new ", __ARG_2, ", ")
.annotate 'line', 5726
    null $P4
    $P3.'emit'(__ARG_1, $P4)
.annotate 'line', 5727
    if_null $S1, __label_7
.annotate 'line', 5728
    __ARG_1.'print'(', ', $S1)
 __label_7: # endif
.annotate 'line', 5729
    __ARG_1.'say'()
# }
.annotate 'line', 5730

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NewIndexedExpr' ]
.annotate 'line', 5690
    get_class $P1, [ 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 5692
    addattribute $P0, 'nskey'
.end
.namespace [ 'NewQualifiedExpr' ]

.sub 'NewQualifiedExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5741
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5742
    setattribute self, 'owner', __ARG_2
.annotate 'line', 5743
# var nskey: $P1
    new $P1, [ 'ClassSpecifierId' ]
    $P1.'ClassSpecifierId'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5744
    setattribute self, 'nskey', $P1
.annotate 'line', 5745
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 5746
    $P3 = $P2.'isop'('(')
    if_null $P3, __label_0
    unless $P3 goto __label_0
.annotate 'line', 5747
    self.'parseinitializer'(__ARG_1)
    goto __label_1
 __label_0: # else
.annotate 'line', 5749
    __ARG_1.'unget'($P2)
 __label_1: # endif
# }
.annotate 'line', 5750

.end # NewQualifiedExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5753
# reginit: $S1
    null $S1
.annotate 'line', 5754
# var init: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5756
# numinits: $I1
    unless_null $P1, __label_1
    set $I1, -1
    goto __label_0
 __label_1:
# predefined elements
    elements $I1, $P1
 __label_0:
.annotate 'line', 5757
# regnew: $S2
    set $P3, __ARG_2
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
 __label_2:
.annotate 'line', 5758
    le $I1, 0, __label_3
.annotate 'line', 5759
    $P3 = self.'tempreg'('P')
    set $S2, $P3
 __label_3: # endif
.annotate 'line', 5760
# var nskey: $P2
    getattribute $P2, self, 'nskey'
.annotate 'line', 5761
    __ARG_1.'print'('    ', 'new ', $S2, ", ")
.annotate 'line', 5762
    getattribute $P3, self, 'owner'
    $P2.'emit'(__ARG_1, $P3)
.annotate 'line', 5763
    __ARG_1.'say'()
.annotate 'line', 5765
    lt $I1, 0, __label_4
# {
.annotate 'line', 5766
# constructor: $S3
    $P3 = $P2.'last'()
    null $S3
    if_null $P3, __label_5
    set $S3, $P3
 __label_5:
.annotate 'line', 5767
    self.'emit_constructor'(__ARG_1, $S2, $S3)
.annotate 'line', 5768
    __ARG_1.'emitset'(__ARG_2, $S2)
# }
 __label_4: # endif
# }
.annotate 'line', 5770

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NewQualifiedExpr' ]
.annotate 'line', 5735
    get_class $P1, [ 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 5737
    addattribute $P0, 'nskey'
.end
.namespace [ ]

.sub 'parseNew'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5777
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5779
    $P3 = $P1.'isop'('(')
    if_null $P3, __label_0
    unless $P3 goto __label_0
# {
.annotate 'line', 5781
    new $P5, [ 'CallExpr' ]
.annotate 'line', 5782
    new $P7, [ 'StringLiteral' ]
    $P7.'StringLiteral'(__ARG_2, __ARG_3)
    set $P6, $P7
    $P5.'CallExpr'(__ARG_1, __ARG_2, __ARG_3, $P6)
    set $P4, $P5
.annotate 'line', 5781
    .return($P4)
# }
    goto __label_1
 __label_0: # else
.annotate 'line', 5784
    $P3 = $P1.'isop'('[')
    if_null $P3, __label_2
    unless $P3 goto __label_2
# {
.annotate 'line', 5786
    new $P5, [ 'NewIndexedExpr' ]
    $P5.'NewIndexedExpr'(__ARG_1, __ARG_2, __ARG_3)
    set $P4, $P5
    .return($P4)
# }
    goto __label_3
 __label_2: # else
.annotate 'line', 5788
    $P3 = $P1.'isidentifier'()
    if_null $P3, __label_4
    unless $P3 goto __label_4
# {
.annotate 'line', 5791
# var t2: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 5792
    __ARG_1.'unget'($P2)
.annotate 'line', 5793
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_6
    unless $P3 goto __label_6
# {
.annotate 'line', 5795
    new $P5, [ 'NewQualifiedExpr' ]
    $P5.'NewQualifiedExpr'(__ARG_1, __ARG_2, $P1)
    set $P4, $P5
    .return($P4)
# }
    goto __label_7
 __label_6: # else
# {
.annotate 'line', 5799
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
.annotate 'line', 5804
    new $P4, [ 'NewExpr' ]
    $P4.'NewExpr'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P3, $P4
    .return($P3)
# }
 __label_5: # endif
 __label_3: # endif
 __label_1: # endif
# }
.annotate 'line', 5806

.end # parseNew

.namespace [ 'OpInstanceOfExpr' ]

.sub 'OpInstanceOfExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 5817
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5818
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 5819
    $P2 = 'parseClassSpecifier'(__ARG_4, self)
    setattribute self, 'checked', $P2
# }
.annotate 'line', 5820

.end # OpInstanceOfExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5823
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 5824
    .return(self)
# }
.annotate 'line', 5825

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5826
    .return('I')
# }

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5829
# var checked: $P1
    getattribute $P1, self, 'checked'
.annotate 'line', 5831
# r: $S1
    null $S1
.annotate 'line', 5832
    set $S3, __ARG_2
    ne $S3, '', __label_0
.annotate 'line', 5833
    $P2 = self.'tempreg'('I')
    set $S1, $P2
    goto __label_1
 __label_0: # else
.annotate 'line', 5835
    set $S1, __ARG_2
 __label_1: # endif
.annotate 'line', 5836
# check: $S2
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
 __label_2:
.annotate 'line', 5837
    self.'annotate'(__ARG_1)
.annotate 'line', 5838
    __ARG_1.'print'('    isa ', $S1, ', ', $S2, ', ')
.annotate 'line', 5839
    getattribute $P2, self, 'owner'
    $P1.'emit'(__ARG_1, $P2)
.annotate 'line', 5840
    __ARG_1.'say'()
# }
.annotate 'line', 5841

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpInstanceOfExpr' ]
.annotate 'line', 5810
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5812
    addattribute $P0, 'lexpr'
.annotate 'line', 5813
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
.annotate 'line', 5858
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5859
    new $P3, [ 'Condition' ]
    $P2 = $P3.'set'(__ARG_3)
    setattribute self, 'condition', $P2
.annotate 'line', 5860
    setattribute self, 'etrue', __ARG_4
.annotate 'line', 5861
    setattribute self, 'efalse', __ARG_5
.annotate 'line', 5862
    .return(self)
# }
.annotate 'line', 5863

.end # OpConditionalExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5866
    getattribute $P3, self, 'condition'
    $P2 = $P3.'optimize'()
    setattribute self, 'condition', $P2
.annotate 'line', 5867
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
.annotate 'line', 5869
    getattribute $P3, self, 'etrue'
    .tailcall $P3.'optimize'()
 __label_3: # case
.annotate 'line', 5871
    getattribute $P4, self, 'efalse'
    .tailcall $P4.'optimize'()
 __label_1: # default
.annotate 'line', 5873
    getattribute $P7, self, 'etrue'
    $P6 = $P7.'optimize'()
    setattribute self, 'etrue', $P6
.annotate 'line', 5874
    getattribute $P10, self, 'efalse'
    $P9 = $P10.'optimize'()
    setattribute self, 'efalse', $P9
.annotate 'line', 5875
    .return(self)
 __label_0: # switch end
# }
.annotate 'line', 5877

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5880
    getattribute $P1, self, 'etrue'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 5881

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5884
# cond_end: $S1
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 5885
# cond_false: $S2
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 5886
    getattribute $P1, self, 'condition'
    $P1.'emit_else'(__ARG_1, $S2)
.annotate 'line', 5887
    getattribute $P1, self, 'etrue'
    $P1.'emit'(__ARG_1, __ARG_2)
.annotate 'line', 5888
    __ARG_1.'emitgoto'($S1)
.annotate 'line', 5889
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 5890
    getattribute $P1, self, 'efalse'
    $P1.'emit'(__ARG_1, __ARG_2)
.annotate 'line', 5891
    __ARG_1.'emitlabel'($S1)
# }
.annotate 'line', 5892

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpConditionalExpr' ]
.annotate 'line', 5846
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5852
    addattribute $P0, 'condition'
.annotate 'line', 5853
    addattribute $P0, 'etrue'
.annotate 'line', 5854
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
.annotate 'line', 5936
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
.annotate 'line', 5937
    .return(1)
 __label_3: # case
.annotate 'line', 5938
    .return(2)
 __label_4: # case
.annotate 'line', 5939
    .return(3)
 __label_1: # default
.annotate 'line', 5940
    .return(0)
 __label_0: # switch end
# }
.annotate 'line', 5942

.end # getOpCode_2


.sub 'getOpCode_4'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5946
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
.annotate 'line', 5947
    .return(8)
 __label_3: # case
.annotate 'line', 5948
    .return(11)
 __label_4: # case
.annotate 'line', 5949
    .return(9)
 __label_5: # case
.annotate 'line', 5950
    .return(10)
 __label_1: # default
.annotate 'line', 5952
    $P2 = __ARG_1.'iskeyword'('delete')
    if_null $P2, __label_6
    unless $P2 goto __label_6
    .return(31)
    goto __label_7
 __label_6: # else
.annotate 'line', 5953
    $P3 = __ARG_1.'iskeyword'('exists')
    if_null $P3, __label_8
    unless $P3 goto __label_8
    .return(32)
    goto __label_9
 __label_8: # else
.annotate 'line', 5954
    .return(0)
 __label_9: # endif
 __label_7: # endif
 __label_0: # switch end
# }
.annotate 'line', 5956

.end # getOpCode_4


.sub 'getOpCode_5'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5960
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
.annotate 'line', 5961
    .return(19)
 __label_3: # case
.annotate 'line', 5962
    .return(20)
 __label_4: # case
.annotate 'line', 5963
    .return(21)
 __label_5: # case
.annotate 'line', 5964
    .return(22)
 __label_1: # default
.annotate 'line', 5965
    .return(0)
 __label_0: # switch end
# }
.annotate 'line', 5967

.end # getOpCode_5


.sub 'getOpCode_7'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5971
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    set $S2, '<<'
    if $S1 == $S2 goto __label_2
    set $S2, '>>'
    if $S1 == $S2 goto __label_3
    goto __label_1
# switch
 __label_2: # case
.annotate 'line', 5972
    .return(28)
 __label_3: # case
.annotate 'line', 5973
    .return(29)
 __label_1: # default
.annotate 'line', 5974
    .return(0)
 __label_0: # switch end
# }
.annotate 'line', 5976

.end # getOpCode_7


.sub 'getOpCode_8'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5980
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
.annotate 'line', 5981
    .return(14)
 __label_3: # case
.annotate 'line', 5982
    .return(16)
 __label_4: # case
.annotate 'line', 5983
    .return(15)
 __label_5: # case
.annotate 'line', 5984
    .return(17)
 __label_1: # default
.annotate 'line', 5986
    $P2 = __ARG_1.'iskeyword'('instanceof')
    if_null $P2, __label_6
    unless $P2 goto __label_6
    .return(27)
    goto __label_7
 __label_6: # else
.annotate 'line', 5987
    .return(0)
 __label_7: # endif
 __label_0: # switch end
# }
.annotate 'line', 5989

.end # getOpCode_8


.sub 'getOpCode_9'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5993
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
.annotate 'line', 5994
    .return(12)
 __label_3: # case
.annotate 'line', 5995
    .return(13)
 __label_4: # case
.annotate 'line', 5996
    .return(25)
 __label_5: # case
.annotate 'line', 5997
    .return(26)
 __label_1: # default
.annotate 'line', 5998
    .return(0)
 __label_0: # switch end
# }
.annotate 'line', 6000

.end # getOpCode_9


.sub 'getOpCode_16'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6004
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
.annotate 'line', 6005
    .return(4)
 __label_3: # case
.annotate 'line', 6006
    .return(5)
 __label_4: # case
.annotate 'line', 6007
    .return(6)
 __label_5: # case
.annotate 'line', 6008
    .return(18)
 __label_6: # case
.annotate 'line', 6009
    .return(23)
 __label_7: # case
.annotate 'line', 6010
    .return(24)
 __label_8: # case
.annotate 'line', 6011
    .return(30)
 __label_1: # default
.annotate 'line', 6012
    .return(0)
 __label_0: # switch end
# }
.annotate 'line', 6014

.end # getOpCode_16


.sub 'parseExpr_0'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6018
.const 'Sub' $P3 = 'parseExpr'
.annotate 'line', 6020
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 6021
# var expr: $P2
    null $P2
.annotate 'line', 6022
    $P4 = $P1.'isop'('(')
    if_null $P4, __label_0
    unless $P4 goto __label_0
# {
.annotate 'line', 6023
    $P2 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 6024
    'ExpectOp'(')', __ARG_1)
.annotate 'line', 6025
    .return($P2)
# }
 __label_0: # endif
.annotate 'line', 6027
    $P4 = $P1.'isop'('[')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 6028
    new $P6, [ 'ArrayExpr' ]
    $P6.'ArrayExpr'(__ARG_1, __ARG_2, $P1)
    set $P5, $P6
    .return($P5)
 __label_1: # endif
.annotate 'line', 6029
    $P4 = $P1.'isop'('{')
    if_null $P4, __label_2
    unless $P4 goto __label_2
.annotate 'line', 6030
    new $P6, [ 'HashExpr' ]
    $P6.'HashExpr'(__ARG_1, __ARG_2, $P1)
    set $P5, $P6
    .return($P5)
 __label_2: # endif
.annotate 'line', 6031
    $P4 = $P1.'isstring'()
    if_null $P4, __label_3
    unless $P4 goto __label_3
.annotate 'line', 6032
    new $P6, [ 'StringLiteral' ]
    $P6.'StringLiteral'(__ARG_2, $P1)
    set $P5, $P6
    .return($P5)
 __label_3: # endif
.annotate 'line', 6033
    $P4 = $P1.'isint'()
    if_null $P4, __label_4
    unless $P4 goto __label_4
.annotate 'line', 6034
    new $P6, [ 'IntegerLiteral' ]
    $P6.'IntegerLiteral'(__ARG_2, $P1)
    set $P5, $P6
    .return($P5)
 __label_4: # endif
.annotate 'line', 6035
    $P4 = $P1.'isfloat'()
    if_null $P4, __label_5
    unless $P4 goto __label_5
.annotate 'line', 6036
    new $P6, [ 'FloatLiteral' ]
    $P6.'FloatLiteral'(__ARG_2, $P1)
    set $P5, $P6
    .return($P5)
 __label_5: # endif
.annotate 'line', 6037
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
.annotate 'line', 6039
    .tailcall 'parseNew'(__ARG_1, __ARG_2, $P1)
 __label_9: # case
.annotate 'line', 6041
    new $P6, [ 'FunctionExpr' ]
    $P6.'FunctionExpr'(__ARG_1, __ARG_2, $P1)
    set $P5, $P6
    .return($P5)
 __label_10: # case
.annotate 'line', 6043
    new $P8, [ 'OpClassExpr' ]
    $P8.'OpClassExpr'(__ARG_1, __ARG_2, $P1)
    set $P7, $P8
    .return($P7)
 __label_7: # default
 __label_6: # switch end
.annotate 'line', 6045
    $P4 = $P1.'isidentifier'()
    if_null $P4, __label_11
    unless $P4 goto __label_11
.annotate 'line', 6046
    new $P6, [ 'IdentifierExpr' ]
    $P6.'IdentifierExpr'(__ARG_2, $P1)
    set $P5, $P6
    .return($P5)
 __label_11: # endif
.annotate 'line', 6047
    'SyntaxError'('Expression expected', $P1)
# }
.annotate 'line', 6048

.end # parseExpr_0


.sub 'parseExpr_2'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6052
.const 'Sub' $P5 = 'parseExpr_0'
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
.const 'Sub' $P4 = 'parseExpr_3'
.const 'Sub' $P5 = 'getOpCode_4'
.annotate 'line', 6105
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 6106
# code: $I1
    $P6 = $P5($P1)
    set $I1, $P6
.annotate 'line', 6107
    eq $I1, 0, __label_0
# {
.annotate 'line', 6108
# var subexpr: $P2
    $P2 = $P3(__ARG_1, __ARG_2)
.annotate 'line', 6109
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
.annotate 'line', 6111
    new $P7, [ 'OpUnaryMinusExpr' ]
    $P7.'OpUnaryMinusExpr'(__ARG_2, $P1, $P2)
    set $P6, $P7
    .return($P6)
 __label_5: # case
.annotate 'line', 6113
    new $P9, [ 'OpNotExpr' ]
    $P9.'OpNotExpr'(__ARG_2, $P1, $P2)
    set $P8, $P9
    .return($P8)
 __label_6: # case
.annotate 'line', 6115
    new $P11, [ 'OpPreIncExpr' ]
    $P11.'OpPreIncExpr'(__ARG_2, $P1, $P2)
    set $P10, $P11
    .return($P10)
 __label_7: # case
.annotate 'line', 6117
    new $P13, [ 'OpPreDecExpr' ]
    $P13.'OpPreDecExpr'(__ARG_2, $P1, $P2)
    set $P12, $P13
    .return($P12)
 __label_8: # case
.annotate 'line', 6119
    new $P15, [ 'OpDeleteExpr' ]
    $P15.'OpDeleteExpr'(__ARG_2, $P1, $P2)
    set $P14, $P15
    .return($P14)
 __label_9: # case
.annotate 'line', 6121
    new $P17, [ 'OpExistsExpr' ]
    $P17.'OpExistsExpr'(__ARG_2, $P1, $P2)
    set $P16, $P17
    .return($P16)
 __label_3: # default
.annotate 'line', 6123
    'InternalError'('Invalid code in parseExpr_4', $P1)
 __label_2: # switch end
# }
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 6127
    __ARG_1.'unget'($P1)
.annotate 'line', 6128
    .tailcall $P4(__ARG_1, __ARG_2)
# }
 __label_1: # endif
# }
.annotate 'line', 6130

.end # parseExpr_4


.sub 'parseExpr_5'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6134
.const 'Sub' $P4 = 'parseExpr_4'
.const 'Sub' $P5 = 'getOpCode_5'
.annotate 'line', 6136
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6137
# var t: $P2
    null $P2
.annotate 'line', 6138
# code: $I1
    null $I1
 __label_1: # while
.annotate 'line', 6139
    $P2 = __ARG_1.'get'()
    $P6 = $P5($P2)
    set $I1, $P6
    eq $I1, 0, __label_0
# {
.annotate 'line', 6140
# var rexpr: $P3
    $P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6141
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
.annotate 'line', 6143
    new $P6, [ 'OpMulExpr' ]
    $P6.'OpMulExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P6
    goto __label_2 # break
 __label_5: # case
.annotate 'line', 6146
    new $P7, [ 'OpDivExpr' ]
    $P7.'OpDivExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P7
    goto __label_2 # break
 __label_6: # case
.annotate 'line', 6149
    new $P8, [ 'OpModExpr' ]
    $P8.'OpModExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P8
    goto __label_2 # break
 __label_7: # case
.annotate 'line', 6152
    new $P9, [ 'OpCModExpr' ]
    $P9.'OpCModExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P9
    goto __label_2 # break
 __label_3: # default
.annotate 'line', 6155
    'InternalError'('Invalid code in parseExpr_5', $P2)
 __label_2: # switch end
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6158
    __ARG_1.'unget'($P2)
.annotate 'line', 6159
    .return($P1)
# }
.annotate 'line', 6160

.end # parseExpr_5


.sub 'parseExpr_6'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6164
.const 'Sub' $P5 = 'parseExpr_5'
.annotate 'line', 6166
# var lexpr: $P1
    $P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6167
# var t: $P2
    null $P2
 __label_1: # while
.annotate 'line', 6168
    $P2 = __ARG_1.'get'()
    $I1 = $P2.'isop'('+')
    if $I1 goto __label_2
    $I1 = $P2.'isop'('-')
 __label_2:
    unless $I1 goto __label_0
# {
.annotate 'line', 6169
# var rexpr: $P3
    $P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6170
# var expr: $P4
    null $P4
.annotate 'line', 6171
    $P6 = $P2.'isop'('+')
    if_null $P6, __label_3
    unless $P6 goto __label_3
.annotate 'line', 6172
    new $P7, [ 'OpAddExpr' ]
    $P7.'OpAddExpr'(__ARG_2, $P2, $P1, $P3)
    set $P4, $P7
    goto __label_4
 __label_3: # else
.annotate 'line', 6174
    new $P8, [ 'OpSubExpr' ]
    $P8.'OpSubExpr'(__ARG_2, $P2, $P1, $P3)
    set $P4, $P8
 __label_4: # endif
.annotate 'line', 6175
    set $P1, $P4
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6177
    __ARG_1.'unget'($P2)
.annotate 'line', 6178
    .return($P1)
# }
.annotate 'line', 6179

.end # parseExpr_6


.sub 'parseExpr_7'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6183
.const 'Sub' $P4 = 'parseExpr_6'
.annotate 'line', 6185
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6186
# var rexpr: $P2
    null $P2
.annotate 'line', 6187
# var t: $P3
    null $P3
.annotate 'line', 6188
# code: $I1
    null $I1
 __label_1: # while
.annotate 'line', 6189
    $P3 = __ARG_1.'get'()
    $P5 = 'getOpCode_7'($P3)
    set $I1, $P5
    eq $I1, 0, __label_0
# {
.annotate 'line', 6190
    set $I2, $I1
    set $I3, 28
    if $I2 == $I3 goto __label_4
    set $I3, 29
    if $I2 == $I3 goto __label_5
    goto __label_3
# switch
 __label_4: # case
.annotate 'line', 6192
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6193
    new $P6, [ 'OpShiftleftExpr' ]
    $P6.'OpShiftleftExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P6
    goto __label_2 # break
 __label_5: # case
.annotate 'line', 6196
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6197
    new $P7, [ 'OpShiftrightExpr' ]
    $P7.'OpShiftrightExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P7
    goto __label_2 # break
 __label_3: # default
.annotate 'line', 6200
    'InternalError'('Invalid code in parseExpr_7', $P3)
 __label_2: # switch end
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6203
    __ARG_1.'unget'($P3)
.annotate 'line', 6204
    .return($P1)
# }
.annotate 'line', 6205

.end # parseExpr_7


.sub 'parseExpr_8'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6209
.const 'Sub' $P4 = 'parseExpr_7'
.const 'Sub' $P5 = 'getOpCode_8'
.annotate 'line', 6211
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6212
# var rexpr: $P2
    null $P2
.annotate 'line', 6213
# var t: $P3
    null $P3
.annotate 'line', 6214
# code: $I1
    null $I1
 __label_1: # while
.annotate 'line', 6215
    $P3 = __ARG_1.'get'()
    $P6 = $P5($P3)
    set $I1, $P6
    eq $I1, 0, __label_0
# {
.annotate 'line', 6216
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
.annotate 'line', 6218
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6219
    new $P7, [ 'OpLessExpr' ]
    $P1 = $P7.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_2 # break
 __label_5: # case
.annotate 'line', 6222
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6223
    new $P8, [ 'OpGreaterExpr' ]
    $P1 = $P8.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_2 # break
 __label_6: # case
.annotate 'line', 6226
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6227
    new $P9, [ 'OpLessEqualExpr' ]
    $P1 = $P9.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_2 # break
 __label_7: # case
.annotate 'line', 6230
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6231
    new $P10, [ 'OpGreaterEqualExpr' ]
    $P1 = $P10.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_2 # break
 __label_8: # case
.annotate 'line', 6234
    new $P11, [ 'OpInstanceOfExpr' ]
    $P11.'OpInstanceOfExpr'(__ARG_2, $P3, $P1, __ARG_1)
    set $P1, $P11
    goto __label_2 # break
 __label_3: # default
.annotate 'line', 6237
    'InternalError'('Invalid code in parseExpr_9', $P3)
 __label_2: # switch end
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6240
    __ARG_1.'unget'($P3)
.annotate 'line', 6241
    .return($P1)
# }
.annotate 'line', 6242

.end # parseExpr_8


.sub 'parseExpr_9'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6246
.const 'Sub' $P4 = 'parseExpr_8'
.const 'Sub' $P5 = 'getOpCode_9'
.annotate 'line', 6248
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6249
# var rexpr: $P2
    null $P2
.annotate 'line', 6250
# var t: $P3
    null $P3
.annotate 'line', 6251
# code: $I1
    null $I1
 __label_1: # while
.annotate 'line', 6252
    $P3 = __ARG_1.'get'()
    $P6 = $P5($P3)
    set $I1, $P6
    eq $I1, 0, __label_0
# {
.annotate 'line', 6253
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
.annotate 'line', 6255
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6256
    new $P7, [ 'OpEqualExpr' ]
    $P1 = $P7.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_2 # break
 __label_5: # case
.annotate 'line', 6259
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6260
    new $P8, [ 'OpNotEqualExpr' ]
    $P1 = $P8.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_2 # break
 __label_6: # case
.annotate 'line', 6263
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6264
    new $P9, [ 'OpSameExpr' ]
    $P9.'OpSameExpr'(1, __ARG_2, $P3, $P1, $P2)
    set $P1, $P9
    goto __label_2 # break
 __label_7: # case
.annotate 'line', 6267
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6268
    new $P10, [ 'OpSameExpr' ]
    $P10.'OpSameExpr'(0, __ARG_2, $P3, $P1, $P2)
    set $P1, $P10
    goto __label_2 # break
 __label_3: # default
.annotate 'line', 6271
    'InternalError'('Invalid code in parseExpr_8', $P3)
 __label_2: # switch end
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6274
    __ARG_1.'unget'($P3)
.annotate 'line', 6275
    .return($P1)
# }
.annotate 'line', 6276

.end # parseExpr_9


.sub 'parseExpr_10'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6280
.const 'Sub' $P4 = 'parseExpr_9'
.annotate 'line', 6282
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6283
# var t: $P2
    null $P2
 __label_1: # while
.annotate 'line', 6284
    $P2 = __ARG_1.'get'()
    $P5 = $P2.'isop'('&')
    if_null $P5, __label_0
    unless $P5 goto __label_0
# {
.annotate 'line', 6285
# var rexpr: $P3
    $P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6286
    new $P5, [ 'OpBinAndExpr' ]
    $P5.'OpBinAndExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P5
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6288
    __ARG_1.'unget'($P2)
.annotate 'line', 6289
    .return($P1)
# }
.annotate 'line', 6290

.end # parseExpr_10


.sub 'parseExpr_11'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6294
.const 'Sub' $P4 = 'parseExpr_10'
.annotate 'line', 6296
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6297
# var t: $P2
    null $P2
 __label_1: # while
.annotate 'line', 6298
    $P2 = __ARG_1.'get'()
    $P5 = $P2.'isop'('^')
    if_null $P5, __label_0
    unless $P5 goto __label_0
# {
.annotate 'line', 6299
# var rexpr: $P3
    $P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6300
    new $P5, [ 'OpBinXorExpr' ]
    $P5.'OpBinXorExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P5
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6302
    __ARG_1.'unget'($P2)
.annotate 'line', 6303
    .return($P1)
# }
.annotate 'line', 6304

.end # parseExpr_11


.sub 'parseExpr_12'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6308
.const 'Sub' $P4 = 'parseExpr_11'
.annotate 'line', 6310
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6311
# var t: $P2
    null $P2
 __label_1: # while
.annotate 'line', 6312
    $P2 = __ARG_1.'get'()
    $P5 = $P2.'isop'('|')
    if_null $P5, __label_0
    unless $P5 goto __label_0
# {
.annotate 'line', 6313
# var rexpr: $P3
    $P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6314
    new $P5, [ 'OpBinOrExpr' ]
    $P5.'OpBinOrExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P5
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6316
    __ARG_1.'unget'($P2)
.annotate 'line', 6317
    .return($P1)
# }
.annotate 'line', 6318

.end # parseExpr_12


.sub 'parseExpr_13'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6322
.const 'Sub' $P4 = 'parseExpr_12'
.annotate 'line', 6324
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6325
# var t: $P2
    null $P2
 __label_1: # while
.annotate 'line', 6326
    $P2 = __ARG_1.'get'()
    $P5 = $P2.'isop'('&&')
    if_null $P5, __label_0
    unless $P5 goto __label_0
# {
.annotate 'line', 6327
# var rexpr: $P3
    $P3 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6328
    new $P5, [ 'OpBoolAndExpr' ]
    $P5.'OpBoolAndExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P5
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6330
    __ARG_1.'unget'($P2)
.annotate 'line', 6331
    .return($P1)
# }
.annotate 'line', 6332

.end # parseExpr_13


.sub 'parseExpr_14'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6336
.const 'Sub' $P4 = 'parseExpr_13'
.annotate 'line', 6338
# var lexpr: $P1
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6339
# var t: $P2
    null $P2
 __label_1: # while
.annotate 'line', 6340
    $P2 = __ARG_1.'get'()
    $P5 = $P2.'isop'('||')
    if_null $P5, __label_0
    unless $P5 goto __label_0
# {
.annotate 'line', 6341
# var rexpr: $P3
    $P3 = 'parseExpr_12'(__ARG_1, __ARG_2)
.annotate 'line', 6342
    new $P5, [ 'OpBoolOrExpr' ]
    $P5.'OpBoolOrExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P5
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6344
    __ARG_1.'unget'($P2)
.annotate 'line', 6345
    .return($P1)
# }
.annotate 'line', 6346

.end # parseExpr_14


.sub 'parseExpr_15'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6350
.const 'Sub' $P5 = 'parseExpr_16'
.const 'Sub' $P6 = 'parseExpr_14'
.annotate 'line', 6352
# var econd: $P1
    $P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 6353
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 6354
    $P7 = $P2.'isop'('?')
    if_null $P7, __label_0
    unless $P7 goto __label_0
# {
.annotate 'line', 6355
# var etrue: $P3
    $P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6356
    'ExpectOp'(':', __ARG_1)
.annotate 'line', 6357
# var efalse: $P4
    $P4 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6358
    new $P8, [ 'OpConditionalExpr' ]
    $P8.'OpConditionalExpr'(__ARG_2, $P2, $P1, $P3, $P4)
    set $P7, $P8
    .return($P7)
# }
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 6361
    __ARG_1.'unget'($P2)
.annotate 'line', 6362
    .return($P1)
# }
 __label_1: # endif
# }
.annotate 'line', 6364

.end # parseExpr_15


.sub 'parseExpr_16'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6368
.const 'Sub' $P5 = 'parseExpr_16'
.const 'Sub' $P6 = 'parseExpr_15'
.const 'Sub' $P7 = 'getOpCode_16'
.annotate 'line', 6370
# var lexpr: $P1
    $P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 6371
# var t: $P2
    null $P2
.annotate 'line', 6372
# code: $I1
    null $I1
 __label_1: # while
.annotate 'line', 6373
    $P2 = __ARG_1.'get'()
    $P8 = $P7($P2)
    set $I1, $P8
    eq $I1, 0, __label_0
# {
.annotate 'line', 6374
# var rexpr: $P3
    $P3 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6375
# var expr: $P4
    null $P4
.annotate 'line', 6376
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
.annotate 'line', 6378
    new $P4, [ 'OpAssignExpr' ]
    goto __label_2 # break
 __label_5: # case
.annotate 'line', 6381
    new $P4, [ 'OpAssignToExpr' ]
    goto __label_2 # break
 __label_6: # case
.annotate 'line', 6384
    new $P4, [ 'OpAddToExpr' ]
    goto __label_2 # break
 __label_7: # case
.annotate 'line', 6387
    new $P4, [ 'OpSubToExpr' ]
    goto __label_2 # break
 __label_8: # case
.annotate 'line', 6390
    new $P4, [ 'OpMulToExpr' ]
    goto __label_2 # break
 __label_9: # case
.annotate 'line', 6393
    new $P4, [ 'OpDivToExpr' ]
    goto __label_2 # break
 __label_10: # case
.annotate 'line', 6396
    new $P4, [ 'OpModToExpr' ]
    goto __label_2 # break
 __label_3: # default
.annotate 'line', 6399
    'InternalError'('Unexpected code in parseExpr_16', $P2)
 __label_2: # switch end
.annotate 'line', 6401
    $P4.'set'(__ARG_2, $P2, $P1, $P3)
.annotate 'line', 6402
    set $P1, $P4
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 6404
    __ARG_1.'unget'($P2)
.annotate 'line', 6405
    .return($P1)
# }
.annotate 'line', 6406

.end # parseExpr_16


.sub 'parseExpr'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6410
.const 'Sub' $P1 = 'parseExpr_16'
.annotate 'line', 6412
    .tailcall $P1(__ARG_1, __ARG_2)
# }
.annotate 'line', 6413

.end # parseExpr

.namespace [ 'Breakable' ]

.sub 'genbreaklabel' :method
# Body
# {
.annotate 'line', 6428
    getattribute $P1, self, 'brlabel'
    if_null $P1, __label_0
.annotate 'line', 6429
    'InternalError'('attempt to generate break label twice')
 __label_0: # endif
.annotate 'line', 6430
# label: $S1
    $P1 = self.'genlabel'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
 __label_1:
.annotate 'line', 6431
    box $P1, $S1
    setattribute self, 'brlabel', $P1
.annotate 'line', 6432
    .return($S1)
# }
.annotate 'line', 6433

.end # genbreaklabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6436
# var label: $P1
    getattribute $P1, self, 'brlabel'
.annotate 'line', 6437
    unless_null $P1, __label_0
.annotate 'line', 6438
    'InternalError'('attempt to get break label before creating it')
 __label_0: # endif
.annotate 'line', 6439
    .return($P1)
# }
.annotate 'line', 6440

.end # getbreaklabel

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Breakable' ]
.annotate 'line', 6424
    addattribute $P0, 'brlabel'
.end
.namespace [ 'Continuable' ]

.sub 'gencontinuelabel' :method
# Body
# {
.annotate 'line', 6449
    getattribute $P1, self, 'cntlabel'
    if_null $P1, __label_0
.annotate 'line', 6450
    'InternalError'('attempt to generate continue label twice')
 __label_0: # endif
.annotate 'line', 6451
# label: $S1
    $P1 = self.'genlabel'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
 __label_1:
.annotate 'line', 6452
    box $P1, $S1
    setattribute self, 'cntlabel', $P1
.annotate 'line', 6453
    .return($S1)
# }
.annotate 'line', 6454

.end # gencontinuelabel


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6457
# var label: $P1
    getattribute $P1, self, 'cntlabel'
.annotate 'line', 6458
    unless_null $P1, __label_0
.annotate 'line', 6459
    'InternalError'('attempt to get continue label before creating it')
 __label_0: # endif
.annotate 'line', 6460
    .return($P1)
# }
.annotate 'line', 6461

.end # getcontinuelabel

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Continuable' ]
.annotate 'line', 6443
    get_class $P1, [ 'Breakable' ]
    addparent $P0, $P1
.annotate 'line', 6445
    addattribute $P0, 'cntlabel'
.end
.namespace [ 'ReturnYieldStatement' ]

.sub 'parse' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6477
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6478
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6479
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_0
# {
.annotate 'line', 6480
    __ARG_2.'unget'($P1)
.annotate 'line', 6481
    new $P4, [ 'ArgumentList' ]
    $P4.'ArgumentList'(__ARG_3, __ARG_1, __ARG_2, ";")
    set $P3, $P4
    setattribute self, 'values', $P3
# }
 __label_0: # endif
# }
.annotate 'line', 6483

.end # parse


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6486
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 6487
    if_null $P1, __label_0
.annotate 'line', 6488
    $P1 = $P1.'optimize'()
 __label_0: # endif
.annotate 'line', 6489
    .return(self)
# }
.annotate 'line', 6490

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6494
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 6495
# n: $I1
    unless_null $P1, __label_1
    null $I1
    goto __label_0
 __label_1:
# predefined int
    $P3 = $P1.'numargs'()
    set $I1, $P3
 __label_0:
.annotate 'line', 6498
    iseq $I2, $I1, 1
    unless $I2 goto __label_3
    isa $I2, self, [ 'ReturnStatement' ]
 __label_3:
    unless $I2 goto __label_2
# {
.annotate 'line', 6499
# var func: $P2
    $P2 = $P1.'getfreearg'(0)
.annotate 'line', 6500
    $P3 = $P2.'cantailcall'()
    if_null $P3, __label_4
    unless $P3 goto __label_4
# {
.annotate 'line', 6501
    self.'annotate'(__ARG_1)
.annotate 'line', 6502
    .tailcall $P2.'emit'(__ARG_1, '.tailcall')
# }
 __label_4: # endif
# }
 __label_2: # endif
.annotate 'line', 6506
    le $I1, 0, __label_5
.annotate 'line', 6507
    $P1.'getargvalues'(__ARG_1)
 __label_5: # endif
.annotate 'line', 6509
    self.'annotate'(__ARG_1)
.annotate 'line', 6510
    self.'emitret'(__ARG_1)
.annotate 'line', 6511
    le $I1, 0, __label_6
.annotate 'line', 6512
    $P1.'emitargs'(__ARG_1)
 __label_6: # endif
.annotate 'line', 6513
    __ARG_1.'say'(')')
# }
.annotate 'line', 6514

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ReturnYieldStatement' ]
.annotate 'line', 6471
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 6473
    addattribute $P0, 'values'
.end
.namespace [ 'ReturnStatement' ]

.sub 'ReturnStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6521
    self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6522

.end # ReturnStatement


.sub 'emitret' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6525
    __ARG_1.'print'('    ', '.return(')
# }
.annotate 'line', 6526

.end # emitret

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ReturnStatement' ]
.annotate 'line', 6517
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
.annotate 'line', 6533
    self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6534

.end # YieldStatement


.sub 'emitret' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6537
    __ARG_1.'print'('    ', '.yield(')
# }
.annotate 'line', 6538

.end # emitret

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'YieldStatement' ]
.annotate 'line', 6529
    get_class $P1, [ 'ReturnYieldStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'LabelStatement' ]

.sub 'LabelStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6551
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 6552
    setattribute self, 'name', __ARG_1
.annotate 'line', 6553
# value: $S1
    getattribute $P2, self, 'owner'
    $P1 = $P2.'createlabel'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 6554
    box $P1, $S1
    setattribute self, 'value', $P1
# }
.annotate 'line', 6555

.end # LabelStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6556
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6559
    self.'annotate'(__ARG_1)
.annotate 'line', 6560
# name: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 6561
# comment: $S2
    concat $S2, 'label ', $S1
.annotate 'line', 6562
    getattribute $P1, self, 'value'
    __ARG_1.'emitlabel'($P1, $S2)
# }
.annotate 'line', 6563

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'LabelStatement' ]
.annotate 'line', 6545
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 6547
    addattribute $P0, 'name'
.annotate 'line', 6548
    addattribute $P0, 'value'
.end
.namespace [ 'Reflabel' ]

.sub 'Reflabel' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 6577
    setattribute self, 'owner', __ARG_1
.annotate 'line', 6578
    box $P1, __ARG_2
    setattribute self, 'label', $P1
# }
.annotate 'line', 6579

.end # Reflabel


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6580
    .return(self)
# }

.end # optimize


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6583
# label: $S1
    getattribute $P1, self, 'label'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 6584
# value: $S2
    getattribute $P2, self, 'owner'
    $P1 = $P2.'getlabel'($S1)
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 6585
    .return($S2)
# }
.annotate 'line', 6586

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Reflabel' ]
.annotate 'line', 6572
    addattribute $P0, 'owner'
.annotate 'line', 6573
    addattribute $P0, 'label'
.end
.namespace [ 'GotoStatement' ]

.sub 'GotoStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6599
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6600
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6601
    'RequireIdentifier'($P1)
.annotate 'line', 6602
    setattribute self, 'label', $P1
.annotate 'line', 6603
    'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 6604

.end # GotoStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6605
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6608
    self.'annotate'(__ARG_1)
.annotate 'line', 6609
# label: $S1
    getattribute $P1, self, 'label'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 6610
# value: $S2
    $P1 = self.'getlabel'($S1)
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 6611
    concat $S3, 'goto ', $S1
    __ARG_1.'emitgoto'($S2, $S3)
# }
.annotate 'line', 6612

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'GotoStatement' ]
.annotate 'line', 6593
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 6595
    addattribute $P0, 'label'
.end
.namespace [ 'ConditionalStatement' ]

.sub 'parseconditionshort' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6623
    $P1 = 'parseExpr'(__ARG_1, self)
    self.'set'($P1)
# }
.annotate 'line', 6624

.end # parseconditionshort


.sub 'parsecondition' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6627
    'ExpectOp'('(', __ARG_1)
.annotate 'line', 6628
    $P1 = 'parseExpr'(__ARG_1, self)
    self.'set'($P1)
.annotate 'line', 6629
    'ExpectOp'(')', __ARG_1)
# }
.annotate 'line', 6630

.end # parsecondition

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ConditionalStatement' ]
.annotate 'line', 6619
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
.annotate 'line', 6643
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6644
    self.'parsecondition'(__ARG_2)
.annotate 'line', 6645
    $P3 = 'parseStatement'(__ARG_2, self)
    setattribute self, 'truebranch', $P3
.annotate 'line', 6646
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6647
    $P2 = $P1.'iskeyword'("else")
    if_null $P2, __label_0
    unless $P2 goto __label_0
.annotate 'line', 6648
    $P4 = 'parseStatement'(__ARG_2, self)
    setattribute self, 'falsebranch', $P4
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 6650
    new $P6, [ 'EmptyStatement' ]
    setattribute self, 'falsebranch', $P6
.annotate 'line', 6651
    __ARG_2.'unget'($P1)
# }
 __label_1: # endif
# }
.annotate 'line', 6653

.end # IfStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6656
    self.'optimize_condition'()
.annotate 'line', 6657
# checkvalue: $I1
    $P1 = self.'getvalue'()
    set $I1, $P1
.annotate 'line', 6658
    getattribute $P3, self, 'truebranch'
    $P2 = $P3.'optimize'()
    setattribute self, 'truebranch', $P2
.annotate 'line', 6659
    getattribute $P3, self, 'falsebranch'
    $P2 = $P3.'optimize'()
    setattribute self, 'falsebranch', $P2
.annotate 'line', 6660
    set $I2, $I1
    set $I3, 1
    if $I2 == $I3 goto __label_2
    set $I3, 2
    if $I2 == $I3 goto __label_3
    goto __label_1
# switch
 __label_2: # case
.annotate 'line', 6662
    getattribute $P1, self, 'truebranch'
    .return($P1)
 __label_3: # case
.annotate 'line', 6664
    getattribute $P2, self, 'falsebranch'
    .return($P2)
 __label_1: # default
 __label_0: # switch end
.annotate 'line', 6666
    .return(self)
# }
.annotate 'line', 6667

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6670
# var truebranch: $P1
    getattribute $P1, self, 'truebranch'
.annotate 'line', 6671
# var falsebranch: $P2
    getattribute $P2, self, 'falsebranch'
.annotate 'line', 6672
# t_empty: $I1
    $P3 = $P1.'isempty'()
    set $I1, $P3
.annotate 'line', 6673
# f_empty: $I2
    $P3 = $P2.'isempty'()
    set $I2, $P3
.annotate 'line', 6674
# elselabel: $S1
    set $S1, ''
.annotate 'line', 6675
    not $I3, $I2
    unless $I3 goto __label_0
.annotate 'line', 6676
    $P3 = self.'genlabel'()
    set $S1, $P3
 __label_0: # endif
.annotate 'line', 6677
# endlabel: $S2
    $P3 = self.'genlabel'()
    null $S2
    if_null $P3, __label_1
    set $S2, $P3
 __label_1:
.annotate 'line', 6678
# cond_false: $S3
    unless $I2 goto __label_3
    set $S3, $S2
    goto __label_2
 __label_3:
    set $S3, $S1
 __label_2:
.annotate 'line', 6679
    self.'annotate'(__ARG_1)
.annotate 'line', 6680
    self.'emit_else'(__ARG_1, $S3)
.annotate 'line', 6681
    $P1.'emit'(__ARG_1)
.annotate 'line', 6683
    not $I3, $I2
    unless $I3 goto __label_4
# {
.annotate 'line', 6684
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 6685
    __ARG_1.'emitlabel'($S1, 'else')
.annotate 'line', 6686
    $P2.'emit'(__ARG_1)
# }
 __label_4: # endif
.annotate 'line', 6688
    __ARG_1.'emitlabel'($S2, 'endif')
# }
.annotate 'line', 6689

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IfStatement' ]
.annotate 'line', 6637
    get_class $P1, [ 'ConditionalStatement' ]
    addparent $P0, $P1
.annotate 'line', 6639
    addattribute $P0, 'truebranch'
.annotate 'line', 6640
    addattribute $P0, 'falsebranch'
.end
.namespace [ 'LoopStatement' ]

.sub 'parsebody' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6701
    $P2 = 'parseStatement'(__ARG_1, self)
    setattribute self, 'body', $P2
# }
.annotate 'line', 6702

.end # parsebody


.sub 'emit_infinite' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6705
# breaklabel: $S1
    $P1 = self.'genbreaklabel'()
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 6706
# continuelabel: $S2
    $P1 = self.'gencontinuelabel'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 6708
    self.'annotate'(__ARG_1)
.annotate 'line', 6709
    __ARG_1.'emitlabel'($S2, 'Infinite loop')
.annotate 'line', 6710
    getattribute $P1, self, 'body'
    $P1.'emit'(__ARG_1)
.annotate 'line', 6711
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 6712
    __ARG_1.'emitlabel'($S1, 'Infinite loop end')
# }
.annotate 'line', 6713

.end # emit_infinite

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'LoopStatement' ]
.annotate 'line', 6696
    get_class $P1, [ 'Continuable' ]
    addparent $P0, $P1
.annotate 'line', 6698
    addattribute $P0, 'body'
.end
.namespace [ 'WhileStatement' ]

.sub 'WhileStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6724
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6725
    self.'parsecondition'(__ARG_2)
.annotate 'line', 6726
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 6727

.end # WhileStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6730
    self.'optimize_condition'()
.annotate 'line', 6731
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 6732
    .return(self)
# }
.annotate 'line', 6733

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6736
    $P1 = self.'getvalue'()
    set $I1, $P1
    set $I2, 1
    if $I1 == $I2 goto __label_2
    set $I2, 2
    if $I1 == $I2 goto __label_3
    goto __label_1
# switch
 __label_2: # case
.annotate 'line', 6738
    self.'emit_infinite'(__ARG_1)
    goto __label_0 # break
 __label_3: # case
.annotate 'line', 6741
    __ARG_1.'comment'('while(false) optimized out')
    goto __label_0 # break
 __label_1: # default
.annotate 'line', 6744
# breaklabel: $S1
    $P2 = self.'genbreaklabel'()
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
 __label_4:
.annotate 'line', 6745
# continuelabel: $S2
    $P3 = self.'gencontinuelabel'()
    null $S2
    if_null $P3, __label_5
    set $S2, $P3
 __label_5:
.annotate 'line', 6747
    self.'annotate'(__ARG_1)
.annotate 'line', 6748
    __ARG_1.'emitlabel'($S2, 'while')
.annotate 'line', 6749
    self.'emit_else'(__ARG_1, $S1)
.annotate 'line', 6750
    getattribute $P4, self, 'body'
    $P4.'emit'(__ARG_1)
.annotate 'line', 6751
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 6752
    __ARG_1.'emitlabel'($S1, 'endwhile')
 __label_0: # switch end
# }
.annotate 'line', 6754

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'WhileStatement' ]
.annotate 'line', 6720
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
.annotate 'line', 6765
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6766
    self.'parsebody'(__ARG_2)
.annotate 'line', 6767
    'ExpectKeyword'('while', __ARG_2)
.annotate 'line', 6768
    self.'parsecondition'(__ARG_2)
# }
.annotate 'line', 6769

.end # DoStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6772
    self.'optimize_condition'()
.annotate 'line', 6773
# var body: $P1
    getattribute $P2, self, 'body'
    $P1 = $P2.'optimize'()
.annotate 'line', 6774
    $I1 = $P1.'isempty'()
    unless $I1 goto __label_1
    $P2 = self.'getvalue'()
    set $I2, $P2
    iseq $I1, $I2, 2
 __label_1:
    unless $I1 goto __label_0
.annotate 'line', 6775
    new $P3, [ 'EmptyStatement' ]
    .return($P3)
 __label_0: # endif
.annotate 'line', 6776
    setattribute self, 'body', $P1
.annotate 'line', 6777
    .return(self)
# }
.annotate 'line', 6778

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6781
# var body: $P1
    getattribute $P1, self, 'body'
.annotate 'line', 6782
# condvalue: $I1
    $P2 = self.'getvalue'()
    set $I1, $P2
.annotate 'line', 6783
    set $I2, $I1
    set $I3, 1
    if $I2 == $I3 goto __label_2
    goto __label_1
# switch
 __label_2: # case
.annotate 'line', 6785
    self.'emit_infinite'(__ARG_1)
    goto __label_0 # break
 __label_1: # default
.annotate 'line', 6788
# looplabel: $S1
    $P2 = self.'genlabel'()
    null $S1
    if_null $P2, __label_3
    set $S1, $P2
 __label_3:
.annotate 'line', 6789
# breaklabel: $S2
    $P3 = self.'genbreaklabel'()
    null $S2
    if_null $P3, __label_4
    set $S2, $P3
 __label_4:
.annotate 'line', 6790
# continuelabel: $S3
    $P4 = self.'gencontinuelabel'()
    null $S3
    if_null $P4, __label_5
    set $S3, $P4
 __label_5:
.annotate 'line', 6792
    self.'annotate'(__ARG_1)
.annotate 'line', 6793
    __ARG_1.'emitlabel'($S1, 'do')
.annotate 'line', 6795
    $P1.'emit'(__ARG_1)
.annotate 'line', 6796
    __ARG_1.'emitlabel'($S3, 'continue')
.annotate 'line', 6797
    eq $I1, 2, __label_6
.annotate 'line', 6798
    self.'emit_if'(__ARG_1, $S1, $S2)
 __label_6: # endif
.annotate 'line', 6799
    __ARG_1.'emitlabel'($S2, 'enddo')
 __label_0: # switch end
# }
.annotate 'line', 6801

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'DoStatement' ]
.annotate 'line', 6761
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
.annotate 'line', 6812
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6813
    'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 6814

.end # ContinueStatement


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
    $P1 = self.'getcontinuelabel'($P2)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 6820
    __ARG_1.'emitgoto'($S1, 'continue')
# }
.annotate 'line', 6821

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ContinueStatement' ]
.annotate 'line', 6808
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
.annotate 'line', 6832
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6833
    'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 6834

.end # BreakStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6835
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6838
    self.'annotate'(__ARG_1)
.annotate 'line', 6839
# label: $S1
    getattribute $P2, self, 'start'
    $P1 = self.'getbreaklabel'($P2)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 6840
    __ARG_1.'emitgoto'($S1, 'break')
# }
.annotate 'line', 6841

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'BreakStatement' ]
.annotate 'line', 6828
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
.annotate 'line', 6857
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6858
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6859
    $P3 = $P1.'isop'('(')
    isfalse $I1, $P3
    unless $I1 goto __label_0
.annotate 'line', 6860
    'Expected'("'(' in switch", $P1)
 __label_0: # endif
.annotate 'line', 6861
    $P4 = 'parseExpr'(__ARG_2, self)
    setattribute self, 'condition', $P4
.annotate 'line', 6862
    $P1 = __ARG_2.'get'()
.annotate 'line', 6863
    $P3 = $P1.'isop'(')')
    isfalse $I1, $P3
    unless $I1 goto __label_1
.annotate 'line', 6864
    'Expected'("')' in switch", $P1)
 __label_1: # endif
.annotate 'line', 6865
    $P1 = __ARG_2.'get'()
.annotate 'line', 6866
    $P3 = $P1.'isop'('{')
    isfalse $I1, $P3
    unless $I1 goto __label_2
.annotate 'line', 6867
    'Expected'("'{' in switch", $P1)
 __label_2: # endif
.annotate 'line', 6868
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'case_value', $P4
.annotate 'line', 6869
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'case_st', $P4
.annotate 'line', 6870
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'default_st', $P4
 __label_4: # while
.annotate 'line', 6871
    $P1 = __ARG_2.'get'()
    $I1 = $P1.'iskeyword'('case')
    if $I1 goto __label_5
    $I1 = $P1.'iskeyword'('default')
 __label_5:
    unless $I1 goto __label_3
# {
.annotate 'line', 6872
    $P3 = $P1.'iskeyword'('case')
    if_null $P3, __label_6
    unless $P3 goto __label_6
# {
.annotate 'line', 6873
    getattribute $P4, self, 'case_value'
    $P5 = 'parseExpr'(__ARG_2, self)
# predefined push
    push $P4, $P5
.annotate 'line', 6874
    $P1 = __ARG_2.'get'()
.annotate 'line', 6875
    $P3 = $P1.'isop'(':')
    isfalse $I1, $P3
    unless $I1 goto __label_8
.annotate 'line', 6876
    'Expected'("':' in case", $P1)
 __label_8: # endif
.annotate 'line', 6877
# var st: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
 __label_10: # while
.annotate 'line', 6878
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
.annotate 'line', 6879
    __ARG_2.'unget'($P1)
.annotate 'line', 6880
    $P3 = 'parseStatement'(__ARG_2, self)
# predefined push
    push $P2, $P3
# }
    goto __label_10
 __label_9: # endwhile
.annotate 'line', 6882
    getattribute $P3, self, 'case_st'
# predefined push
    push $P3, $P2
.annotate 'line', 6883
    __ARG_2.'unget'($P1)
# }
    goto __label_7
 __label_6: # else
# {
.annotate 'line', 6886
    $P1 = __ARG_2.'get'()
.annotate 'line', 6887
    $P3 = $P1.'isop'(':')
    isfalse $I1, $P3
    unless $I1 goto __label_13
.annotate 'line', 6888
    'Expected'("':' in default", $P1)
 __label_13: # endif
 __label_15: # while
.annotate 'line', 6889
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
.annotate 'line', 6890
    __ARG_2.'unget'($P1)
.annotate 'line', 6891
    getattribute $P3, self, 'default_st'
    $P4 = 'parseStatement'(__ARG_2, self)
# predefined push
    push $P3, $P4
# }
    goto __label_15
 __label_14: # endwhile
.annotate 'line', 6893
    __ARG_2.'unget'($P1)
# }
 __label_7: # endif
# }
    goto __label_4
 __label_3: # endwhile
# }
.annotate 'line', 6896

.end # SwitchStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6899
    getattribute $P4, self, 'condition'
    $P3 = $P4.'optimize'()
    setattribute self, 'condition', $P3
.annotate 'line', 6900
    getattribute $P2, self, 'case_value'
    'optimize_array'($P2)
.annotate 'line', 6901
    getattribute $P2, self, 'case_st'
    iter $P5, $P2
    set $P5, 0
 __label_0: # for iteration
    unless $P5 goto __label_1
    shift $P1, $P5
.annotate 'line', 6902
    'optimize_array'($P1)
    goto __label_0
 __label_1: # endfor
.annotate 'line', 6903
    getattribute $P2, self, 'default_st'
    'optimize_array'($P2)
.annotate 'line', 6904
    .return(self)
# }
.annotate 'line', 6905

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6909
# type: $S1
    set $S1, ''
.annotate 'line', 6910
    getattribute $P10, self, 'case_value'
    iter $P11, $P10
    set $P11, 0
 __label_0: # for iteration
    unless $P11 goto __label_1
    shift $P1, $P11
# {
.annotate 'line', 6911
# t: $S2
    $P12 = $P1.'checkresult'()
    null $S2
    if_null $P12, __label_2
    set $S2, $P12
 __label_2:
.annotate 'line', 6912
    ne $S2, 'N', __label_3
.annotate 'line', 6913
    getattribute $P10, self, 'start'
    'SyntaxError'("Invalid type in case", $P10)
 __label_3: # endif
.annotate 'line', 6914
    ne $S1, '', __label_4
.annotate 'line', 6915
    set $S1, $S2
    goto __label_5
 __label_4: # else
.annotate 'line', 6916
    eq $S1, $S2, __label_6
.annotate 'line', 6917
    set $S1, 'P'
 __label_6: # endif
 __label_5: # endif
# }
    goto __label_0
 __label_1: # endfor
.annotate 'line', 6920
# var condition: $P2
    getattribute $P2, self, 'condition'
.annotate 'line', 6921
# var condtype: $P3
    $P3 = $P2.'checkresult'()
.annotate 'line', 6925
    ne $S1, '', __label_7
.annotate 'line', 6926
    set $S1, $P3
 __label_7: # endif
.annotate 'line', 6928
# reg: $S3
    $P10 = self.'tempreg'($S1)
    null $S3
    if_null $P10, __label_8
    set $S3, $P10
 __label_8:
.annotate 'line', 6929
    set $S9, $P3
    ne $S9, $S1, __label_9
.annotate 'line', 6930
    $P2.'emit'(__ARG_1, $S3)
    goto __label_10
 __label_9: # else
# {
.annotate 'line', 6932
# regcond: $S4
    $P10 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P10, __label_11
    set $S4, $P10
 __label_11:
.annotate 'line', 6933
    __ARG_1.'emitset'($S3, $S4)
# }
 __label_10: # endif
.annotate 'line', 6937
    self.'genbreaklabel'()
.annotate 'line', 6938
# defaultlabel: $S5
    $P10 = self.'genlabel'()
    null $S5
    if_null $P10, __label_12
    set $S5, $P10
 __label_12:
.annotate 'line', 6939
    new $P4, ['ResizableStringArray']
.annotate 'line', 6940
# regval: $S6
    $P10 = self.'tempreg'($S1)
    null $S6
    if_null $P10, __label_13
    set $S6, $P10
 __label_13:
.annotate 'line', 6941
    getattribute $P10, self, 'case_value'
    iter $P13, $P10
    set $P13, 0
 __label_14: # for iteration
    unless $P13 goto __label_15
    shift $P5, $P13
# {
.annotate 'line', 6942
# label: $S7
    $P12 = self.'genlabel'()
    null $S7
    if_null $P12, __label_16
    set $S7, $P12
 __label_16:
.annotate 'line', 6943
# predefined push
    push $P4, $S7
.annotate 'line', 6944
    $P5.'emit'(__ARG_1, $S6)
.annotate 'line', 6945
    __ARG_1.'say'('    ', 'if ', $S3, ' == ', $S6, ' goto ', $S7)
# }
    goto __label_14
 __label_15: # endfor
.annotate 'line', 6947
    __ARG_1.'emitgoto'($S5)
.annotate 'line', 6950
    __ARG_1.'comment'('switch')
.annotate 'line', 6951
    self.'annotate'(__ARG_1)
.annotate 'line', 6952
# var case_st: $P6
    getattribute $P6, self, 'case_st'
.annotate 'line', 6953
# n: $I1
    set $P10, $P6
    set $I1, $P10
# for loop
.annotate 'line', 6954
# i: $I2
    null $I2
 __label_19: # for condition
    ge $I2, $I1, __label_18
# {
.annotate 'line', 6955
# l: $S8
    $S8 = $P4[$I2]
.annotate 'line', 6956
    __ARG_1.'emitlabel'($S8, 'case')
.annotate 'line', 6957
# var casest: $P7
    $P7 = $P6[$I2]
.annotate 'line', 6958
    iter $P14, $P7
    set $P14, 0
 __label_20: # for iteration
    unless $P14 goto __label_21
    shift $P8, $P14
.annotate 'line', 6959
    $P8.'emit'(__ARG_1)
    goto __label_20
 __label_21: # endfor
# }
 __label_17: # for iteration
.annotate 'line', 6954
    inc $I2
    goto __label_19
 __label_18: # for end
.annotate 'line', 6962
    __ARG_1.'emitlabel'($S5, 'default')
.annotate 'line', 6963
    getattribute $P10, self, 'default_st'
    iter $P15, $P10
    set $P15, 0
 __label_22: # for iteration
    unless $P15 goto __label_23
    shift $P9, $P15
.annotate 'line', 6964
    $P9.'emit'(__ARG_1)
    goto __label_22
 __label_23: # endfor
.annotate 'line', 6966
    getattribute $P12, self, 'start'
    $P10 = self.'getbreaklabel'($P12)
    __ARG_1.'emitlabel'($P10, 'switch end')
# }
.annotate 'line', 6967

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'SwitchStatement' ]
.annotate 'line', 6848
    get_class $P1, [ 'Breakable' ]
    addparent $P0, $P1
    get_class $P2, [ 'Statement' ]
    addparent $P0, $P2
.annotate 'line', 6850
    addattribute $P0, 'condition'
.annotate 'line', 6851
    addattribute $P0, 'case_value'
.annotate 'line', 6852
    addattribute $P0, 'case_st'
.annotate 'line', 6853
    addattribute $P0, 'default_st'
.end
.namespace [ 'ForStatement' ]

.sub 'ForStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6981
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6982
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6983
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_0
# {
.annotate 'line', 6984
    __ARG_2.'unget'($P1)
.annotate 'line', 6985
    $P3 = 'parseStatement'(__ARG_2, self)
    setattribute self, 'initializer', $P3
# }
 __label_0: # endif
.annotate 'line', 6987
    $P1 = __ARG_2.'get'()
.annotate 'line', 6988
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 6989
    __ARG_2.'unget'($P1)
.annotate 'line', 6990
    self.'parseconditionshort'(__ARG_2)
.annotate 'line', 6991
    'ExpectOp'(';', __ARG_2)
# }
 __label_1: # endif
.annotate 'line', 6993
    $P1 = __ARG_2.'get'()
.annotate 'line', 6994
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_2
# {
.annotate 'line', 6995
    __ARG_2.'unget'($P1)
.annotate 'line', 6996
    $P3 = 'parseExpr'(__ARG_2, self)
    setattribute self, 'iteration', $P3
.annotate 'line', 6997
    'ExpectOp'(')', __ARG_2)
# }
 __label_2: # endif
.annotate 'line', 6999
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 7000

.end # ForStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7003
    getattribute $P1, self, 'initializer'
    if_null $P1, __label_0
.annotate 'line', 7004
    getattribute $P4, self, 'initializer'
    $P3 = $P4.'optimize'()
    setattribute self, 'initializer', $P3
 __label_0: # endif
.annotate 'line', 7005
    getattribute $P1, self, 'condexpr'
    if_null $P1, __label_1
.annotate 'line', 7006
    self.'optimize_condition'()
 __label_1: # endif
.annotate 'line', 7007
    getattribute $P1, self, 'iteration'
    if_null $P1, __label_2
.annotate 'line', 7008
    getattribute $P4, self, 'iteration'
    $P3 = $P4.'optimize'()
    setattribute self, 'iteration', $P3
 __label_2: # endif
.annotate 'line', 7009
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 7010
    .return(self)
# }
.annotate 'line', 7011

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7014
    getattribute $P1, self, 'initializer'
    isnull $I1, $P1
    unless $I1 goto __label_2
.annotate 'line', 7015
    getattribute $P2, self, 'condexpr'
    isnull $I1, $P2
 __label_2:
    unless $I1 goto __label_1
.annotate 'line', 7016
    getattribute $P3, self, 'iteration'
    isnull $I1, $P3
 __label_1:
    unless $I1 goto __label_0
# {
.annotate 'line', 7017
    self.'emit_infinite'(__ARG_1)
.annotate 'line', 7018
    .return()
# }
 __label_0: # endif
.annotate 'line', 7020
    __ARG_1.'comment'('for loop')
.annotate 'line', 7021
# continuelabel: $S1
    $P1 = self.'gencontinuelabel'()
    null $S1
    if_null $P1, __label_3
    set $S1, $P1
 __label_3:
.annotate 'line', 7022
# breaklabel: $S2
    $P1 = self.'genbreaklabel'()
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
 __label_4:
.annotate 'line', 7023
# condlabel: $S3
    $P1 = self.'genlabel'()
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
 __label_5:
.annotate 'line', 7024
    getattribute $P1, self, 'initializer'
    if_null $P1, __label_6
.annotate 'line', 7025
    getattribute $P2, self, 'initializer'
    $P2.'emit'(__ARG_1)
 __label_6: # endif
.annotate 'line', 7027
    __ARG_1.'emitlabel'($S3, 'for condition')
.annotate 'line', 7028
    getattribute $P1, self, 'condexpr'
    if_null $P1, __label_7
.annotate 'line', 7029
    self.'emit_else'(__ARG_1, $S2)
 __label_7: # endif
.annotate 'line', 7031
    getattribute $P1, self, 'body'
    $P1.'emit'(__ARG_1)
.annotate 'line', 7032
    __ARG_1.'emitlabel'($S1, 'for iteration')
.annotate 'line', 7033
    getattribute $P1, self, 'iteration'
    if_null $P1, __label_8
.annotate 'line', 7034
# unused: $S4
    getattribute $P3, self, 'iteration'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S4
    if_null $P2, __label_9
    set $S4, $P2
 __label_9:
 __label_8: # endif
.annotate 'line', 7035
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 7037
    __ARG_1.'emitlabel'($S2, 'for end')
# }
.annotate 'line', 7038

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ForStatement' ]
.annotate 'line', 6974
    get_class $P1, [ 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'BlockStatement' ]
    addparent $P0, $P2
    get_class $P3, [ 'ConditionalStatement' ]
    addparent $P0, $P3
.annotate 'line', 6976
    addattribute $P0, 'initializer'
.annotate 'line', 6977
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
.annotate 'line', 7053
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7054
# sname: $S1
    set $P1, __ARG_4
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 7055
    eq __ARG_5, '', __label_1
# {
.annotate 'line', 7056
# deftype: $S2
    $P1 = 'typetoregcheck'(__ARG_5)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
 __label_2:
.annotate 'line', 7057
    self.'createvar'($S1, $S2)
.annotate 'line', 7058
    box $P1, $S2
    setattribute self, 'deftype', $P1
# }
 __label_1: # endif
.annotate 'line', 7060
    setattribute self, 'varname', __ARG_4
.annotate 'line', 7061
    $P2 = 'parseExpr'(__ARG_2, self)
    setattribute self, 'container', $P2
.annotate 'line', 7062
    'ExpectOp'(')', __ARG_2)
.annotate 'line', 7063
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 7064

.end # ForeachStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7067
    getattribute $P3, self, 'container'
    $P2 = $P3.'optimize'()
    setattribute self, 'container', $P2
.annotate 'line', 7068
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 7069
    .return(self)
# }
.annotate 'line', 7070

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7073
    self.'annotate'(__ARG_1)
.annotate 'line', 7074
# regcont: $S1
    null $S1
.annotate 'line', 7075
    getattribute $P3, self, 'container'
    $P2 = $P3.'checkresult'()
    set $S6, $P2
    ne $S6, 'S', __label_0
# {
.annotate 'line', 7076
# value: $S2
    getattribute $P5, self, 'container'
    $P4 = $P5.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
 __label_2:
.annotate 'line', 7077
    $P2 = self.'tempreg'('P')
    set $S1, $P2
.annotate 'line', 7078
    __ARG_1.'emitbox'($S1, $S2)
# }
    goto __label_1
 __label_0: # else
.annotate 'line', 7081
    getattribute $P3, self, 'container'
    $P2 = $P3.'emit_get'(__ARG_1)
    set $S1, $P2
 __label_1: # endif
.annotate 'line', 7082
# var itvar: $P1
    getattribute $P2, self, 'varname'
    $P1 = self.'getvar'($P2)
.annotate 'line', 7083
# iterator: $S3
    $P2 = self.'createreg'('P')
    null $S3
    if_null $P2, __label_3
    set $S3, $P2
 __label_3:
.annotate 'line', 7084
# continuelabel: $S4
    $P2 = self.'gencontinuelabel'()
    null $S4
    if_null $P2, __label_4
    set $S4, $P2
 __label_4:
.annotate 'line', 7085
# breaklabel: $S5
    $P2 = self.'genbreaklabel'()
    null $S5
    if_null $P2, __label_5
    set $S5, $P2
 __label_5:
.annotate 'line', 7086
    __ARG_1.'emitarg2'('iter', $S3, $S1)
.annotate 'line', 7087
    __ARG_1.'emitset'($S3, '0')
.annotate 'line', 7088
    __ARG_1.'emitlabel'($S4, 'for iteration')
.annotate 'line', 7089
    __ARG_1.'emitunless'($S3, $S5)
.annotate 'line', 7090
    $P2 = $P1.'getreg'()
    __ARG_1.'emitarg2'('shift', $P2, $S3)
.annotate 'line', 7091
    getattribute $P2, self, 'body'
    $P2.'emit'(__ARG_1)
.annotate 'line', 7092
    __ARG_1.'emitgoto'($S4)
.annotate 'line', 7093
    __ARG_1.'emitlabel'($S5, 'endfor')
# }
.annotate 'line', 7094

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ForeachStatement' ]
.annotate 'line', 7045
    get_class $P1, [ 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'BlockStatement' ]
    addparent $P0, $P2
.annotate 'line', 7047
    addattribute $P0, 'deftype'
.annotate 'line', 7048
    addattribute $P0, 'varname'
.annotate 'line', 7049
    addattribute $P0, 'container'
.end
.namespace [ ]

.sub 'parseFor'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7101
    'ExpectOp'('(', __ARG_2)
.annotate 'line', 7102
# var aux: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7103
# var in1: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 7104
    $P4 = $P2.'iskeyword'('in')
    if_null $P4, __label_0
    unless $P4 goto __label_0
.annotate 'line', 7105
    new $P6, [ 'ForeachStatement' ]
    $P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, '')
    set $P5, $P6
    .return($P5)
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 7107
# var in2: $P3
    $P3 = __ARG_2.'get'()
.annotate 'line', 7108
    $P4 = $P3.'iskeyword'('in')
    if_null $P4, __label_2
    unless $P4 goto __label_2
.annotate 'line', 7109
    new $P6, [ 'ForeachStatement' ]
    $P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P2, $P1)
    set $P5, $P6
    .return($P5)
 __label_2: # endif
.annotate 'line', 7110
    __ARG_2.'unget'($P3)
.annotate 'line', 7111
    __ARG_2.'unget'($P2)
.annotate 'line', 7112
    __ARG_2.'unget'($P1)
# }
 __label_1: # endif
.annotate 'line', 7114
    new $P5, [ 'ForStatement' ]
    $P5.'ForStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 7115

.end # parseFor

.namespace [ 'ThrowStatement' ]

.sub 'ThrowStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7127
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7128
    $P2 = 'parseExpr'(__ARG_2, self)
    setattribute self, 'excep', $P2
# }
.annotate 'line', 7129

.end # ThrowStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7132
    getattribute $P3, self, 'excep'
    $P2 = $P3.'optimize'()
    setattribute self, 'excep', $P2
.annotate 'line', 7133
    .return(self)
# }
.annotate 'line', 7134

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7137
# var excep: $P1
    getattribute $P1, self, 'excep'
.annotate 'line', 7138
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 7139
    self.'annotate'(__ARG_1)
.annotate 'line', 7140
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    set $S3, 'P'
    if $S2 == $S3 goto __label_3
    set $S3, 'S'
    if $S2 == $S3 goto __label_4
    goto __label_2
# switch
 __label_3: # case
.annotate 'line', 7142
    __ARG_1.'emitarg1'('throw', $S1)
    goto __label_1 # break
 __label_4: # case
.annotate 'line', 7145
    __ARG_1.'emitarg1'('die', $S1)
    goto __label_1 # break
 __label_2: # default
.annotate 'line', 7148
    getattribute $P3, self, 'start'
    'SyntaxError'("Invalid throw argument", $P3)
 __label_1: # switch end
# }
.annotate 'line', 7150

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ThrowStatement' ]
.annotate 'line', 7121
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7123
    addattribute $P0, 'excep'
.end
.namespace [ 'TryModifierList' ]

.sub 'TryModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7162
    setattribute self, 'start', __ARG_1
.annotate 'line', 7163
    self.'ModifierList'(__ARG_2, __ARG_3)
# }
.annotate 'line', 7164

.end # TryModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 7167
# var modiflist: $P1
    $P1 = self.'getlist'()
.annotate 'line', 7168
    iter $P6, $P1
    set $P6, 0
 __label_0: # for iteration
    unless $P6 goto __label_1
    shift $P2, $P6
# {
.annotate 'line', 7169
# modifname: $S1
    $P7 = $P2.'getname'()
    null $S1
    if_null $P7, __label_2
    set $S1, $P7
 __label_2:
.annotate 'line', 7170
# nargs: $I1
    $P7 = $P2.'numargs'()
    set $I1, $P7
.annotate 'line', 7171
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
.annotate 'line', 7174
    eq $I1, 1, __label_9
.annotate 'line', 7175
    getattribute $P7, self, 'start'
    'SyntaxError'('Wrong modifier args', $P7)
 __label_9: # endif
.annotate 'line', 7176
# var arg: $P3
    $P3 = $P2.'getarg'(0)
.annotate 'line', 7177
# argreg: $S2
    $P8 = $P3.'emit_get'(__ARG_1)
    null $S2
    if_null $P8, __label_10
    set $S2, $P8
 __label_10:
.annotate 'line', 7178
    __ARG_1.'say'('    ', __ARG_2, ".'", $S1, "'(", $S2, ")")
    goto __label_3 # break
 __label_7: # case
 __label_8: # case
.annotate 'line', 7182
    new $P4, ['ResizableStringArray']
# for loop
.annotate 'line', 7183
# i: $I2
    null $I2
 __label_13: # for condition
    ge $I2, $I1, __label_12
# {
.annotate 'line', 7184
# var arg: $P5
    $P5 = $P2.'getarg'($I2)
.annotate 'line', 7185
    $P7 = $P5.'emit_get'(__ARG_1)
# predefined push
    push $P4, $P7
# }
 __label_11: # for iteration
.annotate 'line', 7183
    inc $I2
    goto __label_13
 __label_12: # for end
.annotate 'line', 7188
# predefined join
    join $S3, ', ', $P4
.annotate 'line', 7187
    __ARG_1.'say'('    ', __ARG_2, ".'", $S1, "'(", $S3, ")")
    goto __label_3 # break
 __label_4: # default
.annotate 'line', 7191
    concat $S4, "Modifier '", $S1
    concat $S4, $S4, "' not valid for try"
    getattribute $P7, self, 'start'
    'SyntaxError'($S4, $P7)
 __label_3: # switch end
# }
    goto __label_0
 __label_1: # endfor
# }
.annotate 'line', 7194

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TryModifierList' ]
.annotate 'line', 7157
    get_class $P1, [ 'ModifierList' ]
    addparent $P0, $P1
.annotate 'line', 7159
    addattribute $P0, 'start'
.end
.namespace [ 'TryStatement' ]

.sub 'TryStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7206
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7207
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7208
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_0
    unless $P2 goto __label_0
.annotate 'line', 7209
    new $P5, [ 'TryModifierList' ]
    $P5.'TryModifierList'($P1, __ARG_2, self)
    set $P4, $P5
    setattribute self, 'modifiers', $P4
    goto __label_1
 __label_0: # else
.annotate 'line', 7211
    __ARG_2.'unget'($P1)
 __label_1: # endif
.annotate 'line', 7213
    $P3 = 'parseStatement'(__ARG_2, self)
    setattribute self, 'stry', $P3
.annotate 'line', 7214
    $P1 = __ARG_2.'get'()
.annotate 'line', 7215
    $P2 = $P1.'iskeyword'('catch')
    isfalse $I1, $P2
    unless $I1 goto __label_2
.annotate 'line', 7216
    'ExpectedOp'('catch', $P1)
 __label_2: # endif
.annotate 'line', 7217
    $P1 = __ARG_2.'get'()
.annotate 'line', 7218
    $P2 = $P1.'isop'('(')
    isfalse $I1, $P2
    unless $I1 goto __label_3
.annotate 'line', 7219
    'Expected'("'(' after 'catch'", $P1)
 __label_3: # endif
.annotate 'line', 7220
    $P1 = __ARG_2.'get'()
.annotate 'line', 7221
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_4
# {
.annotate 'line', 7222
# exname: $S1
    $P3 = $P1.'getidentifier'()
    null $S1
    if_null $P3, __label_5
    set $S1, $P3
 __label_5:
.annotate 'line', 7223
    setattribute self, 'exname', $P1
.annotate 'line', 7224
    self.'createvar'($S1, 'P')
.annotate 'line', 7225
    $P1 = __ARG_2.'get'()
.annotate 'line', 7226
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_6
.annotate 'line', 7227
    'Expected'("')' in 'catch'", $P1)
 __label_6: # endif
# }
 __label_4: # endif
.annotate 'line', 7229
    $P3 = 'parseStatement'(__ARG_2, self)
    setattribute self, 'scatch', $P3
# }
.annotate 'line', 7230

.end # TryStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7233
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_0
.annotate 'line', 7234
    getattribute $P2, self, 'modifiers'
    $P2.'optimize'()
 __label_0: # endif
.annotate 'line', 7235
    getattribute $P3, self, 'stry'
    $P2 = $P3.'optimize'()
    setattribute self, 'stry', $P2
.annotate 'line', 7236
    getattribute $P3, self, 'scatch'
    $P2 = $P3.'optimize'()
    setattribute self, 'scatch', $P2
.annotate 'line', 7237
    .return(self)
# }
.annotate 'line', 7238

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7241
# reghandler: $S1
    $P2 = self.'tempreg'('P')
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 7242
# labelhandler: $S2
    $P2 = self.'genlabel'()
    null $S2
    if_null $P2, __label_1
    set $S2, $P2
 __label_1:
.annotate 'line', 7243
# labelpasthandler: $S3
    $P2 = self.'genlabel'()
    null $S3
    if_null $P2, __label_2
    set $S3, $P2
 __label_2:
.annotate 'line', 7244
# exreg: $S4
    null $S4
.annotate 'line', 7245
    getattribute $P2, self, 'exname'
    if_null $P2, __label_3
# {
.annotate 'line', 7246
# var exname: $P1
    getattribute $P3, self, 'exname'
    $P1 = self.'getvar'($P3)
.annotate 'line', 7247
    $P2 = $P1.'getreg'()
    set $S4, $P2
# }
    goto __label_4
 __label_3: # else
.annotate 'line', 7250
    $P2 = self.'tempreg'('P')
    set $S4, $P2
 __label_4: # endif
.annotate 'line', 7252
    self.'annotate'(__ARG_1)
.annotate 'line', 7253
    __ARG_1.'comment'('try: create handler')
.annotate 'line', 7255
    __ARG_1.'say'('    ', 'new ', $S1, ", 'ExceptionHandler'")
.annotate 'line', 7256
    __ARG_1.'say'('    ', 'set_label ', $S1, ', ', $S2)
.annotate 'line', 7258
    getattribute $P2, self, 'modifiers'
    if_null $P2, __label_5
.annotate 'line', 7259
    getattribute $P3, self, 'modifiers'
    $P3.'emitmodifiers'(__ARG_1, $S1)
 __label_5: # endif
.annotate 'line', 7261
    __ARG_1.'emitarg1'('push_eh', $S1)
.annotate 'line', 7262
    __ARG_1.'comment'('try: begin')
.annotate 'line', 7263
    getattribute $P2, self, 'stry'
    $P2.'emit'(__ARG_1)
.annotate 'line', 7264
    __ARG_1.'comment'('try: end')
.annotate 'line', 7265
    __ARG_1.'say'('    ', 'pop_eh')
.annotate 'line', 7267
    self.'annotate'(__ARG_1)
.annotate 'line', 7268
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 7270
    __ARG_1.'comment'('catch')
.annotate 'line', 7271
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 7272
    __ARG_1.'say'('    ', '.get_results(', $S4, ')')
.annotate 'line', 7273
    __ARG_1.'emitarg1'('finalize', $S4)
.annotate 'line', 7274
    __ARG_1.'say'('    ', 'pop_eh')
.annotate 'line', 7275
    getattribute $P2, self, 'scatch'
    $P2.'emit'(__ARG_1)
.annotate 'line', 7277
    __ARG_1.'comment'('catch end')
.annotate 'line', 7278
    __ARG_1.'emitlabel'($S3)
# }
.annotate 'line', 7279

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TryStatement' ]
.annotate 'line', 7197
    get_class $P1, [ 'BlockStatement' ]
    addparent $P0, $P1
.annotate 'line', 7199
    addattribute $P0, 'stry'
.annotate 'line', 7200
    addattribute $P0, 'modifiers'
.annotate 'line', 7201
    addattribute $P0, 'exname'
.annotate 'line', 7202
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
.annotate 'line', 7292
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7293
    setattribute self, 'name', __ARG_3
.annotate 'line', 7294
# var vdata: $P1
    $P1 = self.'createvar'(__ARG_3, 'P', __ARG_4)
.annotate 'line', 7295
    $P3 = $P1.'getreg'()
    setattribute self, 'reg', $P3
# }
.annotate 'line', 7296

.end # initvarbase

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'VarBaseStatement' ]
.annotate 'line', 7286
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7288
    addattribute $P0, 'name'
.annotate 'line', 7289
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
.annotate 'line', 7311
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7312
    setattribute self, 'name', __ARG_3
.annotate 'line', 7313
    box $P1, __ARG_4
    setattribute self, 'basetype', $P1
# }
.annotate 'line', 7314

.end # DeclareBase

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'DeclareBase' ]
.annotate 'line', 7303
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7305
    addattribute $P0, 'name'
.annotate 'line', 7306
    addattribute $P0, 'basetype'
.annotate 'line', 7307
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
.annotate 'line', 7325
    self.'DeclareBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 7326
# var vdata: $P1
    getattribute $P3, self, 'name'
    getattribute $P4, self, 'basetype'
    $P1 = self.'createvar'($P3, $P4)
.annotate 'line', 7327
    $P4 = $P1.'getreg'()
    setattribute self, 'reg', $P4
.annotate 'line', 7328
# var t: $P2
    $P2 = __ARG_5.'get'()
.annotate 'line', 7329
    $P3 = $P2.'isop'('=')
    if_null $P3, __label_0
    unless $P3 goto __label_0
# {
.annotate 'line', 7331
    $P5 = 'parseExpr'(__ARG_5, self)
    setattribute self, 'init', $P5
# }
    goto __label_1
 __label_0: # else
.annotate 'line', 7334
    __ARG_5.'unget'($P2)
 __label_1: # endif
# }
.annotate 'line', 7335

.end # DeclareSingleStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7338
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 7339
    if_null $P1, __label_0
.annotate 'line', 7340
    $P3 = $P1.'optimize'()
    setattribute self, 'init', $P3
 __label_0: # endif
.annotate 'line', 7341
    .return(self)
# }
.annotate 'line', 7342

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7345
    self.'annotate'(__ARG_1)
.annotate 'line', 7346
# name: $S1
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 7347
# reg: $S2
    getattribute $P2, self, 'reg'
    null $S2
    if_null $P2, __label_1
    set $S2, $P2
 __label_1:
.annotate 'line', 7348
# basetype: $S3
    getattribute $P2, self, 'basetype'
    null $S3
    if_null $P2, __label_2
    set $S3, $P2
 __label_2:
.annotate 'line', 7349
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 7350
    concat $S7, $S1, ': '
    concat $S7, $S7, $S2
    __ARG_1.'comment'($S7)
.annotate 'line', 7352
    isnull $I1, $P1
    if $I1 goto __label_5
    $I1 = $P1.'isnull'()
 __label_5:
    unless $I1 goto __label_3
.annotate 'line', 7353
    __ARG_1.'emitnull'($S2)
    goto __label_4
 __label_3: # else
# {
.annotate 'line', 7355
# itype: $S4
    $P2 = $P1.'checkresult'()
    null $S4
    if_null $P2, __label_6
    set $S4, $P2
 __label_6:
.annotate 'line', 7356
    ne $S4, $S3, __label_7
# {
.annotate 'line', 7357
    iseq $I1, $S4, 'S'
    unless $I1 goto __label_11
    isa $I1, $P1, [ 'ConcatString' ]
 __label_11:
    unless $I1 goto __label_9
.annotate 'line', 7358
    $P1.'emit_concat_set'(__ARG_1, $S2)
    goto __label_10
 __label_9: # else
.annotate 'line', 7360
    $P1.'emit'(__ARG_1, $S2)
 __label_10: # endif
# }
    goto __label_8
 __label_7: # else
# {
.annotate 'line', 7363
    isa $I1, $P1, [ 'IndexExpr' ]
    unless $I1 goto __label_12
# {
.annotate 'line', 7365
    $P1.'emit'(__ARG_1, $S2)
# }
    goto __label_13
 __label_12: # else
# {
.annotate 'line', 7368
# ireg: $S5
    null $S5
.annotate 'line', 7369
    ne $S4, '', __label_14
.annotate 'line', 7370
    $P2 = $P1.'emit_get'(__ARG_1)
    set $S5, $P2
    goto __label_15
 __label_14: # else
# {
.annotate 'line', 7372
    $P3 = self.'tempreg'($S4)
    set $S5, $P3
.annotate 'line', 7373
    $P1.'emit'(__ARG_1, $S5)
# }
 __label_15: # endif
.annotate 'line', 7375
    iseq $I1, $S3, 'S'
    unless $I1 goto __label_18
    iseq $I1, $S4, 'P'
 __label_18:
    unless $I1 goto __label_16
# {
.annotate 'line', 7376
# auxlabel: $S6
    $P2 = self.'genlabel'()
    null $S6
    if_null $P2, __label_19
    set $S6, $P2
 __label_19:
.annotate 'line', 7377
    __ARG_1.'emitnull'($S2)
.annotate 'line', 7378
    __ARG_1.'emitif_null'($S5, $S6)
.annotate 'line', 7379
    __ARG_1.'emitset'($S2, $S5)
.annotate 'line', 7380
    __ARG_1.'emitlabel'($S6)
# }
    goto __label_17
 __label_16: # else
.annotate 'line', 7383
    __ARG_1.'emitset'($S2, $S5)
 __label_17: # endif
# }
 __label_13: # endif
# }
 __label_8: # endif
# }
 __label_4: # endif
# }
.annotate 'line', 7387

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'DeclareSingleStatement' ]
.annotate 'line', 7319
    get_class $P1, [ 'DeclareBase' ]
    addparent $P0, $P1
.annotate 'line', 7321
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
.annotate 'line', 7402
    self.'DeclareBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 7403
    box $P4, __ARG_5
    setattribute self, 'arraytype', $P4
.annotate 'line', 7404
# var vdata: $P1
    getattribute $P4, self, 'name'
    $P1 = self.'createvar'($P4, 'P')
.annotate 'line', 7405
    $P5 = $P1.'getreg'()
    setattribute self, 'reg', $P5
.annotate 'line', 7406
# var t: $P2
    $P2 = __ARG_6.'get'()
.annotate 'line', 7407
    $P4 = $P2.'isop'(']')
    isfalse $I1, $P4
    unless $I1 goto __label_0
# {
.annotate 'line', 7409
    __ARG_6.'unget'($P2)
.annotate 'line', 7410
    $P5 = 'parseExpr'(__ARG_6, self)
    setattribute self, 'size', $P5
.annotate 'line', 7411
    'ExpectOp'(']', __ARG_6)
# }
 __label_0: # endif
.annotate 'line', 7413
    $P2 = __ARG_6.'get'()
.annotate 'line', 7414
    $P4 = $P2.'isop'('=')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 7415
    $P2 = __ARG_6.'get'()
.annotate 'line', 7416
    $P4 = $P2.'isop'('[')
    isfalse $I1, $P4
    unless $I1 goto __label_3
.annotate 'line', 7417
    'Expected'("array initializer", $P2)
 __label_3: # endif
.annotate 'line', 7418
    root_new $P5, ['parrot';'ResizablePMCArray']
    setattribute self, 'initarray', $P5
.annotate 'line', 7419
    $P2 = __ARG_6.'get'()
.annotate 'line', 7420
    $P4 = $P2.'isop'(']')
    isfalse $I1, $P4
    unless $I1 goto __label_4
# {
.annotate 'line', 7421
    __ARG_6.'unget'($P2)
 __label_5: # do
.annotate 'line', 7422
# {
.annotate 'line', 7423
# var item: $P3
    $P3 = 'parseExpr'(__ARG_6, self)
.annotate 'line', 7424
    getattribute $P4, self, 'initarray'
# predefined push
    push $P4, $P3
# }
 __label_7: # continue
.annotate 'line', 7425
    $P2 = __ARG_6.'get'()
    $P4 = $P2.'isop'(',')
    if_null $P4, __label_6
    if $P4 goto __label_5
 __label_6: # enddo
.annotate 'line', 7426
    $P4 = $P2.'isop'(']')
    isfalse $I1, $P4
    unless $I1 goto __label_8
.annotate 'line', 7427
    'Expected'("',' or ']'", $P2)
 __label_8: # endif
# }
 __label_4: # endif
# }
    goto __label_2
 __label_1: # else
.annotate 'line', 7431
    __ARG_6.'unget'($P2)
 __label_2: # endif
# }
.annotate 'line', 7432

.end # DeclareArrayStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7435
    getattribute $P1, self, 'size'
    if_null $P1, __label_0
.annotate 'line', 7436
    getattribute $P4, self, 'size'
    $P3 = $P4.'optimize'()
    setattribute self, 'size', $P3
 __label_0: # endif
.annotate 'line', 7437
    getattribute $P1, self, 'initarray'
    'optimize_array'($P1)
.annotate 'line', 7438
    .return(self)
# }
.annotate 'line', 7439

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7442
    self.'annotate'(__ARG_1)
.annotate 'line', 7444
# var reg: $P1
    getattribute $P1, self, 'reg'
.annotate 'line', 7445
# var size: $P2
    getattribute $P2, self, 'size'
.annotate 'line', 7446
# var init: $P3
    getattribute $P3, self, 'initarray'
.annotate 'line', 7447
# var basetype: $P4
    getattribute $P4, self, 'basetype'
.annotate 'line', 7448
# arraytype: $S1
# predefined string
    getattribute $P6, self, 'arraytype'
    set $S4, $P6
    concat $S1, $S4, 'Array'
.annotate 'line', 7449
    if_null $P2, __label_0
# {
.annotate 'line', 7451
# regsize: $S2
    $P6 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P6, __label_2
    set $S2, $P6
 __label_2:
.annotate 'line', 7452
    __ARG_1.'say'('    ', 'new ', $P1, ", ['Fixed", $S1, "'], ", $S2)
# }
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 7456
    __ARG_1.'say'('    ', 'new ', $P1, ", ['Resizable", $S1, "']")
# }
 __label_1: # endif
.annotate 'line', 7458
    if_null $P3, __label_3
# {
.annotate 'line', 7459
# itemreg: $S3
    $P6 = self.'tempreg'($P4)
    null $S3
    if_null $P6, __label_4
    set $S3, $P6
 __label_4:
.annotate 'line', 7460
# n: $I1
# predefined elements
    elements $I1, $P3
.annotate 'line', 7461
    unless_null $P2, __label_5
# {
.annotate 'line', 7462
    le $I1, 0, __label_6
# {
.annotate 'line', 7464
    __ARG_1.'emitset'($P1, $I1)
# }
 __label_6: # endif
# }
 __label_5: # endif
.annotate 'line', 7467
# i: $I2
    null $I2
.annotate 'line', 7468
    iter $P7, $P3
    set $P7, 0
 __label_7: # for iteration
    unless $P7 goto __label_8
    shift $P5, $P7
# {
.annotate 'line', 7469
    $P5.'emit'(__ARG_1, $S3)
.annotate 'line', 7470
    __ARG_1.'say'('    ', $P1, '[', $I2, '] = ', $S3)
.annotate 'line', 7471
    inc $I2
# }
    goto __label_7
 __label_8: # endfor
# }
 __label_3: # endif
# }
.annotate 'line', 7474

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'DeclareArrayStatement' ]
.annotate 'line', 7392
    get_class $P1, [ 'DeclareBase' ]
    addparent $P0, $P1
.annotate 'line', 7394
    addattribute $P0, 'size'
.annotate 'line', 7395
    addattribute $P0, 'initarray'
.annotate 'line', 7396
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
.annotate 'line', 7481
# var next: $P1
    null $P1
.annotate 'line', 7482
# var r: $P2
    null $P2
 __label_0: # do
.annotate 'line', 7483
# {
.annotate 'line', 7484
# var name: $P3
    $P3 = __ARG_4.'get'()
.annotate 'line', 7485
    'RequireIdentifier'($P3)
.annotate 'line', 7486
# var t: $P4
    $P4 = __ARG_4.'get'()
.annotate 'line', 7487
# var item: $P5
    null $P5
.annotate 'line', 7488
    $P6 = $P4.'isop'('[')
    if_null $P6, __label_3
    unless $P6 goto __label_3
.annotate 'line', 7489
    $P5 = __ARG_2(__ARG_3, __ARG_5, __ARG_4, $P3)
    goto __label_4
 __label_3: # else
# {
.annotate 'line', 7491
    __ARG_4.'unget'($P4)
.annotate 'line', 7492
    $P5 = __ARG_1(__ARG_3, __ARG_5, $P3, __ARG_4)
# }
 __label_4: # endif
.annotate 'line', 7494
    $P2 = 'addtomulti'($P2, $P5)
.annotate 'line', 7495
    $P1 = __ARG_4.'get'()
# }
 __label_2: # continue
.annotate 'line', 7496
    $P6 = $P1.'isop'(',')
    if_null $P6, __label_1
    if $P6 goto __label_0
 __label_1: # enddo
.annotate 'line', 7497
    'RequireOp'(';', $P1)
.annotate 'line', 7498
    .return($P2)
# }
.annotate 'line', 7499

.end # parseDeclareHelper

.namespace [ 'IntStatement' ]

.sub 'IntStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7507
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'I', __ARG_4)
# }
.annotate 'line', 7508

.end # IntStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IntStatement' ]
.annotate 'line', 7503
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
.annotate 'line', 7515
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'I', 'Integer', __ARG_4)
# }
.annotate 'line', 7516

.end # IntArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IntArrayStatement' ]
.annotate 'line', 7511
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
.annotate 'line', 7522
    new $P2, [ 'IntStatement' ]
    $P2.'IntStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7523

.end # newIntSingle


.sub 'newIntArray'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7527
    new $P2, [ 'IntArrayStatement' ]
    $P2.'IntArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7528

.end # newIntArray


.sub 'parseInt'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7532
.const 'Sub' $P1 = 'newIntSingle'
.const 'Sub' $P2 = 'newIntArray'
.annotate 'line', 7533
    .tailcall 'parseDeclareHelper'($P1, $P2, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7534

.end # parseInt

.namespace [ 'FloatStatement' ]

.sub 'FloatStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7542
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'N', __ARG_4)
# }
.annotate 'line', 7543

.end # FloatStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FloatStatement' ]
.annotate 'line', 7538
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
.annotate 'line', 7550
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'N', 'Float', __ARG_4)
# }
.annotate 'line', 7551

.end # FloatArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FloatArrayStatement' ]
.annotate 'line', 7546
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
.annotate 'line', 7557
    new $P2, [ 'FloatStatement' ]
    $P2.'FloatStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7558

.end # newFloatSingle


.sub 'newFloatArray'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7562
    new $P2, [ 'FloatArrayStatement' ]
    $P2.'FloatArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7563

.end # newFloatArray


.sub 'parseFloat'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7567
.const 'Sub' $P1 = 'newFloatSingle'
.const 'Sub' $P2 = 'newFloatArray'
.annotate 'line', 7568
    .tailcall 'parseDeclareHelper'($P1, $P2, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7569

.end # parseFloat

.namespace [ 'StringStatement' ]

.sub 'StringStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7577
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'S', __ARG_4)
# }
.annotate 'line', 7578

.end # StringStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'StringStatement' ]
.annotate 'line', 7573
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
.annotate 'line', 7585
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'S', 'String', __ARG_4)
# }
.annotate 'line', 7586

.end # StringArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'StringArrayStatement' ]
.annotate 'line', 7581
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
.annotate 'line', 7592
    new $P2, [ 'StringStatement' ]
    $P2.'StringStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7593

.end # newStringSingle


.sub 'newStringArray'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7597
    new $P2, [ 'StringArrayStatement' ]
    $P2.'StringArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7598

.end # newStringArray


.sub 'parseString'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7602
.const 'Sub' $P1 = 'newStringSingle'
.const 'Sub' $P2 = 'newStringArray'
.annotate 'line', 7603
    .tailcall 'parseDeclareHelper'($P1, $P2, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7604

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
.annotate 'line', 7619
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7620
    box $P1, __ARG_3
    setattribute self, 'type', $P1
.annotate 'line', 7621
    setattribute self, 'name', __ARG_4
.annotate 'line', 7622
    setattribute self, 'value', __ARG_5
# }
.annotate 'line', 7623

.end # ConstStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7626
# var value: $P1
    getattribute $P1, self, 'value'
.annotate 'line', 7627
# var name: $P2
    getattribute $P2, self, 'name'
.annotate 'line', 7628
# type: $S1
    getattribute $P3, self, 'type'
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 7629
    $P1 = $P1.'optimize'()
.annotate 'line', 7630
    $P3 = $P1.'hascompilevalue'()
    isfalse $I1, $P3
    unless $I1 goto __label_1
# {
.annotate 'line', 7632
    getattribute $P4, self, 'start'
.annotate 'line', 7631
    'SyntaxError'('Value for const is not evaluable at compile time', $P4)
# }
 __label_1: # endif
.annotate 'line', 7634
    self.'createconst'($P2, $S1, $P1, '')
.annotate 'line', 7635
    setattribute self, 'value', $P1
.annotate 'line', 7636
    .return(self)
# }
.annotate 'line', 7637

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 7640
    getattribute $P1, self, 'start'
    'InternalError'('Direct use of const', $P1)
# }
.annotate 'line', 7641

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7644
# name: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 7645
    concat $S2, 'Constant ', $S1
    concat $S2, $S2, ' evaluated at compile time'
    __ARG_1.'comment'($S2)
# }
.annotate 'line', 7646

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ConstStatement' ]
.annotate 'line', 7610
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7612
    addattribute $P0, 'type'
.annotate 'line', 7613
    addattribute $P0, 'name'
.annotate 'line', 7614
    addattribute $P0, 'value'
.end
.namespace [ ]

.sub 'parseConst'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7651
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7652
# type: $S1
    $P5 = 'typetoregcheck'($P1)
    null $S1
    if_null $P5, __label_0
    set $S1, $P5
 __label_0:
.annotate 'line', 7653
    isne $I1, $S1, 'I'
    unless $I1 goto __label_3
    isne $I1, $S1, 'N'
 __label_3:
    unless $I1 goto __label_2
    isne $I1, $S1, 'S'
 __label_2:
    unless $I1 goto __label_1
.annotate 'line', 7654
    'SyntaxError'('Invalid type for const', __ARG_1)
 __label_1: # endif
.annotate 'line', 7656
# var multi: $P2
    null $P2
 __label_4: # do
.annotate 'line', 7657
# {
.annotate 'line', 7658
    $P1 = __ARG_2.'get'()
.annotate 'line', 7659
# var name: $P3
    set $P3, $P1
.annotate 'line', 7660
    'ExpectOp'('=', __ARG_2)
.annotate 'line', 7661
# var value: $P4
    $P4 = 'parseExpr'(__ARG_2, __ARG_3)
.annotate 'line', 7663
    new $P6, [ 'ConstStatement' ]
    $P6.'ConstStatement'($P1, __ARG_3, $S1, $P3, $P4)
    set $P5, $P6
.annotate 'line', 7662
    $P2 = 'addtomulti'($P2, $P5)
# }
 __label_6: # continue
.annotate 'line', 7664
    $P1 = __ARG_2.'get'()
    $P5 = $P1.'isop'(',')
    if_null $P5, __label_5
    if $P5 goto __label_4
 __label_5: # enddo
.annotate 'line', 7665
    .return($P2)
# }
.annotate 'line', 7666

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
.annotate 'line', 7677
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 7678
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7679
    $P2 = $P1.'isop'('=')
    if_null $P2, __label_0
    unless $P2 goto __label_0
# {
.annotate 'line', 7680
    $P4 = 'parseExpr'(__ARG_2, self)
    setattribute self, 'init', $P4
.annotate 'line', 7681
    $P1 = __ARG_2.'get'()
# }
 __label_0: # endif
.annotate 'line', 7683
    'RequireOp'(';', $P1)
# }
.annotate 'line', 7684

.end # VarStatement


.sub 'optimize_init' :method
# Body
# {
.annotate 'line', 7687
    getattribute $P1, self, 'init'
    if_null $P1, __label_0
.annotate 'line', 7688
    getattribute $P4, self, 'init'
    $P3 = $P4.'optimize'()
    setattribute self, 'init', $P3
 __label_0: # endif
.annotate 'line', 7689
    .return(self)
# }
.annotate 'line', 7690

.end # optimize_init


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7693
    .tailcall self.'optimize_init'()
# }
.annotate 'line', 7694

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7697
    self.'annotate'(__ARG_1)
.annotate 'line', 7698
# name: $S1
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 7699
# reg: $S2
    getattribute $P2, self, 'reg'
    null $S2
    if_null $P2, __label_1
    set $S2, $P2
 __label_1:
.annotate 'line', 7700
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 7701
    concat $S5, 'var ', $S1
    concat $S5, $S5, ': '
    concat $S5, $S5, $S2
    __ARG_1.'comment'($S5)
.annotate 'line', 7702
    if_null $P1, __label_2
.annotate 'line', 7703
    $P2 = $P1.'isnull'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 7704
    null $P1
 __label_3: # endif
 __label_2: # endif
.annotate 'line', 7705
    if_null $P1, __label_4
# {
.annotate 'line', 7706
# type: $S3
    $P2 = $P1.'checkresult'()
    null $S3
    if_null $P2, __label_6
    set $S3, $P2
 __label_6:
.annotate 'line', 7707
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
.annotate 'line', 7709
    isa $I1, $P1, [ 'MemberExpr' ]
    if $I1 goto __label_17
    isa $I1, $P1, [ 'ArrayExpr' ]
 __label_17:
    if $I1 goto __label_16
    isa $I1, $P1, [ 'NewExpr' ]
 __label_16:
    unless $I1 goto __label_14
.annotate 'line', 7710
    $P1.'emit_init'(__ARG_1, $S2)
    goto __label_15
 __label_14: # else
.annotate 'line', 7712
    $P1.'emit'(__ARG_1, $S2)
 __label_15: # endif
    goto __label_7 # break
 __label_10: # case
 __label_11: # case
 __label_12: # case
.annotate 'line', 7717
# value: $S4
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P2, __label_18
    set $S4, $P2
 __label_18:
.annotate 'line', 7718
    __ARG_1.'emitbox'($S2, $S4)
    goto __label_7 # break
 __label_13: # case
.annotate 'line', 7721
    getattribute $P3, self, 'name'
    'SyntaxError'("Can't use void function as initializer", $P3)
 __label_8: # default
.annotate 'line', 7723
    getattribute $P4, self, 'name'
    'SyntaxError'("Invalid var initializer", $P4)
 __label_7: # switch end
# }
    goto __label_5
 __label_4: # else
.annotate 'line', 7727
    __ARG_1.'emitnull'($S2)
 __label_5: # endif
# }
.annotate 'line', 7728

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'VarStatement' ]
.annotate 'line', 7672
    get_class $P1, [ 'VarBaseStatement' ]
    addparent $P0, $P1
.annotate 'line', 7674
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
.annotate 'line', 7735
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 7736
    'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 7737

.end # ResizableVarStatement


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7740
    self.'annotate'(__ARG_1)
.annotate 'line', 7741
# name: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 7742
# reg: $S2
    getattribute $P1, self, 'reg'
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 7743
    concat $S3, 'var ', $S1
    concat $S3, $S3, '[] : '
    concat $S3, $S3, $S2
    __ARG_1.'comment'($S3)
.annotate 'line', 7744
    __ARG_1.'say'('    ', 'new ', $S2, ", 'ResizablePMCArray'")
# }
.annotate 'line', 7745

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ResizableVarStatement' ]
.annotate 'line', 7731
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
.annotate 'line', 7754
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 7755
    $P2 = 'parseExpr'(__ARG_2, self)
    setattribute self, 'exprsize', $P2
.annotate 'line', 7756
    'ExpectOp'(']', __ARG_2)
.annotate 'line', 7757
    'ExpectOp'(';', __ARG_2)
# }
.annotate 'line', 7758

.end # FixedVarStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7761
    getattribute $P3, self, 'exprsize'
    $P2 = $P3.'optimize'()
    setattribute self, 'exprsize', $P2
.annotate 'line', 7762
    .tailcall self.'optimize_init'()
# }
.annotate 'line', 7763

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7766
# regsize: $S1
    getattribute $P2, self, 'exprsize'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 7767
    self.'annotate'(__ARG_1)
.annotate 'line', 7768
# name: $S2
    getattribute $P1, self, 'name'
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
 __label_1:
.annotate 'line', 7769
# reg: $S3
    getattribute $P1, self, 'reg'
    null $S3
    if_null $P1, __label_2
    set $S3, $P1
 __label_2:
.annotate 'line', 7770
    concat $S4, 'var ', $S2
    concat $S4, $S4, '[] : '
    concat $S4, $S4, $S3
    __ARG_1.'comment'($S4)
.annotate 'line', 7771
    __ARG_1.'say'('    ', 'new ', $S3, ", 'FixedPMCArray', ", $S1)
# }
.annotate 'line', 7772

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FixedVarStatement' ]
.annotate 'line', 7748
    get_class $P1, [ 'VarStatement' ]
    addparent $P0, $P1
.annotate 'line', 7750
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
.annotate 'line', 7777
# var name: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7778
    'RequireIdentifier'($P1)
.annotate 'line', 7779
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 7780
    $P3 = $P2.'isop'('[')
    if_null $P3, __label_0
    unless $P3 goto __label_0
# {
.annotate 'line', 7781
    $P2 = __ARG_2.'get'()
.annotate 'line', 7782
    $P3 = $P2.'isop'(']')
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 7783
    new $P5, [ 'ResizableVarStatement' ]
    $P5.'ResizableVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P4, $P5
    .return($P4)
    goto __label_3
 __label_2: # else
# {
.annotate 'line', 7785
    __ARG_2.'unget'($P2)
.annotate 'line', 7786
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
.annotate 'line', 7790
    __ARG_2.'unget'($P2)
.annotate 'line', 7791
    new $P4, [ 'VarStatement' ]
    $P4.'VarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, __ARG_4)
    set $P3, $P4
    .return($P3)
# }
 __label_1: # endif
# }
.annotate 'line', 7793

.end # parseVar


.sub 'parseVolatile'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7797
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7798
    $P2 = $P1.'iskeyword'('var')
    isfalse $I1, $P2
    unless $I1 goto __label_0
.annotate 'line', 7799
    'SyntaxError'("invalid volatile type", $P1)
 __label_0: # endif
.annotate 'line', 7800
    .tailcall 'parseVar'(__ARG_1, __ARG_2, __ARG_3, 1)
# }
.annotate 'line', 7801

.end # parseVolatile

.namespace [ 'CompoundStatement' ]

.sub 'CompoundStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7814
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7815
    root_new $P4, ['parrot';'Hash']
    setattribute self, 'labels', $P4
.annotate 'line', 7816
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'statements', $P4
.annotate 'line', 7817
# var t: $P1
    null $P1
 __label_1: # while
.annotate 'line', 7818
    $P1 = __ARG_2.'get'()
    $P3 = $P1.'isop'('}')
    isfalse $I1, $P3
    unless $I1 goto __label_0
# {
.annotate 'line', 7819
    __ARG_2.'unget'($P1)
.annotate 'line', 7820
# var c: $P2
    $P2 = 'parseStatement'(__ARG_2, self)
.annotate 'line', 7821
    unless_null $P2, __label_2
.annotate 'line', 7822
    'InternalError'('Unexpected null statement')
 __label_2: # endif
.annotate 'line', 7823
    getattribute $P3, self, 'statements'
# predefined push
    push $P3, $P2
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 7825
    setattribute self, 'end', $P1
# }
.annotate 'line', 7826

.end # CompoundStatement


.sub 'getlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7829
# s: $S1
    set $P2, __ARG_1
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 7830
# var labels: $P1
    getattribute $P1, self, 'labels'
.annotate 'line', 7831
# exist: $S2
    $S2 = $P1[$S1]
.annotate 'line', 7832
    isnull $I1, $S2
    if $I1 goto __label_2
    iseq $I1, $S2, ''
 __label_2:
    unless $I1 goto __label_1
.annotate 'line', 7833
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getlabel'(__ARG_1)
    set $S2, $P2
 __label_1: # endif
.annotate 'line', 7834
    .return($S2)
# }
.annotate 'line', 7835

.end # getlabel


.sub 'createlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7838
# s: $S1
    set $P2, __ARG_1
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 7839
# var labels: $P1
    getattribute $P1, self, 'labels'
.annotate 'line', 7840
# exist: $S2
    $S2 = $P1[$S1]
.annotate 'line', 7841
    isnull $I1, $S2
    not $I1
    unless $I1 goto __label_2
    isne $I1, $S2, ''
 __label_2:
    unless $I1 goto __label_1
.annotate 'line', 7842
    'SyntaxError'('Label already defined', __ARG_1)
 __label_1: # endif
.annotate 'line', 7843
# value: $S3
    $P2 = self.'genlabel'()
    null $S3
    if_null $P2, __label_3
    set $S3, $P2
 __label_3:
.annotate 'line', 7844
    $P1[$S1] = $S3
.annotate 'line', 7845
    .return($S3)
# }
.annotate 'line', 7846

.end # createlabel


.sub 'getend' :method
# Body
# {
.annotate 'line', 7847
    getattribute $P1, self, 'end'
    .return($P1)
# }

.end # getend


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7850
    __ARG_1.'comment'('{')
.annotate 'line', 7851
    getattribute $P2, self, 'statements'
    iter $P3, $P2
    set $P3, 0
 __label_0: # for iteration
    unless $P3 goto __label_1
    shift $P1, $P3
# {
.annotate 'line', 7852
    $P1.'emit'(__ARG_1)
.annotate 'line', 7853
    self.'freetemps'()
# }
    goto __label_0
 __label_1: # endfor
.annotate 'line', 7855
    __ARG_1.'comment'('}')
# }
.annotate 'line', 7856

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CompoundStatement' ]
.annotate 'line', 7807
    get_class $P1, [ 'MultiStatementBase' ]
    addparent $P0, $P1
    get_class $P2, [ 'BlockStatement' ]
    addparent $P0, $P2
.annotate 'line', 7809
    addattribute $P0, 'end'
.annotate 'line', 7810
    addattribute $P0, 'labels'
.end
.namespace [ 'RegisterStore' ]

.sub 'RegisterStore' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 7871
    box $P3, __ARG_1
    setattribute self, 'type', $P3
.annotate 'line', 7873
    box $P3, 1
    setattribute self, 'nreg', $P3
.annotate 'line', 7874
    new $P1, ['ResizableStringArray']
.annotate 'line', 7875
    new $P2, ['ResizableStringArray']
.annotate 'line', 7876
    setattribute self, 'tempreg', $P1
.annotate 'line', 7877
    setattribute self, 'freereg', $P2
# }
.annotate 'line', 7878

.end # RegisterStore


.sub 'createreg' :method
# Body
# {
.annotate 'line', 7881
# var n: $P1
    getattribute $P1, self, 'nreg'
.annotate 'line', 7882
# i: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 7883
# reg: $S1
    set $I2, $I1
    inc $I1
    set $S1, $I2
.annotate 'line', 7884
    assign $P1, $I1
.annotate 'line', 7885
# type: $S2
    getattribute $P2, self, 'type'
    null $S2
    if_null $P2, __label_0
    set $S2, $P2
 __label_0:
.annotate 'line', 7886
    concat $S0, '$', $S2
    concat $S0, $S0, $S1
    set $S1, $S0
.annotate 'line', 7887
    .return($S1)
# }
.annotate 'line', 7888

.end # createreg


.sub 'tempreg' :method
# Body
# {
.annotate 'line', 7891
# var freereg: $P1
    getattribute $P1, self, 'freereg'
.annotate 'line', 7892
# var tempreg: $P2
    getattribute $P2, self, 'tempreg'
.annotate 'line', 7893
# reg: $S1
    null $S1
.annotate 'line', 7894
# predefined elements
    elements $I1, $P1
    le $I1, 0, __label_0
.annotate 'line', 7895
    $P3 = $P1.'pop'()
    set $S1, $P3
    goto __label_1
 __label_0: # else
.annotate 'line', 7897
    $P4 = self.'createreg'()
    set $S1, $P4
 __label_1: # endif
.annotate 'line', 7898
# predefined push
    push $P2, $S1
.annotate 'line', 7899
    .return($S1)
# }
.annotate 'line', 7900

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 7903
# var freereg: $P1
    getattribute $P1, self, 'freereg'
.annotate 'line', 7904
# var tempreg: $P2
    getattribute $P2, self, 'tempreg'
.annotate 'line', 7905
# n: $I1
# predefined elements
    elements $I1, $P2
# for loop
.annotate 'line', 7906
# i: $I2
    sub $I2, $I1, 1
 __label_2: # for condition
    lt $I2, 0, __label_1
# {
.annotate 'line', 7907
# s: $S1
    $S1 = $P2[$I2]
.annotate 'line', 7908
# predefined push
    push $P1, $S1
# }
 __label_0: # for iteration
.annotate 'line', 7906
    dec $I2
    goto __label_2
 __label_1: # for end
.annotate 'line', 7910
    assign $P2, 0
# }
.annotate 'line', 7911

.end # freetemps

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'RegisterStore' ]
.annotate 'line', 7865
    addattribute $P0, 'type'
.annotate 'line', 7866
    addattribute $P0, 'nreg'
.annotate 'line', 7867
    addattribute $P0, 'tempreg'
.annotate 'line', 7868
    addattribute $P0, 'freereg'
.end
.namespace [ 'ParameterModifierList' ]

.sub 'ParameterModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 7922
    self.'ModifierList'(__ARG_1, __ARG_2)
# }
.annotate 'line', 7923

.end # ParameterModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 7926
# var named: $P1
    null $P1
.annotate 'line', 7927
# var slurpy: $P2
    null $P2
.annotate 'line', 7928
# var modarglist: $P3
    $P3 = self.'getlist'()
.annotate 'line', 7929
    iter $P6, $P3
    set $P6, 0
 __label_0: # for iteration
    unless $P6 goto __label_1
    shift $P4, $P6
# {
.annotate 'line', 7930
# modname: $S1
    $P7 = $P4.'getname'()
    null $S1
    if_null $P7, __label_2
    set $S1, $P7
 __label_2:
.annotate 'line', 7931
    set $S3, $S1
    set $S4, 'named'
    if $S3 == $S4 goto __label_5
    set $S4, 'slurpy'
    if $S3 == $S4 goto __label_6
    goto __label_4
# switch
 __label_5: # case
.annotate 'line', 7933
    set $P1, $P4
    goto __label_3 # break
 __label_6: # case
.annotate 'line', 7936
    set $P2, $P4
    goto __label_3 # break
 __label_4: # default
.annotate 'line', 7939
    __ARG_1.'print'(' :', $S1)
 __label_3: # switch end
# }
    goto __label_0
 __label_1: # endfor
.annotate 'line', 7942
    isnull $I2, $P1
    not $I2
    unless $I2 goto __label_9
    isnull $I2, $P2
    not $I2
 __label_9:
    unless $I2 goto __label_7
# {
.annotate 'line', 7947
    __ARG_1.'print'(" :named :slurpy")
# }
    goto __label_8
 __label_7: # else
# {
.annotate 'line', 7950
    if_null $P1, __label_10
# {
.annotate 'line', 7951
# setname: $S2
    null $S2
.annotate 'line', 7952
# nargs: $I1
    $P7 = $P1.'numargs'()
    set $I1, $P7
.annotate 'line', 7953
    set $I2, $I1
    null $I3
    if $I2 == $I3 goto __label_14
    set $I3, 1
    if $I2 == $I3 goto __label_15
    goto __label_13
# switch
 __label_14: # case
.annotate 'line', 7955
    concat $S0, "'", __ARG_3
    concat $S0, $S0, "'"
    set $S2, $S0
    goto __label_12 # break
 __label_15: # case
.annotate 'line', 7958
# var argmod: $P5
    $P5 = $P1.'getarg'(0)
.annotate 'line', 7959
    $P7 = $P5.'isstringliteral'()
    isfalse $I4, $P7
    unless $I4 goto __label_16
.annotate 'line', 7960
    'SyntaxError'('Invalid modifier', __ARG_2)
 __label_16: # endif
.annotate 'line', 7961
    $P8 = $P5.'getPirString'()
    set $S2, $P8
    goto __label_12 # break
 __label_13: # default
.annotate 'line', 7964
    'SyntaxError'('Invalid modifier', __ARG_2)
 __label_12: # switch end
.annotate 'line', 7966
    __ARG_1.'print'(" :named(", $S2, ")")
# }
    goto __label_11
 __label_10: # else
.annotate 'line', 7968
    if_null $P2, __label_17
# {
.annotate 'line', 7969
    __ARG_1.'print'(" :slurpy")
# }
 __label_17: # endif
 __label_11: # endif
# }
 __label_8: # endif
# }
.annotate 'line', 7972

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ParameterModifierList' ]
.annotate 'line', 7918
    get_class $P1, [ 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'FunctionParameter' ]

.sub 'FunctionParameter' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 7981
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7982
# type: $S1
    $P3 = $P1.'checkkeyword'()
    $P2 = 'typetoregcheck'($P3)
    null $S1
    if_null $P2, __label_0
    set $S1, $P2
 __label_0:
.annotate 'line', 7983
    eq $S1, '', __label_1
.annotate 'line', 7984
    $P1 = __ARG_2.'get'()
    goto __label_2
 __label_1: # else
.annotate 'line', 7986
    set $S1, 'P'
 __label_2: # endif
.annotate 'line', 7987
# argname: $S2
# predefined string
    $P2 = __ARG_1.'getparamnum'()
    set $S3, $P2
    concat $S2, '__ARG_', $S3
.annotate 'line', 7988
    __ARG_1.'createvarnamed'($P1, $S1, $S2)
.annotate 'line', 7990
# predefined string
    set $S3, $P1
    box $P2, $S3
    setattribute self, 'name', $P2
.annotate 'line', 7991
    $P1 = __ARG_2.'get'()
.annotate 'line', 7992
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 7993
    new $P5, [ 'ParameterModifierList' ]
    $P5.'ParameterModifierList'(__ARG_2, self)
    set $P4, $P5
    setattribute self, 'modifiers', $P4
    goto __label_4
 __label_3: # else
.annotate 'line', 7995
    __ARG_2.'unget'($P1)
 __label_4: # endif
# }
.annotate 'line', 7996

.end # FunctionParameter


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 7999
# paramname: $S1
    getattribute $P3, self, 'name'
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 8000
# var param: $P1
    $P1 = __ARG_1.'getvar'($S1)
.annotate 'line', 8001
# ptype: $S2
    $P4 = $P1.'gettype'()
    $P3 = 'typetopirname'($P4)
    null $S2
    if_null $P3, __label_1
    set $S2, $P3
 __label_1:
.annotate 'line', 8002
    $P3 = $P1.'getreg'()
    __ARG_2.'print'('        .param ', $S2, ' ', $P3)
.annotate 'line', 8003
# var modarg: $P2
    getattribute $P2, self, 'modifiers'
.annotate 'line', 8004
    if_null $P2, __label_2
.annotate 'line', 8005
    getattribute $P3, __ARG_1, 'start'
    $P2.'emitmodifiers'(__ARG_2, $P3, $S1)
 __label_2: # endif
.annotate 'line', 8006
    __ARG_2.'say'('')
# }
.annotate 'line', 8007

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FunctionParameter' ]
.annotate 'line', 7977
    addattribute $P0, 'name'
.annotate 'line', 7978
    addattribute $P0, 'modifiers'
.end
.namespace [ 'FunctionBase' ]

.sub 'FunctionBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8033
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 8034
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'params', $P2
.annotate 'line', 8035
    box $P1, 0
    setattribute self, 'nlabel', $P1
.annotate 'line', 8036
    new $P3, [ 'RegisterStore' ]
    $P3.'RegisterStore'('I')
    set $P2, $P3
    setattribute self, 'regstI', $P2
.annotate 'line', 8037
    new $P3, [ 'RegisterStore' ]
    $P3.'RegisterStore'('N')
    set $P2, $P3
    setattribute self, 'regstN', $P2
.annotate 'line', 8038
    new $P3, [ 'RegisterStore' ]
    $P3.'RegisterStore'('S')
    set $P2, $P3
    setattribute self, 'regstS', $P2
.annotate 'line', 8039
    new $P3, [ 'RegisterStore' ]
    $P3.'RegisterStore'('P')
    set $P2, $P3
    setattribute self, 'regstP', $P2
# }
.annotate 'line', 8040

.end # FunctionBase


.sub 'getouter' :method
# Body
# {
.annotate 'line', 8042
    .return(self)
# }

.end # getouter


.sub 'makesubid' :method
# Body
# {
.annotate 'line', 8046
# var subid: $P1
    getattribute $P1, self, 'subid'
.annotate 'line', 8047
    unless_null $P1, __label_0
# {
.annotate 'line', 8048
    $P1 = self.'generatesubid'()
.annotate 'line', 8049
    setattribute self, 'subid', $P1
# }
 __label_0: # endif
.annotate 'line', 8051
    .return($P1)
# }
.annotate 'line', 8052

.end # makesubid


.sub 'same_scope_as' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8056
# r: $I1
    issame $I1, self, __ARG_1
.annotate 'line', 8057
    .return($I1)
# }
.annotate 'line', 8058

.end # same_scope_as


.sub 'parse_parameters' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8061
# var params: $P1
    getattribute $P1, self, 'params'
.annotate 'line', 8062
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 8063
    $P3 = $P2.'isop'(')')
    isfalse $I1, $P3
    unless $I1 goto __label_0
# {
.annotate 'line', 8064
    __ARG_1.'unget'($P2)
 __label_1: # do
.annotate 'line', 8065
# {
.annotate 'line', 8066
    new $P4, [ 'FunctionParameter' ]
    $P4.'FunctionParameter'(self, __ARG_1)
    set $P3, $P4
# predefined push
    push $P1, $P3
.annotate 'line', 8067
    $P2 = __ARG_1.'get'()
# }
 __label_3: # continue
.annotate 'line', 8068
    $P3 = $P2.'isop'(',')
    if_null $P3, __label_2
    if $P3 goto __label_1
 __label_2: # enddo
.annotate 'line', 8069
    $P3 = $P2.'isop'(')')
    isfalse $I1, $P3
    unless $I1 goto __label_4
.annotate 'line', 8070
    'Expected'("')' or ','", $P2)
 __label_4: # endif
# }
 __label_0: # endif
# }
.annotate 'line', 8072

.end # parse_parameters


.sub 'addlocalfunction' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8076
# var localfun: $P1
    getattribute $P1, self, 'localfun'
.annotate 'line', 8077
    unless_null $P1, __label_0
.annotate 'line', 8078
    root_new $P3, ['parrot';'ResizablePMCArray']
    push $P3, __ARG_1
    setattribute self, 'localfun', $P3
    goto __label_1
 __label_0: # else
.annotate 'line', 8080
# predefined push
    push $P1, __ARG_1
 __label_1: # endif
# }
.annotate 'line', 8081

.end # addlocalfunction


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8085
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 8086
    .return(self)
# }
.annotate 'line', 8087

.end # optimize


.sub 'setusedlex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 8091
# var lexicals: $P1
    getattribute $P1, self, 'usedlexicals'
.annotate 'line', 8092
    unless_null $P1, __label_0
# {
.annotate 'line', 8093
    root_new $P1, ['parrot';'Hash']
.annotate 'line', 8094
    setattribute self, 'usedlexicals', $P1
# }
 __label_0: # endif
.annotate 'line', 8096
    $P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 8097

.end # setusedlex


.sub 'setlex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 8100
# var lexicals: $P1
    getattribute $P1, self, 'lexicals'
.annotate 'line', 8101
    unless_null $P1, __label_0
# {
.annotate 'line', 8102
    root_new $P1, ['parrot';'Hash']
.annotate 'line', 8103
    setattribute self, 'lexicals', $P1
# }
 __label_0: # endif
.annotate 'line', 8105
    $P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 8106

.end # setlex


.sub 'createlex' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8111
# var lex: $P1
    $P1 = __ARG_1.'getlex'()
.annotate 'line', 8112
# lexname: $S1
    null $S1
.annotate 'line', 8113
    if_null $P1, __label_0
.annotate 'line', 8114
    set $S1, $P1
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 8116
# reg: $S2
    $P2 = __ARG_1.'getreg'()
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
 __label_2:
.annotate 'line', 8117
# lexnum: $I1
    $P2 = self.'getlexnum'()
    set $I1, $P2
.annotate 'line', 8118
# predefined string
    set $S3, $I1
    concat $S0, '__WLEX_', $S3
    set $S1, $S0
.annotate 'line', 8119
    self.'setlex'($S1, $S2)
.annotate 'line', 8120
    __ARG_1.'setlex'($S1)
# }
 __label_1: # endif
.annotate 'line', 8122
    .return($S1)
# }
.annotate 'line', 8123

.end # createlex


.sub 'createreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8127
# var store: $P1
    null $P1
.annotate 'line', 8128
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
.annotate 'line', 8130
    getattribute $P1, self, 'regstI'
    goto __label_0 # break
 __label_3: # case
.annotate 'line', 8132
    getattribute $P1, self, 'regstN'
    goto __label_0 # break
 __label_4: # case
.annotate 'line', 8134
    getattribute $P1, self, 'regstS'
    goto __label_0 # break
 __label_5: # case
.annotate 'line', 8136
    getattribute $P1, self, 'regstP'
    goto __label_0 # break
 __label_1: # default
.annotate 'line', 8138
    concat $S4, 'Invalid type in createreg: ', __ARG_1
    'InternalError'($S4)
 __label_0: # switch end
.annotate 'line', 8140
# reg: $S1
    $P2 = $P1.'createreg'()
    null $S1
    if_null $P2, __label_6
    set $S1, $P2
 __label_6:
.annotate 'line', 8141
    .return($S1)
# }
.annotate 'line', 8142

.end # createreg


.sub 'tempreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8145
# var store: $P1
    null $P1
.annotate 'line', 8146
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
.annotate 'line', 8148
    getattribute $P1, self, 'regstI'
    goto __label_0 # break
 __label_3: # case
.annotate 'line', 8150
    getattribute $P1, self, 'regstN'
    goto __label_0 # break
 __label_4: # case
.annotate 'line', 8152
    getattribute $P1, self, 'regstS'
    goto __label_0 # break
 __label_5: # case
.annotate 'line', 8154
    getattribute $P1, self, 'regstP'
    goto __label_0 # break
 __label_1: # default
.annotate 'line', 8156
    concat $S4, "Invalid type '", __ARG_1
    concat $S4, $S4, "' in tempreg"
    'InternalError'($S4)
 __label_0: # switch end
.annotate 'line', 8158
# reg: $S1
    $P2 = $P1.'tempreg'()
    null $S1
    if_null $P2, __label_6
    set $S1, $P2
 __label_6:
.annotate 'line', 8159
    .return($S1)
# }
.annotate 'line', 8160

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 8163
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
.annotate 'line', 8164
    $P1.'freetemps'()
    goto __label_0
 __label_1: # endfor
# }
.annotate 'line', 8165

.end # freetemps


.sub 'genlabel' :method
# Body
# {
.annotate 'line', 8168
# var nlabel: $P1
    getattribute $P1, self, 'nlabel'
.annotate 'line', 8169
# n: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 8170
# s: $S1
    set $I2, $I1
    inc $I1
    set $S2, $I2
    concat $S1, '__label_', $S2
.annotate 'line', 8171
    assign $P1, $I1
.annotate 'line', 8172
    .return($S1)
# }
.annotate 'line', 8173

.end # genlabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8176
    'SyntaxError'('break not allowed here', __ARG_1)
# }
.annotate 'line', 8177

.end # getbreaklabel


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8180
    'SyntaxError'('continue not allowed here', __ARG_1)
# }
.annotate 'line', 8181

.end # getcontinuelabel


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8185
# name: $S1
    getattribute $P13, self, 'name'
    null $S1
    if_null $P13, __label_0
    set $S1, $P13
 __label_0:
.annotate 'line', 8186
    __ARG_1.'say'()
.annotate 'line', 8187
    __ARG_1.'print'(".sub ")
.annotate 'line', 8188
    $P13 = self.'isanonymous'()
    if_null $P13, __label_1
    unless $P13 goto __label_1
.annotate 'line', 8189
    __ARG_1.'print'("'' :anon")
    goto __label_2
 __label_1: # else
.annotate 'line', 8191
    __ARG_1.'print'("'", $S1, "'")
 __label_2: # endif
.annotate 'line', 8192
    getattribute $P13, self, 'subid'
    if_null $P13, __label_3
.annotate 'line', 8193
    getattribute $P14, self, 'subid'
    __ARG_1.'print'(" :subid('", $P14, "')")
 __label_3: # endif
.annotate 'line', 8194
    getattribute $P13, self, 'outer'
    if_null $P13, __label_4
# {
.annotate 'line', 8195
# var outer: $P1
    getattribute $P1, self, 'outer'
.annotate 'line', 8196
# var outerid: $P2
    getattribute $P2, $P1, 'subid'
.annotate 'line', 8197
    if_null $P2, __label_5
.annotate 'line', 8198
    __ARG_1.'print'(" :outer('", $P2, "')")
 __label_5: # endif
# }
 __label_4: # endif
.annotate 'line', 8202
    $P13 = self.'ismethod'()
    if_null $P13, __label_6
    unless $P13 goto __label_6
.annotate 'line', 8203
    __ARG_1.'print'(' :method')
 __label_6: # endif
.annotate 'line', 8204
# var modifiers: $P3
    getattribute $P3, self, 'modifiers'
.annotate 'line', 8205
    if_null $P3, __label_7
# {
.annotate 'line', 8206
# var mlist: $P4
    $P4 = $P3.'getlist'()
.annotate 'line', 8207
    iter $P15, $P4
    set $P15, 0
 __label_9: # for iteration
    unless $P15 goto __label_10
    shift $P5, $P15
# {
.annotate 'line', 8208
# nargmods: $I1
    $P13 = $P5.'numargs'()
    set $I1, $P13
.annotate 'line', 8209
    $P13 = $P5.'getname'()
    __ARG_1.'print'(' :', $P13)
.annotate 'line', 8210
    le $I1, 0, __label_11
# {
.annotate 'line', 8211
    __ARG_1.'print'('(')
# for loop
.annotate 'line', 8212
# iargmod: $I2
    null $I2
 __label_14: # for condition
    ge $I2, $I1, __label_13
# {
.annotate 'line', 8213
# var argmod: $P6
    $P6 = $P5.'getarg'($I2)
.annotate 'line', 8214
    $P13 = $P6.'isstringliteral'()
    isfalse $I4, $P13
    unless $I4 goto __label_15
.annotate 'line', 8215
    getattribute $P14, $P6, 'start'
    'SyntaxError'('Invalid modifier', $P14)
 __label_15: # endif
.annotate 'line', 8216
    $P13 = $P6.'getPirString'()
    __ARG_1.'print'($P13)
# }
 __label_12: # for iteration
.annotate 'line', 8212
    inc $I2
    goto __label_14
 __label_13: # for end
.annotate 'line', 8218
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
.annotate 'line', 8223
    ne $S1, 'main', __label_16
.annotate 'line', 8224
    __ARG_1.'print'(' :main')
 __label_16: # endif
# }
 __label_8: # endif
.annotate 'line', 8226
    __ARG_1.'say'()
.annotate 'line', 8229
    getattribute $P13, self, 'params'
    iter $P16, $P13
    set $P16, 0
 __label_17: # for iteration
    unless $P16 goto __label_18
    shift $P7, $P16
.annotate 'line', 8230
    $P7.'emit'(self, __ARG_1)
    goto __label_17
 __label_18: # endfor
.annotate 'line', 8232
# var lexicals: $P8
    getattribute $P8, self, 'lexicals'
.annotate 'line', 8233
# var usedlexicals: $P9
    getattribute $P9, self, 'usedlexicals'
.annotate 'line', 8234
    isnull $I4, $P8
    not $I4
    if $I4 goto __label_20
    isnull $I4, $P9
    not $I4
 __label_20:
    unless $I4 goto __label_19
# {
.annotate 'line', 8235
    getattribute $P13, self, 'start'
    __ARG_1.'annotate'($P13)
.annotate 'line', 8237
    if_null $P8, __label_21
# {
.annotate 'line', 8239
    iter $P17, $P8
    set $P17, 0
 __label_22: # for iteration
    unless $P17 goto __label_23
    shift $S2, $P17
.annotate 'line', 8240
    $P13 = $P8[$S2]
    __ARG_1.'say'(".lex '", $P13, "', ", $S2)
    goto __label_22
 __label_23: # endfor
# }
 __label_21: # endif
.annotate 'line', 8243
    if_null $P9, __label_24
# {
.annotate 'line', 8245
    iter $P18, $P9
    set $P18, 0
 __label_25: # for iteration
    unless $P18 goto __label_26
    shift $S3, $P18
.annotate 'line', 8246
    $P13 = $P9[$S3]
    __ARG_1.'emitfind_lex'($S3, $P13)
    goto __label_25
 __label_26: # endfor
# }
 __label_24: # endif
# }
 __label_19: # endif
.annotate 'line', 8250
# var body: $P10
    getattribute $P10, self, 'body'
.annotate 'line', 8251
    $P13 = $P10.'isempty'()
    if_null $P13, __label_27
    unless $P13 goto __label_27
.annotate 'line', 8252
    __ARG_1.'comment'('Empty body')
    goto __label_28
 __label_27: # else
# {
.annotate 'line', 8254
    __ARG_1.'comment'('Body')
.annotate 'line', 8255
    $P10.'emit'(__ARG_1)
.annotate 'line', 8256
    $P13 = $P10.'getend'()
    __ARG_1.'annotate'($P13)
# }
 __label_28: # endif
.annotate 'line', 8258
    __ARG_1.'say'("\n.end # ", $S1, "\n")
.annotate 'line', 8261
# var localfun: $P11
    getattribute $P11, self, 'localfun'
.annotate 'line', 8262
    if_null $P11, __label_29
# {
# for loop
.annotate 'line', 8263
# ifn: $I3
    null $I3
 __label_32: # for condition
# predefined elements
    elements $I4, $P11
    ge $I3, $I4, __label_31
# {
.annotate 'line', 8264
# var fn: $P12
    $P12 = $P11[$I3]
.annotate 'line', 8265
    $P12.'emit'(__ARG_1)
# }
 __label_30: # for iteration
.annotate 'line', 8263
    inc $I3
    goto __label_32
 __label_31: # for end
# }
 __label_29: # endif
# }
.annotate 'line', 8268

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FunctionBase' ]
.annotate 'line', 8014
    get_class $P1, [ 'BlockStatement' ]
    addparent $P0, $P1
.annotate 'line', 8016
    addattribute $P0, 'name'
.annotate 'line', 8017
    addattribute $P0, 'subid'
.annotate 'line', 8018
    addattribute $P0, 'modifiers'
.annotate 'line', 8019
    addattribute $P0, 'params'
.annotate 'line', 8020
    addattribute $P0, 'body'
.annotate 'line', 8021
    addattribute $P0, 'regstI'
.annotate 'line', 8022
    addattribute $P0, 'regstN'
.annotate 'line', 8023
    addattribute $P0, 'regstS'
.annotate 'line', 8024
    addattribute $P0, 'regstP'
.annotate 'line', 8025
    addattribute $P0, 'nlabel'
.annotate 'line', 8026
    addattribute $P0, 'localfun'
.annotate 'line', 8027
    addattribute $P0, 'lexicals'
.annotate 'line', 8028
    addattribute $P0, 'usedlexicals'
.annotate 'line', 8029
    addattribute $P0, 'outer'
.end
.namespace [ 'FunctionStatement' ]

.sub 'FunctionStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8282
    self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 8283
    box $P1, 0
    setattribute self, 'paramnum', $P1
.annotate 'line', 8284
    box $P1, 0
    setattribute self, 'lexnum', $P1
.annotate 'line', 8285
    self.'parse'(__ARG_2)
# }
.annotate 'line', 8286

.end # FunctionStatement


.sub 'isanonymous' :method
# Body
# {
.annotate 'line', 8288
    .return(0)
# }

.end # isanonymous


.sub 'getparamnum' :method
# Body
# {
.annotate 'line', 8292
# var paramnum: $P1
    getattribute $P1, self, 'paramnum'
.annotate 'line', 8293
# n: $I1
    set $I2, $P1
    add $I1, $I2, 1
.annotate 'line', 8294
    assign $P1, $I1
.annotate 'line', 8295
    .return($I1)
# }
.annotate 'line', 8296

.end # getparamnum


.sub 'getlexnum' :method
# Body
# {
.annotate 'line', 8300
# var lexnum: $P1
    getattribute $P1, self, 'lexnum'
.annotate 'line', 8301
# n: $I1
    set $I2, $P1
    add $I1, $I2, 1
.annotate 'line', 8302
    assign $P1, $I1
.annotate 'line', 8303
    .return($I1)
# }
.annotate 'line', 8304

.end # getlexnum


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 8305
    .return(0)
# }

.end # ismethod


.sub 'parse' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8309
# var name: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8310
    setattribute self, 'name', $P1
.annotate 'line', 8311
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 8312
    $P4 = $P2.'isop'('[')
    if_null $P4, __label_0
    unless $P4 goto __label_0
# {
.annotate 'line', 8313
    new $P7, [ 'ModifierList' ]
    $P7.'ModifierList'(__ARG_1, self)
    set $P6, $P7
    setattribute self, 'modifiers', $P6
.annotate 'line', 8314
    $P2 = __ARG_1.'get'()
# }
 __label_0: # endif
.annotate 'line', 8316
    'RequireOp'('(', $P2)
.annotate 'line', 8317
    self.'parse_parameters'(__ARG_1)
.annotate 'line', 8319
# var fullname: $P3
    getattribute $P5, self, 'owner'
    $P4 = $P5.'getpath'()
# predefined clone
    clone $P3, $P4
.annotate 'line', 8320
    $P4 = $P1.'getidentifier'()
# predefined push
    push $P3, $P4
.annotate 'line', 8322
    new $P5, [ 'StringLiteral' ]
.annotate 'line', 8323
    new $P7, [ 'TokenQuoted' ]
    getattribute $P8, $P1, 'file'
    getattribute $P9, $P1, 'line'
# predefined join
    join $S1, '.', $P3
    $P7.'TokenQuoted'($P8, $P9, $S1)
    set $P6, $P7
    $P5.'StringLiteral'(self, $P6)
    set $P4, $P5
.annotate 'line', 8321
    self.'createconst'('__FUNCTION__', 'S', $P4, '')
.annotate 'line', 8326
    $P2 = __ARG_1.'get'()
.annotate 'line', 8327
    $P4 = $P2.'isop'('{')
    isfalse $I1, $P4
    unless $I1 goto __label_1
.annotate 'line', 8328
    'ExpectedOp'('{', $P2)
 __label_1: # endif
.annotate 'line', 8329
    new $P6, [ 'CompoundStatement' ]
    $P6.'CompoundStatement'($P2, __ARG_1, self)
    set $P5, $P6
    setattribute self, 'body', $P5
.annotate 'line', 8330
    .return(self)
# }
.annotate 'line', 8331

.end # parse

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FunctionStatement' ]
.annotate 'line', 8275
    get_class $P1, [ 'FunctionBase' ]
    addparent $P0, $P1
.annotate 'line', 8277
    addattribute $P0, 'paramnum'
.annotate 'line', 8278
    addattribute $P0, 'lexnum'
.end
.namespace [ 'LocalFunctionStatement' ]

.sub 'LocalFunctionStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8342
    self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 8343
    $P4 = __ARG_3.'getouter'()
    setattribute self, 'outer', $P4
.annotate 'line', 8344
    getattribute $P3, self, 'outer'
    $P3.'makesubid'()
.annotate 'line', 8345
# var subid: $P1
    $P1 = self.'makesubid'()
.annotate 'line', 8346
    setattribute self, 'name', $P1
.annotate 'line', 8347
    self.'parse_parameters'(__ARG_2)
.annotate 'line', 8348
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 8349
    'RequireOp'('{', $P2)
.annotate 'line', 8350
    new $P5, [ 'CompoundStatement' ]
    $P5.'CompoundStatement'($P2, __ARG_2, self)
    set $P4, $P5
    setattribute self, 'body', $P4
.annotate 'line', 8351
    __ARG_3.'addlocalfunction'(self)
# }
.annotate 'line', 8352

.end # LocalFunctionStatement


.sub 'isanonymous' :method
# Body
# {
.annotate 'line', 8353
    .return(1)
# }

.end # isanonymous


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 8354
    .return(0)
# }

.end # ismethod


.sub 'getsubid' :method
# Body
# {
.annotate 'line', 8357
    getattribute $P1, self, 'subid'
    .return($P1)
# }
.annotate 'line', 8358

.end # getsubid


.sub 'getparamnum' :method
# Body
# {
.annotate 'line', 8362
    getattribute $P1, self, 'outer'
    .tailcall $P1.'getparamnum'()
# }
.annotate 'line', 8363

.end # getparamnum


.sub 'getlexnum' :method
# Body
# {
.annotate 'line', 8367
    getattribute $P1, self, 'outer'
    .tailcall $P1.'getlexnum'()
# }
.annotate 'line', 8368

.end # getlexnum


.sub 'getvar' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8371
# var r: $P1
    $P1 = self.'getlocalvar'(__ARG_1)
.annotate 'line', 8372
    unless_null $P1, __label_0
# {
.annotate 'line', 8375
    getattribute $P6, self, 'owner'
    $P1 = $P6.'getvar'(__ARG_1)
.annotate 'line', 8376
    unless_null $P1, __label_1
# {
.annotate 'line', 8378
    ne __ARG_1, 'self', __label_3
# {
.annotate 'line', 8379
# var ownerscope: $P2
    getattribute $P2, self, 'outer'
.annotate 'line', 8380
    getattribute $P7, self, 'outer'
    $P6 = $P7.'ismethod'()
    if_null $P6, __label_4
    unless $P6 goto __label_4
# {
.annotate 'line', 8381
# lexself: $S1
    $P8 = $P2.'makelexicalself'()
    null $S1
    if_null $P8, __label_5
    set $S1, $P8
 __label_5:
.annotate 'line', 8382
    $P1 = self.'createvar'(__ARG_1, 'P')
.annotate 'line', 8383
# reg: $S2
    $P6 = $P1.'getreg'()
    null $S2
    if_null $P6, __label_6
    set $S2, $P6
 __label_6:
.annotate 'line', 8384
    self.'setusedlex'($S1, $S2)
# }
 __label_4: # endif
# }
 __label_3: # endif
# }
    goto __label_2
 __label_1: # else
.annotate 'line', 8388
    $P6 = $P1.'gettype'()
    set $S5, $P6
    iseq $I2, $S5, 'P'
    unless $I2 goto __label_8
    $P7 = $P1.'isconst'()
    isfalse $I2, $P7
 __label_8:
    unless $I2 goto __label_7
# {
.annotate 'line', 8389
# var scope: $P3
    $P3 = $P1.'getscope'()
.annotate 'line', 8390
# var ownerscope: $P4
    $P4 = $P3.'getouter'()
.annotate 'line', 8391
# var outer: $P5
    getattribute $P5, self, 'outer'
.annotate 'line', 8392
    isa $I2, $P4, [ 'FunctionBase' ]
    unless $I2 goto __label_9
# {
.annotate 'line', 8393
    $P6 = $P4.'same_scope_as'($P5)
    if_null $P6, __label_10
    unless $P6 goto __label_10
# {
.annotate 'line', 8394
# lexname: $S3
    $P7 = $P3.'makelexical'($P1)
    null $S3
    if_null $P7, __label_11
    set $S3, $P7
 __label_11:
.annotate 'line', 8395
# flags: $I1
    $I2 = $P1.'getflags'()
    bor $I1, $I2, 2
.annotate 'line', 8396
    $P1 = self.'createvar'(__ARG_1, 'P', $I1)
.annotate 'line', 8397
    box $P6, $S3
    setattribute $P1, 'lexname', $P6
.annotate 'line', 8398
# reg: $S4
    $P6 = $P1.'getreg'()
    null $S4
    if_null $P6, __label_12
    set $S4, $P6
 __label_12:
.annotate 'line', 8399
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
.annotate 'line', 8404
    isnull $I2, $P1
    not $I2
    unless $I2 goto __label_14
    isa $I3, $P1, [ 'VarData' ]
    not $I2, $I3
 __label_14:
    unless $I2 goto __label_13
.annotate 'line', 8405
    'InternalError'('Incorrect data for variable in LocalFunction')
 __label_13: # endif
.annotate 'line', 8406
    .return($P1)
# }
.annotate 'line', 8407

.end # getvar

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'LocalFunctionStatement' ]
.annotate 'line', 8338
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
.annotate 'line', 8418
    self.'FunctionStatement'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 8419

.end # MethodStatement


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 8420
    .return(1)
# }

.end # ismethod

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MethodStatement' ]
.annotate 'line', 8414
    get_class $P1, [ 'FunctionStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'SigParameter' ]

.sub 'SigParameter' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8434
# var name: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8435
    $P4 = $P1.'isidentifier'()
    isfalse $I1, $P4
    unless $I1 goto __label_0
.annotate 'line', 8436
    'SyntaxError'("Identifier expected", $P1)
 __label_0: # endif
.annotate 'line', 8437
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 8438
    $P4 = $P2.'isidentifier'()
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 8439
# type: $S1
    $P6 = $P1.'checkkeyword'()
    $P5 = 'typetoregcheck'($P6)
    null $S1
    if_null $P5, __label_2
    set $S1, $P5
 __label_2:
.annotate 'line', 8440
    set $P1, $P2
.annotate 'line', 8441
    __ARG_2.'createvar'($P1, $S1)
.annotate 'line', 8442
    $P2 = __ARG_1.'get'()
# }
 __label_1: # endif
.annotate 'line', 8444
    setattribute self, 'name', $P1
.annotate 'line', 8445
# var data: $P3
    $P4 = $P1.'getidentifier'()
    $P3 = __ARG_2.'getvar'($P4)
.annotate 'line', 8446
    $P5 = $P3.'getreg'()
    setattribute self, 'reg', $P5
.annotate 'line', 8447
    $P4 = $P2.'isop'('[')
    if_null $P4, __label_3
    unless $P4 goto __label_3
.annotate 'line', 8448
    new $P7, [ 'ParameterModifierList' ]
    $P7.'ParameterModifierList'(__ARG_1, self)
    set $P6, $P7
    setattribute self, 'modifiers', $P6
    goto __label_4
 __label_3: # else
.annotate 'line', 8450
    __ARG_1.'unget'($P2)
 __label_4: # endif
# }
.annotate 'line', 8451

.end # SigParameter


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8454
    getattribute $P3, self, 'reg'
    __ARG_1.'print'($P3)
.annotate 'line', 8455
# var modifiers: $P1
    getattribute $P1, self, 'modifiers'
.annotate 'line', 8456
    if_null $P1, __label_0
# {
.annotate 'line', 8457
# var name: $P2
    getattribute $P2, self, 'name'
.annotate 'line', 8458
    $P1.'emitmodifiers'(__ARG_1, $P2, $P2)
# }
 __label_0: # endif
# }
.annotate 'line', 8460

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'SigParameter' ]
.annotate 'line', 8429
    addattribute $P0, 'name'
.annotate 'line', 8430
    addattribute $P0, 'modifiers'
.annotate 'line', 8431
    addattribute $P0, 'reg'
.end
.namespace [ 'SigParameterList' ]

.sub 'SigParameterList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8468
# var t: $P1
    null $P1
.annotate 'line', 8469
# var params: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
 __label_0: # do
.annotate 'line', 8470
# {
.annotate 'line', 8471
# var sigelem: $P3
    new $P3, [ 'SigParameter' ]
    $P3.'SigParameter'(__ARG_1, __ARG_2)
.annotate 'line', 8472
    $P2.'push'($P3)
.annotate 'line', 8473
    $P1 = __ARG_1.'get'()
# }
 __label_2: # continue
.annotate 'line', 8474
    $P4 = $P1.'isop'(',')
    if_null $P4, __label_1
    if $P4 goto __label_0
 __label_1: # enddo
.annotate 'line', 8475
    $P4 = $P1.'isop'(')')
    isfalse $I1, $P4
    unless $I1 goto __label_3
.annotate 'line', 8476
    'SyntaxError'("Expected ',' or ')'", $P1)
 __label_3: # endif
.annotate 'line', 8477
    setattribute self, 'params', $P2
# }
.annotate 'line', 8478

.end # SigParameterList


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8481
    __ARG_1.'print'('(')
.annotate 'line', 8482
# sep: $S1
    set $S1, ''
.annotate 'line', 8483
    getattribute $P2, self, 'params'
    iter $P3, $P2
    set $P3, 0
 __label_0: # for iteration
    unless $P3 goto __label_1
    shift $P1, $P3
# {
.annotate 'line', 8484
    __ARG_1.'print'($S1)
.annotate 'line', 8485
    $P1.'emit'(__ARG_1)
.annotate 'line', 8486
    set $S1, ', '
# }
    goto __label_0
 __label_1: # endfor
.annotate 'line', 8488
    __ARG_1.'print'(')')
# }
.annotate 'line', 8489

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'SigParameterList' ]
.annotate 'line', 8465
    addattribute $P0, 'params'
.end
.namespace [ 'MultiAssignStatement' ]

.sub 'MultiAssignStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8498
    setattribute self, 'params', __ARG_1
.annotate 'line', 8499
    setattribute self, 'expr', __ARG_2
# }
.annotate 'line', 8500

.end # MultiAssignStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8503
    getattribute $P3, self, 'expr'
    $P2 = $P3.'optimize'()
    setattribute self, 'expr', $P2
.annotate 'line', 8504
    .return(self)
# }
.annotate 'line', 8505

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8508
# var expr: $P1
    getattribute $P1, self, 'expr'
.annotate 'line', 8509
# var call: $P2
    $P2 = $P1.'emitcall'(__ARG_1)
.annotate 'line', 8510
    __ARG_1.'print'('    ')
.annotate 'line', 8511
    getattribute $P3, self, 'params'
    $P3.'emit'(__ARG_1)
.annotate 'line', 8512
    __ARG_1.'print'(' = ', $P2)
.annotate 'line', 8513
    getattribute $P3, self, 'expr'
    $P3.'emitargs'(__ARG_1)
.annotate 'line', 8514
    __ARG_1.'say'()
# }
.annotate 'line', 8515

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MultiAssignStatement' ]
.annotate 'line', 8494
    addattribute $P0, 'params'
.annotate 'line', 8495
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
.annotate 'line', 8532
    self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 8533

.end # ClassSpecifier


.sub 'reftype' :method
# Body
# {
.annotate 'line', 8534
    .return(0)
# }

.end # reftype


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8538
    getattribute $P1, self, 'start'
    __ARG_1.'annotate'($P1)
# }
.annotate 'line', 8539

.end # annotate

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassSpecifier' ]
.annotate 'line', 8528
    get_class $P1, [ 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'ClassSpecifierStr' ]

.sub 'ClassSpecifierStr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8547
    self.'ClassSpecifier'(__ARG_1, __ARG_2)
.annotate 'line', 8548
    setattribute self, 'name', __ARG_2
# }
.annotate 'line', 8549

.end # ClassSpecifierStr


.sub 'reftype' :method
# Body
# {
.annotate 'line', 8550
    .return(1)
# }

.end # reftype


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8554
# basestr: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_0
    set $S1, $P1
 __label_0:
.annotate 'line', 8555
    __ARG_1.'print'($S1)
# }
.annotate 'line', 8556

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassSpecifierStr' ]
.annotate 'line', 8542
    get_class $P1, [ 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 8544
    addattribute $P0, 'name'
.end
.namespace [ 'ClassSpecifierParrotKey' ]

.sub 'ClassSpecifierParrotKey' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8565
    self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 8566
# var key: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 8567
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 8568
    $P3 = $P2.'isstring'()
    isfalse $I1, $P3
    unless $I1 goto __label_0
.annotate 'line', 8569
    'Expected'('literal string', $P2)
 __label_0: # endif
.annotate 'line', 8570
    $P3 = $P2.'rawstring'()
# predefined push
    push $P1, $P3
.annotate 'line', 8571
    $P2 = __ARG_1.'get'()
.annotate 'line', 8572
    $P3 = $P2.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_1
# {
.annotate 'line', 8573
    $P4 = $P2.'checkop'()
    set $S1, $P4
    set $S2, ':'
    if $S1 == $S2 goto __label_4
    set $S2, ','
    if $S1 == $S2 goto __label_5
    goto __label_3
# switch
 __label_4: # case
.annotate 'line', 8575
    box $P5, 1
    setattribute self, 'hll', $P5
 __label_5: # case
    goto __label_2 # break
 __label_3: # default
.annotate 'line', 8579
    'SyntaxError'('Unexpected token in class key', $P2)
 __label_2: # switch end
 __label_6: # do
.annotate 'line', 8581
# {
.annotate 'line', 8582
    $P2 = __ARG_1.'get'()
.annotate 'line', 8583
    $P3 = $P2.'isstring'()
    isfalse $I1, $P3
    unless $I1 goto __label_9
.annotate 'line', 8584
    'Expected'('literal string', $P2)
 __label_9: # endif
.annotate 'line', 8585
    $P3 = $P2.'rawstring'()
# predefined push
    push $P1, $P3
# }
 __label_8: # continue
.annotate 'line', 8586
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'(',')
    if_null $P3, __label_7
    if $P3 goto __label_6
 __label_7: # enddo
.annotate 'line', 8587
    'RequireOp'(']', $P2)
# }
 __label_1: # endif
.annotate 'line', 8589
    setattribute self, 'key', $P1
# }
.annotate 'line', 8590

.end # ClassSpecifierParrotKey


.sub 'reftype' :method
# Body
# {
.annotate 'line', 8591
    .return(2)
# }

.end # reftype


.sub 'hasHLL' :method
# Body
# {
# predefined int
.annotate 'line', 8594
    getattribute $P1, self, 'hll'
    isnull $I1, $P1
    not $I1
    .return($I1)
# }
.annotate 'line', 8595

.end # hasHLL


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8599
    getattribute $P2, self, 'key'
    $P1 = 'getparrotkey'($P2)
    __ARG_1.'print'($P1)
# }
.annotate 'line', 8600

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassSpecifierParrotKey' ]
.annotate 'line', 8559
    get_class $P1, [ 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 8561
    addattribute $P0, 'key'
.annotate 'line', 8562
    addattribute $P0, 'hll'
.end
.namespace [ 'ClassSpecifierId' ]

.sub 'ClassSpecifierId' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8608
    self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 8609
# var key: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
# predefined string
    set $S1, __ARG_3
    box $P3, $S1
    push $P1, $P3
.annotate 'line', 8610
# var t: $P2
    null $P2
 __label_1: # while
.annotate 'line', 8611
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_0
    unless $P3 goto __label_0
# {
.annotate 'line', 8612
    $P2 = __ARG_1.'get'()
.annotate 'line', 8613
# predefined string
    set $S1, $P2
# predefined push
    push $P1, $S1
# }
    goto __label_1
 __label_0: # endwhile
.annotate 'line', 8615
    __ARG_1.'unget'($P2)
.annotate 'line', 8616
    setattribute self, 'key', $P1
# }
.annotate 'line', 8617

.end # ClassSpecifierId


.sub 'reftype' :method
# Body
# {
.annotate 'line', 8618
    .return(3)
# }

.end # reftype


.sub 'last' :method
# Body
# {
.annotate 'line', 8622
# var key: $P1
    getattribute $P1, self, 'key'
.annotate 'line', 8623
    $P2 = $P1[-1]
    .return($P2)
# }
.annotate 'line', 8624

.end # last


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8628
# var key: $P1
    getattribute $P2, self, 'key'
    $P1 = __ARG_2.'findclasskey'($P2)
.annotate 'line', 8629
    unless_null $P1, __label_0
# {
.annotate 'line', 8630
    $P2 = self.'dowarnings'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 8631
    getattribute $P3, self, 'key'
# predefined join
    join $S1, ".", $P3
    concat $S2, "class ", $S1
    concat $S2, $S2, " not found at compile time"
    'Warn'($S2)
 __label_2: # endif
.annotate 'line', 8632
    getattribute $P3, self, 'key'
    $P2 = 'getparrotkey'($P3)
    __ARG_1.'print'($P2)
# }
    goto __label_1
 __label_0: # else
.annotate 'line', 8634
    $P2 = $P1.'getclasskey'()
    __ARG_1.'print'($P2)
 __label_1: # endif
# }
.annotate 'line', 8635

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassSpecifierId' ]
.annotate 'line', 8603
    get_class $P1, [ 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 8605
    addattribute $P0, 'key'
.end
.namespace [ ]

.sub 'parseClassSpecifier'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8640
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8641
    $P2 = $P1.'isstring'()
    if_null $P2, __label_0
    unless $P2 goto __label_0
.annotate 'line', 8642
    new $P4, [ 'ClassSpecifierStr' ]
    $P4.'ClassSpecifierStr'(__ARG_2, $P1)
    set $P3, $P4
    .return($P3)
 __label_0: # endif
.annotate 'line', 8643
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 8644
    new $P4, [ 'ClassSpecifierParrotKey' ]
    $P4.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
 __label_1: # endif
.annotate 'line', 8645
    $P2 = $P1.'isidentifier'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 8646
    new $P4, [ 'ClassSpecifierId' ]
    $P4.'ClassSpecifierId'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
 __label_2: # endif
.annotate 'line', 8647
    'SyntaxError'('Invalid class', $P1)
# }
.annotate 'line', 8648

.end # parseClassSpecifier

.namespace [ 'ClassBase' ]

.sub 'ClassBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8660
    self.'initbase'(__ARG_1, __ARG_3)
.annotate 'line', 8661
    setattribute self, 'name', __ARG_2
.annotate 'line', 8662
# var classns: $P1
    $P2 = __ARG_3.'getpath'()
# predefined clone
    clone $P1, $P2
.annotate 'line', 8663
    getattribute $P2, self, 'name'
# predefined push
    push $P1, $P2
.annotate 'line', 8664
    setattribute self, 'classns', $P1
# }
.annotate 'line', 8665

.end # ClassBase


.sub 'getclasskey' :method
# Body
# {
.annotate 'line', 8668
    getattribute $P1, self, 'classns'
    .tailcall 'getparrotkey'($P1)
# }
.annotate 'line', 8669

.end # getclasskey

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassBase' ]
.annotate 'line', 8654
    get_class $P1, [ 'CommonBase' ]
    addparent $P0, $P1
.annotate 'line', 8656
    addattribute $P0, 'name'
.annotate 'line', 8657
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
.annotate 'line', 8682
    self.'ClassBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 8683
    setattribute self, 'parent', __ARG_3
.annotate 'line', 8684
# var functions: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 8685
    setattribute self, 'functions', $P1
.annotate 'line', 8686
# var members: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 8687
    setattribute self, 'members', $P2
.annotate 'line', 8688
    root_new $P11, ['parrot';'ResizablePMCArray']
    setattribute self, 'bases', $P11
.annotate 'line', 8689
# var constants: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 8690
    setattribute self, 'constants', $P3
.annotate 'line', 8692
# var t: $P4
    $P4 = __ARG_4.'get'()
.annotate 'line', 8693
    $P10 = $P4.'isop'(':')
    if_null $P10, __label_0
    unless $P10 goto __label_0
# {
.annotate 'line', 8694
# var bases: $P5
    getattribute $P5, self, 'bases'
 __label_2: # Infinite loop
.annotate 'line', 8695
# {
.annotate 'line', 8696
# var base: $P6
    $P6 = 'parseClassSpecifier'(__ARG_4, self)
.annotate 'line', 8697
# predefined push
    push $P5, $P6
.annotate 'line', 8698
    $P4 = __ARG_4.'get'()
.annotate 'line', 8699
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
.annotate 'line', 8702
    'RequireOp'('{', $P4)
# for loop
.annotate 'line', 8703
    $P4 = __ARG_4.'get'()
 __label_6: # for condition
    $P10 = $P4.'isop'('}')
    isfalse $I1, $P10
    unless $I1 goto __label_5
# {
.annotate 'line', 8704
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
.annotate 'line', 8706
# var f: $P7
    new $P7, [ 'MethodStatement' ]
    $P7.'MethodStatement'($P4, __ARG_4, self)
.annotate 'line', 8707
# predefined push
    push $P1, $P7
    goto __label_7 # break
 __label_10: # case
.annotate 'line', 8710
# var name: $P8
    $P8 = __ARG_4.'get'()
.annotate 'line', 8711
    $P12 = $P8.'isidentifier'()
    isfalse $I2, $P12
    unless $I2 goto __label_12
.annotate 'line', 8712
    'Expected'("member identifier", $P8)
 __label_12: # endif
.annotate 'line', 8713
# predefined push
    push $P2, $P8
.annotate 'line', 8714
    $P4 = __ARG_4.'get'()
.annotate 'line', 8715
    $P13 = $P4.'isop'(';')
    isfalse $I3, $P13
    unless $I3 goto __label_13
.annotate 'line', 8716
    'Expected'("';' in member declaration", $P4)
 __label_13: # endif
    goto __label_7 # break
 __label_11: # case
.annotate 'line', 8719
# var cst: $P9
    $P9 = 'parseConst'($P4, __ARG_4, self)
.annotate 'line', 8720
# predefined push
    push $P3, $P9
    goto __label_7 # break
 __label_8: # default
.annotate 'line', 8723
    'SyntaxError'("Unexpected item in class", $P4)
 __label_7: # switch end
# }
 __label_4: # for iteration
.annotate 'line', 8703
    $P4 = __ARG_4.'get'()
    goto __label_6
 __label_5: # for end
# }
.annotate 'line', 8726

.end # ClassStatement


.sub 'getpath' :method
# Body
# {
.annotate 'line', 8729
    getattribute $P1, self, 'classns'
    .return($P1)
# }
.annotate 'line', 8730

.end # getpath


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 8733
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 8734

.end # generatesubid


.sub 'findsymbol' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8737
    getattribute $P1, self, 'parent'
    .tailcall $P1.'findsymbol'(__ARG_1)
# }
.annotate 'line', 8738

.end # findsymbol


.sub 'findclasskey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8741
    getattribute $P1, self, 'parent'
    .tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 8742

.end # findclasskey


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8745
    getattribute $P1, self, 'parent'
    .tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 8746

.end # checkclass


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8749
    getattribute $P1, self, 'owner'
    .tailcall $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 8750

.end # use_predef


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8753
    getattribute $P1, self, 'constants'
    'optimize_array'($P1)
.annotate 'line', 8754
    getattribute $P1, self, 'functions'
    'optimize_array'($P1)
.annotate 'line', 8755
    .return(self)
# }
.annotate 'line', 8756

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8759
# var classns: $P1
    getattribute $P1, self, 'classns'
.annotate 'line', 8760
    $P5 = 'getparrotnamespacekey'($P1)
    __ARG_1.'say'($P5)
.annotate 'line', 8761
    getattribute $P5, self, 'functions'
    iter $P6, $P5
    set $P6, 0
 __label_0: # for iteration
    unless $P6 goto __label_1
    shift $P2, $P6
.annotate 'line', 8762
    $P2.'emit'(__ARG_1)
    goto __label_0
 __label_1: # endfor
.annotate 'line', 8764
    __ARG_1.'say'('.sub Winxed_class_init :anon :load :init')
.annotate 'line', 8766
    $P5 = self.'getclasskey'()
    __ARG_1.'say'('    ', 'newclass $P0, ', $P5)
.annotate 'line', 8767
# n: $I1
    set $I1, 1
.annotate 'line', 8768
    getattribute $P5, self, 'bases'
    iter $P7, $P5
    set $P7, 0
 __label_2: # for iteration
    unless $P7 goto __label_3
    shift $P3, $P7
# {
.annotate 'line', 8769
    $P3.'annotate'(__ARG_1)
.annotate 'line', 8770
# reg: $S1
    set $I2, $I1
    inc $I1
    set $S2, $I2
    concat $S1, "$P", $S2
.annotate 'line', 8771
    __ARG_1.'print'('    ', 'get_class ', $S1, ', ')
.annotate 'line', 8772
    getattribute $P5, self, 'parent'
    $P3.'emit'(__ARG_1, $P5)
.annotate 'line', 8773
    __ARG_1.'say'()
.annotate 'line', 8774
    __ARG_1.'say'('    ', 'addparent $P0, ', $S1)
# }
    goto __label_2
 __label_3: # endfor
.annotate 'line', 8776
    getattribute $P5, self, 'members'
    iter $P8, $P5
    set $P8, 0
 __label_4: # for iteration
    unless $P8 goto __label_5
    shift $P4, $P8
# {
.annotate 'line', 8777
    __ARG_1.'annotate'($P4)
.annotate 'line', 8778
    __ARG_1.'say'('    ', "addattribute $P0, '", $P4, "'")
# }
    goto __label_4
 __label_5: # endfor
.annotate 'line', 8781
    __ARG_1.'say'('.end')
# }
.annotate 'line', 8782

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassStatement' ]
.annotate 'line', 8672
    get_class $P1, [ 'ClassBase' ]
    addparent $P0, $P1
    get_class $P2, [ 'VarContainer' ]
    addparent $P0, $P2
.annotate 'line', 8674
    addattribute $P0, 'parent'
.annotate 'line', 8675
    addattribute $P0, 'bases'
.annotate 'line', 8676
    addattribute $P0, 'constants'
.annotate 'line', 8677
    addattribute $P0, 'functions'
.annotate 'line', 8678
    addattribute $P0, 'members'
.end
.namespace [ 'DeclareClassStatement' ]

.sub 'DeclareClassStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8789
    self.'ClassBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 8790
    setattribute self, 'name', __ARG_2
# }
.annotate 'line', 8791

.end # DeclareClassStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8794
    .return(self)
# }
.annotate 'line', 8795

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'DeclareClassStatement' ]
.annotate 'line', 8785
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
.annotate 'line', 8803
# var name: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8804
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 8805
    $I1 = $P2.'isop'(';')
    if $I1 goto __label_2
    $I1 = $P2.'isop'('.')
 __label_2:
    unless $I1 goto __label_0
# {
# for loop
 __label_5: # for condition
.annotate 'line', 8806
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_4
    unless $P3 goto __label_4
# {
.annotate 'line', 8807
# predefined string
    set $S1, $P1
    __ARG_3 = __ARG_3.'declarenamespace'($P1, $S1)
.annotate 'line', 8808
    $P1 = __ARG_2.'get'()
# }
 __label_3: # for iteration
.annotate 'line', 8806
    $P2 = __ARG_2.'get'()
    goto __label_5
 __label_4: # for end
.annotate 'line', 8810
    'RequireOp'(';', $P2)
.annotate 'line', 8811
    new $P4, [ 'DeclareClassStatement' ]
    $P4.'DeclareClassStatement'(__ARG_1, $P1, __ARG_3)
    set $P3, $P4
    __ARG_3.'declareclass'($P3)
# }
    goto __label_1
 __label_0: # else
# {
.annotate 'line', 8814
    __ARG_2.'unget'($P2)
.annotate 'line', 8815
    new $P4, [ 'ClassStatement' ]
    $P4.'ClassStatement'(__ARG_1, $P1, __ARG_3, __ARG_2)
    set $P3, $P4
    __ARG_3.'addclass'($P3)
# }
 __label_1: # endif
# }
.annotate 'line', 8817

.end # parseClass


.sub 'include_parrot'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8825
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8826
    $P6 = $P1.'isstring'()
    isfalse $I4, $P6
    unless $I4 goto __label_0
.annotate 'line', 8827
    'Expected'('literal string', $P1)
 __label_0: # endif
.annotate 'line', 8828
    'ExpectOp'(';', __ARG_2)
.annotate 'line', 8829
# filename: $S1
    $P6 = $P1.'rawstring'()
    null $S1
    if_null $P6, __label_1
    set $S1, $P6
 __label_1:
.annotate 'line', 8830
# var interp: $P2
# predefined getinterp
    getinterp $P2
# Constant IGLOBALS_LIB_PATHS evaluated at compile time
# Constant PARROT_LIB_PATH_INCLUDE evaluated at compile time
.annotate 'line', 8835
# var libpaths: $P3
    $P3 = $P2[9]
.annotate 'line', 8836
# var paths: $P4
    $P4 = $P3[0]
.annotate 'line', 8837
# var file: $P5
    new $P5, [ 'FileHandle' ]
.annotate 'line', 8838
    iter $P7, $P4
    set $P7, 0
 __label_2: # for iteration
    unless $P7 goto __label_3
    shift $S2, $P7
# {
.annotate 'line', 8839
# filepath: $S3
    concat $S3, $S2, $S1
.annotate 'line', 8840
# try: create handler
    new $P6, 'ExceptionHandler'
    set_label $P6, __label_4
    push_eh $P6
# try: begin
# {
.annotate 'line', 8841
    $P5.'open'($S3, 'r')
    goto __label_3 # break
.annotate 'line', 8842
# }
# try: end
    pop_eh
    goto __label_5
.annotate 'line', 8840
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
.annotate 'line', 8847
    $P6 = $P5.'is_closed'()
    if_null $P6, __label_6
    unless $P6 goto __label_6
.annotate 'line', 8848
    'SyntaxError'('File not found', $P1)
 __label_6: # endif
# Constant MACRO_CONST evaluated at compile time
# for loop
.annotate 'line', 8853
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
.annotate 'line', 8854
# predefined substr
    substr $S8, $S4, 0, 12
    ne $S8, '.macro_const', __label_11
# {
.annotate 'line', 8855
# pos: $I1
    set $I1, 12
.annotate 'line', 8856
# c: $S5
    null $S5
 __label_13: # while
.annotate 'line', 8857
# predefined substr
    substr $S5, $S4, $I1, 1
    iseq $I4, $S5, " "
    if $I4 goto __label_14
    iseq $I4, $S5, "\t"
 __label_14:
    unless $I4 goto __label_12
.annotate 'line', 8858
    inc $I1
    goto __label_13
 __label_12: # endwhile
.annotate 'line', 8859
# pos2: $I2
    set $I2, $I1
 __label_16: # while
.annotate 'line', 8860
# predefined substr
    substr $S5, $S4, $I2, 1
    isne $I4, $S5, " "
    unless $I4 goto __label_20
    isne $I4, $S5, "\t"
 __label_20:
    unless $I4 goto __label_19
.annotate 'line', 8861
    isne $I4, $S5, "\n"
 __label_19:
    unless $I4 goto __label_18
    isne $I4, $S5, "\r"
 __label_18:
    unless $I4 goto __label_17
    isne $I4, $S5, ""
 __label_17:
    unless $I4 goto __label_15
.annotate 'line', 8862
    inc $I2
    goto __label_16
 __label_15: # endwhile
.annotate 'line', 8863
    ne $I2, $I1, __label_21
    goto __label_7 # continue
 __label_21: # endif
.annotate 'line', 8865
# name: $S6
    sub $I4, $I2, $I1
# predefined substr
    substr $S6, $S4, $I1, $I4
 __label_23: # while
.annotate 'line', 8866
# predefined substr
    substr $S5, $S4, $I2, 1
    iseq $I4, $S5, " "
    if $I4 goto __label_24
    iseq $I4, $S5, "\t"
 __label_24:
    unless $I4 goto __label_22
.annotate 'line', 8867
    inc $I2
    goto __label_23
 __label_22: # endwhile
.annotate 'line', 8868
    set $I1, $I2
 __label_26: # while
.annotate 'line', 8869
# predefined substr
    substr $S5, $S4, $I2, 1
    isne $I4, $S5, " "
    unless $I4 goto __label_30
    isne $I4, $S5, "\t"
 __label_30:
    unless $I4 goto __label_29
.annotate 'line', 8870
    isne $I4, $S5, "\n"
 __label_29:
    unless $I4 goto __label_28
    isne $I4, $S5, "\r"
 __label_28:
    unless $I4 goto __label_27
    isne $I4, $S5, ""
 __label_27:
    unless $I4 goto __label_25
.annotate 'line', 8871
    inc $I2
    goto __label_26
 __label_25: # endwhile
.annotate 'line', 8872
    ne $I2, $I1, __label_31
    goto __label_7 # continue
 __label_31: # endif
.annotate 'line', 8874
# value: $S7
    sub $I4, $I2, $I1
# predefined substr
    substr $S7, $S4, $I1, $I4
.annotate 'line', 8876
# ivalue: $I3
    null $I3
.annotate 'line', 8877
# predefined substr
    substr $S8, $S7, 0, 2
    iseq $I4, $S8, '0x'
    if $I4 goto __label_34
# predefined substr
    substr $S9, $S7, 0, 2
    iseq $I4, $S9, '0X'
 __label_34:
    unless $I4 goto __label_32
.annotate 'line', 8878
# predefined substr
    substr $S10, $S7, 2
    box $P8, $S10
    $P6 = $P8.'to_int'(16)
    set $I3, $P6
    goto __label_33
 __label_32: # else
.annotate 'line', 8880
    set $I3, $S7
 __label_33: # endif
.annotate 'line', 8883
    new $P9, [ 'TokenInteger' ]
    getattribute $P10, __ARG_1, 'file'
    getattribute $P11, __ARG_1, 'line'
    $P9.'TokenInteger'($P10, $P11, $S6)
    set $P8, $P9
.annotate 'line', 8882
    $P6 = 'integerValue'(__ARG_3, $P8, $I3)
.annotate 'line', 8881
    __ARG_3.'createconst'($S6, 'I', $P6, '', 4)
# }
 __label_11: # endif
# }
 __label_7: # for iteration
.annotate 'line', 8853
    $P6 = $P5.'readline'()
    set $S4, $P6
    goto __label_9
 __label_8: # for end
.annotate 'line', 8888
    $P5.'close'()
# }
.annotate 'line', 8889

.end # include_parrot

.namespace [ 'NamespaceBase' ]

.sub 'NamespaceBase' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8904
    setattribute self, 'nspath', __ARG_1
.annotate 'line', 8905
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'namespaces', $P2
.annotate 'line', 8906
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'classes', $P2
.annotate 'line', 8907
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'functions', $P2
.annotate 'line', 8908
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'items', $P2
# }
.annotate 'line', 8909

.end # NamespaceBase


.sub 'getpath' :method
# Body
# {
.annotate 'line', 8912
    getattribute $P1, self, 'nspath'
    .return($P1)
# }
.annotate 'line', 8913

.end # getpath


.sub 'checkclass_base' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8916
# var classes: $P1
    getattribute $P1, self, 'classes'
.annotate 'line', 8917
    iter $P3, $P1
    set $P3, 0
 __label_0: # for iteration
    unless $P3 goto __label_1
    shift $P2, $P3
.annotate 'line', 8918
    getattribute $P4, $P2, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_2
.annotate 'line', 8919
    .return($P2)
 __label_2: # endif
    goto __label_0
 __label_1: # endfor
    null $P4
.annotate 'line', 8920
    .return($P4)
# }
.annotate 'line', 8921

.end # checkclass_base


.sub 'findclasskey_base' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8926
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
.annotate 'line', 8928
    .return($P5)
 __label_3: # case
.annotate 'line', 8931
    $P6 = __ARG_1[0]
    .tailcall self.'checkclass_base'($P6)
 __label_1: # default
.annotate 'line', 8936
# var namespaces: $P1
    getattribute $P1, self, 'namespaces'
.annotate 'line', 8937
# var childkey: $P2
# predefined clone
    clone $P2, __ARG_1
.annotate 'line', 8938
# basename: $S1
    $P7 = $P2.'shift'()
    null $S1
    if_null $P7, __label_4
    set $S1, $P7
 __label_4:
.annotate 'line', 8939
    iter $P8, $P1
    set $P8, 0
 __label_5: # for iteration
    unless $P8 goto __label_6
    shift $P3, $P8
# {
.annotate 'line', 8940
    getattribute $P9, $P3, 'name'
    set $S2, $P9
    ne $S2, $S1, __label_7
# {
.annotate 'line', 8941
# var found: $P4
    $P4 = $P3.'findclasskey'($P2)
.annotate 'line', 8942
    if_null $P4, __label_8
.annotate 'line', 8943
    .return($P4)
 __label_8: # endif
# }
 __label_7: # endif
# }
    goto __label_5
 __label_6: # endfor
 __label_0: # switch end
    null $P5
.annotate 'line', 8947
    .return($P5)
# }
.annotate 'line', 8948

.end # findclasskey_base


.sub 'findsymbol' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8953
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
.annotate 'line', 8955
    .return($P7)
 __label_3: # case
.annotate 'line', 8957
# name: $S1
    $S1 = __ARG_1[0]
.annotate 'line', 8959
# var sym: $P1
    $P1 = self.'checkclass_base'($S1)
.annotate 'line', 8960
    if_null $P1, __label_4
.annotate 'line', 8961
    .return($P1)
 __label_4: # endif
.annotate 'line', 8962
    getattribute $P8, self, 'functions'
    iter $P9, $P8
    set $P9, 0
 __label_5: # for iteration
    unless $P9 goto __label_6
    shift $P2, $P9
.annotate 'line', 8963
    getattribute $P10, $P2, 'name'
    set $S3, $P10
    ne $S3, $S1, __label_7
.annotate 'line', 8964
    .return($P2)
 __label_7: # endif
    goto __label_5
 __label_6: # endfor
    null $P11
.annotate 'line', 8965
    .return($P11)
 __label_1: # default
.annotate 'line', 8970
# var namespaces: $P3
    getattribute $P3, self, 'namespaces'
.annotate 'line', 8971
# var childkey: $P4
# predefined clone
    clone $P4, __ARG_1
.annotate 'line', 8972
# basename: $S2
    $P12 = $P4.'shift'()
    null $S2
    if_null $P12, __label_8
    set $S2, $P12
 __label_8:
.annotate 'line', 8973
    iter $P13, $P3
    set $P13, 0
 __label_9: # for iteration
    unless $P13 goto __label_10
    shift $P5, $P13
# {
.annotate 'line', 8974
    getattribute $P14, $P5, 'name'
    set $S4, $P14
    ne $S4, $S2, __label_11
# {
.annotate 'line', 8975
# var found: $P6
    $P6 = $P5.'findsymbol'($P4)
.annotate 'line', 8976
    if_null $P6, __label_12
.annotate 'line', 8977
    .return($P6)
 __label_12: # endif
# }
 __label_11: # endif
# }
    goto __label_9
 __label_10: # endfor
 __label_0: # switch end
    null $P7
.annotate 'line', 8981
    .return($P7)
# }
.annotate 'line', 8982

.end # findsymbol


.sub 'declarenamespace' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 8985
# var mnull: $P1
    null $P1
.annotate 'line', 8986
# var child: $P2
    new $P2, [ 'NamespaceStatement' ]
    $P2.'NamespaceStatement'(self, __ARG_1, __ARG_2, $P1)
.annotate 'line', 8987
    getattribute $P3, self, 'namespaces'
# predefined push
    push $P3, $P2
.annotate 'line', 8988
    .return($P2)
# }
.annotate 'line', 8989

.end # declarenamespace


.sub 'childnamespace' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8992
# var child: $P1
    new $P1, [ 'NamespaceStatement' ]
    $P1.'NamespaceStatement'(self, __ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 8993
    getattribute $P2, self, 'namespaces'
# predefined push
    push $P2, $P1
.annotate 'line', 8994
    getattribute $P2, self, 'items'
# predefined push
    push $P2, $P1
.annotate 'line', 8995
    .return($P1)
# }
.annotate 'line', 8996

.end # childnamespace


.sub 'declareclass' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8999
    getattribute $P1, self, 'classes'
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 9000

.end # declareclass


.sub 'addclass' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9003
    getattribute $P1, self, 'classes'
# predefined push
    push $P1, __ARG_1
.annotate 'line', 9004
    getattribute $P1, self, 'items'
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 9005

.end # addclass


.sub 'parsenamespace' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9008
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9009
# name: $S1
    set $P4, $P1
    null $S1
    if_null $P4, __label_0
    set $S1, $P4
 __label_0:
.annotate 'line', 9010
    $P1 = __ARG_2.'get'()
.annotate 'line', 9012
# var modifier: $P2
    null $P2
.annotate 'line', 9013
    $P4 = $P1.'isop'('[')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 9014
    new $P5, [ 'ModifierList' ]
    $P5.'ModifierList'(__ARG_2, self)
    set $P2, $P5
.annotate 'line', 9015
    $P1 = __ARG_2.'get'()
# }
 __label_1: # endif
.annotate 'line', 9018
    'RequireOp'('{', $P1)
.annotate 'line', 9019
# var child: $P3
    $P3 = self.'childnamespace'(__ARG_1, $S1, $P2)
.annotate 'line', 9020
    $P3.'parse'(__ARG_2)
# }
.annotate 'line', 9021

.end # parsenamespace


.sub 'parse' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9024
# var items: $P1
    getattribute $P1, self, 'items'
.annotate 'line', 9025
# var functions: $P2
    getattribute $P2, self, 'functions'
.annotate 'line', 9026
# var classes: $P3
    getattribute $P3, self, 'classes'
.annotate 'line', 9027
# var t: $P4
    null $P4
# for loop
.annotate 'line', 9028
    $P4 = __ARG_1.'get'()
 __label_2: # for condition
    set $I1, $P4
    unless $I1 goto __label_3
    $P7 = $P4.'isop'('}')
    isfalse $I1, $P7
 __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 9030
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
.annotate 'line', 9032
    self.'parsenamespace'($P4, __ARG_1)
    goto __label_4 # break
 __label_7: # case
.annotate 'line', 9035
# var cst: $P5
    $P5 = 'parseConst'($P4, __ARG_1, self)
.annotate 'line', 9036
# predefined push
    push $P1, $P5
    goto __label_4 # break
 __label_8: # case
.annotate 'line', 9039
# var f: $P6
    new $P6, [ 'FunctionStatement' ]
    $P6.'FunctionStatement'($P4, __ARG_1, self)
.annotate 'line', 9040
# predefined push
    push $P2, $P6
.annotate 'line', 9041
# predefined push
    push $P1, $P6
    goto __label_4 # break
 __label_9: # case
.annotate 'line', 9044
    'parseClass'($P4, __ARG_1, self)
    goto __label_4 # break
 __label_10: # case
.annotate 'line', 9047
    $P4 = __ARG_1.'get'()
.annotate 'line', 9048
    $P9 = $P4.'iskeyword'('extern')
    isfalse $I2, $P9
    unless $I2 goto __label_14
.annotate 'line', 9049
    'SyntaxError'('Unsupported at namespace level', $P4)
 __label_14: # endif
.annotate 'line', 9050
    $P4 = __ARG_1.'get'()
.annotate 'line', 9051
    $P10 = $P4.'isstring'()
    isfalse $I3, $P10
    unless $I3 goto __label_15
.annotate 'line', 9052
    'Expected'('string literal', $P4)
 __label_15: # endif
.annotate 'line', 9053
# reqlib: $S1
    set $P11, $P4
    null $S1
    if_null $P11, __label_16
    set $S1, $P11
 __label_16:
.annotate 'line', 9054
    self.'addlib'($S1)
.annotate 'line', 9055
    'ExpectOp'(';', __ARG_1)
    goto __label_4 # break
 __label_11: # case
.annotate 'line', 9058
    'include_parrot'($P4, __ARG_1, self)
    goto __label_4 # break
 __label_12: # case
.annotate 'line', 9061
    $P4 = __ARG_1.'get'()
.annotate 'line', 9062
    $P12 = $P4.'isstring'()
    isfalse $I4, $P12
    unless $I4 goto __label_17
.annotate 'line', 9063
    'Expected'('string literal', $P4)
 __label_17: # endif
.annotate 'line', 9064
    'ExpectOp'(';', __ARG_1)
.annotate 'line', 9065
    new $P15, [ 'StringLiteral' ]
    $P15.'StringLiteral'(self, $P4)
    set $P14, $P15
    $P13 = $P14.'getPirString'()
    self.'addload'($P13)
    goto __label_4 # break
 __label_13: # case
.annotate 'line', 9068
    $P4 = __ARG_1.'get'()
.annotate 'line', 9069
    $P16 = $P4.'isstring'()
    isfalse $I5, $P16
    unless $I5 goto __label_18
.annotate 'line', 9070
    'Expected'('string literal', $P4)
 __label_18: # endif
.annotate 'line', 9071
    'ExpectOp'(';', __ARG_1)
.annotate 'line', 9072
    new $P19, [ 'StringLiteral' ]
    $P19.'StringLiteral'(self, $P4)
    set $P18, $P19
    $P17 = $P18.'getPirString'()
    self.'addlib'($P17)
    goto __label_4 # break
 __label_5: # default
.annotate 'line', 9075
    'SyntaxError'("Unexpected token", $P4)
 __label_4: # switch end
# }
 __label_0: # for iteration
.annotate 'line', 9028
    $P4 = __ARG_1.'get'()
    goto __label_2
 __label_1: # for end
.annotate 'line', 9078
    if_null $P4, __label_19
    unless $P4 goto __label_19
.annotate 'line', 9079
    self.'close_ns'($P4)
    goto __label_20
 __label_19: # else
.annotate 'line', 9081
    self.'unclosed_ns'()
 __label_20: # endif
# }
.annotate 'line', 9082

.end # parse


.sub 'optimize_base' :method
# Body
# {
.annotate 'line', 9085
    getattribute $P1, self, 'items'
    'optimize_array'($P1)
# }
.annotate 'line', 9086

.end # optimize_base


.sub 'emit_base' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9089
# var path: $P1
    $P1 = self.'getpath'()
.annotate 'line', 9090
# s: $S1
    $P3 = 'getparrotnamespacekey'($P1)
    null $S1
    if_null $P3, __label_0
    set $S1, $P3
 __label_0:
.annotate 'line', 9092
# activate: $I1
    set $I1, 1
.annotate 'line', 9093
    getattribute $P3, self, 'items'
    iter $P4, $P3
    set $P4, 0
 __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
# {
.annotate 'line', 9094
    isa $I2, $P2, [ 'NamespaceStatement' ]
    if $I2 goto __label_5
.annotate 'line', 9095
    isa $I2, $P2, [ 'ClassStatement' ]
 __label_5:
    unless $I2 goto __label_3
.annotate 'line', 9096
    set $I1, 1
    goto __label_4
 __label_3: # else
.annotate 'line', 9098
    unless $I1 goto __label_6
# {
.annotate 'line', 9099
    __ARG_1.'say'($S1)
.annotate 'line', 9100
    null $I1
# }
 __label_6: # endif
 __label_4: # endif
.annotate 'line', 9102
    $P2.'emit'(__ARG_1)
# }
    goto __label_1
 __label_2: # endfor
# }
.annotate 'line', 9104

.end # emit_base

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NamespaceBase' ]
.annotate 'line', 8893
    get_class $P1, [ 'VarContainer' ]
    addparent $P0, $P1
.annotate 'line', 8895
    addattribute $P0, 'nspath'
.annotate 'line', 8896
    addattribute $P0, 'namespaces'
.annotate 'line', 8897
    addattribute $P0, 'classes'
.annotate 'line', 8898
    addattribute $P0, 'functions'
.annotate 'line', 8899
    addattribute $P0, 'items'
.annotate 'line', 8900
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
.annotate 'line', 9122
# var nspath: $P1
    $P2 = __ARG_1.'getpath'()
# predefined clone
    clone $P1, $P2
.annotate 'line', 9123
# predefined push
    push $P1, __ARG_3
.annotate 'line', 9124
    self.'NamespaceBase'($P1)
.annotate 'line', 9126
    setattribute self, 'parent', __ARG_1
.annotate 'line', 9127
    setattribute self, 'start', __ARG_2
.annotate 'line', 9128
    setattribute self, 'owner', __ARG_1
.annotate 'line', 9129
    box $P2, __ARG_3
    setattribute self, 'name', $P2
.annotate 'line', 9130
    setattribute self, 'modifier', __ARG_4
.annotate 'line', 9131
    if_null __ARG_4, __label_0
# {
.annotate 'line', 9132
    $P2 = __ARG_4.'pick'('HLL')
    if_null $P2, __label_1
.annotate 'line', 9133
    getattribute $P4, self, 'name'
    setattribute self, 'hll', $P4
 __label_1: # endif
# }
 __label_0: # endif
# }
.annotate 'line', 9135

.end # NamespaceStatement


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 9138
    getattribute $P1, self, 'parent'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 9139

.end # dowarnings


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 9142
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 9143

.end # generatesubid


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9146
    getattribute $P1, self, 'owner'
    $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 9147

.end # use_predef


.sub 'addlib' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9150
    getattribute $P1, self, 'parent'
    $P1.'addlib'(__ARG_1)
# }
.annotate 'line', 9151

.end # addlib


.sub 'addlib' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9154
    getattribute $P1, self, 'parent'
    $P1.'addload'(__ARG_1)
# }
.annotate 'line', 9155

.end # addlib


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9158
# var cl: $P1
    $P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 9159
    unless_null $P1, __label_0
.annotate 'line', 9160
    getattribute $P2, self, 'parent'
    .tailcall $P2.'checkclass'(__ARG_1)
    goto __label_1
 __label_0: # else
.annotate 'line', 9162
    .return($P1)
 __label_1: # endif
# }
.annotate 'line', 9163

.end # checkclass


.sub 'findclasskey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9168
# var cl: $P1
    $P1 = self.'findclasskey_base'(__ARG_1)
.annotate 'line', 9169
    unless_null $P1, __label_0
.annotate 'line', 9170
    getattribute $P2, self, 'parent'
    $P1 = $P2.'findclasskey'(__ARG_1)
 __label_0: # endif
.annotate 'line', 9171
    .return($P1)
# }
.annotate 'line', 9172

.end # findclasskey


.sub 'unclosed_ns' :method
# Body
# {
.annotate 'line', 9175
    getattribute $P1, self, 'start'
    'SyntaxError'('unclosed namespace', $P1)
# }
.annotate 'line', 9176

.end # unclosed_ns


.sub 'close_ns' :method
        .param pmc __ARG_1
# Empty body

.end # close_ns


.sub 'optimize' :method
# Body
# {
.annotate 'line', 9183
# var modifier: $P1
    getattribute $P1, self, 'modifier'
.annotate 'line', 9184
    if_null $P1, __label_0
# {
.annotate 'line', 9185
    $P1 = $P1.'optimize'()
.annotate 'line', 9186
    setattribute self, 'modifier', $P1
# }
 __label_0: # endif
.annotate 'line', 9188
    self.'optimize_base'()
.annotate 'line', 9189
    .return(self)
# }
.annotate 'line', 9190

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9193
# var hll: $P1
    getattribute $P1, self, 'hll'
.annotate 'line', 9194
    if_null $P1, __label_0
.annotate 'line', 9195
    __ARG_1.'say'(".HLL '", $P1, "'")
 __label_0: # endif
.annotate 'line', 9197
    self.'emit_base'(__ARG_1)
.annotate 'line', 9199
    if_null $P1, __label_1
.annotate 'line', 9200
    __ARG_1.'say'(".HLL 'parrot'")
 __label_1: # endif
# }
.annotate 'line', 9201

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NamespaceStatement' ]
.annotate 'line', 9111
    get_class $P1, [ 'NamespaceBase' ]
    addparent $P0, $P1
.annotate 'line', 9113
    addattribute $P0, 'parent'
.annotate 'line', 9114
    addattribute $P0, 'start'
.annotate 'line', 9115
    addattribute $P0, 'name'
.annotate 'line', 9116
    addattribute $P0, 'modifier'
.annotate 'line', 9117
    addattribute $P0, 'hll'
.end
.namespace [ 'RootNamespace' ]

.sub 'RootNamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9218
    new $P1, ['ResizableStringArray']
.annotate 'line', 9219
    self.'NamespaceBase'($P1)
.annotate 'line', 9220
    setattribute self, 'unit', __ARG_1
.annotate 'line', 9221
    root_new $P3, ['parrot';'Hash']
    setattribute self, 'predefs_used', $P3
.annotate 'line', 9222
    box $P2, 0
    setattribute self, 'subidgen', $P2
# }
.annotate 'line', 9223

.end # RootNamespace


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9226
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 9227
    $P1[__ARG_1] = 1
# }
.annotate 'line', 9228

.end # use_predef


.sub 'predef_is_used' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9231
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 9232
    $P2 = $P1[__ARG_1]
    unless_null $P2, __label_1
    null $I1
    goto __label_0
 __label_1:
    set $I1, 1
 __label_0:
    .return($I1)
# }
.annotate 'line', 9233

.end # predef_is_used


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 9237
# var subidgen: $P1
    getattribute $P1, self, 'subidgen'
.annotate 'line', 9238
# idgen: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 9239
    inc $I1
.annotate 'line', 9240
    assign $P1, $I1
.annotate 'line', 9241
# id: $S1
# predefined string
    set $S2, $I1
    concat $S1, 'WSubId_', $S2
.annotate 'line', 9242
    .return($S1)
# }
.annotate 'line', 9243

.end # generatesubid


.sub 'addlib' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9247
# var libs: $P1
    getattribute $P1, self, 'libs'
.annotate 'line', 9248
    unless_null $P1, __label_0
# {
.annotate 'line', 9249
    root_new $P1, ['parrot';'Hash']
.annotate 'line', 9250
    setattribute self, 'libs', $P1
# }
 __label_0: # endif
.annotate 'line', 9252
    $P1[__ARG_1] = 1
# }
.annotate 'line', 9253

.end # addlib


.sub 'addload' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9256
# var loads: $P1
    getattribute $P1, self, 'loads'
.annotate 'line', 9257
    unless_null $P1, __label_0
# {
.annotate 'line', 9258
    root_new $P1, ['parrot';'Hash']
.annotate 'line', 9259
    setattribute self, 'loads', $P1
# }
 __label_0: # endif
.annotate 'line', 9261
    $P1[__ARG_1] = 1
# }
.annotate 'line', 9262

.end # addload


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9265
    .tailcall self.'checkclass_base'(__ARG_1)
# }
.annotate 'line', 9266

.end # checkclass


.sub 'findclasskey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9270
    .tailcall self.'findclasskey_base'(__ARG_1)
# }
.annotate 'line', 9271

.end # findclasskey


.sub 'unclosed_ns' :method
# Empty body

.end # unclosed_ns


.sub 'close_ns' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9278
    'SyntaxError'('Cannot close root namespace', __ARG_1)
# }
.annotate 'line', 9279

.end # close_ns


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 9282
    getattribute $P1, self, 'unit'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 9283

.end # dowarnings


.sub 'optimize' :method
# Body
# {
.annotate 'line', 9286
    self.'optimize_base'()
.annotate 'line', 9287
    .return(self)
# }
.annotate 'line', 9288

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9291
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 9294
    $P5 = $P1['chomp']
    if_null $P5, __label_0
.annotate 'line', 9295
    self.'addload'('"String/Utils.pbc"')
 __label_0: # endif
.annotate 'line', 9298
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
.annotate 'line', 9301
    iter $P6, $P2
    set $P6, 0
 __label_1: # for iteration
    unless $P6 goto __label_2
    shift $S1, $P6
.annotate 'line', 9302
    $P5 = $P1[$S1]
    if_null $P5, __label_3
# {
.annotate 'line', 9303
    self.'addlib'("'trans_ops'")
    goto __label_2 # break
.annotate 'line', 9304
# }
 __label_3: # endif
    goto __label_1
 __label_2: # endfor
.annotate 'line', 9307
# somelib: $I1
    null $I1
.annotate 'line', 9308
# var libs: $P3
    getattribute $P3, self, 'libs'
.annotate 'line', 9309
    if_null $P3, __label_4
# {
.annotate 'line', 9310
    set $I1, 1
.annotate 'line', 9311
    iter $P7, $P3
    set $P7, 0
 __label_5: # for iteration
    unless $P7 goto __label_6
    shift $S2, $P7
.annotate 'line', 9312
    __ARG_1.'say'('.loadlib ', $S2)
    goto __label_5
 __label_6: # endfor
# }
 __label_4: # endif
.annotate 'line', 9315
# someload: $I2
    null $I2
.annotate 'line', 9316
# var loads: $P4
    getattribute $P4, self, 'loads'
.annotate 'line', 9317
    if_null $P4, __label_7
# {
.annotate 'line', 9318
    set $I2, 1
.annotate 'line', 9319
    __ARG_1.'print'("\n.sub initial_load_bytecode :anon :load :init\n")
.annotate 'line', 9320
    iter $P8, $P4
    set $P8, 0
 __label_8: # for iteration
    unless $P8 goto __label_9
    shift $S3, $P8
.annotate 'line', 9321
    __ARG_1.'say'('    load_bytecode ', $S3)
    goto __label_8
 __label_9: # endfor
.annotate 'line', 9322
    __ARG_1.'print'(".end\n\n")
# }
 __label_7: # endif
.annotate 'line', 9324
    or $I3, $I1, $I2
    unless $I3 goto __label_10
.annotate 'line', 9325
    __ARG_1.'comment'('end libs')
 __label_10: # endif
.annotate 'line', 9327
    self.'emit_base'(__ARG_1)
# }
.annotate 'line', 9328

.end # emit


.sub 'emitinclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9331
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 9332
    iter $P4, $P1
    set $P4, 0
 __label_0: # for iteration
    unless $P4 goto __label_1
    shift $S1, $P4
# {
.annotate 'line', 9333
# var data: $P2
    $P2 = $P1[$S1]
.annotate 'line', 9334
    isa $I2, $P2, [ 'VarData' ]
    not $I1, $I2
    if $I1 goto __label_4
.annotate 'line', 9335
    $P5 = $P2.'gettype'()
    set $S2, $P5
    isne $I1, $S2, 'I'
 __label_4:
    if $I1 goto __label_3
.annotate 'line', 9336
    $I3 = $P2.'getflags'()
    band $I1, $I3, 4
 __label_3:
    unless $I1 goto __label_2
    goto __label_0 # continue
 __label_2: # endif
.annotate 'line', 9338
# var value: $P3
    $P3 = $P2.'getvalue'()
.annotate 'line', 9339
    $P5 = $P3.'getIntegerValue'()
    __ARG_1.'say'('.macro_const ', $S1, ' ', $P5)
# }
    goto __label_0
 __label_1: # endfor
# }
.annotate 'line', 9341

.end # emitinclude

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'RootNamespace' ]
.annotate 'line', 9208
    get_class $P1, [ 'NamespaceBase' ]
    addparent $P0, $P1
.annotate 'line', 9210
    addattribute $P0, 'unit'
.annotate 'line', 9211
    addattribute $P0, 'predefs_used'
.annotate 'line', 9212
    addattribute $P0, 'libs'
.annotate 'line', 9213
    addattribute $P0, 'loads'
.annotate 'line', 9214
    addattribute $P0, 'subidgen'
.end
.namespace [ ]
# Constant EVAL_NAME evaluated at compile time
.namespace [ 'WinxedCompileUnit' ]

.sub 'init' :method :vtable
# Body
# {
.annotate 'line', 9357
    box $P3, 1
    setattribute self, 'warnings', $P3
.annotate 'line', 9358
# var rootns: $P1
    new $P1, [ 'RootNamespace' ]
    $P1.'RootNamespace'(self)
.annotate 'line', 9361
# var taux: $P2
    new $P2, [ 'TokenIdentifier' ]
    $P2.'TokenIdentifier'('__predefconst__', 0, 'predefconst')
.annotate 'line', 9365
    new $P5, [ 'TokenInteger' ]
    getattribute $P6, $P2, 'file'
    getattribute $P7, $P2, 'line'
    $P5.'TokenInteger'($P6, $P7, 'false')
    set $P4, $P5
.annotate 'line', 9364
    $P3 = 'integerValue'($P1, $P4, 0)
.annotate 'line', 9363
    $P1.'createconst'('false', 'I', $P3, '', 4)
.annotate 'line', 9369
    new $P5, [ 'TokenInteger' ]
    getattribute $P6, $P2, 'file'
    getattribute $P7, $P2, 'line'
    $P5.'TokenInteger'($P6, $P7, 'false')
    set $P4, $P5
.annotate 'line', 9368
    $P3 = 'integerValue'($P1, $P4, 1)
.annotate 'line', 9367
    $P1.'createconst'('true', 'I', $P3, '', 4)
.annotate 'line', 9375
    new $P4, [ 'StringLiteral' ]
.annotate 'line', 9376
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
.annotate 'line', 9374
    $P1.'createconst'('__STAGE__', 'S', $P3, '', 4)
.annotate 'line', 9379
    setattribute self, 'rootns', $P1
# }
.annotate 'line', 9380

.end # init


.sub 'setwarnmode' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 9383
    getattribute $P1, self, 'warnings'
    assign $P1, __ARG_1
# }
.annotate 'line', 9384

.end # setwarnmode


.sub 'dowarnings' :method
# Body
# {
# predefined int
.annotate 'line', 9387
    getattribute $P1, self, 'warnings'
    set $I1, $P1
    .return($I1)
# }
.annotate 'line', 9388

.end # dowarnings


.sub 'parse' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9391
    getattribute $P1, self, 'rootns'
    $P1.'parse'(__ARG_1)
# }
.annotate 'line', 9392

.end # parse


.sub 'optimize' :method
# Body
# {
.annotate 'line', 9395
    getattribute $P3, self, 'rootns'
    $P2 = $P3.'optimize'()
    setattribute self, 'rootns', $P2
# }
.annotate 'line', 9396

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9399
    __ARG_1.'comment'('Begin generated code')
.annotate 'line', 9400
    __ARG_1.'say'('')
.annotate 'line', 9402
    getattribute $P1, self, 'rootns'
    $P1.'emit'(__ARG_1)
.annotate 'line', 9404
    __ARG_1.'comment'('End generated code')
# }
.annotate 'line', 9405

.end # emit


.sub 'emitinclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9408
    __ARG_1.'comment'('DO NOT EDIT THIS FILE')
.annotate 'line', 9409
    __ARG_1.'comment'('Generated automatically from Winxed sources')
.annotate 'line', 9411
    getattribute $P1, self, 'rootns'
    $P1.'emitinclude'(__ARG_1)
.annotate 'line', 9413
    __ARG_1.'comment'('End')
# }
.annotate 'line', 9414

.end # emitinclude

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'WinxedCompileUnit' ]
.annotate 'line', 9352
    addattribute $P0, 'rootns'
.annotate 'line', 9353
    addattribute $P0, 'warnings'
.end
.namespace [ 'WinxedHLL' ]

.sub '__private_compile_tail' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9423
    set $S2, __ARG_2
    ne $S2, 'parse', __label_0
.annotate 'line', 9424
    .return(__ARG_1)
 __label_0: # endif
.annotate 'line', 9425
# var handleout: $P1
    new $P1, [ 'StringHandle' ]
.annotate 'line', 9426
    $P1.'open'('__eval__', 'w')
.annotate 'line', 9427
# var emit: $P2
    new $P2, [ 'Emit' ]
    $P2.'Emit'($P1)
.annotate 'line', 9428
    if_null __ARG_3, __label_1
    unless __ARG_3 goto __label_1
.annotate 'line', 9429
    $P2.'disable_annotations'()
 __label_1: # endif
.annotate 'line', 9430
    __ARG_1.'emit'($P2)
.annotate 'line', 9431
    $P2.'close'()
.annotate 'line', 9432
    $P1.'close'()
.annotate 'line', 9433
# pircode: $S1
    $P5 = $P1.'read'(0)
    null $S1
    if_null $P5, __label_2
    set $S1, $P5
 __label_2:
.annotate 'line', 9434
# var object: $P3
    null $P3
.annotate 'line', 9435
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
.annotate 'line', 9437
    new $P3, [ 'String' ]
.annotate 'line', 9438
    assign $P3, $S1
    goto __label_3 # break
 __label_6: # case
 __label_7: # case
.annotate 'line', 9442
# var pircomp: $P4
# predefined compreg
    compreg $P4, 'PIR'
.annotate 'line', 9443
    $P3 = $P4($S1)
    goto __label_3 # break
 __label_4: # default
.annotate 'line', 9444
# predefined die
.annotate 'line', 9446
    die 'Invalid target'
 __label_3: # switch end
.annotate 'line', 9448
    .return($P3)
# }
.annotate 'line', 9449

.end # __private_compile_tail


.sub '__private_geninclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9452
# var handleout: $P1
    new $P1, [ 'StringHandle' ]
.annotate 'line', 9453
    $P1.'open'('__eval__', 'w')
.annotate 'line', 9454
# var emit: $P2
    new $P2, [ 'Emit' ]
    $P2.'Emit'($P1)
.annotate 'line', 9455
    __ARG_1.'emitinclude'($P2)
.annotate 'line', 9456
    $P2.'close'()
.annotate 'line', 9457
    $P1.'close'()
.annotate 'line', 9458
    .tailcall $P1.'read'(0)
# }
.annotate 'line', 9459

.end # __private_geninclude


.sub 'compile' :method
        .param string __ARG_1
        .param string __ARG_2 :optional :named('target')
        .param int __ARG_3 :optional :named('noan')
        .param int __ARG_4 :optional :named('nowarn')
# Body
# {
.annotate 'line', 9465
    unless_null __ARG_2, __label_0
.annotate 'line', 9466
    set __ARG_2, ''
 __label_0: # endif
.annotate 'line', 9467
# var handlein: $P1
    new $P1, [ 'StringHandle' ]
.annotate 'line', 9468
    $P1.'open'('__eval__', 'w')
.annotate 'line', 9469
    $P1.'puts'(__ARG_1)
.annotate 'line', 9470
    $P1.'close'()
.annotate 'line', 9471
    $P1.'open'('__eval__', 'r')
.annotate 'line', 9472
# var tk: $P2
    new $P2, [ 'Tokenizer' ]
    $P2.'Tokenizer'($P1, '__eval__')
.annotate 'line', 9473
# var winxed: $P3
    new $P3, [ 'WinxedCompileUnit' ]
.annotate 'line', 9474
    unless __ARG_4 goto __label_1
.annotate 'line', 9475
    $P3.'setwarnmode'(0)
 __label_1: # endif
.annotate 'line', 9476
    $P3.'parse'($P2)
.annotate 'line', 9477
    $P1.'close'()
.annotate 'line', 9478
    $P3.'optimize'()
.annotate 'line', 9479
    .tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3)
# }
.annotate 'line', 9480

.end # compile


.sub 'compile_from_file_to_pir' :method
        .param string __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3 :optional :named('noan')
        .param int __ARG_4 :optional :named('nowarn')
# Body
# {
.annotate 'line', 9485
# var handlein: $P1
    new $P1, [ 'FileHandle' ]
.annotate 'line', 9486
    $P1.'open'(__ARG_1, 'r')
.annotate 'line', 9487
    $P1.'encoding'('utf8')
.annotate 'line', 9488
# var tk: $P2
    new $P2, [ 'Tokenizer' ]
    $P2.'Tokenizer'($P1, __ARG_1)
.annotate 'line', 9489
# var winxed: $P3
    new $P3, [ 'WinxedCompileUnit' ]
.annotate 'line', 9490
    unless __ARG_4 goto __label_0
.annotate 'line', 9491
    $P3.'setwarnmode'(0)
 __label_0: # endif
.annotate 'line', 9492
    $P3.'parse'($P2)
.annotate 'line', 9493
    $P1.'close'()
.annotate 'line', 9494
    $P3.'optimize'()
.annotate 'line', 9495
# var emit: $P4
    new $P4, [ 'Emit' ]
    $P4.'Emit'(__ARG_2)
.annotate 'line', 9496
    unless __ARG_3 goto __label_1
.annotate 'line', 9497
    $P4.'disable_annotations'()
 __label_1: # endif
.annotate 'line', 9498
    $P3.'emit'($P4)
.annotate 'line', 9499
    $P4.'close'()
# }
.annotate 'line', 9500

.end # compile_from_file_to_pir


.sub 'compile_from_file' :method
        .param string __ARG_1
        .param string __ARG_2 :optional :named('target')
        .param int __ARG_3 :optional :named('noan')
        .param int __ARG_4 :optional :named('nowarn')
# Body
# {
.annotate 'line', 9506
    unless_null __ARG_2, __label_0
.annotate 'line', 9507
    set __ARG_2, ''
 __label_0: # endif
.annotate 'line', 9508
# var handlein: $P1
    new $P1, [ 'FileHandle' ]
.annotate 'line', 9509
    $P1.'open'(__ARG_1, 'r')
.annotate 'line', 9510
    $P1.'encoding'('utf8')
.annotate 'line', 9511
# var tk: $P2
    new $P2, [ 'Tokenizer' ]
    $P2.'Tokenizer'($P1, __ARG_1)
.annotate 'line', 9512
# var winxed: $P3
    new $P3, [ 'WinxedCompileUnit' ]
.annotate 'line', 9513
    unless __ARG_4 goto __label_1
.annotate 'line', 9514
    $P3.'setwarnmode'(0)
 __label_1: # endif
.annotate 'line', 9515
    $P3.'parse'($P2)
.annotate 'line', 9516
    $P1.'close'()
.annotate 'line', 9517
    $P3.'optimize'()
.annotate 'line', 9518
    ne __ARG_2, 'include', __label_2
# {
.annotate 'line', 9519
    .tailcall self.'__private_geninclude'($P3)
# }
    goto __label_3
 __label_2: # else
.annotate 'line', 9522
    .tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3)
 __label_3: # endif
# }
.annotate 'line', 9523

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
.annotate 'line', 9531
# var winxed: $P1
    new $P1, [ 'WinxedCompileUnit' ]
.annotate 'line', 9532
    not $I1, __ARG_3
    unless $I1 goto __label_0
.annotate 'line', 9533
    $P1.'setwarnmode'(0)
 __label_0: # endif
.annotate 'line', 9534
    $P1.'parse'(__ARG_1)
.annotate 'line', 9536
    $P1.'optimize'()
.annotate 'line', 9538
# var handle: $P2
    null $P2
.annotate 'line', 9539
    ne __ARG_2, '-', __label_1
.annotate 'line', 9540
# predefined getstdout
    getstdout $P2
    goto __label_2
 __label_1: # else
.annotate 'line', 9542
# predefined open
    root_new $P2, ['parrot';'FileHandle']
    $P2.'open'(__ARG_2,'w')
 __label_2: # endif
.annotate 'line', 9543
# var emit: $P3
    new $P3, [ 'Emit' ]
    $P3.'Emit'($P2)
.annotate 'line', 9544
    unless __ARG_4 goto __label_3
.annotate 'line', 9545
    $P3.'disable_annotations'()
 __label_3: # endif
.annotate 'line', 9546
    unless __ARG_5 goto __label_4
.annotate 'line', 9547
    $P1.'emitinclude'($P3)
    goto __label_5
 __label_4: # else
.annotate 'line', 9549
    $P1.'emit'($P3)
 __label_5: # endif
.annotate 'line', 9550
    $P3.'close'()
.annotate 'line', 9551
    $P2.'close'()
# }
.annotate 'line', 9552

.end # winxed_parser


.sub 'initializer' :init :load
# Body
# {
.annotate 'line', 9560
# var comp: $P1
    new $P1, [ 'WinxedHLL' ]
.annotate 'line', 9561
# predefined compreg
    compreg 'winxed', $P1
# }
.annotate 'line', 9562

.end # initializer

.namespace [ 'Options' ]

.sub 'Options' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9571
    load_bytecode 'Getopt/Obj.pbc'
.annotate 'line', 9572
# var getopts: $P1
    new $P1, [ 'Getopt'; 'Obj' ]
.annotate 'line', 9573
    $P1.'notOptStop'(1)
.annotate 'line', 9574
    $P1.'push_string'('o=s')
.annotate 'line', 9575
    $P1.'push_string'('e=s')
.annotate 'line', 9576
    $P1.'push_string'('geninclude')
.annotate 'line', 9577
    $P1.'push_string'('noan')
.annotate 'line', 9578
    $P1.'push_string'('nowarn')
.annotate 'line', 9579
    $P1.'notOptStop'(1)
.annotate 'line', 9580
    __ARG_1.'shift'()
.annotate 'line', 9581
# var opts: $P2
    $P2 = $P1.'get_options'(__ARG_1)
.annotate 'line', 9582
    setattribute self, 'getopts', $P1
.annotate 'line', 9583
    setattribute self, 'opts', $P2
# }
.annotate 'line', 9584

.end # Options


.sub 'getbool' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9587
# var opts: $P1
    getattribute $P1, self, 'opts'
.annotate 'line', 9588
# var value: $P2
    $P2 = $P1[__ARG_1]
.annotate 'line', 9589
    isnull $I1, $P2
    not $I1
    .return($I1)
# }
.annotate 'line', 9590

.end # getbool


.sub 'getstring' :method
        .param string __ARG_1
        .param string __ARG_2 :optional
# Body
# {
.annotate 'line', 9593
# var opts: $P1
    getattribute $P1, self, 'opts'
.annotate 'line', 9594
# var value: $P2
    $P2 = $P1[__ARG_1]
.annotate 'line', 9595
    if_null $P2, __label_1
# predefined string
    set $S1, $P2
    goto __label_0
 __label_1:
    set $S1, __ARG_2
 __label_0:
    .return($S1)
# }
.annotate 'line', 9596

.end # getstring

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Options' ]
.annotate 'line', 9566
    addattribute $P0, 'getopts'
.annotate 'line', 9567
    addattribute $P0, 'opts'
.end
.namespace [ ]

.sub 'stage1'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9601
# var options: $P1
    new $P1, [ 'Options' ]
    $P1.'Options'(__ARG_1)
.annotate 'line', 9602
# outputfile: $S1
    $P4 = $P1.'getstring'('o', '')
    null $S1
    if_null $P4, __label_0
    set $S1, $P4
 __label_0:
.annotate 'line', 9603
# expr: $S2
    $P4 = $P1.'getstring'('e')
    null $S2
    if_null $P4, __label_1
    set $S2, $P4
 __label_1:
.annotate 'line', 9604
# noan: $I1
    $P4 = $P1.'getbool'('noan')
    set $I1, $P4
.annotate 'line', 9605
# warn: $I2
    $P4 = $P1.'getbool'('nowarn')
    isfalse $I2, $P4
.annotate 'line', 9606
# geninclude: $I3
    $P4 = $P1.'getbool'('geninclude')
    set $I3, $P4
.annotate 'line', 9608
# argc: $I4
    set $P4, __ARG_1
    set $I4, $P4
.annotate 'line', 9609
# filename: $S3
    null $S3
.annotate 'line', 9610
# var file: $P2
    null $P2
.annotate 'line', 9611
    unless_null $S2, __label_2
# {
.annotate 'line', 9612
    ne $I4, 0, __label_4
# predefined Error
.annotate 'line', 9613
    root_new $P4, ['parrot';'Exception']
    $P4['message'] = 'No file'
    throw $P4
 __label_4: # endif
.annotate 'line', 9615
    $S3 = __ARG_1[0]
.annotate 'line', 9616
# predefined open
    root_new $P2, ['parrot';'FileHandle']
    $P2.'open'($S3)
.annotate 'line', 9617
    $P2.'encoding'('utf8')
# }
    goto __label_3
 __label_2: # else
# {
.annotate 'line', 9620
    concat $S0, 'function main[main](argv){', $S2
    concat $S0, $S0, ';}'
    set $S2, $S0
.annotate 'line', 9621
    new $P2, [ 'StringHandle' ]
.annotate 'line', 9622
    $P2.'open'('__eval__', 'w')
.annotate 'line', 9623
    $P2.'puts'($S2)
.annotate 'line', 9624
    $P2.'close'()
.annotate 'line', 9625
    $P2.'open'('__eval__')
.annotate 'line', 9626
    set $S3, '__eval__'
# }
 __label_3: # endif
.annotate 'line', 9629
# var t: $P3
    new $P3, [ 'Tokenizer' ]
    $P3.'Tokenizer'($P2, $S3)
.annotate 'line', 9631
    'winxed_parser'($P3, $S1, $I2, $I1, $I3)
.annotate 'line', 9633
    $P2.'close'()
# }
.annotate 'line', 9634

.end # stage1


.sub 'show_backtrace'
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9638
# i: $I1
    set $I1, 1
.annotate 'line', 9639
    iter $P4, __ARG_1
    set $P4, 0
 __label_0: # for iteration
    unless $P4 goto __label_1
    shift $P1, $P4
# {
.annotate 'line', 9640
# var sub: $P2
    $P2 = $P1['sub']
.annotate 'line', 9641
# subname: $S1
    null $S1
.annotate 'line', 9642
    if_null $P2, __label_2
# {
.annotate 'line', 9643
    set $S1, $P2
.annotate 'line', 9644
# ns: $S2
    $P5 = $P2.'get_namespace'()
    null $S2
    if_null $P5, __label_3
    set $S2, $P5
 __label_3:
.annotate 'line', 9645
    isne $I3, $S2, ''
    unless $I3 goto __label_5
    isne $I3, $S2, 'parrot'
 __label_5:
    unless $I3 goto __label_4
.annotate 'line', 9646
    concat $S0, $S2, '.'
    concat $S0, $S0, $S1
    set $S1, $S0
 __label_4: # endif
# }
 __label_2: # endif
.annotate 'line', 9648
# var ann: $P3
    $P3 = $P1['annotations']
.annotate 'line', 9649
# file: $S3
    $S3 = $P3['file']
.annotate 'line', 9650
    eq $S3, '', __label_6
# {
.annotate 'line', 9651
# line: $I2
    $I2 = $P3['line']
.annotate 'line', 9652
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
.annotate 'line', 9655

.end # show_backtrace


.sub 'main' :main
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9659
# retval: $I1
    null $I1
.annotate 'line', 9660
# try: create handler
    new $P2, 'ExceptionHandler'
    set_label $P2, __label_0
    $P2.'min_severity'(2)
    $P2.'max_severity'(2)
    $P2.'handle_types'(555, 556, 557)
    push_eh $P2
# try: begin
.annotate 'line', 9666
    'stage1'(__ARG_1)
# try: end
    pop_eh
    goto __label_1
.annotate 'line', 9660
# catch
 __label_0:
    .get_results($P1)
    finalize $P1
    pop_eh
# {
.annotate 'line', 9669
# msg: $S1
    $S1 = $P1['message']
.annotate 'line', 9670
# type: $I2
    $I2 = $P1['type']
.annotate 'line', 9671
    set $I3, $I2
    set $I4, 556
    if $I3 == $I4 goto __label_4
    set $I4, 557
    if $I3 == $I4 goto __label_5
    goto __label_3
# switch
 __label_4: # case
 __label_5: # case
.annotate 'line', 9674
# predefined cry
    getstderr $P0
    print $P0, 'Error: '
    print $P0, $S1
    print $P0, "\n"
.annotate 'line', 9675
    set $I1, 1
    goto __label_2 # break
 __label_3: # default
.annotate 'line', 9678
# predefined cry
    getstderr $P0
    print $P0, 'INTERNAL ERROR: '
    print $P0, $S1
    print $P0, "\n"
.annotate 'line', 9679
    $P2 = $P1.'backtrace'()
    'show_backtrace'($P2)
.annotate 'line', 9680
    set $I1, 2
 __label_2: # switch end
# }
# catch end
 __label_1:
.annotate 'line', 9683
# predefined exit
    exit $I1
# }
.annotate 'line', 9684

.end # main

# End generated code
