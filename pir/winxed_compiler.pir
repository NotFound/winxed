# Begin generated code

.namespace [ ]

.sub 'isspace' :subid('WSubId_11')
        .param string __ARG_1
# Body
# {
.annotate 'file', 'winxedst1.winxed'
.annotate 'line', 13
    iseq $I1, __ARG_1, ' '
    if $I1 goto __label_2
    iseq $I1, __ARG_1, "\n"
  __label_2:
    if $I1 goto __label_1
    iseq $I1, __ARG_1, "\t"
  __label_1:
    .return($I1)
# }
.annotate 'line', 14

.end # isspace


.sub 'isdigit' :subid('WSubId_9')
        .param string __ARG_1
# Body
# {
.annotate 'line', 18
# predefined indexof
.annotate 'line', 17
    index $I2, '0123456789', __ARG_1
.annotate 'line', 18
    isgt $I1, $I2, -1
    .return($I1)
# }
.annotate 'line', 19

.end # isdigit


.sub 'hexdigit' :subid('WSubId_10')
        .param string __ARG_1
# Body
# {
.annotate 'line', 23
# i: $I1
# predefined indexof
    index $I1, '0123456789abcdef0123456789ABCDEF', __ARG_1
.annotate 'line', 24
    lt $I1, 0, __label_1
    mod $I1, $I1, 16
  __label_1: # endif
.annotate 'line', 25
    .return($I1)
# }
.annotate 'line', 26

.end # hexdigit


.sub 'isidentstart' :subid('WSubId_12')
        .param string __ARG_1
# Body
# {
.annotate 'line', 33
# predefined indexof
.annotate 'line', 29
    index $I2, 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_', __ARG_1
.annotate 'line', 33
    isgt $I1, $I2, -1
.annotate 'line', 30
    .return($I1)
# }
.annotate 'line', 34

.end # isidentstart


.sub 'isident' :subid('WSubId_8')
        .param string __ARG_1
# Body
# {
.annotate 'line', 42
# predefined indexof
.annotate 'line', 37
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

.sub 'Warn' :subid('WSubId_55')
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
    unless __ARG_3 goto __label_1
# {
.annotate 'line', 61
    $P1.'print'(' near ')
.annotate 'line', 62
    $P2 = __ARG_2.'show'()
    $P1.'print'($P2)
# }
  __label_1: # endif
.annotate 'line', 64
    $P1.'print'("\n")
# }
.annotate 'line', 65

.end # Warn


.sub 'InternalError' :subid('WSubId_6')
        .param string __ARG_1
        .param pmc __ARG_2 :optional
        .param int __ARG_3 :opt_flag
# Body
# {
.annotate 'line', 69
    unless __ARG_3 goto __label_1
# {
.annotate 'line', 70
# desc: $S1
    $P1 = __ARG_2.'show'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 71
    concat $S0, __ARG_1, ' near '
    concat $S0, $S0, $S1
    set __ARG_1, $S0
# }
  __label_1: # endif
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


.sub 'TokenError' :subid('WSubId_7')
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


.sub 'SyntaxError' :subid('WSubId_1')
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 84
# sline: $S1
    getattribute $P1, __ARG_2, 'line'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 85
# file: $S2
    getattribute $P1, __ARG_2, 'file'
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 86
# desc: $S3
    $P1 = __ARG_2.'viewable'()
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
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


.sub 'Expected' :subid('WSubId_29')
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.const 'Sub' $P1 = 'WSubId_1'
.annotate 'line', 93
    concat $S1, "Expected ", __ARG_1
    $P1($S1, __ARG_2)
# }
.annotate 'line', 94

.end # Expected


.sub 'Unexpected' :subid('WSubId_31')
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.const 'Sub' $P1 = 'WSubId_1'
.annotate 'line', 98
    concat $S1, "Unexpected ", __ARG_1
    $P1($S1, __ARG_2)
# }
.annotate 'line', 99

.end # Unexpected


.sub 'ExpectedIdentifier' :subid('WSubId_3')
        .param pmc __ARG_1
# Body
# {
.const 'Sub' $P1 = 'WSubId_1'
.annotate 'line', 103
    $P1("Expected identifier", __ARG_1)
# }
.annotate 'line', 104

.end # ExpectedIdentifier


.sub 'ExpectedOp' :subid('WSubId_2')
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.const 'Sub' $P1 = 'WSubId_1'
.annotate 'line', 108
    concat $S1, "Expected '", __ARG_1
    concat $S1, $S1, "'"
    $P1($S1, __ARG_2)
# }
.annotate 'line', 109

.end # ExpectedOp


.sub 'RequireOp' :subid('WSubId_4')
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 113
    $P1 = __ARG_2.'isop'(__ARG_1)
    isfalse $I1, $P1
    unless $I1 goto __label_1
.const 'Sub' $P2 = 'WSubId_2'
.annotate 'line', 114
    $P2(__ARG_1, __ARG_2)
  __label_1: # endif
# }
.annotate 'line', 115

.end # RequireOp


.sub 'RequireKeyword' :subid('WSubId_5')
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 119
    $P1 = __ARG_2.'iskeyword'(__ARG_1)
    isfalse $I1, $P1
    unless $I1 goto __label_1
.const 'Sub' $P2 = 'WSubId_2'
.annotate 'line', 120
    $P2(__ARG_1, __ARG_2)
  __label_1: # endif
# }
.annotate 'line', 121

.end # RequireKeyword


.sub 'RequireIdentifier' :subid('WSubId_80')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 125
    $P1 = __ARG_1.'isidentifier'()
    isfalse $I1, $P1
    unless $I1 goto __label_1
.const 'Sub' $P2 = 'WSubId_3'
.annotate 'line', 126
    $P2(__ARG_1)
  __label_1: # endif
# }
.annotate 'line', 127

.end # RequireIdentifier


.sub 'ExpectOp' :subid('WSubId_43')
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 131
# var t: $P1
    $P1 = __ARG_2.'get'()
.const 'Sub' $P2 = 'WSubId_4'
.annotate 'line', 132
    $P2(__ARG_1, $P1)
# }
.annotate 'line', 133

.end # ExpectOp


.sub 'ExpectKeyword' :subid('WSubId_82')
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 137
# var t: $P1
    $P1 = __ARG_2.'get'()
.const 'Sub' $P2 = 'WSubId_5'
.annotate 'line', 138
    $P2(__ARG_1, $P1)
# }
.annotate 'line', 139

.end # ExpectKeyword


.sub 'UndefinedVariable' :subid('WSubId_48')
        .param pmc __ARG_1
# Body
# {
.const 'Sub' $P1 = 'WSubId_1'
# predefined string
.annotate 'line', 143
    set $S1, __ARG_1
    concat $S2, "Variable '", $S1
    concat $S2, $S2, "' is not defined"
    $P1($S2, __ARG_1)
# }
.annotate 'line', 144

.end # UndefinedVariable

.namespace [ 'Token' ]

.sub 'Token' :method
        .param string __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 156
    box $P1, __ARG_1
    setattribute self, 'file', $P1
.annotate 'line', 157
    box $P1, __ARG_2
    setattribute self, 'line', $P1
# }
.annotate 'line', 158

.end # Token


.sub 'get_bool' :method :vtable
# Body
# {
.annotate 'line', 161
    .return(1)
# }
.annotate 'line', 162

.end # get_bool


.sub 'get_integer' :method :vtable
# Body
# {
.annotate 'line', 165
    .return(1)
# }
.annotate 'line', 166

.end # get_integer


.sub 'iseof' :method
# Body
# {
.annotate 'line', 168
    .return(0)
# }

.end # iseof


.sub 'iscomment' :method
# Body
# {
.annotate 'line', 169
    .return(0)
# }

.end # iscomment


.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 170
    .return(0)
# }

.end # isidentifier


.sub 'isint' :method
# Body
# {
.annotate 'line', 171
    .return(0)
# }

.end # isint


.sub 'isfloat' :method
# Body
# {
.annotate 'line', 172
    .return(0)
# }

.end # isfloat


.sub 'isstring' :method
# Body
# {
.annotate 'line', 173
    .return(0)
# }

.end # isstring


.sub 'rawstring' :method
# Body
# {
.const 'Sub' $P1 = 'WSubId_6'
.annotate 'line', 177
    $P1('Not a literal string', self)
# }
.annotate 'line', 178

.end # rawstring


.sub 'getidentifier' :method
# Body
# {
.const 'Sub' $P1 = 'WSubId_3'
.annotate 'line', 181
    $P1(self)
# }
.annotate 'line', 182

.end # getidentifier


.sub 'iskeyword' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 183
    .return(0)
# }

.end # iskeyword


.sub 'checkkeyword' :method
# Body
# {
.annotate 'line', 184
    .return(0)
# }

.end # checkkeyword


.sub 'isop' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 185
    .return(0)
# }

.end # isop


.sub 'checkop' :method
# Body
# {
.annotate 'line', 186
    .return('')
# }

.end # checkop


.sub 'viewable' :method
# Body
# {
.annotate 'line', 187
    .return('(unknown)')
# }

.end # viewable


.sub 'show' :method
# Body
# {
.annotate 'line', 190
# r: $S1
    $P1 = self.'viewable'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 191
# predefined string
    getattribute $P1, self, 'file'
.annotate 'line', 189
    set $S2, $P1
# predefined string
.annotate 'line', 191
    getattribute $P2, self, 'line'
.annotate 'line', 189
    set $S3, $P2
.annotate 'line', 191
    concat $S4, $S1, ' at '
    concat $S4, $S4, $S2
    concat $S4, $S4, ' line '
    concat $S4, $S4, $S3
    .return($S4)
# }
.annotate 'line', 192

.end # show

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Token' ]
.annotate 'line', 152
    addattribute $P0, 'file'
.annotate 'line', 153
    addattribute $P0, 'line'
.end
.namespace [ 'TokenEof' ]

.sub 'TokenEof' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 199
    self.'Token'(__ARG_1, 0)
# }
.annotate 'line', 200

.end # TokenEof


.sub 'get_bool' :method :vtable
# Body
# {
.annotate 'line', 203
    .return(0)
# }
.annotate 'line', 204

.end # get_bool


.sub 'get_integer' :method :vtable
# Body
# {
.annotate 'line', 207
    .return(0)
# }
.annotate 'line', 208

.end # get_integer


.sub 'iseof' :method
# Body
# {
.annotate 'line', 209
    .return(1)
# }

.end # iseof


.sub 'viewable' :method
# Body
# {
.annotate 'line', 210
    .return('(End of file)')
# }

.end # viewable

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TokenEof' ]
.annotate 'line', 195
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
.annotate 'line', 218
    self.'Token'(__ARG_1, __ARG_2)
.annotate 'line', 219
    box $P1, __ARG_3
    setattribute self, 'str', $P1
# }
.annotate 'line', 220

.end # TokenWithVal


.sub 'get_string' :method :vtable
# Body
# {
.annotate 'line', 221
    getattribute $P1, self, 'str'
    .return($P1)
# }

.end # get_string


.sub 'viewable' :method
# Body
# {
.annotate 'line', 224
    getattribute $P1, self, 'str'
    .return($P1)
# }
.annotate 'line', 225

.end # viewable

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TokenWithVal' ]
.annotate 'line', 213
    get_class $P1, [ 'Token' ]
    addparent $P0, $P1
.annotate 'line', 215
    addattribute $P0, 'str'
.end
.namespace [ 'TokenComment' ]

.sub 'TokenComment' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 232
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 233

.end # TokenComment


.sub 'iscomment' :method
# Body
# {
.annotate 'line', 234
    .return(1)
# }

.end # iscomment

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TokenComment' ]
.annotate 'line', 228
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
.annotate 'line', 241
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 242

.end # TokenOp


.sub 'isop' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 245
    getattribute $P1, self, 'str'
    set $S1, $P1
    iseq $I1, $S1, __ARG_1
    .return($I1)
# }
.annotate 'line', 246

.end # isop


.sub 'checkop' :method
# Body
# {
# predefined string
.annotate 'line', 249
    getattribute $P1, self, 'str'
.annotate 'line', 248
    set $S1, $P1
.annotate 'line', 249
    .return($S1)
# }
.annotate 'line', 250

.end # checkop

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TokenOp' ]
.annotate 'line', 237
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
.annotate 'line', 257
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 258

.end # TokenIdentifier


.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 259
    .return(1)
# }

.end # isidentifier


.sub 'getidentifier' :method
# Body
# {
.annotate 'line', 262
    getattribute $P1, self, 'str'
    .return($P1)
# }
.annotate 'line', 263

.end # getidentifier


.sub 'checkkeyword' :method
# Body
# {
# predefined string
.annotate 'line', 266
    getattribute $P1, self, 'str'
.annotate 'line', 265
    set $S1, $P1
.annotate 'line', 266
    .return($S1)
# }
.annotate 'line', 267

.end # checkkeyword


.sub 'iskeyword' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 270
    getattribute $P1, self, 'str'
    set $S1, $P1
    iseq $I1, $S1, __ARG_1
    .return($I1)
# }
.annotate 'line', 271

.end # iskeyword

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TokenIdentifier' ]
.annotate 'line', 253
    get_class $P1, [ 'TokenWithVal' ]
    addparent $P0, $P1
.end
.namespace [ 'TokenString' ]

.sub 'isstring' :method
# Body
# {
.annotate 'line', 276
    .return(1)
# }

.end # isstring


.sub 'rawstring' :method
# Body
# {
.annotate 'line', 279
    getattribute $P1, self, 'str'
    .return($P1)
# }
.annotate 'line', 280

.end # rawstring

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TokenString' ]
.annotate 'line', 274
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
.annotate 'line', 287
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 288

.end # TokenQuoted


.sub 'get_string' :method :vtable
# Body
# {
# predefined string
.annotate 'line', 291
    getattribute $P1, self, 'str'
.annotate 'line', 290
    set $S1, $P1
.annotate 'line', 291
    concat $S2, '"', $S1
    concat $S2, $S2, '"'
    .return($S2)
# }
.annotate 'line', 292

.end # get_string


.sub 'viewable' :method
# Body
# {
# predefined string
.annotate 'line', 295
    getattribute $P1, self, 'str'
.annotate 'line', 294
    set $S1, $P1
.annotate 'line', 295
    concat $S2, '"', $S1
    concat $S2, $S2, '"'
    .return($S2)
# }
.annotate 'line', 296

.end # viewable


.sub 'getasquoted' :method
# Body
# {
.annotate 'line', 299
    getattribute $P1, self, 'str'
    .return($P1)
# }
.annotate 'line', 300

.end # getasquoted

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TokenQuoted' ]
.annotate 'line', 283
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
.annotate 'line', 307
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 308

.end # TokenSingleQuoted


.sub 'get_string' :method :vtable
# Body
# {
# predefined string
.annotate 'line', 311
    getattribute $P1, self, 'str'
.annotate 'line', 310
    set $S1, $P1
.annotate 'line', 311
    concat $S2, "'", $S1
    concat $S2, $S2, "'"
    .return($S2)
# }
.annotate 'line', 312

.end # get_string


.sub 'viewable' :method
# Body
# {
# predefined string
.annotate 'line', 315
    getattribute $P1, self, 'str'
.annotate 'line', 314
    set $S1, $P1
.annotate 'line', 315
    concat $S2, "'", $S1
    concat $S2, $S2, "'"
    .return($S2)
# }
.annotate 'line', 316

.end # viewable


.sub 'getasquoted' :method
# Body
# {
.annotate 'line', 319
# s: $S1
    set $S1, ''
.annotate 'line', 320
    getattribute $P1, self, 'str'
    iter $P2, $P1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $S2, $P2
# {
# switch
.annotate 'line', 321
    set $S3, $S2
    set $S4, '"'
    if $S3 == $S4 goto __label_5
    set $S4, '\'
    if $S3 == $S4 goto __label_6
    set $S4, "'"
    if $S3 == $S4 goto __label_7
    goto __label_4
  __label_5: # case
  __label_6: # case
  __label_7: # case
.annotate 'line', 325
    concat $S0, '\', $S2
    set $S2, $S0
    goto __label_3 # break
  __label_4: # default
  __label_3: # switch end
.annotate 'line', 328
    concat $S1, $S1, $S2
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 330
    .return($S1)
# }
.annotate 'line', 331

.end # getasquoted

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TokenSingleQuoted' ]
.annotate 'line', 303
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
.annotate 'line', 338
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 339

.end # TokenInteger


.sub 'isint' :method
# Body
# {
.annotate 'line', 340
    .return(1)
# }

.end # isint

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TokenInteger' ]
.annotate 'line', 334
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
.annotate 'line', 347
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 348

.end # TokenFloat


.sub 'isfloat' :method
# Body
# {
.annotate 'line', 349
    .return(1)
# }

.end # isfloat

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TokenFloat' ]
.annotate 'line', 343
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
.annotate 'line', 359
# s: $S1
    set $S1, ''
.annotate 'line', 360
# c: $S2
    null $S2
# for loop
.annotate 'line', 361
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_3: # for condition
    eq $S2, '"', __label_2
# {
# switch
.annotate 'line', 362
    set $S4, $S2
    set $S5, ""
    if $S4 == $S5 goto __label_6
    set $S5, "\n"
    if $S4 == $S5 goto __label_7
    set $S5, '\'
    if $S4 == $S5 goto __label_8
    goto __label_5
  __label_6: # case
  __label_7: # case
.const 'Sub' $P2 = 'WSubId_7'
.annotate 'line', 365
    $P2('Unterminated string', __ARG_1, __ARG_3)
  __label_8: # case
.annotate 'line', 368
# c2: $S3
    $P3 = __ARG_1.'getchar'()
    null $S3
    if_null $P3, __label_9
    set $S3, $P3
  __label_9:
.annotate 'line', 369
    iseq $I1, $S3, ''
    if $I1 goto __label_11
    iseq $I1, $S3, "\n"
  __label_11:
    unless $I1 goto __label_10
.const 'Sub' $P4 = 'WSubId_7'
.annotate 'line', 370
    $P4('Unterminated string', __ARG_1, __ARG_3)
  __label_10: # endif
.annotate 'line', 371
    concat $S1, $S1, $S2
    concat $S1, $S1, $S3
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 374
    concat $S1, $S1, $S2
  __label_4: # switch end
# }
  __label_1: # for iteration
.annotate 'line', 361
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_3
  __label_2: # for end
.annotate 'line', 377
    new $P3, [ 'TokenQuoted' ]
    getattribute $P5, __ARG_1, 'filename'
    $P3.'TokenQuoted'($P5, __ARG_3, $S1)
    set $P1, $P3
    .return($P1)
# }
.annotate 'line', 378

.end # getquoted


.sub 'getsinglequoted'
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 382
# s: $S1
    set $S1, ''
.annotate 'line', 383
# c: $S2
    null $S2
# for loop
.annotate 'line', 384
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_3: # for condition
    eq $S2, "'", __label_2
# {
.annotate 'line', 385
    iseq $I1, $S2, ""
    if $I1 goto __label_5
    iseq $I1, $S2, "\n"
  __label_5:
    unless $I1 goto __label_4
.const 'Sub' $P2 = 'WSubId_7'
.annotate 'line', 386
    $P2('Unterminated string', __ARG_1, __ARG_3)
  __label_4: # endif
.annotate 'line', 387
    concat $S1, $S1, $S2
# }
  __label_1: # for iteration
.annotate 'line', 384
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_3
  __label_2: # for end
.annotate 'line', 389
    new $P3, [ 'TokenSingleQuoted' ]
    getattribute $P4, __ARG_1, 'filename'
    $P3.'TokenSingleQuoted'($P4, __ARG_3, $S1)
    set $P1, $P3
    .return($P1)
# }
.annotate 'line', 390

.end # getsinglequoted


.sub 'getheredoc'
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 394
# mark: $S1
    set $S1, ''
.annotate 'line', 395
# c: $S2
    null $S2
# for loop
.annotate 'line', 396
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_3: # for condition
    eq $S2, "\n", __label_2
# {
# switch
.annotate 'line', 397
    set $S5, $S2
    set $S6, ''
    if $S5 == $S6 goto __label_6
    set $S6, '"'
    if $S5 == $S6 goto __label_7
    set $S6, '\'
    if $S5 == $S6 goto __label_8
    goto __label_5
  __label_6: # case
.const 'Sub' $P2 = 'WSubId_7'
.annotate 'line', 399
    $P2('Unterminated heredoc', __ARG_1, __ARG_3)
  __label_7: # case
  __label_8: # case
.annotate 'line', 404
    concat $S0, '\', $S2
    set $S2, $S0
    goto __label_4 # break
  __label_5: # default
  __label_4: # switch end
.annotate 'line', 407
    concat $S0, $S1, $S2
    set $S1, $S0
# }
  __label_1: # for iteration
.annotate 'line', 396
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_3
  __label_2: # for end
.annotate 'line', 409
    concat $S0, $S1, ':>>'
    set $S1, $S0
.annotate 'line', 411
# content: $S3
    set $S3, ''
.annotate 'line', 412
# line: $S4
    null $S4
  __label_9: # do
.annotate 'line', 413
# {
.annotate 'line', 414
    set $S4, ''
# for loop
.annotate 'line', 415
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_14: # for condition
    eq $S2, "\n", __label_13
# {
# switch
.annotate 'line', 416
    set $S5, $S2
    set $S6, ''
    if $S5 == $S6 goto __label_17
    set $S6, '"'
    if $S5 == $S6 goto __label_18
    set $S6, '\'
    if $S5 == $S6 goto __label_19
    goto __label_16
  __label_17: # case
.const 'Sub' $P3 = 'WSubId_7'
.annotate 'line', 418
    $P3('Unterminated heredoc', __ARG_1, __ARG_3)
  __label_18: # case
  __label_19: # case
.annotate 'line', 421
    concat $S0, '\', $S2
    set $S2, $S0
    goto __label_15 # break
  __label_16: # default
  __label_15: # switch end
.annotate 'line', 424
    concat $S4, $S4, $S2
# }
  __label_12: # for iteration
.annotate 'line', 415
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_14
  __label_13: # for end
.annotate 'line', 426
    eq $S4, $S1, __label_20
.annotate 'line', 427
    concat $S3, $S3, $S4
    concat $S3, $S3, '\n'
  __label_20: # endif
# }
  __label_11: # continue
.annotate 'line', 428
    ne $S4, $S1, __label_9
  __label_10: # enddo
.annotate 'line', 429
    new $P4, [ 'TokenQuoted' ]
    getattribute $P5, __ARG_1, 'filename'
    $P4.'TokenQuoted'($P5, __ARG_3, $S3)
    set $P1, $P4
    .return($P1)
# }
.annotate 'line', 430

.end # getheredoc


.sub 'getident' :subid('WSubId_13')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 434
# s: $S1
    set $S1, __ARG_2
.annotate 'line', 435
# c: $S2
    null $S2
# for loop
.annotate 'line', 436
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_3: # for condition
.const 'Sub' $P3 = 'WSubId_8'
    $P2 = $P3($S2)
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 437
    concat $S1, $S1, $S2
  __label_1: # for iteration
.annotate 'line', 436
    $P4 = __ARG_1.'getchar'()
    set $S2, $P4
    goto __label_3
  __label_2: # for end
.annotate 'line', 438
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 439
    new $P2, [ 'TokenIdentifier' ]
    getattribute $P4, __ARG_1, 'filename'
    $P2.'TokenIdentifier'($P4, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 440

.end # getident


.sub 'getnumber' :subid('WSubId_14')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 444
# s: $S1
    null $S1
.annotate 'line', 445
# c: $S2
    set $S2, __ARG_2
  __label_1: # do
.annotate 'line', 446
# {
.annotate 'line', 447
    concat $S1, $S1, $S2
.annotate 'line', 448
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
  __label_3: # continue
.const 'Sub' $P2 = 'WSubId_9'
.annotate 'line', 449
    $P1 = $P2($S2)
    if_null $P1, __label_2
    if $P1 goto __label_1
  __label_2: # enddo
.annotate 'line', 450
    iseq $I3, $S1, '0'
    unless $I3 goto __label_5
    iseq $I3, $S2, 'x'
    if $I3 goto __label_6
    iseq $I3, $S2, 'X'
  __label_6:
  __label_5:
    unless $I3 goto __label_4
# {
.annotate 'line', 451
# hexval: $I1
    null $I1
# h: $I2
    null $I2
# for loop
.annotate 'line', 452
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_9: # for condition
.const 'Sub' $P4 = 'WSubId_10'
    $P3 = $P4($S2)
    set $I2, $P3
    lt $I2, 0, __label_8
# {
.annotate 'line', 453
    mul $I3, $I1, 16
    add $I1, $I3, $I2
.annotate 'line', 454
    concat $S1, $S1, $S2
# }
  __label_7: # for iteration
.annotate 'line', 452
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_9
  __label_8: # for end
.annotate 'line', 456
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 457
    set $S1, $I1
.annotate 'line', 458
    new $P3, [ 'TokenInteger' ]
    getattribute $P5, __ARG_1, 'filename'
    $P3.'TokenInteger'($P5, __ARG_3, $S1)
    set $P1, $P3
    .return($P1)
# }
  __label_4: # endif
.annotate 'line', 460
    ne $S2, '.', __label_10
# {
  __label_12: # do
.annotate 'line', 461
# {
.annotate 'line', 462
    concat $S1, $S1, $S2
.annotate 'line', 463
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
  __label_14: # continue
.const 'Sub' $P6 = 'WSubId_9'
.annotate 'line', 464
    $P1 = $P6($S2)
    if_null $P1, __label_13
    if $P1 goto __label_12
  __label_13: # enddo
.annotate 'line', 465
    iseq $I3, $S2, 'e'
    if $I3 goto __label_16
    iseq $I3, $S2, 'E'
  __label_16:
    unless $I3 goto __label_15
# {
.annotate 'line', 466
    concat $S1, $S1, 'E'
.annotate 'line', 467
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    iseq $I3, $S2, '+'
    if $I3 goto __label_18
    iseq $I3, $S2, '-'
  __label_18:
    unless $I3 goto __label_17
# {
.annotate 'line', 468
    concat $S1, $S1, $S2
.annotate 'line', 469
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
  __label_17: # endif
# for loop
  __label_21: # for condition
.const 'Sub' $P7 = 'WSubId_9'
.annotate 'line', 471
    $P1 = $P7($S2)
    if_null $P1, __label_20
    unless $P1 goto __label_20
.annotate 'line', 472
    concat $S1, $S1, $S2
  __label_19: # for iteration
.annotate 'line', 471
    $P3 = __ARG_1.'getchar'()
    set $S2, $P3
    goto __label_21
  __label_20: # for end
# }
  __label_15: # endif
.annotate 'line', 474
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 475
    new $P3, [ 'TokenFloat' ]
    getattribute $P5, __ARG_1, 'filename'
    $P3.'TokenFloat'($P5, __ARG_3, $S1)
    set $P1, $P3
    .return($P1)
# }
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 478
    iseq $I3, $S2, 'e'
    if $I3 goto __label_24
    iseq $I3, $S2, 'E'
  __label_24:
    unless $I3 goto __label_22
# {
.annotate 'line', 479
    concat $S1, $S1, 'E'
.annotate 'line', 480
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    iseq $I3, $S2, '+'
    if $I3 goto __label_26
    iseq $I3, $S2, '-'
  __label_26:
    unless $I3 goto __label_25
# {
.annotate 'line', 481
    concat $S1, $S1, $S2
.annotate 'line', 482
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
  __label_25: # endif
# for loop
  __label_29: # for condition
.const 'Sub' $P8 = 'WSubId_9'
.annotate 'line', 484
    $P1 = $P8($S2)
    if_null $P1, __label_28
    unless $P1 goto __label_28
.annotate 'line', 485
    concat $S1, $S1, $S2
  __label_27: # for iteration
.annotate 'line', 484
    $P3 = __ARG_1.'getchar'()
    set $S2, $P3
    goto __label_29
  __label_28: # for end
.annotate 'line', 486
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 487
    new $P3, [ 'TokenFloat' ]
    getattribute $P5, __ARG_1, 'filename'
    $P3.'TokenFloat'($P5, __ARG_3, $S1)
    set $P1, $P3
    .return($P1)
# }
    goto __label_23
  __label_22: # else
# {
.annotate 'line', 490
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 491
    new $P3, [ 'TokenInteger' ]
    getattribute $P5, __ARG_1, 'filename'
    $P3.'TokenInteger'($P5, __ARG_3, $S1)
    set $P1, $P3
    .return($P1)
# }
  __label_23: # endif
# }
  __label_11: # endif
# }
.annotate 'line', 494

.end # getnumber


.sub 'getlinecomment'
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 498
# s: $S1
    set $S1, __ARG_2
# for loop
.annotate 'line', 499
# c: $S2
    $P1 = __ARG_1.'getchar'()
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
  __label_3: # for condition
    isne $I1, $S2, ''
    unless $I1 goto __label_5
    isne $I1, $S2, "\n"
  __label_5:
    unless $I1 goto __label_2
.annotate 'line', 500
    concat $S1, $S1, $S2
  __label_1: # for iteration
.annotate 'line', 499
    $P2 = __ARG_1.'getchar'()
    set $S2, $P2
    goto __label_3
  __label_2: # for end
.annotate 'line', 501
    new $P2, [ 'TokenComment' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenComment'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 502

.end # getlinecomment


.sub 'getcomment'
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 506
# s: $S1
    set $S1, __ARG_2
.annotate 'line', 507
# c: $S2
    $P1 = __ARG_1.'getchar'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
  __label_1:
  __label_2: # do
.annotate 'line', 508
# {
# for loop
  __label_7: # for condition
.annotate 'line', 509
    isne $I1, $S2, ''
    unless $I1 goto __label_8
    isne $I1, $S2, '*'
  __label_8:
    unless $I1 goto __label_6
.annotate 'line', 510
    concat $S1, $S1, $S2
  __label_5: # for iteration
.annotate 'line', 509
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_7
  __label_6: # for end
.annotate 'line', 511
    ne $S2, '', __label_9
.const 'Sub' $P2 = 'WSubId_7'
.annotate 'line', 512
    $P2("Unclosed comment", __ARG_1, __ARG_3)
  __label_9: # endif
.annotate 'line', 513
    concat $S1, $S1, $S2
.annotate 'line', 514
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
.annotate 'line', 515
    ne $S2, '', __label_10
.const 'Sub' $P3 = 'WSubId_7'
.annotate 'line', 516
    $P3("Unclosed comment", __ARG_1, __ARG_3)
  __label_10: # endif
# }
  __label_4: # continue
.annotate 'line', 517
    ne $S2, '/', __label_2
  __label_3: # enddo
.annotate 'line', 518
    concat $S1, $S1, '/'
.annotate 'line', 519
    new $P4, [ 'TokenComment' ]
    getattribute $P5, __ARG_1, 'filename'
    $P4.'TokenComment'($P5, __ARG_3, $S1)
    set $P1, $P4
    .return($P1)
# }
.annotate 'line', 520

.end # getcomment


.sub 'getop' :subid('WSubId_15')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 524
# s: $S1
    set $S1, __ARG_2
.annotate 'line', 525
    new $P2, [ 'TokenOp' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenOp'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 526

.end # getop

.namespace [ 'Tokenizer' ]

.sub 'Tokenizer' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 542
.const 'Sub' $P2 = 'getop'
.const 'Sub' $P3 = 'getident'
.const 'Sub' $P4 = 'getquoted'
.const 'Sub' $P5 = 'getsinglequoted'
.const 'Sub' $P6 = 'getheredoc'
.const 'Sub' $P7 = 'getcomment'
.const 'Sub' $P8 = 'getlinecomment'
.annotate 'line', 546
    setattribute self, 'h', __ARG_1
.annotate 'line', 547
    box $P9, ''
    setattribute self, 'pending', $P9
.annotate 'line', 548
    root_new $P10, ['parrot';'ResizablePMCArray']
    setattribute self, 'stacked', $P10
.annotate 'line', 549
    box $P9, __ARG_2
    setattribute self, 'filename', $P9
.annotate 'line', 550
    box $P9, 1
    setattribute self, 'line', $P9
.annotate 'line', 551
# var select: $P1
    root_new $P1, ['parrot';'Hash']
.annotate 'line', 552
    root_new $P9, ['parrot';'Hash']
    $P9[''] = $P3
    $P9['{'] = $P2
    $P1['$'] = $P9
    $P1['"'] = $P4
    $P1["'"] = $P5
.annotate 'line', 555
    root_new $P10, ['parrot';'Hash']
.annotate 'line', 556
    root_new $P11, ['parrot';'Hash']
    $P11[''] = $P2
    $P11['='] = $P2
    $P10['='] = $P11
    $P10[':'] = $P2
    $P1['='] = $P10
.annotate 'line', 559
    root_new $P12, ['parrot';'Hash']
    $P12['+'] = $P2
    $P12['='] = $P2
    $P1['+'] = $P12
.annotate 'line', 560
    root_new $P13, ['parrot';'Hash']
    $P13['-'] = $P2
    $P13['='] = $P2
    $P1['-'] = $P13
.annotate 'line', 561
    root_new $P14, ['parrot';'Hash']
    $P14['='] = $P2
    $P1['*'] = $P14
.annotate 'line', 562
    root_new $P15, ['parrot';'Hash']
    $P15['|'] = $P2
    $P1['|'] = $P15
.annotate 'line', 563
    root_new $P16, ['parrot';'Hash']
    $P16['&'] = $P2
    $P1['&'] = $P16
.annotate 'line', 564
    root_new $P17, ['parrot';'Hash']
.annotate 'line', 565
    root_new $P18, ['parrot';'Hash']
    $P18[''] = $P2
    $P18[':'] = $P6
    $P17['<'] = $P18
    $P17['='] = $P2
    $P1['<'] = $P17
.annotate 'line', 568
    root_new $P19, ['parrot';'Hash']
    $P19['>'] = $P2
    $P19['='] = $P2
    $P1['>'] = $P19
.annotate 'line', 569
    root_new $P20, ['parrot';'Hash']
.annotate 'line', 570
    root_new $P21, ['parrot';'Hash']
    $P21[''] = $P2
    $P21['='] = $P2
    $P20['='] = $P21
    $P1['!'] = $P20
.annotate 'line', 572
    root_new $P22, ['parrot';'Hash']
    $P22['%'] = $P2
    $P22['='] = $P2
    $P1['%'] = $P22
.annotate 'line', 573
    root_new $P23, ['parrot';'Hash']
    $P23['='] = $P2
    $P23['/'] = $P8
    $P23['*'] = $P7
    $P1['/'] = $P23
    $P1['#'] = $P8
.annotate 'line', 576
    setattribute self, 'select', $P1
# }
.annotate 'line', 577

.end # Tokenizer


.sub 'getchar' :method
# Body
# {
.annotate 'line', 580
# var pending: $P1
    getattribute $P1, self, 'pending'
.annotate 'line', 581
# c: $S1
    set $P3, $P1
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 582
    eq $S1, '', __label_2
.annotate 'line', 583
    assign $P1, ''
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 585
# var h: $P2
    getattribute $P2, self, 'h'
.annotate 'line', 586
    $P3 = $P2.'read'(1)
    set $S1, $P3
.annotate 'line', 587
    ne $S1, "\n", __label_4
.annotate 'line', 588
    getattribute $P3, self, 'line'
    inc $P3
  __label_4: # endif
# }
  __label_3: # endif
.annotate 'line', 590
    .return($S1)
# }
.annotate 'line', 591

.end # getchar


.sub 'ungetchar' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 594
    getattribute $P1, self, 'pending'
    assign $P1, __ARG_1
# }
.annotate 'line', 595

.end # ungetchar


.sub 'get_token' :method
# Body
# {
.annotate 'line', 598
.const 'Sub' $P3 = 'isspace'
.const 'Sub' $P4 = 'isidentstart'
.const 'Sub' $P5 = 'isdigit'
.const 'Sub' $P6 = 'getop'
.const 'Sub' $P7 = 'getident'
.const 'Sub' $P8 = 'getnumber'
.annotate 'line', 601
    getattribute $P9, self, 'stacked'
    if_null $P9, __label_1
    unless $P9 goto __label_1
.annotate 'line', 602
    getattribute $P10, self, 'stacked'
    .tailcall $P10.'pop'()
  __label_1: # endif
.annotate 'line', 604
# c: $S1
    $P9 = self.'getchar'()
    null $S1
    if_null $P9, __label_2
    set $S1, $P9
  __label_2:
  __label_4: # while
.annotate 'line', 605
.const 'Sub' $P11 = 'WSubId_11'
    $P9 = $P11($S1)
    if_null $P9, __label_3
    unless $P9 goto __label_3
.annotate 'line', 606
    $P10 = self.'getchar'()
    set $S1, $P10
    goto __label_4
  __label_3: # endwhile
.annotate 'line', 607
# line: $I1
    getattribute $P9, self, 'line'
    set $I1, $P9
.annotate 'line', 608
    ne $S1, '', __label_5
.annotate 'line', 609
    new $P10, [ 'TokenEof' ]
    getattribute $P12, self, 'filename'
    $P10.'TokenEof'($P12)
    set $P9, $P10
    .return($P9)
  __label_5: # endif
.annotate 'line', 610
.const 'Sub' $P13 = 'WSubId_12'
    $P9 = $P13($S1)
    if_null $P9, __label_6
    unless $P9 goto __label_6
.annotate 'line', 611
.const 'Sub' $P14 = 'WSubId_13'
    .tailcall $P14(self, $S1, $I1)
  __label_6: # endif
.annotate 'line', 612
.const 'Sub' $P15 = 'WSubId_9'
    $P9 = $P15($S1)
    if_null $P9, __label_7
    unless $P9 goto __label_7
.annotate 'line', 613
.const 'Sub' $P16 = 'WSubId_14'
    .tailcall $P16(self, $S1, $I1)
  __label_7: # endif
.annotate 'line', 615
# op: $S2
    set $S2, $S1
.annotate 'line', 616
# var select: $P1
    getattribute $P1, self, 'select'
.annotate 'line', 617
# var current: $P2
    $P2 = $P1[$S1]
  __label_9: # while
.annotate 'line', 619
    isnull $I2, $P2
    not $I2
    unless $I2 goto __label_10
    isa $I2, $P2, 'Hash'
  __label_10:
    unless $I2 goto __label_8
# {
.annotate 'line', 620
    $P9 = self.'getchar'()
    set $S1, $P9
.annotate 'line', 621
    set $P1, $P2
.annotate 'line', 622
    $P2 = $P1[$S1]
.annotate 'line', 623
    unless_null $P2, __label_11
# {
.annotate 'line', 624
    self.'ungetchar'($S1)
.annotate 'line', 625
    $P2 = $P1['']
# }
    goto __label_12
  __label_11: # else
.annotate 'line', 628
    concat $S2, $S2, $S1
  __label_12: # endif
# }
    goto __label_9
  __label_8: # endwhile
.annotate 'line', 630
    if_null $P2, __label_13
    unless $P2 goto __label_13
.annotate 'line', 631
    .tailcall $P2(self, $S2, $I1)
  __label_13: # endif
.annotate 'line', 632
.const 'Sub' $P17 = 'WSubId_15'
    .tailcall $P17(self, $S2, $I1)
# }
.annotate 'line', 633

.end # get_token


.sub 'get' :method
        .param int __ARG_1 :optional
# Body
# {
.annotate 'line', 636
# var t: $P1
    $P1 = self.'get_token'()
  __label_2: # while
.annotate 'line', 637
    $P2 = $P1.'iseof'()
    isfalse $I1, $P2
    unless $I1 goto __label_4
    not $I1, __ARG_1
  __label_4:
    unless $I1 goto __label_3
    $I1 = $P1.'iscomment'()
  __label_3:
    unless $I1 goto __label_1
.annotate 'line', 638
    $P1 = self.'get_token'()
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 639
    .return($P1)
# }
.annotate 'line', 640

.end # get


.sub 'unget' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 643
    getattribute $P1, self, 'stacked'
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 644

.end # unget

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Tokenizer' ]
.annotate 'line', 534
    addattribute $P0, 'h'
.annotate 'line', 535
    addattribute $P0, 'pending'
.annotate 'line', 536
    addattribute $P0, 'select'
.annotate 'line', 537
    addattribute $P0, 'stacked'
.annotate 'line', 538
    addattribute $P0, 'filename'
.annotate 'line', 539
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

.sub 'typetoregcheck' :subid('WSubId_83')
        .param string __ARG_1
# Body
# {
# switch
.annotate 'line', 665
    set $S1, __ARG_1
    set $S2, 'int'
    if $S1 == $S2 goto __label_3
    set $S2, 'float'
    if $S1 == $S2 goto __label_4
    set $S2, 'string'
    if $S1 == $S2 goto __label_5
    set $S2, 'var'
    if $S1 == $S2 goto __label_6
    goto __label_2
  __label_3: # case
.annotate 'line', 666
    .return('I')
  __label_4: # case
.annotate 'line', 667
    .return('N')
  __label_5: # case
.annotate 'line', 668
    .return('S')
  __label_6: # case
.annotate 'line', 669
    .return('P')
  __label_2: # default
.annotate 'line', 670
    .return('')
  __label_1: # switch end
# }
.annotate 'line', 672

.end # typetoregcheck


.sub 'typetopirname' :subid('WSubId_86')
        .param string __ARG_1
# Body
# {
# switch
.annotate 'line', 676
    set $S1, __ARG_1
    set $S2, 'I'
    if $S1 == $S2 goto __label_3
    set $S2, 'N'
    if $S1 == $S2 goto __label_4
    set $S2, 'S'
    if $S1 == $S2 goto __label_5
    set $S2, 'P'
    if $S1 == $S2 goto __label_6
    goto __label_2
  __label_3: # case
.annotate 'line', 677
    .return('int')
  __label_4: # case
.annotate 'line', 678
    .return('num')
  __label_5: # case
.annotate 'line', 679
    .return('string')
  __label_6: # case
.annotate 'line', 680
    .return('pmc')
  __label_2: # default
.const 'Sub' $P1 = 'WSubId_6'
.annotate 'line', 681
    $P1('Invalid reg type')
  __label_1: # switch end
# }
.annotate 'line', 683

.end # typetopirname

# Constant INDENT evaluated at compile time
# Constant INDENTLABEL evaluated at compile time
.namespace [ 'Emit' ]

.sub 'Emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 703
    setattribute self, 'handle', __ARG_1
.annotate 'line', 704
    box $P1, ''
    setattribute self, 'file', $P1
.annotate 'line', 705
    box $P1, 0
    setattribute self, 'line', $P1
.annotate 'line', 706
    box $P1, 0
    setattribute self, 'pendingf', $P1
.annotate 'line', 707
    box $P1, 0
    setattribute self, 'pendingl', $P1
# }
.annotate 'line', 708

.end # Emit


.sub 'disable_annotations' :method
# Body
# {
.annotate 'line', 711
    box $P1, 1
    setattribute self, 'noan', $P1
# }
.annotate 'line', 712

.end # disable_annotations


.sub 'close' :method
# Body
# {
.annotate 'line', 715
    null $P1
    setattribute self, 'handle', $P1
# }
.annotate 'line', 716

.end # close


.sub 'updateannot' :method
# Body
# {
.annotate 'line', 719
    getattribute $P1, self, 'pendingf'
    if_null $P1, __label_1
    unless $P1 goto __label_1
# {
.annotate 'line', 720
    getattribute $P2, self, 'handle'
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, ".annotate 'file', '"
    push $P3, $P4
.annotate 'line', 722
    getattribute $P5, self, 'file'
.annotate 'line', 720
    push $P3, $P5
    box $P4, "'\n"
    push $P3, $P4
# predefined join
    join $S1, "", $P3
    $P2.'print'($S1)
.annotate 'line', 725
    getattribute $P1, self, 'pendingf'
    assign $P1, 0
# }
  __label_1: # endif
.annotate 'line', 727
    getattribute $P1, self, 'pendingl'
    if_null $P1, __label_2
    unless $P1 goto __label_2
# {
.annotate 'line', 728
    getattribute $P2, self, 'handle'
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, ".annotate 'line', "
    push $P3, $P4
.annotate 'line', 730
    getattribute $P5, self, 'line'
.annotate 'line', 728
    push $P3, $P5
    box $P4, "\n"
    push $P3, $P4
# predefined join
    join $S1, "", $P3
    $P2.'print'($S1)
.annotate 'line', 733
    getattribute $P1, self, 'pendingl'
    assign $P1, 0
# }
  __label_2: # endif
# }
.annotate 'line', 735

.end # updateannot


.sub 'vprint' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 738
    iter $P2, __ARG_1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $P1, $P2
.annotate 'line', 739
    getattribute $P3, self, 'handle'
    $P3.'print'($P1)
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 740

.end # vprint


.sub 'print' :method
        .param pmc __ARG_1 :slurpy
# Body
# {
.annotate 'line', 743
    self.'updateannot'()
.annotate 'line', 744
    self.'vprint'(__ARG_1)
# }
.annotate 'line', 745

.end # print


.sub 'say' :method
        .param pmc __ARG_1 :slurpy
# Body
# {
.annotate 'line', 748
    self.'updateannot'()
.annotate 'line', 749
    self.'vprint'(__ARG_1)
.annotate 'line', 750
    getattribute $P1, self, 'handle'
    $P1.'print'("\n")
# }
.annotate 'line', 751

.end # say


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 754
    getattribute $P3, self, 'noan'
    unless_null $P3, __label_1
# {
.annotate 'line', 756
# var file: $P1
    getattribute $P1, self, 'file'
.annotate 'line', 757
# var line: $P2
    getattribute $P2, self, 'line'
.annotate 'line', 758
# tfile: $S1
    getattribute $P3, __ARG_1, 'file'
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
.annotate 'line', 759
# tline: $I1
    getattribute $P3, __ARG_1, 'line'
    set $I1, $P3
.annotate 'line', 760
    set $S2, $P1
    eq $S2, $S1, __label_3
# {
.annotate 'line', 761
    assign $P1, $S1
.annotate 'line', 762
    getattribute $P3, self, 'pendingf'
    assign $P3, 1
.annotate 'line', 763
    assign $P2, 0
# }
  __label_3: # endif
.annotate 'line', 765
    set $I2, $P2
    eq $I2, $I1, __label_4
# {
.annotate 'line', 766
    assign $P2, $I1
.annotate 'line', 767
    getattribute $P3, self, 'pendingl'
    assign $P3, 1
# }
  __label_4: # endif
# }
  __label_1: # endif
# }
.annotate 'line', 770

.end # annotate


.sub 'comment' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 773
    self.'updateannot'()
.annotate 'line', 774
    getattribute $P1, self, 'handle'
    concat $S1, '# ', __ARG_1
    concat $S1, $S1, "\n"
    $P1.'print'($S1)
# }
.annotate 'line', 775

.end # comment


.sub 'emitlabel' :method
        .param string __ARG_1
        .param string __ARG_2 :optional
# Body
# {
.annotate 'line', 778
# var handle: $P1
    getattribute $P1, self, 'handle'
.annotate 'line', 779
    $P1.'print'('  ')
.annotate 'line', 780
    $P1.'print'(__ARG_1)
.annotate 'line', 781
    $P1.'print'(':')
.annotate 'line', 782
    if_null __ARG_2, __label_1
.annotate 'line', 783
    concat $S1, ' # ', __ARG_2
    $P1.'print'($S1)
  __label_1: # endif
.annotate 'line', 784
    $P1.'print'("\n")
# }
.annotate 'line', 785

.end # emitlabel


.sub 'emitgoto' :method
        .param string __ARG_1
        .param string __ARG_2 :optional
# Body
# {
.annotate 'line', 788
# var handle: $P1
    getattribute $P1, self, 'handle'
.annotate 'line', 789
    $P1.'print'('    goto ')
.annotate 'line', 790
    $P1.'print'(__ARG_1)
.annotate 'line', 791
    if_null __ARG_2, __label_1
.annotate 'line', 792
    concat $S1, ' # ', __ARG_2
    $P1.'print'($S1)
  __label_1: # endif
.annotate 'line', 793
    $P1.'print'("\n")
# }
.annotate 'line', 794

.end # emitgoto


.sub 'emitarg1' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 798
    concat $S1, '    ', __ARG_1
    concat $S1, $S1, ' '
    concat $S1, $S1, __ARG_2
    self.'say'($S1)
# }
.annotate 'line', 799

.end # emitarg1


.sub 'emitarg2' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 802
    concat $S1, '    ', __ARG_1
    concat $S1, $S1, ' '
    concat $S1, $S1, __ARG_2
    concat $S1, $S1, ', '
    concat $S1, $S1, __ARG_3
    self.'say'($S1)
# }
.annotate 'line', 803

.end # emitarg2


.sub 'emitcompare' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 806
    concat $S1, '    ', __ARG_1
    concat $S1, $S1, ' '
    concat $S1, $S1, __ARG_2
    concat $S1, $S1, ', '
    concat $S1, $S1, __ARG_3
    concat $S1, $S1, ', '
    concat $S1, $S1, __ARG_4
    self.'say'($S1)
# }
.annotate 'line', 807

.end # emitcompare


.sub 'emitif' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 810
    self.'say'('    if ', __ARG_1, ' goto ', __ARG_2)
# }
.annotate 'line', 811

.end # emitif


.sub 'emitunless' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 814
    self.'say'('    unless ', __ARG_1, ' goto ', __ARG_2)
# }
.annotate 'line', 815

.end # emitunless


.sub 'emitif_null' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 818
    self.'say'('    if_null ', __ARG_1, ', ', __ARG_2)
# }
.annotate 'line', 819

.end # emitif_null


.sub 'emitnull' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 822
    self.'say'("    null ", __ARG_1)
# }
.annotate 'line', 823

.end # emitnull


.sub 'emitinc' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 827
    self.'say'('    inc ', __ARG_1)
# }
.annotate 'line', 828

.end # emitinc


.sub 'emitdec' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 831
    self.'say'('    dec ', __ARG_1)
# }
.annotate 'line', 832

.end # emitdec


.sub 'emitset' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 835
    self.'say'("    set ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 836

.end # emitset


.sub 'emitassign' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 839
    self.'say'("    assign ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 840

.end # emitassign


.sub 'emitbox' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 843
    self.'say'("    box ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 844

.end # emitbox


.sub 'emitunbox' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 847
    self.'say'("    unbox ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 848

.end # emitunbox


.sub 'emitbinop' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 851
    self.'say'('    ', __ARG_1, " ", __ARG_2, ", ", __ARG_3, ", ", __ARG_4)
# }
.annotate 'line', 852

.end # emitbinop


.sub 'emitaddto' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 855
    self.'say'("    add ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 856

.end # emitaddto


.sub 'emitsubto' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 859
    self.'say'("    sub ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 860

.end # emitsubto


.sub 'emitadd' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 863
    self.'say'("    add ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 864

.end # emitadd


.sub 'emitsub' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 867
    self.'say'("    sub ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 868

.end # emitsub


.sub 'emitmul' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 871
    self.'say'("    mul ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 872

.end # emitmul


.sub 'emitdiv' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 875
    self.'say'("    div ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 876

.end # emitdiv


.sub 'emitconcat1' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 879
    self.'say'("    concat ", __ARG_1, ", ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 880

.end # emitconcat1


.sub 'emitconcat' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 883
    self.'say'("    concat ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 884

.end # emitconcat


.sub 'emitrepeat' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 887
    self.'say'("    repeat ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 888

.end # emitrepeat


.sub 'emitprint' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 891
    self.'say'('    print ', __ARG_1)
# }
.annotate 'line', 892

.end # emitprint


.sub 'emitsay' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 895
    self.'say'('    say ', __ARG_1)
# }
.annotate 'line', 896

.end # emitsay


.sub 'emitfind_lex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 899
    concat $S1, "    find_lex ", __ARG_1
    concat $S1, $S1, ", '"
    concat $S1, $S1, __ARG_2
    concat $S1, $S1, "'"
    self.'say'($S1)
# }
.annotate 'line', 900

.end # emitfind_lex

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Emit' ]
.annotate 'line', 694
    addattribute $P0, 'handle'
.annotate 'line', 695
    addattribute $P0, 'file'
.annotate 'line', 696
    addattribute $P0, 'line'
.annotate 'line', 697
    addattribute $P0, 'pendingf'
.annotate 'line', 698
    addattribute $P0, 'pendingl'
.annotate 'line', 699
    addattribute $P0, 'noan'
.end
.namespace [ ]

.sub 'integerValue' :subid('WSubId_16')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 909
    new $P2, [ 'IntegerLiteral' ]
    $P2.'IntegerLiteral'(__ARG_1, __ARG_2, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 910

.end # integerValue


.sub 'floatValue' :subid('WSubId_50')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param num __ARG_3
# Body
# {
.annotate 'line', 914
# var t: $P1
    new $P1, [ 'TokenFloat' ]
    getattribute $P2, __ARG_2, 'file'
    getattribute $P3, __ARG_2, 'line'
    $P1.'TokenFloat'($P2, $P3, __ARG_3)
.annotate 'line', 915
    new $P3, [ 'FloatLiteral' ]
    $P3.'FloatLiteral'(__ARG_1, $P1)
    set $P2, $P3
    .return($P2)
# }
.annotate 'line', 916

.end # floatValue


.sub 'floatresult' :subid('WSubId_51')
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 924
# result: $I1
    iseq $I1, __ARG_1, 'N'
    unless $I1 goto __label_2
    iseq $I1, __ARG_2, 'N'
    if $I1 goto __label_3
    iseq $I1, __ARG_2, 'I'
  __label_3:
  __label_2:
    if $I1 goto __label_1
.annotate 'line', 925
    iseq $I1, __ARG_2, 'N'
    unless $I1 goto __label_4
    iseq $I1, __ARG_1, 'N'
    if $I1 goto __label_5
    iseq $I1, __ARG_1, 'I'
  __label_5:
  __label_4:
  __label_1:
.annotate 'line', 926
    .return($I1)
# }
.annotate 'line', 927

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
.annotate 'line', 964
# l: $I2
# predefined length
    length $I3, __ARG_2
    sub $I2, $I3, 1
.annotate 'line', 965
# predefined substr
    substr $S1, __ARG_2, $I2, 1
    ne $S1, "\n", __label_1
.annotate 'line', 966
# predefined substr
    substr __ARG_2, __ARG_2, 0, $I2
  __label_1: # endif
.annotate 'line', 967
# predefined split
    split $P1, "\n", __ARG_2
# predefined join
    join $S1, "\n    ", $P1
    concat $S0, '    ', $S1
    set __ARG_2, $S0
.annotate 'line', 968
    box $P1, __ARG_2
    setattribute self, 'body', $P1
.annotate 'line', 969
    box $P1, __ARG_1
    setattribute self, 'typeresult', $P1
# }
.annotate 'line', 970

.end # Predef_frombody


.sub 'invoke' :method :vtable
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 973
# typeresult: $S1
    getattribute $P2, self, 'typeresult'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 975
    ne $S1, 'v', __label_2
# {
.annotate 'line', 976
    isnull $I1, __ARG_3
    not $I1
    unless $I1 goto __label_5
    isne $I1, __ARG_3, ''
  __label_5:
    unless $I1 goto __label_4
.const 'Sub' $P3 = 'WSubId_1'
.annotate 'line', 977
    $P3('using return value from void predef')
  __label_4: # endif
# }
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 980
    isnull $I1, __ARG_3
    if $I1 goto __label_7
    iseq $I1, __ARG_3, ''
  __label_7:
    unless $I1 goto __label_6
.const 'Sub' $P4 = 'WSubId_6'
.annotate 'line', 981
    $P4('Bad result in non void predef')
  __label_6: # endif
# }
  __label_3: # endif
.annotate 'line', 984
# var builder: $P1
    new $P1, [ 'StringBuilder' ]
.annotate 'line', 985
    getattribute $P2, self, 'body'
    $P1.'append_format'($P2, __ARG_3, __ARG_4 :flat)
.annotate 'line', 986
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 987
# predefined string
    set $S2, $P1
    __ARG_1.'say'($S2)
# }
.annotate 'line', 988

.end # invoke

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Predef_frombody' ]
.annotate 'line', 950
    addattribute $P0, 'body'
.annotate 'line', 951
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
.annotate 'line', 1009
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 1010
    isa $I2, __ARG_2, 'String'
    unless $I2 goto __label_1
.annotate 'line', 1011
    new $P3, [ 'Predef_frombody' ]
    $P3.'Predef_frombody'(__ARG_3, __ARG_2)
    set $P2, $P3
    setattribute self, 'body', $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 1013
    setattribute self, 'body', __ARG_2
  __label_2: # endif
.annotate 'line', 1014
    box $P1, __ARG_3
    setattribute self, 'typeresult', $P1
.annotate 'line', 1015
# n: $I1
    null $I1
.annotate 'line', 1016
    if_null __ARG_4, __label_3
# {
.annotate 'line', 1017
    box $P1, __ARG_4
    setattribute self, 'type0', $P1
# switch
.annotate 'line', 1018
    set $S1, __ARG_4
    set $S2, '*'
    if $S1 == $S2 goto __label_6
    set $S2, '!'
    if $S1 == $S2 goto __label_7
    goto __label_5
  __label_6: # case
.annotate 'line', 1020
    set $I1, -1
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 1023
    set $I1, -2
.annotate 'line', 1024
    if_null __ARG_5, __label_8
.const 'Sub' $P5 = 'WSubId_6'
.annotate 'line', 1025
    concat $S3, "Invalid predef '", __ARG_1
    concat $S3, $S3, '"'
    $P5($S3)
  __label_8: # endif
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 1028
    set $I1, 1
.annotate 'line', 1029
    if_null __ARG_5, __label_9
# {
.annotate 'line', 1030
    box $P1, __ARG_5
    setattribute self, 'type1', $P1
.annotate 'line', 1031
    inc $I1
# }
  __label_9: # endif
.annotate 'line', 1033
    if_null __ARG_6, __label_10
# {
.annotate 'line', 1034
    box $P1, __ARG_6
    setattribute self, 'type2', $P1
.annotate 'line', 1035
    inc $I1
# }
  __label_10: # endif
.annotate 'line', 1037
    if_null __ARG_7, __label_11
# {
.annotate 'line', 1038
    box $P1, __ARG_7
    setattribute self, 'type3', $P1
.annotate 'line', 1039
    inc $I1
# }
  __label_11: # endif
  __label_4: # switch end
# }
  __label_3: # endif
.annotate 'line', 1043
    box $P1, $I1
    setattribute self, 'nparams', $P1
# }
.annotate 'line', 1044

.end # PredefBase


.sub 'name' :method
# Body
# {
.annotate 'line', 1047
# name: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 1048
    .return($S1)
# }
.annotate 'line', 1049

.end # name


.sub 'result' :method
# Body
# {
.annotate 'line', 1052
    getattribute $P1, self, 'typeresult'
    .return($P1)
# }
.annotate 'line', 1053

.end # result


.sub 'params' :method
# Body
# {
.annotate 'line', 1054
    getattribute $P1, self, 'nparams'
    .return($P1)
# }

.end # params


.sub 'paramtype' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 1057
# type: $S1
    null $S1
# switch
.annotate 'line', 1058
    set $I1, __ARG_1
    null $I2
    if $I1 == $I2 goto __label_3
    set $I2, 1
    if $I1 == $I2 goto __label_4
    set $I2, 2
    if $I1 == $I2 goto __label_5
    set $I2, 3
    if $I1 == $I2 goto __label_6
    goto __label_2
  __label_3: # case
.annotate 'line', 1059
    getattribute $P1, self, 'type0'
    set $S1, $P1
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 1060
    getattribute $P2, self, 'type1'
    set $S1, $P2
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 1061
    getattribute $P3, self, 'type2'
    set $S1, $P3
    goto __label_1 # break
  __label_6: # case
.annotate 'line', 1062
    getattribute $P4, self, 'type3'
    set $S1, $P4
    goto __label_1 # break
  __label_2: # default
.const 'Sub' $P5 = 'WSubId_6'
.annotate 'line', 1064
    $P5('Invalid predef arg')
  __label_1: # switch end
.annotate 'line', 1066
    .return($S1)
# }
.annotate 'line', 1067

.end # paramtype


.sub 'expand' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 1070
# predefined string
    getattribute $P2, self, 'name'
    set $S2, $P2
    concat $S3, 'predefined ', $S2
    __ARG_1.'comment'($S3)
.annotate 'line', 1071
# typeresult: $S1
    getattribute $P2, self, 'typeresult'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1072
    isne $I1, $S1, 'v'
    unless $I1 goto __label_3
    iseq $I1, __ARG_4, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 1073
    $P2 = __ARG_2.'tempreg'($S1)
    set __ARG_4, $P2
  __label_2: # endif
.annotate 'line', 1074
# var fun: $P1
    getattribute $P1, self, 'body'
.annotate 'line', 1075
    $P1(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
# }
.annotate 'line', 1076

.end # expand

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'PredefBase' ]
.annotate 'line', 993
    addattribute $P0, 'name'
.annotate 'line', 994
    addattribute $P0, 'body'
.annotate 'line', 995
    addattribute $P0, 'typeresult'
.annotate 'line', 996
    addattribute $P0, 'type0'
.annotate 'line', 997
    addattribute $P0, 'type1'
.annotate 'line', 998
    addattribute $P0, 'type2'
.annotate 'line', 999
    addattribute $P0, 'type3'
.annotate 'line', 1000
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
.annotate 'line', 1088
    self.'PredefBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7)
# }
.annotate 'line', 1089

.end # PredefFunction

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'PredefFunction' ]
.annotate 'line', 1079
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
.annotate 'line', 1102
    self.'PredefBase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7, __ARG_8)
.annotate 'line', 1103
    setattribute self, 'evalfun', __ARG_2
# }
.annotate 'line', 1104

.end # PredefFunctionEval

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'PredefFunctionEval' ]
.annotate 'line', 1092
    get_class $P1, [ 'PredefBase' ]
    addparent $P0, $P1
.annotate 'line', 1094
    addattribute $P0, 'evalfun'
.end
.namespace [ 'Predef_typecast' ]

.sub 'Predef_typecast' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1112
    box $P1, __ARG_1
    setattribute self, 'type', $P1
# }
.annotate 'line', 1113

.end # Predef_typecast


.sub 'invoke' :method :vtable
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 1116
# type: $S1
    getattribute $P2, self, 'type'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1117
# predefined elements
    elements $I1, __ARG_4
    eq $I1, 1, __label_2
.const 'Sub' $P3 = 'WSubId_6'
.annotate 'line', 1118
    $P3("Invalid Predef_typecast.invoke call")
  __label_2: # endif
.annotate 'line', 1119
# var rawarg: $P1
    $P1 = __ARG_4[0]
.annotate 'line', 1120
# argtype: $S2
    $P2 = $P1.'checkresult'()
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
# switch-case
.annotate 'line', 1122
    iseq $I1, $S2, $S1
    if $I1 goto __label_6
.annotate 'line', 1123
    isa $I1, $P1, [ 'IndexExpr' ]
    if $I1 goto __label_7
    goto __label_5
  __label_6: # case
  __label_7: # case
.annotate 'line', 1124
    $P1.'emit'(__ARG_1, __ARG_3)
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 1127
# arg: $S3
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P2, __label_8
    set $S3, $P2
  __label_8:
.annotate 'line', 1128
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1130
    ne $S3, 'null', __label_9
.annotate 'line', 1131
    __ARG_1.'emitnull'(__ARG_3)
    goto __label_10
  __label_9: # else
.annotate 'line', 1133
    __ARG_1.'emitset'(__ARG_3, $S3)
  __label_10: # endif
  __label_4: # switch end
# }
.annotate 'line', 1135

.end # invoke

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Predef_typecast' ]
.annotate 'line', 1109
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
    lt $I1, 0, __label_1
# {
# for loop
.annotate 'line', 1143
# i: $I2
    null $I2
  __label_5: # for condition
    ge $I2, $I1, __label_4
.annotate 'line', 1144
    $P1 = __ARG_4[$I2]
    __ARG_1.'emitprint'($P1)
  __label_3: # for iteration
.annotate 'line', 1143
    inc $I2
    goto __label_5
  __label_4: # for end
.annotate 'line', 1145
    $P1 = __ARG_4[$I1]
    __ARG_1.'emitsay'($P1)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 1148
    __ARG_1.'emitsay'("''")
  __label_2: # endif
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
    iter $P1, __ARG_4
    set $P1, 0
  __label_1: # for iteration
    unless $P1 goto __label_2
    shift $S1, $P1
.annotate 'line', 1156
    __ARG_1.'say'('    ', "print $P0, ", $S1)
    goto __label_1
  __label_2: # endfor
.annotate 'line', 1157
    __ARG_1.'say'('    ', "print $P0, \"\\n\"")
# }
.annotate 'line', 1158

.end # Predef_cry


.sub 'Predef_print'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 1162
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1163
    iter $P1, __ARG_4
    set $P1, 0
  __label_1: # for iteration
    unless $P1 goto __label_2
    shift $S1, $P1
.annotate 'line', 1164
    __ARG_1.'emitprint'($S1)
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 1165

.end # Predef_print


.sub 'Predef_invoke'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 1171
# var arg: $P1
    $P1 = __ARG_4[0]
.annotate 'line', 1172
    isa $I2, $P1, [ 'CallExpr' ]
    not $I1, $I2
    unless $I1 goto __label_1
.const 'Sub' $P2 = 'WSubId_1'
.annotate 'line', 1173
    $P2("invoke argument must be callable", __ARG_2)
  __label_1: # endif
.annotate 'line', 1174
    concat $S1, "(", __ARG_3
    concat $S1, $S1, " :call_sig)"
    $P1.'emit'(__ARG_1, $S1)
# }
.annotate 'line', 1175

.end # Predef_invoke


.sub 'predefeval_length' :subid('WSubId_17')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1179
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1180
# s: $S1
    $P2 = $P1.'get_value'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1181
.const 'Sub' $P3 = 'WSubId_16'
# predefined length
.annotate 'line', 1178
    length $I1, $S1
.annotate 'line', 1181
    .tailcall $P3(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1182

.end # predefeval_length


.sub 'predefeval_bytelength' :subid('WSubId_18')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1186
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1187
# s: $S1
    $P2 = $P1.'get_value'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1188
.const 'Sub' $P3 = 'WSubId_16'
# predefined bytelength
.annotate 'line', 1185
    bytelength $I1, $S1
.annotate 'line', 1188
    .tailcall $P3(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1189

.end # predefeval_bytelength


.sub 'predefeval_ord' :subid('WSubId_20')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1193
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1194
# s: $S1
    $P2 = $P1.'get_value'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1195
.const 'Sub' $P3 = 'WSubId_16'
# predefined ord
.annotate 'line', 1192
    ord $I1, $S1
.annotate 'line', 1195
    .tailcall $P3(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1196

.end # predefeval_ord


.sub 'predefeval_ord_n' :subid('WSubId_21')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1200
# var arg: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1201
# s: $S1
    $P3 = $P1.'get_value'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 1202
# var argn: $P2
    $P3 = __ARG_3[1]
    getattribute $P2, $P3, 'arg'
.annotate 'line', 1203
# n: $I1
    getattribute $P3, $P2, 'numval'
    set $I1, $P3
.annotate 'line', 1204
.const 'Sub' $P4 = 'WSubId_16'
# predefined ord
.annotate 'line', 1199
    ord $I2, $S1, $I1
.annotate 'line', 1204
    .tailcall $P4(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 1205

.end # predefeval_ord_n


.sub 'predefeval_chr' :subid('WSubId_19')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1209
# var arg: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1211
# n: $I1
    getattribute $P3, $P1, 'numval'
    set $I1, $P3
.annotate 'line', 1212
# s: $S1
# predefined chr
    chr $S0, $I1
    find_encoding $I0, 'utf8'
    trans_encoding $S1, $S0, $I0
.annotate 'line', 1214
# var t: $P2
    new $P2, [ 'TokenQuoted' ]
    getattribute $P3, __ARG_2, 'file'
    getattribute $P4, __ARG_2, 'line'
    $P2.'TokenQuoted'($P3, $P4, $S1)
.annotate 'line', 1215
    new $P4, [ 'StringLiteral' ]
    $P4.'StringLiteral'(__ARG_1, $P2)
    set $P3, $P4
    .return($P3)
# }
.annotate 'line', 1216

.end # predefeval_chr


.sub 'predefeval_substr' :subid('WSubId_22')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1220
# var argstr: $P1
    $P4 = __ARG_3[0]
    getattribute $P1, $P4, 'arg'
.annotate 'line', 1221
# var argpos: $P2
    $P4 = __ARG_3[1]
    getattribute $P2, $P4, 'arg'
.annotate 'line', 1222
# str: $S1
    $P4 = $P1.'get_value'()
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 1223
# pos: $I1
    getattribute $P4, $P2, 'numval'
    set $I1, $P4
.annotate 'line', 1225
# var t: $P3
    new $P3, [ 'TokenQuoted' ]
    getattribute $P4, __ARG_2, 'file'
    getattribute $P5, __ARG_2, 'line'
# predefined substr
    substr $S2, $S1, $I1
    $P3.'TokenQuoted'($P4, $P5, $S2)
.annotate 'line', 1226
    new $P5, [ 'StringLiteral' ]
    $P5.'StringLiteral'(__ARG_1, $P3)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 1227

.end # predefeval_substr


.sub 'predefeval_substr_l' :subid('WSubId_23')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1231
# var argstr: $P1
    $P5 = __ARG_3[0]
    getattribute $P1, $P5, 'arg'
.annotate 'line', 1232
# var argpos: $P2
    $P5 = __ARG_3[1]
    getattribute $P2, $P5, 'arg'
.annotate 'line', 1233
# var arglen: $P3
    $P5 = __ARG_3[2]
    getattribute $P3, $P5, 'arg'
.annotate 'line', 1234
# str: $S1
    $P5 = $P1.'get_value'()
    null $S1
    if_null $P5, __label_1
    set $S1, $P5
  __label_1:
.annotate 'line', 1235
# pos: $I1
    getattribute $P5, $P2, 'numval'
    set $I1, $P5
.annotate 'line', 1236
# len: $I2
    getattribute $P5, $P3, 'numval'
    set $I2, $P5
.annotate 'line', 1238
# var t: $P4
    new $P4, [ 'TokenQuoted' ]
    getattribute $P5, __ARG_2, 'file'
    getattribute $P6, __ARG_2, 'line'
# predefined substr
    substr $S2, $S1, $I1, $I2
    $P4.'TokenQuoted'($P5, $P6, $S2)
.annotate 'line', 1239
    new $P6, [ 'StringLiteral' ]
    $P6.'StringLiteral'(__ARG_1, $P4)
    set $P5, $P6
    .return($P5)
# }
.annotate 'line', 1240

.end # predefeval_substr_l


.sub 'predefeval_indexof' :subid('WSubId_24')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1244
# var argstrfrom: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1245
# var argstrsearch: $P2
    $P3 = __ARG_3[1]
    getattribute $P2, $P3, 'arg'
.annotate 'line', 1246
# strfrom: $S1
    $P3 = $P1.'get_value'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 1247
# strsearch: $S2
    $P3 = $P2.'get_value'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 1248
.const 'Sub' $P4 = 'WSubId_16'
# predefined indexof
.annotate 'line', 1243
    index $I1, $S1, $S2
.annotate 'line', 1248
    .tailcall $P4(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1249

.end # predefeval_indexof


.sub 'predefeval_indexof_pos' :subid('WSubId_25')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1253
# var argstrfrom: $P1
    $P4 = __ARG_3[0]
    getattribute $P1, $P4, 'arg'
.annotate 'line', 1254
# var argstrsearch: $P2
    $P4 = __ARG_3[1]
    getattribute $P2, $P4, 'arg'
.annotate 'line', 1255
# var argpos: $P3
    $P4 = __ARG_3[2]
    getattribute $P3, $P4, 'arg'
.annotate 'line', 1256
# strfrom: $S1
    $P4 = $P1.'get_value'()
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 1257
# strsearch: $S2
    $P4 = $P2.'get_value'()
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 1258
# pos: $I1
    getattribute $P4, $P3, 'numval'
    set $I1, $P4
.annotate 'line', 1259
.const 'Sub' $P5 = 'WSubId_16'
# predefined indexof
.annotate 'line', 1252
    index $I2, $S1, $S2, $I1
.annotate 'line', 1259
    .tailcall $P5(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 1260

.end # predefeval_indexof_pos


.sub 'getpredefs' :subid('WSubId_26')
# Body
# {
.const 'Sub' $P2 = "WSubId_17"
.const 'Sub' $P3 = "WSubId_18"
.const 'Sub' $P4 = "WSubId_19"
.const 'Sub' $P5 = "WSubId_20"
.const 'Sub' $P6 = "WSubId_21"
.const 'Sub' $P7 = "WSubId_22"
.const 'Sub' $P8 = "WSubId_23"
.const 'Sub' $P9 = "WSubId_24"
.const 'Sub' $P10 = "WSubId_25"
.annotate 'line', 1273
.const 'Sub' $P11 = 'Predef_print'
.const 'Sub' $P12 = 'Predef_say'
.const 'Sub' $P13 = 'Predef_cry'
.const 'Sub' $P14 = 'Predef_invoke'
.annotate 'line', 1275
# var predefs: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1276
    new $P17, [ 'PredefFunction' ]
.annotate 'line', 1277
    new $P19, [ 'Predef_typecast' ]
    $P19.'Predef_typecast'('I')
    set $P18, $P19
    $P17.'PredefFunction'('int', $P18, 'I', '!')
    set $P16, $P17
.annotate 'line', 1275
    push $P1, $P16
.annotate 'line', 1280
    new $P21, [ 'PredefFunction' ]
.annotate 'line', 1281
    new $P23, [ 'Predef_typecast' ]
    $P23.'Predef_typecast'('N')
    set $P22, $P23
    $P21.'PredefFunction'('float', $P22, 'N', '!')
    set $P20, $P21
.annotate 'line', 1275
    push $P1, $P20
.annotate 'line', 1284
    new $P25, [ 'PredefFunction' ]
.annotate 'line', 1285
    new $P27, [ 'Predef_typecast' ]
    $P27.'Predef_typecast'('S')
    set $P26, $P27
    $P25.'PredefFunction'('string', $P26, 'S', '!')
    set $P24, $P25
.annotate 'line', 1275
    push $P1, $P24
.annotate 'line', 1288
    new $P29, [ 'PredefFunction' ]
    $P29.'PredefFunction'('die', 'die %1', 'v', 'S')
    set $P28, $P29
.annotate 'line', 1275
    push $P1, $P28
.annotate 'line', 1292
    new $P31, [ 'PredefFunction' ]
    $P31.'PredefFunction'('exit', 'exit %1', 'v', 'I')
    set $P30, $P31
.annotate 'line', 1275
    push $P1, $P30
.annotate 'line', 1296
    new $P33, [ 'PredefFunction' ]
    $P33.'PredefFunction'('time', 'time %0', 'I')
    set $P32, $P33
.annotate 'line', 1275
    push $P1, $P32
.annotate 'line', 1300
    new $P35, [ 'PredefFunction' ]
    $P35.'PredefFunction'('floattime', 'time %0', 'N')
    set $P34, $P35
.annotate 'line', 1275
    push $P1, $P34
.annotate 'line', 1304
    new $P37, [ 'PredefFunction' ]
    $P37.'PredefFunction'('spawnw', 'spawnw %0, %1', 'I', 'P')
    set $P36, $P37
.annotate 'line', 1275
    push $P1, $P36
.annotate 'line', 1308
    new $P39, [ 'PredefFunction' ]
    $P39.'PredefFunction'('getstdin', 'getstdin %0', 'P')
    set $P38, $P39
.annotate 'line', 1275
    push $P1, $P38
.annotate 'line', 1312
    new $P41, [ 'PredefFunction' ]
    $P41.'PredefFunction'('getstdout', 'getstdout %0', 'P')
    set $P40, $P41
.annotate 'line', 1275
    push $P1, $P40
.annotate 'line', 1316
    new $P43, [ 'PredefFunction' ]
    $P43.'PredefFunction'('getstderr', 'getstderr %0', 'P')
    set $P42, $P43
.annotate 'line', 1275
    push $P1, $P42
.annotate 'line', 1320
    new $P45, [ 'PredefFunction' ]
    $P45.'PredefFunction'('open', "root_new %0, ['parrot';'FileHandle']\n%0.'open'(%1)\n", 'P', 'S')
    set $P44, $P45
.annotate 'line', 1275
    push $P1, $P44
.annotate 'line', 1327
    new $P47, [ 'PredefFunction' ]
    $P47.'PredefFunction'('open', "root_new %0, ['parrot';'FileHandle']\n%0.'open'(%1,%2)\n", 'P', 'S', 'S')
    set $P46, $P47
.annotate 'line', 1275
    push $P1, $P46
.annotate 'line', 1334
    new $P49, [ 'PredefFunction' ]
    $P49.'PredefFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n", 'P', 'S')
    set $P48, $P49
.annotate 'line', 1275
    push $P1, $P48
.annotate 'line', 1341
    new $P51, [ 'PredefFunction' ]
    $P51.'PredefFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n", 'P', 'S', 'I')
    set $P50, $P51
.annotate 'line', 1275
    push $P1, $P50
.annotate 'line', 1349
    new $P53, [ 'PredefFunction' ]
    $P53.'PredefFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n%0['type'] = %3\n", 'P', 'S', 'I', 'I')
    set $P52, $P53
.annotate 'line', 1275
    push $P1, $P52
.annotate 'line', 1358
    new $P55, [ 'PredefFunction' ]
    $P55.'PredefFunction'('elements', 'elements %0, %1', 'I', 'P')
    set $P54, $P55
.annotate 'line', 1275
    push $P1, $P54
.annotate 'line', 1362
    new $P57, [ 'PredefFunctionEval' ]
.annotate 'line', 1363
    $P57.'PredefFunctionEval'('length', $P2, 'length %0, %1', 'I', 'S')
    set $P56, $P57
.annotate 'line', 1275
    push $P1, $P56
.annotate 'line', 1367
    new $P59, [ 'PredefFunctionEval' ]
.annotate 'line', 1368
    $P59.'PredefFunctionEval'('bytelength', $P3, 'bytelength %0, %1', 'I', 'S')
    set $P58, $P59
.annotate 'line', 1275
    push $P1, $P58
.annotate 'line', 1372
    new $P61, [ 'PredefFunctionEval' ]
.annotate 'line', 1373
    $P61.'PredefFunctionEval'('chr', $P4, "chr $S0, %1\nfind_encoding $I0, 'utf8'\ntrans_encoding %0, $S0, $I0\n", 'S', 'I')
    set $P60, $P61
.annotate 'line', 1275
    push $P1, $P60
.annotate 'line', 1381
    new $P63, [ 'PredefFunctionEval' ]
.annotate 'line', 1382
    $P63.'PredefFunctionEval'('ord', $P5, 'ord %0, %1', 'I', 'S')
    set $P62, $P63
.annotate 'line', 1275
    push $P1, $P62
.annotate 'line', 1386
    new $P65, [ 'PredefFunctionEval' ]
.annotate 'line', 1387
    $P65.'PredefFunctionEval'('ord', $P6, 'ord %0, %1, %2', 'I', 'S', 'I')
    set $P64, $P65
.annotate 'line', 1275
    push $P1, $P64
.annotate 'line', 1391
    new $P67, [ 'PredefFunctionEval' ]
.annotate 'line', 1392
    $P67.'PredefFunctionEval'('substr', $P7, 'substr %0, %1, %2', 'S', 'S', 'I')
    set $P66, $P67
.annotate 'line', 1275
    push $P1, $P66
.annotate 'line', 1396
    new $P69, [ 'PredefFunctionEval' ]
.annotate 'line', 1397
    $P69.'PredefFunctionEval'('substr', $P8, 'substr %0, %1, %2, %3', 'S', 'S', 'I', 'I')
    set $P68, $P69
.annotate 'line', 1275
    push $P1, $P68
.annotate 'line', 1401
    new $P71, [ 'PredefFunction' ]
    $P71.'PredefFunction'('replace', 'replace %0, %1, %2, %3, %4', 'S', 'S', 'I', 'I', 'S')
    set $P70, $P71
.annotate 'line', 1275
    push $P1, $P70
.annotate 'line', 1405
    new $P73, [ 'PredefFunctionEval' ]
.annotate 'line', 1406
    $P73.'PredefFunctionEval'('indexof', $P9, 'index %0, %1, %2', 'I', 'S', 'S')
    set $P72, $P73
.annotate 'line', 1275
    push $P1, $P72
.annotate 'line', 1410
    new $P75, [ 'PredefFunctionEval' ]
.annotate 'line', 1411
    $P75.'PredefFunctionEval'('indexof', $P10, 'index %0, %1, %2, %3', 'I', 'S', 'S', 'I')
    set $P74, $P75
.annotate 'line', 1275
    push $P1, $P74
.annotate 'line', 1415
    new $P77, [ 'PredefFunction' ]
    $P77.'PredefFunction'('join', 'join %0, %1, %2', 'S', 'S', 'P')
    set $P76, $P77
.annotate 'line', 1275
    push $P1, $P76
.annotate 'line', 1419
    new $P79, [ 'PredefFunction' ]
    $P79.'PredefFunction'('upcase', 'upcase %0, %1', 'S', 'S')
    set $P78, $P79
.annotate 'line', 1275
    push $P1, $P78
.annotate 'line', 1423
    new $P81, [ 'PredefFunction' ]
    $P81.'PredefFunction'('downcase', 'downcase %0, %1', 'S', 'S')
    set $P80, $P81
.annotate 'line', 1275
    push $P1, $P80
.annotate 'line', 1427
    new $P83, [ 'PredefFunction' ]
    $P83.'PredefFunction'('titlecase', 'titlecase %0, %1', 'S', 'S')
    set $P82, $P83
.annotate 'line', 1275
    push $P1, $P82
.annotate 'line', 1431
    new $P85, [ 'PredefFunction' ]
    $P85.'PredefFunction'('split', 'split %0, %1, %2', 'P', 'S', 'S')
    set $P84, $P85
.annotate 'line', 1275
    push $P1, $P84
.annotate 'line', 1435
    new $P87, [ 'PredefFunction' ]
    $P87.'PredefFunction'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n%0 = $P0(%1)\n", 'S', 'S')
    set $P86, $P87
.annotate 'line', 1275
    push $P1, $P86
.annotate 'line', 1442
    new $P89, [ 'PredefFunction' ]
    $P89.'PredefFunction'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n%0 = $P0(%1, %2)\n", 'S', 'S', 'S')
    set $P88, $P89
.annotate 'line', 1275
    push $P1, $P88
.annotate 'line', 1449
    new $P91, [ 'PredefFunction' ]
    $P91.'PredefFunction'('push', 'push %1, %2', 'v', 'P', '?')
    set $P90, $P91
.annotate 'line', 1275
    push $P1, $P90
.annotate 'line', 1453
    new $P93, [ 'PredefFunction' ]
    $P93.'PredefFunction'('sqrt', 'sqrt %0, %1', 'N', 'N')
    set $P92, $P93
.annotate 'line', 1275
    push $P1, $P92
.annotate 'line', 1457
    new $P95, [ 'PredefFunction' ]
    $P95.'PredefFunction'('pow', 'pow %0, %1, %2', 'N', 'N', 'N')
    set $P94, $P95
.annotate 'line', 1275
    push $P1, $P94
.annotate 'line', 1461
    new $P97, [ 'PredefFunction' ]
    $P97.'PredefFunction'('exp', 'exp %0, %1', 'N', 'N')
    set $P96, $P97
.annotate 'line', 1275
    push $P1, $P96
.annotate 'line', 1465
    new $P99, [ 'PredefFunction' ]
    $P99.'PredefFunction'('ln', 'ln %0, %1', 'N', 'N')
    set $P98, $P99
.annotate 'line', 1275
    push $P1, $P98
.annotate 'line', 1469
    new $P101, [ 'PredefFunction' ]
    $P101.'PredefFunction'('sin', 'sin %0, %1', 'N', 'N')
    set $P100, $P101
.annotate 'line', 1275
    push $P1, $P100
.annotate 'line', 1473
    new $P103, [ 'PredefFunction' ]
    $P103.'PredefFunction'('cos', 'cos %0, %1', 'N', 'N')
    set $P102, $P103
.annotate 'line', 1275
    push $P1, $P102
.annotate 'line', 1477
    new $P105, [ 'PredefFunction' ]
    $P105.'PredefFunction'('tan', 'tan %0, %1', 'N', 'N')
    set $P104, $P105
.annotate 'line', 1275
    push $P1, $P104
.annotate 'line', 1481
    new $P107, [ 'PredefFunction' ]
    $P107.'PredefFunction'('asin', 'asin %0, %1', 'N', 'N')
    set $P106, $P107
.annotate 'line', 1275
    push $P1, $P106
.annotate 'line', 1485
    new $P109, [ 'PredefFunction' ]
    $P109.'PredefFunction'('acos', 'acos %0, %1', 'N', 'N')
    set $P108, $P109
.annotate 'line', 1275
    push $P1, $P108
.annotate 'line', 1489
    new $P111, [ 'PredefFunction' ]
    $P111.'PredefFunction'('atan', 'atan %0, %1', 'N', 'N')
    set $P110, $P111
.annotate 'line', 1275
    push $P1, $P110
.annotate 'line', 1493
    new $P113, [ 'PredefFunction' ]
    $P113.'PredefFunction'('atan', 'atan %0, %1, %2', 'N', 'N', 'N')
    set $P112, $P113
.annotate 'line', 1275
    push $P1, $P112
.annotate 'line', 1497
    new $P115, [ 'PredefFunction' ]
    $P115.'PredefFunction'('getinterp', 'getinterp %0', 'P')
    set $P114, $P115
.annotate 'line', 1275
    push $P1, $P114
.annotate 'line', 1501
    new $P117, [ 'PredefFunction' ]
    $P117.'PredefFunction'('get_class', 'get_class %0, %1', 'P', 'S')
    set $P116, $P117
.annotate 'line', 1275
    push $P1, $P116
.annotate 'line', 1505
    new $P119, [ 'PredefFunction' ]
    $P119.'PredefFunction'('typeof', 'typeof %0, %1', 'P', 'P')
    set $P118, $P119
.annotate 'line', 1275
    push $P1, $P118
.annotate 'line', 1509
    new $P121, [ 'PredefFunction' ]
    $P121.'PredefFunction'('getattribute', 'getattribute %0, %1, %2', 'P', 'P', 'S')
    set $P120, $P121
.annotate 'line', 1275
    push $P1, $P120
.annotate 'line', 1513
    new $P123, [ 'PredefFunction' ]
    $P123.'PredefFunction'('find_method', 'find_method %0, %1, %2', 'P', 'P', 'S')
    set $P122, $P123
.annotate 'line', 1275
    push $P1, $P122
.annotate 'line', 1517
    new $P125, [ 'PredefFunction' ]
    $P125.'PredefFunction'('callmethodwithargs', '%0 = %1.%2(%3 :flat)', 'P', 'P', 'P', 'P')
    set $P124, $P125
.annotate 'line', 1275
    push $P1, $P124
.annotate 'line', 1521
    new $P127, [ 'PredefFunction' ]
    $P127.'PredefFunction'('clone', 'clone %0, %1', 'P', 'P')
    set $P126, $P127
.annotate 'line', 1275
    push $P1, $P126
.annotate 'line', 1525
    new $P129, [ 'PredefFunction' ]
    $P129.'PredefFunction'('compreg', 'compreg %0, %1', 'P', 'S')
    set $P128, $P129
.annotate 'line', 1275
    push $P1, $P128
.annotate 'line', 1529
    new $P131, [ 'PredefFunction' ]
    $P131.'PredefFunction'('compreg', 'compreg %1, %2', 'v', 'S', 'P')
    set $P130, $P131
.annotate 'line', 1275
    push $P1, $P130
.annotate 'line', 1533
    new $P133, [ 'PredefFunction' ]
    $P133.'PredefFunction'('load_language', "load_language %1\ncompreg %0, %1\n", 'P', 'S')
    set $P132, $P133
.annotate 'line', 1275
    push $P1, $P132
.annotate 'line', 1540
    new $P135, [ 'PredefFunction' ]
    $P135.'PredefFunction'('load_language', "load_language %1\ncompreg %0, %2\n", 'P', 'S', 'S')
    set $P134, $P135
.annotate 'line', 1275
    push $P1, $P134
.annotate 'line', 1547
    new $P137, [ 'PredefFunction' ]
    $P137.'PredefFunction'('loadlib', 'loadlib %0, %1', 'P', 'S')
    set $P136, $P137
.annotate 'line', 1275
    push $P1, $P136
.annotate 'line', 1551
    new $P139, [ 'PredefFunction' ]
    $P139.'PredefFunction'('load_bytecode', 'load_bytecode %1', 'v', 'S')
    set $P138, $P139
.annotate 'line', 1275
    push $P1, $P138
.annotate 'line', 1555
    new $P141, [ 'PredefFunction' ]
    $P141.'PredefFunction'('dlfunc', 'dlfunc %0, %1, %2, %3', 'P', 'P', 'S', 'S')
    set $P140, $P141
.annotate 'line', 1275
    push $P1, $P140
.annotate 'line', 1559
    new $P143, [ 'PredefFunction' ]
    $P143.'PredefFunction'('sprintf', 'sprintf %0, %1, %2', 'S', 'S', 'P')
    set $P142, $P143
.annotate 'line', 1275
    push $P1, $P142
.annotate 'line', 1563
    new $P145, [ 'PredefFunction' ]
    $P145.'PredefFunction'('sprintf', 'sprintf %0, %1, %2', 'P', 'P', 'P')
    set $P144, $P145
.annotate 'line', 1275
    push $P1, $P144
.annotate 'line', 1567
    new $P147, [ 'PredefFunction' ]
.annotate 'line', 1568
    $P147.'PredefFunction'('print', $P11, 'v', '*')
    set $P146, $P147
.annotate 'line', 1275
    push $P1, $P146
.annotate 'line', 1571
    new $P149, [ 'PredefFunction' ]
.annotate 'line', 1572
    $P149.'PredefFunction'('say', $P12, 'v', '*')
    set $P148, $P149
.annotate 'line', 1275
    push $P1, $P148
.annotate 'line', 1575
    new $P151, [ 'PredefFunction' ]
.annotate 'line', 1576
    $P151.'PredefFunction'('cry', $P13, 'v', '*')
    set $P150, $P151
.annotate 'line', 1275
    push $P1, $P150
.annotate 'line', 1579
    new $P153, [ 'PredefFunction' ]
.annotate 'line', 1580
    $P153.'PredefFunction'('invoke', $P14, 'P', '!')
    set $P152, $P153
.annotate 'line', 1275
    push $P1, $P152
  __label_2: # Infinite loop
.annotate 'line', 1585
    .yield($P1)
    goto __label_2
  __label_1: # Infinite loop end
# }
.annotate 'line', 1586

.end # getpredefs


.sub 'findpredef' :subid('WSubId_53')
        .param string __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 1590
.const 'Sub' $P3 = 'WSubId_26'
    $P2 = $P3()
    iter $P4, $P2
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
.annotate 'line', 1591
    getattribute $P5, $P1, 'name'
    set $S1, $P5
    ne $S1, __ARG_1, __label_3
# {
.annotate 'line', 1592
# pargs: $I1
    getattribute $P6, $P1, 'nparams'
    set $I1, $P6
.annotate 'line', 1593
    iseq $I2, $I1, __ARG_2
    if $I2 goto __label_6
.annotate 'line', 1594
    iseq $I2, $I1, -1
  __label_6:
    if $I2 goto __label_5
.annotate 'line', 1595
    iseq $I2, $I1, -2
    unless $I2 goto __label_7
    iseq $I2, __ARG_2, 1
  __label_7:
  __label_5:
    unless $I2 goto __label_4
.annotate 'line', 1596
    .return($P1)
  __label_4: # endif
# }
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
    null $P2
.annotate 'line', 1598
    .return($P2)
# }
.annotate 'line', 1599

.end # findpredef


.sub 'optimize_array' :subid('WSubId_28')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1607
    if_null __ARG_1, __label_1
# {
.annotate 'line', 1608
# n: $I1
# predefined elements
    elements $I1, __ARG_1
# for loop
.annotate 'line', 1609
# i: $I2
    null $I2
  __label_4: # for condition
    ge $I2, $I1, __label_3
.annotate 'line', 1610
    $P2 = __ARG_1[$I2]
    $P1 = $P2.'optimize'()
    __ARG_1[$I2] = $P1
  __label_2: # for iteration
.annotate 'line', 1609
    inc $I2
    goto __label_4
  __label_3: # for end
# }
  __label_1: # endif
# }
.annotate 'line', 1612

.end # optimize_array


.sub 'emit_array' :subid('WSubId_42')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1616
    if_null __ARG_2, __label_1
# {
.annotate 'line', 1617
    iter $P2, __ARG_2
    set $P2, 0
  __label_2: # for iteration
    unless $P2 goto __label_3
    shift $P1, $P2
.annotate 'line', 1618
    $P1.'emit'(__ARG_1)
    goto __label_2
  __label_3: # endfor
# }
  __label_1: # endif
# }
.annotate 'line', 1620

.end # emit_array


.sub 'parseDotted' :subid('WSubId_44')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1624
# var list: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1625
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 1626
    $P3 = $P2.'isidentifier'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 1627
# predefined push
    push $P1, $P2
  __label_3: # while
.annotate 'line', 1628
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_2
    unless $P3 goto __label_2
# {
.annotate 'line', 1629
    $P2 = __ARG_1.'get'()
.annotate 'line', 1630
# predefined push
    push $P1, $P2
# }
    goto __label_3
  __label_2: # endwhile
# }
  __label_1: # endif
.annotate 'line', 1633
    __ARG_1.'unget'($P2)
.annotate 'line', 1634
    .return($P1)
# }
.annotate 'line', 1635

.end # parseDotted


.sub 'parseList' :subid('WSubId_27')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4 :optional
# Body
# {
.annotate 'line', 1643
# var list: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1644
# var t: $P2
    null $P2
  __label_1: # do
.annotate 'line', 1645
# {
.annotate 'line', 1646
# var value: $P3
    $P3 = __ARG_3(__ARG_1, __ARG_2)
.annotate 'line', 1647
# predefined push
    push $P1, $P3
# }
  __label_3: # continue
.annotate 'line', 1648
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'(',')
    if_null $P4, __label_2
    if $P4 goto __label_1
  __label_2: # enddo
.annotate 'line', 1649
    unless_null __ARG_4, __label_4
.annotate 'line', 1650
    __ARG_1.'unget'($P2)
    goto __label_5
  __label_4: # else
.annotate 'line', 1652
    $P4 = $P2.'isop'(__ARG_4)
    isfalse $I1, $P4
    unless $I1 goto __label_6
.const 'Sub' $P5 = 'WSubId_1'
.annotate 'line', 1653
    $P5("Unfinished argument list", $P2)
  __label_6: # endif
  __label_5: # endif
.annotate 'line', 1654
    .return($P1)
# }
.annotate 'line', 1655

.end # parseList


.sub 'parseIdentifier' :subid('WSubId_46')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1660
    $P1 = __ARG_1.'get'()
    .tailcall $P1.'getidentifier'()
# }
.annotate 'line', 1661

.end # parseIdentifier


.sub 'toIdentifierList' :subid('WSubId_45')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1665
    new $P1, ['ResizableStringArray']
.annotate 'line', 1666
    iter $P3, __ARG_1
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P2, $P3
.annotate 'line', 1667
    $P4 = $P2.'getidentifier'()
# predefined push
    push $P1, $P4
    goto __label_1
  __label_2: # endfor
.annotate 'line', 1668
    .return($P1)
# }
.annotate 'line', 1669

.end # toIdentifierList

.namespace [ 'CommonBase' ]

.sub 'initbase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1682
    setattribute self, 'start', __ARG_1
.annotate 'line', 1683
    setattribute self, 'owner', __ARG_2
# }
.annotate 'line', 1684

.end # initbase


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1687
    getattribute $P1, self, 'start'
    __ARG_1.'annotate'($P1)
# }
.annotate 'line', 1688

.end # annotate


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1691
    getattribute $P1, self, 'owner'
    $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 1692

.end # use_predef


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 1695
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 1696

.end # generatesubid


.sub 'addlocalfunction' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1699
    getattribute $P1, self, 'owner'
    .tailcall $P1.'addlocalfunction'(__ARG_1)
# }
.annotate 'line', 1700

.end # addlocalfunction


.sub 'findns' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1703
    getattribute $P1, self, 'owner'
    .tailcall $P1.'findns'(__ARG_1)
# }
.annotate 'line', 1704

.end # findns


.sub 'findsymbol' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1707
    getattribute $P1, self, 'owner'
    .tailcall $P1.'findsymbol'(__ARG_1)
# }
.annotate 'line', 1708

.end # findsymbol


.sub 'findclasskey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1711
    getattribute $P1, self, 'owner'
    .tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 1712

.end # findclasskey


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 1715
    getattribute $P1, self, 'owner'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 1716

.end # dowarnings

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CommonBase' ]
.annotate 'line', 1677
    addattribute $P0, 'start'
.annotate 'line', 1678
    addattribute $P0, 'owner'
.end
.namespace [ 'SimpleArgList' ]

.sub 'SimpleArgList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 1731
.const 'Sub' $P1 = 'parseExpr'
.annotate 'line', 1732
.const 'Sub' $P4 = 'WSubId_27'
    $P3 = $P4(__ARG_1, __ARG_2, $P1, __ARG_3)
    setattribute self, 'args', $P3
# }
.annotate 'line', 1733

.end # SimpleArgList


.sub 'numargs' :method
# Body
# {
.annotate 'line', 1737
    getattribute $P1, self, 'args'
# predefined elements
.annotate 'line', 1736
    elements $I1, $P1
.annotate 'line', 1737
    .return($I1)
# }
.annotate 'line', 1738

.end # numargs


.sub 'getarg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 1741
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 1742
    $P2 = $P1[__ARG_1]
    .return($P2)
# }
.annotate 'line', 1743

.end # getarg


.sub 'optimizeargs' :method
# Body
# {
.const 'Sub' $P1 = 'WSubId_28'
.annotate 'line', 1747
    getattribute $P2, self, 'args'
    $P1($P2)
# }
.annotate 'line', 1748

.end # optimizeargs


.sub 'getargvalues' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1751
# var argreg: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1752
    getattribute $P3, self, 'args'
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
.annotate 'line', 1753
    $P5 = $P2.'emit_get'(__ARG_1)
# predefined push
    push $P1, $P5
    goto __label_1
  __label_2: # endfor
.annotate 'line', 1754
    .return($P1)
# }
.annotate 'line', 1755

.end # getargvalues


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1758
    $P1 = self.'getargvalues'(__ARG_1)
# predefined join
    join $S1, ', ', $P1
    __ARG_1.'print'($S1)
# }
.annotate 'line', 1759

.end # emitargs

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'SimpleArgList' ]
.annotate 'line', 1727
    addattribute $P0, 'args'
.end
.namespace [ 'Modifier' ]

.sub 'getname' :method
# Body
# {
.annotate 'line', 1771
    getattribute $P1, self, 'name'
    .return($P1)
# }

.end # getname


.sub 'numargs' :method
# Body
# {
.annotate 'line', 1774
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 1775
# nargs: $I1
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
    $I1 = $P1.'numargs'()
  __label_1:
.annotate 'line', 1776
    .return($I1)
# }
.annotate 'line', 1777

.end # numargs


.sub 'getarg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 1780
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 1781
    $P2 = $P1.'numargs'()
    set $I1, $P2
    lt __ARG_1, $I1, __label_1
.const 'Sub' $P3 = 'WSubId_6'
.annotate 'line', 1782
    $P3('Wrong modifier arg number')
  __label_1: # endif
.annotate 'line', 1783
    .tailcall $P1.'getarg'(__ARG_1)
# }
.annotate 'line', 1784

.end # getarg


.sub 'Modifier' :method
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1787
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 1788
    if_null __ARG_2, __label_1
.annotate 'line', 1789
    setattribute self, 'args', __ARG_2
  __label_1: # endif
# }
.annotate 'line', 1790

.end # Modifier


.sub 'optimize' :method
# Body
# {
.annotate 'line', 1793
    getattribute $P1, self, 'args'
    if_null $P1, __label_1
.annotate 'line', 1794
    getattribute $P2, self, 'args'
    $P2.'optimizeargs'()
  __label_1: # endif
.annotate 'line', 1795
    .return(self)
# }
.annotate 'line', 1796

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Modifier' ]
.annotate 'line', 1768
    addattribute $P0, 'name'
.annotate 'line', 1769
    addattribute $P0, 'args'
.end
.namespace [ ]

.sub 'parseModifier'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1801
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 1802
# name: $S1
    $P3 = $P1.'getidentifier'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 1803
    $P1 = __ARG_1.'get'()
.annotate 'line', 1804
# var args: $P2
    null $P2
.annotate 'line', 1805
    $P3 = $P1.'isop'('(')
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 1806
    new $P4, [ 'SimpleArgList' ]
    $P4.'SimpleArgList'(__ARG_1, __ARG_2, ')')
    set $P2, $P4
    goto __label_3
  __label_2: # else
.annotate 'line', 1808
    __ARG_1.'unget'($P1)
  __label_3: # endif
.annotate 'line', 1809
    new $P4, [ 'Modifier' ]
    $P4.'Modifier'($S1, $P2)
    set $P3, $P4
    .return($P3)
# }
.annotate 'line', 1810

.end # parseModifier

.namespace [ 'ModifierList' ]

.sub 'ModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1819
.const 'Sub' $P1 = 'parseModifier'
.annotate 'line', 1820
.const 'Sub' $P4 = 'WSubId_27'
    $P3 = $P4(__ARG_1, __ARG_2, $P1, ']')
    setattribute self, 'list', $P3
# }
.annotate 'line', 1821

.end # ModifierList


.sub 'optimize' :method
# Body
# {
.const 'Sub' $P1 = 'WSubId_28'
.annotate 'line', 1824
    getattribute $P2, self, 'list'
    $P1($P2)
# }
.annotate 'line', 1825

.end # optimize


.sub 'getlist' :method
# Body
# {
.annotate 'line', 1826
    getattribute $P1, self, 'list'
    .return($P1)
# }

.end # getlist


.sub 'pick' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1829
    getattribute $P2, self, 'list'
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
# {
.annotate 'line', 1830
    $P4 = $P1.'getname'()
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
.annotate 'line', 1831
    .return($P1)
  __label_3: # endif
# }
    goto __label_1
  __label_2: # endfor
    null $P2
.annotate 'line', 1833
    .return($P2)
# }
.annotate 'line', 1834

.end # pick

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ModifierList' ]
.annotate 'line', 1815
    addattribute $P0, 'list'
.end
.namespace [ ]

.sub 'getparrotkey' :subid('WSubId_47')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1843
# s: $S1
# predefined join
    join $S1, "'; '", __ARG_1
.annotate 'line', 1844
    concat $S2, "[ '", $S1
    concat $S2, $S2, "' ]"
    .return($S2)
# }
.annotate 'line', 1845

.end # getparrotkey


.sub 'getparrotnamespacekey' :subid('WSubId_87')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1849
# predefined elements
    elements $I1, __ARG_1
    ne $I1, 0, __label_1
.annotate 'line', 1850
    .return(".namespace [ ]")
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 1852
# s: $S1
# predefined join
    join $S1, "'; '", __ARG_1
.annotate 'line', 1853
    concat $S2, ".namespace [ '", $S1
    concat $S2, $S2, "' ]"
    .return($S2)
# }
  __label_2: # endif
# }
.annotate 'line', 1855

.end # getparrotnamespacekey


.sub 'parseUsing' :subid('WSubId_33')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1859
# var taux: $P1
    $P1 = __ARG_2.'get'()
# switch-case
.annotate 'line', 1861
    $I1 = $P1.'iskeyword'('extern')
    if $I1 goto __label_3
.annotate 'line', 1863
    $I1 = $P1.'iskeyword'('static')
    if $I1 goto __label_4
.annotate 'line', 1865
    $I1 = $P1.'iskeyword'('namespace')
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 1862
    new $P3, [ 'ExternStatement' ]
    $P3.'ExternStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P2, $P3
    .return($P2)
  __label_4: # case
.annotate 'line', 1864
    new $P5, [ 'StaticStatement' ]
    $P5.'StaticStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P4, $P5
    .return($P4)
  __label_5: # case
.annotate 'line', 1866
    new $P7, [ 'UsingNamespaceStatement' ]
    $P7.'UsingNamespaceStatement'($P1, __ARG_2, __ARG_3)
    set $P6, $P7
    .return($P6)
  __label_2: # default
.annotate 'line', 1868
    __ARG_2.'unget'($P1)
.annotate 'line', 1869
    new $P9, [ 'UsingStatement' ]
    $P9.'UsingStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P8, $P9
    .return($P8)
  __label_1: # switch end
# }
.annotate 'line', 1871

.end # parseUsing


.sub 'parseSig' :subid('WSubId_32')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1875
# var params: $P1
    new $P1, [ 'SigParameterList' ]
    $P1.'SigParameterList'(__ARG_2, __ARG_3)
.annotate 'line', 1876
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 1877
    $P4 = $P2.'isop'('=')
    isfalse $I1, $P4
    unless $I1 goto __label_1
.const 'Sub' $P5 = 'WSubId_29'
.annotate 'line', 1878
    $P5("'='", $P2)
  __label_1: # endif
.annotate 'line', 1879
# var expr: $P3
.const 'Sub' $P6 = 'WSubId_30'
    $P3 = $P6(__ARG_2, __ARG_3)
.annotate 'line', 1880
    new $P7, [ 'MultiAssignStatement' ]
    $P7.'MultiAssignStatement'($P1, $P3)
    set $P4, $P7
    .return($P4)
# }
.annotate 'line', 1881

.end # parseSig


.sub 'parseStatement' :subid('WSubId_81')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1885
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 1886
    $P4 = $P1.'isop'(';')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 1887
    new $P5, [ 'EmptyStatement' ]
    .return($P5)
  __label_1: # endif
.annotate 'line', 1888
    $P4 = $P1.'isop'('{')
    if_null $P4, __label_2
    unless $P4 goto __label_2
.annotate 'line', 1889
    new $P6, [ 'CompoundStatement' ]
    $P6.'CompoundStatement'($P1, __ARG_1, __ARG_2)
    set $P5, $P6
    .return($P5)
  __label_2: # endif
.annotate 'line', 1890
    $P4 = $P1.'isop'('${')
    if_null $P4, __label_3
    unless $P4 goto __label_3
.annotate 'line', 1891
    new $P6, [ 'PiropStatement' ]
    $P6.'PiropStatement'($P1, __ARG_1, __ARG_2)
    set $P5, $P6
    .return($P5)
  __label_3: # endif
.annotate 'line', 1892
    $P4 = $P1.'isop'(':')
    if_null $P4, __label_4
    unless $P4 goto __label_4
# {
.annotate 'line', 1893
# var open: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 1894
    $P4 = $P2.'isop'('(')
    isfalse $I1, $P4
    unless $I1 goto __label_5
.const 'Sub' $P7 = 'WSubId_31'
.annotate 'line', 1895
    $P7("':'", $P1)
  __label_5: # endif
.annotate 'line', 1896
.const 'Sub' $P8 = 'WSubId_32'
    .tailcall $P8($P1, __ARG_1, __ARG_2)
# }
  __label_4: # endif
# switch
.annotate 'line', 1899
    $P4 = $P1.'checkkeyword'()
    set $S1, $P4
    set $S2, 'using'
    if $S1 == $S2 goto __label_8
    set $S2, 'const'
    if $S1 == $S2 goto __label_9
    set $S2, 'volatile'
    if $S1 == $S2 goto __label_10
    set $S2, 'var'
    if $S1 == $S2 goto __label_11
    set $S2, 'string'
    if $S1 == $S2 goto __label_12
    set $S2, 'int'
    if $S1 == $S2 goto __label_13
    set $S2, 'float'
    if $S1 == $S2 goto __label_14
    set $S2, 'return'
    if $S1 == $S2 goto __label_15
    set $S2, 'yield'
    if $S1 == $S2 goto __label_16
    set $S2, 'goto'
    if $S1 == $S2 goto __label_17
    set $S2, 'if'
    if $S1 == $S2 goto __label_18
    set $S2, 'while'
    if $S1 == $S2 goto __label_19
    set $S2, 'do'
    if $S1 == $S2 goto __label_20
    set $S2, 'continue'
    if $S1 == $S2 goto __label_21
    set $S2, 'break'
    if $S1 == $S2 goto __label_22
    set $S2, 'switch'
    if $S1 == $S2 goto __label_23
    set $S2, 'for'
    if $S1 == $S2 goto __label_24
    set $S2, 'throw'
    if $S1 == $S2 goto __label_25
    set $S2, 'try'
    if $S1 == $S2 goto __label_26
    goto __label_7
  __label_8: # case
.annotate 'line', 1901
.const 'Sub' $P9 = 'WSubId_33'
    .tailcall $P9($P1, __ARG_1, __ARG_2)
  __label_9: # case
.annotate 'line', 1903
.const 'Sub' $P10 = 'WSubId_34'
    .tailcall $P10($P1, __ARG_1, __ARG_2)
    goto __label_6 # break
  __label_10: # case
.annotate 'line', 1906
.const 'Sub' $P11 = 'WSubId_35'
    .tailcall $P11($P1, __ARG_1, __ARG_2)
    goto __label_6 # break
  __label_11: # case
.annotate 'line', 1909
.const 'Sub' $P12 = 'WSubId_36'
    .tailcall $P12($P1, __ARG_1, __ARG_2)
  __label_12: # case
.annotate 'line', 1911
.const 'Sub' $P13 = 'WSubId_37'
    .tailcall $P13($P1, __ARG_1, __ARG_2)
  __label_13: # case
.annotate 'line', 1913
.const 'Sub' $P14 = 'WSubId_38'
    .tailcall $P14($P1, __ARG_1, __ARG_2)
  __label_14: # case
.annotate 'line', 1915
.const 'Sub' $P15 = 'WSubId_39'
    .tailcall $P15($P1, __ARG_1, __ARG_2)
  __label_15: # case
.annotate 'line', 1917
    new $P6, [ 'ReturnStatement' ]
    $P6.'ReturnStatement'($P1, __ARG_1, __ARG_2)
    set $P5, $P6
    .return($P5)
  __label_16: # case
.annotate 'line', 1919
    new $P17, [ 'YieldStatement' ]
    $P17.'YieldStatement'($P1, __ARG_1, __ARG_2)
    set $P16, $P17
    .return($P16)
  __label_17: # case
.annotate 'line', 1921
    new $P19, [ 'GotoStatement' ]
    $P19.'GotoStatement'($P1, __ARG_1, __ARG_2)
    set $P18, $P19
    .return($P18)
  __label_18: # case
.annotate 'line', 1923
    new $P21, [ 'IfStatement' ]
    $P21.'IfStatement'($P1, __ARG_1, __ARG_2)
    set $P20, $P21
    .return($P20)
  __label_19: # case
.annotate 'line', 1925
    new $P23, [ 'WhileStatement' ]
    $P23.'WhileStatement'($P1, __ARG_1, __ARG_2)
    set $P22, $P23
    .return($P22)
  __label_20: # case
.annotate 'line', 1927
    new $P25, [ 'DoStatement' ]
    $P25.'DoStatement'($P1, __ARG_1, __ARG_2)
    set $P24, $P25
    .return($P24)
  __label_21: # case
.annotate 'line', 1929
    new $P27, [ 'ContinueStatement' ]
    $P27.'ContinueStatement'($P1, __ARG_1, __ARG_2)
    set $P26, $P27
    .return($P26)
  __label_22: # case
.annotate 'line', 1931
    new $P29, [ 'BreakStatement' ]
    $P29.'BreakStatement'($P1, __ARG_1, __ARG_2)
    set $P28, $P29
    .return($P28)
  __label_23: # case
.annotate 'line', 1933
.const 'Sub' $P30 = 'WSubId_40'
    .tailcall $P30($P1, __ARG_1, __ARG_2)
  __label_24: # case
.annotate 'line', 1935
.const 'Sub' $P31 = 'WSubId_41'
    .tailcall $P31($P1, __ARG_1, __ARG_2)
  __label_25: # case
.annotate 'line', 1937
    new $P33, [ 'ThrowStatement' ]
    $P33.'ThrowStatement'($P1, __ARG_1, __ARG_2)
    set $P32, $P33
    .return($P32)
  __label_26: # case
.annotate 'line', 1939
    new $P35, [ 'TryStatement' ]
    $P35.'TryStatement'($P1, __ARG_1, __ARG_2)
    set $P34, $P35
    .return($P34)
  __label_7: # default
.annotate 'line', 1941
    $P36 = $P1.'isidentifier'()
    if_null $P36, __label_27
    unless $P36 goto __label_27
# {
.annotate 'line', 1942
# var t2: $P3
    $P3 = __ARG_1.'get'()
.annotate 'line', 1943
    $P4 = $P3.'isop'(':')
    if_null $P4, __label_28
    unless $P4 goto __label_28
.annotate 'line', 1944
    new $P6, [ 'LabelStatement' ]
    $P6.'LabelStatement'($P1, __ARG_2)
    set $P5, $P6
    .return($P5)
  __label_28: # endif
.annotate 'line', 1945
    __ARG_1.'unget'($P3)
# }
  __label_27: # endif
.annotate 'line', 1947
    __ARG_1.'unget'($P1)
.annotate 'line', 1948
    new $P5, [ 'ExprStatement' ]
    $P5.'ExprStatement'($P1, __ARG_1, __ARG_2)
    set $P4, $P5
    .return($P4)
  __label_6: # switch end
.const 'Sub' $P37 = 'WSubId_6'
.annotate 'line', 1950
    $P37('parseStatement failure', $P1)
# }
.annotate 'line', 1951

.end # parseStatement

.namespace [ 'Statement' ]

.sub 'Statement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1961
    self.'initbase'(__ARG_1, __ARG_2)
# }
.annotate 'line', 1962

.end # Statement


.sub 'isempty' :method
# Body
# {
.annotate 'line', 1963
    .return(0)
# }

.end # isempty


.sub 'createreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1966
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createreg'(__ARG_1)
# }
.annotate 'line', 1967

.end # createreg


.sub 'tempreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1970
    getattribute $P1, self, 'owner'
    .tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 1971

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 1974
    getattribute $P1, self, 'owner'
    $P1.'freetemps'()
# }
.annotate 'line', 1975

.end # freetemps


.sub 'genlabel' :method
# Body
# {
.annotate 'line', 1978
    getattribute $P1, self, 'owner'
    .tailcall $P1.'genlabel'()
# }
.annotate 'line', 1979

.end # genlabel


.sub 'getlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1982
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getlabel'(__ARG_1)
# }
.annotate 'line', 1983

.end # getlabel


.sub 'createlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1986
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createlabel'(__ARG_1)
# }
.annotate 'line', 1987

.end # createlabel


.sub 'createconst' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 1990
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createconst'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 1991

.end # createconst


.sub 'createvar' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 1994
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvar'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 1995

.end # createvar


.sub 'createvarused' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1998
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvarused'(__ARG_1, __ARG_2)
# }
.annotate 'line', 1999

.end # createvarused


.sub 'getvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2002
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getvar'(__ARG_1)
# }
.annotate 'line', 2003

.end # getvar


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2006
    getattribute $P1, self, 'owner'
    .tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 2007

.end # checkclass


.sub 'usenamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2010
    getattribute $P1, self, 'owner'
    $P1.'usenamespace'(__ARG_1)
# }
.annotate 'line', 2011

.end # usenamespace


.sub 'getouter' :method
# Body
# {
.annotate 'line', 2018
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getouter'()
# }
.annotate 'line', 2019

.end # getouter


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2022
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getcontinuelabel'(__ARG_1)
# }
.annotate 'line', 2023

.end # getcontinuelabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2026
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getbreaklabel'(__ARG_1)
# }
.annotate 'line', 2027

.end # getbreaklabel


.sub 'optimize' :method
# Body
# {
.const 'Sub' $P1 = 'WSubId_6'
.annotate 'line', 2030
    getattribute $P2, self, 'start'
    $P1('**checking**', $P2)
.annotate 'line', 2032
    .return(self)
# }
.annotate 'line', 2033

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Statement' ]
.annotate 'line', 1957
    get_class $P1, [ 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'EmptyStatement' ]

.sub 'isempty' :method
# Body
# {
.annotate 'line', 2038
    .return(1)
# }

.end # isempty


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.const 'Sub' $P1 = 'WSubId_6'
.annotate 'line', 2041
    $P1('Attempt to annotate empty statement')
# }
.annotate 'line', 2042

.end # annotate


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2043
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'EmptyStatement' ]
.annotate 'line', 2036
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'MultiStatementBase' ]

.sub 'optimize' :method
# Body
# {
.annotate 'line', 2056
# var statements: $P1
    getattribute $P1, self, 'statements'
.annotate 'line', 2057
# n: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 2058
# empty: $I2
    set $I2, 1
# for loop
.annotate 'line', 2059
# i: $I3
    null $I3
  __label_3: # for condition
    ge $I3, $I1, __label_2
# {
.annotate 'line', 2060
# var st: $P2
    $P3 = $P1[$I3]
    $P2 = $P3.'optimize'()
.annotate 'line', 2061
    set $I4, $I2
    unless $I4 goto __label_5
    $P3 = $P2.'isempty'()
    isfalse $I4, $P3
  __label_5:
    unless $I4 goto __label_4
.annotate 'line', 2062
    null $I2
  __label_4: # endif
.annotate 'line', 2063
    $P1[$I3] = $P2
# }
  __label_1: # for iteration
.annotate 'line', 2059
    inc $I3
    goto __label_3
  __label_2: # for end
.annotate 'line', 2065
    unless $I2 goto __label_6
.annotate 'line', 2066
    new $P3, [ 'EmptyStatement' ]
    .return($P3)
    goto __label_7
  __label_6: # else
.annotate 'line', 2068
    .return(self)
  __label_7: # endif
# }
.annotate 'line', 2069

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MultiStatementBase' ]
.annotate 'line', 2052
    addattribute $P0, 'statements'
.end
.namespace [ 'MultiStatement' ]

.sub 'MultiStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2076
# var statements: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
    push $P1, __ARG_1
    push $P1, __ARG_2
.annotate 'line', 2077
    setattribute self, 'statements', $P1
# }
.annotate 'line', 2078

.end # MultiStatement


.sub 'isempty' :method
# Body
# {
.annotate 'line', 2079
    .return(0)
# }

.end # isempty


.sub 'push' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2082
    getattribute $P1, self, 'statements'
# predefined push
    push $P1, __ARG_1
.annotate 'line', 2083
    .return(self)
# }
.annotate 'line', 2084

.end # push


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.const 'Sub' $P1 = 'WSubId_42'
.annotate 'line', 2087
    getattribute $P2, self, 'statements'
    $P1(__ARG_1, $P2)
# }
.annotate 'line', 2088

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MultiStatement' ]
.annotate 'line', 2072
    get_class $P1, [ 'MultiStatementBase' ]
    addparent $P0, $P1
.end
.namespace [ ]

.sub 'addtomulti' :subid('WSubId_84')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2093
    unless_null __ARG_1, __label_1
.annotate 'line', 2094
    .return(__ARG_2)
    goto __label_2
  __label_1: # else
.annotate 'line', 2095
    isa $I1, __ARG_1, [ 'MultiStatement' ]
    unless $I1 goto __label_3
.annotate 'line', 2096
    .tailcall __ARG_1.'push'(__ARG_2)
    goto __label_4
  __label_3: # else
.annotate 'line', 2098
    new $P2, [ 'MultiStatement' ]
    $P2.'MultiStatement'(__ARG_1, __ARG_2)
    set $P1, $P2
    .return($P1)
  __label_4: # endif
  __label_2: # endif
# }
.annotate 'line', 2099

.end # addtomulti


.sub 'parsePiropArg'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2107
# var arg: $P1
    null $P1
.annotate 'line', 2108
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 2109
    $P3 = $P2.'isop'(':')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 2110
    $P2 = __ARG_1.'get'()
.annotate 'line', 2111
# label: $S1
    $P3 = $P2.'getidentifier'()
    null $S1
    if_null $P3, __label_3
    set $S1, $P3
  __label_3:
.annotate 'line', 2112
    new $P3, [ 'Reflabel' ]
    $P3.'Reflabel'(__ARG_2, $S1)
    set $P1, $P3
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2115
    __ARG_1.'unget'($P2)
.annotate 'line', 2116
.const 'Sub' $P4 = 'WSubId_30'
    $P1 = $P4(__ARG_1, __ARG_2)
# }
  __label_2: # endif
.annotate 'line', 2118
    .return($P1)
# }
.annotate 'line', 2119

.end # parsePiropArg

.namespace [ 'PiropStatement' ]

.sub 'PiropStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2128
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2129
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 2130
# dotted: $I1
    $P2 = $P1.'isop'('.')
    set $I1, $P2
.annotate 'line', 2131
    unless $I1 goto __label_1
.annotate 'line', 2132
    $P1 = __ARG_2.'get'()
  __label_1: # endif
.annotate 'line', 2133
# opname: $S1
    $P2 = $P1.'getidentifier'()
    null $S1
    if_null $P2, __label_2
    set $S1, $P2
  __label_2:
.annotate 'line', 2134
    unless $I1 goto __label_4
    set $S2, '.'
    goto __label_3
  __label_4:
    set $S2, ''
  __label_3:
    concat $S3, $S2, $S1
    box $P2, $S3
    setattribute self, 'opname', $P2
.annotate 'line', 2135
    $P1 = __ARG_2.'get'()
.annotate 'line', 2136
    $P2 = $P1.'isop'('}')
    isfalse $I2, $P2
    unless $I2 goto __label_5
# {
.annotate 'line', 2137
    __ARG_2.'unget'($P1)
.annotate 'line', 2138
.const 'Sub' $P3 = 'parsePiropArg'
.annotate 'line', 2139
.const 'Sub' $P5 = 'WSubId_27'
    $P4 = $P5(__ARG_2, __ARG_3, $P3, '}')
    setattribute self, 'args', $P4
# }
  __label_5: # endif
.const 'Sub' $P6 = 'WSubId_43'
.annotate 'line', 2141
    $P6(';', __ARG_2)
# }
.annotate 'line', 2142

.end # PiropStatement


.sub 'optimize' :method
# Body
# {
.const 'Sub' $P1 = 'WSubId_28'
.annotate 'line', 2145
    getattribute $P2, self, 'args'
    $P1($P2)
.annotate 'line', 2146
    .return(self)
# }
.annotate 'line', 2147

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2150
# opname: $S1
    getattribute $P4, self, 'opname'
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 2151
    self.'annotate'(__ARG_1)
.annotate 'line', 2152
    concat $S2, 'pirop ', $S1
    __ARG_1.'comment'($S2)
.annotate 'line', 2153
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 2154
    __ARG_1.'print'('    ')
.annotate 'line', 2155
    unless_null $P1, __label_2
.annotate 'line', 2156
    __ARG_1.'say'($S1)
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 2158
# var argreg: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 2159
    iter $P5, $P1
    set $P5, 0
  __label_4: # for iteration
    unless $P5 goto __label_5
    shift $P3, $P5
.annotate 'line', 2160
    $P4 = $P3.'emit_get'(__ARG_1)
# predefined push
    push $P2, $P4
    goto __label_4
  __label_5: # endfor
.annotate 'line', 2161
# predefined join
    join $S2, ', ', $P2
    __ARG_1.'say'($S1, ' ', $S2)
# }
  __label_3: # endif
# }
.annotate 'line', 2163

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'PiropStatement' ]
.annotate 'line', 2121
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2123
    addattribute $P0, 'opname'
.annotate 'line', 2124
    addattribute $P0, 'args'
.end
.namespace [ 'ExternStatement' ]

.sub 'ExternStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2175
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2176
# var path: $P1
.const 'Sub' $P2 = 'WSubId_44'
    $P1 = $P2(__ARG_2)
.annotate 'line', 2177
# predefined elements
    elements $I1, $P1
    ne $I1, 0, __label_1
.const 'Sub' $P3 = 'WSubId_3'
.annotate 'line', 2178
    $P4 = __ARG_2.'get'()
    $P3($P4)
  __label_1: # endif
.const 'Sub' $P5 = 'WSubId_43'
.annotate 'line', 2179
    $P5(';', __ARG_2)
.annotate 'line', 2180
.const 'Sub' $P7 = 'WSubId_45'
    $P6 = $P7($P1)
    setattribute self, 'path', $P6
.annotate 'line', 2181
    .return(self)
# }
.annotate 'line', 2182

.end # ExternStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2183
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2186
    self.'annotate'(__ARG_1)
.annotate 'line', 2187
    getattribute $P1, self, 'path'
# predefined join
    join $S1, '/', $P1
    __ARG_1.'say'('    ', "load_bytecode '", $S1, ".pbc'")
# }
.annotate 'line', 2188

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ExternStatement' ]
.annotate 'line', 2170
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2172
    addattribute $P0, 'path'
.end
.namespace [ 'StaticStatement' ]

.sub 'StaticStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2200
    self.'Statement'(__ARG_1, __ARG_3)
.const 'Sub' $P1 = "WSubId_46"
.annotate 'line', 2202
.const 'Sub' $P4 = 'WSubId_27'
    null $P5
    $P3 = $P4(__ARG_2, $P5, $P1, ';')
    setattribute self, 'names', $P3
# }
.annotate 'line', 2203

.end # StaticStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2204
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2207
    self.'annotate'(__ARG_1)
.annotate 'line', 2208
    getattribute $P2, self, 'names'
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $S1, $P3
# {
.annotate 'line', 2209
# var v: $P1
    $P1 = self.'createvar'($S1, 'P')
.annotate 'line', 2210
    $P2 = $P1.'getreg'()
    __ARG_1.'say'(".const 'Sub' ", $P2, " = '", $S1, "'")
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 2212

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'StaticStatement' ]
.annotate 'line', 2195
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2197
    addattribute $P0, 'names'
.end
.namespace [ 'UsingStatement' ]

.sub 'UsingStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2226
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2227
# var path: $P1
.const 'Sub' $P2 = 'WSubId_44'
    $P1 = $P2(__ARG_2)
.annotate 'line', 2228
# predefined elements
    elements $I1, $P1
    ne $I1, 0, __label_1
.const 'Sub' $P3 = 'WSubId_3'
.annotate 'line', 2229
    $P4 = __ARG_2.'get'()
    $P3($P4)
  __label_1: # endif
.const 'Sub' $P5 = 'WSubId_43'
.annotate 'line', 2230
    $P5(';', __ARG_2)
.annotate 'line', 2231
.const 'Sub' $P7 = 'WSubId_45'
    $P6 = $P7($P1)
    setattribute self, 'path', $P6
# }
.annotate 'line', 2232

.end # UsingStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2235
# var path: $P1
    getattribute $P1, self, 'path'
.annotate 'line', 2236
# name: $S1
    $S1 = $P1[-1]
.annotate 'line', 2238
# var symbol: $P2
    $P2 = self.'findsymbol'($P1)
# switch-case
.annotate 'line', 2240
    isnull $I1, $P2
    if $I1 goto __label_3
.annotate 'line', 2254
    isa $I1, $P2, [ 'FunctionStatement' ]
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 2241
# predefined elements
    elements $I2, $P1
    le $I2, 0, __label_5
# {
.annotate 'line', 2242
# var p: $P3
# predefined clone
    clone $P3, $P1
.annotate 'line', 2243
    $P3.'pop'()
.annotate 'line', 2244
# var ns: $P4
    $P4 = self.'findns'($P3)
.annotate 'line', 2245
    if_null $P4, __label_6
# {
.annotate 'line', 2246
    $P2 = $P4.'getvar'($S1)
.annotate 'line', 2247
    if_null $P2, __label_7
# {
.annotate 'line', 2248
    self.'createvarused'($S1, $P2)
.annotate 'line', 2249
    new $P5, [ 'EmptyStatement' ]
    .return($P5)
# }
  __label_7: # endif
# }
  __label_6: # endif
# }
  __label_5: # endif
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 2255
# subid: $S2
    $P5 = $P2.'makesubid'()
    null $S2
    if_null $P5, __label_8
    set $S2, $P5
  __label_8:
.annotate 'line', 2256
    box $P6, $S2
    setattribute self, 'subid', $P6
    goto __label_1 # break
  __label_2: # default
  __label_1: # switch end
.annotate 'line', 2259
    self.'createvar'($S1, 'P')
.annotate 'line', 2260
    .return(self)
# }
.annotate 'line', 2261

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2264
# var path: $P1
    getattribute $P1, self, 'path'
.annotate 'line', 2265
# name: $S1
    $S1 = $P1[-1]
.annotate 'line', 2266
# var vdata: $P2
    $P2 = self.'getvar'($S1)
.annotate 'line', 2267
    getattribute $P3, self, 'subid'
    if_null $P3, __label_1
# {
.annotate 'line', 2268
# subid: $S2
    getattribute $P4, self, 'subid'
    null $S2
    if_null $P4, __label_3
    set $S2, $P4
  __label_3:
.annotate 'line', 2269
    $P3 = $P2.'getreg'()
    __ARG_1.'say'(".const 'Sub' ", $P3, ' = "', $S2, '"')
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2272
    self.'annotate'(__ARG_1)
.annotate 'line', 2273
    $P3 = $P2.'getreg'()
    __ARG_1.'print'('    get_hll_global ', $P3, ', ')
.annotate 'line', 2274
    $P1.'pop'()
# switch
.annotate 'line', 2275
# predefined elements
    elements $I1, $P1
    null $I2
    if $I1 == $I2 goto __label_6
    goto __label_5
  __label_6: # case
.annotate 'line', 2277
    __ARG_1.'say'("'", $S1, "'")
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 2280
.const 'Sub' $P5 = 'WSubId_47'
    $P3 = $P5($P1)
    __ARG_1.'say'($P3, " , '", $S1, "'")
  __label_4: # switch end
# }
  __label_2: # endif
# }
.annotate 'line', 2283

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'UsingStatement' ]
.annotate 'line', 2219
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2221
    addattribute $P0, 'path'
.annotate 'line', 2222
    addattribute $P0, 'subid'
.end
.namespace [ 'UsingNamespaceStatement' ]

.sub 'UsingNamespaceStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2294
    self.'Statement'(__ARG_2, __ARG_3)
.annotate 'line', 2295
# var nskey: $P1
.const 'Sub' $P3 = 'WSubId_44'
    $P1 = $P3(__ARG_2)
.annotate 'line', 2296
# nlems: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 2297
    ge $I1, 1, __label_1
.const 'Sub' $P4 = 'WSubId_29'
.annotate 'line', 2298
    $P4('namespace identifier', __ARG_1)
  __label_1: # endif
.annotate 'line', 2299
# var nssym: $P2
.const 'Sub' $P6 = 'WSubId_45'
    $P5 = $P6($P1)
    $P2 = __ARG_3.'findns'($P5)
.annotate 'line', 2301
    unless_null $P2, __label_2
.const 'Sub' $P7 = 'WSubId_1'
.annotate 'line', 2302
    $P7('unknow namespace', __ARG_1)
  __label_2: # endif
.annotate 'line', 2303
    __ARG_3.'usenamespace'($P2)
.const 'Sub' $P8 = 'WSubId_43'
.annotate 'line', 2305
    $P8(';', __ARG_2)
# }
.annotate 'line', 2306

.end # UsingNamespaceStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2309
    .return(self)
# }
.annotate 'line', 2310

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'UsingNamespaceStatement' ]
.annotate 'line', 2290
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'ExprStatement' ]

.sub 'ExprStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2325
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2326
.const 'Sub' $P3 = 'WSubId_30'
    $P2 = $P3(__ARG_2, self)
    setattribute self, 'expr', $P2
.const 'Sub' $P4 = 'WSubId_43'
.annotate 'line', 2327
    $P4(';', __ARG_2)
# }
.annotate 'line', 2328

.end # ExprStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2331
    getattribute $P3, self, 'expr'
    $P2 = $P3.'optimize'()
    setattribute self, 'expr', $P2
.annotate 'line', 2332
    .return(self)
# }
.annotate 'line', 2333

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2336
    getattribute $P1, self, 'expr'
    $P1.'emit'(__ARG_1, '')
# }
.annotate 'line', 2337

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ExprStatement' ]
.annotate 'line', 2320
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2322
    addattribute $P0, 'expr'
.end
.namespace [ 'VarData' ]

.sub 'VarData' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param int __ARG_4
# Body
# {
.annotate 'line', 2354
    setattribute self, 'type', __ARG_1
.annotate 'line', 2355
    setattribute self, 'reg', __ARG_2
.annotate 'line', 2356
    setattribute self, 'scope', __ARG_3
.annotate 'line', 2357
    box $P1, __ARG_4
    setattribute self, 'flags', $P1
# }
.annotate 'line', 2358

.end # VarData


.sub 'setlex' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2361
    box $P1, __ARG_1
    setattribute self, 'lexname', $P1
# }
.annotate 'line', 2362

.end # setlex


.sub 'gettype' :method
# Body
# {
.annotate 'line', 2363
    getattribute $P1, self, 'type'
    .return($P1)
# }

.end # gettype


.sub 'getreg' :method
# Body
# {
.annotate 'line', 2364
    getattribute $P1, self, 'reg'
    .return($P1)
# }

.end # getreg


.sub 'getscope' :method
# Body
# {
.annotate 'line', 2365
    getattribute $P1, self, 'scope'
    .return($P1)
# }

.end # getscope


.sub 'getvalue' :method
# Body
# {
.annotate 'line', 2366
    getattribute $P1, self, 'value'
    .return($P1)
# }

.end # getvalue


.sub 'isconst' :method
# Body
# {
.annotate 'line', 2367
    .return(0)
# }

.end # isconst


.sub 'getlex' :method
# Body
# {
.annotate 'line', 2368
    getattribute $P1, self, 'lexname'
    .return($P1)
# }

.end # getlex


.sub 'getflags' :method
# Body
# {
.annotate 'line', 2369
    getattribute $P1, self, 'flags'
    .return($P1)
# }

.end # getflags

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'VarData' ]
.annotate 'line', 2346
    addattribute $P0, 'type'
.annotate 'line', 2347
    addattribute $P0, 'reg'
.annotate 'line', 2348
    addattribute $P0, 'scope'
.annotate 'line', 2349
    addattribute $P0, 'flags'
.annotate 'line', 2350
    addattribute $P0, 'lexname'
.end
.namespace [ 'ConstantInternalFail' ]

.sub 'ConstantInternalFail' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2377
    setattribute self, 'name', __ARG_1
# }
.annotate 'line', 2378

.end # ConstantInternalFail


.sub 'get_string' :method :vtable
# Body
# {
.const 'Sub' $P1 = 'WSubId_6'
.annotate 'line', 2381
    getattribute $P2, self, 'name'
    $P1('Attempt to use unexpanded constant!!!', $P2)
# }
.annotate 'line', 2382

.end # get_string

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ConstantInternalFail' ]
.annotate 'line', 2374
    addattribute $P0, 'name'
.end
.namespace [ 'VarData_const' ]

.sub 'VarData_const' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 2391
    new $P2, [ 'ConstantInternalFail' ]
    $P2.'ConstantInternalFail'(__ARG_2)
    set $P1, $P2
    self.'VarData'(__ARG_1, $P1, __ARG_3, __ARG_4)
# }
.annotate 'line', 2392

.end # VarData_const


.sub 'isconst' :method
# Body
# {
.annotate 'line', 2393
    .return(1)
# }

.end # isconst


.sub 'setvalue' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2396
    getattribute $P1, self, 'value'
    if_null $P1, __label_1
.const 'Sub' $P2 = 'WSubId_6'
.annotate 'line', 2397
    $P2('Attempt change value of constant!!!')
  __label_1: # endif
.annotate 'line', 2398
    setattribute self, 'value', __ARG_1
# }
.annotate 'line', 2399

.end # setvalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'VarData_const' ]
.annotate 'line', 2385
    get_class $P1, [ 'VarData' ]
    addparent $P0, $P1
.annotate 'line', 2387
    addattribute $P0, 'value'
.end
.namespace [ 'VarContainer' ]

.sub 'init' :method :vtable
# Body
# {
.annotate 'line', 2410
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'locals', $P2
# }
.annotate 'line', 2411

.end # init


.sub 'createvar' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 2414
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2415
# sname: $S1
    set $P4, __ARG_1
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 2416
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2417
    if_null $P2, __label_2
.const 'Sub' $P5 = 'WSubId_1'
.annotate 'line', 2418
    concat $S3, "Redeclared '", $S1
    concat $S3, $S3, "'"
    $P5($S3, __ARG_1)
  __label_2: # endif
.annotate 'line', 2419
# reg: $S2
    $P4 = self.'createreg'(__ARG_2)
    null $S2
    if_null $P4, __label_3
    set $S2, $P4
  __label_3:
.annotate 'line', 2420
# var data: $P3
    new $P3, [ 'VarData' ]
    $P3.'VarData'(__ARG_2, $S2, self, __ARG_3)
.annotate 'line', 2421
    $P1[$S1] = $P3
.annotate 'line', 2422
    .return($P3)
# }
.annotate 'line', 2423

.end # createvar


.sub 'createvarused' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2426
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2427
# sname: $S1
    set $P3, __ARG_1
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 2428
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2429
    if_null $P2, __label_2
.const 'Sub' $P4 = 'WSubId_1'
.annotate 'line', 2430
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    $P4($S2, __ARG_1)
  __label_2: # endif
.annotate 'line', 2431
    $P1[$S1] = __ARG_2
# }
.annotate 'line', 2432

.end # createvarused


.sub 'createvarnamed' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 2435
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2436
# sname: $S1
    set $P3, __ARG_1
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 2437
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2438
    if_null $P2, __label_2
.const 'Sub' $P4 = 'WSubId_1'
.annotate 'line', 2439
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    $P4($S2, __ARG_1)
  __label_2: # endif
.annotate 'line', 2440
    new $P5, [ 'VarData' ]
    $P5.'VarData'(__ARG_2, __ARG_3, self, 0)
    set $P3, $P5
    $P1[$S1] = $P3
# }
.annotate 'line', 2441

.end # createvarnamed


.sub 'createconst' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 2444
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2445
# sname: $S1
    set $P4, __ARG_1
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 2446
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2447
    if_null $P2, __label_2
.const 'Sub' $P5 = 'WSubId_1'
.annotate 'line', 2448
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    $P5($S2, __ARG_1)
  __label_2: # endif
.annotate 'line', 2449
# var data: $P3
    new $P3, [ 'VarData_const' ]
    $P3.'VarData_const'(__ARG_2, __ARG_1, self, __ARG_3)
.annotate 'line', 2450
    $P1[$S1] = $P3
.annotate 'line', 2451
    .return($P3)
# }
.annotate 'line', 2452

.end # createconst


.sub 'getlocalvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2455
# var locals: $P1
    getattribute $P1, self, 'locals'
# predefined string
.annotate 'line', 2454
    set $S1, __ARG_1
.annotate 'line', 2456
    $P2 = $P1[$S1]
    .return($P2)
# }
.annotate 'line', 2457

.end # getlocalvar


.sub 'getusedvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2460
# var usedns: $P1
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 2461
    if_null $P1, __label_1
# {
.annotate 'line', 2462
# var sym: $P2
    null $P2
.annotate 'line', 2463
    iter $P4, $P1
    set $P4, 0
  __label_2: # for iteration
    unless $P4 goto __label_3
    shift $P3, $P4
# {
.annotate 'line', 2464
    $P2 = $P3.'getlocalvar'(__ARG_1)
    if_null $P2, __label_4
.annotate 'line', 2465
    .return($P2)
  __label_4: # endif
# }
    goto __label_2
  __label_3: # endfor
# }
  __label_1: # endif
    null $P5
.annotate 'line', 2468
    .return($P5)
# }
.annotate 'line', 2469

.end # getusedvar


.sub 'getvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2472
# var sym: $P1
    null $P1
.annotate 'line', 2473
    $P1 = self.'getlocalvar'(__ARG_1)
    if_null $P1, __label_1
.annotate 'line', 2474
    .return($P1)
  __label_1: # endif
.annotate 'line', 2475
    $P1 = self.'getusedvar'(__ARG_1)
    if_null $P1, __label_2
.annotate 'line', 2476
    .return($P1)
  __label_2: # endif
.annotate 'line', 2477
# var owner: $P2
    getattribute $P2, self, 'owner'
.annotate 'line', 2478
    if_null $P2, __label_3
.annotate 'line', 2479
    .tailcall $P2.'getvar'(__ARG_1)
  __label_3: # endif
    null $P3
.annotate 'line', 2480
    .return($P3)
# }
.annotate 'line', 2481

.end # getvar


.sub 'makelexical' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2484
# var lexowner: $P1
    $P1 = self.'getouter'()
.annotate 'line', 2485
# lexname: $S1
    $P2 = $P1.'createlex'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 2486
    .return($S1)
# }
.annotate 'line', 2487

.end # makelexical


.sub 'makelexicalself' :method
# Body
# {
.annotate 'line', 2490
# var lexowner: $P1
    set $P1, self
# Constant lexname evaluated at compile time
.annotate 'line', 2492
    self.'setlex'('__WLEX_self', 'self')
.annotate 'line', 2493
    .return('__WLEX_self')
# }
.annotate 'line', 2494

.end # makelexicalself

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'VarContainer' ]
.annotate 'line', 2405
    addattribute $P0, 'locals'
.annotate 'line', 2406
    addattribute $P0, 'usednamespaces'
.end
.namespace [ 'BlockStatement' ]
.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'BlockStatement' ]
.annotate 'line', 2503
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
.annotate 'line', 2515
    self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 2516

.end # Expr


.sub 'issimple' :method
# Body
# {
.annotate 'line', 2517
    .return(0)
# }

.end # issimple


.sub 'isliteral' :method
# Body
# {
.annotate 'line', 2518
    .return(0)
# }

.end # isliteral


.sub 'isintegerliteral' :method
# Body
# {
.annotate 'line', 2519
    .return(0)
# }

.end # isintegerliteral


.sub 'isfloatliteral' :method
# Body
# {
.annotate 'line', 2520
    .return(0)
# }

.end # isfloatliteral


.sub 'isstringliteral' :method
# Body
# {
.annotate 'line', 2521
    .return(0)
# }

.end # isstringliteral


.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 2522
    .return(0)
# }

.end # isidentifier


.sub 'isnull' :method
# Body
# {
.annotate 'line', 2523
    .return(0)
# }

.end # isnull


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 2524
    .return(0)
# }

.end # hascompilevalue


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 2525
    .return(0)
# }

.end # isnegable


.sub 'tempreg' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2528
    getattribute $P1, self, 'owner'
    .tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 2529

.end # tempreg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2533
    .return(self)
# }
.annotate 'line', 2534

.end # optimize


.sub 'cantailcall' :method
# Body
# {
.annotate 'line', 2535
    .return(0)
# }

.end # cantailcall


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2538
# type: $S1
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 2539
# reg: $S2
    ne $S1, 'v', __label_3
    set $S2, ''
    goto __label_2
  __label_3:
    $S2 = self.'tempreg'($S1)
  __label_2:
.annotate 'line', 2540
    self.'emit'(__ARG_1, $S2)
.annotate 'line', 2541
    .return($S2)
# }
.annotate 'line', 2542

.end # emit_get


.sub 'emit_getint' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2545
# reg: $S1
    null $S1
.annotate 'line', 2546
    $P1 = self.'checkresult'()
    set $S2, $P1
    ne $S2, 'I', __label_1
.annotate 'line', 2547
    $P2 = self.'emit_get'(__ARG_1)
    set $S1, $P2
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2549
    $P3 = self.'tempreg'('I')
    set $S1, $P3
.annotate 'line', 2550
    self.'emit'(__ARG_1, $S1)
# }
  __label_2: # endif
.annotate 'line', 2552
    .return($S1)
# }
.annotate 'line', 2553

.end # emit_getint


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.const 'Sub' $P1 = 'WSubId_1'
.annotate 'line', 2556
    getattribute $P2, self, 'start'
    $P1('Not a left-side expression', $P2)
# }
.annotate 'line', 2557

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Expr' ]
.annotate 'line', 2511
    get_class $P1, [ 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'SimpleExpr' ]

.sub 'issimple' :method
# Body
# {
.annotate 'line', 2562
    .return(1)
# }

.end # issimple

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'SimpleExpr' ]
.annotate 'line', 2560
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
.annotate 'line', 2572
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 2573
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 2574
    $P2 = $P1.'isop'('(')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.const 'Sub' $P3 = 'WSubId_29'
.annotate 'line', 2575
    $P3('anonymous function', $P1)
  __label_1: # endif
.annotate 'line', 2576
    new $P5, [ 'LocalFunctionStatement' ]
    $P5.'LocalFunctionStatement'(__ARG_3, __ARG_1, __ARG_2)
    set $P4, $P5
    setattribute self, 'fn', $P4
# }
.annotate 'line', 2577

.end # FunctionExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2578
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2581
    getattribute $P3, self, 'fn'
    $P2 = $P3.'optimize'()
    setattribute self, 'fn', $P2
.annotate 'line', 2582
    .return(self)
# }
.annotate 'line', 2583

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2586
# var fn: $P1
    getattribute $P1, self, 'fn'
.annotate 'line', 2587
# reg: $S1
    $P2 = self.'tempreg'('P')
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 2588
    self.'annotate'(__ARG_1)
.annotate 'line', 2589
    $P2 = $P1.'getsubid'()
    __ARG_1.'say'(".const 'Sub' ", $S1, " = '", $P2, "'")
.annotate 'line', 2590
    set $S2, __ARG_2
    eq $S2, '', __label_2
.annotate 'line', 2591
    __ARG_1.'emitarg2'('newclosure', __ARG_2, $S1)
  __label_2: # endif
# }
.annotate 'line', 2592

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FunctionExpr' ]
.annotate 'line', 2567
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 2569
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
.annotate 'line', 2607
    setattribute self, 'condexpr', __ARG_1
.annotate 'line', 2608
    .return(self)
# }
.annotate 'line', 2609

.end # set


.sub 'optimize_condition' :method
# Body
# {
.annotate 'line', 2612
    getattribute $P3, self, 'condexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'condexpr', $P2
# }
.annotate 'line', 2613

.end # optimize_condition


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2616
    getattribute $P3, self, 'condexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'condexpr', $P2
.annotate 'line', 2617
    .return(self)
# }
.annotate 'line', 2618

.end # optimize


.sub 'getvalue' :method
# Body
# {
.annotate 'line', 2621
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 2622
    $P2 = $P1.'isliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
# switch
.annotate 'line', 2623
    $P3 = $P1.'checkresult'()
    set $S1, $P3
    set $S2, 'I'
    if $S1 == $S2 goto __label_4
    goto __label_3
  __label_4: # case
.annotate 'line', 2625
# n: $I1
    $P4 = $P1.'getIntegerValue'()
    set $I1, $P4
.annotate 'line', 2626
    ne $I1, 0, __label_5
.annotate 'line', 2627
    .return(2)
    goto __label_6
  __label_5: # else
.annotate 'line', 2629
    .return(1)
  __label_6: # endif
  __label_3: # default
  __label_2: # switch end
# }
  __label_1: # endif
.annotate 'line', 2632
    .return(0)
# }
.annotate 'line', 2633

.end # getvalue


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 2636
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 2638
    isa $I1, $P1, [ 'ComparatorBaseExpr' ]
    if $I1 goto __label_3
.annotate 'line', 2639
    isa $I1, $P1, [ 'NullCheckerExpr' ]
  __label_3:
    unless $I1 goto __label_1
.annotate 'line', 2640
    $P1.'emit_if'(__ARG_1, __ARG_2)
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2642
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
# switch
.annotate 'line', 2643
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    set $S3, 'S'
    if $S2 == $S3 goto __label_7
    set $S3, 'P'
    if $S2 == $S3 goto __label_8
    set $S3, 'I'
    if $S2 == $S3 goto __label_9
    set $S3, 'N'
    if $S2 == $S3 goto __label_10
    goto __label_6
  __label_7: # case
  __label_8: # case
.annotate 'line', 2646
    __ARG_1.'emitif_null'($S1, __ARG_3)
  __label_9: # case
  __label_10: # case
.annotate 'line', 2649
    __ARG_1.'emitif'($S1, __ARG_2)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 2650
.const 'Sub' $P3 = 'WSubId_6'
.annotate 'line', 2652
    $P3('Invalid if condition')
  __label_5: # switch end
# }
  __label_2: # endif
# }
.annotate 'line', 2655

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 2658
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 2660
    isa $I1, $P1, [ 'ComparatorBaseExpr' ]
    if $I1 goto __label_3
.annotate 'line', 2661
    isa $I1, $P1, [ 'NullCheckerExpr' ]
  __label_3:
    unless $I1 goto __label_1
.annotate 'line', 2662
    $P1.'emit_else'(__ARG_1, __ARG_2)
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2664
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
# switch
.annotate 'line', 2665
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    set $S3, 'S'
    if $S2 == $S3 goto __label_7
    set $S3, 'P'
    if $S2 == $S3 goto __label_8
    set $S3, 'I'
    if $S2 == $S3 goto __label_9
    set $S3, 'N'
    if $S2 == $S3 goto __label_10
    goto __label_6
  __label_7: # case
  __label_8: # case
.annotate 'line', 2668
    __ARG_1.'emitif_null'($S1, __ARG_2)
  __label_9: # case
  __label_10: # case
.annotate 'line', 2671
    __ARG_1.'emitunless'($S1, __ARG_2)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 2672
.const 'Sub' $P3 = 'WSubId_6'
.annotate 'line', 2674
    $P3('Invalid if condition')
  __label_5: # switch end
# }
  __label_2: # endif
# }
.annotate 'line', 2677

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Condition' ]
.annotate 'line', 2604
    addattribute $P0, 'condexpr'
.end
.namespace [ 'Literal' ]

.sub 'isliteral' :method
# Body
# {
.annotate 'line', 2684
    .return(1)
# }

.end # isliteral


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 2685
    .return(1)
# }

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Literal' ]
.annotate 'line', 2682
    get_class $P1, [ 'SimpleExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'StringLiteral' ]

.sub 'StringLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2695
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2696
    setattribute self, 'strval', __ARG_2
# }
.annotate 'line', 2697

.end # StringLiteral


.sub 'isstringliteral' :method
# Body
# {
.annotate 'line', 2698
    .return(1)
# }

.end # isstringliteral


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2699
    .return('S')
# }

.end # checkresult


.sub 'getPirString' :method
# Body
# {
.annotate 'line', 2702
# var strtok: $P1
    getattribute $P1, self, 'strval'
.annotate 'line', 2703
# str: $S1
    getattribute $P2, $P1, 'str'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 2704
# typesinglequoted: $I1
    isa $I1, $P1, [ 'TokenSingleQuoted' ]
.annotate 'line', 2705
# need_unicode: $I2
    null $I2
.annotate 'line', 2706
    box $P2, $S1
    iter $P3, $P2
    set $P3, 0
  __label_2: # for iteration
    unless $P3 goto __label_3
    shift $I3, $P3
# {
.annotate 'line', 2707
    le $I3, 127, __label_4
# {
.annotate 'line', 2708
    set $I2, 1
    goto __label_3 # break
.annotate 'line', 2709
# }
  __label_4: # endif
# }
    goto __label_2
  __label_3: # endfor
.annotate 'line', 2712
    unless $I2 goto __label_5
# {
.annotate 'line', 2713
    unless $I1 goto __label_6
# {
.annotate 'line', 2714
    null $I1
.annotate 'line', 2715
# saux: $S2
    set $S2, $S1
.annotate 'line', 2716
    set $S1, ''
.annotate 'line', 2717
    box $P2, $S2
    iter $P4, $P2
    set $P4, 0
  __label_7: # for iteration
    unless $P4 goto __label_8
    shift $S3, $P4
# {
.annotate 'line', 2718
    ne $S3, '\', __label_9
.annotate 'line', 2719
    set $S3, '\\'
  __label_9: # endif
.annotate 'line', 2720
    concat $S1, $S1, $S3
# }
    goto __label_7
  __label_8: # endfor
# }
  __label_6: # endif
.annotate 'line', 2723
# result: $S4
    set $S4, ''
.annotate 'line', 2724
    box $P2, $S1
    iter $P5, $P2
    set $P5, 0
  __label_10: # for iteration
    unless $P5 goto __label_11
    shift $S5, $P5
# {
.annotate 'line', 2725
# n: $I4
# predefined ord
    ord $I4, $S5
.annotate 'line', 2726
    le $I4, 127, __label_12
# {
.annotate 'line', 2727
# h: $S6
    box $P6, $I4
    $P2 = $P6.'get_as_base'(16)
    null $S6
    if_null $P2, __label_14
    set $S6, $P2
  __label_14:
.annotate 'line', 2728
    concat $S4, $S4, '\x{'
    concat $S4, $S4, $S6
    concat $S4, $S4, '}'
# }
    goto __label_13
  __label_12: # else
.annotate 'line', 2731
    concat $S4, $S4, $S5
  __label_13: # endif
# }
    goto __label_10
  __label_11: # endfor
.annotate 'line', 2733
    set $S1, $S4
# }
  __label_5: # endif
.annotate 'line', 2735
# q: $S7
    unless $I1 goto __label_16
    set $S7, "'"
    goto __label_15
  __label_16:
    set $S7, '"'
  __label_15:
.annotate 'line', 2736
    concat $S0, $S7, $S1
    concat $S0, $S0, $S7
    set $S1, $S0
.annotate 'line', 2737
    unless $I2 goto __label_17
.annotate 'line', 2738
    concat $S0, 'unicode:', $S1
    set $S1, $S0
  __label_17: # endif
.annotate 'line', 2739
    .return($S1)
# }
.annotate 'line', 2740

.end # getPirString


.sub 'get_value' :method
# Body
# {
.annotate 'line', 2743
# var strtok: $P1
    getattribute $P1, self, 'strval'
.annotate 'line', 2744
# str: $S1
    getattribute $P3, $P1, 'str'
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 2745
    isa $I1, $P1, [ 'TokenQuoted' ]
    unless $I1 goto __label_2
# {
.annotate 'line', 2746
# var s: $P2
    box $P2, $S1
.annotate 'line', 2747
    $P3 = $P2.'unescape'('utf8')
    set $S1, $P3
# }
  __label_2: # endif
.annotate 'line', 2749
    .return($S1)
# }
.annotate 'line', 2750

.end # get_value


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2753
    set $S1, __ARG_2
    eq $S1, '', __label_1
.annotate 'line', 2754
    $P1 = self.'getPirString'()
    __ARG_1.'emitset'(__ARG_2, $P1)
  __label_1: # endif
# }
.annotate 'line', 2755

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2758
    .tailcall self.'getPirString'()
# }
.annotate 'line', 2759

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'StringLiteral' ]
.annotate 'line', 2690
    get_class $P1, [ 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 2692
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
.annotate 'line', 2771
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2772
    setattribute self, 'pos', __ARG_2
.annotate 'line', 2773
# n: $I1
    null $I1
.annotate 'line', 2774
    unless __ARG_4 goto __label_1
.annotate 'line', 2775
    set $I1, __ARG_3
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2777
# aux: $S1
    set $P1, __ARG_2
    null $S1
    if_null $P1, __label_3
    set $S1, $P1
  __label_3:
.annotate 'line', 2778
    set $I1, $S1
# }
  __label_2: # endif
.annotate 'line', 2780
    box $P1, $I1
    setattribute self, 'numval', $P1
# }
.annotate 'line', 2781

.end # IntegerLiteral


.sub 'isintegerliteral' :method
# Body
# {
.annotate 'line', 2782
    .return(1)
# }

.end # isintegerliteral


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2783
    .return('I')
# }

.end # checkresult


.sub 'getIntegerValue' :method
# Body
# {
.annotate 'line', 2786
# aux: $S1
    getattribute $P1, self, 'numval'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
# predefined int
.annotate 'line', 2785
    set $I1, $S1
.annotate 'line', 2787
    .return($I1)
# }
.annotate 'line', 2788

.end # getIntegerValue


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2791
    set $S1, __ARG_2
    eq $S1, '', __label_1
# {
.annotate 'line', 2792
# value: $I1
    $P1 = self.'getIntegerValue'()
    set $I1, $P1
.annotate 'line', 2793
    ne $I1, 0, __label_2
.annotate 'line', 2794
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_3
  __label_2: # else
.annotate 'line', 2796
    __ARG_1.'emitset'(__ARG_2, $I1)
  __label_3: # endif
# }
  __label_1: # endif
# }
.annotate 'line', 2798

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2801
    .tailcall self.'getIntegerValue'()
# }
.annotate 'line', 2802

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IntegerLiteral' ]
.annotate 'line', 2764
    get_class $P1, [ 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 2766
    addattribute $P0, 'pos'
.annotate 'line', 2767
    addattribute $P0, 'numval'
.end
.namespace [ 'FloatLiteral' ]

.sub 'FloatLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2812
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2813
    setattribute self, 'numval', __ARG_2
# }
.annotate 'line', 2814

.end # FloatLiteral


.sub 'isfloatliteral' :method
# Body
# {
.annotate 'line', 2815
    .return(1)
# }

.end # isfloatliteral


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2816
    .return('N')
# }

.end # checkresult


.sub 'getFloatValue' :method
# Body
# {
.annotate 'line', 2819
# aux: $S1
    getattribute $P2, self, 'numval'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 2820
# var n: $P1
    new $P1, [ 'Float' ]
.annotate 'line', 2821
    assign $P1, $S1
.annotate 'line', 2822
    .return($P1)
# }
.annotate 'line', 2823

.end # getFloatValue


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2826
    set $S1, __ARG_2
    eq $S1, '', __label_1
# {
.annotate 'line', 2827
# var n: $P1
    $P1 = self.'getFloatValue'()
.annotate 'line', 2828
    __ARG_1.'emitset'(__ARG_2, $P1)
# }
  __label_1: # endif
# }
.annotate 'line', 2830

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2835
# aux: $S1
    getattribute $P1, self, 'numval'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 2836
# predefined indexof
    index $I1, $S1, '.'
    ge $I1, 0, __label_2
.annotate 'line', 2837
    concat $S1, $S1, '.0'
  __label_2: # endif
.annotate 'line', 2838
    .return($S1)
# }
.annotate 'line', 2839

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FloatLiteral' ]
.annotate 'line', 2807
    get_class $P1, [ 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 2809
    addattribute $P0, 'numval'
.end
.namespace [ 'IdentifierExpr' ]

.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 2847
    .return(1)
# }

.end # isidentifier


.sub 'IdentifierExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2850
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2851
    setattribute self, 'name', __ARG_2
# }
.annotate 'line', 2852

.end # IdentifierExpr


.sub 'isnull' :method
# Body
# {
.annotate 'line', 2855
    getattribute $P1, self, 'name'
    .tailcall $P1.'iskeyword'('null')
# }
.annotate 'line', 2856

.end # isnull


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2859
# var desc: $P1
    getattribute $P2, self, 'owner'
    getattribute $P3, self, 'name'
    $P1 = $P2.'getvar'($P3)
.annotate 'line', 2860
    if_null $P1, __label_1
.annotate 'line', 2861
    .tailcall $P1.'gettype'()
    goto __label_2
  __label_1: # else
# {
# switch
.annotate 'line', 2863
    getattribute $P2, self, 'name'
    set $S1, $P2
    set $S2, 'self'
    if $S1 == $S2 goto __label_5
    set $S2, 'null'
    if $S1 == $S2 goto __label_6
    goto __label_4
  __label_5: # case
  __label_6: # case
.annotate 'line', 2866
    .return('P')
  __label_4: # default
.annotate 'line', 2868
    .return('')
  __label_3: # switch end
# }
  __label_2: # endif
# }
.annotate 'line', 2871

.end # checkresult


.sub 'getName' :method
# Body
# {
.annotate 'line', 2874
# s: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 2875
    .return($S1)
# }
.annotate 'line', 2876

.end # getName


.sub 'checkIdentifier' :method
# Body
# {
.annotate 'line', 2879
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 2880
    unless_null $P1, __label_1
.const 'Sub' $P3 = 'WSubId_6'
.annotate 'line', 2881
    $P3('Bad thing')
  __label_1: # endif
.annotate 'line', 2882
# var desc: $P2
    getattribute $P4, self, 'owner'
    $P2 = $P4.'getvar'($P1)
.annotate 'line', 2883
# s: $S1
    null $S1
.annotate 'line', 2884
    unless_null $P2, __label_2
# {
.annotate 'line', 2885
# sname: $S2
    set $P4, $P1
    null $S2
    if_null $P4, __label_4
    set $S2, $P4
  __label_4:
# switch
.annotate 'line', 2886
    set $S3, $S2
    set $S4, 'self'
    if $S3 == $S4 goto __label_7
    set $S4, 'null'
    if $S3 == $S4 goto __label_8
    goto __label_6
  __label_7: # case
.annotate 'line', 2888
    set $S1, 'self'
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 2890
    set $S1, 'null'
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 2892
    set $S1, ''
  __label_5: # switch end
# }
    goto __label_3
  __label_2: # else
.annotate 'line', 2896
    $P4 = $P2.'getreg'()
    set $S1, $P4
  __label_3: # endif
.annotate 'line', 2897
    .return($S1)
# }
.annotate 'line', 2898

.end # checkIdentifier


.sub 'getIdentifier' :method
# Body
# {
.annotate 'line', 2901
# var value: $P1
    $P1 = self.'checkIdentifier'()
.annotate 'line', 2902
    set $S1, $P1
    ne $S1, '', __label_1
.const 'Sub' $P2 = 'WSubId_48'
.annotate 'line', 2903
    getattribute $P3, self, 'name'
    $P2($P3)
  __label_1: # endif
.annotate 'line', 2904
    .return($P1)
# }
.annotate 'line', 2905

.end # getIdentifier


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2908
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 2909
# var desc: $P2
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
.annotate 'line', 2910
    if_null $P2, __label_1
# {
.annotate 'line', 2911
    $P3 = $P2.'isconst'()
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 2912
    .tailcall $P2.'getvalue'()
  __label_2: # endif
.annotate 'line', 2913
# flags: $I1
    $P3 = $P2.'getflags'()
    set $I1, $P3
.annotate 'line', 2914
    band $I2, $I1, 1
    unless $I2 goto __label_3
# {
.annotate 'line', 2915
    band $I3, $I1, 2
    unless $I3 goto __label_4
.annotate 'line', 2916
    new $P4, [ 'LexicalVolatileExpr' ]
    $P4.'LexicalVolatileExpr'(self, $P2)
    set $P3, $P4
    .return($P3)
  __label_4: # endif
# }
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 2919
    .return(self)
# }
.annotate 'line', 2920

.end # optimize


.sub 'emit_getid' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2923
# id: $S1
    $P2 = self.'getIdentifier'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 2924
# var desc: $P1
    getattribute $P2, self, 'owner'
    getattribute $P3, self, 'name'
    $P1 = $P2.'getvar'($P3)
.annotate 'line', 2925
# flags: $I1
    unless_null $P1, __label_3
    null $I1
    goto __label_2
  __label_3:
    $I1 = $P1.'getflags'()
  __label_2:
.annotate 'line', 2926
    band $I2, $I1, 1
    unless $I2 goto __label_4
# {
.annotate 'line', 2927
    band $I3, $I1, 2
    unless $I3 goto __label_5
# {
.annotate 'line', 2928
# lexname: $S2
    $P2 = $P1.'getlex'()
    null $S2
    if_null $P2, __label_6
    set $S2, $P2
  __label_6:
.annotate 'line', 2929
    isnull $I2, $S2
    not $I2
    unless $I2 goto __label_8
    isne $I2, $S2, ''
  __label_8:
    unless $I2 goto __label_7
.annotate 'line', 2930
    __ARG_1.'emitfind_lex'($S1, $S2)
  __label_7: # endif
# }
  __label_5: # endif
# }
  __label_4: # endif
.annotate 'line', 2933
    .return($S1)
# }
.annotate 'line', 2934

.end # emit_getid


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2937
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 2938
    self.'annotate'(__ARG_1)
.annotate 'line', 2939
# id: $S1
    $P1 = self.'emit_getid'(__ARG_1)
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 2940
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_1: # endif
# }
.annotate 'line', 2942

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2945
    self.'annotate'(__ARG_1)
.annotate 'line', 2946
    .tailcall self.'emit_getid'(__ARG_1)
# }
.annotate 'line', 2947

.end # emit_get


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2950
    self.'annotate'(__ARG_1)
.annotate 'line', 2951
    $P1 = self.'isnull'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
# predefined die
.annotate 'line', 2952
    die "NO"
  __label_1: # endif
.annotate 'line', 2953
# typeleft: $S1
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 2954
# lreg: $S2
    $P1 = self.'getIdentifier'()
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
  __label_3:
.annotate 'line', 2955
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_4
    unless $P1 goto __label_4
# {
# switch
.annotate 'line', 2956
    set $S5, $S1
    set $S6, 'S'
    if $S5 == $S6 goto __label_8
    set $S6, 'P'
    if $S5 == $S6 goto __label_9
    goto __label_7
  __label_8: # case
  __label_9: # case
.annotate 'line', 2959
    __ARG_1.'emitnull'($S2)
    goto __label_6 # break
  __label_7: # default
.annotate 'line', 2960
.const 'Sub' $P2 = 'WSubId_1'
.annotate 'line', 2962
    getattribute $P3, self, 'start'
    $P2("Can't assign null to that type", $P3)
  __label_6: # switch end
# }
    goto __label_5
  __label_4: # else
.annotate 'line', 2965
    isa $I1, __ARG_2, [ 'IndexExpr' ]
    unless $I1 goto __label_10
.annotate 'line', 2966
    __ARG_2.'emit'(__ARG_1, $S2)
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 2968
# typeright: $S3
    $P1 = __ARG_2.'checkresult'()
    null $S3
    if_null $P1, __label_12
    set $S3, $P1
  __label_12:
.annotate 'line', 2969
    ne $S3, 'v', __label_13
.const 'Sub' $P4 = 'WSubId_1'
.annotate 'line', 2970
    getattribute $P1, self, 'start'
    $P4("Can't assign from void expression", $P1)
  __label_13: # endif
.annotate 'line', 2971
    ne $S1, $S3, __label_14
# {
.annotate 'line', 2972
    __ARG_2.'emit'(__ARG_1, $S2)
# }
    goto __label_15
  __label_14: # else
# {
.annotate 'line', 2975
# rreg: $S4
    $P1 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P1, __label_16
    set $S4, $P1
  __label_16:
.annotate 'line', 2976
    self.'annotate'(__ARG_1)
.annotate 'line', 2977
    iseq $I1, $S1, 'P'
    unless $I1 goto __label_19
    isne $I1, $S3, 'P'
  __label_19:
    unless $I1 goto __label_17
.annotate 'line', 2978
    __ARG_1.'emitbox'($S2, $S4)
    goto __label_18
  __label_17: # else
.annotate 'line', 2980
    __ARG_1.'emitset'($S2, $S4)
  __label_18: # endif
# }
  __label_15: # endif
# }
  __label_11: # endif
  __label_5: # endif
.annotate 'line', 2983
    .return($S2)
# }
.annotate 'line', 2984

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IdentifierExpr' ]
.annotate 'line', 2844
    get_class $P1, [ 'SimpleExpr' ]
    addparent $P0, $P1
.annotate 'line', 2846
    addattribute $P0, 'name'
.end
.namespace [ 'LexicalVolatileExpr' ]

.sub 'LexicalVolatileExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2994
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 2995
    setattribute self, 'desc', __ARG_2
# }
.annotate 'line', 2996

.end # LexicalVolatileExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2997
    .return('P')
# }

.end # checkresult


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3000
# var desc: $P1
    getattribute $P1, self, 'desc'
.annotate 'line', 3001
# lexname: $S1
    $P2 = $P1.'getlex'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3002
# reg: $S2
    getattribute $P3, self, 'owner'
    $P2 = $P3.'tempreg'('P')
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 3003
    __ARG_1.'emitfind_lex'($S2, $S1)
.annotate 'line', 3004
    .return($S2)
# }
.annotate 'line', 3005

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3008
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 3009
    self.'annotate'(__ARG_1)
.annotate 'line', 3010
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 3011
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_1: # endif
# }
.annotate 'line', 3013

.end # emit


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3016
# lreg: $S1
    getattribute $P3, self, 'owner'
    $P2 = $P3.'tempreg'('P')
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
# switch-case
.annotate 'line', 3018
    $I1 = __ARG_2.'isnull'()
    if $I1 goto __label_4
.annotate 'line', 3021
    isa $I1, __ARG_2, [ 'IndexExpr' ]
    if $I1 goto __label_5
    goto __label_3
  __label_4: # case
.annotate 'line', 3019
    __ARG_1.'emitnull'($S1)
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 3022
    __ARG_2.'emit'(__ARG_1, $S1)
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 3025
# typeright: $S2
    $P2 = __ARG_2.'checkresult'()
    null $S2
    if_null $P2, __label_6
    set $S2, $P2
  __label_6:
.annotate 'line', 3026
    ne 'P', $S2, __label_7
.annotate 'line', 3027
    __ARG_2.'emit'(__ARG_1, $S1)
    goto __label_8
  __label_7: # else
# {
.annotate 'line', 3029
# rreg: $S3
    $P3 = __ARG_2.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_9
    set $S3, $P3
  __label_9:
.annotate 'line', 3030
    self.'annotate'(__ARG_1)
.annotate 'line', 3031
    __ARG_1.'emitbox'($S1, $S3)
# }
  __label_8: # endif
  __label_2: # switch end
.annotate 'line', 3035
# var desc: $P1
    getattribute $P1, self, 'desc'
.annotate 'line', 3036
# lexname: $S4
    $P2 = $P1.'getlex'()
    null $S4
    if_null $P2, __label_10
    set $S4, $P2
  __label_10:
.annotate 'line', 3037
    __ARG_1.'say'("store_lex '", $S4, "', ", $S1)
# }
.annotate 'line', 3038

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'LexicalVolatileExpr' ]
.annotate 'line', 2989
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 2991
    addattribute $P0, 'desc'
.end
.namespace [ 'OpExpr' ]

.sub 'initop' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3047
    self.'Expr'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3048

.end # initop

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpExpr' ]
.annotate 'line', 3043
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
.annotate 'line', 3059
    self.'initop'(__ARG_2, __ARG_3)
.annotate 'line', 3060
.const 'Sub' $P3 = 'WSubId_49'
    $P2 = $P3(__ARG_1, __ARG_2)
    setattribute self, 'clspec', $P2
# }
.annotate 'line', 3061

.end # OpClassExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3062
    .return('P')
# }

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3065
# var clspec: $P1
    getattribute $P1, self, 'clspec'
.annotate 'line', 3068
    set $S1, __ARG_2
    ne $S1, '', __label_1
.annotate 'line', 3069
    getattribute $P2, self, 'owner'
    __ARG_2 = $P2.'tempreg'('P')
  __label_1: # endif
.annotate 'line', 3070
    __ARG_1.'print'('    get_class ', __ARG_2, ', ')
.annotate 'line', 3071
    getattribute $P2, self, 'owner'
    $P1.'emit'(__ARG_1, $P2)
.annotate 'line', 3072
    __ARG_1.'say'()
# }
.annotate 'line', 3073

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpClassExpr' ]
.annotate 'line', 3053
    get_class $P1, [ 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3055
    addattribute $P0, 'clspec'
.end
.namespace [ 'OpUnaryExpr' ]

.sub 'OpUnaryExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3083
    self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 3084
    setattribute self, 'subexpr', __ARG_3
# }
.annotate 'line', 3085

.end # OpUnaryExpr


.sub 'optimizearg' :method
# Body
# {
.annotate 'line', 3088
    getattribute $P3, self, 'subexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'subexpr', $P2
# }
.annotate 'line', 3089

.end # optimizearg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3092
    self.'optimizearg'()
.annotate 'line', 3093
    .return(self)
# }
.annotate 'line', 3094

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpUnaryExpr' ]
.annotate 'line', 3078
    get_class $P1, [ 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3080
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
.annotate 'line', 3105
    self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 3106
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 3107
    setattribute self, 'rexpr', __ARG_4
# }
.annotate 'line', 3108

.end # initbinary


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 3111
    self.'initbinary'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 3112
    .return(self)
# }
.annotate 'line', 3113

.end # set


.sub 'setfrom' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3116
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    getattribute $P3, __ARG_1, 'lexpr'
    getattribute $P4, __ARG_1, 'rexpr'
    .tailcall self.'set'($P1, $P2, $P3, $P4)
# }
.annotate 'line', 3117

.end # setfrom


.sub 'optimizearg' :method
# Body
# {
.annotate 'line', 3120
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 3121
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'rexpr', $P2
# }
.annotate 'line', 3122

.end # optimizearg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3125
    self.'optimizearg'()
.annotate 'line', 3126
    .return(self)
# }
.annotate 'line', 3127

.end # optimize


.sub 'emit_intleft' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3130
    getattribute $P1, self, 'lexpr'
    .tailcall $P1.'emit_getint'(__ARG_1)
# }
.annotate 'line', 3131

.end # emit_intleft


.sub 'emit_intright' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3134
    getattribute $P1, self, 'rexpr'
    .tailcall $P1.'emit_getint'(__ARG_1)
# }
.annotate 'line', 3135

.end # emit_intright

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBinaryExpr' ]
.annotate 'line', 3099
    get_class $P1, [ 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3101
    addattribute $P0, 'lexpr'
.annotate 'line', 3102
    addattribute $P0, 'rexpr'
.end
.namespace [ 'OpBinaryIntExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3144
    .return('I')
# }
.annotate 'line', 3145

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3148
    self.'optimizearg'()
.annotate 'line', 3149
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3150
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3151
    $I3 = $P1.'isintegerliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isintegerliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 3152
# li: $I1
# predefined int
    getattribute $P3, $P1, 'numval'
    set $I1, $P3
.annotate 'line', 3153
# ri: $I2
# predefined int
    getattribute $P3, $P2, 'numval'
    set $I2, $P3
.annotate 'line', 3154
.const 'Sub' $P4 = 'WSubId_16'
    getattribute $P3, self, 'owner'
    getattribute $P5, self, 'start'
    $P6 = self.'do_op'($I1, $I2)
    .tailcall $P4($P3, $P5, $P6)
# }
  __label_1: # endif
.annotate 'line', 3156
    .return(self)
# }
.annotate 'line', 3157

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBinaryIntExpr' ]
.annotate 'line', 3140
    get_class $P1, [ 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpDelExBase' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3166
    .return('I')
# }
.annotate 'line', 3167

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpDelExBase' ]
.annotate 'line', 3162
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
.annotate 'line', 3175
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3176

.end # OpDeleteExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3179
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3180
    isa $I1, $P1, [ 'IndexExpr' ]
    unless $I1 goto __label_3
    $P2 = $P1.'checkresult'()
    set $S1, $P2
    isne $I1, $S1, 'S'
  __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 3181
    $P1.'emit_prep'(__ARG_1)
.annotate 'line', 3182
    self.'annotate'(__ARG_1)
.annotate 'line', 3183
    __ARG_1.'print'('    delete ')
.annotate 'line', 3184
    $P1.'emit_aux'(__ARG_1)
.annotate 'line', 3185
    __ARG_1.'say'()
.annotate 'line', 3186
    set $S1, __ARG_2
    eq $S1, '', __label_4
.annotate 'line', 3187
    __ARG_1.'emitset'(__ARG_2, '1')
  __label_4: # endif
# }
    goto __label_2
  __label_1: # else
.const 'Sub' $P3 = 'WSubId_1'
.annotate 'line', 3190
    getattribute $P2, self, 'start'
    $P3("delete with invalid operator", $P2)
  __label_2: # endif
# }
.annotate 'line', 3191

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpDeleteExpr' ]
.annotate 'line', 3171
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
.annotate 'line', 3198
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3199

.end # OpExistsExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3202
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3203
# reg: $S1
    set $S2, __ARG_2
    eq $S2, '', __label_2
    set $P2, __ARG_2
    goto __label_1
  __label_2:
    $P2 = self.'tempreg'('I')
  __label_1:
    null $S1
    if_null $P2, __label_3
    set $S1, $P2
  __label_3:
.annotate 'line', 3204
    isa $I1, $P1, [ 'IndexExpr' ]
    unless $I1 goto __label_6
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    isne $I1, $S2, 'S'
  __label_6:
    unless $I1 goto __label_4
# {
.annotate 'line', 3205
    $P1.'emit_prep'(__ARG_1)
.annotate 'line', 3206
    self.'annotate'(__ARG_1)
.annotate 'line', 3207
    __ARG_1.'print'('    exists ', $S1, ', ')
.annotate 'line', 3208
    $P1.'emit_aux'(__ARG_1)
.annotate 'line', 3209
    __ARG_1.'say'()
# }
    goto __label_5
  __label_4: # else
.const 'Sub' $P3 = 'WSubId_1'
.annotate 'line', 3212
    getattribute $P2, self, 'start'
    $P3("exists with invalid operator", $P2)
  __label_5: # endif
# }
.annotate 'line', 3213

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpExistsExpr' ]
.annotate 'line', 3194
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
.annotate 'line', 3222
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3223

.end # OpUnaryMinusExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3226
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3227

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3230
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3231
    .return(self)
# }
.annotate 'line', 3232

.end # set


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3235
    self.'optimizearg'()
.annotate 'line', 3236
    getattribute $P4, self, 'subexpr'
    $P3 = $P4.'isintegerliteral'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 3237
# var numval: $P1
    getattribute $P5, self, 'subexpr'
    getattribute $P1, $P5, 'numval'
.annotate 'line', 3238
# i: $I1
    set $P3, $P1
    set $I1, $P3
.annotate 'line', 3239
.const 'Sub' $P6 = 'WSubId_16'
    getattribute $P3, self, 'owner'
    getattribute $P5, self, 'subexpr'
    getattribute $P4, $P5, 'start'
    neg $I2, $I1
    .tailcall $P6($P3, $P4, $I2)
# }
  __label_1: # endif
# {
.annotate 'line', 3242
    getattribute $P4, self, 'subexpr'
    $P3 = $P4.'isfloatliteral'()
    if_null $P3, __label_2
    unless $P3 goto __label_2
# {
.annotate 'line', 3243
# var numval: $P2
    getattribute $P5, self, 'subexpr'
    getattribute $P2, $P5, 'numval'
.annotate 'line', 3244
# n: $N1
# predefined string
    set $S1, $P2
    set $N1, $S1
.annotate 'line', 3245
.const 'Sub' $P7 = 'WSubId_50'
    getattribute $P3, self, 'owner'
    getattribute $P5, self, 'subexpr'
    getattribute $P4, $P5, 'start'
    neg $N2, $N1
    .tailcall $P7($P3, $P4, $N2)
# }
  __label_2: # endif
# }
.annotate 'line', 3248
    .return(self)
# }
.annotate 'line', 3249

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3252
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3253
    self.'annotate'(__ARG_1)
.annotate 'line', 3254
    __ARG_1.'emitarg2'('neg', __ARG_2, $S1)
# }
.annotate 'line', 3255

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpUnaryMinusExpr' ]
.annotate 'line', 3218
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
.annotate 'line', 3264
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3265

.end # OpNotExpr


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3266
    .return(1)
# }

.end # isnegable


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3269
    .return('I')
# }
.annotate 'line', 3270

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3273
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3274
    .return(self)
# }
.annotate 'line', 3275

.end # set


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3278
    self.'optimizearg'()
.annotate 'line', 3279
# var subexpr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3280
    $P3 = $P1.'isintegerliteral'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 3281
# var numval: $P2
    getattribute $P2, $P1, 'numval'
.annotate 'line', 3282
# n: $I1
    set $P3, $P2
    set $I1, $P3
.annotate 'line', 3283
.const 'Sub' $P4 = 'WSubId_16'
    getattribute $P3, self, 'owner'
    getattribute $P5, $P1, 'start'
    not $I2, $I1
    .tailcall $P4($P3, $P5, $I2)
# }
  __label_1: # endif
.annotate 'line', 3285
    $P3 = $P1.'isnegable'()
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 3286
    .tailcall $P1.'negated'()
  __label_2: # endif
.annotate 'line', 3287
    .return(self)
# }
.annotate 'line', 3288

.end # optimize


.sub 'negated' :method
# Body
# {
.annotate 'line', 3291
    getattribute $P1, self, 'subexpr'
    .return($P1)
# }
.annotate 'line', 3292

.end # negated


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3295
# var subexpr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3296
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3297
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 3298
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    set $S3, 'I'
    if $S2 == $S3 goto __label_4
    set $S3, 'P'
    if $S2 == $S3 goto __label_5
    goto __label_3
  __label_4: # case
.annotate 'line', 3300
    __ARG_1.'emitarg2'('not', __ARG_2, $S1)
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 3303
    __ARG_1.'emitarg2'('isfalse', __ARG_2, $S1)
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 3306
    __ARG_1.'emitarg2'('isfalse', __ARG_2, $S1)
  __label_2: # switch end
# }
.annotate 'line', 3308

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpNotExpr' ]
.annotate 'line', 3260
    get_class $P1, [ 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpIncDec' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3317
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3318

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpIncDec' ]
.annotate 'line', 3313
    get_class $P1, [ 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpPreIncDec' ]

.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3327
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3328
    set $S2, __ARG_2
    eq $S2, '', __label_2
.annotate 'line', 3329
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_2: # endif
# }
.annotate 'line', 3330

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpPreIncDec' ]
.annotate 'line', 3323
    get_class $P1, [ 'OpIncDec' ]
    addparent $P0, $P1
.end
.namespace [ 'OpPreIncExpr' ]

.sub 'OpPreIncExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3337
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3338

.end # OpPreIncExpr


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3341
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3342
    self.'annotate'(__ARG_1)
.annotate 'line', 3343
    __ARG_1.'emitinc'($S1)
.annotate 'line', 3344
    .return($S1)
# }
.annotate 'line', 3345

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpPreIncExpr' ]
.annotate 'line', 3333
    get_class $P1, [ 'OpPreIncDec' ]
    addparent $P0, $P1
.end
.namespace [ 'OpPreDecExpr' ]

.sub 'OpPreDecExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3352
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3353

.end # OpPreDecExpr


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3356
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3357
    self.'annotate'(__ARG_1)
.annotate 'line', 3358
    __ARG_1.'emitdec'($S1)
.annotate 'line', 3359
    .return($S1)
# }
.annotate 'line', 3360

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpPreDecExpr' ]
.annotate 'line', 3348
    get_class $P1, [ 'OpPreIncDec' ]
    addparent $P0, $P1
.end
.namespace [ 'OpPostIncExpr' ]

.sub 'OpPostIncExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3369
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3370

.end # OpPostIncExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3373
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3374
    self.'annotate'(__ARG_1)
.annotate 'line', 3375
    set $S2, __ARG_2
    eq $S2, '', __label_2
.annotate 'line', 3376
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_2: # endif
.annotate 'line', 3377
    __ARG_1.'emitinc'($S1)
.annotate 'line', 3378
    .return($S1)
# }
.annotate 'line', 3379

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpPostIncExpr' ]
.annotate 'line', 3365
    get_class $P1, [ 'OpIncDec' ]
    addparent $P0, $P1
.end
.namespace [ 'OpPostDecExpr' ]

.sub 'OpPostDecExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3386
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3387

.end # OpPostDecExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3390
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3391
    self.'annotate'(__ARG_1)
.annotate 'line', 3392
    set $S2, __ARG_2
    eq $S2, '', __label_2
.annotate 'line', 3393
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_2: # endif
.annotate 'line', 3394
    __ARG_1.'emitdec'($S1)
.annotate 'line', 3395
    .return($S1)
# }
.annotate 'line', 3396

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpPostDecExpr' ]
.annotate 'line', 3382
    get_class $P1, [ 'OpIncDec' ]
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
.annotate 'line', 3407
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3408
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 3409
    setattribute self, 'rexpr', __ARG_4
.annotate 'line', 3410
    .return(self)
# }
.annotate 'line', 3411

.end # set


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3414
    getattribute $P1, self, 'lexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3415

.end # checkresult


.sub 'optimize_base' :method
# Body
# {
.annotate 'line', 3418
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 3419
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'rexpr', $P2
.annotate 'line', 3420
    .return(self)
# }
.annotate 'line', 3421

.end # optimize_base


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3424
    .tailcall self.'optimize_base'()
# }
.annotate 'line', 3425

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3428
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3429
    set $S2, __ARG_2
    eq $S2, '', __label_2
# {
.annotate 'line', 3430
    self.'annotate'(__ARG_1)
.annotate 'line', 3431
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_2: # endif
# }
.annotate 'line', 3433

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBaseAssignExpr' ]
.annotate 'line', 3401
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3403
    addattribute $P0, 'lexpr'
.annotate 'line', 3404
    addattribute $P0, 'rexpr'
.end
.namespace [ 'OpAssignExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3442
    self.'annotate'(__ARG_1)
.annotate 'line', 3443
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3444
    getattribute $P2, self, 'rexpr'
    .tailcall $P1.'emit_assign_get'(__ARG_1, $P2)
# }
.annotate 'line', 3445

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpAssignExpr' ]
.annotate 'line', 3438
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpAssignToExpr' ]

.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3454
    self.'annotate'(__ARG_1)
.annotate 'line', 3455
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3456
    isnull $I1, __ARG_2
    not $I1
    unless $I1 goto __label_3
    set $S2, __ARG_2
    isne $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 3457
    __ARG_1.'emitassign'(__ARG_2, $S1)
  __label_2: # endif
# }
.annotate 'line', 3458

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3461
    self.'annotate'(__ARG_1)
.annotate 'line', 3462
# reg: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3463
# reg2: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3464
    __ARG_1.'emitassign'($S1, $S2)
.annotate 'line', 3465
    .return($S1)
# }
.annotate 'line', 3466

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpAssignToExpr' ]
.annotate 'line', 3450
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpAddToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3475
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3476
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3477
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 3478
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 3479
# reg: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 3480
    iseq $I1, $S1, 'S'
    unless $I1 goto __label_6
    isa $I1, $P2, [ 'ConcatString' ]
  __label_6:
    unless $I1 goto __label_4
.annotate 'line', 3481
    $P2.'emit_concat_to'(__ARG_1, $S3)
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 3483
# reg2: $S4
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_7
    set $S4, $P3
  __label_7:
.annotate 'line', 3484
# aux: $S5
    null $S5
.annotate 'line', 3485
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 3486
    set $S6, $S1
    set $S7, 'S'
    if $S6 == $S7 goto __label_10
    set $S7, 'I'
    if $S6 == $S7 goto __label_11
    set $S7, 'N'
    if $S6 == $S7 goto __label_12
    goto __label_9
  __label_10: # case
.annotate 'line', 3488
    eq $S2, 'S', __label_13
# {
.annotate 'line', 3489
    $P3 = self.'tempreg'('S')
    set $S5, $P3
.annotate 'line', 3490
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3491
    set $S4, $S5
# }
  __label_13: # endif
.annotate 'line', 3493
    __ARG_1.'emitconcat1'($S3, $S4)
    goto __label_8 # break
  __label_11: # case
  __label_12: # case
.annotate 'line', 3497
    eq $S1, $S2, __label_14
# {
.annotate 'line', 3498
    $P3 = self.'tempreg'($S1)
    set $S5, $P3
.annotate 'line', 3499
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3500
    set $S4, $S5
# }
  __label_14: # endif
.annotate 'line', 3502
    __ARG_1.'emitaddto'($S3, $S4)
    goto __label_8 # break
  __label_9: # default
.annotate 'line', 3505
    __ARG_1.'emitaddto'($S3, $S4)
  __label_8: # switch end
# }
  __label_5: # endif
.annotate 'line', 3508
    .return($S3)
# }
.annotate 'line', 3509

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpAddToExpr' ]
.annotate 'line', 3471
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpSubToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3518
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3519
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3520
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 3521
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 3522
# reg: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 3523
# reg2: $S4
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_4
    set $S4, $P3
  __label_4:
.annotate 'line', 3524
# aux: $S5
    null $S5
.annotate 'line', 3525
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 3526
    set $S6, $S1
    set $S7, 'S'
    if $S6 == $S7 goto __label_7
    set $S7, 'I'
    if $S6 == $S7 goto __label_8
    set $S7, 'N'
    if $S6 == $S7 goto __label_9
    goto __label_6
  __label_7: # case
.const 'Sub' $P4 = 'WSubId_1'
.annotate 'line', 3528
    getattribute $P3, self, 'start'
    $P4("-= can't be applied to string", $P3)
  __label_8: # case
  __label_9: # case
.annotate 'line', 3531
    eq $S1, $S2, __label_10
# {
.annotate 'line', 3532
    $P5 = self.'tempreg'($S1)
    set $S5, $P5
.annotate 'line', 3533
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3534
    set $S4, $S5
# }
  __label_10: # endif
.annotate 'line', 3536
    __ARG_1.'emitsubto'($S3, $S4)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 3539
    __ARG_1.'emitsubto'($S3, $S4)
  __label_5: # switch end
.annotate 'line', 3541
    .return($S3)
# }
.annotate 'line', 3542

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpSubToExpr' ]
.annotate 'line', 3514
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpMulToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3551
# ltype: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3552
# rtype: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3553
# lreg: $S3
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 3554
# rreg: $S4
    null $S4
# switch
.annotate 'line', 3555
    set $S5, $S1
    set $S6, 'S'
    if $S5 == $S6 goto __label_6
    goto __label_5
  __label_6: # case
.annotate 'line', 3557
    ne $S2, 'I', __label_7
.annotate 'line', 3558
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    set $S4, $P1
    goto __label_8
  __label_7: # else
# {
.annotate 'line', 3560
    $P3 = self.'tempreg'('I')
    set $S4, $P3
.annotate 'line', 3561
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S4)
# }
  __label_8: # endif
.annotate 'line', 3563
    self.'annotate'(__ARG_1)
.annotate 'line', 3564
    __ARG_1.'emitrepeat'($S3, $S3, $S4)
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 3567
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    set $S4, $P1
.annotate 'line', 3568
    self.'annotate'(__ARG_1)
.annotate 'line', 3569
    __ARG_1.'emitarg2'('mul', $S3, $S4)
  __label_4: # switch end
.annotate 'line', 3571
    .return($S3)
# }
.annotate 'line', 3572

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpMulToExpr' ]
.annotate 'line', 3547
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpDivToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3581
# type: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3582
# reg: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3583
# reg2: $S3
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 3584
    self.'annotate'(__ARG_1)
.annotate 'line', 3585
    __ARG_1.'emitarg2'('div', $S2, $S3)
.annotate 'line', 3586
    .return($S2)
# }
.annotate 'line', 3587

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpDivToExpr' ]
.annotate 'line', 3577
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpModToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3596
# type: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3597
# reg: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3598
# reg2: $S3
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 3599
    self.'annotate'(__ARG_1)
.annotate 'line', 3600
    __ARG_1.'emitarg2'('mod', $S2, $S3)
.annotate 'line', 3601
    .return($S2)
# }
.annotate 'line', 3602

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpModToExpr' ]
.annotate 'line', 3592
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'ComparatorBaseExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3609
    .return('I')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3612
    self.'optimizearg'()
.annotate 'line', 3613
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3614
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3615
    $I3 = $P1.'isintegerliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isintegerliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 3616
# li: $I1
# predefined int
    getattribute $P3, $P1, 'numval'
    set $I1, $P3
.annotate 'line', 3617
# ri: $I2
# predefined int
    getattribute $P3, $P2, 'numval'
    set $I2, $P3
.annotate 'line', 3618
.const 'Sub' $P4 = 'WSubId_16'
    getattribute $P3, self, 'owner'
    getattribute $P5, self, 'start'
    $P6 = self.'int_op'($I1, $I2)
    .tailcall $P4($P3, $P5, $P6)
# }
  __label_1: # endif
.annotate 'line', 3620
    .return(self)
# }
.annotate 'line', 3621

.end # optimize


.sub 'emit_comparator' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 3624
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3625
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3626
# regl: $S3
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 3627
# regr: $S4
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P1, __label_4
    set $S4, $P1
  __label_4:
.annotate 'line', 3628
    self.'annotate'(__ARG_1)
.annotate 'line', 3629
# aux: $S5
    null $S5
# switch-case
.annotate 'line', 3631
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_8
    iseq $I1, $S2, 'N'
  __label_8:
    if $I1 goto __label_7
.annotate 'line', 3636
    iseq $I1, $S1, 'N'
    unless $I1 goto __label_10
    iseq $I1, $S2, 'I'
  __label_10:
    if $I1 goto __label_9
.annotate 'line', 3641
    iseq $I1, $S2, 'I'
    unless $I1 goto __label_12
    iseq $I1, $S1, 'P'
  __label_12:
    if $I1 goto __label_11
.annotate 'line', 3646
    iseq $I1, $S2, 'P'
    unless $I1 goto __label_14
    iseq $I1, $S1, 'I'
  __label_14:
    if $I1 goto __label_13
.annotate 'line', 3651
    iseq $I1, $S2, 'S'
    unless $I1 goto __label_16
    iseq $I1, $S1, 'P'
  __label_16:
    if $I1 goto __label_15
.annotate 'line', 3656
    iseq $I1, $S2, 'P'
    unless $I1 goto __label_18
    iseq $I1, $S1, 'S'
  __label_18:
    if $I1 goto __label_17
    goto __label_6
  __label_7: # case
.annotate 'line', 3632
    $P1 = self.'tempreg'('N')
    set $S5, $P1
.annotate 'line', 3633
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3634
    set $S3, $S5
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 3637
    $P2 = self.'tempreg'('N')
    set $S5, $P2
.annotate 'line', 3638
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3639
    set $S4, $S5
    goto __label_5 # break
  __label_11: # case
.annotate 'line', 3642
    $P3 = self.'tempreg'('I')
    set $S5, $P3
.annotate 'line', 3643
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3644
    set $S3, $S5
    goto __label_5 # break
  __label_13: # case
.annotate 'line', 3647
    $P4 = self.'tempreg'('I')
    set $S5, $P4
.annotate 'line', 3648
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3649
    set $S4, $S5
    goto __label_5 # break
  __label_15: # case
.annotate 'line', 3652
    $P5 = self.'tempreg'('S')
    set $S5, $P5
.annotate 'line', 3653
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3654
    set $S3, $S5
    goto __label_5 # break
  __label_17: # case
.annotate 'line', 3657
    $P6 = self.'tempreg'('S')
    set $S5, $P6
.annotate 'line', 3658
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3659
    set $S4, $S5
    goto __label_5 # break
  __label_6: # default
  __label_5: # switch end
.annotate 'line', 3660
# switch
.annotate 'line', 3663
    set $I1, __ARG_3
    null $I2
    if $I1 == $I2 goto __label_21
    set $I2, 1
    if $I1 == $I2 goto __label_22
    set $I2, 2
    if $I1 == $I2 goto __label_23
    goto __label_20
  __label_21: # case
.annotate 'line', 3665
    self.'emitop'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_19 # break
  __label_22: # case
.annotate 'line', 3668
    self.'emitop_if'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_19 # break
  __label_23: # case
.annotate 'line', 3671
    self.'emitop_else'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_19 # break
  __label_20: # default
  __label_19: # switch end
.annotate 'line', 3672
# }
.annotate 'line', 3674

.end # emit_comparator


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3677
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3678

.end # emit


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 3681
    self.'emit_comparator'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 3682

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 3685
    self.'emit_comparator'(__ARG_1, __ARG_2, 2)
# }
.annotate 'line', 3686

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ComparatorBaseExpr' ]
.annotate 'line', 3607
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
.annotate 'line', 3701
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 3702
    setattribute self, 'expr', __ARG_2
.annotate 'line', 3703
    box $P1, __ARG_3
    setattribute self, 'checknull', $P1
# }
.annotate 'line', 3704

.end # NullCheckerExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3705
    .return('I')
# }

.end # checkresult


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3706
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3709
# checkneg: $I1
    getattribute $P1, self, 'checknull'
    isfalse $I1, $P1
.annotate 'line', 3710
    box $P1, $I1
    setattribute self, 'checknull', $P1
.annotate 'line', 3711
    .return(self)
# }
.annotate 'line', 3712

.end # negated


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3715
# reg: $S1
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3716
    self.'annotate'(__ARG_1)
.annotate 'line', 3717
    __ARG_1.'emitarg2'('isnull', __ARG_2, $S1)
.annotate 'line', 3718
    getattribute $P1, self, 'checknull'
    isfalse $I1, $P1
    unless $I1 goto __label_2
.annotate 'line', 3719
    __ARG_1.'emitarg1'('not', __ARG_2)
  __label_2: # endif
# }
.annotate 'line', 3720

.end # emit


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 3723
# reg: $S1
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3724
    self.'annotate'(__ARG_1)
.annotate 'line', 3725
    getattribute $P1, self, 'checknull'
    if_null $P1, __label_3
    unless $P1 goto __label_3
    set $S2, 'unless'
    goto __label_2
  __label_3:
    set $S2, 'if'
  __label_2:
    __ARG_1.'say'('    ', $S2, '_null ', $S1, ', ', __ARG_2)
# }
.annotate 'line', 3726

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NullCheckerExpr' ]
.annotate 'line', 3694
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3696
    addattribute $P0, 'expr'
.annotate 'line', 3697
    addattribute $P0, 'checknull'
.end
.namespace [ 'OpEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3733
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3736
    new $P1, [ 'OpNotEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3737

.end # negated


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3740
    self.'optimizearg'()
.annotate 'line', 3741
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3742
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3743
# lnull: $I1
    $P3 = $P1.'isnull'()
    set $I1, $P3
.annotate 'line', 3744
# rnull: $I2
    $P3 = $P2.'isnull'()
    set $I2, $P3
.annotate 'line', 3745
    unless $I1 goto __label_1
# {
.annotate 'line', 3746
    unless $I2 goto __label_2
.annotate 'line', 3747
.const 'Sub' $P4 = 'WSubId_16'
    getattribute $P3, self, 'owner'
    getattribute $P5, self, 'start'
    .tailcall $P4($P3, $P5, 1)
    goto __label_3
  __label_2: # else
.annotate 'line', 3749
    new $P7, [ 'NullCheckerExpr' ]
    getattribute $P8, self, 'rexpr'
    $P7.'NullCheckerExpr'(self, $P8, 1)
    set $P6, $P7
    .return($P6)
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 3751
    unless $I2 goto __label_4
.annotate 'line', 3752
    new $P5, [ 'NullCheckerExpr' ]
    getattribute $P6, self, 'lexpr'
    $P5.'NullCheckerExpr'(self, $P6, 1)
    set $P3, $P5
    .return($P3)
  __label_4: # endif
.annotate 'line', 3753
    $I5 = $P1.'isliteral'()
    unless $I5 goto __label_6
    $I5 = $P2.'isliteral'()
  __label_6:
    unless $I5 goto __label_5
# {
.annotate 'line', 3754
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_7
    set $S1, $P3
  __label_7:
.annotate 'line', 3755
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_8
    set $S2, $P3
  __label_8:
.annotate 'line', 3756
    ne $S1, $S2, __label_9
# {
# switch
.annotate 'line', 3757
    set $S5, $S1
    set $S6, 'I'
    if $S5 == $S6 goto __label_12
    set $S6, 'S'
    if $S5 == $S6 goto __label_13
    goto __label_11
  __label_12: # case
.annotate 'line', 3759
# li: $I3
# predefined int
    getattribute $P3, $P1, 'numval'
    set $I3, $P3
.annotate 'line', 3760
# ri: $I4
# predefined int
    getattribute $P5, $P2, 'numval'
    set $I4, $P5
.annotate 'line', 3761
.const 'Sub' $P9 = 'WSubId_16'
    getattribute $P6, self, 'owner'
    getattribute $P7, self, 'start'
    iseq $I5, $I3, $I4
    .tailcall $P9($P6, $P7, $I5)
  __label_13: # case
.annotate 'line', 3763
# ls: $S3
    getattribute $P10, $P1, 'strval'
    getattribute $P8, $P10, 'str'
    null $S3
    if_null $P8, __label_14
    set $S3, $P8
  __label_14:
.annotate 'line', 3764
# rs: $S4
    getattribute $P12, $P2, 'strval'
    getattribute $P11, $P12, 'str'
    null $S4
    if_null $P11, __label_15
    set $S4, $P11
  __label_15:
.annotate 'line', 3765
.const 'Sub' $P13 = 'WSubId_16'
    getattribute $P14, self, 'owner'
    getattribute $P15, self, 'start'
    iseq $I6, $S3, $S4
    .tailcall $P13($P14, $P15, $I6)
  __label_11: # default
  __label_10: # switch end
# }
  __label_9: # endif
# }
  __label_5: # endif
.annotate 'line', 3769
    .return(self)
# }
.annotate 'line', 3770

.end # optimize


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3773
    __ARG_1.'emitbinop'('iseq', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3774

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3777
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3778

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3781
    __ARG_1.'emitcompare'('eq', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3782

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3785
    __ARG_1.'emitcompare'('ne', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3786

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpEqualExpr' ]
.annotate 'line', 3731
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpNotEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3793
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3796
    new $P1, [ 'OpEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3797

.end # negated


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3800
    self.'optimizearg'()
.annotate 'line', 3801
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3802
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3803
# lnull: $I1
    $P3 = $P1.'isnull'()
    set $I1, $P3
.annotate 'line', 3804
# rnull: $I2
    $P3 = $P2.'isnull'()
    set $I2, $P3
.annotate 'line', 3805
    unless $I1 goto __label_1
# {
.annotate 'line', 3806
    unless $I2 goto __label_2
.annotate 'line', 3807
.const 'Sub' $P4 = 'WSubId_16'
    getattribute $P3, self, 'owner'
    getattribute $P5, self, 'start'
    .tailcall $P4($P3, $P5, 0)
    goto __label_3
  __label_2: # else
.annotate 'line', 3809
    new $P7, [ 'NullCheckerExpr' ]
    getattribute $P8, self, 'rexpr'
    $P7.'NullCheckerExpr'(self, $P8, 0)
    set $P6, $P7
    .return($P6)
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 3811
    unless $I2 goto __label_4
.annotate 'line', 3812
    new $P5, [ 'NullCheckerExpr' ]
    getattribute $P6, self, 'lexpr'
    $P5.'NullCheckerExpr'(self, $P6, 0)
    set $P3, $P5
    .return($P3)
  __label_4: # endif
.annotate 'line', 3813
    $I5 = $P1.'isliteral'()
    unless $I5 goto __label_6
    $I5 = $P2.'isliteral'()
  __label_6:
    unless $I5 goto __label_5
# {
.annotate 'line', 3814
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_7
    set $S1, $P3
  __label_7:
.annotate 'line', 3815
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_8
    set $S2, $P3
  __label_8:
.annotate 'line', 3816
    ne $S1, $S2, __label_9
# {
# switch
.annotate 'line', 3817
    set $S5, $S1
    set $S6, 'I'
    if $S5 == $S6 goto __label_12
    set $S6, 'S'
    if $S5 == $S6 goto __label_13
    goto __label_11
  __label_12: # case
.annotate 'line', 3819
# li: $I3
# predefined int
    getattribute $P3, $P1, 'numval'
    set $I3, $P3
.annotate 'line', 3820
# ri: $I4
# predefined int
    getattribute $P5, $P2, 'numval'
    set $I4, $P5
.annotate 'line', 3821
.const 'Sub' $P9 = 'WSubId_16'
    getattribute $P6, self, 'owner'
    getattribute $P7, self, 'start'
    isne $I5, $I3, $I4
    .tailcall $P9($P6, $P7, $I5)
  __label_13: # case
.annotate 'line', 3823
# ls: $S3
    getattribute $P10, $P1, 'strval'
    getattribute $P8, $P10, 'str'
    null $S3
    if_null $P8, __label_14
    set $S3, $P8
  __label_14:
.annotate 'line', 3824
# rs: $S4
    getattribute $P12, $P2, 'strval'
    getattribute $P11, $P12, 'str'
    null $S4
    if_null $P11, __label_15
    set $S4, $P11
  __label_15:
.annotate 'line', 3825
.const 'Sub' $P13 = 'WSubId_16'
    getattribute $P14, self, 'owner'
    getattribute $P15, self, 'start'
    isne $I6, $S3, $S4
    .tailcall $P13($P14, $P15, $I6)
  __label_11: # default
  __label_10: # switch end
# }
  __label_9: # endif
# }
  __label_5: # endif
.annotate 'line', 3829
    .return(self)
# }
.annotate 'line', 3830

.end # optimize


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3833
    __ARG_1.'emitbinop'('isne', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3834

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3837
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3838

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3841
    __ARG_1.'emitcompare'('ne', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3842

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3845
    __ARG_1.'emitcompare'('eq', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3846

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpNotEqualExpr' ]
.annotate 'line', 3791
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
.annotate 'line', 3856
    self.'initbinary'(__ARG_2, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 3857
    box $P1, __ARG_1
    setattribute self, 'positive', $P1
# }
.annotate 'line', 3858

.end # OpSameExpr


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3859
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3862
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 3863
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
.annotate 'line', 3864

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 3867
    getattribute $P1, self, 'positive'
    if_null $P1, __label_2
    unless $P1 goto __label_2
    iseq $I1, __ARG_1, __ARG_2
    goto __label_1
  __label_2:
    isne $I1, __ARG_1, __ARG_2
  __label_1:
    .return($I1)
# }
.annotate 'line', 3868

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3871
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 3872
# op: $S1
    unless $I1 goto __label_2
    set $S1, 'issame'
    goto __label_1
  __label_2:
    set $S1, 'isntsame'
  __label_1:
.annotate 'line', 3873
    __ARG_1.'emitbinop'($S1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3874

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3877
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3878

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3881
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 3882
# op: $S1
    unless $I1 goto __label_2
    set $S1, 'eq_addr'
    goto __label_1
  __label_2:
    set $S1, 'ne_addr'
  __label_1:
.annotate 'line', 3883
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3884

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3887
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 3888
# op: $S1
    unless $I1 goto __label_2
    set $S1, 'ne_addr'
    goto __label_1
  __label_2:
    set $S1, 'eq_addr'
  __label_1:
.annotate 'line', 3889
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3890

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpSameExpr' ]
.annotate 'line', 3851
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 3853
    addattribute $P0, 'positive'
.end
.namespace [ 'OpLessExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3897
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3900
    new $P1, [ 'OpGreaterEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3901

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 3904
    islt $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 3905

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3908
    __ARG_1.'emitbinop'('islt', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3909

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3912
    __ARG_1.'emitcompare'('lt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3913

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3916
    __ARG_1.'emitcompare'('ge', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3917

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpLessExpr' ]
.annotate 'line', 3895
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpGreaterExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3924
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3927
    new $P1, [ 'OpLessEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3928

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 3931
    isgt $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 3932

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3935
    __ARG_1.'emitbinop'('isgt', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3936

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3939
    __ARG_1.'emitcompare'('gt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3940

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3943
    __ARG_1.'emitcompare'('le', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3944

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpGreaterExpr' ]
.annotate 'line', 3922
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpLessEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3951
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3954
    new $P1, [ 'OpGreaterExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3955

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 3958
    isle $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 3959

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3962
    __ARG_1.'emitbinop'('isle', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3963

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3966
    __ARG_1.'emitcompare'('le', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3967

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3970
    __ARG_1.'emitcompare'('gt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3971

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpLessEqualExpr' ]
.annotate 'line', 3949
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpGreaterEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3978
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3981
    new $P1, [ 'OpLessExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3982

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 3985
    isge $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 3986

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3989
    __ARG_1.'emitbinop'('isge', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3990

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3993
    __ARG_1.'emitcompare'('ge', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3994

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3997
    __ARG_1.'emitcompare'('lt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3998

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpGreaterEqualExpr' ]
.annotate 'line', 3976
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpBaseBoolExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4007
    .return('I')
# }
.annotate 'line', 4008

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBaseBoolExpr' ]
.annotate 'line', 4003
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
.annotate 'line', 4017
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4018

.end # OpBoolAndExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4021
    self.'optimizearg'()
.annotate 'line', 4022
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
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
    eq $I1, 0, __label_2
.annotate 'line', 4026
    getattribute $P2, self, 'rexpr'
    .return($P2)
    goto __label_3
  __label_2: # else
.annotate 'line', 4028
.const 'Sub' $P5 = 'WSubId_16'
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall $P5($P3, $P4, $I1)
  __label_3: # endif
# }
  __label_1: # endif
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
    if_null __ARG_2, __label_2
    set $P1, __ARG_2
    goto __label_1
  __label_2:
    $P1 = self.'tempreg'('I')
  __label_1:
    null $S1
    if_null $P1, __label_3
    set $S1, $P1
  __label_3:
.annotate 'line', 4035
    getattribute $P1, self, 'lexpr'
    $I1 = $P1.'issimple'()
    unless $I1 goto __label_6
    getattribute $P2, self, 'rexpr'
    $I1 = $P2.'issimple'()
  __label_6:
    unless $I1 goto __label_4
# {
.annotate 'line', 4036
# lreg: $S2
    $P3 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P3, __label_7
    set $S2, $P3
  __label_7:
.annotate 'line', 4037
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_8
    set $S3, $P1
  __label_8:
.annotate 'line', 4038
    __ARG_1.'emitbinop'('and', $S1, $S2, $S3)
# }
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 4041
# l: $S4
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S4
    if_null $P1, __label_9
    set $S4, $P1
  __label_9:
.annotate 'line', 4042
    getattribute $P1, self, 'lexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4043
    __ARG_1.'emitunless'($S1, $S4)
.annotate 'line', 4044
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4045
    __ARG_1.'emitlabel'($S4)
# }
  __label_5: # endif
# }
.annotate 'line', 4047

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBoolAndExpr' ]
.annotate 'line', 4013
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
.annotate 'line', 4056
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4057

.end # OpBoolOrExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4060
    self.'optimizearg'()
.annotate 'line', 4061
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 4062
# var lval: $P1
    getattribute $P4, self, 'lexpr'
    getattribute $P1, $P4, 'numval'
.annotate 'line', 4063
# ln: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 4064
    ne $I1, 0, __label_2
.annotate 'line', 4065
    getattribute $P2, self, 'rexpr'
    .return($P2)
    goto __label_3
  __label_2: # else
.annotate 'line', 4067
.const 'Sub' $P5 = 'WSubId_16'
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall $P5($P3, $P4, $I1)
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 4069
    .return(self)
# }
.annotate 'line', 4070

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4073
# res: $S1
    null $S1
.annotate 'line', 4074
    if_null __ARG_2, __label_1
.annotate 'line', 4075
    set $S1, __ARG_2
    goto __label_2
  __label_1: # else
.annotate 'line', 4077
    $P1 = self.'tempreg'('I')
    set $S1, $P1
  __label_2: # endif
.annotate 'line', 4078
    getattribute $P1, self, 'lexpr'
    $I1 = $P1.'issimple'()
    unless $I1 goto __label_5
    getattribute $P2, self, 'rexpr'
    $I1 = $P2.'issimple'()
  __label_5:
    unless $I1 goto __label_3
# {
.annotate 'line', 4079
# lreg: $S2
    $P3 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P3, __label_6
    set $S2, $P3
  __label_6:
.annotate 'line', 4080
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_7
    set $S3, $P1
  __label_7:
.annotate 'line', 4081
    __ARG_1.'emitbinop'('or', $S1, $S2, $S3)
# }
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 4084
# l: $S4
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S4
    if_null $P1, __label_8
    set $S4, $P1
  __label_8:
.annotate 'line', 4085
    getattribute $P1, self, 'lexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4086
    __ARG_1.'emitif'($S1, $S4)
.annotate 'line', 4087
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4088
    __ARG_1.'emitlabel'($S4)
# }
  __label_4: # endif
# }
.annotate 'line', 4090

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBoolOrExpr' ]
.annotate 'line', 4052
    get_class $P1, [ 'OpBaseBoolExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpBaseBinExpr' ]
.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBaseBinExpr' ]
.annotate 'line', 4095
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
.annotate 'line', 4105
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4106

.end # OpBinAndExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4109
# res: $S1
    if_null __ARG_2, __label_2
    set $P1, __ARG_2
    goto __label_1
  __label_2:
    $P1 = self.'tempreg'('I')
  __label_1:
    null $S1
    if_null $P1, __label_3
    set $S1, $P1
  __label_3:
.annotate 'line', 4110
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4111
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4112
    self.'annotate'(__ARG_1)
.annotate 'line', 4113
    __ARG_1.'emitbinop'('band', $S1, $S2, $S3)
# }
.annotate 'line', 4114

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4117
    band $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4118

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBinAndExpr' ]
.annotate 'line', 4101
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
.annotate 'line', 4127
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4128

.end # OpBinOrExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4131
# res: $S1
    if_null __ARG_2, __label_2
    set $P1, __ARG_2
    goto __label_1
  __label_2:
    $P1 = self.'tempreg'('I')
  __label_1:
    null $S1
    if_null $P1, __label_3
    set $S1, $P1
  __label_3:
.annotate 'line', 4132
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4133
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4134
    self.'annotate'(__ARG_1)
.annotate 'line', 4135
    __ARG_1.'emitbinop'('bor', $S1, $S2, $S3)
# }
.annotate 'line', 4136

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4139
    bor $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4140

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBinOrExpr' ]
.annotate 'line', 4123
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
.annotate 'line', 4149
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4150

.end # OpBinXorExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4153
# res: $S1
    if_null __ARG_2, __label_2
    set $P1, __ARG_2
    goto __label_1
  __label_2:
    $P1 = self.'tempreg'('I')
  __label_1:
    null $S1
    if_null $P1, __label_3
    set $S1, $P1
  __label_3:
.annotate 'line', 4154
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4155
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4156
    self.'annotate'(__ARG_1)
.annotate 'line', 4157
    __ARG_1.'emitbinop'('bxor', $S1, $S2, $S3)
# }
.annotate 'line', 4158

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4161
    bxor $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4162

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBinXorExpr' ]
.annotate 'line', 4145
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
.annotate 'line', 4172
    self.'Expr'(__ARG_1, __ARG_2)
# switch-case
.annotate 'line', 4174
    isa $I1, __ARG_3, [ 'ConcatString' ]
    if $I1 goto __label_3
.annotate 'line', 4181
    isa $I1, __ARG_4, [ 'ConcatString' ]
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 4175
    getattribute $P2, __ARG_3, 'values'
    setattribute self, 'values', $P2
.annotate 'line', 4176
    isa $I2, __ARG_4, [ 'ConcatString' ]
    unless $I2 goto __label_5
.annotate 'line', 4177
    getattribute $P3, self, 'values'
    getattribute $P4, __ARG_4, 'values'
    $P3.'append'($P4)
    goto __label_6
  __label_5: # else
.annotate 'line', 4179
    getattribute $P5, self, 'values'
# predefined push
    push $P5, __ARG_4
  __label_6: # endif
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 4182
    getattribute $P7, __ARG_4, 'values'
    setattribute self, 'values', $P7
.annotate 'line', 4183
    getattribute $P8, self, 'values'
    $P8.'unshift'(__ARG_3)
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 4186
    root_new $P10, ['parrot';'ResizablePMCArray']
    push $P10, __ARG_3
    push $P10, __ARG_4
    setattribute self, 'values', $P10
  __label_1: # switch end
# }
.annotate 'line', 4188

.end # ConcatString


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4189
    .return('S')
# }

.end # checkresult


.sub 'getregs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4192
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 4193
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4194
    new $P2, ['FixedStringArray'], $I1
.annotate 'line', 4195
# i: $I2
    null $I2
# for loop
.annotate 'line', 4196
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 4197
# predefined string
    $P4 = $P1[$I2]
    $P3 = $P4.'emit_get'(__ARG_1)
    set $S1, $P3
    $P2[$I2] = $S1
  __label_1: # for iteration
.annotate 'line', 4196
    inc $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 4198
    .return($P2)
# }
.annotate 'line', 4199

.end # getregs


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4202
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4203
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4204
# auxreg: $S1
    set $S1, '$S0'
.annotate 'line', 4205
    self.'annotate'(__ARG_1)
.annotate 'line', 4206
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 4207
# i: $I2
    set $I2, 2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 4208
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'($S1, $P2)
  __label_1: # for iteration
.annotate 'line', 4207
    inc $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 4209
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
.annotate 'line', 4210

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4213
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4214
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4215
# auxreg: $S1
    $P2 = self.'tempreg'('S')
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4216
    self.'annotate'(__ARG_1)
.annotate 'line', 4217
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 4218
# i: $I2
    set $I2, 2
  __label_4: # for condition
    ge $I2, $I1, __label_3
.annotate 'line', 4219
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'($S1, $P2)
  __label_2: # for iteration
.annotate 'line', 4218
    inc $I2
    goto __label_4
  __label_3: # for end
.annotate 'line', 4220
    .return($S1)
# }
.annotate 'line', 4221

.end # emit_get


.sub 'emit_concat_to' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4224
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4225
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4226
    self.'annotate'(__ARG_1)
# for loop
.annotate 'line', 4227
# i: $I2
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 4228
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'(__ARG_2, $P2)
  __label_1: # for iteration
.annotate 'line', 4227
    inc $I2
    goto __label_3
  __label_2: # for end
# }
.annotate 'line', 4229

.end # emit_concat_to


.sub 'emit_concat_set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4232
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4233
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4234
    self.'annotate'(__ARG_1)
.annotate 'line', 4235
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'(__ARG_2, $P2, $P3)
# for loop
.annotate 'line', 4236
# i: $I2
    set $I2, 2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 4237
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'(__ARG_2, $P2)
  __label_1: # for iteration
.annotate 'line', 4236
    inc $I2
    goto __label_3
  __label_2: # for end
# }
.annotate 'line', 4238

.end # emit_concat_set

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ConcatString' ]
.annotate 'line', 4167
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 4169
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
.annotate 'line', 4247
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4248

.end # OpAddExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4251
    self.'optimizearg'()
.annotate 'line', 4252
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4253
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4254
# ltype: $S1
    $P10 = $P1.'checkresult'()
    null $S1
    if_null $P10, __label_1
    set $S1, $P10
  __label_1:
.annotate 'line', 4255
# rtype: $S2
    $P10 = $P2.'checkresult'()
    null $S2
    if_null $P10, __label_2
    set $S2, $P10
  __label_2:
.annotate 'line', 4256
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_4
    $I3 = $P2.'isliteral'()
  __label_4:
    unless $I3 goto __label_3
# {
.annotate 'line', 4257
    iseq $I4, $S1, 'S'
    unless $I4 goto __label_6
    iseq $I4, $S2, 'S'
  __label_6:
    unless $I4 goto __label_5
# {
.annotate 'line', 4262
# var etok: $P3
    getattribute $P3, $P1, 'strval'
.annotate 'line', 4263
# var rtok: $P4
    getattribute $P4, $P2, 'strval'
.annotate 'line', 4264
# var t: $P5
    isa $I3, $P3, [ 'TokenSingleQuoted' ]
    unless $I3 goto __label_9
.annotate 'line', 4265
    isa $I3, $P4, [ 'TokenSingleQuoted' ]
  __label_9:
    unless $I3 goto __label_8
.annotate 'line', 4267
    new $P10, [ 'TokenSingleQuoted' ]
    getattribute $P11, $P3, 'file'
    getattribute $P12, $P3, 'line'
# predefined string
.annotate 'line', 4268
    getattribute $P13, $P3, 'str'
.annotate 'line', 4264
    set $S3, $P13
# predefined string
.annotate 'line', 4268
    getattribute $P14, $P4, 'str'
.annotate 'line', 4264
    set $S4, $P14
.annotate 'line', 4268
    concat $S5, $S3, $S4
    $P10.'TokenSingleQuoted'($P11, $P12, $S5)
    set $P5, $P10
    goto __label_7
  __label_8:
.annotate 'line', 4270
    new $P15, [ 'TokenQuoted' ]
    getattribute $P16, $P3, 'file'
    getattribute $P17, $P3, 'line'
# predefined string
.annotate 'line', 4271
    $P18 = $P3.'getasquoted'()
.annotate 'line', 4264
    set $S6, $P18
# predefined string
.annotate 'line', 4271
    $P19 = $P4.'getasquoted'()
.annotate 'line', 4264
    set $S7, $P19
.annotate 'line', 4271
    concat $S8, $S6, $S7
    $P15.'TokenQuoted'($P16, $P17, $S8)
    set $P5, $P15
  __label_7:
.annotate 'line', 4272
    new $P11, [ 'StringLiteral' ]
    getattribute $P12, self, 'owner'
    $P11.'StringLiteral'($P12, $P5)
    set $P10, $P11
    .return($P10)
# }
  __label_5: # endif
.annotate 'line', 4274
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_11
    iseq $I3, $S2, 'I'
  __label_11:
    unless $I3 goto __label_10
# {
.annotate 'line', 4275
# var lval: $P6
    getattribute $P6, $P1, 'numval'
.annotate 'line', 4276
# ln: $I1
    set $P10, $P6
    set $I1, $P10
.annotate 'line', 4277
# var rval: $P7
    getattribute $P7, $P2, 'numval'
.annotate 'line', 4278
# rn: $I2
    set $P10, $P7
    set $I2, $P10
.annotate 'line', 4279
.const 'Sub' $P20 = 'WSubId_16'
    getattribute $P10, self, 'owner'
    getattribute $P11, self, 'start'
    add $I3, $I1, $I2
    .tailcall $P20($P10, $P11, $I3)
# }
  __label_10: # endif
# {
.annotate 'line', 4282
.const 'Sub' $P21 = 'WSubId_51'
    $P10 = $P21($S1, $S2)
    if_null $P10, __label_12
    unless $P10 goto __label_12
# {
.annotate 'line', 4283
# var lvalf: $P8
    getattribute $P8, $P1, 'numval'
.annotate 'line', 4284
# lf: $N1
# predefined string
    set $S3, $P8
    set $N1, $S3
.annotate 'line', 4285
# var rvalf: $P9
    getattribute $P9, $P2, 'numval'
.annotate 'line', 4286
# rf: $N2
# predefined string
    set $S3, $P9
    set $N2, $S3
.annotate 'line', 4287
.const 'Sub' $P22 = 'WSubId_50'
    getattribute $P10, self, 'owner'
    getattribute $P11, self, 'start'
    add $N3, $N1, $N2
    .tailcall $P22($P10, $P11, $N3)
# }
  __label_12: # endif
# }
# }
  __label_3: # endif
.annotate 'line', 4291
    iseq $I3, $S1, 'S'
    unless $I3 goto __label_14
    iseq $I3, $S2, 'S'
  __label_14:
    unless $I3 goto __label_13
# {
.annotate 'line', 4292
    new $P11, [ 'ConcatString' ]
    getattribute $P12, self, 'owner'
    getattribute $P13, self, 'start'
    $P11.'ConcatString'($P12, $P13, $P1, $P2)
    set $P10, $P11
    .return($P10)
# }
  __label_13: # endif
.annotate 'line', 4294
    .return(self)
# }
.annotate 'line', 4295

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4298
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4299
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4300
    ne $S1, $S2, __label_3
.annotate 'line', 4301
    .return($S1)
  __label_3: # endif
.annotate 'line', 4302
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_5
    iseq $I1, $S2, 'S'
  __label_5:
    unless $I1 goto __label_4
.annotate 'line', 4303
    .return('S')
  __label_4: # endif
.annotate 'line', 4304
    iseq $I1, $S1, 'S'
    unless $I1 goto __label_7
    iseq $I1, $S2, 'I'
  __label_7:
    unless $I1 goto __label_6
.annotate 'line', 4305
    .return('S')
  __label_6: # endif
.annotate 'line', 4306
.const 'Sub' $P3 = 'WSubId_51'
    $P1 = $P3($S1, $S2)
    if_null $P1, __label_8
    unless $P1 goto __label_8
.annotate 'line', 4307
    .return('N')
  __label_8: # endif
.annotate 'line', 4308
    .return('I')
# }
.annotate 'line', 4309

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4312
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4313
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4314
# restype: $S1
    $P3 = self.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4315
# ltype: $S2
    $P3 = $P1.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 4316
# rtype: $S3
    $P3 = $P2.'checkresult'()
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 4318
# rleft: $S4
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_4
    set $S4, $P3
  __label_4:
.annotate 'line', 4319
# rright: $S5
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S5
    if_null $P3, __label_5
    set $S5, $P3
  __label_5:
.annotate 'line', 4320
    ne $S1, 'S', __label_6
# {
.annotate 'line', 4321
    isne $I1, $S2, 'S'
    if $I1 goto __label_9
    isne $I1, $S3, 'S'
  __label_9:
    unless $I1 goto __label_8
# {
.annotate 'line', 4322
# aux: $S6
    $P3 = self.'tempreg'('S')
    null $S6
    if_null $P3, __label_10
    set $S6, $P3
  __label_10:
.annotate 'line', 4323
    eq $S2, 'S', __label_11
# {
.annotate 'line', 4324
    __ARG_1.'emitset'($S6, $S4)
.annotate 'line', 4325
    set $S4, $S6
# }
    goto __label_12
  __label_11: # else
# {
.annotate 'line', 4328
    __ARG_1.'emitset'($S6, $S5)
.annotate 'line', 4329
    set $S5, $S6
# }
  __label_12: # endif
# }
  __label_8: # endif
.annotate 'line', 4332
    __ARG_1.'emitconcat'(__ARG_2, $S4, $S5)
# }
    goto __label_7
  __label_6: # else
# {
.annotate 'line', 4335
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_15
    isne $I1, $S2, 'I'
    if $I1 goto __label_16
    isne $I1, $S3, 'I'
  __label_16:
  __label_15:
    unless $I1 goto __label_13
# {
.annotate 'line', 4336
# l: $S7
    null $S7
.annotate 'line', 4337
    ne $S2, 'I', __label_17
    set $S7, $S4
    goto __label_18
  __label_17: # else
# {
.annotate 'line', 4339
    $P3 = self.'tempreg'('I')
    set $S7, $P3
.annotate 'line', 4340
    __ARG_1.'emitset'($S7, $S4)
# }
  __label_18: # endif
.annotate 'line', 4342
# r: $S8
    null $S8
.annotate 'line', 4343
    ne $S3, 'I', __label_19
    set $S8, $S5
    goto __label_20
  __label_19: # else
# {
.annotate 'line', 4345
    $P3 = self.'tempreg'('I')
    set $S8, $P3
.annotate 'line', 4346
    __ARG_1.'emitset'($S8, $S5)
# }
  __label_20: # endif
.annotate 'line', 4348
    __ARG_1.'emitadd'(__ARG_2, $S7, $S8)
# }
    goto __label_14
  __label_13: # else
.annotate 'line', 4351
    __ARG_1.'emitadd'(__ARG_2, $S4, $S5)
  __label_14: # endif
# }
  __label_7: # endif
# }
.annotate 'line', 4353

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpAddExpr' ]
.annotate 'line', 4243
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
.annotate 'line', 4362
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4363

.end # OpSubExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4366
    self.'optimizearg'()
.annotate 'line', 4367
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4368
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4369
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 4370
# ltype: $S1
    $P5 = $P1.'checkresult'()
    null $S1
    if_null $P5, __label_3
    set $S1, $P5
  __label_3:
.annotate 'line', 4371
# rtype: $S2
    $P5 = $P2.'checkresult'()
    null $S2
    if_null $P5, __label_4
    set $S2, $P5
  __label_4:
.annotate 'line', 4372
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_6
    iseq $I3, $S2, 'I'
  __label_6:
    unless $I3 goto __label_5
# {
.annotate 'line', 4373
# var lval: $P3
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4374
# ln: $I1
    set $P5, $P3
    set $I1, $P5
.annotate 'line', 4375
# var rval: $P4
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4376
# rn: $I2
    set $P5, $P4
    set $I2, $P5
.annotate 'line', 4377
.const 'Sub' $P6 = 'WSubId_16'
    getattribute $P5, self, 'owner'
    getattribute $P7, self, 'start'
    sub $I3, $I1, $I2
    .tailcall $P6($P5, $P7, $I3)
# }
  __label_5: # endif
# }
  __label_1: # endif
.annotate 'line', 4380
    .return(self)
# }
.annotate 'line', 4381

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4384
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4385
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4386
    ne $S1, $S2, __label_3
.annotate 'line', 4387
    .return($S1)
  __label_3: # endif
.annotate 'line', 4388
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_5
    iseq $I1, $S2, 'N'
  __label_5:
    unless $I1 goto __label_4
.annotate 'line', 4389
    .return('N')
  __label_4: # endif
.annotate 'line', 4390
    iseq $I1, $S1, 'N'
    unless $I1 goto __label_7
    iseq $I1, $S2, 'I'
  __label_7:
    unless $I1 goto __label_6
.annotate 'line', 4391
    .return('N')
  __label_6: # endif
.annotate 'line', 4392
    .return('I')
# }
.annotate 'line', 4393

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4396
# lreg: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4397
# rreg: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4398
    __ARG_1.'emitsub'(__ARG_2, $S1, $S2)
# }
.annotate 'line', 4399

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpSubExpr' ]
.annotate 'line', 4358
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
.annotate 'line', 4408
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4409

.end # OpMulExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4412
    self.'optimizearg'()
.annotate 'line', 4413
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4414
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4415
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 4416
# ltype: $S1
    $P7 = $P1.'checkresult'()
    null $S1
    if_null $P7, __label_3
    set $S1, $P7
  __label_3:
.annotate 'line', 4417
# rtype: $S2
    $P7 = $P2.'checkresult'()
    null $S2
    if_null $P7, __label_4
    set $S2, $P7
  __label_4:
.annotate 'line', 4418
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_6
    iseq $I3, $S2, 'I'
  __label_6:
    unless $I3 goto __label_5
# {
.annotate 'line', 4419
# var lval: $P3
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4420
# ln: $I1
    set $P7, $P3
    set $I1, $P7
.annotate 'line', 4421
# var rval: $P4
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4422
# rn: $I2
    set $P7, $P4
    set $I2, $P7
.annotate 'line', 4423
.const 'Sub' $P8 = 'WSubId_16'
    getattribute $P7, self, 'owner'
    getattribute $P9, self, 'start'
    mul $I3, $I1, $I2
    .tailcall $P8($P7, $P9, $I3)
# }
  __label_5: # endif
# {
.annotate 'line', 4426
.const 'Sub' $P10 = 'WSubId_51'
    $P7 = $P10($S1, $S2)
    if_null $P7, __label_7
    unless $P7 goto __label_7
# {
.annotate 'line', 4427
# var lvalf: $P5
    getattribute $P5, $P1, 'numval'
.annotate 'line', 4428
# lf: $N1
# predefined string
    set $S3, $P5
    set $N1, $S3
.annotate 'line', 4429
# var rvalf: $P6
    getattribute $P6, $P2, 'numval'
.annotate 'line', 4430
# rf: $N2
# predefined string
    set $S3, $P6
    set $N2, $S3
.annotate 'line', 4431
.const 'Sub' $P11 = 'WSubId_50'
    getattribute $P7, self, 'owner'
    getattribute $P9, self, 'start'
    mul $N3, $N1, $N2
    .tailcall $P11($P7, $P9, $N3)
# }
  __label_7: # endif
# }
# }
  __label_1: # endif
.annotate 'line', 4435
    .return(self)
# }
.annotate 'line', 4436

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4439
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4440
# rl: $S1
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'checkresult'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4441
# rr: $S2
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'checkresult'()
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 4442
    ne $S1, $S2, __label_3
.annotate 'line', 4443
    .return($S1)
  __label_3: # endif
.annotate 'line', 4444
    ne $S1, 'S', __label_4
.annotate 'line', 4445
    .return('S')
    goto __label_5
  __label_4: # else
.annotate 'line', 4447
    .return('N')
  __label_5: # endif
# }
.annotate 'line', 4448

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4451
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4452
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4453
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4454
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 4455
# lreg: $S3
    null $S3
# rreg: $S4
    null $S4
.annotate 'line', 4456
    ne $S1, 'S', __label_3
# {
.annotate 'line', 4457
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 4458
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 4459
# rval: $S5
    null $S5
# switch
.annotate 'line', 4460
    set $S7, $S2
    set $S8, 'I'
    if $S7 == $S8 goto __label_6
    goto __label_5
  __label_6: # case
.annotate 'line', 4462
    set $S5, $S4
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 4465
    $P3 = self.'tempreg'('I')
    set $S5, $P3
.annotate 'line', 4466
    __ARG_1.'emitset'($S5, $S4)
  __label_4: # switch end
.annotate 'line', 4468
    self.'annotate'(__ARG_1)
.annotate 'line', 4469
    __ARG_1.'emitrepeat'(__ARG_2, $S3, $S5)
.annotate 'line', 4470
    .return()
# }
  __label_3: # endif
.annotate 'line', 4472
    iseq $I3, $S1, $S2
    unless $I3 goto __label_8
    iseq $I3, $S1, 'I'
    if $I3 goto __label_10
    iseq $I3, $S1, 'N'
  __label_10:
    if $I3 goto __label_9
    iseq $I3, $S1, 'P'
  __label_9:
  __label_8:
    unless $I3 goto __label_7
# {
.annotate 'line', 4473
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 4474
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 4475
    __ARG_1.'emitmul'(__ARG_2, $S3, $S4)
.annotate 'line', 4476
    .return()
# }
  __label_7: # endif
.annotate 'line', 4481
    ne $S1, 'N', __label_11
# {
.annotate 'line', 4482
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 4483
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 4484
# rval: $S6
    null $S6
# switch
.annotate 'line', 4485
    set $S7, $S2
    set $S8, 'I'
    if $S7 == $S8 goto __label_14
    set $S8, 'N'
    if $S7 == $S8 goto __label_15
    goto __label_13
  __label_14: # case
.annotate 'line', 4487
    $P3 = self.'tempreg'('N')
    set $S6, $P3
.annotate 'line', 4488
    __ARG_1.'emitset'($S6, $S4)
.annotate 'line', 4489
    set $S6, $S4
    goto __label_12 # break
  __label_15: # case
.annotate 'line', 4492
    set $S6, $S4
    goto __label_12 # break
  __label_13: # default
.annotate 'line', 4495
    $P4 = self.'tempreg'('N')
    set $S6, $P4
.annotate 'line', 4496
    __ARG_1.'emitset'($S6, $S4)
  __label_12: # switch end
.annotate 'line', 4498
    set $S7, __ARG_2
    eq $S7, '', __label_16
# {
.annotate 'line', 4499
    self.'annotate'(__ARG_1)
.annotate 'line', 4500
    __ARG_1.'emitmul'(__ARG_2, $S3, $S6)
# }
  __label_16: # endif
.annotate 'line', 4502
    .return()
# }
  __label_11: # endif
.annotate 'line', 4505
# nleft: $I1
    null $I1
# nright: $I2
    null $I2
.annotate 'line', 4506
    $P3 = $P1.'issimple'()
    isfalse $I3, $P3
    if $I3 goto __label_19
    $I3 = $P1.'isidentifier'()
  __label_19:
    unless $I3 goto __label_17
# {
.annotate 'line', 4507
    $P5 = self.'checkresult'()
    $P4 = self.'tempreg'($P5)
    set $S3, $P4
.annotate 'line', 4508
    $P1.'emit'(__ARG_1, $S3)
# }
    goto __label_18
  __label_17: # else
# {
.annotate 'line', 4511
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4512
    set $S3, $I1
# }
  __label_18: # endif
.annotate 'line', 4514
    $P3 = $P2.'issimple'()
    isfalse $I3, $P3
    if $I3 goto __label_22
    $I3 = $P2.'isidentifier'()
  __label_22:
    unless $I3 goto __label_20
# {
.annotate 'line', 4515
    $P5 = self.'checkresult'()
    $P4 = self.'tempreg'($P5)
    set $S4, $P4
.annotate 'line', 4516
    $P2.'emit'(__ARG_1, $S4)
# }
    goto __label_21
  __label_20: # else
# {
# switch
.annotate 'line', 4519
    set $S7, $S2
    set $S8, 'S'
    if $S7 == $S8 goto __label_25
    set $S8, 'N'
    if $S7 == $S8 goto __label_26
    set $S8, 'I'
    if $S7 == $S8 goto __label_27
    goto __label_24
  __label_25: # case
.annotate 'line', 4521
    $P4 = self.'checkresult'()
    $P3 = self.'tempreg'($P4)
    set $S4, $P3
.annotate 'line', 4522
    $P2.'emit'(__ARG_1, $S4)
    goto __label_23 # break
  __label_26: # case
.annotate 'line', 4525
    $P5 = $P2.'emit_get'(__ARG_1)
    set $S4, $P5
    goto __label_23 # break
  __label_27: # case
  __label_24: # default
.annotate 'line', 4529
    $P6 = $P2.'getIntegerValue'()
    set $I2, $P6
.annotate 'line', 4530
    set $S4, $I2
    goto __label_23 # break
  __label_23: # switch end
.annotate 'line', 4531
# }
  __label_21: # endif
.annotate 'line', 4534
    self.'annotate'(__ARG_1)
.annotate 'line', 4535
    set $S7, __ARG_2
    ne $S7, '', __label_28
.annotate 'line', 4536
    $P3 = self.'checkresult'()
    __ARG_2 = self.'tempreg'($P3)
  __label_28: # endif
.annotate 'line', 4537
    __ARG_1.'emitmul'(__ARG_2, $S3, $S4)
# }
.annotate 'line', 4538

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpMulExpr' ]
.annotate 'line', 4404
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
.annotate 'line', 4547
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4548

.end # OpDivExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4551
    self.'optimizearg'()
.annotate 'line', 4552
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4553
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4554
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 4555
# ltype: $S1
    $P5 = $P1.'checkresult'()
    null $S1
    if_null $P5, __label_3
    set $S1, $P5
  __label_3:
.annotate 'line', 4556
# rtype: $S2
    $P5 = $P2.'checkresult'()
    null $S2
    if_null $P5, __label_4
    set $S2, $P5
  __label_4:
.annotate 'line', 4557
# var lval: $P3
    null $P3
.annotate 'line', 4558
# var rval: $P4
    null $P4
.annotate 'line', 4559
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_6
    iseq $I3, $S2, 'I'
  __label_6:
    unless $I3 goto __label_5
# {
.annotate 'line', 4560
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4561
# ln: $I1
    set $P5, $P3
    set $I1, $P5
.annotate 'line', 4562
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4563
# rn: $I2
    set $P5, $P4
    set $I2, $P5
.annotate 'line', 4564
    eq $I2, 0, __label_7
.annotate 'line', 4565
.const 'Sub' $P6 = 'WSubId_16'
    getattribute $P5, self, 'owner'
    getattribute $P7, self, 'start'
    set $N4, $I1
    set $N5, $I2
    div $N3, $N4, $N5
    .tailcall $P6($P5, $P7, $N3)
  __label_7: # endif
# }
  __label_5: # endif
# {
.annotate 'line', 4568
.const 'Sub' $P8 = 'WSubId_51'
    $P5 = $P8($S1, $S2)
    if_null $P5, __label_8
    unless $P5 goto __label_8
# {
.annotate 'line', 4569
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4570
# lf: $N1
# predefined string
    set $S3, $P3
    set $N1, $S3
.annotate 'line', 4571
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4572
# rf: $N2
# predefined string
    set $S3, $P4
    set $N2, $S3
.annotate 'line', 4573
    set $N3, 0
    eq $N2, $N3, __label_9
.annotate 'line', 4574
.const 'Sub' $P9 = 'WSubId_50'
    getattribute $P5, self, 'owner'
    getattribute $P7, self, 'start'
    div $N4, $N1, $N2
    .tailcall $P9($P5, $P7, $N4)
  __label_9: # endif
# }
  __label_8: # endif
# }
# }
  __label_1: # endif
.annotate 'line', 4578
    .return(self)
# }
.annotate 'line', 4579

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4582
    .return('N')
# }
.annotate 'line', 4583

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4586
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4587
# var aux: $P2
    null $P2
.annotate 'line', 4588
# var lreg: $P3
    $P3 = $P1.'emit_get'(__ARG_1)
.annotate 'line', 4589
    $P6 = $P1.'checkresult'()
    set $S1, $P6
    eq $S1, 'N', __label_1
# {
.annotate 'line', 4590
    $P2 = self.'tempreg'('N')
.annotate 'line', 4591
    __ARG_1.'emitset'($P2, $P3)
.annotate 'line', 4592
    set $P3, $P2
# }
  __label_1: # endif
.annotate 'line', 4594
# var rexpr: $P4
    getattribute $P4, self, 'rexpr'
.annotate 'line', 4595
# var rreg: $P5
    $P5 = $P4.'emit_get'(__ARG_1)
.annotate 'line', 4596
    $P6 = $P4.'checkresult'()
    set $S1, $P6
    eq $S1, 'N', __label_2
# {
.annotate 'line', 4597
    $P2 = self.'tempreg'('N')
.annotate 'line', 4598
    __ARG_1.'emitset'($P2, $P5)
.annotate 'line', 4599
    set $P5, $P2
# }
  __label_2: # endif
.annotate 'line', 4601
    self.'annotate'(__ARG_1)
.annotate 'line', 4602
    __ARG_1.'emitdiv'(__ARG_2, $P3, $P5)
# }
.annotate 'line', 4603

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpDivExpr' ]
.annotate 'line', 4543
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
.annotate 'line', 4612
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4613

.end # OpModExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4616
# lreg: $S1
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4617
# rreg: $S2
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4618
    self.'annotate'(__ARG_1)
.annotate 'line', 4619
    __ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
# }
.annotate 'line', 4620

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4623
    mod $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4624

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpModExpr' ]
.annotate 'line', 4608
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
.annotate 'line', 4633
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4634

.end # OpCModExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4637
    .return('I')
# }
.annotate 'line', 4638

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4641
# lreg: $S1
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4642
# rreg: $S2
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4643
    self.'annotate'(__ARG_1)
.annotate 'line', 4648
    __ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
# }
.annotate 'line', 4649

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpCModExpr' ]
.annotate 'line', 4629
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
.annotate 'line', 4658
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4659

.end # OpShiftleftExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4662
# res: $S1
    if_null __ARG_2, __label_2
    set $P1, __ARG_2
    goto __label_1
  __label_2:
    $P1 = self.'tempreg'('I')
  __label_1:
    null $S1
    if_null $P1, __label_3
    set $S1, $P1
  __label_3:
.annotate 'line', 4663
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4664
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4665
    self.'annotate'(__ARG_1)
.annotate 'line', 4666
    __ARG_1.'emitbinop'('shl', $S1, $S2, $S3)
# }
.annotate 'line', 4667

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4670
    shl $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4671

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpShiftleftExpr' ]
.annotate 'line', 4654
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
.annotate 'line', 4680
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4681

.end # OpShiftrightExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4684
# res: $S1
    if_null __ARG_2, __label_2
    set $P1, __ARG_2
    goto __label_1
  __label_2:
    $P1 = self.'tempreg'('I')
  __label_1:
    null $S1
    if_null $P1, __label_3
    set $S1, $P1
  __label_3:
.annotate 'line', 4685
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4686
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4687
    self.'annotate'(__ARG_1)
.annotate 'line', 4688
    __ARG_1.'emitbinop'('shr', $S1, $S2, $S3)
# }
.annotate 'line', 4689

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4692
    shr $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4693

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpShiftrightExpr' ]
.annotate 'line', 4676
    get_class $P1, [ 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'ArgumentModifierList' ]

.sub 'ArgumentModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4702
    self.'ModifierList'(__ARG_1, __ARG_2)
# }
.annotate 'line', 4703

.end # ArgumentModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4706
# isflat: $I1
    null $I1
# isnamed: $I2
    null $I2
.annotate 'line', 4707
# setname: $S1
    set $S1, ''
.annotate 'line', 4708
    $P3 = self.'getlist'()
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
# {
# switch
.annotate 'line', 4709
    $P5 = $P1.'getname'()
    set $S2, $P5
    set $S3, 'flat'
    if $S2 == $S3 goto __label_5
    set $S3, 'named'
    if $S2 == $S3 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 4711
    set $I1, 1
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 4714
    set $I2, 1
# switch
.annotate 'line', 4715
    $P6 = $P1.'numargs'()
    set $I3, $P6
    null $I4
    if $I3 == $I4 goto __label_9
    set $I4, 1
    if $I3 == $I4 goto __label_10
    goto __label_8
  __label_9: # case
    goto __label_7 # break
  __label_10: # case
.annotate 'line', 4719
# var argmod: $P2
    $P2 = $P1.'getarg'(0)
.annotate 'line', 4720
    $P7 = $P2.'isstringliteral'()
    isfalse $I5, $P7
    unless $I5 goto __label_11
.const 'Sub' $P8 = 'WSubId_1'
.annotate 'line', 4721
    getattribute $P9, self, 'start'
    $P8('Invalid modifier', $P9)
  __label_11: # endif
.annotate 'line', 4722
    $P10 = $P2.'getPirString'()
    set $S1, $P10
    goto __label_7 # break
  __label_8: # default
.annotate 'line', 4723
.const 'Sub' $P11 = 'WSubId_1'
.annotate 'line', 4725
    getattribute $P12, self, 'start'
    $P11('Invalid modifier', $P12)
  __label_7: # switch end
  __label_4: # default
  __label_3: # switch end
# }
    goto __label_1
  __label_2: # endfor
# switch-case
.annotate 'line', 4730
    and $I3, $I1, $I2
    if $I3 goto __label_14
.annotate 'line', 4733
    set $I3, $I1
    if $I3 goto __label_15
.annotate 'line', 4736
    set $I3, $I2
    if $I3 goto __label_16
    goto __label_13
  __label_14: # case
.annotate 'line', 4731
    __ARG_1.'print'(' :flat :named')
    goto __label_12 # break
  __label_15: # case
.annotate 'line', 4734
    __ARG_1.'print'(' :flat')
    goto __label_12 # break
  __label_16: # case
.annotate 'line', 4737
    __ARG_1.'print'(' :named')
.annotate 'line', 4738
    eq $S1, '', __label_17
.annotate 'line', 4739
    __ARG_1.'print'("(", $S1, ")")
  __label_17: # endif
    goto __label_12 # break
  __label_13: # default
  __label_12: # switch end
.annotate 'line', 4740
# }
.annotate 'line', 4742

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ArgumentModifierList' ]
.annotate 'line', 4698
    get_class $P1, [ 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'Argument' ]

.sub 'Argument' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4751
    setattribute self, 'arg', __ARG_1
.annotate 'line', 4752
    setattribute self, 'modifiers', __ARG_2
# }
.annotate 'line', 4753

.end # Argument


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4756
    getattribute $P3, self, 'arg'
    $P2 = $P3.'optimize'()
    setattribute self, 'arg', $P2
.annotate 'line', 4757
    .return(self)
# }
.annotate 'line', 4758

.end # optimize


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 4761
    getattribute $P1, self, 'arg'
    .tailcall $P1.'hascompilevalue'()
# }
.annotate 'line', 4762

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Argument' ]
.annotate 'line', 4747
    addattribute $P0, 'arg'
.annotate 'line', 4748
    addattribute $P0, 'modifiers'
.end
.namespace [ ]

.sub 'parseArgument'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4767
# var modifier: $P1
    null $P1
.annotate 'line', 4768
# var expr: $P2
.const 'Sub' $P4 = 'WSubId_30'
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 4769
# var t: $P3
    $P3 = __ARG_1.'get'()
.annotate 'line', 4770
    $P5 = $P3.'isop'(':')
    if_null $P5, __label_1
    unless $P5 goto __label_1
# {
.annotate 'line', 4771
    $P3 = __ARG_1.'get'()
.annotate 'line', 4772
    $P5 = $P3.'isop'('[')
    if_null $P5, __label_3
    unless $P5 goto __label_3
# {
.annotate 'line', 4773
    new $P6, [ 'ArgumentModifierList' ]
    $P6.'ArgumentModifierList'(__ARG_1, __ARG_2)
    set $P1, $P6
# }
    goto __label_4
  __label_3: # else
.const 'Sub' $P7 = 'WSubId_29'
.annotate 'line', 4776
    $P7('modifier list', $P3)
  __label_4: # endif
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 4779
    __ARG_1.'unget'($P3)
  __label_2: # endif
.annotate 'line', 4780
    new $P6, [ 'Argument' ]
    $P6.'Argument'($P2, $P1)
    set $P5, $P6
    .return($P5)
# }
.annotate 'line', 4781

.end # parseArgument

.namespace [ 'ArgumentList' ]

.sub 'ArgumentList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4792
    setattribute self, 'owner', __ARG_1
.annotate 'line', 4793
    setattribute self, 'start', __ARG_2
.annotate 'line', 4794
# var t: $P1
    $P1 = __ARG_3.'get'()
.annotate 'line', 4795
    $P2 = $P1.'isop'(__ARG_4)
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 4796
    __ARG_3.'unget'($P1)
.annotate 'line', 4797
.const 'Sub' $P3 = 'parseArgument'
.annotate 'line', 4798
.const 'Sub' $P5 = 'WSubId_27'
    $P4 = $P5(__ARG_3, __ARG_1, $P3, __ARG_4)
    setattribute self, 'args', $P4
# }
  __label_1: # endif
# }
.annotate 'line', 4800

.end # ArgumentList


.sub 'numargs' :method
# Body
# {
.annotate 'line', 4803
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4804
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
# predefined elements
.annotate 'line', 4802
    elements $I1, $P1
  __label_1:
.annotate 'line', 4804
    .return($I1)
# }
.annotate 'line', 4805

.end # numargs


.sub 'getrawargs' :method
# Body
# {
.annotate 'line', 4808
    getattribute $P1, self, 'args'
    .return($P1)
# }
.annotate 'line', 4809

.end # getrawargs


.sub 'getarg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 4812
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4813
    $P2 = $P1[__ARG_1]
    .return($P2)
# }
.annotate 'line', 4814

.end # getarg


.sub 'getfreearg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 4817
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4818
    $P3 = $P1[__ARG_1]
    getattribute $P2, $P3, 'arg'
    .return($P2)
# }
.annotate 'line', 4819

.end # getfreearg


.sub 'optimize' :method
# Body
# {
.const 'Sub' $P1 = 'WSubId_28'
.annotate 'line', 4822
    getattribute $P2, self, 'args'
    $P1($P2)
.annotate 'line', 4823
    .return(self)
# }
.annotate 'line', 4824

.end # optimize


.sub 'getargvalues' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4827
# var argregs: $P1
    getattribute $P1, self, 'argregs'
.annotate 'line', 4828
    unless_null $P1, __label_1
# {
.annotate 'line', 4829
    new $P2, ['ResizableStringArray']
.annotate 'line', 4830
# pnull: $S1
    set $S1, ''
.annotate 'line', 4831
# var args: $P3
    getattribute $P3, self, 'args'
.annotate 'line', 4832
    if_null $P3, __label_2
# {
.annotate 'line', 4833
    iter $P6, $P3
    set $P6, 0
  __label_3: # for iteration
    unless $P6 goto __label_4
    shift $P4, $P6
# {
.annotate 'line', 4834
# var arg: $P5
    getattribute $P5, $P4, 'arg'
.annotate 'line', 4835
# reg: $S2
    null $S2
.annotate 'line', 4836
    $P7 = $P5.'isnull'()
    if_null $P7, __label_5
    unless $P7 goto __label_5
# {
.annotate 'line', 4837
    ne $S1, '', __label_7
# {
.annotate 'line', 4838
    getattribute $P9, self, 'owner'
    $P8 = $P9.'tempreg'('P')
    set $S1, $P8
.annotate 'line', 4839
    __ARG_1.'emitnull'($S1)
# }
  __label_7: # endif
.annotate 'line', 4841
    set $S2, $S1
# }
    goto __label_6
  __label_5: # else
.annotate 'line', 4844
    $P7 = $P5.'emit_get'(__ARG_1)
    set $S2, $P7
  __label_6: # endif
.annotate 'line', 4845
# predefined push
    push $P2, $S2
# }
    goto __label_3
  __label_4: # endfor
# }
  __label_2: # endif
.annotate 'line', 4848
    setattribute self, 'argregs', $P2
# }
  __label_1: # endif
.annotate 'line', 4850
    .return($P1)
# }
.annotate 'line', 4851

.end # getargvalues


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4854
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4855
# var argreg: $P2
    $P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 4857
# sep: $S1
    set $S1, ''
.annotate 'line', 4858
# n: $I1
    $P4 = self.'numargs'()
    set $I1, $P4
# for loop
.annotate 'line', 4859
# i: $I2
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
# {
.annotate 'line', 4860
    $P4 = $P2[$I2]
    __ARG_1.'print'($S1, $P4)
.annotate 'line', 4861
# var modifiers: $P3
    $P4 = $P1[$I2]
    getattribute $P3, $P4, 'modifiers'
.annotate 'line', 4862
    if_null $P3, __label_4
.annotate 'line', 4863
    $P3.'emitmodifiers'(__ARG_1)
  __label_4: # endif
.annotate 'line', 4864
    set $S1, ', '
# }
  __label_1: # for iteration
.annotate 'line', 4859
    inc $I2
    goto __label_3
  __label_2: # for end
# }
.annotate 'line', 4866

.end # emitargs

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ArgumentList' ]
.annotate 'line', 4785
    addattribute $P0, 'owner'
.annotate 'line', 4786
    addattribute $P0, 'start'
.annotate 'line', 4787
    addattribute $P0, 'args'
.annotate 'line', 4788
    addattribute $P0, 'argregs'
.end
.namespace [ ]

.sub 'arglist_hascompilevalue' :subid('WSubId_52')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4871
    iter $P2, __ARG_1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $P1, $P2
.annotate 'line', 4872
    $P3 = $P1.'hascompilevalue'()
    isfalse $I1, $P3
    unless $I1 goto __label_3
.annotate 'line', 4873
    .return(0)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 4874
    .return(1)
# }
.annotate 'line', 4875

.end # arglist_hascompilevalue

.namespace [ 'CallPredefExpr' ]

.sub 'CallPredefExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4886
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 4887
    setattribute self, 'predef', __ARG_3
.annotate 'line', 4888
    setattribute self, 'args', __ARG_4
# }
.annotate 'line', 4889

.end # CallPredefExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4892
    getattribute $P1, self, 'predef'
    .tailcall $P1.'result'()
# }
.annotate 'line', 4893

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4896
# var predef: $P1
    getattribute $P1, self, 'predef'
.annotate 'line', 4897
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 4898
    new $P3, ['ResizableStringArray']
.annotate 'line', 4899
# var arg: $P4
    null $P4
.annotate 'line', 4900
# pnull: $S1
    set $S1, ''
# switch
.annotate 'line', 4901
    $P6 = $P1.'params'()
    set $I3, $P6
    set $I4, -1
    if $I3 == $I4 goto __label_3
    set $I4, -2
    if $I3 == $I4 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 4903
    iter $P7, $P2
    set $P7, 0
  __label_5: # for iteration
    unless $P7 goto __label_6
    shift $P4, $P7
# {
.annotate 'line', 4904
# reg: $S2
    getattribute $P9, $P4, 'arg'
    $P8 = $P9.'emit_get'(__ARG_1)
    null $S2
    if_null $P8, __label_7
    set $S2, $P8
  __label_7:
.annotate 'line', 4906
    ne $S2, 'null', __label_8
# {
.annotate 'line', 4907
    ne $S1, '', __label_9
# {
.annotate 'line', 4908
    $P6 = self.'tempreg'('P')
    set $S1, $P6
.annotate 'line', 4909
    __ARG_1.'emitnull'($S1)
# }
  __label_9: # endif
.annotate 'line', 4911
    set $S2, $S1
# }
  __label_8: # endif
.annotate 'line', 4913
# predefined push
    push $P3, $S2
# }
    goto __label_5
  __label_6: # endfor
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 4917
# var rawargs: $P5
    root_new $P5, ['parrot';'ResizablePMCArray']
.annotate 'line', 4918
    iter $P10, $P2
    set $P10, 0
  __label_10: # for iteration
    unless $P10 goto __label_11
    shift $P4, $P10
.annotate 'line', 4919
    getattribute $P8, $P4, 'arg'
# predefined push
    push $P5, $P8
    goto __label_10
  __label_11: # endfor
.annotate 'line', 4920
    getattribute $P9, self, 'predef'
    getattribute $P11, self, 'start'
    $P9.'expand'(__ARG_1, self, $P11, __ARG_2, $P5)
.annotate 'line', 4921
    .return()
  __label_2: # default
.annotate 'line', 4923
# n: $I1
    getattribute $P12, self, 'args'
    set $I1, $P12
# for loop
.annotate 'line', 4924
# i: $I2
    null $I2
  __label_14: # for condition
    ge $I2, $I1, __label_13
# {
.annotate 'line', 4925
    $P13 = $P2[$I2]
    getattribute $P4, $P13, 'arg'
.annotate 'line', 4926
# argtype: $S3
    $P6 = $P4.'checkresult'()
    null $S3
    if_null $P6, __label_15
    set $S3, $P6
  __label_15:
.annotate 'line', 4927
# paramtype: $S4
    $P6 = $P1.'paramtype'($I2)
    null $S4
    if_null $P6, __label_16
    set $S4, $P6
  __label_16:
.annotate 'line', 4928
# argr: $S5
    null $S5
.annotate 'line', 4929
    $P6 = $P4.'isnull'()
    if_null $P6, __label_17
    unless $P6 goto __label_17
# {
# switch
.annotate 'line', 4930
    set $S7, $S4
    set $S8, 'I'
    if $S7 == $S8 goto __label_21
    set $S8, 'N'
    if $S7 == $S8 goto __label_22
    set $S8, 'S'
    if $S7 == $S8 goto __label_23
    goto __label_20
  __label_21: # case
  __label_22: # case
  __label_23: # case
.annotate 'line', 4934
    $P8 = self.'tempreg'($S4)
    set $S5, $P8
.annotate 'line', 4935
    __ARG_1.'emitnull'($S5)
    goto __label_19 # break
  __label_20: # default
.annotate 'line', 4938
    ne $S1, '', __label_24
# {
.annotate 'line', 4939
    $P9 = self.'tempreg'('P')
    set $S1, $P9
.annotate 'line', 4940
    __ARG_1.'emitnull'($S1)
# }
  __label_24: # endif
.annotate 'line', 4942
    set $S5, $S1
  __label_19: # switch end
# }
    goto __label_18
  __label_17: # else
# {
.annotate 'line', 4946
    iseq $I3, $S3, $S4
    if $I3 goto __label_27
    iseq $I3, $S4, '?'
  __label_27:
    unless $I3 goto __label_25
.annotate 'line', 4947
    $P6 = $P4.'emit_get'(__ARG_1)
    set $S5, $P6
    goto __label_26
  __label_25: # else
# {
.annotate 'line', 4949
# aux: $S6
    null $S6
.annotate 'line', 4950
    $P6 = self.'tempreg'($S4)
    set $S5, $P6
# switch
.annotate 'line', 4951
    set $S7, $S4
    set $S8, 'P'
    if $S7 == $S8 goto __label_30
    set $S8, 'I'
    if $S7 == $S8 goto __label_31
    set $S8, 'N'
    if $S7 == $S8 goto __label_32
    set $S8, 'S'
    if $S7 == $S8 goto __label_33
    goto __label_29
  __label_30: # case
# switch
.annotate 'line', 4953
    set $S9, $S3
    set $S10, 'I'
    if $S9 == $S10 goto __label_36
    set $S10, 'N'
    if $S9 == $S10 goto __label_37
    set $S10, 'S'
    if $S9 == $S10 goto __label_38
    goto __label_35
  __label_36: # case
  __label_37: # case
  __label_38: # case
.annotate 'line', 4957
    $P6 = $P4.'emit_get'(__ARG_1)
    set $S6, $P6
.annotate 'line', 4958
    __ARG_1.'emitbox'($S5, $S6)
    goto __label_34 # break
  __label_35: # default
.annotate 'line', 4961
    $P4.'emit'(__ARG_1, $S5)
  __label_34: # switch end
    goto __label_28 # break
  __label_31: # case
  __label_32: # case
  __label_33: # case
.annotate 'line', 4967
    $P8 = $P4.'emit_get'(__ARG_1)
    set $S6, $P8
.annotate 'line', 4968
    __ARG_1.'emitset'($S5, $S6)
    goto __label_28 # break
  __label_29: # default
.annotate 'line', 4971
    $P4.'emit'(__ARG_1, $S5)
  __label_28: # switch end
# }
  __label_26: # endif
# }
  __label_18: # endif
.annotate 'line', 4975
# predefined push
    push $P3, $S5
# }
  __label_12: # for iteration
.annotate 'line', 4924
    inc $I2
    goto __label_14
  __label_13: # for end
  __label_1: # switch end
.annotate 'line', 4978
    getattribute $P6, self, 'predef'
    getattribute $P8, self, 'start'
    $P6.'expand'(__ARG_1, self, $P8, __ARG_2, $P3)
# }
.annotate 'line', 4979

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CallPredefExpr' ]
.annotate 'line', 4879
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 4881
    addattribute $P0, 'predef'
.annotate 'line', 4882
    addattribute $P0, 'args'
.end
.namespace [ ]

.sub 'genpredefcallexpr' :subid('WSubId_54')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 4986
# callname: $S1
    $P3 = __ARG_2.'name'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4987
    __ARG_1.'use_predef'($S1)
.annotate 'line', 4988
# nargs: $I1
    unless_null __ARG_3, __label_3
    null $I1
    goto __label_2
  __label_3:
    $I1 = __ARG_3.'numargs'()
  __label_2:
.annotate 'line', 4989
# var rawargs: $P1
    ne $I1, 0, __label_5
    root_new $P3, ['parrot';'ResizablePMCArray']
    set $P1, $P3
    goto __label_4
  __label_5:
    $P1 = __ARG_3.'getrawargs'()
  __label_4:
.annotate 'line', 4992
    isa $I2, __ARG_2, [ 'PredefFunctionEval' ]
    unless $I2 goto __label_6
# {
.annotate 'line', 4993
.const 'Sub' $P5 = 'WSubId_52'
    $P3 = $P5($P1)
    if_null $P3, __label_7
    unless $P3 goto __label_7
# {
.annotate 'line', 4994
# var evalfun: $P2
    getattribute $P2, __ARG_2, 'evalfun'
.annotate 'line', 4995
    getattribute $P3, __ARG_1, 'owner'
    getattribute $P4, __ARG_1, 'start'
    .tailcall $P2($P3, $P4, $P1)
# }
  __label_7: # endif
# }
  __label_6: # endif
.annotate 'line', 4999
    new $P4, [ 'CallPredefExpr' ]
    getattribute $P6, __ARG_1, 'owner'
    getattribute $P7, __ARG_1, 'start'
    $P4.'CallPredefExpr'($P6, $P7, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
# }
.annotate 'line', 5000

.end # genpredefcallexpr

.namespace [ 'CallExpr' ]

.sub 'CallExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 5010
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5011
    setattribute self, 'funref', __ARG_4
.annotate 'line', 5012
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5013
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 5014
    __ARG_1.'unget'($P1)
.annotate 'line', 5015
    new $P4, [ 'ArgumentList' ]
    $P4.'ArgumentList'(__ARG_2, __ARG_3, __ARG_1, ')')
    set $P3, $P4
    setattribute self, 'args', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 5017

.end # CallExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5018
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5021
# var funref: $P1
    getattribute $P6, self, 'funref'
    $P1 = $P6.'optimize'()
.annotate 'line', 5022
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 5023
# nargs: $I1
    null $I1
.annotate 'line', 5024
    if_null $P2, __label_1
# {
.annotate 'line', 5025
    $P2 = $P2.'optimize'()
.annotate 'line', 5026
    $P6 = $P2.'numargs'()
    set $I1, $P6
# }
  __label_1: # endif
.annotate 'line', 5029
    isa $I2, $P1, [ 'MemberExpr' ]
    unless $I2 goto __label_2
.annotate 'line', 5030
    new $P7, [ 'CallMemberExpr' ]
    $P7.'CallMemberExpr'(self, $P1, $P2)
    set $P6, $P7
    .return($P6)
  __label_2: # endif
.annotate 'line', 5031
    isa $I2, $P1, [ 'MemberRefExpr' ]
    unless $I2 goto __label_3
.annotate 'line', 5032
    new $P7, [ 'CallMemberRefExpr' ]
    $P7.'CallMemberRefExpr'(self, $P1, $P2)
    set $P6, $P7
    .return($P6)
  __label_3: # endif
.annotate 'line', 5035
    $P6 = $P1.'isidentifier'()
    if_null $P6, __label_4
    unless $P6 goto __label_4
# {
.annotate 'line', 5036
# callname: $S1
    $P7 = $P1.'getName'()
    null $S1
    if_null $P7, __label_5
    set $S1, $P7
  __label_5:
.annotate 'line', 5037
# var predef: $P3
.const 'Sub' $P8 = 'WSubId_53'
    $P3 = $P8($S1, $I1)
.annotate 'line', 5038
    if_null $P3, __label_6
.annotate 'line', 5039
.const 'Sub' $P9 = 'WSubId_54'
    getattribute $P6, self, 'owner'
    .tailcall $P9($P6, $P3, $P2)
  __label_6: # endif
.annotate 'line', 5040
# call: $S2
    $P6 = $P1.'checkIdentifier'()
    null $S2
    if_null $P6, __label_7
    set $S2, $P6
  __label_7:
.annotate 'line', 5041
    ne $S2, '', __label_8
# {
.annotate 'line', 5042
    new $P4, ['ResizableStringArray']
    set $P4, 1
    set $S4, $S1
    $P4[0] = $S4
.annotate 'line', 5043
# var sym: $P5
    $P5 = self.'findsymbol'($P4)
.annotate 'line', 5044
    if_null $P5, __label_9
# {
.annotate 'line', 5045
# id: $S3
    $P6 = $P5.'makesubid'()
    null $S3
    if_null $P6, __label_10
    set $S3, $P6
  __label_10:
.annotate 'line', 5046
    box $P6, $S3
    setattribute self, 'subid', $P6
# }
  __label_9: # endif
# }
  __label_8: # endif
# }
  __label_4: # endif
.annotate 'line', 5051
    setattribute self, 'funref', $P1
.annotate 'line', 5052
    setattribute self, 'args', $P2
.annotate 'line', 5053
    .return(self)
# }
.annotate 'line', 5054

.end # optimize


.sub 'cantailcall' :method
# Body
# {
.annotate 'line', 5057
    .return(1)
# }
.annotate 'line', 5058

.end # cantailcall


.sub 'emitcall' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5061
    getattribute $P2, self, 'subid'
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 5062
# reg: $S1
    getattribute $P4, self, 'owner'
    $P3 = $P4.'createreg'('P')
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
.annotate 'line', 5063
# predefined string
    getattribute $P2, self, 'subid'
    set $S3, $P2
    concat $S4, ".const 'Sub' ", $S1
    concat $S4, $S4, " = '"
    concat $S4, $S4, $S3
    concat $S4, $S4, "'"
    __ARG_1.'say'($S4)
.annotate 'line', 5064
    .return($S1)
# }
  __label_1: # endif
.annotate 'line', 5066
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 5067
# call: $S2
    null $S2
.annotate 'line', 5068
    $P2 = $P1.'isidentifier'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
# {
.annotate 'line', 5069
    $P3 = $P1.'checkIdentifier'()
    set $S2, $P3
.annotate 'line', 5070
    ne $S2, '', __label_5
.annotate 'line', 5071
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "'"
    push $P2, $P3
    $P4 = $P1.'getName'()
    push $P2, $P4
    box $P3, "'"
    push $P2, $P3
# predefined join
    join $S2, "", $P2
  __label_5: # endif
# }
    goto __label_4
  __label_3: # else
.annotate 'line', 5074
    $P2 = $P1.'emit_get'(__ARG_1)
    set $S2, $P2
  __label_4: # endif
.annotate 'line', 5075
    .return($S2)
# }
.annotate 'line', 5076

.end # emitcall


.sub 'prepareargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5079
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5080
    if_null $P1, __label_1
.annotate 'line', 5081
    $P1.'getargvalues'(__ARG_1)
  __label_1: # endif
# }
.annotate 'line', 5082

.end # prepareargs


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5085
    __ARG_1.'print'('(')
.annotate 'line', 5086
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5087
    if_null $P1, __label_1
.annotate 'line', 5088
    $P1.'emitargs'(__ARG_1)
  __label_1: # endif
.annotate 'line', 5089
    __ARG_1.'say'(')')
# }
.annotate 'line', 5090

.end # emitargs


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5093
# call: $S1
    $P1 = self.'emitcall'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5094
    self.'prepareargs'(__ARG_1)
.annotate 'line', 5096
    self.'annotate'(__ARG_1)
.annotate 'line', 5098
    __ARG_1.'print'('    ')
.annotate 'line', 5099
    isnull $I1, __ARG_2
    not $I1
    unless $I1 goto __label_3
    set $S2, __ARG_2
    isne $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
# {
.annotate 'line', 5100
    set $S3, __ARG_2
    ne $S3, '.tailcall', __label_4
.annotate 'line', 5101
    __ARG_1.'print'('.tailcall ')
    goto __label_5
  __label_4: # else
.annotate 'line', 5103
    __ARG_1.'print'(__ARG_2, ' = ')
  __label_5: # endif
# }
  __label_2: # endif
.annotate 'line', 5106
    __ARG_1.'print'($S1)
.annotate 'line', 5107
    self.'emitargs'(__ARG_1)
# }
.annotate 'line', 5108

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CallExpr' ]
.annotate 'line', 5002
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5004
    addattribute $P0, 'funref'
.annotate 'line', 5005
    addattribute $P0, 'args'
.annotate 'line', 5006
    addattribute $P0, 'subid'
.end
.namespace [ 'CallMemberExpr' ]

.sub 'CallMemberExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5120
    getattribute $P5, __ARG_1, 'owner'
    getattribute $P6, __ARG_1, 'start'
    self.'Expr'($P5, $P6)
.annotate 'line', 5121
    setattribute self, 'funref', __ARG_2
.annotate 'line', 5122
    setattribute self, 'args', __ARG_3
.annotate 'line', 5127
# var first: $P1
    getattribute $P1, __ARG_2, 'left'
  __label_2: # while
.annotate 'line', 5128
    isa $I1, $P1, [ 'MemberExpr' ]
    unless $I1 goto __label_1
.annotate 'line', 5129
    getattribute $P1, $P1, 'left'
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 5130
    isa $I1, $P1, [ 'IdentifierExpr' ]
    unless $I1 goto __label_3
# {
.annotate 'line', 5131
# var idfirst: $P2
    $P2 = $P1.'checkIdentifier'()
.annotate 'line', 5132
    isnull $I1, $P2
    if $I1 goto __label_5
    set $S1, $P2
    iseq $I1, $S1, ''
  __label_5:
    unless $I1 goto __label_4
# {
.annotate 'line', 5133
# var key: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 5134
    __ARG_2.'buildkey'($P3)
.annotate 'line', 5135
# var sym: $P4
    $P4 = self.'findsymbol'($P3)
.annotate 'line', 5136
    if_null $P4, __label_6
.annotate 'line', 5137
    $P6 = $P4.'makesubid'()
    setattribute self, 'subid', $P6
  __label_6: # endif
# }
  __label_4: # endif
# }
  __label_3: # endif
# }
.annotate 'line', 5140

.end # CallMemberExpr


.sub 'emitcall' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5143
    getattribute $P2, self, 'subid'
    if_null $P2, __label_1
# {
.annotate 'line', 5144
# reg: $S1
    getattribute $P4, self, 'owner'
    $P3 = $P4.'createreg'('P')
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
.annotate 'line', 5145
# predefined string
    getattribute $P2, self, 'subid'
    set $S2, $P2
    concat $S3, ".const 'Sub' ", $S1
    concat $S3, $S3, " = '"
    concat $S3, $S3, $S2
    concat $S3, $S3, "'"
    __ARG_1.'say'($S3)
.annotate 'line', 5146
    .return($S1)
# }
  __label_1: # endif
.annotate 'line', 5148
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 5149
    root_new $P2, ['parrot';'ResizablePMCArray']
    $P4 = $P1.'emit_left_get'(__ARG_1)
    push $P2, $P4
    box $P3, ".'"
    push $P2, $P3
.annotate 'line', 5150
    $P5 = $P1.'get_member'()
.annotate 'line', 5149
    push $P2, $P5
    box $P3, "'"
    push $P2, $P3
# predefined join
.annotate 'line', 5142
    join $S2, "", $P2
.annotate 'line', 5149
    .return($S2)
# }
.annotate 'line', 5151

.end # emitcall

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CallMemberExpr' ]
.annotate 'line', 5116
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
.annotate 'line', 5161
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 5162
    setattribute self, 'funref', __ARG_2
.annotate 'line', 5163
    setattribute self, 'args', __ARG_3
# }
.annotate 'line', 5164

.end # CallMemberRefExpr


.sub 'emitcall' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5167
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 5168
# var right: $P2
    getattribute $P2, $P1, 'right'
.annotate 'line', 5169
# var type: $P3
    $P3 = $P2.'checkresult'()
.annotate 'line', 5170
    set $S3, $P3
    isne $I1, $S3, 'P'
    unless $I1 goto __label_2
    set $S4, $P3
    isne $I1, $S4, 'S'
  __label_2:
    unless $I1 goto __label_1
.const 'Sub' $P4 = 'WSubId_1'
.annotate 'line', 5171
    getattribute $P5, $P1, 'start'
    $P4("Invalid expression type in '.*'", $P5)
  __label_1: # endif
.annotate 'line', 5174
# lreg: $S1
    $P5 = $P1.'emit_left_get'(__ARG_1)
    null $S1
    if_null $P5, __label_3
    set $S1, $P5
  __label_3:
.annotate 'line', 5175
# rreg: $S2
    $P5 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P5, __label_4
    set $S2, $P5
  __label_4:
.annotate 'line', 5176
    concat $S3, $S1, '.'
    concat $S3, $S3, $S2
    .return($S3)
# }
.annotate 'line', 5177

.end # emitcall

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CallMemberRefExpr' ]
.annotate 'line', 5157
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
.annotate 'line', 5187
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5188
    setattribute self, 'left', __ARG_3
# }
.annotate 'line', 5189

.end # MemberExprBase


.sub 'emit_left_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5192
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5193
# type: $S1
    $P2 = $P1.'checkresult'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 5194
# reg: $S2
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 5195
    eq $S1, 'P', __label_3
# {
.annotate 'line', 5196
# auxreg: $S3
    set $S3, $S2
.annotate 'line', 5197
    $P2 = self.'tempreg'('P')
    set $S2, $P2
.annotate 'line', 5198
    __ARG_1.'emitbox'($S2, $S3)
# }
  __label_3: # endif
.annotate 'line', 5200
    .return($S2)
# }
.annotate 'line', 5201

.end # emit_left_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MemberExprBase' ]
.annotate 'line', 5182
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5184
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
.annotate 'line', 5210
    self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5211
    setattribute self, 'right', __ARG_4
# }
.annotate 'line', 5212

.end # MemberExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5213
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5216
    getattribute $P3, self, 'left'
    $P2 = $P3.'optimize'()
    setattribute self, 'left', $P2
.annotate 'line', 5217
    .return(self)
# }
.annotate 'line', 5218

.end # optimize


.sub 'buildkey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5221
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5222
    isa $I1, $P1, [ 'IdentifierExpr' ]
    unless $I1 goto __label_1
.annotate 'line', 5223
    $P2 = $P1.'getName'()
# predefined push
    push __ARG_1, $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 5225
    $P1.'buildkey'(__ARG_1)
  __label_2: # endif
.annotate 'line', 5226
    getattribute $P3, self, 'right'
    $P2 = $P3.'getidentifier'()
# predefined push
    push __ARG_1, $P2
# }
.annotate 'line', 5227

.end # buildkey


.sub 'get_member' :method
# Body
# {
.annotate 'line', 5230
    getattribute $P1, self, 'right'
    .return($P1)
# }
.annotate 'line', 5231

.end # get_member


.sub '__emit_assign_aux' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5234
# ident: $S1
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5235
    self.'annotate'(__ARG_1)
.annotate 'line', 5236
    __ARG_1.'say'('    ', "setattribute ", __ARG_2, ", '", $S1, "', ", __ARG_3)
# }
.annotate 'line', 5237

.end # __emit_assign_aux


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5240
# result: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5241
    self.'emit'(__ARG_1, $S1)
.annotate 'line', 5242
    .return($S1)
# }
.annotate 'line', 5243

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5246
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5247
# ident: $S2
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5248
    self.'annotate'(__ARG_1)
.annotate 'line', 5249
    __ARG_1.'say'('    ', 'getattribute ', __ARG_2, ', ', $S1, ", '", $S2, "'")
# }
.annotate 'line', 5250

.end # emit


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5253
    self.'emit'(__ARG_1, __ARG_2)
# }
.annotate 'line', 5254

.end # emit_init


.sub 'emit_assign' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5257
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5258
# value: $S2
    null $S2
.annotate 'line', 5259
    ne __ARG_2, 'P', __label_2
# {
.annotate 'line', 5261
    ne __ARG_3, 'null', __label_4
# {
.annotate 'line', 5262
    $P1 = self.'tempreg'('P')
    set __ARG_3, $P1
.annotate 'line', 5263
    __ARG_1.'emitnull'(__ARG_3)
# }
  __label_4: # endif
.annotate 'line', 5265
    set $S2, __ARG_3
# }
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 5268
    $P1 = self.'tempreg'('P')
    set $S2, $P1
.annotate 'line', 5269
    __ARG_1.'emitbox'($S2, __ARG_3)
# }
  __label_3: # endif
.annotate 'line', 5271
    self.'__emit_assign_aux'(__ARG_1, $S1, $S2)
# }
.annotate 'line', 5272

.end # emit_assign


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5275
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5276
# value: $S2
    $P1 = self.'tempreg'('P')
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5277
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_3
    unless $P1 goto __label_3
.annotate 'line', 5278
    __ARG_1.'emitnull'($S2)
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 5280
# rreg: $S3
    $P2 = __ARG_2.'emit_get'(__ARG_1)
    null $S3
    if_null $P2, __label_5
    set $S3, $P2
  __label_5:
.annotate 'line', 5281
    $P1 = __ARG_2.'checkresult'()
    set $S4, $P1
    eq $S4, 'P', __label_6
.annotate 'line', 5282
    __ARG_1.'emitbox'($S2, $S3)
    goto __label_7
  __label_6: # else
.annotate 'line', 5284
    set $S2, $S3
  __label_7: # endif
# }
  __label_4: # endif
.annotate 'line', 5286
    self.'__emit_assign_aux'(__ARG_1, $S1, $S2)
.annotate 'line', 5287
    .return($S2)
# }
.annotate 'line', 5288

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MemberExpr' ]
.annotate 'line', 5204
    get_class $P1, [ 'MemberExprBase' ]
    addparent $P0, $P1
.annotate 'line', 5206
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
.annotate 'line', 5298
    self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5299
    setattribute self, 'right', __ARG_4
# }
.annotate 'line', 5300

.end # MemberRefExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5301
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5304
    getattribute $P3, self, 'left'
    $P2 = $P3.'optimize'()
    setattribute self, 'left', $P2
.annotate 'line', 5305
    getattribute $P3, self, 'right'
    $P2 = $P3.'optimize'()
    setattribute self, 'right', $P2
.annotate 'line', 5306
    .return(self)
# }
.annotate 'line', 5307

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.const 'Sub' $P1 = 'WSubId_1'
.annotate 'line', 5311
    getattribute $P2, self, 'start'
.annotate 'line', 5310
    $P1('Member reference can be used only for method calls', $P2)
# }
.annotate 'line', 5312

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MemberRefExpr' ]
.annotate 'line', 5293
    get_class $P1, [ 'MemberExprBase' ]
    addparent $P0, $P1
.annotate 'line', 5295
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
.annotate 'line', 5326
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5327
    setattribute self, 'left', __ARG_4
.annotate 'line', 5328
    new $P3, [ 'SimpleArgList' ]
    $P3.'SimpleArgList'(__ARG_1, __ARG_2, ']')
    set $P2, $P3
    setattribute self, 'args', $P2
# }
.annotate 'line', 5329

.end # IndexExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5332
    getattribute $P2, self, 'left'
    $P1 = $P2.'checkresult'()
    set $S1, $P1
    ne $S1, 'S', __label_1
.annotate 'line', 5333
    .return('S')
    goto __label_2
  __label_1: # else
.annotate 'line', 5335
    .return('P')
  __label_2: # endif
# }
.annotate 'line', 5336

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5339
# var left: $P1
    getattribute $P5, self, 'left'
    $P1 = $P5.'optimize'()
.annotate 'line', 5340
    setattribute self, 'left', $P1
.annotate 'line', 5341
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 5342
    $P2.'optimizeargs'()
.annotate 'line', 5346
    $I2 = $P1.'isstringliteral'()
    unless $I2 goto __label_2
    $P5 = $P2.'numargs'()
    set $I3, $P5
    iseq $I2, $I3, 1
  __label_2:
    unless $I2 goto __label_1
# {
.annotate 'line', 5347
# var arg: $P3
    $P3 = $P2.'getarg'(0)
.annotate 'line', 5348
    $P5 = $P3.'isintegerliteral'()
    if_null $P5, __label_3
    unless $P5 goto __label_3
# {
.annotate 'line', 5349
# ival: $I1
    $P6 = $P3.'getIntegerValue'()
    set $I1, $P6
.annotate 'line', 5350
# sval: $S1
    $P5 = $P1.'get_value'()
    null $S1
    if_null $P5, __label_4
    set $S1, $P5
  __label_4:
.annotate 'line', 5351
# var t: $P4
    new $P4, [ 'TokenQuoted' ]
    getattribute $P6, self, 'start'
    getattribute $P5, $P6, 'file'
    getattribute $P8, self, 'start'
    getattribute $P7, $P8, 'line'
.annotate 'line', 5352
# predefined substr
.annotate 'line', 5351
    substr $S2, $S1, $I1, 1
    $P4.'TokenQuoted'($P5, $P7, $S2)
.annotate 'line', 5353
    new $P6, [ 'StringLiteral' ]
    getattribute $P7, self, 'owner'
    $P6.'StringLiteral'($P7, $P4)
    set $P5, $P6
    .return($P5)
# }
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 5356
    .return(self)
# }
.annotate 'line', 5357

.end # optimize


.sub 'emit_prep' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5360
    getattribute $P2, self, 'regleft'
    isnull $I1, $P2
    not $I1
    if $I1 goto __label_2
    getattribute $P3, self, 'argregs'
    isnull $I1, $P3
    not $I1
  __label_2:
    unless $I1 goto __label_1
.const 'Sub' $P4 = 'WSubId_6'
.annotate 'line', 5361
    getattribute $P5, self, 'start'
    $P4('wrong call to IndexExpr.emit_args', $P5)
  __label_1: # endif
.annotate 'line', 5362
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5363
    $P5 = $P1.'isidentifier'()
    if_null $P5, __label_4
    unless $P5 goto __label_4
.annotate 'line', 5364
    $P3 = $P1.'getIdentifier'()
    goto __label_3
  __label_4:
.annotate 'line', 5365
    $P3 = $P1.'emit_get'(__ARG_1)
  __label_3:
.annotate 'line', 5363
    setattribute self, 'regleft', $P3
.annotate 'line', 5366
    getattribute $P5, self, 'args'
    $P3 = $P5.'getargvalues'(__ARG_1)
    setattribute self, 'argregs', $P3
# }
.annotate 'line', 5367

.end # emit_prep


.sub 'emit_aux' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5370
# var regleft: $P1
    getattribute $P1, self, 'regleft'
.annotate 'line', 5371
# var argregs: $P2
    getattribute $P2, self, 'argregs'
.annotate 'line', 5372
    isnull $I1, $P1
    if $I1 goto __label_2
    isnull $I1, $P2
  __label_2:
    unless $I1 goto __label_1
.const 'Sub' $P3 = 'WSubId_6'
.annotate 'line', 5373
    getattribute $P4, self, 'start'
    $P3('wrong call to IndexExpr.emit_aux', $P4)
  __label_1: # endif
.annotate 'line', 5374
    getattribute $P4, self, 'regleft'
    __ARG_1.'print'($P4, '[')
.annotate 'line', 5375
# predefined join
    join $S1, '; ', $P2
    __ARG_1.'print'($S1)
.annotate 'line', 5376
    __ARG_1.'print'(']')
# }
.annotate 'line', 5377

.end # emit_aux


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5380
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5381
# type: $S1
    $P2 = self.'checkresult'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 5382
    ne $S1, 'S', __label_2
# {
.annotate 'line', 5383
# var argregs: $P1
    getattribute $P1, self, 'argregs'
.annotate 'line', 5384
# nargs: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 5385
    eq $I1, 1, __label_4
.const 'Sub' $P3 = 'WSubId_1'
.annotate 'line', 5386
    getattribute $P2, self, 'start'
    $P3('Bad string index', $P2)
  __label_4: # endif
.annotate 'line', 5387
    set $S2, __ARG_2
    ne $S2, '', __label_5
.annotate 'line', 5388
    __ARG_2 = self.'tempreg'('S')
  __label_5: # endif
.annotate 'line', 5389
    getattribute $P2, self, 'regleft'
    $P4 = $P1[0]
    __ARG_1.'say'('    ', 'substr ', __ARG_2, ', ', $P2, ', ', $P4, ', ', 1)
# }
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 5392
    self.'annotate'(__ARG_1)
.annotate 'line', 5393
    __ARG_1.'print'('    ', __ARG_2, ' = ')
.annotate 'line', 5394
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5395
    __ARG_1.'say'('')
# }
  __label_3: # endif
# }
.annotate 'line', 5397

.end # emit


.sub 'emit_assign' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5400
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5401
    self.'annotate'(__ARG_1)
.annotate 'line', 5402
    __ARG_1.'print'('    ')
.annotate 'line', 5403
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5404
    __ARG_1.'say'(' = ', __ARG_3)
# }
.annotate 'line', 5405

.end # emit_assign


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5408
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5409
# rreg: $S1
    null $S1
.annotate 'line', 5410
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
# {
.annotate 'line', 5411
    $P2 = self.'tempreg'('P')
    set $S1, $P2
.annotate 'line', 5412
    __ARG_1.'emitnull'($S1)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 5415
    $P1 = __ARG_2.'emit_get'(__ARG_1)
    set $S1, $P1
  __label_2: # endif
.annotate 'line', 5416
    self.'annotate'(__ARG_1)
.annotate 'line', 5417
    __ARG_1.'print'('    ')
.annotate 'line', 5418
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5419
    __ARG_1.'say'(' = ', $S1)
.annotate 'line', 5420
    .return($S1)
# }
.annotate 'line', 5421

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IndexExpr' ]
.annotate 'line', 5317
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5319
    addattribute $P0, 'left'
.annotate 'line', 5320
    addattribute $P0, 'regleft'
.annotate 'line', 5321
    addattribute $P0, 'args'
.annotate 'line', 5322
    addattribute $P0, 'argregs'
.end
.namespace [ 'ArrayExpr' ]

.sub 'ArrayExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5432
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5433
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5434
    $P2 = $P1.'isop'(']')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 5435
    __ARG_1.'unget'($P1)
.annotate 'line', 5436
.const 'Sub' $P3 = 'parseExpr'
.annotate 'line', 5437
.const 'Sub' $P5 = 'WSubId_27'
    $P4 = $P5(__ARG_1, __ARG_2, $P3, ']')
    setattribute self, 'values', $P4
# }
  __label_1: # endif
# }
.annotate 'line', 5439

.end # ArrayExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5440
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.const 'Sub' $P1 = 'WSubId_28'
.annotate 'line', 5443
    getattribute $P2, self, 'values'
    $P1($P2)
.annotate 'line', 5444
    .return(self)
# }
.annotate 'line', 5445

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5448
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 5449
# value: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_3
    set $S1, $P1
  __label_3:
.annotate 'line', 5450
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 5456
    self.'emit_init'(__ARG_1, '')
# }
  __label_2: # endif
# }
.annotate 'line', 5458

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5461
# container: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5462
    self.'emit_init'(__ARG_1, $S1)
.annotate 'line', 5463
    .return($S1)
# }
.annotate 'line', 5464

.end # emit_get


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 5467
    self.'annotate'(__ARG_1)
.annotate 'line', 5468
# itemreg: $S1
    null $S1
.annotate 'line', 5469
# it_p: $S2
    null $S2
.annotate 'line', 5470
    eq __ARG_2, '', __label_1
# {
.annotate 'line', 5471
    __ARG_1.'say'('    ', 'root_new ', __ARG_2, ", ['parrot';'ResizablePMCArray']")
.annotate 'line', 5472
    $P3 = self.'tempreg'('P')
    set $S2, $P3
# }
  __label_1: # endif
.annotate 'line', 5474
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 5475
    if_null $P1, __label_2
# {
.annotate 'line', 5476
    iter $P4, $P1
    set $P4, 0
  __label_3: # for iteration
    unless $P4 goto __label_4
    shift $P2, $P4
# {
# switch
.annotate 'line', 5477
    $P3 = $P2.'checkresult'()
    set $S4, $P3
    set $S5, 'I'
    if $S4 == $S5 goto __label_7
    set $S5, 'N'
    if $S4 == $S5 goto __label_8
    set $S5, 'S'
    if $S4 == $S5 goto __label_9
    goto __label_6
  __label_7: # case
  __label_8: # case
  __label_9: # case
.annotate 'line', 5479
# aux: $S3
    $P5 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P5, __label_10
    set $S3, $P5
  __label_10:
.annotate 'line', 5480
    eq __ARG_2, '', __label_11
# {
.annotate 'line', 5481
    __ARG_1.'emitbox'($S2, $S3)
.annotate 'line', 5482
    set $S1, $S2
# }
  __label_11: # endif
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 5486
    $P3 = $P2.'isnull'()
    if_null $P3, __label_12
    unless $P3 goto __label_12
# {
.annotate 'line', 5487
    eq __ARG_2, '', __label_14
# {
.annotate 'line', 5488
    $P5 = self.'tempreg'('P')
    set $S1, $P5
.annotate 'line', 5489
    __ARG_1.'emitnull'($S1)
# }
  __label_14: # endif
# }
    goto __label_13
  __label_12: # else
.annotate 'line', 5493
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S1, $P3
  __label_13: # endif
  __label_5: # switch end
.annotate 'line', 5495
    eq __ARG_2, '', __label_15
# {
.annotate 'line', 5496
    self.'annotate'(__ARG_1)
.annotate 'line', 5497
    __ARG_1.'emitarg2'('push', __ARG_2, $S1)
# }
  __label_15: # endif
# }
    goto __label_3
  __label_4: # endfor
# }
  __label_2: # endif
# }
.annotate 'line', 5501

.end # emit_init

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ArrayExpr' ]
.annotate 'line', 5426
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5428
    addattribute $P0, 'values'
.end
.namespace [ 'HashExpr' ]

.sub 'HashExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5513
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5514
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5515
# var keys: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 5516
# var values: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 5517
    $P6 = $P1.'isop'('}')
    isfalse $I1, $P6
    unless $I1 goto __label_1
# {
.annotate 'line', 5518
    __ARG_1.'unget'($P1)
  __label_2: # do
.annotate 'line', 5519
# {
.annotate 'line', 5520
# var key: $P4
.const 'Sub' $P7 = 'WSubId_30'
    $P4 = $P7(__ARG_1, __ARG_2)
.const 'Sub' $P8 = 'WSubId_43'
.annotate 'line', 5521
    $P8(':', __ARG_1)
.annotate 'line', 5522
# var value: $P5
.const 'Sub' $P9 = 'WSubId_30'
    $P5 = $P9(__ARG_1, __ARG_2)
.annotate 'line', 5523
# predefined push
    push $P2, $P4
.annotate 'line', 5524
# predefined push
    push $P3, $P5
# }
  __label_4: # continue
.annotate 'line', 5526
    $P1 = __ARG_1.'get'()
    $P6 = $P1.'isop'(',')
    if_null $P6, __label_3
    if $P6 goto __label_2
  __label_3: # enddo
.annotate 'line', 5527
    $P6 = $P1.'isop'('}')
    isfalse $I1, $P6
    unless $I1 goto __label_5
.const 'Sub' $P10 = 'WSubId_29'
.annotate 'line', 5528
    $P10("',' or '}'", $P1)
  __label_5: # endif
# }
  __label_1: # endif
.annotate 'line', 5530
    setattribute self, 'keys', $P2
.annotate 'line', 5531
    setattribute self, 'values', $P3
# }
.annotate 'line', 5532

.end # HashExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5533
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.const 'Sub' $P1 = 'WSubId_28'
.annotate 'line', 5536
    getattribute $P2, self, 'keys'
    $P1($P2)
.const 'Sub' $P3 = 'WSubId_28'
.annotate 'line', 5537
    getattribute $P2, self, 'values'
    $P3($P2)
.annotate 'line', 5538
    .return(self)
# }
.annotate 'line', 5539

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5542
    self.'annotate'(__ARG_1)
.annotate 'line', 5547
    set $S6, __ARG_2
    eq $S6, '', __label_1
.annotate 'line', 5548
    __ARG_1.'say'('    ', 'root_new ', __ARG_2, ", ['parrot';'Hash']")
  __label_1: # endif
.annotate 'line', 5550
# var keys: $P1
    getattribute $P1, self, 'keys'
.annotate 'line', 5551
# var values: $P2
    getattribute $P2, self, 'values'
.annotate 'line', 5552
# n: $I1
    set $P5, $P1
    set $I1, $P5
# for loop
.annotate 'line', 5553
# i: $I2
    null $I2
  __label_4: # for condition
    ge $I2, $I1, __label_3
# {
.annotate 'line', 5554
# var key: $P3
    $P3 = $P1[$I2]
.annotate 'line', 5555
# item: $S1
    null $S1
.annotate 'line', 5556
    $P5 = $P3.'isidentifier'()
    if_null $P5, __label_5
    unless $P5 goto __label_5
# {
.annotate 'line', 5557
# id: $S2
    $P6 = $P3.'getName'()
    null $S2
    if_null $P6, __label_7
    set $S2, $P6
  __label_7:
.annotate 'line', 5558
    $P5 = self.'tempreg'('P')
    set $S1, $P5
.annotate 'line', 5559
    __ARG_1.'say'('    ', 'get_hll_global ', $S1, ", '", $S2, "'")
# }
    goto __label_6
  __label_5: # else
.annotate 'line', 5562
    $P5 = $P3.'emit_get'(__ARG_1)
    set $S1, $P5
  __label_6: # endif
.annotate 'line', 5564
# var value: $P4
    $P4 = $P2[$I2]
.annotate 'line', 5565
# itemreg: $S3
    null $S3
# switch-case
.annotate 'line', 5567
    $I3 = $P4.'isnull'()
    if $I3 goto __label_10
.annotate 'line', 5573
    $I3 = $P4.'isidentifier'()
    if $I3 goto __label_11
    goto __label_9
  __label_10: # case
.annotate 'line', 5568
    set $S6, __ARG_2
    eq $S6, '', __label_12
# {
.annotate 'line', 5569
    $P5 = self.'tempreg'('P')
    set $S3, $P5
.annotate 'line', 5570
    __ARG_1.'emitnull'($S3)
# }
  __label_12: # endif
    goto __label_8 # break
  __label_11: # case
.annotate 'line', 5574
# s: $S4
    $P5 = $P4.'checkIdentifier'()
    null $S4
    if_null $P5, __label_13
    set $S4, $P5
  __label_13:
.annotate 'line', 5575
    isnull $I3, $S4
    not $I3
    unless $I3 goto __label_16
    isne $I3, $S4, ''
  __label_16:
    unless $I3 goto __label_14
.annotate 'line', 5576
    set $S3, $S4
    goto __label_15
  __label_14: # else
# {
.annotate 'line', 5578
# id: $S5
    $P6 = $P4.'getName'()
    null $S5
    if_null $P6, __label_17
    set $S5, $P6
  __label_17:
.annotate 'line', 5579
    getattribute $P6, self, 'owner'
    $P5 = $P6.'getvar'($S5)
    unless_null $P5, __label_18
# {
.annotate 'line', 5580
    $P7 = self.'tempreg'('P')
    set $S3, $P7
.annotate 'line', 5581
    __ARG_1.'say'('    ', 'get_hll_global ', $S3, ", '", $S5, "'")
# }
    goto __label_19
  __label_18: # else
.annotate 'line', 5584
    $P5 = $P4.'emit_get'(__ARG_1)
    set $S3, $P5
  __label_19: # endif
# }
  __label_15: # endif
    goto __label_8 # break
  __label_9: # default
.annotate 'line', 5588
    $P5 = $P4.'emit_get'(__ARG_1)
    set $S3, $P5
  __label_8: # switch end
.annotate 'line', 5590
    set $S6, __ARG_2
    eq $S6, '', __label_20
.annotate 'line', 5591
    __ARG_1.'say'('    ', __ARG_2, '[', $S1, '] = ', $S3)
  __label_20: # endif
# }
  __label_2: # for iteration
.annotate 'line', 5553
    inc $I2
    goto __label_4
  __label_3: # for end
# }
.annotate 'line', 5593

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5596
# container: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5597
    self.'emit'(__ARG_1, $S1)
.annotate 'line', 5598
    .return($S1)
# }
.annotate 'line', 5599

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'HashExpr' ]
.annotate 'line', 5506
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5508
    addattribute $P0, 'keys'
.annotate 'line', 5509
    addattribute $P0, 'values'
.end
.namespace [ 'NewBaseExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5612
    .return('P')
# }

.end # checkresult


.sub 'parseinitializer' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5617
    new $P3, [ 'ArgumentList' ]
    getattribute $P4, self, 'owner'
    getattribute $P5, self, 'start'
    $P3.'ArgumentList'($P4, $P5, __ARG_1, ')')
    set $P2, $P3
    setattribute self, 'initializer', $P2
# }
.annotate 'line', 5618

.end # parseinitializer


.sub 'optimize_initializer' :method
# Body
# {
.annotate 'line', 5621
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5622
    if_null $P1, __label_1
.annotate 'line', 5623
    $P3 = $P1.'optimize'()
    setattribute self, 'initializer', $P3
  __label_1: # endif
# }
.annotate 'line', 5624

.end # optimize_initializer


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5627
    self.'optimize_initializer'()
.annotate 'line', 5628
    .return(self)
# }
.annotate 'line', 5629

.end # optimize


.sub 'emit_constructor' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5632
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5633
    if_null $P1, __label_1
.annotate 'line', 5634
    $P1.'getargvalues'(__ARG_1)
  __label_1: # endif
.annotate 'line', 5635
    __ARG_1.'print'('    ', __ARG_2, ".'", __ARG_3, "'(")
.annotate 'line', 5636
    if_null $P1, __label_2
.annotate 'line', 5637
    $P1.'emitargs'(__ARG_1)
  __label_2: # endif
.annotate 'line', 5638
    __ARG_1.'say'(")")
# }
.annotate 'line', 5639

.end # emit_constructor

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NewBaseExpr' ]
.annotate 'line', 5604
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5606
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
.annotate 'line', 5650
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5652
    $I2 = __ARG_4.'isstring'()
    if $I2 goto __label_2
    $I2 = __ARG_4.'isidentifier'()
  __label_2:
    not $I1, $I2
    unless $I1 goto __label_1
.const 'Sub' $P2 = 'WSubId_1'
.annotate 'line', 5653
    $P2("Unimplemented", __ARG_4)
  __label_1: # endif
.annotate 'line', 5654
    setattribute self, 'value', __ARG_4
.annotate 'line', 5655
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5657
    $P3 = $P1.'isop'('(')
    if_null $P3, __label_3
    unless $P3 goto __label_3
.annotate 'line', 5658
    self.'parseinitializer'(__ARG_1)
    goto __label_4
  __label_3: # else
.annotate 'line', 5660
    __ARG_1.'unget'($P1)
  __label_4: # endif
# }
.annotate 'line', 5661

.end # NewExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5664
# var value: $P1
    getattribute $P1, self, 'value'
.annotate 'line', 5665
    isa $I1, $P1, [ 'Token' ]
    unless $I1 goto __label_2
    $I1 = $P1.'isidentifier'()
  __label_2:
    unless $I1 goto __label_1
# {
.annotate 'line', 5668
# var desc: $P2
    getattribute $P3, self, 'owner'
    $P4 = $P1.'getidentifier'()
    $P2 = $P3.'getvar'($P4)
.annotate 'line', 5669
    isnull $I1, $P2
    not $I1
    unless $I1 goto __label_4
    $I1 = $P2.'isconst'()
  __label_4:
    unless $I1 goto __label_3
# {
.annotate 'line', 5670
    $P1 = $P2.'getvalue'()
.annotate 'line', 5671
    isa $I2, $P1, [ 'StringLiteral' ]
    not $I1, $I2
    unless $I1 goto __label_5
.const 'Sub' $P5 = 'WSubId_1'
.annotate 'line', 5672
    $P5('Constant value must evaluate to a string', $P1)
  __label_5: # endif
.annotate 'line', 5673
    getattribute $P4, $P1, 'strval'
    setattribute self, 'value', $P4
# }
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 5676
    self.'optimize_initializer'()
.annotate 'line', 5677
    .return(self)
# }
.annotate 'line', 5678

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 5681
    self.'annotate'(__ARG_1)
.annotate 'line', 5683
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5684
# numinits: $I1
    unless_null $P1, __label_2
    set $I1, -1
    goto __label_1
  __label_2:
    $I1 = $P1.'numargs'()
  __label_1:
# Constant BYNAME evaluated at compile time
# Constant BYIDENT evaluated at compile time
.annotate 'line', 5687
# type: $I2
    getattribute $P7, self, 'value'
    $P6 = $P7.'isstring'()
    if_null $P6, __label_4
    unless $P6 goto __label_4
    null $I2
    goto __label_3
  __label_4:
.annotate 'line', 5688
    getattribute $P9, self, 'value'
    $P8 = $P9.'isidentifier'()
    if_null $P8, __label_6
    unless $P8 goto __label_6
    set $I2, 1
    goto __label_5
  __label_6:
    set $I2, -1
  __label_5:
  __label_3:
.annotate 'line', 5690
# reginit: $S1
    set $S1, ''
.annotate 'line', 5691
# regnew: $S2
    set $P6, __ARG_2
    null $S2
    if_null $P6, __label_7
    set $S2, $P6
  __label_7:
.annotate 'line', 5692
# constructor: $S3
    null $S3
# switch
.annotate 'line', 5693
    set $I3, $I1
    set $I4, -1
    if $I3 == $I4 goto __label_10
    null $I4
    if $I3 == $I4 goto __label_11
    set $I4, 1
    if $I3 == $I4 goto __label_12
    goto __label_9
  __label_10: # case
  __label_11: # case
    goto __label_8 # break
  __label_12: # case
.annotate 'line', 5698
    ne $I2, 1, __label_13
# {
.annotate 'line', 5699
    not $I5, __ARG_3
    unless $I5 goto __label_15
.annotate 'line', 5700
    $P6 = self.'tempreg'('P')
    set $S2, $P6
  __label_15: # endif
# }
    goto __label_14
  __label_13: # else
# {
.annotate 'line', 5703
# var initval: $P2
    $P2 = $P1.'getfreearg'(0)
.annotate 'line', 5704
    $P6 = $P2.'emit_get'(__ARG_1)
    set $S1, $P6
.annotate 'line', 5705
    concat $S0, ', ', $S1
    set $S1, $S0
# }
  __label_14: # endif
    goto __label_8 # break
  __label_9: # default
.annotate 'line', 5709
    eq $I2, 1, __label_16
.const 'Sub' $P10 = 'WSubId_1'
.annotate 'line', 5710
    getattribute $P6, self, 'start'
    $P10('Multiple init arguments not allowed here', $P6)
  __label_16: # endif
.annotate 'line', 5711
    not $I3, __ARG_3
    unless $I3 goto __label_17
.annotate 'line', 5712
    $P7 = self.'tempreg'('P')
    set $S2, $P7
  __label_17: # endif
  __label_8: # switch end
# switch
.annotate 'line', 5715
    set $I3, $I2
    null $I4
    if $I3 == $I4 goto __label_20
    set $I4, 1
    if $I3 == $I4 goto __label_21
    goto __label_19
  __label_20: # case
.annotate 'line', 5718
# name: $S4
    getattribute $P7, self, 'value'
    $P6 = $P7.'rawstring'()
    null $S4
    if_null $P6, __label_22
    set $S4, $P6
  __label_22:
.annotate 'line', 5719
# var aux: $P3
# predefined get_class
    get_class $P3, $S4
.annotate 'line', 5720
    isnull $I5, $P3
    unless $I5 goto __label_24
    $I5 = self.'dowarnings'()
  __label_24:
    unless $I5 goto __label_23
.const 'Sub' $P11 = 'WSubId_55'
.annotate 'line', 5721
    concat $S5, "Can't locate class ", $S4
    concat $S5, $S5, " at compile time"
    getattribute $P8, self, 'value'
    $P11($S5, $P8)
  __label_23: # endif
.annotate 'line', 5725
    getattribute $P9, self, 'value'
    __ARG_1.'say'('    ', 'new ', $S2, ", [ ", $P9, " ]", $S1)
.annotate 'line', 5726
    le $I1, 1, __label_25
# {
.annotate 'line', 5727
    getattribute $P12, self, 'value'
    __ARG_1.'say'($S2, ".'", $P12, "'()")
# }
  __label_25: # endif
    goto __label_18 # break
  __label_21: # case
.annotate 'line', 5731
# var id: $P4
    getattribute $P6, self, 'owner'
    getattribute $P7, self, 'value'
    $P4 = $P6.'getvar'($P7)
.annotate 'line', 5732
    unless_null $P4, __label_26
# {
.annotate 'line', 5734
# var cl: $P5
    getattribute $P8, self, 'owner'
    getattribute $P9, self, 'value'
    $P5 = $P8.'checkclass'($P9)
.annotate 'line', 5735
    if_null $P5, __label_28
# {
.annotate 'line', 5736
    $P6 = $P5.'getclasskey'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P6, $S1)
# }
    goto __label_29
  __label_28: # else
# {
.annotate 'line', 5739
    $P6 = self.'dowarnings'()
    if_null $P6, __label_30
    unless $P6 goto __label_30
.const 'Sub' $P13 = 'WSubId_55'
.annotate 'line', 5740
    $P13('Checking: new unknown type')
  __label_30: # endif
.annotate 'line', 5741
    getattribute $P6, self, 'value'
    __ARG_1.'say'('    ', 'new ', $S2, ", ['", $P6, "']", $S1)
# }
  __label_29: # endif
.annotate 'line', 5743
    getattribute $P6, self, 'value'
    set $S3, $P6
# }
    goto __label_27
  __label_26: # else
# {
.annotate 'line', 5747
    $P6 = $P4.'getreg'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P6, "", $S1)
# }
  __label_27: # endif
    goto __label_18 # break
  __label_19: # default
.annotate 'line', 5749
.const 'Sub' $P14 = 'WSubId_6'
.annotate 'line', 5751
    $P14('Unexpected type in new')
  __label_18: # switch end
.annotate 'line', 5753
    isgt $I3, $I1, 1
    if $I3 goto __label_32
    isge $I3, $I1, 0
    unless $I3 goto __label_33
    iseq $I3, $I2, 1
  __label_33:
  __label_32:
    unless $I3 goto __label_31
# {
.annotate 'line', 5754
    self.'emit_constructor'(__ARG_1, $S2, $S3)
.annotate 'line', 5755
    not $I3, __ARG_3
    unless $I3 goto __label_34
.annotate 'line', 5756
    __ARG_1.'emitset'(__ARG_2, $S2)
  __label_34: # endif
# }
  __label_31: # endif
# }
.annotate 'line', 5758

.end # emit


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5761
    .tailcall self.'emit'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 5762

.end # emit_init

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NewExpr' ]
.annotate 'line', 5644
    get_class $P1, [ 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 5646
    addattribute $P0, 'value'
.end
.namespace [ 'NewIndexedExpr' ]

.sub 'NewIndexedExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5773
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5774
    setattribute self, 'owner', __ARG_2
.annotate 'line', 5775
# var nskey: $P1
    new $P1, [ 'ClassSpecifierParrotKey' ]
    $P1.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5776
    setattribute self, 'nskey', $P1
.annotate 'line', 5777
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 5778
    $P3 = $P2.'isop'('(')
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 5779
    self.'parseinitializer'(__ARG_1)
    goto __label_2
  __label_1: # else
.annotate 'line', 5781
    __ARG_1.'unget'($P2)
  __label_2: # endif
# }
.annotate 'line', 5782

.end # NewIndexedExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5785
# reginit: $S1
    null $S1
.annotate 'line', 5786
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5787
# numinits: $I1
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
    $I1 = $P1.'numargs'()
  __label_1:
# switch
.annotate 'line', 5788
    set $I2, $I1
    null $I3
    if $I2 == $I3 goto __label_5
    set $I3, 1
    if $I2 == $I3 goto __label_6
    goto __label_4
  __label_5: # case
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 5792
# var initval: $P2
    $P2 = $P1.'getfreearg'(0)
.annotate 'line', 5793
    $P4 = $P2.'emit_get'(__ARG_1)
    set $S1, $P4
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 5794
.const 'Sub' $P5 = 'WSubId_1'
.annotate 'line', 5796
    getattribute $P6, self, 'start'
    $P5('Multiple init arguments not allowed here', $P6)
  __label_3: # switch end
.annotate 'line', 5798
# var nskey: $P3
    getattribute $P3, self, 'nskey'
.annotate 'line', 5799
    __ARG_1.'print'('    ')
.annotate 'line', 5800
    $P4 = $P3.'hasHLL'()
    if_null $P4, __label_7
    unless $P4 goto __label_7
.annotate 'line', 5801
    __ARG_1.'print'("root_")
  __label_7: # endif
.annotate 'line', 5802
    __ARG_1.'print'("new ", __ARG_2, ", ")
.annotate 'line', 5803
    null $P4
    $P3.'emit'(__ARG_1, $P4)
.annotate 'line', 5804
    if_null $S1, __label_8
.annotate 'line', 5805
    __ARG_1.'print'(', ', $S1)
  __label_8: # endif
.annotate 'line', 5806
    __ARG_1.'say'()
# }
.annotate 'line', 5807

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NewIndexedExpr' ]
.annotate 'line', 5767
    get_class $P1, [ 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 5769
    addattribute $P0, 'nskey'
.end
.namespace [ 'NewQualifiedExpr' ]

.sub 'NewQualifiedExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5818
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5819
    setattribute self, 'owner', __ARG_2
.annotate 'line', 5820
# var nskey: $P1
    new $P1, [ 'ClassSpecifierId' ]
    $P1.'ClassSpecifierId'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5821
    setattribute self, 'nskey', $P1
.annotate 'line', 5822
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 5823
    $P3 = $P2.'isop'('(')
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 5824
    self.'parseinitializer'(__ARG_1)
    goto __label_2
  __label_1: # else
.annotate 'line', 5826
    __ARG_1.'unget'($P2)
  __label_2: # endif
# }
.annotate 'line', 5827

.end # NewQualifiedExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5830
# reginit: $S1
    null $S1
.annotate 'line', 5831
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5833
# numinits: $I1
    unless_null $P1, __label_2
    set $I1, -1
    goto __label_1
  __label_2:
    $I1 = $P1.'numargs'()
  __label_1:
.annotate 'line', 5834
# regnew: $S2
    set $P3, __ARG_2
    null $S2
    if_null $P3, __label_3
    set $S2, $P3
  __label_3:
.annotate 'line', 5835
    le $I1, 0, __label_4
.annotate 'line', 5836
    $P3 = self.'tempreg'('P')
    set $S2, $P3
  __label_4: # endif
.annotate 'line', 5837
# var nskey: $P2
    getattribute $P2, self, 'nskey'
.annotate 'line', 5838
    __ARG_1.'print'('    ', 'new ', $S2, ", ")
.annotate 'line', 5839
    getattribute $P3, self, 'owner'
    $P2.'emit'(__ARG_1, $P3)
.annotate 'line', 5840
    __ARG_1.'say'()
.annotate 'line', 5842
    lt $I1, 0, __label_5
# {
.annotate 'line', 5843
# constructor: $S3
    $P3 = $P2.'last'()
    null $S3
    if_null $P3, __label_6
    set $S3, $P3
  __label_6:
.annotate 'line', 5844
    self.'emit_constructor'(__ARG_1, $S2, $S3)
.annotate 'line', 5845
    __ARG_1.'emitset'(__ARG_2, $S2)
# }
  __label_5: # endif
# }
.annotate 'line', 5847

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NewQualifiedExpr' ]
.annotate 'line', 5812
    get_class $P1, [ 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 5814
    addattribute $P0, 'nskey'
.end
.namespace [ ]

.sub 'parseNew' :subid('WSubId_56')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5854
# var t: $P1
    $P1 = __ARG_1.'get'()
# switch-case
.annotate 'line', 5857
    $I1 = $P1.'isop'('(')
    if $I1 goto __label_3
.annotate 'line', 5861
    $I1 = $P1.'isop'('[')
    if $I1 goto __label_4
.annotate 'line', 5864
    $I1 = $P1.'isidentifier'()
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 5859
    new $P4, [ 'CallExpr' ]
.annotate 'line', 5860
    new $P6, [ 'StringLiteral' ]
    $P6.'StringLiteral'(__ARG_2, __ARG_3)
    set $P5, $P6
    $P4.'CallExpr'(__ARG_1, __ARG_2, __ARG_3, $P5)
    set $P3, $P4
.annotate 'line', 5859
    .return($P3)
  __label_4: # case
.annotate 'line', 5863
    new $P8, [ 'NewIndexedExpr' ]
    $P8.'NewIndexedExpr'(__ARG_1, __ARG_2, __ARG_3)
    set $P7, $P8
    .return($P7)
  __label_5: # case
.annotate 'line', 5867
# var t2: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 5868
    __ARG_1.'unget'($P2)
.annotate 'line', 5869
    $P9 = $P2.'isop'('.')
    if_null $P9, __label_6
    unless $P9 goto __label_6
# {
.annotate 'line', 5871
    new $P11, [ 'NewQualifiedExpr' ]
    $P11.'NewQualifiedExpr'(__ARG_1, __ARG_2, $P1)
    set $P10, $P11
    .return($P10)
# }
  __label_6: # endif
  __label_2: # default
.annotate 'line', 5876
    new $P4, [ 'NewExpr' ]
    $P4.'NewExpr'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P3, $P4
    .return($P3)
  __label_1: # switch end
# }
.annotate 'line', 5878

.end # parseNew

.namespace [ 'OpInstanceOfExpr' ]

.sub 'OpInstanceOfExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 5889
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5890
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 5891
.const 'Sub' $P3 = 'WSubId_49'
    $P2 = $P3(__ARG_4, self)
    setattribute self, 'checked', $P2
# }
.annotate 'line', 5892

.end # OpInstanceOfExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5895
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 5896
    .return(self)
# }
.annotate 'line', 5897

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5898
    .return('I')
# }

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5901
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5902
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 5903
    eq $S1, 'P', __label_2
.const 'Sub' $P4 = 'WSubId_1'
.annotate 'line', 5904
    getattribute $P3, $P1, 'start'
    $P4('Invalid instanceof left operand', $P3)
  __label_2: # endif
.annotate 'line', 5905
# var checked: $P2
    getattribute $P2, self, 'checked'
.annotate 'line', 5907
# r: $S2
    set $S4, __ARG_2
    ne $S4, '', __label_4
    $P3 = self.'tempreg'('I')
    goto __label_3
  __label_4:
    set $P3, __ARG_2
  __label_3:
    null $S2
    if_null $P3, __label_5
    set $S2, $P3
  __label_5:
.annotate 'line', 5908
# check: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_6
    set $S3, $P3
  __label_6:
.annotate 'line', 5909
    self.'annotate'(__ARG_1)
.annotate 'line', 5910
    __ARG_1.'print'('    isa ', $S2, ', ', $S3, ', ')
.annotate 'line', 5911
    getattribute $P3, self, 'owner'
    $P2.'emit'(__ARG_1, $P3)
.annotate 'line', 5912
    __ARG_1.'say'()
# }
.annotate 'line', 5913

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpInstanceOfExpr' ]
.annotate 'line', 5882
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5884
    addattribute $P0, 'lexpr'
.annotate 'line', 5885
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
.annotate 'line', 5930
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5931
    new $P3, [ 'Condition' ]
    $P2 = $P3.'set'(__ARG_3)
    setattribute self, 'condition', $P2
.annotate 'line', 5932
    setattribute self, 'etrue', __ARG_4
.annotate 'line', 5933
    setattribute self, 'efalse', __ARG_5
.annotate 'line', 5934
    .return(self)
# }
.annotate 'line', 5935

.end # OpConditionalExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5938
    getattribute $P3, self, 'condition'
    $P2 = $P3.'optimize'()
    setattribute self, 'condition', $P2
# switch
.annotate 'line', 5939
    getattribute $P2, self, 'condition'
    $P1 = $P2.'getvalue'()
    set $I1, $P1
    set $I2, 1
    if $I1 == $I2 goto __label_3
    set $I2, 2
    if $I1 == $I2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 5941
    getattribute $P3, self, 'etrue'
    .tailcall $P3.'optimize'()
  __label_4: # case
.annotate 'line', 5943
    getattribute $P4, self, 'efalse'
    .tailcall $P4.'optimize'()
  __label_2: # default
.annotate 'line', 5945
    getattribute $P7, self, 'etrue'
    $P6 = $P7.'optimize'()
    setattribute self, 'etrue', $P6
.annotate 'line', 5946
    getattribute $P10, self, 'efalse'
    $P9 = $P10.'optimize'()
    setattribute self, 'efalse', $P9
.annotate 'line', 5947
    .return(self)
  __label_1: # switch end
# }
.annotate 'line', 5949

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5952
# var etrue: $P1
    getattribute $P1, self, 'etrue'
.annotate 'line', 5953
    $P2 = $P1.'isnull'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 5954
    getattribute $P3, self, 'efalse'
    .tailcall $P3.'checkresult'()
    goto __label_2
  __label_1: # else
.annotate 'line', 5956
    .tailcall $P1.'checkresult'()
  __label_2: # endif
# }
.annotate 'line', 5957

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5960
# cond_end: $S1
    getattribute $P4, self, 'owner'
    $P3 = $P4.'genlabel'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 5961
# cond_false: $S2
    getattribute $P4, self, 'owner'
    $P3 = $P4.'genlabel'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 5962
    getattribute $P3, self, 'condition'
    $P3.'emit_else'(__ARG_1, $S2)
.annotate 'line', 5963
# var etrue: $P1
    getattribute $P1, self, 'etrue'
.annotate 'line', 5964
# tres: $S3
    $P3 = self.'checkresult'()
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 5965
    $P3 = $P1.'isnull'()
    if_null $P3, __label_4
    unless $P3 goto __label_4
.annotate 'line', 5966
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_5
  __label_4: # else
.annotate 'line', 5968
    $P1.'emit'(__ARG_1, __ARG_2)
  __label_5: # endif
.annotate 'line', 5969
    __ARG_1.'emitgoto'($S1)
.annotate 'line', 5970
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 5971
# var efalse: $P2
    getattribute $P2, self, 'efalse'
.annotate 'line', 5972
    $P3 = $P2.'isnull'()
    if_null $P3, __label_6
    unless $P3 goto __label_6
.annotate 'line', 5973
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_7
  __label_6: # else
# {
.annotate 'line', 5975
# tfalse: $S4
    $P4 = $P2.'checkresult'()
    null $S4
    if_null $P4, __label_8
    set $S4, $P4
  __label_8:
.annotate 'line', 5976
    iseq $I1, $S3, 'P'
    unless $I1 goto __label_11
    isne $I1, $S4, 'P'
  __label_11:
    unless $I1 goto __label_9
# {
.annotate 'line', 5977
# r: $S5
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S5
    if_null $P3, __label_12
    set $S5, $P3
  __label_12:
.annotate 'line', 5978
    __ARG_1.'emitbox'(__ARG_2, $S5)
# }
    goto __label_10
  __label_9: # else
.annotate 'line', 5981
    $P2.'emit'(__ARG_1, __ARG_2)
  __label_10: # endif
# }
  __label_7: # endif
.annotate 'line', 5983
    __ARG_1.'emitlabel'($S1)
# }
.annotate 'line', 5984

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpConditionalExpr' ]
.annotate 'line', 5918
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5924
    addattribute $P0, 'condition'
.annotate 'line', 5925
    addattribute $P0, 'etrue'
.annotate 'line', 5926
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

.sub 'getOpCode_2' :subid('WSubId_58')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6028
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    set $S2, '('
    if $S1 == $S2 goto __label_3
    set $S2, '['
    if $S1 == $S2 goto __label_4
    set $S2, '.'
    if $S1 == $S2 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 6029
    .return(1)
  __label_4: # case
.annotate 'line', 6030
    .return(2)
  __label_5: # case
.annotate 'line', 6031
    .return(3)
  __label_2: # default
.annotate 'line', 6032
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6034

.end # getOpCode_2


.sub 'getOpCode_4' :subid('WSubId_60')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6038
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    set $S2, '-'
    if $S1 == $S2 goto __label_3
    set $S2, '!'
    if $S1 == $S2 goto __label_4
    set $S2, '++'
    if $S1 == $S2 goto __label_5
    set $S2, '--'
    if $S1 == $S2 goto __label_6
    goto __label_2
  __label_3: # case
.annotate 'line', 6039
    .return(8)
  __label_4: # case
.annotate 'line', 6040
    .return(11)
  __label_5: # case
.annotate 'line', 6041
    .return(9)
  __label_6: # case
.annotate 'line', 6042
    .return(10)
  __label_2: # default
.annotate 'line', 6044
    $P2 = __ARG_1.'iskeyword'('delete')
    if_null $P2, __label_7
    unless $P2 goto __label_7
    .return(31)
    goto __label_8
  __label_7: # else
.annotate 'line', 6045
    $P3 = __ARG_1.'iskeyword'('exists')
    if_null $P3, __label_9
    unless $P3 goto __label_9
    .return(32)
    goto __label_10
  __label_9: # else
.annotate 'line', 6046
    .return(0)
  __label_10: # endif
  __label_8: # endif
  __label_1: # switch end
# }
.annotate 'line', 6048

.end # getOpCode_4


.sub 'getOpCode_5' :subid('WSubId_63')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6052
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    set $S2, '*'
    if $S1 == $S2 goto __label_3
    set $S2, '/'
    if $S1 == $S2 goto __label_4
    set $S2, '%'
    if $S1 == $S2 goto __label_5
    set $S2, '%%'
    if $S1 == $S2 goto __label_6
    goto __label_2
  __label_3: # case
.annotate 'line', 6053
    .return(19)
  __label_4: # case
.annotate 'line', 6054
    .return(20)
  __label_5: # case
.annotate 'line', 6055
    .return(21)
  __label_6: # case
.annotate 'line', 6056
    .return(22)
  __label_2: # default
.annotate 'line', 6057
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6059

.end # getOpCode_5


.sub 'getOpCode_7' :subid('WSubId_66')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6063
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    set $S2, '<<'
    if $S1 == $S2 goto __label_3
    set $S2, '>>'
    if $S1 == $S2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6064
    .return(28)
  __label_4: # case
.annotate 'line', 6065
    .return(29)
  __label_2: # default
.annotate 'line', 6066
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6068

.end # getOpCode_7


.sub 'getOpCode_8' :subid('WSubId_68')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6072
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    set $S2, '<'
    if $S1 == $S2 goto __label_3
    set $S2, '>'
    if $S1 == $S2 goto __label_4
    set $S2, '<='
    if $S1 == $S2 goto __label_5
    set $S2, '>='
    if $S1 == $S2 goto __label_6
    goto __label_2
  __label_3: # case
.annotate 'line', 6073
    .return(14)
  __label_4: # case
.annotate 'line', 6074
    .return(16)
  __label_5: # case
.annotate 'line', 6075
    .return(15)
  __label_6: # case
.annotate 'line', 6076
    .return(17)
  __label_2: # default
.annotate 'line', 6078
    $P2 = __ARG_1.'iskeyword'('instanceof')
    if_null $P2, __label_7
    unless $P2 goto __label_7
    .return(27)
    goto __label_8
  __label_7: # else
.annotate 'line', 6079
    .return(0)
  __label_8: # endif
  __label_1: # switch end
# }
.annotate 'line', 6081

.end # getOpCode_8


.sub 'getOpCode_9' :subid('WSubId_70')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6085
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    set $S2, '=='
    if $S1 == $S2 goto __label_3
    set $S2, '!='
    if $S1 == $S2 goto __label_4
    set $S2, '==='
    if $S1 == $S2 goto __label_5
    set $S2, '!=='
    if $S1 == $S2 goto __label_6
    goto __label_2
  __label_3: # case
.annotate 'line', 6086
    .return(12)
  __label_4: # case
.annotate 'line', 6087
    .return(13)
  __label_5: # case
.annotate 'line', 6088
    .return(25)
  __label_6: # case
.annotate 'line', 6089
    .return(26)
  __label_2: # default
.annotate 'line', 6090
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6092

.end # getOpCode_9


.sub 'getOpCode_16' :subid('WSubId_79')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6096
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    set $S2, '='
    if $S1 == $S2 goto __label_3
    set $S2, '=:'
    if $S1 == $S2 goto __label_4
    set $S2, '+='
    if $S1 == $S2 goto __label_5
    set $S2, '-='
    if $S1 == $S2 goto __label_6
    set $S2, '*='
    if $S1 == $S2 goto __label_7
    set $S2, '/='
    if $S1 == $S2 goto __label_8
    set $S2, '%='
    if $S1 == $S2 goto __label_9
    goto __label_2
  __label_3: # case
.annotate 'line', 6097
    .return(4)
  __label_4: # case
.annotate 'line', 6098
    .return(5)
  __label_5: # case
.annotate 'line', 6099
    .return(6)
  __label_6: # case
.annotate 'line', 6100
    .return(18)
  __label_7: # case
.annotate 'line', 6101
    .return(23)
  __label_8: # case
.annotate 'line', 6102
    .return(24)
  __label_9: # case
.annotate 'line', 6103
    .return(30)
  __label_2: # default
.annotate 'line', 6104
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6106

.end # getOpCode_16


.sub 'parseExpr_0' :subid('WSubId_57')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6110
.const 'Sub' $P3 = 'parseExpr'
.annotate 'line', 6112
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 6113
# var expr: $P2
    null $P2
# switch-case
.annotate 'line', 6116
    $I1 = $P1.'isop'('(')
    if $I1 goto __label_3
.annotate 'line', 6120
    $I1 = $P1.'isop'('[')
    if $I1 goto __label_4
.annotate 'line', 6122
    $I1 = $P1.'isop'('{')
    if $I1 goto __label_5
.annotate 'line', 6124
    $I1 = $P1.'isstring'()
    if $I1 goto __label_6
.annotate 'line', 6126
    $I1 = $P1.'isint'()
    if $I1 goto __label_7
.annotate 'line', 6128
    $I1 = $P1.'isfloat'()
    if $I1 goto __label_8
.annotate 'line', 6130
    $I1 = $P1.'iskeyword'('new')
    if $I1 goto __label_9
.annotate 'line', 6132
    $I1 = $P1.'iskeyword'('function')
    if $I1 goto __label_10
.annotate 'line', 6134
    $I1 = $P1.'iskeyword'('class')
    if $I1 goto __label_11
.annotate 'line', 6136
    $I1 = $P1.'isidentifier'()
    if $I1 goto __label_12
    goto __label_2
  __label_3: # case
.annotate 'line', 6117
.const 'Sub' $P4 = 'WSubId_30'
    $P2 = $P4(__ARG_1, __ARG_2)
.const 'Sub' $P5 = 'WSubId_43'
.annotate 'line', 6118
    $P5(')', __ARG_1)
.annotate 'line', 6119
    .return($P2)
  __label_4: # case
.annotate 'line', 6121
    new $P7, [ 'ArrayExpr' ]
    $P7.'ArrayExpr'(__ARG_1, __ARG_2, $P1)
    set $P6, $P7
    .return($P6)
  __label_5: # case
.annotate 'line', 6123
    new $P9, [ 'HashExpr' ]
    $P9.'HashExpr'(__ARG_1, __ARG_2, $P1)
    set $P8, $P9
    .return($P8)
  __label_6: # case
.annotate 'line', 6125
    new $P11, [ 'StringLiteral' ]
    $P11.'StringLiteral'(__ARG_2, $P1)
    set $P10, $P11
    .return($P10)
  __label_7: # case
.annotate 'line', 6127
    new $P13, [ 'IntegerLiteral' ]
    $P13.'IntegerLiteral'(__ARG_2, $P1)
    set $P12, $P13
    .return($P12)
  __label_8: # case
.annotate 'line', 6129
    new $P15, [ 'FloatLiteral' ]
    $P15.'FloatLiteral'(__ARG_2, $P1)
    set $P14, $P15
    .return($P14)
  __label_9: # case
.annotate 'line', 6131
.const 'Sub' $P16 = 'WSubId_56'
    .tailcall $P16(__ARG_1, __ARG_2, $P1)
  __label_10: # case
.annotate 'line', 6133
    new $P18, [ 'FunctionExpr' ]
    $P18.'FunctionExpr'(__ARG_1, __ARG_2, $P1)
    set $P17, $P18
    .return($P17)
  __label_11: # case
.annotate 'line', 6135
    new $P20, [ 'OpClassExpr' ]
    $P20.'OpClassExpr'(__ARG_1, __ARG_2, $P1)
    set $P19, $P20
    .return($P19)
  __label_12: # case
.annotate 'line', 6137
    new $P22, [ 'IdentifierExpr' ]
    $P22.'IdentifierExpr'(__ARG_2, $P1)
    set $P21, $P22
    .return($P21)
  __label_2: # default
.const 'Sub' $P23 = 'WSubId_29'
.annotate 'line', 6139
    $P23('expression', $P1)
  __label_1: # switch end
# }
.annotate 'line', 6141

.end # parseExpr_0


.sub 'parseExpr_2' :subid('WSubId_59')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6145
.const 'Sub' $P5 = 'parseExpr_0'
.const 'Sub' $P6 = 'getOpCode_2'
.annotate 'line', 6147
# var subexp: $P1
.const 'Sub' $P7 = 'WSubId_57'
    $P1 = $P7(__ARG_1, __ARG_2)
.annotate 'line', 6148
# var t: $P2
    null $P2
.annotate 'line', 6149
# var start: $P3
    null $P3
.annotate 'line', 6150
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6151
.const 'Sub' $P9 = 'WSubId_58'
    $P2 = __ARG_1.'get'()
    $P8 = $P9($P2)
    set $I1, $P8
    eq $I1, 0, __label_1
# {
# switch
.annotate 'line', 6152
    set $I2, $I1
    set $I3, 1
    if $I2 == $I3 goto __label_5
    set $I3, 2
    if $I2 == $I3 goto __label_6
    set $I3, 3
    if $I2 == $I3 goto __label_7
    goto __label_4
  __label_5: # case
.annotate 'line', 6154
    new $P10, [ 'CallExpr' ]
    $P10.'CallExpr'(__ARG_1, __ARG_2, $P2, $P1)
    set $P1, $P10
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6157
    new $P11, [ 'IndexExpr' ]
    $P11.'IndexExpr'(__ARG_1, __ARG_2, $P2, $P1)
    set $P1, $P11
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6160
    set $P3, $P2
.annotate 'line', 6161
    $P2 = __ARG_1.'get'()
.annotate 'line', 6162
    $P12 = $P2.'isop'('*')
    if_null $P12, __label_8
    unless $P12 goto __label_8
# {
.annotate 'line', 6163
# var right: $P4
.const 'Sub' $P13 = 'WSubId_57'
    $P4 = $P13(__ARG_1, __ARG_2)
.annotate 'line', 6164
    new $P8, [ 'MemberRefExpr' ]
    $P8.'MemberRefExpr'(__ARG_2, $P2, $P1, $P4)
    set $P1, $P8
# }
    goto __label_9
  __label_8: # else
.annotate 'line', 6167
    new $P8, [ 'MemberExpr' ]
    $P8.'MemberExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P8
  __label_9: # endif
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6168
.const 'Sub' $P14 = 'WSubId_6'
.annotate 'line', 6170
    $P14('Unexpected code in parseExpr_2')
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6173
    __ARG_1.'unget'($P2)
.annotate 'line', 6174
    .return($P1)
# }
.annotate 'line', 6175

.end # parseExpr_2


.sub 'parseExpr_3' :subid('WSubId_62')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6179
.const 'Sub' $P3 = 'parseExpr_2'
.annotate 'line', 6181
# var subexp: $P1
.const 'Sub' $P4 = 'WSubId_59'
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6182
# var t: $P2
    $P2 = __ARG_1.'get'()
# switch-case
.annotate 'line', 6184
    $I1 = $P2.'isop'('++')
    if $I1 goto __label_3
.annotate 'line', 6186
    $I1 = $P2.'isop'('--')
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6185
    new $P6, [ 'OpPostIncExpr' ]
    $P6.'OpPostIncExpr'(__ARG_2, $P2, $P1)
    set $P5, $P6
    .return($P5)
  __label_4: # case
.annotate 'line', 6187
    new $P8, [ 'OpPostDecExpr' ]
    $P8.'OpPostDecExpr'(__ARG_2, $P2, $P1)
    set $P7, $P8
    .return($P7)
  __label_2: # default
.annotate 'line', 6189
    __ARG_1.'unget'($P2)
.annotate 'line', 6190
    .return($P1)
  __label_1: # switch end
# }
.annotate 'line', 6192

.end # parseExpr_3


.sub 'parseExpr_4' :subid('WSubId_61')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6196
.const 'Sub' $P3 = 'parseExpr_4'
.const 'Sub' $P4 = 'parseExpr_3'
.const 'Sub' $P5 = 'getOpCode_4'
.annotate 'line', 6198
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 6199
# code: $I1
.const 'Sub' $P7 = 'WSubId_60'
    $P6 = $P7($P1)
    set $I1, $P6
.annotate 'line', 6200
    eq $I1, 0, __label_1
# {
.annotate 'line', 6201
# var subexpr: $P2
.const 'Sub' $P8 = 'WSubId_61'
    $P2 = $P8(__ARG_1, __ARG_2)
# switch
.annotate 'line', 6202
    set $I2, $I1
    set $I3, 8
    if $I2 == $I3 goto __label_5
    set $I3, 11
    if $I2 == $I3 goto __label_6
    set $I3, 9
    if $I2 == $I3 goto __label_7
    set $I3, 10
    if $I2 == $I3 goto __label_8
    set $I3, 31
    if $I2 == $I3 goto __label_9
    set $I3, 32
    if $I2 == $I3 goto __label_10
    goto __label_4
  __label_5: # case
.annotate 'line', 6204
    new $P9, [ 'OpUnaryMinusExpr' ]
    $P9.'OpUnaryMinusExpr'(__ARG_2, $P1, $P2)
    set $P6, $P9
    .return($P6)
  __label_6: # case
.annotate 'line', 6206
    new $P11, [ 'OpNotExpr' ]
    $P11.'OpNotExpr'(__ARG_2, $P1, $P2)
    set $P10, $P11
    .return($P10)
  __label_7: # case
.annotate 'line', 6208
    new $P13, [ 'OpPreIncExpr' ]
    $P13.'OpPreIncExpr'(__ARG_2, $P1, $P2)
    set $P12, $P13
    .return($P12)
  __label_8: # case
.annotate 'line', 6210
    new $P15, [ 'OpPreDecExpr' ]
    $P15.'OpPreDecExpr'(__ARG_2, $P1, $P2)
    set $P14, $P15
    .return($P14)
  __label_9: # case
.annotate 'line', 6212
    new $P17, [ 'OpDeleteExpr' ]
    $P17.'OpDeleteExpr'(__ARG_2, $P1, $P2)
    set $P16, $P17
    .return($P16)
  __label_10: # case
.annotate 'line', 6214
    new $P19, [ 'OpExistsExpr' ]
    $P19.'OpExistsExpr'(__ARG_2, $P1, $P2)
    set $P18, $P19
    .return($P18)
  __label_4: # default
.const 'Sub' $P20 = 'WSubId_6'
.annotate 'line', 6216
    $P20('Invalid code in parseExpr_4', $P1)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 6220
    __ARG_1.'unget'($P1)
.annotate 'line', 6221
.const 'Sub' $P21 = 'WSubId_62'
    .tailcall $P21(__ARG_1, __ARG_2)
# }
  __label_2: # endif
# }
.annotate 'line', 6223

.end # parseExpr_4


.sub 'parseExpr_5' :subid('WSubId_64')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6227
.const 'Sub' $P4 = 'parseExpr_4'
.const 'Sub' $P5 = 'getOpCode_5'
.annotate 'line', 6229
# var lexpr: $P1
.const 'Sub' $P6 = 'WSubId_61'
    $P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 6230
# var t: $P2
    null $P2
.annotate 'line', 6231
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6232
.const 'Sub' $P8 = 'WSubId_63'
    $P2 = __ARG_1.'get'()
    $P7 = $P8($P2)
    set $I1, $P7
    eq $I1, 0, __label_1
# {
.annotate 'line', 6233
# var rexpr: $P3
.const 'Sub' $P9 = 'WSubId_61'
    $P3 = $P9(__ARG_1, __ARG_2)
# switch
.annotate 'line', 6234
    set $I2, $I1
    set $I3, 19
    if $I2 == $I3 goto __label_5
    set $I3, 20
    if $I2 == $I3 goto __label_6
    set $I3, 21
    if $I2 == $I3 goto __label_7
    set $I3, 22
    if $I2 == $I3 goto __label_8
    goto __label_4
  __label_5: # case
.annotate 'line', 6236
    new $P7, [ 'OpMulExpr' ]
    $P7.'OpMulExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P7
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6239
    new $P10, [ 'OpDivExpr' ]
    $P10.'OpDivExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P10
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6242
    new $P11, [ 'OpModExpr' ]
    $P11.'OpModExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P11
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 6245
    new $P12, [ 'OpCModExpr' ]
    $P12.'OpCModExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P12
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6246
.const 'Sub' $P13 = 'WSubId_6'
.annotate 'line', 6248
    $P13('Invalid code in parseExpr_5', $P2)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6251
    __ARG_1.'unget'($P2)
.annotate 'line', 6252
    .return($P1)
# }
.annotate 'line', 6253

.end # parseExpr_5


.sub 'parseExpr_6' :subid('WSubId_65')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6257
.const 'Sub' $P5 = 'parseExpr_5'
.annotate 'line', 6259
# var lexpr: $P1
.const 'Sub' $P6 = 'WSubId_64'
    $P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 6260
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6261
    $P2 = __ARG_1.'get'()
    $I1 = $P2.'isop'('+')
    if $I1 goto __label_3
    $I1 = $P2.'isop'('-')
  __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 6262
# var rexpr: $P3
.const 'Sub' $P7 = 'WSubId_64'
    $P3 = $P7(__ARG_1, __ARG_2)
.annotate 'line', 6263
# var expr: $P4
    null $P4
.annotate 'line', 6264
    $P8 = $P2.'isop'('+')
    if_null $P8, __label_4
    unless $P8 goto __label_4
.annotate 'line', 6265
    new $P9, [ 'OpAddExpr' ]
    $P9.'OpAddExpr'(__ARG_2, $P2, $P1, $P3)
    set $P4, $P9
    goto __label_5
  __label_4: # else
.annotate 'line', 6267
    new $P10, [ 'OpSubExpr' ]
    $P10.'OpSubExpr'(__ARG_2, $P2, $P1, $P3)
    set $P4, $P10
  __label_5: # endif
.annotate 'line', 6268
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6270
    __ARG_1.'unget'($P2)
.annotate 'line', 6271
    .return($P1)
# }
.annotate 'line', 6272

.end # parseExpr_6


.sub 'parseExpr_7' :subid('WSubId_67')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6276
.const 'Sub' $P4 = 'parseExpr_6'
.annotate 'line', 6278
# var lexpr: $P1
.const 'Sub' $P5 = 'WSubId_65'
    $P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6279
# var rexpr: $P2
    null $P2
.annotate 'line', 6280
# var t: $P3
    null $P3
.annotate 'line', 6281
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6282
.const 'Sub' $P7 = 'WSubId_66'
    $P3 = __ARG_1.'get'()
    $P6 = $P7($P3)
    set $I1, $P6
    eq $I1, 0, __label_1
# {
# switch
.annotate 'line', 6283
    set $I2, $I1
    set $I3, 28
    if $I2 == $I3 goto __label_5
    set $I3, 29
    if $I2 == $I3 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 6285
.const 'Sub' $P8 = 'WSubId_65'
    $P2 = $P8(__ARG_1, __ARG_2)
.annotate 'line', 6286
    new $P9, [ 'OpShiftleftExpr' ]
    $P9.'OpShiftleftExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P9
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6289
.const 'Sub' $P10 = 'WSubId_65'
    $P2 = $P10(__ARG_1, __ARG_2)
.annotate 'line', 6290
    new $P11, [ 'OpShiftrightExpr' ]
    $P11.'OpShiftrightExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P11
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6291
.const 'Sub' $P12 = 'WSubId_6'
.annotate 'line', 6293
    $P12('Invalid code in parseExpr_7', $P3)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6296
    __ARG_1.'unget'($P3)
.annotate 'line', 6297
    .return($P1)
# }
.annotate 'line', 6298

.end # parseExpr_7


.sub 'parseExpr_8' :subid('WSubId_69')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6302
.const 'Sub' $P4 = 'parseExpr_7'
.const 'Sub' $P5 = 'getOpCode_8'
.annotate 'line', 6304
# var lexpr: $P1
.const 'Sub' $P6 = 'WSubId_67'
    $P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 6305
# var rexpr: $P2
    null $P2
.annotate 'line', 6306
# var t: $P3
    null $P3
.annotate 'line', 6307
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6308
.const 'Sub' $P8 = 'WSubId_68'
    $P3 = __ARG_1.'get'()
    $P7 = $P8($P3)
    set $I1, $P7
    eq $I1, 0, __label_1
# {
# switch
.annotate 'line', 6309
    set $I2, $I1
    set $I3, 14
    if $I2 == $I3 goto __label_5
    set $I3, 16
    if $I2 == $I3 goto __label_6
    set $I3, 15
    if $I2 == $I3 goto __label_7
    set $I3, 17
    if $I2 == $I3 goto __label_8
    set $I3, 27
    if $I2 == $I3 goto __label_9
    goto __label_4
  __label_5: # case
.annotate 'line', 6311
.const 'Sub' $P9 = 'WSubId_67'
    $P2 = $P9(__ARG_1, __ARG_2)
.annotate 'line', 6312
    new $P10, [ 'OpLessExpr' ]
    $P1 = $P10.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6315
.const 'Sub' $P11 = 'WSubId_67'
    $P2 = $P11(__ARG_1, __ARG_2)
.annotate 'line', 6316
    new $P12, [ 'OpGreaterExpr' ]
    $P1 = $P12.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6319
.const 'Sub' $P13 = 'WSubId_67'
    $P2 = $P13(__ARG_1, __ARG_2)
.annotate 'line', 6320
    new $P14, [ 'OpLessEqualExpr' ]
    $P1 = $P14.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 6323
.const 'Sub' $P15 = 'WSubId_67'
    $P2 = $P15(__ARG_1, __ARG_2)
.annotate 'line', 6324
    new $P16, [ 'OpGreaterEqualExpr' ]
    $P1 = $P16.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_9: # case
.annotate 'line', 6327
    new $P17, [ 'OpInstanceOfExpr' ]
    $P17.'OpInstanceOfExpr'(__ARG_2, $P3, $P1, __ARG_1)
    set $P1, $P17
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6328
.const 'Sub' $P18 = 'WSubId_6'
.annotate 'line', 6330
    $P18('Invalid code in parseExpr_9', $P3)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6333
    __ARG_1.'unget'($P3)
.annotate 'line', 6334
    .return($P1)
# }
.annotate 'line', 6335

.end # parseExpr_8


.sub 'parseExpr_9' :subid('WSubId_71')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6339
.const 'Sub' $P4 = 'parseExpr_8'
.const 'Sub' $P5 = 'getOpCode_9'
.annotate 'line', 6341
# var lexpr: $P1
.const 'Sub' $P6 = 'WSubId_69'
    $P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 6342
# var rexpr: $P2
    null $P2
.annotate 'line', 6343
# var t: $P3
    null $P3
.annotate 'line', 6344
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6345
.const 'Sub' $P8 = 'WSubId_70'
    $P3 = __ARG_1.'get'()
    $P7 = $P8($P3)
    set $I1, $P7
    eq $I1, 0, __label_1
# {
# switch
.annotate 'line', 6346
    set $I2, $I1
    set $I3, 12
    if $I2 == $I3 goto __label_5
    set $I3, 13
    if $I2 == $I3 goto __label_6
    set $I3, 25
    if $I2 == $I3 goto __label_7
    set $I3, 26
    if $I2 == $I3 goto __label_8
    goto __label_4
  __label_5: # case
.annotate 'line', 6348
.const 'Sub' $P9 = 'WSubId_69'
    $P2 = $P9(__ARG_1, __ARG_2)
.annotate 'line', 6349
    new $P10, [ 'OpEqualExpr' ]
    $P1 = $P10.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6352
.const 'Sub' $P11 = 'WSubId_69'
    $P2 = $P11(__ARG_1, __ARG_2)
.annotate 'line', 6353
    new $P12, [ 'OpNotEqualExpr' ]
    $P1 = $P12.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6356
.const 'Sub' $P13 = 'WSubId_69'
    $P2 = $P13(__ARG_1, __ARG_2)
.annotate 'line', 6357
    new $P14, [ 'OpSameExpr' ]
    $P14.'OpSameExpr'(1, __ARG_2, $P3, $P1, $P2)
    set $P1, $P14
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 6360
.const 'Sub' $P15 = 'WSubId_69'
    $P2 = $P15(__ARG_1, __ARG_2)
.annotate 'line', 6361
    new $P16, [ 'OpSameExpr' ]
    $P16.'OpSameExpr'(0, __ARG_2, $P3, $P1, $P2)
    set $P1, $P16
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6362
.const 'Sub' $P17 = 'WSubId_6'
.annotate 'line', 6364
    $P17('Invalid code in parseExpr_8', $P3)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6367
    __ARG_1.'unget'($P3)
.annotate 'line', 6368
    .return($P1)
# }
.annotate 'line', 6369

.end # parseExpr_9


.sub 'parseExpr_10' :subid('WSubId_72')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6373
.const 'Sub' $P4 = 'parseExpr_9'
.annotate 'line', 6375
# var lexpr: $P1
.const 'Sub' $P5 = 'WSubId_71'
    $P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6376
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6377
    $P2 = __ARG_1.'get'()
    $P6 = $P2.'isop'('&')
    if_null $P6, __label_1
    unless $P6 goto __label_1
# {
.annotate 'line', 6378
# var rexpr: $P3
.const 'Sub' $P7 = 'WSubId_71'
    $P3 = $P7(__ARG_1, __ARG_2)
.annotate 'line', 6379
    new $P6, [ 'OpBinAndExpr' ]
    $P6.'OpBinAndExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P6
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6381
    __ARG_1.'unget'($P2)
.annotate 'line', 6382
    .return($P1)
# }
.annotate 'line', 6383

.end # parseExpr_10


.sub 'parseExpr_11' :subid('WSubId_73')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6387
.const 'Sub' $P4 = 'parseExpr_10'
.annotate 'line', 6389
# var lexpr: $P1
.const 'Sub' $P5 = 'WSubId_72'
    $P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6390
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6391
    $P2 = __ARG_1.'get'()
    $P6 = $P2.'isop'('^')
    if_null $P6, __label_1
    unless $P6 goto __label_1
# {
.annotate 'line', 6392
# var rexpr: $P3
.const 'Sub' $P7 = 'WSubId_72'
    $P3 = $P7(__ARG_1, __ARG_2)
.annotate 'line', 6393
    new $P6, [ 'OpBinXorExpr' ]
    $P6.'OpBinXorExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P6
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6395
    __ARG_1.'unget'($P2)
.annotate 'line', 6396
    .return($P1)
# }
.annotate 'line', 6397

.end # parseExpr_11


.sub 'parseExpr_12' :subid('WSubId_74')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6401
.const 'Sub' $P4 = 'parseExpr_11'
.annotate 'line', 6403
# var lexpr: $P1
.const 'Sub' $P5 = 'WSubId_73'
    $P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6404
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6405
    $P2 = __ARG_1.'get'()
    $P6 = $P2.'isop'('|')
    if_null $P6, __label_1
    unless $P6 goto __label_1
# {
.annotate 'line', 6406
# var rexpr: $P3
.const 'Sub' $P7 = 'WSubId_73'
    $P3 = $P7(__ARG_1, __ARG_2)
.annotate 'line', 6407
    new $P6, [ 'OpBinOrExpr' ]
    $P6.'OpBinOrExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P6
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6409
    __ARG_1.'unget'($P2)
.annotate 'line', 6410
    .return($P1)
# }
.annotate 'line', 6411

.end # parseExpr_12


.sub 'parseExpr_13' :subid('WSubId_75')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6415
.const 'Sub' $P4 = 'parseExpr_12'
.annotate 'line', 6417
# var lexpr: $P1
.const 'Sub' $P5 = 'WSubId_74'
    $P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6418
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6419
    $P2 = __ARG_1.'get'()
    $P6 = $P2.'isop'('&&')
    if_null $P6, __label_1
    unless $P6 goto __label_1
# {
.annotate 'line', 6420
# var rexpr: $P3
.const 'Sub' $P7 = 'WSubId_74'
    $P3 = $P7(__ARG_1, __ARG_2)
.annotate 'line', 6421
    new $P6, [ 'OpBoolAndExpr' ]
    $P6.'OpBoolAndExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P6
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6423
    __ARG_1.'unget'($P2)
.annotate 'line', 6424
    .return($P1)
# }
.annotate 'line', 6425

.end # parseExpr_13


.sub 'parseExpr_14' :subid('WSubId_76')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6429
.const 'Sub' $P4 = 'parseExpr_13'
.annotate 'line', 6431
# var lexpr: $P1
.const 'Sub' $P5 = 'WSubId_75'
    $P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6432
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6433
    $P2 = __ARG_1.'get'()
    $P6 = $P2.'isop'('||')
    if_null $P6, __label_1
    unless $P6 goto __label_1
# {
.annotate 'line', 6434
# var rexpr: $P3
.const 'Sub' $P7 = 'WSubId_74'
    $P3 = $P7(__ARG_1, __ARG_2)
.annotate 'line', 6435
    new $P6, [ 'OpBoolOrExpr' ]
    $P6.'OpBoolOrExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P6
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6437
    __ARG_1.'unget'($P2)
.annotate 'line', 6438
    .return($P1)
# }
.annotate 'line', 6439

.end # parseExpr_14


.sub 'parseExpr_15' :subid('WSubId_78')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6443
.const 'Sub' $P5 = 'parseExpr_16'
.const 'Sub' $P6 = 'parseExpr_14'
.annotate 'line', 6445
# var econd: $P1
.const 'Sub' $P7 = 'WSubId_76'
    $P1 = $P7(__ARG_1, __ARG_2)
.annotate 'line', 6446
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 6447
    $P8 = $P2.'isop'('?')
    if_null $P8, __label_1
    unless $P8 goto __label_1
# {
.annotate 'line', 6448
# var etrue: $P3
.const 'Sub' $P9 = 'WSubId_77'
    $P3 = $P9(__ARG_1, __ARG_2)
.const 'Sub' $P10 = 'WSubId_43'
.annotate 'line', 6449
    $P10(':', __ARG_1)
.annotate 'line', 6450
# var efalse: $P4
.const 'Sub' $P11 = 'WSubId_77'
    $P4 = $P11(__ARG_1, __ARG_2)
.annotate 'line', 6451
    new $P12, [ 'OpConditionalExpr' ]
    $P12.'OpConditionalExpr'(__ARG_2, $P2, $P1, $P3, $P4)
    set $P8, $P12
    .return($P8)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 6454
    __ARG_1.'unget'($P2)
.annotate 'line', 6455
    .return($P1)
# }
  __label_2: # endif
# }
.annotate 'line', 6457

.end # parseExpr_15


.sub 'parseExpr_16' :subid('WSubId_77')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6461
.const 'Sub' $P5 = 'parseExpr_16'
.const 'Sub' $P6 = 'parseExpr_15'
.const 'Sub' $P7 = 'getOpCode_16'
.annotate 'line', 6463
# var lexpr: $P1
.const 'Sub' $P8 = 'WSubId_78'
    $P1 = $P8(__ARG_1, __ARG_2)
.annotate 'line', 6464
# var t: $P2
    null $P2
.annotate 'line', 6465
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6466
.const 'Sub' $P10 = 'WSubId_79'
    $P2 = __ARG_1.'get'()
    $P9 = $P10($P2)
    set $I1, $P9
    eq $I1, 0, __label_1
# {
.annotate 'line', 6467
# var rexpr: $P3
.const 'Sub' $P11 = 'WSubId_77'
    $P3 = $P11(__ARG_1, __ARG_2)
.annotate 'line', 6468
# var expr: $P4
    null $P4
# switch
.annotate 'line', 6469
    set $I2, $I1
    set $I3, 4
    if $I2 == $I3 goto __label_5
    set $I3, 5
    if $I2 == $I3 goto __label_6
    set $I3, 6
    if $I2 == $I3 goto __label_7
    set $I3, 18
    if $I2 == $I3 goto __label_8
    set $I3, 23
    if $I2 == $I3 goto __label_9
    set $I3, 24
    if $I2 == $I3 goto __label_10
    set $I3, 30
    if $I2 == $I3 goto __label_11
    goto __label_4
  __label_5: # case
.annotate 'line', 6471
    new $P4, [ 'OpAssignExpr' ]
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6474
    new $P4, [ 'OpAssignToExpr' ]
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6477
    new $P4, [ 'OpAddToExpr' ]
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 6480
    new $P4, [ 'OpSubToExpr' ]
    goto __label_3 # break
  __label_9: # case
.annotate 'line', 6483
    new $P4, [ 'OpMulToExpr' ]
    goto __label_3 # break
  __label_10: # case
.annotate 'line', 6486
    new $P4, [ 'OpDivToExpr' ]
    goto __label_3 # break
  __label_11: # case
.annotate 'line', 6489
    new $P4, [ 'OpModToExpr' ]
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6490
.const 'Sub' $P12 = 'WSubId_6'
.annotate 'line', 6492
    $P12('Unexpected code in parseExpr_16', $P2)
  __label_3: # switch end
.annotate 'line', 6494
    $P4.'set'(__ARG_2, $P2, $P1, $P3)
.annotate 'line', 6495
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6497
    __ARG_1.'unget'($P2)
.annotate 'line', 6498
    .return($P1)
# }
.annotate 'line', 6499

.end # parseExpr_16


.sub 'parseExpr' :subid('WSubId_30')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6503
.const 'Sub' $P1 = 'parseExpr_16'
.annotate 'line', 6505
.const 'Sub' $P2 = 'WSubId_77'
    .tailcall $P2(__ARG_1, __ARG_2)
# }
.annotate 'line', 6506

.end # parseExpr

.namespace [ 'Breakable' ]

.sub 'genbreaklabel' :method
# Body
# {
.annotate 'line', 6521
    getattribute $P1, self, 'brlabel'
    if_null $P1, __label_1
.const 'Sub' $P2 = 'WSubId_6'
.annotate 'line', 6522
    $P2('attempt to generate break label twice')
  __label_1: # endif
.annotate 'line', 6523
# label: $S1
    $P1 = self.'genlabel'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 6524
    box $P1, $S1
    setattribute self, 'brlabel', $P1
.annotate 'line', 6525
    .return($S1)
# }
.annotate 'line', 6526

.end # genbreaklabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6529
# var label: $P1
    getattribute $P1, self, 'brlabel'
.annotate 'line', 6530
    unless_null $P1, __label_1
.const 'Sub' $P2 = 'WSubId_6'
.annotate 'line', 6531
    $P2('attempt to get break label before creating it')
  __label_1: # endif
.annotate 'line', 6532
    .return($P1)
# }
.annotate 'line', 6533

.end # getbreaklabel

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Breakable' ]
.annotate 'line', 6517
    addattribute $P0, 'brlabel'
.end
.namespace [ 'Continuable' ]

.sub 'gencontinuelabel' :method
# Body
# {
.annotate 'line', 6542
    getattribute $P1, self, 'cntlabel'
    if_null $P1, __label_1
.const 'Sub' $P2 = 'WSubId_6'
.annotate 'line', 6543
    $P2('attempt to generate continue label twice')
  __label_1: # endif
.annotate 'line', 6544
# label: $S1
    $P1 = self.'genlabel'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 6545
    box $P1, $S1
    setattribute self, 'cntlabel', $P1
.annotate 'line', 6546
    .return($S1)
# }
.annotate 'line', 6547

.end # gencontinuelabel


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6550
# var label: $P1
    getattribute $P1, self, 'cntlabel'
.annotate 'line', 6551
    unless_null $P1, __label_1
.const 'Sub' $P2 = 'WSubId_6'
.annotate 'line', 6552
    $P2('attempt to get continue label before creating it')
  __label_1: # endif
.annotate 'line', 6553
    .return($P1)
# }
.annotate 'line', 6554

.end # getcontinuelabel

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Continuable' ]
.annotate 'line', 6536
    get_class $P1, [ 'Breakable' ]
    addparent $P0, $P1
.annotate 'line', 6538
    addattribute $P0, 'cntlabel'
.end
.namespace [ 'ReturnYieldStatement' ]

.sub 'parse' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6570
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6571
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6572
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 6573
    __ARG_2.'unget'($P1)
.annotate 'line', 6574
    new $P4, [ 'ArgumentList' ]
    $P4.'ArgumentList'(__ARG_3, __ARG_1, __ARG_2, ";")
    set $P3, $P4
    setattribute self, 'values', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 6576

.end # parse


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6579
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 6580
    if_null $P1, __label_1
.annotate 'line', 6581
    $P1 = $P1.'optimize'()
  __label_1: # endif
.annotate 'line', 6582
    .return(self)
# }
.annotate 'line', 6583

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6587
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 6588
# n: $I1
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
# predefined int
    $P3 = $P1.'numargs'()
    set $I1, $P3
  __label_1:
.annotate 'line', 6591
    iseq $I2, $I1, 1
    unless $I2 goto __label_4
    isa $I2, self, [ 'ReturnStatement' ]
  __label_4:
    unless $I2 goto __label_3
# {
.annotate 'line', 6592
# var func: $P2
    $P2 = $P1.'getfreearg'(0)
.annotate 'line', 6593
    $P3 = $P2.'cantailcall'()
    if_null $P3, __label_5
    unless $P3 goto __label_5
# {
.annotate 'line', 6594
    self.'annotate'(__ARG_1)
.annotate 'line', 6595
    .tailcall $P2.'emit'(__ARG_1, '.tailcall')
# }
  __label_5: # endif
# }
  __label_3: # endif
.annotate 'line', 6599
    le $I1, 0, __label_6
.annotate 'line', 6600
    $P1.'getargvalues'(__ARG_1)
  __label_6: # endif
.annotate 'line', 6602
    self.'annotate'(__ARG_1)
.annotate 'line', 6603
    self.'emitret'(__ARG_1)
.annotate 'line', 6604
    le $I1, 0, __label_7
.annotate 'line', 6605
    $P1.'emitargs'(__ARG_1)
  __label_7: # endif
.annotate 'line', 6606
    __ARG_1.'say'(')')
# }
.annotate 'line', 6607

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ReturnYieldStatement' ]
.annotate 'line', 6564
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 6566
    addattribute $P0, 'values'
.end
.namespace [ 'ReturnStatement' ]

.sub 'ReturnStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6614
    self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6615

.end # ReturnStatement


.sub 'emitret' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6618
    __ARG_1.'print'('    ', '.return(')
# }
.annotate 'line', 6619

.end # emitret

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ReturnStatement' ]
.annotate 'line', 6610
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
.annotate 'line', 6626
    self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6627

.end # YieldStatement


.sub 'emitret' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6630
    __ARG_1.'print'('    ', '.yield(')
# }
.annotate 'line', 6631

.end # emitret

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'YieldStatement' ]
.annotate 'line', 6622
    get_class $P1, [ 'ReturnYieldStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'LabelStatement' ]

.sub 'LabelStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6644
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 6645
    setattribute self, 'name', __ARG_1
.annotate 'line', 6646
    getattribute $P3, self, 'owner'
    $P2 = $P3.'createlabel'(__ARG_1)
    setattribute self, 'value', $P2
# }
.annotate 'line', 6647

.end # LabelStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6648
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6651
    self.'annotate'(__ARG_1)
.annotate 'line', 6652
    getattribute $P1, self, 'value'
# predefined string
    getattribute $P2, self, 'name'
    set $S1, $P2
    concat $S2, 'label ', $S1
    __ARG_1.'emitlabel'($P1, $S2)
# }
.annotate 'line', 6653

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'LabelStatement' ]
.annotate 'line', 6638
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 6640
    addattribute $P0, 'name'
.annotate 'line', 6641
    addattribute $P0, 'value'
.end
.namespace [ 'Reflabel' ]

.sub 'Reflabel' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 6667
    setattribute self, 'owner', __ARG_1
.annotate 'line', 6668
    box $P1, __ARG_2
    setattribute self, 'label', $P1
# }
.annotate 'line', 6669

.end # Reflabel


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6670
    .return(self)
# }

.end # optimize


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6673
# label: $S1
    getattribute $P1, self, 'label'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6674
# value: $S2
    getattribute $P2, self, 'owner'
    $P1 = $P2.'getlabel'($S1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 6675
    .return($S2)
# }
.annotate 'line', 6676

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Reflabel' ]
.annotate 'line', 6662
    addattribute $P0, 'owner'
.annotate 'line', 6663
    addattribute $P0, 'label'
.end
.namespace [ 'GotoStatement' ]

.sub 'GotoStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6689
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6690
# var t: $P1
    $P1 = __ARG_2.'get'()
.const 'Sub' $P2 = 'WSubId_80'
.annotate 'line', 6691
    $P2($P1)
.annotate 'line', 6692
    setattribute self, 'label', $P1
.const 'Sub' $P4 = 'WSubId_43'
.annotate 'line', 6693
    $P4(';', __ARG_2)
# }
.annotate 'line', 6694

.end # GotoStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6695
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6698
    self.'annotate'(__ARG_1)
.annotate 'line', 6699
# label: $S1
    getattribute $P1, self, 'label'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6700
# value: $S2
    $P1 = self.'getlabel'($S1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 6701
    concat $S3, 'goto ', $S1
    __ARG_1.'emitgoto'($S2, $S3)
# }
.annotate 'line', 6702

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'GotoStatement' ]
.annotate 'line', 6683
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 6685
    addattribute $P0, 'label'
.end
.namespace [ 'ConditionalStatement' ]

.sub 'parseconditionshort' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6713
.const 'Sub' $P2 = 'WSubId_30'
    $P1 = $P2(__ARG_1, self)
    self.'set'($P1)
# }
.annotate 'line', 6714

.end # parseconditionshort


.sub 'parsecondition' :method
        .param pmc __ARG_1
# Body
# {
.const 'Sub' $P1 = 'WSubId_43'
.annotate 'line', 6717
    $P1('(', __ARG_1)
.annotate 'line', 6718
.const 'Sub' $P3 = 'WSubId_30'
    $P2 = $P3(__ARG_1, self)
    self.'set'($P2)
.const 'Sub' $P4 = 'WSubId_43'
.annotate 'line', 6719
    $P4(')', __ARG_1)
# }
.annotate 'line', 6720

.end # parsecondition

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ConditionalStatement' ]
.annotate 'line', 6709
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
.annotate 'line', 6733
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6734
    self.'parsecondition'(__ARG_2)
.annotate 'line', 6735
.const 'Sub' $P4 = 'WSubId_81'
    $P3 = $P4(__ARG_2, self)
    setattribute self, 'truebranch', $P3
.annotate 'line', 6736
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6737
    $P2 = $P1.'iskeyword'("else")
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 6738
.const 'Sub' $P6 = 'WSubId_81'
    $P5 = $P6(__ARG_2, self)
    setattribute self, 'falsebranch', $P5
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 6740
    new $P8, [ 'EmptyStatement' ]
    setattribute self, 'falsebranch', $P8
.annotate 'line', 6741
    __ARG_2.'unget'($P1)
# }
  __label_2: # endif
# }
.annotate 'line', 6743

.end # IfStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6746
    self.'optimize_condition'()
.annotate 'line', 6747
    getattribute $P3, self, 'truebranch'
    $P2 = $P3.'optimize'()
    setattribute self, 'truebranch', $P2
.annotate 'line', 6748
    getattribute $P3, self, 'falsebranch'
    $P2 = $P3.'optimize'()
    setattribute self, 'falsebranch', $P2
# switch
.annotate 'line', 6749
    $P1 = self.'getvalue'()
    set $I1, $P1
    set $I2, 1
    if $I1 == $I2 goto __label_3
    set $I2, 2
    if $I1 == $I2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6751
    getattribute $P2, self, 'truebranch'
    .return($P2)
  __label_4: # case
.annotate 'line', 6753
    getattribute $P3, self, 'falsebranch'
    .return($P3)
  __label_2: # default
  __label_1: # switch end
.annotate 'line', 6755
    .return(self)
# }
.annotate 'line', 6756

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6759
# var truebranch: $P1
    getattribute $P1, self, 'truebranch'
.annotate 'line', 6760
# var falsebranch: $P2
    getattribute $P2, self, 'falsebranch'
.annotate 'line', 6761
# t_empty: $I1
    $P3 = $P1.'isempty'()
    set $I1, $P3
.annotate 'line', 6762
# f_empty: $I2
    $P3 = $P2.'isempty'()
    set $I2, $P3
.annotate 'line', 6763
# elselabel: $S1
    set $S1, ''
.annotate 'line', 6764
    not $I3, $I2
    unless $I3 goto __label_1
.annotate 'line', 6765
    $P3 = self.'genlabel'()
    set $S1, $P3
  __label_1: # endif
.annotate 'line', 6766
# endlabel: $S2
    $P3 = self.'genlabel'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 6767
# cond_false: $S3
    unless $I2 goto __label_4
    set $S3, $S2
    goto __label_3
  __label_4:
    set $S3, $S1
  __label_3:
.annotate 'line', 6768
    self.'annotate'(__ARG_1)
.annotate 'line', 6769
    self.'emit_else'(__ARG_1, $S3)
.annotate 'line', 6770
    $P1.'emit'(__ARG_1)
.annotate 'line', 6772
    not $I3, $I2
    unless $I3 goto __label_5
# {
.annotate 'line', 6773
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 6774
    __ARG_1.'emitlabel'($S1, 'else')
.annotate 'line', 6775
    $P2.'emit'(__ARG_1)
# }
  __label_5: # endif
.annotate 'line', 6777
    __ARG_1.'emitlabel'($S2, 'endif')
# }
.annotate 'line', 6778

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IfStatement' ]
.annotate 'line', 6727
    get_class $P1, [ 'ConditionalStatement' ]
    addparent $P0, $P1
.annotate 'line', 6729
    addattribute $P0, 'truebranch'
.annotate 'line', 6730
    addattribute $P0, 'falsebranch'
.end
.namespace [ 'LoopStatement' ]

.sub 'parsebody' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6790
.const 'Sub' $P3 = 'WSubId_81'
    $P2 = $P3(__ARG_1, self)
    setattribute self, 'body', $P2
# }
.annotate 'line', 6791

.end # parsebody


.sub 'emit_infinite' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6794
# breaklabel: $S1
    $P1 = self.'genbreaklabel'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6795
# continuelabel: $S2
    $P1 = self.'gencontinuelabel'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 6797
    self.'annotate'(__ARG_1)
.annotate 'line', 6798
    __ARG_1.'emitlabel'($S2, 'Infinite loop')
.annotate 'line', 6799
    getattribute $P1, self, 'body'
    $P1.'emit'(__ARG_1)
.annotate 'line', 6800
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 6801
    __ARG_1.'emitlabel'($S1, 'Infinite loop end')
# }
.annotate 'line', 6802

.end # emit_infinite

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'LoopStatement' ]
.annotate 'line', 6785
    get_class $P1, [ 'Continuable' ]
    addparent $P0, $P1
.annotate 'line', 6787
    addattribute $P0, 'body'
.end
.namespace [ 'WhileStatement' ]

.sub 'WhileStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6813
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6814
    self.'parsecondition'(__ARG_2)
.annotate 'line', 6815
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 6816

.end # WhileStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6819
    self.'optimize_condition'()
.annotate 'line', 6820
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 6821
    .return(self)
# }
.annotate 'line', 6822

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6825
    $P1 = self.'getvalue'()
    set $I1, $P1
    set $I2, 1
    if $I1 == $I2 goto __label_3
    set $I2, 2
    if $I1 == $I2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6827
    self.'emit_infinite'(__ARG_1)
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 6830
    __ARG_1.'comment'('while(false) optimized out')
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 6833
# breaklabel: $S1
    $P2 = self.'genbreaklabel'()
    null $S1
    if_null $P2, __label_5
    set $S1, $P2
  __label_5:
.annotate 'line', 6834
# continuelabel: $S2
    $P3 = self.'gencontinuelabel'()
    null $S2
    if_null $P3, __label_6
    set $S2, $P3
  __label_6:
.annotate 'line', 6836
    self.'annotate'(__ARG_1)
.annotate 'line', 6837
    __ARG_1.'emitlabel'($S2, 'while')
.annotate 'line', 6838
    self.'emit_else'(__ARG_1, $S1)
.annotate 'line', 6839
    getattribute $P4, self, 'body'
    $P4.'emit'(__ARG_1)
.annotate 'line', 6840
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 6841
    __ARG_1.'emitlabel'($S1, 'endwhile')
  __label_1: # switch end
# }
.annotate 'line', 6843

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'WhileStatement' ]
.annotate 'line', 6809
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
.annotate 'line', 6854
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6855
    self.'parsebody'(__ARG_2)
.const 'Sub' $P1 = 'WSubId_82'
.annotate 'line', 6856
    $P1('while', __ARG_2)
.annotate 'line', 6857
    self.'parsecondition'(__ARG_2)
# }
.annotate 'line', 6858

.end # DoStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6861
    self.'optimize_condition'()
.annotate 'line', 6862
# var body: $P1
    getattribute $P2, self, 'body'
    $P1 = $P2.'optimize'()
.annotate 'line', 6863
    $I1 = $P1.'isempty'()
    unless $I1 goto __label_2
    $P2 = self.'getvalue'()
    set $I2, $P2
    iseq $I1, $I2, 2
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 6864
    new $P3, [ 'EmptyStatement' ]
    .return($P3)
  __label_1: # endif
.annotate 'line', 6865
    setattribute self, 'body', $P1
.annotate 'line', 6866
    .return(self)
# }
.annotate 'line', 6867

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6870
# var body: $P1
    getattribute $P1, self, 'body'
.annotate 'line', 6871
# condvalue: $I1
    $P2 = self.'getvalue'()
    set $I1, $P2
# switch
.annotate 'line', 6872
    set $I2, $I1
    set $I3, 1
    if $I2 == $I3 goto __label_3
    goto __label_2
  __label_3: # case
.annotate 'line', 6874
    self.'emit_infinite'(__ARG_1)
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 6877
# looplabel: $S1
    $P2 = self.'genlabel'()
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
.annotate 'line', 6878
# breaklabel: $S2
    $P3 = self.'genbreaklabel'()
    null $S2
    if_null $P3, __label_5
    set $S2, $P3
  __label_5:
.annotate 'line', 6879
# continuelabel: $S3
    $P4 = self.'gencontinuelabel'()
    null $S3
    if_null $P4, __label_6
    set $S3, $P4
  __label_6:
.annotate 'line', 6881
    self.'annotate'(__ARG_1)
.annotate 'line', 6882
    __ARG_1.'emitlabel'($S1, 'do')
.annotate 'line', 6884
    $P1.'emit'(__ARG_1)
.annotate 'line', 6885
    __ARG_1.'emitlabel'($S3, 'continue')
.annotate 'line', 6886
    eq $I1, 2, __label_7
.annotate 'line', 6887
    self.'emit_if'(__ARG_1, $S1, $S2)
  __label_7: # endif
.annotate 'line', 6888
    __ARG_1.'emitlabel'($S2, 'enddo')
  __label_1: # switch end
# }
.annotate 'line', 6890

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'DoStatement' ]
.annotate 'line', 6850
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
.annotate 'line', 6901
    self.'Statement'(__ARG_1, __ARG_3)
.const 'Sub' $P1 = 'WSubId_43'
.annotate 'line', 6902
    $P1(';', __ARG_2)
# }
.annotate 'line', 6903

.end # ContinueStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6904
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6907
    self.'annotate'(__ARG_1)
.annotate 'line', 6908
# label: $S1
    getattribute $P2, self, 'start'
    $P1 = self.'getcontinuelabel'($P2)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6909
    __ARG_1.'emitgoto'($S1, 'continue')
# }
.annotate 'line', 6910

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ContinueStatement' ]
.annotate 'line', 6897
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
.annotate 'line', 6921
    self.'Statement'(__ARG_1, __ARG_3)
.const 'Sub' $P1 = 'WSubId_43'
.annotate 'line', 6922
    $P1(';', __ARG_2)
# }
.annotate 'line', 6923

.end # BreakStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6924
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6927
    self.'annotate'(__ARG_1)
.annotate 'line', 6928
# label: $S1
    getattribute $P2, self, 'start'
    $P1 = self.'getbreaklabel'($P2)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6929
    __ARG_1.'emitgoto'($S1, 'break')
# }
.annotate 'line', 6930

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'BreakStatement' ]
.annotate 'line', 6917
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'SwitchBaseStatement' ]

.sub 'SwitchBaseStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6945
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 6946
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'case_value', $P2
.annotate 'line', 6947
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'case_st', $P2
.annotate 'line', 6948
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'default_st', $P2
# }
.annotate 'line', 6949

.end # SwitchBaseStatement


.sub 'parse_cases' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6952
# var t: $P1
    null $P1
  __label_2: # while
.annotate 'line', 6953
    $P1 = __ARG_1.'get'()
    $I1 = $P1.'iskeyword'('case')
    if $I1 goto __label_3
    $I1 = $P1.'iskeyword'('default')
  __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 6954
    $P3 = $P1.'iskeyword'('case')
    if_null $P3, __label_4
    unless $P3 goto __label_4
# {
.annotate 'line', 6955
    getattribute $P4, self, 'case_value'
.const 'Sub' $P6 = 'WSubId_30'
    $P5 = $P6(__ARG_1, self)
# predefined push
    push $P4, $P5
.annotate 'line', 6956
    $P1 = __ARG_1.'get'()
.annotate 'line', 6957
    $P3 = $P1.'isop'(':')
    isfalse $I1, $P3
    unless $I1 goto __label_6
.const 'Sub' $P7 = 'WSubId_29'
.annotate 'line', 6958
    $P7("':' in case", $P1)
  __label_6: # endif
.annotate 'line', 6959
# var st: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
  __label_8: # while
.annotate 'line', 6960
    $P1 = __ARG_1.'get'()
    $I2 = $P1.'isop'('}')
    if $I2 goto __label_10
    $I2 = $P1.'iskeyword'('case')
  __label_10:
    if $I2 goto __label_9
    $I2 = $P1.'iskeyword'('default')
  __label_9:
    not $I1, $I2
    unless $I1 goto __label_7
# {
.annotate 'line', 6961
    __ARG_1.'unget'($P1)
.annotate 'line', 6962
.const 'Sub' $P8 = 'WSubId_81'
    $P3 = $P8(__ARG_1, self)
# predefined push
    push $P2, $P3
# }
    goto __label_8
  __label_7: # endwhile
.annotate 'line', 6964
    getattribute $P3, self, 'case_st'
# predefined push
    push $P3, $P2
.annotate 'line', 6965
    __ARG_1.'unget'($P1)
# }
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 6968
    $P1 = __ARG_1.'get'()
.annotate 'line', 6969
    $P3 = $P1.'isop'(':')
    isfalse $I1, $P3
    unless $I1 goto __label_11
.const 'Sub' $P9 = 'WSubId_29'
.annotate 'line', 6970
    $P9("':' in default", $P1)
  __label_11: # endif
  __label_13: # while
.annotate 'line', 6971
    $P1 = __ARG_1.'get'()
    $I2 = $P1.'isop'('}')
    if $I2 goto __label_15
    $I2 = $P1.'iskeyword'('case')
  __label_15:
    if $I2 goto __label_14
    $I2 = $P1.'iskeyword'('default')
  __label_14:
    not $I1, $I2
    unless $I1 goto __label_12
# {
.annotate 'line', 6972
    __ARG_1.'unget'($P1)
.annotate 'line', 6973
    getattribute $P3, self, 'default_st'
.const 'Sub' $P10 = 'WSubId_81'
    $P4 = $P10(__ARG_1, self)
# predefined push
    push $P3, $P4
# }
    goto __label_13
  __label_12: # endwhile
.annotate 'line', 6975
    __ARG_1.'unget'($P1)
# }
  __label_5: # endif
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6978
    $P3 = $P1.'isop'('}')
    isfalse $I1, $P3
    unless $I1 goto __label_16
.const 'Sub' $P11 = 'WSubId_29'
.annotate 'line', 6979
    $P11("'}' in switch", $P1)
  __label_16: # endif
# }
.annotate 'line', 6980

.end # parse_cases


.sub 'optimize_cases' :method
# Body
# {
.const 'Sub' $P2 = 'WSubId_28'
.annotate 'line', 6983
    getattribute $P3, self, 'case_value'
    $P2($P3)
.annotate 'line', 6984
    getattribute $P3, self, 'case_st'
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
.const 'Sub' $P5 = 'WSubId_28'
.annotate 'line', 6985
    $P5($P1)
    goto __label_1
  __label_2: # endfor
.const 'Sub' $P6 = 'WSubId_28'
.annotate 'line', 6986
    getattribute $P3, self, 'default_st'
    $P6($P3)
# }
.annotate 'line', 6987

.end # optimize_cases

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'SwitchBaseStatement' ]
.annotate 'line', 6937
    get_class $P1, [ 'Breakable' ]
    addparent $P0, $P1
    get_class $P2, [ 'Statement' ]
    addparent $P0, $P2
.annotate 'line', 6939
    addattribute $P0, 'case_value'
.annotate 'line', 6940
    addattribute $P0, 'case_st'
.annotate 'line', 6941
    addattribute $P0, 'default_st'
.end
.namespace [ 'SwitchStatement' ]

.sub 'SwitchStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7000
    self.'SwitchBaseStatement'(__ARG_1, __ARG_3)
.annotate 'line', 7001
.const 'Sub' $P4 = 'WSubId_30'
    $P3 = $P4(__ARG_2, self)
    setattribute self, 'condition', $P3
.annotate 'line', 7002
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7003
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.const 'Sub' $P5 = 'WSubId_29'
.annotate 'line', 7004
    $P5("')' in switch", $P1)
  __label_1: # endif
.annotate 'line', 7005
    $P1 = __ARG_2.'get'()
.annotate 'line', 7006
    $P2 = $P1.'isop'('{')
    isfalse $I1, $P2
    unless $I1 goto __label_2
.const 'Sub' $P6 = 'WSubId_29'
.annotate 'line', 7007
    $P6("'{' in switch", $P1)
  __label_2: # endif
.annotate 'line', 7008
    self.'parse_cases'(__ARG_2)
# }
.annotate 'line', 7009

.end # SwitchStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7012
    getattribute $P3, self, 'condition'
    $P2 = $P3.'optimize'()
    setattribute self, 'condition', $P2
.annotate 'line', 7013
    self.'optimize_cases'()
.annotate 'line', 7014
    .return(self)
# }
.annotate 'line', 7015

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7019
# type: $S1
    set $S1, ''
.annotate 'line', 7020
    getattribute $P7, self, 'case_value'
    iter $P8, $P7
    set $P8, 0
  __label_1: # for iteration
    unless $P8 goto __label_2
    shift $P1, $P8
# {
.annotate 'line', 7021
# t: $S2
    $P9 = $P1.'checkresult'()
    null $S2
    if_null $P9, __label_3
    set $S2, $P9
  __label_3:
.annotate 'line', 7022
    ne $S2, 'N', __label_4
.const 'Sub' $P10 = 'WSubId_1'
.annotate 'line', 7023
    getattribute $P7, self, 'start'
    $P10("Invalid type in case", $P7)
  __label_4: # endif
.annotate 'line', 7024
    ne $S1, '', __label_5
.annotate 'line', 7025
    set $S1, $S2
    goto __label_6
  __label_5: # else
.annotate 'line', 7026
    eq $S1, $S2, __label_7
.annotate 'line', 7027
    set $S1, 'P'
  __label_7: # endif
  __label_6: # endif
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 7030
# var condition: $P2
    getattribute $P2, self, 'condition'
.annotate 'line', 7031
# var condtype: $P3
    $P3 = $P2.'checkresult'()
.annotate 'line', 7035
    ne $S1, '', __label_8
.annotate 'line', 7036
    set $S1, $P3
  __label_8: # endif
.annotate 'line', 7038
    __ARG_1.'comment'('switch')
.annotate 'line', 7039
# reg: $S3
    $P7 = self.'tempreg'($S1)
    null $S3
    if_null $P7, __label_9
    set $S3, $P7
  __label_9:
.annotate 'line', 7040
    set $S8, $P3
    ne $S8, $S1, __label_10
.annotate 'line', 7041
    $P2.'emit'(__ARG_1, $S3)
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 7043
# regcond: $S4
    $P7 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P7, __label_12
    set $S4, $P7
  __label_12:
.annotate 'line', 7044
    __ARG_1.'emitset'($S3, $S4)
# }
  __label_11: # endif
.annotate 'line', 7048
    self.'genbreaklabel'()
.annotate 'line', 7049
# defaultlabel: $S5
    $P7 = self.'genlabel'()
    null $S5
    if_null $P7, __label_13
    set $S5, $P7
  __label_13:
.annotate 'line', 7050
    new $P4, ['ResizableStringArray']
.annotate 'line', 7051
# regval: $S6
    $P7 = self.'tempreg'($S1)
    null $S6
    if_null $P7, __label_14
    set $S6, $P7
  __label_14:
.annotate 'line', 7052
    getattribute $P7, self, 'case_value'
    iter $P11, $P7
    set $P11, 0
  __label_15: # for iteration
    unless $P11 goto __label_16
    shift $P5, $P11
# {
.annotate 'line', 7053
# label: $S7
    $P9 = self.'genlabel'()
    null $S7
    if_null $P9, __label_17
    set $S7, $P9
  __label_17:
.annotate 'line', 7054
# predefined push
    push $P4, $S7
.annotate 'line', 7055
    $P5.'emit'(__ARG_1, $S6)
.annotate 'line', 7056
    __ARG_1.'say'('    ', 'if ', $S3, ' == ', $S6, ' goto ', $S7)
# }
    goto __label_15
  __label_16: # endfor
.annotate 'line', 7058
    __ARG_1.'emitgoto'($S5)
.annotate 'line', 7061
    self.'annotate'(__ARG_1)
.annotate 'line', 7062
# var case_st: $P6
    getattribute $P6, self, 'case_st'
.annotate 'line', 7063
# n: $I1
    set $P7, $P6
    set $I1, $P7
# for loop
.annotate 'line', 7064
# i: $I2
    null $I2
  __label_20: # for condition
    ge $I2, $I1, __label_19
# {
.annotate 'line', 7065
    $P7 = $P4[$I2]
    __ARG_1.'emitlabel'($P7, 'case')
.const 'Sub' $P12 = 'WSubId_42'
.annotate 'line', 7066
    $P7 = $P6[$I2]
    $P12(__ARG_1, $P7)
# }
  __label_18: # for iteration
.annotate 'line', 7064
    inc $I2
    goto __label_20
  __label_19: # for end
.annotate 'line', 7069
    __ARG_1.'emitlabel'($S5, 'default')
.const 'Sub' $P13 = 'WSubId_42'
.annotate 'line', 7070
    getattribute $P7, self, 'default_st'
    $P13(__ARG_1, $P7)
.annotate 'line', 7072
    getattribute $P9, self, 'start'
    $P7 = self.'getbreaklabel'($P9)
    __ARG_1.'emitlabel'($P7, 'switch end')
# }
.annotate 'line', 7073

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'SwitchStatement' ]
.annotate 'line', 6994
    get_class $P1, [ 'SwitchBaseStatement' ]
    addparent $P0, $P1
.annotate 'line', 6996
    addattribute $P0, 'condition'
.end
.namespace [ 'SwitchCaseStatement' ]

.sub 'SwitchCaseStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7085
    self.'SwitchBaseStatement'(__ARG_1, __ARG_3)
.annotate 'line', 7086
    self.'parse_cases'(__ARG_2)
# }
.annotate 'line', 7087

.end # SwitchCaseStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7090
    self.'optimize_cases'()
.annotate 'line', 7091
    .return(self)
# }
.annotate 'line', 7092

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7096
    self.'genbreaklabel'()
.annotate 'line', 7097
# defaultlabel: $S1
    $P4 = self.'genlabel'()
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 7098
    new $P1, ['ResizableStringArray']
.annotate 'line', 7100
    __ARG_1.'comment'('switch-case')
.annotate 'line', 7101
# reg: $S2
    $P4 = self.'tempreg'('I')
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 7102
    getattribute $P4, self, 'case_value'
    iter $P5, $P4
    set $P5, 0
  __label_3: # for iteration
    unless $P5 goto __label_4
    shift $P2, $P5
# {
.annotate 'line', 7103
# label: $S3
    $P6 = self.'genlabel'()
    null $S3
    if_null $P6, __label_5
    set $S3, $P6
  __label_5:
.annotate 'line', 7104
# predefined push
    push $P1, $S3
.annotate 'line', 7105
    $P2.'emit'(__ARG_1, $S2)
.annotate 'line', 7106
    __ARG_1.'say'('    ', 'if ', $S2, ' goto ', $S3)
# }
    goto __label_3
  __label_4: # endfor
.annotate 'line', 7108
    __ARG_1.'emitgoto'($S1)
.annotate 'line', 7111
    self.'annotate'(__ARG_1)
.annotate 'line', 7112
# var case_st: $P3
    getattribute $P3, self, 'case_st'
.annotate 'line', 7113
# n: $I1
    set $P4, $P3
    set $I1, $P4
# for loop
.annotate 'line', 7114
# i: $I2
    null $I2
  __label_8: # for condition
    ge $I2, $I1, __label_7
# {
.annotate 'line', 7115
    $P4 = $P1[$I2]
    __ARG_1.'emitlabel'($P4, 'case')
.const 'Sub' $P7 = 'WSubId_42'
.annotate 'line', 7116
    $P4 = $P3[$I2]
    $P7(__ARG_1, $P4)
# }
  __label_6: # for iteration
.annotate 'line', 7114
    inc $I2
    goto __label_8
  __label_7: # for end
.annotate 'line', 7119
    __ARG_1.'emitlabel'($S1, 'default')
.const 'Sub' $P8 = 'WSubId_42'
.annotate 'line', 7120
    getattribute $P4, self, 'default_st'
    $P8(__ARG_1, $P4)
.annotate 'line', 7122
    getattribute $P6, self, 'start'
    $P4 = self.'getbreaklabel'($P6)
    __ARG_1.'emitlabel'($P4, 'switch end')
# }
.annotate 'line', 7123

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'SwitchCaseStatement' ]
.annotate 'line', 7080
    get_class $P1, [ 'SwitchBaseStatement' ]
    addparent $P0, $P1
.end
.namespace [ ]

.sub 'parseSwitch' :subid('WSubId_40')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7130
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7131
    $P2 = $P1.'isop'('(')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 7132
    new $P4, [ 'SwitchStatement' ]
    $P4.'SwitchStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P3, $P4
    .return($P3)
  __label_1: # endif
.annotate 'line', 7133
    $P2 = $P1.'isop'('{')
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 7134
    new $P4, [ 'SwitchCaseStatement' ]
    $P4.'SwitchCaseStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P3, $P4
    .return($P3)
  __label_2: # endif
.const 'Sub' $P5 = 'WSubId_29'
.annotate 'line', 7135
    $P5("'(' in switch", $P1)
# }
.annotate 'line', 7136

.end # parseSwitch

.namespace [ 'ForStatement' ]

.sub 'ForStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7149
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7150
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7151
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 7152
    __ARG_2.'unget'($P1)
.annotate 'line', 7153
.const 'Sub' $P4 = 'WSubId_81'
    $P3 = $P4(__ARG_2, self)
    setattribute self, 'initializer', $P3
# }
  __label_1: # endif
.annotate 'line', 7155
    $P1 = __ARG_2.'get'()
.annotate 'line', 7156
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_2
# {
.annotate 'line', 7157
    __ARG_2.'unget'($P1)
.annotate 'line', 7158
    self.'parseconditionshort'(__ARG_2)
.const 'Sub' $P5 = 'WSubId_43'
.annotate 'line', 7159
    $P5(';', __ARG_2)
# }
  __label_2: # endif
.annotate 'line', 7161
    $P1 = __ARG_2.'get'()
.annotate 'line', 7162
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_3
# {
.annotate 'line', 7163
    __ARG_2.'unget'($P1)
.annotate 'line', 7164
.const 'Sub' $P6 = 'WSubId_30'
    $P3 = $P6(__ARG_2, self)
    setattribute self, 'iteration', $P3
.const 'Sub' $P7 = 'WSubId_43'
.annotate 'line', 7165
    $P7(')', __ARG_2)
# }
  __label_3: # endif
.annotate 'line', 7167
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 7168

.end # ForStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7171
    getattribute $P1, self, 'initializer'
    if_null $P1, __label_1
.annotate 'line', 7172
    getattribute $P4, self, 'initializer'
    $P3 = $P4.'optimize'()
    setattribute self, 'initializer', $P3
  __label_1: # endif
.annotate 'line', 7173
    getattribute $P1, self, 'condexpr'
    if_null $P1, __label_2
.annotate 'line', 7174
    self.'optimize_condition'()
  __label_2: # endif
.annotate 'line', 7175
    getattribute $P1, self, 'iteration'
    if_null $P1, __label_3
.annotate 'line', 7176
    getattribute $P4, self, 'iteration'
    $P3 = $P4.'optimize'()
    setattribute self, 'iteration', $P3
  __label_3: # endif
.annotate 'line', 7177
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 7178
    .return(self)
# }
.annotate 'line', 7179

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7182
    getattribute $P1, self, 'initializer'
    isnull $I1, $P1
    unless $I1 goto __label_3
.annotate 'line', 7183
    getattribute $P2, self, 'condexpr'
    isnull $I1, $P2
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 7184
    getattribute $P3, self, 'iteration'
    isnull $I1, $P3
  __label_2:
    unless $I1 goto __label_1
# {
.annotate 'line', 7185
    self.'emit_infinite'(__ARG_1)
.annotate 'line', 7186
    .return()
# }
  __label_1: # endif
.annotate 'line', 7188
    __ARG_1.'comment'('for loop')
.annotate 'line', 7189
# continuelabel: $S1
    $P1 = self.'gencontinuelabel'()
    null $S1
    if_null $P1, __label_4
    set $S1, $P1
  __label_4:
.annotate 'line', 7190
# breaklabel: $S2
    $P1 = self.'genbreaklabel'()
    null $S2
    if_null $P1, __label_5
    set $S2, $P1
  __label_5:
.annotate 'line', 7191
# condlabel: $S3
    $P1 = self.'genlabel'()
    null $S3
    if_null $P1, __label_6
    set $S3, $P1
  __label_6:
.annotate 'line', 7192
    getattribute $P1, self, 'initializer'
    if_null $P1, __label_7
.annotate 'line', 7193
    getattribute $P2, self, 'initializer'
    $P2.'emit'(__ARG_1)
  __label_7: # endif
.annotate 'line', 7195
    __ARG_1.'emitlabel'($S3, 'for condition')
.annotate 'line', 7196
    getattribute $P1, self, 'condexpr'
    if_null $P1, __label_8
.annotate 'line', 7197
    self.'emit_else'(__ARG_1, $S2)
  __label_8: # endif
.annotate 'line', 7199
    getattribute $P1, self, 'body'
    $P1.'emit'(__ARG_1)
.annotate 'line', 7200
    __ARG_1.'emitlabel'($S1, 'for iteration')
.annotate 'line', 7201
    getattribute $P1, self, 'iteration'
    if_null $P1, __label_9
.annotate 'line', 7202
# unused: $S4
    getattribute $P3, self, 'iteration'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S4
    if_null $P2, __label_10
    set $S4, $P2
  __label_10:
  __label_9: # endif
.annotate 'line', 7203
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 7205
    __ARG_1.'emitlabel'($S2, 'for end')
# }
.annotate 'line', 7206

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ForStatement' ]
.annotate 'line', 7142
    get_class $P1, [ 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'BlockStatement' ]
    addparent $P0, $P2
    get_class $P3, [ 'ConditionalStatement' ]
    addparent $P0, $P3
.annotate 'line', 7144
    addattribute $P0, 'initializer'
.annotate 'line', 7145
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
.annotate 'line', 7221
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7222
# sname: $S1
    set $P1, __ARG_4
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7223
    eq __ARG_5, '', __label_2
# {
.annotate 'line', 7224
# deftype: $S2
.const 'Sub' $P2 = 'WSubId_83'
    $P1 = $P2(__ARG_5)
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
  __label_3:
.annotate 'line', 7225
    self.'createvar'($S1, $S2)
.annotate 'line', 7226
    box $P1, $S2
    setattribute self, 'deftype', $P1
# }
  __label_2: # endif
.annotate 'line', 7228
    setattribute self, 'varname', __ARG_4
.annotate 'line', 7229
.const 'Sub' $P4 = 'WSubId_30'
    $P3 = $P4(__ARG_2, self)
    setattribute self, 'container', $P3
.const 'Sub' $P5 = 'WSubId_43'
.annotate 'line', 7230
    $P5(')', __ARG_2)
.annotate 'line', 7231
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 7232

.end # ForeachStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7235
    getattribute $P3, self, 'container'
    $P2 = $P3.'optimize'()
    setattribute self, 'container', $P2
.annotate 'line', 7236
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
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
    self.'annotate'(__ARG_1)
.annotate 'line', 7242
# regcont: $S1
    null $S1
.annotate 'line', 7243
    getattribute $P3, self, 'container'
    $P2 = $P3.'checkresult'()
    set $S6, $P2
    ne $S6, 'S', __label_1
# {
.annotate 'line', 7244
# value: $S2
    getattribute $P5, self, 'container'
    $P4 = $P5.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_3
    set $S2, $P4
  __label_3:
.annotate 'line', 7245
    $P2 = self.'tempreg'('P')
    set $S1, $P2
.annotate 'line', 7246
    __ARG_1.'emitbox'($S1, $S2)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 7249
    getattribute $P3, self, 'container'
    $P2 = $P3.'emit_get'(__ARG_1)
    set $S1, $P2
  __label_2: # endif
.annotate 'line', 7251
# var itvar: $P1
    getattribute $P2, self, 'varname'
    $P1 = self.'getvar'($P2)
.annotate 'line', 7252
    unless_null $P1, __label_4
.const 'Sub' $P6 = 'WSubId_48'
.annotate 'line', 7253
    getattribute $P2, self, 'varname'
    $P6($P2)
  __label_4: # endif
.annotate 'line', 7255
# iterator: $S3
    $P2 = self.'createreg'('P')
    null $S3
    if_null $P2, __label_5
    set $S3, $P2
  __label_5:
.annotate 'line', 7256
# continuelabel: $S4
    $P2 = self.'gencontinuelabel'()
    null $S4
    if_null $P2, __label_6
    set $S4, $P2
  __label_6:
.annotate 'line', 7257
# breaklabel: $S5
    $P2 = self.'genbreaklabel'()
    null $S5
    if_null $P2, __label_7
    set $S5, $P2
  __label_7:
.annotate 'line', 7258
    __ARG_1.'emitarg2'('iter', $S3, $S1)
.annotate 'line', 7259
    __ARG_1.'emitset'($S3, '0')
.annotate 'line', 7260
    __ARG_1.'emitlabel'($S4, 'for iteration')
.annotate 'line', 7261
    __ARG_1.'emitunless'($S3, $S5)
.annotate 'line', 7262
    $P2 = $P1.'getreg'()
    __ARG_1.'emitarg2'('shift', $P2, $S3)
.annotate 'line', 7263
    getattribute $P2, self, 'body'
    $P2.'emit'(__ARG_1)
.annotate 'line', 7264
    __ARG_1.'emitgoto'($S4)
.annotate 'line', 7265
    __ARG_1.'emitlabel'($S5, 'endfor')
# }
.annotate 'line', 7266

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ForeachStatement' ]
.annotate 'line', 7213
    get_class $P1, [ 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'BlockStatement' ]
    addparent $P0, $P2
.annotate 'line', 7215
    addattribute $P0, 'deftype'
.annotate 'line', 7216
    addattribute $P0, 'varname'
.annotate 'line', 7217
    addattribute $P0, 'container'
.end
.namespace [ ]

.sub 'parseFor' :subid('WSubId_41')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.const 'Sub' $P4 = 'WSubId_43'
.annotate 'line', 7273
    $P4('(', __ARG_2)
.annotate 'line', 7274
# var aux: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7275
# var in1: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 7276
    $P5 = $P2.'iskeyword'('in')
    if_null $P5, __label_1
    unless $P5 goto __label_1
.annotate 'line', 7277
    new $P7, [ 'ForeachStatement' ]
    $P7.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, '')
    set $P6, $P7
    .return($P6)
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 7279
# var in2: $P3
    $P3 = __ARG_2.'get'()
.annotate 'line', 7280
    $P5 = $P3.'iskeyword'('in')
    if_null $P5, __label_3
    unless $P5 goto __label_3
.annotate 'line', 7281
    new $P7, [ 'ForeachStatement' ]
    $P7.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P2, $P1)
    set $P6, $P7
    .return($P6)
  __label_3: # endif
.annotate 'line', 7282
    __ARG_2.'unget'($P3)
.annotate 'line', 7283
    __ARG_2.'unget'($P2)
.annotate 'line', 7284
    __ARG_2.'unget'($P1)
# }
  __label_2: # endif
.annotate 'line', 7286
    new $P6, [ 'ForStatement' ]
    $P6.'ForStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P5, $P6
    .return($P5)
# }
.annotate 'line', 7287

.end # parseFor

.namespace [ 'ThrowStatement' ]

.sub 'ThrowStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7299
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7300
.const 'Sub' $P3 = 'WSubId_30'
    $P2 = $P3(__ARG_2, self)
    setattribute self, 'excep', $P2
# }
.annotate 'line', 7301

.end # ThrowStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7304
    getattribute $P3, self, 'excep'
    $P2 = $P3.'optimize'()
    setattribute self, 'excep', $P2
.annotate 'line', 7305
    .return(self)
# }
.annotate 'line', 7306

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7309
# var excep: $P1
    getattribute $P1, self, 'excep'
.annotate 'line', 7310
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 7311
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 7312
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    set $S3, 'P'
    if $S2 == $S3 goto __label_4
    set $S3, 'S'
    if $S2 == $S3 goto __label_5
    goto __label_3
  __label_4: # case
.annotate 'line', 7314
    __ARG_1.'emitarg1'('throw', $S1)
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 7317
    __ARG_1.'emitarg1'('die', $S1)
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 7318
.const 'Sub' $P3 = 'WSubId_1'
.annotate 'line', 7320
    getattribute $P4, self, 'start'
    $P3("Invalid throw argument", $P4)
  __label_2: # switch end
# }
.annotate 'line', 7322

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ThrowStatement' ]
.annotate 'line', 7293
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7295
    addattribute $P0, 'excep'
.end
.namespace [ 'TryModifierList' ]

.sub 'TryModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7334
    setattribute self, 'start', __ARG_1
.annotate 'line', 7335
    self.'ModifierList'(__ARG_2, __ARG_3)
# }
.annotate 'line', 7336

.end # TryModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 7339
# var modiflist: $P1
    $P1 = self.'getlist'()
.annotate 'line', 7340
    iter $P6, $P1
    set $P6, 0
  __label_1: # for iteration
    unless $P6 goto __label_2
    shift $P2, $P6
# {
.annotate 'line', 7341
# modifname: $S1
    $P7 = $P2.'getname'()
    null $S1
    if_null $P7, __label_3
    set $S1, $P7
  __label_3:
.annotate 'line', 7342
# nargs: $I1
    $P7 = $P2.'numargs'()
    set $I1, $P7
# switch
.annotate 'line', 7343
    set $S3, $S1
    set $S4, 'min_severity'
    if $S3 == $S4 goto __label_6
    set $S4, 'max_severity'
    if $S3 == $S4 goto __label_7
    set $S4, 'handle_types'
    if $S3 == $S4 goto __label_8
    set $S4, 'handle_types_except'
    if $S3 == $S4 goto __label_9
    goto __label_5
  __label_6: # case
  __label_7: # case
.annotate 'line', 7346
    eq $I1, 1, __label_10
.const 'Sub' $P8 = 'WSubId_1'
.annotate 'line', 7347
    getattribute $P7, self, 'start'
    $P8('Wrong modifier args', $P7)
  __label_10: # endif
.annotate 'line', 7348
# var arg: $P3
    $P3 = $P2.'getarg'(0)
.annotate 'line', 7349
# argreg: $S2
    $P9 = $P3.'emit_get'(__ARG_1)
    null $S2
    if_null $P9, __label_11
    set $S2, $P9
  __label_11:
.annotate 'line', 7350
    __ARG_1.'say'('    ', __ARG_2, ".'", $S1, "'(", $S2, ")")
    goto __label_4 # break
  __label_8: # case
  __label_9: # case
.annotate 'line', 7354
    new $P4, ['ResizableStringArray']
# for loop
.annotate 'line', 7355
# i: $I2
    null $I2
  __label_14: # for condition
    ge $I2, $I1, __label_13
# {
.annotate 'line', 7356
# var arg: $P5
    $P5 = $P2.'getarg'($I2)
.annotate 'line', 7357
    $P7 = $P5.'emit_get'(__ARG_1)
# predefined push
    push $P4, $P7
# }
  __label_12: # for iteration
.annotate 'line', 7355
    inc $I2
    goto __label_14
  __label_13: # for end
.annotate 'line', 7360
# predefined join
.annotate 'line', 7359
    join $S3, ', ', $P4
    __ARG_1.'say'('    ', __ARG_2, ".'", $S1, "'(", $S3, ")")
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 7361
.const 'Sub' $P10 = 'WSubId_1'
.annotate 'line', 7363
    concat $S4, "Modifier '", $S1
    concat $S4, $S4, "' not valid for try"
    getattribute $P7, self, 'start'
    $P10($S4, $P7)
  __label_4: # switch end
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 7366

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TryModifierList' ]
.annotate 'line', 7329
    get_class $P1, [ 'ModifierList' ]
    addparent $P0, $P1
.annotate 'line', 7331
    addattribute $P0, 'start'
.end
.namespace [ 'TryStatement' ]

.sub 'TryStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7378
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7379
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7380
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 7381
    new $P5, [ 'TryModifierList' ]
    $P5.'TryModifierList'($P1, __ARG_2, self)
    set $P4, $P5
    setattribute self, 'modifiers', $P4
    goto __label_2
  __label_1: # else
.annotate 'line', 7383
    __ARG_2.'unget'($P1)
  __label_2: # endif
.annotate 'line', 7385
.const 'Sub' $P6 = 'WSubId_81'
    $P3 = $P6(__ARG_2, self)
    setattribute self, 'stry', $P3
.annotate 'line', 7386
    $P1 = __ARG_2.'get'()
.annotate 'line', 7387
    $P2 = $P1.'iskeyword'('catch')
    isfalse $I1, $P2
    unless $I1 goto __label_3
.const 'Sub' $P7 = 'WSubId_2'
.annotate 'line', 7388
    $P7('catch', $P1)
  __label_3: # endif
.annotate 'line', 7389
    $P1 = __ARG_2.'get'()
.annotate 'line', 7390
    $P2 = $P1.'isop'('(')
    isfalse $I1, $P2
    unless $I1 goto __label_4
.const 'Sub' $P8 = 'WSubId_29'
.annotate 'line', 7391
    $P8("'(' after 'catch'", $P1)
  __label_4: # endif
.annotate 'line', 7392
    $P1 = __ARG_2.'get'()
.annotate 'line', 7393
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_5
# {
.annotate 'line', 7394
# exname: $S1
    $P3 = $P1.'getidentifier'()
    null $S1
    if_null $P3, __label_6
    set $S1, $P3
  __label_6:
.annotate 'line', 7395
    setattribute self, 'exname', $P1
.annotate 'line', 7396
    self.'createvar'($S1, 'P')
.annotate 'line', 7397
    $P1 = __ARG_2.'get'()
.annotate 'line', 7398
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_7
.const 'Sub' $P9 = 'WSubId_29'
.annotate 'line', 7399
    $P9("')' in 'catch'", $P1)
  __label_7: # endif
# }
  __label_5: # endif
.annotate 'line', 7401
.const 'Sub' $P10 = 'WSubId_81'
    $P3 = $P10(__ARG_2, self)
    setattribute self, 'scatch', $P3
# }
.annotate 'line', 7402

.end # TryStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7405
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_1
.annotate 'line', 7406
    getattribute $P2, self, 'modifiers'
    $P2.'optimize'()
  __label_1: # endif
.annotate 'line', 7407
    getattribute $P3, self, 'stry'
    $P2 = $P3.'optimize'()
    setattribute self, 'stry', $P2
.annotate 'line', 7408
    getattribute $P3, self, 'scatch'
    $P2 = $P3.'optimize'()
    setattribute self, 'scatch', $P2
.annotate 'line', 7409
    .return(self)
# }
.annotate 'line', 7410

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7413
# reghandler: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7414
# labelhandler: $S2
    $P1 = self.'genlabel'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 7415
# labelpasthandler: $S3
    $P1 = self.'genlabel'()
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 7416
# exreg: $S4
    getattribute $P2, self, 'exname'
    if_null $P2, __label_5
.annotate 'line', 7417
    getattribute $P4, self, 'exname'
    $P3 = self.'getvar'($P4)
    $P1 = $P3.'getreg'()
    goto __label_4
  __label_5:
.annotate 'line', 7418
    $P1 = self.'tempreg'('P')
  __label_4:
    null $S4
    if_null $P1, __label_6
    set $S4, $P1
  __label_6:
.annotate 'line', 7420
    self.'annotate'(__ARG_1)
.annotate 'line', 7421
    __ARG_1.'comment'('try: create handler')
.annotate 'line', 7423
    __ARG_1.'say'('    ', 'new ', $S1, ", 'ExceptionHandler'")
.annotate 'line', 7424
    __ARG_1.'say'('    ', 'set_label ', $S1, ', ', $S2)
.annotate 'line', 7426
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_7
.annotate 'line', 7427
    getattribute $P2, self, 'modifiers'
    $P2.'emitmodifiers'(__ARG_1, $S1)
  __label_7: # endif
.annotate 'line', 7429
    __ARG_1.'emitarg1'('push_eh', $S1)
.annotate 'line', 7430
    __ARG_1.'comment'('try: begin')
.annotate 'line', 7431
    getattribute $P1, self, 'stry'
    $P1.'emit'(__ARG_1)
.annotate 'line', 7432
    __ARG_1.'comment'('try: end')
.annotate 'line', 7433
    __ARG_1.'say'('    ', 'pop_eh')
.annotate 'line', 7435
    self.'annotate'(__ARG_1)
.annotate 'line', 7436
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 7438
    __ARG_1.'comment'('catch')
.annotate 'line', 7439
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 7440
    __ARG_1.'say'('    ', '.get_results(', $S4, ')')
.annotate 'line', 7441
    __ARG_1.'emitarg1'('finalize', $S4)
.annotate 'line', 7442
    __ARG_1.'say'('    ', 'pop_eh')
.annotate 'line', 7443
    getattribute $P1, self, 'scatch'
    $P1.'emit'(__ARG_1)
.annotate 'line', 7445
    __ARG_1.'comment'('catch end')
.annotate 'line', 7446
    __ARG_1.'emitlabel'($S3)
# }
.annotate 'line', 7447

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TryStatement' ]
.annotate 'line', 7369
    get_class $P1, [ 'BlockStatement' ]
    addparent $P0, $P1
.annotate 'line', 7371
    addattribute $P0, 'stry'
.annotate 'line', 7372
    addattribute $P0, 'modifiers'
.annotate 'line', 7373
    addattribute $P0, 'exname'
.annotate 'line', 7374
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
.annotate 'line', 7460
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7461
    setattribute self, 'name', __ARG_3
.annotate 'line', 7462
# var vdata: $P1
    $P1 = self.'createvar'(__ARG_3, 'P', __ARG_4)
.annotate 'line', 7463
    $P3 = $P1.'getreg'()
    setattribute self, 'reg', $P3
# }
.annotate 'line', 7464

.end # initvarbase

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'VarBaseStatement' ]
.annotate 'line', 7454
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7456
    addattribute $P0, 'name'
.annotate 'line', 7457
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
.annotate 'line', 7479
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7480
    setattribute self, 'name', __ARG_3
.annotate 'line', 7481
    box $P1, __ARG_4
    setattribute self, 'basetype', $P1
# }
.annotate 'line', 7482

.end # DeclareBase

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'DeclareBase' ]
.annotate 'line', 7471
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7473
    addattribute $P0, 'name'
.annotate 'line', 7474
    addattribute $P0, 'basetype'
.annotate 'line', 7475
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
.annotate 'line', 7493
    self.'DeclareBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 7494
# var vdata: $P1
    getattribute $P3, self, 'name'
    getattribute $P4, self, 'basetype'
    $P1 = self.'createvar'($P3, $P4)
.annotate 'line', 7495
    $P4 = $P1.'getreg'()
    setattribute self, 'reg', $P4
.annotate 'line', 7496
# var t: $P2
    $P2 = __ARG_5.'get'()
.annotate 'line', 7497
    $P3 = $P2.'isop'('=')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 7499
.const 'Sub' $P6 = 'WSubId_30'
    $P5 = $P6(__ARG_5, self)
    setattribute self, 'init', $P5
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 7502
    __ARG_5.'unget'($P2)
  __label_2: # endif
# }
.annotate 'line', 7503

.end # DeclareSingleStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7506
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 7507
    if_null $P1, __label_1
.annotate 'line', 7508
    $P3 = $P1.'optimize'()
    setattribute self, 'init', $P3
  __label_1: # endif
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
.annotate 'line', 7514
# name: $S1
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 7515
# reg: $S2
    getattribute $P2, self, 'reg'
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 7516
# basetype: $S3
    getattribute $P2, self, 'basetype'
    null $S3
    if_null $P2, __label_3
    set $S3, $P2
  __label_3:
.annotate 'line', 7517
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 7518
    concat $S7, $S1, ': '
    concat $S7, $S7, $S2
    __ARG_1.'comment'($S7)
.annotate 'line', 7520
    isnull $I1, $P1
    if $I1 goto __label_6
    $I1 = $P1.'isnull'()
  __label_6:
    unless $I1 goto __label_4
.annotate 'line', 7521
    __ARG_1.'emitnull'($S2)
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 7523
# itype: $S4
    $P2 = $P1.'checkresult'()
    null $S4
    if_null $P2, __label_7
    set $S4, $P2
  __label_7:
.annotate 'line', 7524
    ne $S4, $S3, __label_8
# {
.annotate 'line', 7525
    iseq $I1, $S4, 'S'
    unless $I1 goto __label_12
    isa $I1, $P1, [ 'ConcatString' ]
  __label_12:
    unless $I1 goto __label_10
.annotate 'line', 7526
    $P1.'emit_concat_set'(__ARG_1, $S2)
    goto __label_11
  __label_10: # else
.annotate 'line', 7528
    $P1.'emit'(__ARG_1, $S2)
  __label_11: # endif
# }
    goto __label_9
  __label_8: # else
# {
.annotate 'line', 7531
    isa $I1, $P1, [ 'IndexExpr' ]
    unless $I1 goto __label_13
# {
.annotate 'line', 7533
    $P1.'emit'(__ARG_1, $S2)
# }
    goto __label_14
  __label_13: # else
# {
.annotate 'line', 7536
# ireg: $S5
    null $S5
# switch
.annotate 'line', 7537
    set $S7, $S4
    set $S8, 'v'
    if $S7 == $S8 goto __label_17
    set $S8, ''
    if $S7 == $S8 goto __label_18
    goto __label_16
  __label_17: # case
.const 'Sub' $P3 = 'WSubId_1'
.annotate 'line', 7539
    getattribute $P2, self, 'start'
    $P3('Invalid initialization from void value', $P2)
  __label_18: # case
.annotate 'line', 7541
    $P4 = $P1.'emit_get'(__ARG_1)
    set $S5, $P4
    goto __label_15 # break
  __label_16: # default
.annotate 'line', 7544
    $P5 = self.'tempreg'($S4)
    set $S5, $P5
.annotate 'line', 7545
    $P1.'emit'(__ARG_1, $S5)
  __label_15: # switch end
.annotate 'line', 7547
    iseq $I1, $S3, 'S'
    unless $I1 goto __label_21
    iseq $I1, $S4, 'P'
  __label_21:
    unless $I1 goto __label_19
# {
.annotate 'line', 7548
# auxlabel: $S6
    $P2 = self.'genlabel'()
    null $S6
    if_null $P2, __label_22
    set $S6, $P2
  __label_22:
.annotate 'line', 7549
    __ARG_1.'emitnull'($S2)
.annotate 'line', 7550
    __ARG_1.'emitif_null'($S5, $S6)
.annotate 'line', 7551
    __ARG_1.'emitset'($S2, $S5)
.annotate 'line', 7552
    __ARG_1.'emitlabel'($S6)
# }
    goto __label_20
  __label_19: # else
.annotate 'line', 7555
    __ARG_1.'emitset'($S2, $S5)
  __label_20: # endif
# }
  __label_14: # endif
# }
  __label_9: # endif
# }
  __label_5: # endif
# }
.annotate 'line', 7559

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'DeclareSingleStatement' ]
.annotate 'line', 7487
    get_class $P1, [ 'DeclareBase' ]
    addparent $P0, $P1
.annotate 'line', 7489
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
.annotate 'line', 7574
    self.'DeclareBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 7575
    box $P3, __ARG_5
    setattribute self, 'arraytype', $P3
.annotate 'line', 7576
# var vdata: $P1
    getattribute $P3, self, 'name'
    $P1 = self.'createvar'($P3, 'P')
.annotate 'line', 7577
    $P4 = $P1.'getreg'()
    setattribute self, 'reg', $P4
.annotate 'line', 7578
# var t: $P2
    $P2 = __ARG_6.'get'()
.annotate 'line', 7579
    $P3 = $P2.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_1
# {
.annotate 'line', 7581
    __ARG_6.'unget'($P2)
.annotate 'line', 7582
.const 'Sub' $P5 = 'WSubId_30'
    $P4 = $P5(__ARG_6, self)
    setattribute self, 'size', $P4
.const 'Sub' $P6 = 'WSubId_43'
.annotate 'line', 7583
    $P6(']', __ARG_6)
# }
  __label_1: # endif
.annotate 'line', 7585
    $P2 = __ARG_6.'get'()
.annotate 'line', 7586
    $P3 = $P2.'isop'('=')
    if_null $P3, __label_2
    unless $P3 goto __label_2
# {
.annotate 'line', 7587
    $P2 = __ARG_6.'get'()
.annotate 'line', 7588
    $P3 = $P2.'isop'('[')
    isfalse $I1, $P3
    unless $I1 goto __label_4
.const 'Sub' $P7 = 'WSubId_29'
.annotate 'line', 7589
    $P7("array initializer", $P2)
  __label_4: # endif
.annotate 'line', 7590
    $P2 = __ARG_6.'get'()
.annotate 'line', 7591
    $P3 = $P2.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_5
# {
.annotate 'line', 7592
    __ARG_6.'unget'($P2)
.annotate 'line', 7593
.const 'Sub' $P8 = 'parseExpr'
.annotate 'line', 7594
.const 'Sub' $P9 = 'WSubId_27'
    $P4 = $P9(__ARG_6, self, $P8, ']')
    setattribute self, 'initarray', $P4
# }
  __label_5: # endif
# }
    goto __label_3
  __label_2: # else
.annotate 'line', 7598
    __ARG_6.'unget'($P2)
  __label_3: # endif
# }
.annotate 'line', 7599

.end # DeclareArrayStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7602
    getattribute $P1, self, 'size'
    if_null $P1, __label_1
.annotate 'line', 7603
    getattribute $P4, self, 'size'
    $P3 = $P4.'optimize'()
    setattribute self, 'size', $P3
  __label_1: # endif
.const 'Sub' $P5 = 'WSubId_28'
.annotate 'line', 7604
    getattribute $P1, self, 'initarray'
    $P5($P1)
.annotate 'line', 7605
    .return(self)
# }
.annotate 'line', 7606

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7609
    self.'annotate'(__ARG_1)
.annotate 'line', 7611
# var reg: $P1
    getattribute $P1, self, 'reg'
.annotate 'line', 7612
# var size: $P2
    getattribute $P2, self, 'size'
.annotate 'line', 7613
# var init: $P3
    getattribute $P3, self, 'initarray'
.annotate 'line', 7614
# var basetype: $P4
    getattribute $P4, self, 'basetype'
.annotate 'line', 7615
# arraytype: $S1
# predefined string
    getattribute $P6, self, 'arraytype'
    set $S4, $P6
    concat $S1, $S4, 'Array'
.annotate 'line', 7616
    if_null $P2, __label_1
# {
.annotate 'line', 7618
# regsize: $S2
    $P6 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P6, __label_3
    set $S2, $P6
  __label_3:
.annotate 'line', 7619
    __ARG_1.'say'('    ', 'new ', $P1, ", ['Fixed", $S1, "'], ", $S2)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 7623
    __ARG_1.'say'('    ', 'new ', $P1, ", ['Resizable", $S1, "']")
# }
  __label_2: # endif
.annotate 'line', 7625
    if_null $P3, __label_4
# {
.annotate 'line', 7626
# itemreg: $S3
    $P6 = self.'tempreg'($P4)
    null $S3
    if_null $P6, __label_5
    set $S3, $P6
  __label_5:
.annotate 'line', 7627
# n: $I1
# predefined elements
    elements $I1, $P3
.annotate 'line', 7628
    unless_null $P2, __label_6
# {
.annotate 'line', 7629
    le $I1, 0, __label_7
# {
.annotate 'line', 7631
    __ARG_1.'emitset'($P1, $I1)
# }
  __label_7: # endif
# }
  __label_6: # endif
.annotate 'line', 7634
# i: $I2
    null $I2
.annotate 'line', 7635
    iter $P7, $P3
    set $P7, 0
  __label_8: # for iteration
    unless $P7 goto __label_9
    shift $P5, $P7
# {
.annotate 'line', 7636
    $P5.'emit'(__ARG_1, $S3)
.annotate 'line', 7637
    __ARG_1.'say'('    ', $P1, '[', $I2, '] = ', $S3)
.annotate 'line', 7638
    inc $I2
# }
    goto __label_8
  __label_9: # endfor
# }
  __label_4: # endif
# }
.annotate 'line', 7641

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'DeclareArrayStatement' ]
.annotate 'line', 7564
    get_class $P1, [ 'DeclareBase' ]
    addparent $P0, $P1
.annotate 'line', 7566
    addattribute $P0, 'size'
.annotate 'line', 7567
    addattribute $P0, 'initarray'
.annotate 'line', 7568
    addattribute $P0, 'arraytype'
.end
.namespace [ ]

.sub 'parseDeclareHelper' :subid('WSubId_85')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 7648
# var next: $P1
    null $P1
.annotate 'line', 7649
# var r: $P2
    null $P2
  __label_1: # do
.annotate 'line', 7650
# {
.annotate 'line', 7651
# var name: $P3
    $P3 = __ARG_4.'get'()
.const 'Sub' $P6 = 'WSubId_80'
.annotate 'line', 7652
    $P6($P3)
.annotate 'line', 7653
# var t: $P4
    $P4 = __ARG_4.'get'()
.annotate 'line', 7654
# var item: $P5
    null $P5
.annotate 'line', 7655
    $P7 = $P4.'isop'('[')
    if_null $P7, __label_4
    unless $P7 goto __label_4
.annotate 'line', 7656
    $P5 = __ARG_2(__ARG_3, __ARG_5, __ARG_4, $P3)
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 7658
    __ARG_4.'unget'($P4)
.annotate 'line', 7659
    $P5 = __ARG_1(__ARG_3, __ARG_5, $P3, __ARG_4)
# }
  __label_5: # endif
.annotate 'line', 7661
.const 'Sub' $P8 = 'WSubId_84'
    $P2 = $P8($P2, $P5)
.annotate 'line', 7662
    $P1 = __ARG_4.'get'()
# }
  __label_3: # continue
.annotate 'line', 7663
    $P7 = $P1.'isop'(',')
    if_null $P7, __label_2
    if $P7 goto __label_1
  __label_2: # enddo
.const 'Sub' $P9 = 'WSubId_4'
.annotate 'line', 7664
    $P9(';', $P1)
.annotate 'line', 7665
    .return($P2)
# }
.annotate 'line', 7666

.end # parseDeclareHelper

.namespace [ 'IntStatement' ]

.sub 'IntStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7674
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'I', __ARG_4)
# }
.annotate 'line', 7675

.end # IntStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IntStatement' ]
.annotate 'line', 7670
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
.annotate 'line', 7682
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'I', 'Integer', __ARG_4)
# }
.annotate 'line', 7683

.end # IntArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IntArrayStatement' ]
.annotate 'line', 7678
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
.annotate 'line', 7689
    new $P2, [ 'IntStatement' ]
    $P2.'IntStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7690

.end # newIntSingle


.sub 'newIntArray'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7694
    new $P2, [ 'IntArrayStatement' ]
    $P2.'IntArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7695

.end # newIntArray


.sub 'parseInt' :subid('WSubId_38')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7699
.const 'Sub' $P1 = 'newIntSingle'
.const 'Sub' $P2 = 'newIntArray'
.annotate 'line', 7700
.const 'Sub' $P3 = 'WSubId_85'
    .tailcall $P3($P1, $P2, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7701

.end # parseInt

.namespace [ 'FloatStatement' ]

.sub 'FloatStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7709
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'N', __ARG_4)
# }
.annotate 'line', 7710

.end # FloatStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FloatStatement' ]
.annotate 'line', 7705
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
.annotate 'line', 7717
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'N', 'Float', __ARG_4)
# }
.annotate 'line', 7718

.end # FloatArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FloatArrayStatement' ]
.annotate 'line', 7713
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
.annotate 'line', 7724
    new $P2, [ 'FloatStatement' ]
    $P2.'FloatStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7725

.end # newFloatSingle


.sub 'newFloatArray'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7729
    new $P2, [ 'FloatArrayStatement' ]
    $P2.'FloatArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7730

.end # newFloatArray


.sub 'parseFloat' :subid('WSubId_39')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7734
.const 'Sub' $P1 = 'newFloatSingle'
.const 'Sub' $P2 = 'newFloatArray'
.annotate 'line', 7735
.const 'Sub' $P3 = 'WSubId_85'
    .tailcall $P3($P1, $P2, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7736

.end # parseFloat

.namespace [ 'StringStatement' ]

.sub 'StringStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7744
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'S', __ARG_4)
# }
.annotate 'line', 7745

.end # StringStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'StringStatement' ]
.annotate 'line', 7740
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
.annotate 'line', 7752
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'S', 'String', __ARG_4)
# }
.annotate 'line', 7753

.end # StringArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'StringArrayStatement' ]
.annotate 'line', 7748
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
.annotate 'line', 7759
    new $P2, [ 'StringStatement' ]
    $P2.'StringStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7760

.end # newStringSingle


.sub 'newStringArray'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7764
    new $P2, [ 'StringArrayStatement' ]
    $P2.'StringArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7765

.end # newStringArray


.sub 'parseString' :subid('WSubId_37')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7769
.const 'Sub' $P1 = 'newStringSingle'
.const 'Sub' $P2 = 'newStringArray'
.annotate 'line', 7770
.const 'Sub' $P3 = 'WSubId_85'
    .tailcall $P3($P1, $P2, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7771

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
.annotate 'line', 7787
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7788
    box $P1, __ARG_3
    setattribute self, 'type', $P1
.annotate 'line', 7789
    setattribute self, 'name', __ARG_4
.annotate 'line', 7790
    setattribute self, 'value', __ARG_5
.annotate 'line', 7791
    $P2 = self.'createconst'(__ARG_4, __ARG_3)
    setattribute self, 'data', $P2
# }
.annotate 'line', 7792

.end # ConstStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7795
# var value: $P1
    getattribute $P1, self, 'value'
.annotate 'line', 7796
# var name: $P2
    getattribute $P2, self, 'name'
.annotate 'line', 7797
# type: $S1
    getattribute $P3, self, 'type'
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 7798
    $P1 = $P1.'optimize'()
.annotate 'line', 7799
    $P3 = $P1.'hascompilevalue'()
    isfalse $I1, $P3
    unless $I1 goto __label_2
# {
.const 'Sub' $P4 = 'WSubId_1'
.annotate 'line', 7801
    getattribute $P5, self, 'start'
.annotate 'line', 7800
    $P4('Value for const is not evaluable at compile time', $P5)
# }
  __label_2: # endif
.annotate 'line', 7803
    getattribute $P3, self, 'data'
    $P3.'setvalue'($P1)
.annotate 'line', 7804
    .return(self)
# }
.annotate 'line', 7805

.end # optimize


.sub 'checkresult' :method
# Body
# {
.const 'Sub' $P1 = 'WSubId_6'
.annotate 'line', 7808
    getattribute $P2, self, 'start'
    $P1('Direct use of const', $P2)
# }
.annotate 'line', 7809

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7812
# predefined string
    getattribute $P1, self, 'name'
    set $S1, $P1
    concat $S2, 'Constant ', $S1
    concat $S2, $S2, ' evaluated at compile time'
    __ARG_1.'comment'($S2)
# }
.annotate 'line', 7813

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ConstStatement' ]
.annotate 'line', 7777
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7779
    addattribute $P0, 'type'
.annotate 'line', 7780
    addattribute $P0, 'name'
.annotate 'line', 7781
    addattribute $P0, 'data'
.annotate 'line', 7782
    addattribute $P0, 'value'
.end
.namespace [ ]

.sub 'parseConst' :subid('WSubId_34')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7818
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7819
# type: $S1
.const 'Sub' $P6 = 'WSubId_83'
    $P5 = $P6($P1)
    null $S1
    if_null $P5, __label_1
    set $S1, $P5
  __label_1:
.annotate 'line', 7820
    isne $I1, $S1, 'I'
    unless $I1 goto __label_4
    isne $I1, $S1, 'N'
  __label_4:
    unless $I1 goto __label_3
    isne $I1, $S1, 'S'
  __label_3:
    unless $I1 goto __label_2
.const 'Sub' $P7 = 'WSubId_1'
.annotate 'line', 7821
    $P7('Invalid type for const', __ARG_1)
  __label_2: # endif
.annotate 'line', 7823
# var multi: $P2
    null $P2
  __label_5: # do
.annotate 'line', 7824
# {
.annotate 'line', 7825
    $P1 = __ARG_2.'get'()
.annotate 'line', 7826
# var name: $P3
    set $P3, $P1
.const 'Sub' $P8 = 'WSubId_43'
.annotate 'line', 7827
    $P8('=', __ARG_2)
.annotate 'line', 7828
# var value: $P4
.const 'Sub' $P9 = 'WSubId_30'
    $P4 = $P9(__ARG_2, __ARG_3)
.annotate 'line', 7829
.const 'Sub' $P10 = 'WSubId_84'
.annotate 'line', 7830
    new $P11, [ 'ConstStatement' ]
    $P11.'ConstStatement'($P1, __ARG_3, $S1, $P3, $P4)
    set $P5, $P11
.annotate 'line', 7829
    $P2 = $P10($P2, $P5)
# }
  __label_7: # continue
.annotate 'line', 7831
    $P1 = __ARG_2.'get'()
    $P5 = $P1.'isop'(',')
    if_null $P5, __label_6
    if $P5 goto __label_5
  __label_6: # enddo
.annotate 'line', 7832
    .return($P2)
# }
.annotate 'line', 7833

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
.annotate 'line', 7844
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 7845
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7846
    $P2 = $P1.'isop'('=')
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 7847
.const 'Sub' $P5 = 'WSubId_30'
    $P4 = $P5(__ARG_2, self)
    setattribute self, 'init', $P4
.annotate 'line', 7848
    $P1 = __ARG_2.'get'()
# }
  __label_1: # endif
.const 'Sub' $P6 = 'WSubId_4'
.annotate 'line', 7850
    $P6(';', $P1)
# }
.annotate 'line', 7851

.end # VarStatement


.sub 'optimize_init' :method
# Body
# {
.annotate 'line', 7854
    getattribute $P1, self, 'init'
    if_null $P1, __label_1
.annotate 'line', 7855
    getattribute $P4, self, 'init'
    $P3 = $P4.'optimize'()
    setattribute self, 'init', $P3
  __label_1: # endif
.annotate 'line', 7856
    .return(self)
# }
.annotate 'line', 7857

.end # optimize_init


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7860
    .tailcall self.'optimize_init'()
# }
.annotate 'line', 7861

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7864
    self.'annotate'(__ARG_1)
.annotate 'line', 7865
# name: $S1
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 7866
# reg: $S2
    getattribute $P2, self, 'reg'
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 7867
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 7868
    concat $S4, 'var ', $S1
    concat $S4, $S4, ': '
    concat $S4, $S4, $S2
    __ARG_1.'comment'($S4)
.annotate 'line', 7869
    if_null $P1, __label_3
.annotate 'line', 7870
    $P2 = $P1.'isnull'()
    if_null $P2, __label_4
    unless $P2 goto __label_4
.annotate 'line', 7871
    null $P1
  __label_4: # endif
  __label_3: # endif
.annotate 'line', 7872
    if_null $P1, __label_5
# {
# switch
.annotate 'line', 7873
    $P2 = $P1.'checkresult'()
    set $S4, $P2
    set $S5, 'P'
    if $S4 == $S5 goto __label_9
    set $S5, 'S'
    if $S4 == $S5 goto __label_10
    set $S5, 'I'
    if $S4 == $S5 goto __label_11
    set $S5, 'N'
    if $S4 == $S5 goto __label_12
    set $S5, 'v'
    if $S4 == $S5 goto __label_13
    goto __label_8
  __label_9: # case
.annotate 'line', 7875
    isa $I1, $P1, [ 'MemberExpr' ]
    if $I1 goto __label_17
    isa $I1, $P1, [ 'ArrayExpr' ]
  __label_17:
    if $I1 goto __label_16
    isa $I1, $P1, [ 'NewExpr' ]
  __label_16:
    unless $I1 goto __label_14
.annotate 'line', 7876
    $P1.'emit_init'(__ARG_1, $S2)
    goto __label_15
  __label_14: # else
.annotate 'line', 7878
    $P1.'emit'(__ARG_1, $S2)
  __label_15: # endif
    goto __label_7 # break
  __label_10: # case
  __label_11: # case
  __label_12: # case
.annotate 'line', 7883
# value: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_18
    set $S3, $P3
  __label_18:
.annotate 'line', 7884
    __ARG_1.'emitbox'($S2, $S3)
    goto __label_7 # break
  __label_13: # case
.annotate 'line', 7885
.const 'Sub' $P4 = 'WSubId_1'
.annotate 'line', 7887
    getattribute $P5, self, 'name'
    $P4("Can't use void function as initializer", $P5)
  __label_8: # default
.const 'Sub' $P6 = 'WSubId_1'
.annotate 'line', 7889
    getattribute $P7, self, 'name'
    $P6("Invalid var initializer", $P7)
  __label_7: # switch end
# }
    goto __label_6
  __label_5: # else
.annotate 'line', 7893
    __ARG_1.'emitnull'($S2)
  __label_6: # endif
# }
.annotate 'line', 7894

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'VarStatement' ]
.annotate 'line', 7839
    get_class $P1, [ 'VarBaseStatement' ]
    addparent $P0, $P1
.annotate 'line', 7841
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
.annotate 'line', 7901
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.const 'Sub' $P1 = 'WSubId_43'
.annotate 'line', 7902
    $P1(';', __ARG_2)
# }
.annotate 'line', 7903

.end # ResizableVarStatement


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7906
    self.'annotate'(__ARG_1)
.annotate 'line', 7907
# reg: $S1
    getattribute $P1, self, 'reg'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7908
# predefined string
    getattribute $P1, self, 'name'
    set $S2, $P1
    concat $S3, 'var ', $S2
    concat $S3, $S3, '[] : '
    concat $S3, $S3, $S1
    __ARG_1.'comment'($S3)
.annotate 'line', 7909
    __ARG_1.'say'('    ', 'new ', $S1, ", 'ResizablePMCArray'")
# }
.annotate 'line', 7910

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ResizableVarStatement' ]
.annotate 'line', 7897
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
.annotate 'line', 7919
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 7920
.const 'Sub' $P3 = 'WSubId_30'
    $P2 = $P3(__ARG_2, self)
    setattribute self, 'exprsize', $P2
.const 'Sub' $P4 = 'WSubId_43'
.annotate 'line', 7921
    $P4(']', __ARG_2)
.const 'Sub' $P5 = 'WSubId_43'
.annotate 'line', 7922
    $P5(';', __ARG_2)
# }
.annotate 'line', 7923

.end # FixedVarStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7926
    getattribute $P3, self, 'exprsize'
    $P2 = $P3.'optimize'()
    setattribute self, 'exprsize', $P2
.annotate 'line', 7927
    .tailcall self.'optimize_init'()
# }
.annotate 'line', 7928

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7931
# regsize: $S1
    getattribute $P2, self, 'exprsize'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7932
    self.'annotate'(__ARG_1)
.annotate 'line', 7933
# reg: $S2
    getattribute $P1, self, 'reg'
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 7934
# predefined string
    getattribute $P1, self, 'name'
    set $S3, $P1
    concat $S4, 'var ', $S3
    concat $S4, $S4, '[] : '
    concat $S4, $S4, $S2
    __ARG_1.'comment'($S4)
.annotate 'line', 7935
    __ARG_1.'say'('    ', 'new ', $S2, ", 'FixedPMCArray', ", $S1)
# }
.annotate 'line', 7936

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FixedVarStatement' ]
.annotate 'line', 7913
    get_class $P1, [ 'VarStatement' ]
    addparent $P0, $P1
.annotate 'line', 7915
    addattribute $P0, 'exprsize'
.end
.namespace [ ]

.sub 'parseVar' :subid('WSubId_36')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param int __ARG_4 :optional
# Body
# {
.annotate 'line', 7941
# var name: $P1
    $P1 = __ARG_2.'get'()
.const 'Sub' $P3 = 'WSubId_80'
.annotate 'line', 7942
    $P3($P1)
.annotate 'line', 7943
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 7944
    $P4 = $P2.'isop'('[')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 7945
    $P2 = __ARG_2.'get'()
.annotate 'line', 7946
    $P4 = $P2.'isop'(']')
    if_null $P4, __label_3
    unless $P4 goto __label_3
.annotate 'line', 7947
    new $P6, [ 'ResizableVarStatement' ]
    $P6.'ResizableVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P5, $P6
    .return($P5)
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 7949
    __ARG_2.'unget'($P2)
.annotate 'line', 7950
    new $P5, [ 'FixedVarStatement' ]
    $P5.'FixedVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P4, $P5
    .return($P4)
# }
  __label_4: # endif
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 7954
    __ARG_2.'unget'($P2)
.annotate 'line', 7955
    new $P5, [ 'VarStatement' ]
    $P5.'VarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, __ARG_4)
    set $P4, $P5
    .return($P4)
# }
  __label_2: # endif
# }
.annotate 'line', 7957

.end # parseVar


.sub 'parseVolatile' :subid('WSubId_35')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7961
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7962
    $P2 = $P1.'iskeyword'('var')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.const 'Sub' $P3 = 'WSubId_1'
.annotate 'line', 7963
    $P3("invalid volatile type", $P1)
  __label_1: # endif
.annotate 'line', 7964
.const 'Sub' $P4 = 'WSubId_36'
    .tailcall $P4(__ARG_1, __ARG_2, __ARG_3, 1)
# }
.annotate 'line', 7965

.end # parseVolatile

.namespace [ 'CompoundStatement' ]

.sub 'CompoundStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7978
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7979
    root_new $P4, ['parrot';'Hash']
    setattribute self, 'labels', $P4
.annotate 'line', 7980
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'statements', $P4
.annotate 'line', 7981
# var t: $P1
    null $P1
  __label_2: # while
.annotate 'line', 7982
    $P1 = __ARG_2.'get'()
    $P3 = $P1.'isop'('}')
    isfalse $I1, $P3
    unless $I1 goto __label_1
# {
.annotate 'line', 7983
    __ARG_2.'unget'($P1)
.annotate 'line', 7984
# var c: $P2
.const 'Sub' $P6 = 'WSubId_81'
    $P2 = $P6(__ARG_2, self)
.annotate 'line', 7985
    unless_null $P2, __label_3
.const 'Sub' $P7 = 'WSubId_6'
.annotate 'line', 7986
    $P7('Unexpected null statement')
  __label_3: # endif
.annotate 'line', 7987
    getattribute $P3, self, 'statements'
# predefined push
    push $P3, $P2
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7989
    setattribute self, 'end', $P1
# }
.annotate 'line', 7990

.end # CompoundStatement


.sub 'getlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7993
# s: $S1
    set $P2, __ARG_1
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 7994
# var labels: $P1
    getattribute $P1, self, 'labels'
.annotate 'line', 7995
# exist: $S2
    $S2 = $P1[$S1]
.annotate 'line', 7996
    isnull $I1, $S2
    if $I1 goto __label_3
    iseq $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 7997
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getlabel'(__ARG_1)
    set $S2, $P2
  __label_2: # endif
.annotate 'line', 7998
    .return($S2)
# }
.annotate 'line', 7999

.end # getlabel


.sub 'createlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8002
# s: $S1
    set $P2, __ARG_1
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8003
# var labels: $P1
    getattribute $P1, self, 'labels'
.annotate 'line', 8004
# exist: $S2
    $S2 = $P1[$S1]
.annotate 'line', 8005
    isnull $I1, $S2
    not $I1
    unless $I1 goto __label_3
    isne $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
.const 'Sub' $P3 = 'WSubId_1'
.annotate 'line', 8006
    $P3('Label already defined', __ARG_1)
  __label_2: # endif
.annotate 'line', 8007
# value: $S3
    $P2 = self.'genlabel'()
    null $S3
    if_null $P2, __label_4
    set $S3, $P2
  __label_4:
.annotate 'line', 8008
    $P1[$S1] = $S3
.annotate 'line', 8009
    .return($S3)
# }
.annotate 'line', 8010

.end # createlabel


.sub 'getend' :method
# Body
# {
.annotate 'line', 8011
    getattribute $P1, self, 'end'
    .return($P1)
# }

.end # getend


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8014
    __ARG_1.'comment'('{')
.annotate 'line', 8015
    getattribute $P2, self, 'statements'
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
# {
.annotate 'line', 8016
    $P1.'emit'(__ARG_1)
.annotate 'line', 8017
    self.'freetemps'()
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 8019
    __ARG_1.'comment'('}')
# }
.annotate 'line', 8020

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CompoundStatement' ]
.annotate 'line', 7971
    get_class $P1, [ 'MultiStatementBase' ]
    addparent $P0, $P1
    get_class $P2, [ 'BlockStatement' ]
    addparent $P0, $P2
.annotate 'line', 7973
    addattribute $P0, 'end'
.annotate 'line', 7974
    addattribute $P0, 'labels'
.end
.namespace [ 'RegisterStore' ]

.sub 'RegisterStore' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8035
    box $P3, __ARG_1
    setattribute self, 'type', $P3
.annotate 'line', 8037
    box $P3, 1
    setattribute self, 'nreg', $P3
.annotate 'line', 8038
    new $P1, ['ResizableStringArray']
.annotate 'line', 8039
    new $P2, ['ResizableStringArray']
.annotate 'line', 8040
    setattribute self, 'tempreg', $P1
.annotate 'line', 8041
    setattribute self, 'freereg', $P2
# }
.annotate 'line', 8042

.end # RegisterStore


.sub 'createreg' :method
# Body
# {
.annotate 'line', 8045
# var n: $P1
    getattribute $P1, self, 'nreg'
.annotate 'line', 8046
# i: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 8047
# reg: $S1
    set $I2, $I1
    inc $I1
    set $S1, $I2
.annotate 'line', 8048
    assign $P1, $I1
# predefined string
.annotate 'line', 8049
    getattribute $P2, self, 'type'
.annotate 'line', 8044
    set $S2, $P2
.annotate 'line', 8049
    concat $S3, '$', $S2
    concat $S3, $S3, $S1
    .return($S3)
# }
.annotate 'line', 8050

.end # createreg


.sub 'tempreg' :method
# Body
# {
.annotate 'line', 8053
# var freereg: $P1
    getattribute $P1, self, 'freereg'
.annotate 'line', 8054
# var tempreg: $P2
    getattribute $P2, self, 'tempreg'
.annotate 'line', 8055
# reg: $S1
    null $S1
.annotate 'line', 8056
# predefined elements
    elements $I1, $P1
    le $I1, 0, __label_1
.annotate 'line', 8057
    $P3 = $P1.'pop'()
    set $S1, $P3
    goto __label_2
  __label_1: # else
.annotate 'line', 8059
    $P4 = self.'createreg'()
    set $S1, $P4
  __label_2: # endif
.annotate 'line', 8060
# predefined push
    push $P2, $S1
.annotate 'line', 8061
    .return($S1)
# }
.annotate 'line', 8062

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 8065
# var freereg: $P1
    getattribute $P1, self, 'freereg'
.annotate 'line', 8066
# var tempreg: $P2
    getattribute $P2, self, 'tempreg'
.annotate 'line', 8067
# n: $I1
# predefined elements
    elements $I1, $P2
# for loop
.annotate 'line', 8068
# i: $I2
    sub $I2, $I1, 1
  __label_3: # for condition
    lt $I2, 0, __label_2
# {
.annotate 'line', 8069
# s: $S1
    $S1 = $P2[$I2]
.annotate 'line', 8070
# predefined push
    push $P1, $S1
# }
  __label_1: # for iteration
.annotate 'line', 8068
    dec $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 8072
    assign $P2, 0
# }
.annotate 'line', 8073

.end # freetemps

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'RegisterStore' ]
.annotate 'line', 8029
    addattribute $P0, 'type'
.annotate 'line', 8030
    addattribute $P0, 'nreg'
.annotate 'line', 8031
    addattribute $P0, 'tempreg'
.annotate 'line', 8032
    addattribute $P0, 'freereg'
.end
.namespace [ 'ParameterModifierList' ]

.sub 'ParameterModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8084
    self.'ModifierList'(__ARG_1, __ARG_2)
# }
.annotate 'line', 8085

.end # ParameterModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 8088
# var named: $P1
    null $P1
.annotate 'line', 8089
# var slurpy: $P2
    null $P2
.annotate 'line', 8090
# var modarglist: $P3
    $P3 = self.'getlist'()
.annotate 'line', 8091
    iter $P6, $P3
    set $P6, 0
  __label_1: # for iteration
    unless $P6 goto __label_2
    shift $P4, $P6
# {
.annotate 'line', 8092
# modname: $S1
    $P7 = $P4.'getname'()
    null $S1
    if_null $P7, __label_3
    set $S1, $P7
  __label_3:
# switch
.annotate 'line', 8093
    set $S3, $S1
    set $S4, 'named'
    if $S3 == $S4 goto __label_6
    set $S4, 'slurpy'
    if $S3 == $S4 goto __label_7
    goto __label_5
  __label_6: # case
.annotate 'line', 8095
    set $P1, $P4
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 8098
    set $P2, $P4
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 8101
    __ARG_1.'print'(' :', $S1)
  __label_4: # switch end
# }
    goto __label_1
  __label_2: # endfor
# switch-case
.annotate 'line', 8105
    isnull $I1, $P1
    not $I1
    unless $I1 goto __label_11
    isnull $I1, $P2
    not $I1
  __label_11:
    if $I1 goto __label_10
.annotate 'line', 8112
    isnull $I1, $P1
    not $I1
    if $I1 goto __label_12
.annotate 'line', 8129
    isnull $I1, $P2
    not $I1
    if $I1 goto __label_13
    goto __label_9
  __label_10: # case
.annotate 'line', 8110
    __ARG_1.'print'(" :named :slurpy")
    goto __label_8 # break
  __label_12: # case
.annotate 'line', 8113
# setname: $S2
    null $S2
# switch
.annotate 'line', 8114
    $P7 = $P1.'numargs'()
    set $I2, $P7
    null $I3
    if $I2 == $I3 goto __label_16
    set $I3, 1
    if $I2 == $I3 goto __label_17
    goto __label_15
  __label_16: # case
.annotate 'line', 8116
    concat $S0, "'", __ARG_3
    concat $S0, $S0, "'"
    set $S2, $S0
    goto __label_14 # break
  __label_17: # case
.annotate 'line', 8119
# var argmod: $P5
    $P5 = $P1.'getarg'(0)
.annotate 'line', 8120
    $P8 = $P5.'isstringliteral'()
    isfalse $I4, $P8
    unless $I4 goto __label_18
.const 'Sub' $P9 = 'WSubId_1'
.annotate 'line', 8121
    $P9('Invalid modifier', __ARG_2)
  __label_18: # endif
.annotate 'line', 8122
    $P10 = $P5.'getPirString'()
    set $S2, $P10
    goto __label_14 # break
  __label_15: # default
.annotate 'line', 8123
.const 'Sub' $P11 = 'WSubId_1'
.annotate 'line', 8125
    $P11('Invalid modifier', __ARG_2)
  __label_14: # switch end
.annotate 'line', 8127
    __ARG_1.'print'(" :named(", $S2, ")")
    goto __label_8 # break
  __label_13: # case
.annotate 'line', 8130
    __ARG_1.'print'(" :slurpy")
    goto __label_8 # break
  __label_9: # default
  __label_8: # switch end
.annotate 'line', 8131
# }
.annotate 'line', 8133

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ParameterModifierList' ]
.annotate 'line', 8080
    get_class $P1, [ 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'FunctionParameter' ]

.sub 'FunctionParameter' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8143
    setattribute self, 'func', __ARG_1
.annotate 'line', 8144
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8145
# type: $S1
.const 'Sub' $P3 = 'WSubId_83'
    $P4 = $P1.'checkkeyword'()
    $P2 = $P3($P4)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8146
    eq $S1, '', __label_2
.annotate 'line', 8147
    $P1 = __ARG_2.'get'()
    goto __label_3
  __label_2: # else
.annotate 'line', 8149
    set $S1, 'P'
  __label_3: # endif
.annotate 'line', 8150
# argname: $S2
# predefined string
    $P2 = __ARG_1.'getparamnum'()
    set $S3, $P2
    concat $S2, '__ARG_', $S3
.annotate 'line', 8151
    __ARG_1.'createvarnamed'($P1, $S1, $S2)
.annotate 'line', 8153
# predefined string
    set $S3, $P1
    box $P2, $S3
    setattribute self, 'name', $P2
.annotate 'line', 8154
    $P1 = __ARG_2.'get'()
.annotate 'line', 8155
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_4
    unless $P2 goto __label_4
.annotate 'line', 8156
    new $P6, [ 'ParameterModifierList' ]
    getattribute $P7, __ARG_1, 'owner'
    $P6.'ParameterModifierList'(__ARG_2, $P7)
    set $P5, $P6
    setattribute self, 'modifiers', $P5
    goto __label_5
  __label_4: # else
.annotate 'line', 8158
    __ARG_2.'unget'($P1)
  __label_5: # endif
# }
.annotate 'line', 8159

.end # FunctionParameter


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8162
# var func: $P1
    getattribute $P1, self, 'func'
.annotate 'line', 8163
# paramname: $S1
    getattribute $P4, self, 'name'
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 8164
# var param: $P2
    $P2 = $P1.'getvar'($S1)
.annotate 'line', 8165
# ptype: $S2
.const 'Sub' $P5 = 'WSubId_86'
    $P6 = $P2.'gettype'()
    $P4 = $P5($P6)
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 8166
    $P4 = $P2.'getreg'()
    __ARG_1.'print'('        .param ', $S2, ' ', $P4)
.annotate 'line', 8167
# var modarg: $P3
    getattribute $P3, self, 'modifiers'
.annotate 'line', 8168
    if_null $P3, __label_3
.annotate 'line', 8169
    getattribute $P4, $P1, 'start'
    $P3.'emitmodifiers'(__ARG_1, $P4, $S1)
  __label_3: # endif
.annotate 'line', 8170
    __ARG_1.'say'('')
# }
.annotate 'line', 8171

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FunctionParameter' ]
.annotate 'line', 8138
    addattribute $P0, 'func'
.annotate 'line', 8139
    addattribute $P0, 'name'
.annotate 'line', 8140
    addattribute $P0, 'modifiers'
.end
.namespace [ ]

.sub 'parseParameter'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8176
    new $P2, [ 'FunctionParameter' ]
    $P2.'FunctionParameter'(__ARG_2, __ARG_1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8177

.end # parseParameter

.namespace [ 'FunctionModifierList' ]

.sub 'FunctionModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8187
    self.'ModifierList'(__ARG_1, __ARG_2)
# }
.annotate 'line', 8188

.end # FunctionModifierList


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8191
    $P3 = self.'getlist'()
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
# {
.annotate 'line', 8192
# nargmods: $I1
    $P5 = $P1.'numargs'()
    set $I1, $P5
.annotate 'line', 8193
    $P3 = $P1.'getname'()
    __ARG_1.'print'(' :', $P3)
.annotate 'line', 8194
    le $I1, 0, __label_3
# {
.annotate 'line', 8195
    __ARG_1.'print'('(')
# for loop
.annotate 'line', 8196
# iargmod: $I2
    null $I2
  __label_6: # for condition
    ge $I2, $I1, __label_5
# {
.annotate 'line', 8197
# var argmod: $P2
    $P2 = $P1.'getarg'($I2)
.annotate 'line', 8198
    $P3 = $P2.'isstringliteral'()
    isfalse $I3, $P3
    unless $I3 goto __label_7
.const 'Sub' $P6 = 'WSubId_1'
.annotate 'line', 8199
    getattribute $P5, $P2, 'start'
    $P6('Invalid modifier', $P5)
  __label_7: # endif
.annotate 'line', 8200
    $P3 = $P2.'getPirString'()
    __ARG_1.'print'($P3)
# }
  __label_4: # for iteration
.annotate 'line', 8196
    inc $I2
    goto __label_6
  __label_5: # for end
.annotate 'line', 8202
    __ARG_1.'print'(')')
# }
  __label_3: # endif
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 8205

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FunctionModifierList' ]
.annotate 'line', 8183
    get_class $P1, [ 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'FunctionBase' ]

.sub 'FunctionBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8227
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 8228
    box $P1, 0
    setattribute self, 'nlabel', $P1
.annotate 'line', 8229
    new $P3, [ 'RegisterStore' ]
    $P3.'RegisterStore'('I')
    set $P2, $P3
    setattribute self, 'regstI', $P2
.annotate 'line', 8230
    new $P3, [ 'RegisterStore' ]
    $P3.'RegisterStore'('N')
    set $P2, $P3
    setattribute self, 'regstN', $P2
.annotate 'line', 8231
    new $P3, [ 'RegisterStore' ]
    $P3.'RegisterStore'('S')
    set $P2, $P3
    setattribute self, 'regstS', $P2
.annotate 'line', 8232
    new $P3, [ 'RegisterStore' ]
    $P3.'RegisterStore'('P')
    set $P2, $P3
    setattribute self, 'regstP', $P2
# }
.annotate 'line', 8233

.end # FunctionBase


.sub 'getouter' :method
# Body
# {
.annotate 'line', 8235
    .return(self)
# }

.end # getouter


.sub 'makesubid' :method
# Body
# {
.annotate 'line', 8239
# var subid: $P1
    getattribute $P1, self, 'subid'
.annotate 'line', 8240
    unless_null $P1, __label_1
.annotate 'line', 8241
    $P1 = self.'generatesubid'()
    setattribute self, 'subid', $P1
  __label_1: # endif
.annotate 'line', 8242
    .return($P1)
# }
.annotate 'line', 8243

.end # makesubid


.sub 'same_scope_as' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8247
# r: $I1
    issame $I1, self, __ARG_1
.annotate 'line', 8248
    .return($I1)
# }
.annotate 'line', 8249

.end # same_scope_as


.sub 'parse_parameters' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8252
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8253
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 8254
    __ARG_1.'unget'($P1)
.annotate 'line', 8255
.const 'Sub' $P3 = 'parseParameter'
.annotate 'line', 8256
.const 'Sub' $P5 = 'WSubId_27'
    $P4 = $P5(__ARG_1, self, $P3, ')')
    setattribute self, 'params', $P4
# }
  __label_1: # endif
# }
.annotate 'line', 8258

.end # parse_parameters


.sub 'addlocalfunction' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8262
# var localfun: $P1
    getattribute $P1, self, 'localfun'
.annotate 'line', 8263
    unless_null $P1, __label_1
.annotate 'line', 8264
    root_new $P3, ['parrot';'ResizablePMCArray']
    push $P3, __ARG_1
    setattribute self, 'localfun', $P3
    goto __label_2
  __label_1: # else
.annotate 'line', 8266
# predefined push
    push $P1, __ARG_1
  __label_2: # endif
# }
.annotate 'line', 8267

.end # addlocalfunction


.sub 'usenamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8270
# var usedns: $P1
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 8271
    unless_null $P1, __label_1
# {
.annotate 'line', 8273
    root_new $P4, ['parrot';'ResizablePMCArray']
    push $P4, __ARG_1
    setattribute self, 'usednamespaces', $P4
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 8276
    iter $P6, $P1
    set $P6, 0
  __label_3: # for iteration
    unless $P6 goto __label_4
    shift $P2, $P6
.annotate 'line', 8277
    ne_addr __ARG_1, $P2, __label_5
.annotate 'line', 8278
    .return()
  __label_5: # endif
    goto __label_3
  __label_4: # endfor
.annotate 'line', 8279
# predefined push
    push $P1, __ARG_1
# }
  __label_2: # endif
# }
.annotate 'line', 8281

.end # usenamespace


.sub 'findsymbol' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8284
# var usedns: $P1
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 8285
    if_null $P1, __label_1
# {
.annotate 'line', 8286
# var found: $P2
    null $P2
.annotate 'line', 8287
    iter $P4, $P1
    set $P4, 0
  __label_2: # for iteration
    unless $P4 goto __label_3
    shift $P3, $P4
# {
.annotate 'line', 8288
    $P2 = $P3.'findsymbol'(__ARG_1)
.annotate 'line', 8289
    if_null $P2, __label_4
.annotate 'line', 8290
    .return($P2)
  __label_4: # endif
# }
    goto __label_2
  __label_3: # endfor
# }
  __label_1: # endif
.annotate 'line', 8293
    getattribute $P5, self, 'owner'
    .tailcall $P5.'findsymbol'(__ARG_1)
# }
.annotate 'line', 8294

.end # findsymbol


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8298
# var usedns: $P1
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 8299
    if_null $P1, __label_1
# {
.annotate 'line', 8300
    iter $P3, $P1
    set $P3, 0
  __label_2: # for iteration
    unless $P3 goto __label_3
    shift $P2, $P3
.annotate 'line', 8301
    $P2.'fixnamespaces'()
    goto __label_2
  __label_3: # endfor
# }
  __label_1: # endif
.annotate 'line', 8303
    getattribute $P6, self, 'body'
    $P5 = $P6.'optimize'()
    setattribute self, 'body', $P5
.annotate 'line', 8304
    .return(self)
# }
.annotate 'line', 8305

.end # optimize


.sub 'setusedlex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 8309
# var lexicals: $P1
    getattribute $P1, self, 'usedlexicals'
.annotate 'line', 8310
    unless_null $P1, __label_1
.annotate 'line', 8311
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'usedlexicals', $P1
  __label_1: # endif
.annotate 'line', 8312
    $P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 8313

.end # setusedlex


.sub 'setlex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 8316
# var lexicals: $P1
    getattribute $P1, self, 'lexicals'
.annotate 'line', 8317
    unless_null $P1, __label_1
.annotate 'line', 8318
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'lexicals', $P1
  __label_1: # endif
.annotate 'line', 8319
    $P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 8320

.end # setlex


.sub 'createlex' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8325
# var lex: $P1
    $P1 = __ARG_1.'getlex'()
.annotate 'line', 8326
# lexname: $S1
    null $S1
.annotate 'line', 8327
    if_null $P1, __label_1
.annotate 'line', 8328
    set $S1, $P1
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 8330
# reg: $S2
    $P2 = __ARG_1.'getreg'()
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
.annotate 'line', 8331
# lexnum: $I1
    $P2 = self.'getlexnum'()
    set $I1, $P2
.annotate 'line', 8332
# predefined string
    set $S3, $I1
    concat $S0, '__WLEX_', $S3
    set $S1, $S0
.annotate 'line', 8333
    self.'setlex'($S1, $S2)
.annotate 'line', 8334
    __ARG_1.'setlex'($S1)
# }
  __label_2: # endif
.annotate 'line', 8336
    .return($S1)
# }
.annotate 'line', 8337

.end # createlex


.sub 'createreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8341
# var store: $P1
    null $P1
# switch
.annotate 'line', 8342
    set $S2, __ARG_1
    set $S3, 'I'
    if $S2 == $S3 goto __label_3
    set $S3, 'N'
    if $S2 == $S3 goto __label_4
    set $S3, 'S'
    if $S2 == $S3 goto __label_5
    set $S3, 'P'
    if $S2 == $S3 goto __label_6
    goto __label_2
  __label_3: # case
.annotate 'line', 8344
    getattribute $P1, self, 'regstI'
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 8346
    getattribute $P1, self, 'regstN'
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 8348
    getattribute $P1, self, 'regstS'
    goto __label_1 # break
  __label_6: # case
.annotate 'line', 8350
    getattribute $P1, self, 'regstP'
    goto __label_1 # break
  __label_2: # default
.const 'Sub' $P2 = 'WSubId_6'
.annotate 'line', 8352
    concat $S4, 'Invalid type in createreg: ', __ARG_1
    $P2($S4)
  __label_1: # switch end
.annotate 'line', 8354
# reg: $S1
    $P3 = $P1.'createreg'()
    null $S1
    if_null $P3, __label_7
    set $S1, $P3
  __label_7:
.annotate 'line', 8355
    .return($S1)
# }
.annotate 'line', 8356

.end # createreg


.sub 'tempreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8359
# var store: $P1
    null $P1
# switch
.annotate 'line', 8360
    set $S2, __ARG_1
    set $S3, 'I'
    if $S2 == $S3 goto __label_3
    set $S3, 'N'
    if $S2 == $S3 goto __label_4
    set $S3, 'S'
    if $S2 == $S3 goto __label_5
    set $S3, 'P'
    if $S2 == $S3 goto __label_6
    goto __label_2
  __label_3: # case
.annotate 'line', 8362
    getattribute $P1, self, 'regstI'
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 8364
    getattribute $P1, self, 'regstN'
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 8366
    getattribute $P1, self, 'regstS'
    goto __label_1 # break
  __label_6: # case
.annotate 'line', 8368
    getattribute $P1, self, 'regstP'
    goto __label_1 # break
  __label_2: # default
.const 'Sub' $P2 = 'WSubId_6'
.annotate 'line', 8370
    concat $S4, "Invalid type '", __ARG_1
    concat $S4, $S4, "' in tempreg"
    $P2($S4)
  __label_1: # switch end
.annotate 'line', 8372
# reg: $S1
    $P3 = $P1.'tempreg'()
    null $S1
    if_null $P3, __label_7
    set $S1, $P3
  __label_7:
.annotate 'line', 8373
    .return($S1)
# }
.annotate 'line', 8374

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 8377
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
  __label_1: # for iteration
    unless $P8 goto __label_2
    shift $P1, $P8
.annotate 'line', 8378
    $P1.'freetemps'()
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 8379

.end # freetemps


.sub 'genlabel' :method
# Body
# {
.annotate 'line', 8382
# n: $I1
    getattribute $P2, self, 'nlabel'
    inc $P2
    set $P1, $P2
    set $I1, $P1
# predefined string
.annotate 'line', 8381
    set $S1, $I1
.annotate 'line', 8383
    concat $S2, '__label_', $S1
    .return($S2)
# }
.annotate 'line', 8384

.end # genlabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
# Body
# {
.const 'Sub' $P1 = 'WSubId_1'
.annotate 'line', 8387
    $P1('break not allowed here', __ARG_1)
# }
.annotate 'line', 8388

.end # getbreaklabel


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
# Body
# {
.const 'Sub' $P1 = 'WSubId_1'
.annotate 'line', 8391
    $P1('continue not allowed here', __ARG_1)
# }
.annotate 'line', 8392

.end # getcontinuelabel


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8396
# name: $S1
    getattribute $P9, self, 'name'
    null $S1
    if_null $P9, __label_1
    set $S1, $P9
  __label_1:
.annotate 'line', 8397
    __ARG_1.'say'()
.annotate 'line', 8398
    __ARG_1.'print'(".sub ")
.annotate 'line', 8399
    $P9 = self.'isanonymous'()
    if_null $P9, __label_2
    unless $P9 goto __label_2
.annotate 'line', 8400
    __ARG_1.'print'("'' :anon")
    goto __label_3
  __label_2: # else
.annotate 'line', 8402
    __ARG_1.'print'("'", $S1, "'")
  __label_3: # endif
.annotate 'line', 8403
    getattribute $P9, self, 'subid'
    if_null $P9, __label_4
.annotate 'line', 8404
    getattribute $P10, self, 'subid'
    __ARG_1.'print'(" :subid('", $P10, "')")
  __label_4: # endif
.annotate 'line', 8405
    getattribute $P9, self, 'outer'
    if_null $P9, __label_5
# {
.annotate 'line', 8406
# var outer: $P1
    getattribute $P1, self, 'outer'
.annotate 'line', 8407
# var outerid: $P2
    getattribute $P2, $P1, 'subid'
.annotate 'line', 8408
    if_null $P2, __label_6
.annotate 'line', 8409
    __ARG_1.'print'(" :outer('", $P2, "')")
  __label_6: # endif
# }
  __label_5: # endif
.annotate 'line', 8413
    $P9 = self.'ismethod'()
    if_null $P9, __label_7
    unless $P9 goto __label_7
.annotate 'line', 8414
    __ARG_1.'print'(' :method')
  __label_7: # endif
.annotate 'line', 8415
# var modifiers: $P3
    getattribute $P3, self, 'modifiers'
.annotate 'line', 8416
    if_null $P3, __label_8
.annotate 'line', 8417
    $P3.'emit'(__ARG_1)
    goto __label_9
  __label_8: # else
# {
.annotate 'line', 8419
    ne $S1, 'main', __label_10
.annotate 'line', 8420
    __ARG_1.'print'(' :main')
  __label_10: # endif
# }
  __label_9: # endif
.annotate 'line', 8422
    __ARG_1.'say'()
.const 'Sub' $P11 = 'WSubId_42'
.annotate 'line', 8425
    getattribute $P9, self, 'params'
    $P11(__ARG_1, $P9)
.annotate 'line', 8427
# var lexicals: $P4
    getattribute $P4, self, 'lexicals'
.annotate 'line', 8428
# var usedlexicals: $P5
    getattribute $P5, self, 'usedlexicals'
.annotate 'line', 8429
    isnull $I1, $P4
    not $I1
    if $I1 goto __label_12
    isnull $I1, $P5
    not $I1
  __label_12:
    unless $I1 goto __label_11
# {
.annotate 'line', 8430
    getattribute $P9, self, 'start'
    __ARG_1.'annotate'($P9)
.annotate 'line', 8432
    if_null $P4, __label_13
# {
.annotate 'line', 8433
    iter $P12, $P4
    set $P12, 0
  __label_14: # for iteration
    unless $P12 goto __label_15
    shift $S2, $P12
.annotate 'line', 8434
    $P9 = $P4[$S2]
    __ARG_1.'say'(".lex '", $P9, "', ", $S2)
    goto __label_14
  __label_15: # endfor
# }
  __label_13: # endif
.annotate 'line', 8437
    if_null $P5, __label_16
# {
.annotate 'line', 8438
    iter $P13, $P5
    set $P13, 0
  __label_17: # for iteration
    unless $P13 goto __label_18
    shift $S3, $P13
.annotate 'line', 8439
    $P9 = $P5[$S3]
    __ARG_1.'emitfind_lex'($S3, $P9)
    goto __label_17
  __label_18: # endfor
# }
  __label_16: # endif
# }
  __label_11: # endif
.annotate 'line', 8443
# var body: $P6
    getattribute $P6, self, 'body'
.annotate 'line', 8444
    $P9 = $P6.'isempty'()
    if_null $P9, __label_19
    unless $P9 goto __label_19
.annotate 'line', 8445
    __ARG_1.'comment'('Empty body')
    goto __label_20
  __label_19: # else
# {
.annotate 'line', 8447
    __ARG_1.'comment'('Body')
.annotate 'line', 8448
    $P6.'emit'(__ARG_1)
.annotate 'line', 8449
    $P9 = $P6.'getend'()
    __ARG_1.'annotate'($P9)
# }
  __label_20: # endif
.annotate 'line', 8451
    __ARG_1.'say'("\n.end # ", $S1, "\n")
.annotate 'line', 8454
# var localfun: $P7
    getattribute $P7, self, 'localfun'
.annotate 'line', 8455
    if_null $P7, __label_21
# {
.annotate 'line', 8456
    iter $P14, $P7
    set $P14, 0
  __label_22: # for iteration
    unless $P14 goto __label_23
    shift $P8, $P14
.annotate 'line', 8457
    $P8.'emit'(__ARG_1)
    goto __label_22
  __label_23: # endfor
# }
  __label_21: # endif
# }
.annotate 'line', 8459

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FunctionBase' ]
.annotate 'line', 8208
    get_class $P1, [ 'BlockStatement' ]
    addparent $P0, $P1
.annotate 'line', 8210
    addattribute $P0, 'name'
.annotate 'line', 8211
    addattribute $P0, 'subid'
.annotate 'line', 8212
    addattribute $P0, 'modifiers'
.annotate 'line', 8213
    addattribute $P0, 'params'
.annotate 'line', 8214
    addattribute $P0, 'body'
.annotate 'line', 8215
    addattribute $P0, 'regstI'
.annotate 'line', 8216
    addattribute $P0, 'regstN'
.annotate 'line', 8217
    addattribute $P0, 'regstS'
.annotate 'line', 8218
    addattribute $P0, 'regstP'
.annotate 'line', 8219
    addattribute $P0, 'nlabel'
.annotate 'line', 8220
    addattribute $P0, 'localfun'
.annotate 'line', 8221
    addattribute $P0, 'lexicals'
.annotate 'line', 8222
    addattribute $P0, 'usedlexicals'
.annotate 'line', 8223
    addattribute $P0, 'outer'
.end
.namespace [ 'FunctionStatement' ]

.sub 'FunctionStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8473
    self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 8474
    box $P1, 0
    setattribute self, 'paramnum', $P1
.annotate 'line', 8475
    box $P1, 0
    setattribute self, 'lexnum', $P1
.annotate 'line', 8476
    self.'parse'(__ARG_2)
# }
.annotate 'line', 8477

.end # FunctionStatement


.sub 'isanonymous' :method
# Body
# {
.annotate 'line', 8479
    .return(0)
# }

.end # isanonymous


.sub 'getparamnum' :method
# Body
# {
# predefined int
.annotate 'line', 8483
    getattribute $P1, self, 'paramnum'
    inc $P1
.annotate 'line', 8481
    set $I1, $P1
.annotate 'line', 8483
    .return($I1)
# }
.annotate 'line', 8484

.end # getparamnum


.sub 'getlexnum' :method
# Body
# {
# predefined int
.annotate 'line', 8488
    getattribute $P1, self, 'lexnum'
    inc $P1
.annotate 'line', 8486
    set $I1, $P1
.annotate 'line', 8488
    .return($I1)
# }
.annotate 'line', 8489

.end # getlexnum


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 8490
    .return(0)
# }

.end # ismethod


.sub 'parse' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8494
# var name: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8495
    setattribute self, 'name', $P1
.annotate 'line', 8496
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 8497
    $P5 = $P2.'isop'('[')
    if_null $P5, __label_1
    unless $P5 goto __label_1
# {
.annotate 'line', 8498
    new $P8, [ 'FunctionModifierList' ]
    getattribute $P9, self, 'owner'
    $P8.'FunctionModifierList'(__ARG_1, $P9)
    set $P7, $P8
    setattribute self, 'modifiers', $P7
.annotate 'line', 8499
    $P2 = __ARG_1.'get'()
# }
  __label_1: # endif
.const 'Sub' $P10 = 'WSubId_4'
.annotate 'line', 8501
    $P10('(', $P2)
.annotate 'line', 8502
    self.'parse_parameters'(__ARG_1)
.annotate 'line', 8504
# var fullname: $P3
    getattribute $P6, self, 'owner'
    $P5 = $P6.'getpath'()
# predefined clone
    clone $P3, $P5
.annotate 'line', 8505
    $P5 = $P1.'getidentifier'()
# predefined push
    push $P3, $P5
.annotate 'line', 8506
# var cfunction: $P4
    $P4 = self.'createconst'('__FUNCTION__', 'S')
.annotate 'line', 8507
    new $P6, [ 'StringLiteral' ]
.annotate 'line', 8508
    new $P8, [ 'TokenQuoted' ]
    getattribute $P9, $P1, 'file'
    getattribute $P11, $P1, 'line'
.annotate 'line', 8509
# predefined join
.annotate 'line', 8507
    join $S1, '.', $P3
    $P8.'TokenQuoted'($P9, $P11, $S1)
    set $P7, $P8
    $P6.'StringLiteral'(self, $P7)
    set $P5, $P6
    $P4.'setvalue'($P5)
.annotate 'line', 8511
    $P2 = __ARG_1.'get'()
.annotate 'line', 8512
    $P5 = $P2.'isop'('{')
    isfalse $I1, $P5
    unless $I1 goto __label_2
.const 'Sub' $P12 = 'WSubId_2'
.annotate 'line', 8513
    $P12('{', $P2)
  __label_2: # endif
.annotate 'line', 8514
    new $P7, [ 'CompoundStatement' ]
    $P7.'CompoundStatement'($P2, __ARG_1, self)
    set $P6, $P7
    setattribute self, 'body', $P6
.annotate 'line', 8515
    .return(self)
# }
.annotate 'line', 8516

.end # parse

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FunctionStatement' ]
.annotate 'line', 8466
    get_class $P1, [ 'FunctionBase' ]
    addparent $P0, $P1
.annotate 'line', 8468
    addattribute $P0, 'paramnum'
.annotate 'line', 8469
    addattribute $P0, 'lexnum'
.end
.namespace [ 'LocalFunctionStatement' ]

.sub 'LocalFunctionStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8527
    self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 8528
    $P4 = __ARG_3.'getouter'()
    setattribute self, 'outer', $P4
.annotate 'line', 8529
    getattribute $P3, self, 'outer'
    $P3.'makesubid'()
.annotate 'line', 8530
# var subid: $P1
    $P1 = self.'makesubid'()
.annotate 'line', 8531
    setattribute self, 'name', $P1
.annotate 'line', 8532
    self.'parse_parameters'(__ARG_2)
.annotate 'line', 8533
# var t: $P2
    $P2 = __ARG_2.'get'()
.const 'Sub' $P5 = 'WSubId_4'
.annotate 'line', 8534
    $P5('{', $P2)
.annotate 'line', 8535
    new $P6, [ 'CompoundStatement' ]
    $P6.'CompoundStatement'($P2, __ARG_2, self)
    set $P4, $P6
    setattribute self, 'body', $P4
.annotate 'line', 8536
    __ARG_3.'addlocalfunction'(self)
# }
.annotate 'line', 8537

.end # LocalFunctionStatement


.sub 'isanonymous' :method
# Body
# {
.annotate 'line', 8538
    .return(1)
# }

.end # isanonymous


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 8539
    .return(0)
# }

.end # ismethod


.sub 'getsubid' :method
# Body
# {
.annotate 'line', 8542
    getattribute $P1, self, 'subid'
    .return($P1)
# }
.annotate 'line', 8543

.end # getsubid


.sub 'getparamnum' :method
# Body
# {
.annotate 'line', 8547
    getattribute $P1, self, 'outer'
    .tailcall $P1.'getparamnum'()
# }
.annotate 'line', 8548

.end # getparamnum


.sub 'getlexnum' :method
# Body
# {
.annotate 'line', 8552
    getattribute $P1, self, 'outer'
    .tailcall $P1.'getlexnum'()
# }
.annotate 'line', 8553

.end # getlexnum


.sub 'getvar' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8556
# var r: $P1
    $P1 = self.'getlocalvar'(__ARG_1)
.annotate 'line', 8557
    unless_null $P1, __label_1
.annotate 'line', 8558
    $P1 = self.'getusedvar'(__ARG_1)
  __label_1: # endif
.annotate 'line', 8559
    unless_null $P1, __label_2
# {
.annotate 'line', 8562
    getattribute $P6, self, 'owner'
    $P1 = $P6.'getvar'(__ARG_1)
.annotate 'line', 8563
    unless_null $P1, __label_3
# {
.annotate 'line', 8565
    ne __ARG_1, 'self', __label_5
# {
.annotate 'line', 8566
# var ownerscope: $P2
    getattribute $P2, self, 'outer'
.annotate 'line', 8567
    getattribute $P7, self, 'outer'
    $P6 = $P7.'ismethod'()
    if_null $P6, __label_6
    unless $P6 goto __label_6
# {
.annotate 'line', 8568
# lexself: $S1
    $P8 = $P2.'makelexicalself'()
    null $S1
    if_null $P8, __label_7
    set $S1, $P8
  __label_7:
.annotate 'line', 8569
    $P1 = self.'createvar'(__ARG_1, 'P')
.annotate 'line', 8570
# reg: $S2
    $P6 = $P1.'getreg'()
    null $S2
    if_null $P6, __label_8
    set $S2, $P6
  __label_8:
.annotate 'line', 8571
    self.'setusedlex'($S1, $S2)
# }
  __label_6: # endif
# }
  __label_5: # endif
# }
    goto __label_4
  __label_3: # else
.annotate 'line', 8575
    $P6 = $P1.'gettype'()
    set $S5, $P6
    iseq $I2, $S5, 'P'
    unless $I2 goto __label_10
    $P7 = $P1.'isconst'()
    isfalse $I2, $P7
  __label_10:
    unless $I2 goto __label_9
# {
.annotate 'line', 8576
# var scope: $P3
    $P3 = $P1.'getscope'()
.annotate 'line', 8577
# var ownerscope: $P4
    $P4 = $P3.'getouter'()
.annotate 'line', 8578
# var outer: $P5
    getattribute $P5, self, 'outer'
.annotate 'line', 8579
    isa $I2, $P4, [ 'FunctionBase' ]
    unless $I2 goto __label_11
# {
.annotate 'line', 8580
    $P6 = $P4.'same_scope_as'($P5)
    if_null $P6, __label_12
    unless $P6 goto __label_12
# {
.annotate 'line', 8581
# lexname: $S3
    $P7 = $P3.'makelexical'($P1)
    null $S3
    if_null $P7, __label_13
    set $S3, $P7
  __label_13:
.annotate 'line', 8582
# flags: $I1
    $I2 = $P1.'getflags'()
    bor $I1, $I2, 2
.annotate 'line', 8583
    $P1 = self.'createvar'(__ARG_1, 'P', $I1)
.annotate 'line', 8584
    box $P6, $S3
    setattribute $P1, 'lexname', $P6
.annotate 'line', 8585
# reg: $S4
    $P6 = $P1.'getreg'()
    null $S4
    if_null $P6, __label_14
    set $S4, $P6
  __label_14:
.annotate 'line', 8586
    self.'setusedlex'($S3, $S4)
# }
  __label_12: # endif
# }
  __label_11: # endif
# }
  __label_9: # endif
  __label_4: # endif
# }
  __label_2: # endif
.annotate 'line', 8591
    isnull $I2, $P1
    not $I2
    unless $I2 goto __label_16
    isa $I3, $P1, [ 'VarData' ]
    not $I2, $I3
  __label_16:
    unless $I2 goto __label_15
.const 'Sub' $P9 = 'WSubId_6'
.annotate 'line', 8592
    $P9('Incorrect data for variable in LocalFunction')
  __label_15: # endif
.annotate 'line', 8593
    .return($P1)
# }
.annotate 'line', 8594

.end # getvar

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'LocalFunctionStatement' ]
.annotate 'line', 8523
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
.annotate 'line', 8605
    self.'FunctionStatement'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 8606

.end # MethodStatement


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 8607
    .return(1)
# }

.end # ismethod

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MethodStatement' ]
.annotate 'line', 8601
    get_class $P1, [ 'FunctionStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'SigParameter' ]

.sub 'SigParameter' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8621
# var name: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8622
    $P4 = $P1.'isidentifier'()
    isfalse $I1, $P4
    unless $I1 goto __label_1
.const 'Sub' $P5 = 'WSubId_3'
.annotate 'line', 8623
    $P5($P1)
  __label_1: # endif
.annotate 'line', 8624
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 8625
    $P4 = $P2.'isidentifier'()
    if_null $P4, __label_2
    unless $P4 goto __label_2
# {
.annotate 'line', 8626
# type: $S1
.const 'Sub' $P7 = 'WSubId_83'
    $P8 = $P1.'checkkeyword'()
    $P6 = $P7($P8)
    null $S1
    if_null $P6, __label_3
    set $S1, $P6
  __label_3:
.annotate 'line', 8627
    set $P1, $P2
.annotate 'line', 8628
    __ARG_2.'createvar'($P1, $S1)
.annotate 'line', 8629
    $P2 = __ARG_1.'get'()
# }
  __label_2: # endif
.annotate 'line', 8631
    setattribute self, 'name', $P1
.annotate 'line', 8632
# var data: $P3
    $P4 = $P1.'getidentifier'()
    $P3 = __ARG_2.'getvar'($P4)
.annotate 'line', 8633
    $P6 = $P3.'getreg'()
    setattribute self, 'reg', $P6
.annotate 'line', 8634
    $P4 = $P2.'isop'('[')
    if_null $P4, __label_4
    unless $P4 goto __label_4
.annotate 'line', 8635
    new $P9, [ 'ParameterModifierList' ]
    $P9.'ParameterModifierList'(__ARG_1, self)
    set $P8, $P9
    setattribute self, 'modifiers', $P8
    goto __label_5
  __label_4: # else
.annotate 'line', 8637
    __ARG_1.'unget'($P2)
  __label_5: # endif
# }
.annotate 'line', 8638

.end # SigParameter


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8641
    getattribute $P3, self, 'reg'
    __ARG_1.'print'($P3)
.annotate 'line', 8642
# var modifiers: $P1
    getattribute $P1, self, 'modifiers'
.annotate 'line', 8643
    if_null $P1, __label_1
# {
.annotate 'line', 8644
# var name: $P2
    getattribute $P2, self, 'name'
.annotate 'line', 8645
    $P1.'emitmodifiers'(__ARG_1, $P2, $P2)
# }
  __label_1: # endif
# }
.annotate 'line', 8647

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'SigParameter' ]
.annotate 'line', 8616
    addattribute $P0, 'name'
.annotate 'line', 8617
    addattribute $P0, 'modifiers'
.annotate 'line', 8618
    addattribute $P0, 'reg'
.end
.namespace [ ]

.sub 'parseSigParameter'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8652
    new $P2, [ 'SigParameter' ]
    $P2.'SigParameter'(__ARG_1, __ARG_2)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8653

.end # parseSigParameter

.namespace [ 'SigParameterList' ]

.sub 'SigParameterList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8660
.const 'Sub' $P1 = 'parseSigParameter'
.annotate 'line', 8661
.const 'Sub' $P4 = 'WSubId_27'
    $P3 = $P4(__ARG_1, __ARG_2, $P1, ')')
    setattribute self, 'params', $P3
# }
.annotate 'line', 8662

.end # SigParameterList


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8665
    __ARG_1.'print'('(')
.annotate 'line', 8666
# sep: $S1
    set $S1, ''
.annotate 'line', 8667
    getattribute $P2, self, 'params'
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
# {
.annotate 'line', 8668
    __ARG_1.'print'($S1)
.annotate 'line', 8669
    $P1.'emit'(__ARG_1)
.annotate 'line', 8670
    set $S1, ', '
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 8672
    __ARG_1.'print'(')')
# }
.annotate 'line', 8673

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'SigParameterList' ]
.annotate 'line', 8657
    addattribute $P0, 'params'
.end
.namespace [ 'MultiAssignStatement' ]

.sub 'MultiAssignStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8682
    setattribute self, 'params', __ARG_1
.annotate 'line', 8683
    setattribute self, 'expr', __ARG_2
# }
.annotate 'line', 8684

.end # MultiAssignStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8687
    getattribute $P3, self, 'expr'
    $P2 = $P3.'optimize'()
    setattribute self, 'expr', $P2
.annotate 'line', 8688
    .return(self)
# }
.annotate 'line', 8689

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8692
# var expr: $P1
    getattribute $P1, self, 'expr'
.annotate 'line', 8693
# var call: $P2
    $P2 = $P1.'emitcall'(__ARG_1)
.annotate 'line', 8694
    $P1.'prepareargs'(__ARG_1)
.annotate 'line', 8695
    __ARG_1.'print'('    ')
.annotate 'line', 8696
    getattribute $P3, self, 'params'
    $P3.'emit'(__ARG_1)
.annotate 'line', 8697
    __ARG_1.'print'(' = ', $P2)
.annotate 'line', 8698
    $P1.'emitargs'(__ARG_1)
.annotate 'line', 8699
    __ARG_1.'say'()
# }
.annotate 'line', 8700

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MultiAssignStatement' ]
.annotate 'line', 8678
    addattribute $P0, 'params'
.annotate 'line', 8679
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
.annotate 'line', 8717
    self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 8718

.end # ClassSpecifier


.sub 'reftype' :method
# Body
# {
.annotate 'line', 8719
    .return(0)
# }

.end # reftype


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8723
    getattribute $P1, self, 'start'
    __ARG_1.'annotate'($P1)
# }
.annotate 'line', 8724

.end # annotate

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassSpecifier' ]
.annotate 'line', 8713
    get_class $P1, [ 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'ClassSpecifierStr' ]

.sub 'ClassSpecifierStr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8732
    self.'ClassSpecifier'(__ARG_1, __ARG_2)
.annotate 'line', 8733
    setattribute self, 'name', __ARG_2
# }
.annotate 'line', 8734

.end # ClassSpecifierStr


.sub 'reftype' :method
# Body
# {
.annotate 'line', 8735
    .return(1)
# }

.end # reftype


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8739
# basestr: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 8740
    __ARG_1.'print'($S1)
# }
.annotate 'line', 8741

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassSpecifierStr' ]
.annotate 'line', 8727
    get_class $P1, [ 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 8729
    addattribute $P0, 'name'
.end
.namespace [ 'ClassSpecifierParrotKey' ]

.sub 'ClassSpecifierParrotKey' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8750
    self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 8751
# var key: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 8752
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 8753
    $P3 = $P2.'isstring'()
    isfalse $I1, $P3
    unless $I1 goto __label_1
.const 'Sub' $P4 = 'WSubId_29'
.annotate 'line', 8754
    $P4('literal string', $P2)
  __label_1: # endif
.annotate 'line', 8755
    $P3 = $P2.'rawstring'()
# predefined push
    push $P1, $P3
.annotate 'line', 8756
    $P2 = __ARG_1.'get'()
.annotate 'line', 8757
    $P3 = $P2.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_2
# {
# switch
.annotate 'line', 8758
    $P5 = $P2.'checkop'()
    set $S1, $P5
    set $S2, ':'
    if $S1 == $S2 goto __label_5
    set $S2, ','
    if $S1 == $S2 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 8760
    box $P6, 1
    setattribute self, 'hll', $P6
  __label_6: # case
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 8762
.const 'Sub' $P7 = 'WSubId_31'
.annotate 'line', 8764
    $P7('token in class key', $P2)
  __label_3: # switch end
  __label_7: # do
.annotate 'line', 8766
# {
.annotate 'line', 8767
    $P2 = __ARG_1.'get'()
.annotate 'line', 8768
    $P3 = $P2.'isstring'()
    isfalse $I1, $P3
    unless $I1 goto __label_10
.const 'Sub' $P8 = 'WSubId_29'
.annotate 'line', 8769
    $P8('literal string', $P2)
  __label_10: # endif
.annotate 'line', 8770
    $P3 = $P2.'rawstring'()
# predefined push
    push $P1, $P3
# }
  __label_9: # continue
.annotate 'line', 8771
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'(',')
    if_null $P3, __label_8
    if $P3 goto __label_7
  __label_8: # enddo
.const 'Sub' $P9 = 'WSubId_4'
.annotate 'line', 8772
    $P9(']', $P2)
# }
  __label_2: # endif
.annotate 'line', 8774
    setattribute self, 'key', $P1
# }
.annotate 'line', 8775

.end # ClassSpecifierParrotKey


.sub 'reftype' :method
# Body
# {
.annotate 'line', 8776
    .return(2)
# }

.end # reftype


.sub 'hasHLL' :method
# Body
# {
# predefined int
.annotate 'line', 8779
    getattribute $P1, self, 'hll'
    isnull $I1, $P1
    not $I1
    .return($I1)
# }
.annotate 'line', 8780

.end # hasHLL


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8784
.const 'Sub' $P2 = 'WSubId_47'
    getattribute $P3, self, 'key'
    $P1 = $P2($P3)
    __ARG_1.'print'($P1)
# }
.annotate 'line', 8785

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassSpecifierParrotKey' ]
.annotate 'line', 8744
    get_class $P1, [ 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 8746
    addattribute $P0, 'key'
.annotate 'line', 8747
    addattribute $P0, 'hll'
.end
.namespace [ 'ClassSpecifierId' ]

.sub 'ClassSpecifierId' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8793
    self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 8794
# var key: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
# predefined string
    set $S1, __ARG_3
    box $P3, $S1
    push $P1, $P3
.annotate 'line', 8795
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 8796
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 8797
    $P2 = __ARG_1.'get'()
.annotate 'line', 8798
# predefined string
    set $S1, $P2
# predefined push
    push $P1, $S1
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 8800
    __ARG_1.'unget'($P2)
.annotate 'line', 8801
    setattribute self, 'key', $P1
# }
.annotate 'line', 8802

.end # ClassSpecifierId


.sub 'reftype' :method
# Body
# {
.annotate 'line', 8803
    .return(3)
# }

.end # reftype


.sub 'last' :method
# Body
# {
.annotate 'line', 8807
# var key: $P1
    getattribute $P1, self, 'key'
.annotate 'line', 8808
    $P2 = $P1[-1]
    .return($P2)
# }
.annotate 'line', 8809

.end # last


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8813
# var key: $P1
    getattribute $P2, self, 'key'
    $P1 = __ARG_2.'findclasskey'($P2)
.annotate 'line', 8814
    unless_null $P1, __label_1
# {
.annotate 'line', 8815
    $P2 = self.'dowarnings'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.const 'Sub' $P3 = 'WSubId_55'
.annotate 'line', 8816
    getattribute $P4, self, 'key'
# predefined join
    join $S1, ".", $P4
    concat $S2, "class ", $S1
    concat $S2, $S2, " not found at compile time"
    $P3($S2)
  __label_3: # endif
.annotate 'line', 8817
.const 'Sub' $P5 = 'WSubId_47'
    getattribute $P4, self, 'key'
    $P2 = $P5($P4)
    __ARG_1.'print'($P2)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 8819
    $P2 = $P1.'getclasskey'()
    __ARG_1.'print'($P2)
  __label_2: # endif
# }
.annotate 'line', 8820

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassSpecifierId' ]
.annotate 'line', 8788
    get_class $P1, [ 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 8790
    addattribute $P0, 'key'
.end
.namespace [ ]

.sub 'parseClassSpecifier' :subid('WSubId_49')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8825
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8826
    $P2 = $P1.'isstring'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 8827
    new $P4, [ 'ClassSpecifierStr' ]
    $P4.'ClassSpecifierStr'(__ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_1: # endif
.annotate 'line', 8828
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 8829
    new $P4, [ 'ClassSpecifierParrotKey' ]
    $P4.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_2: # endif
.annotate 'line', 8830
    $P2 = $P1.'isidentifier'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 8831
    new $P4, [ 'ClassSpecifierId' ]
    $P4.'ClassSpecifierId'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_3: # endif
.const 'Sub' $P5 = 'WSubId_1'
.annotate 'line', 8832
    $P5('Invalid class', $P1)
# }
.annotate 'line', 8833

.end # parseClassSpecifier

.namespace [ 'ClassBase' ]

.sub 'ClassBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8845
    self.'initbase'(__ARG_1, __ARG_3)
.annotate 'line', 8846
    setattribute self, 'name', __ARG_2
.annotate 'line', 8847
# var classns: $P1
    $P2 = __ARG_3.'getpath'()
# predefined clone
    clone $P1, $P2
.annotate 'line', 8848
    getattribute $P2, self, 'name'
# predefined push
    push $P1, $P2
.annotate 'line', 8849
    setattribute self, 'classns', $P1
# }
.annotate 'line', 8850

.end # ClassBase


.sub 'getclasskey' :method
# Body
# {
.annotate 'line', 8853
.const 'Sub' $P1 = 'WSubId_47'
    getattribute $P2, self, 'classns'
    .tailcall $P1($P2)
# }
.annotate 'line', 8854

.end # getclasskey

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassBase' ]
.annotate 'line', 8839
    get_class $P1, [ 'CommonBase' ]
    addparent $P0, $P1
.annotate 'line', 8841
    addattribute $P0, 'name'
.annotate 'line', 8842
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
.annotate 'line', 8867
    self.'ClassBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 8868
    setattribute self, 'parent', __ARG_3
.annotate 'line', 8869
# var functions: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 8870
    setattribute self, 'functions', $P1
.annotate 'line', 8871
# var members: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 8872
    setattribute self, 'members', $P2
.annotate 'line', 8873
# var constants: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 8874
    setattribute self, 'constants', $P3
.annotate 'line', 8876
# var t: $P4
    $P4 = __ARG_4.'get'()
.annotate 'line', 8877
    $P9 = $P4.'isop'(':')
    if_null $P9, __label_1
    unless $P9 goto __label_1
# {
.const 'Sub' $P8 = "WSubId_49"
.annotate 'line', 8879
.const 'Sub' $P11 = 'WSubId_27'
    $P10 = $P11(__ARG_4, self, $P8)
    setattribute self, 'bases', $P10
.annotate 'line', 8880
    $P4 = __ARG_4.'get'()
# }
  __label_1: # endif
.const 'Sub' $P12 = 'WSubId_4'
.annotate 'line', 8882
    $P12('{', $P4)
# for loop
.annotate 'line', 8883
    $P4 = __ARG_4.'get'()
  __label_4: # for condition
    $P9 = $P4.'isop'('}')
    isfalse $I1, $P9
    unless $I1 goto __label_3
# {
# switch
.annotate 'line', 8884
    $P10 = $P4.'checkkeyword'()
    set $S1, $P10
    set $S2, 'function'
    if $S1 == $S2 goto __label_7
    set $S2, 'var'
    if $S1 == $S2 goto __label_8
    set $S2, 'const'
    if $S1 == $S2 goto __label_9
    goto __label_6
  __label_7: # case
.annotate 'line', 8886
# var f: $P5
    new $P5, [ 'MethodStatement' ]
    $P5.'MethodStatement'($P4, __ARG_4, self)
.annotate 'line', 8887
# predefined push
    push $P1, $P5
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 8890
# var name: $P6
    $P6 = __ARG_4.'get'()
.annotate 'line', 8891
    $P13 = $P6.'isidentifier'()
    isfalse $I2, $P13
    unless $I2 goto __label_10
.const 'Sub' $P14 = 'WSubId_29'
.annotate 'line', 8892
    $P14("member identifier", $P6)
  __label_10: # endif
.annotate 'line', 8893
# predefined push
    push $P2, $P6
.annotate 'line', 8894
    $P4 = __ARG_4.'get'()
.annotate 'line', 8895
    $P15 = $P4.'isop'(';')
    isfalse $I3, $P15
    unless $I3 goto __label_11
.const 'Sub' $P16 = 'WSubId_29'
.annotate 'line', 8896
    $P16("';' in member declaration", $P4)
  __label_11: # endif
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 8899
# var cst: $P7
.const 'Sub' $P17 = 'WSubId_34'
    $P7 = $P17($P4, __ARG_4, self)
.annotate 'line', 8900
# predefined push
    push $P3, $P7
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 8901
.const 'Sub' $P18 = 'WSubId_31'
.annotate 'line', 8903
    $P18("item in class", $P4)
  __label_5: # switch end
# }
  __label_2: # for iteration
.annotate 'line', 8883
    $P4 = __ARG_4.'get'()
    goto __label_4
  __label_3: # for end
# }
.annotate 'line', 8906

.end # ClassStatement


.sub 'getpath' :method
# Body
# {
.annotate 'line', 8909
    getattribute $P1, self, 'classns'
    .return($P1)
# }
.annotate 'line', 8910

.end # getpath


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 8913
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 8914

.end # generatesubid


.sub 'findsymbol' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8917
    getattribute $P1, self, 'parent'
    .tailcall $P1.'findsymbol'(__ARG_1)
# }
.annotate 'line', 8918

.end # findsymbol


.sub 'findclasskey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8921
    getattribute $P1, self, 'parent'
    .tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 8922

.end # findclasskey


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8925
    getattribute $P1, self, 'parent'
    .tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 8926

.end # checkclass


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8929
    getattribute $P1, self, 'owner'
    .tailcall $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 8930

.end # use_predef


.sub 'optimize' :method
# Body
# {
.const 'Sub' $P1 = 'WSubId_28'
.annotate 'line', 8933
    getattribute $P2, self, 'constants'
    $P1($P2)
.const 'Sub' $P3 = 'WSubId_28'
.annotate 'line', 8934
    getattribute $P2, self, 'functions'
    $P3($P2)
.annotate 'line', 8935
    .return(self)
# }
.annotate 'line', 8936

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8939
# var classns: $P1
    getattribute $P1, self, 'classns'
.annotate 'line', 8940
.const 'Sub' $P6 = 'WSubId_87'
    $P5 = $P6($P1)
    __ARG_1.'say'($P5)
.const 'Sub' $P7 = 'WSubId_42'
.annotate 'line', 8941
    getattribute $P5, self, 'functions'
    $P7(__ARG_1, $P5)
.annotate 'line', 8943
    __ARG_1.'say'('.sub Winxed_class_init :anon :load :init')
.annotate 'line', 8945
    $P5 = self.'getclasskey'()
    __ARG_1.'say'('    ', 'newclass $P0, ', $P5)
.annotate 'line', 8946
# n: $I1
    set $I1, 1
.annotate 'line', 8947
# var bases: $P2
    getattribute $P2, self, 'bases'
.annotate 'line', 8948
    if_null $P2, __label_1
# {
.annotate 'line', 8949
    getattribute $P5, self, 'bases'
    iter $P8, $P5
    set $P8, 0
  __label_2: # for iteration
    unless $P8 goto __label_3
    shift $P3, $P8
# {
.annotate 'line', 8950
    $P3.'annotate'(__ARG_1)
.annotate 'line', 8951
# reg: $S1
    set $I2, $I1
    inc $I1
    set $S2, $I2
    concat $S1, "$P", $S2
.annotate 'line', 8952
    __ARG_1.'print'('    ', 'get_class ', $S1, ', ')
.annotate 'line', 8953
    getattribute $P5, self, 'parent'
    $P3.'emit'(__ARG_1, $P5)
.annotate 'line', 8954
    __ARG_1.'say'()
.annotate 'line', 8955
    __ARG_1.'say'('    ', 'addparent $P0, ', $S1)
# }
    goto __label_2
  __label_3: # endfor
# }
  __label_1: # endif
.annotate 'line', 8958
    getattribute $P5, self, 'members'
    iter $P9, $P5
    set $P9, 0
  __label_4: # for iteration
    unless $P9 goto __label_5
    shift $P4, $P9
# {
.annotate 'line', 8959
    __ARG_1.'annotate'($P4)
.annotate 'line', 8960
    __ARG_1.'say'('    ', "addattribute $P0, '", $P4, "'")
# }
    goto __label_4
  __label_5: # endfor
.annotate 'line', 8963
    __ARG_1.'say'('.end')
# }
.annotate 'line', 8964

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassStatement' ]
.annotate 'line', 8857
    get_class $P1, [ 'ClassBase' ]
    addparent $P0, $P1
    get_class $P2, [ 'VarContainer' ]
    addparent $P0, $P2
.annotate 'line', 8859
    addattribute $P0, 'parent'
.annotate 'line', 8860
    addattribute $P0, 'bases'
.annotate 'line', 8861
    addattribute $P0, 'constants'
.annotate 'line', 8862
    addattribute $P0, 'functions'
.annotate 'line', 8863
    addattribute $P0, 'members'
.end
.namespace [ 'DeclareClassStatement' ]

.sub 'DeclareClassStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8971
    self.'ClassBase'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 8972

.end # DeclareClassStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8975
    .return(self)
# }
.annotate 'line', 8976

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'DeclareClassStatement' ]
.annotate 'line', 8967
    get_class $P1, [ 'ClassBase' ]
    addparent $P0, $P1
.end
.namespace [ ]

.sub 'parseClass' :subid('WSubId_88')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8984
# var name: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8985
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 8986
    $I1 = $P2.'isop'(';')
    if $I1 goto __label_3
    $I1 = $P2.'isop'('.')
  __label_3:
    unless $I1 goto __label_1
# {
# for loop
  __label_6: # for condition
.annotate 'line', 8987
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_5
    unless $P3 goto __label_5
# {
.annotate 'line', 8988
# predefined string
    set $S1, $P1
    __ARG_3 = __ARG_3.'declarenamespace'($P1, $S1)
.annotate 'line', 8989
    $P1 = __ARG_2.'get'()
# }
  __label_4: # for iteration
.annotate 'line', 8987
    $P2 = __ARG_2.'get'()
    goto __label_6
  __label_5: # for end
.const 'Sub' $P4 = 'WSubId_4'
.annotate 'line', 8991
    $P4(';', $P2)
.annotate 'line', 8992
    new $P5, [ 'DeclareClassStatement' ]
    $P5.'DeclareClassStatement'(__ARG_1, $P1, __ARG_3)
    set $P3, $P5
    __ARG_3.'declareclass'($P3)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 8995
    __ARG_2.'unget'($P2)
.annotate 'line', 8996
    new $P5, [ 'ClassStatement' ]
    $P5.'ClassStatement'(__ARG_1, $P1, __ARG_3, __ARG_2)
    set $P3, $P5
    __ARG_3.'addclass'($P3)
# }
  __label_2: # endif
# }
.annotate 'line', 8998

.end # parseClass


.sub 'include_parrot' :subid('WSubId_90')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9006
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9007
    $P7 = $P1.'isstring'()
    isfalse $I4, $P7
    unless $I4 goto __label_1
.const 'Sub' $P8 = 'WSubId_29'
.annotate 'line', 9008
    $P8('literal string', $P1)
  __label_1: # endif
.const 'Sub' $P9 = 'WSubId_43'
.annotate 'line', 9009
    $P9(';', __ARG_2)
.annotate 'line', 9010
# filename: $S1
    $P7 = $P1.'rawstring'()
    null $S1
    if_null $P7, __label_2
    set $S1, $P7
  __label_2:
.annotate 'line', 9011
# var interp: $P2
# predefined getinterp
    getinterp $P2
# Constant IGLOBALS_LIB_PATHS evaluated at compile time
# Constant PARROT_LIB_PATH_INCLUDE evaluated at compile time
.annotate 'line', 9016
# var libpaths: $P3
    $P3 = $P2[9]
.annotate 'line', 9017
# var paths: $P4
    $P4 = $P3[0]
.annotate 'line', 9018
# var file: $P5
    new $P5, [ 'FileHandle' ]
.annotate 'line', 9019
    iter $P10, $P4
    set $P10, 0
  __label_3: # for iteration
    unless $P10 goto __label_4
    shift $S2, $P10
# {
.annotate 'line', 9020
# filepath: $S3
    concat $S3, $S2, $S1
.annotate 'line', 9021
# try: create handler
    new $P7, 'ExceptionHandler'
    set_label $P7, __label_5
    push_eh $P7
# try: begin
# {
.annotate 'line', 9022
    $P5.'open'($S3, 'r')
    goto __label_4 # break
.annotate 'line', 9023
# }
# try: end
    pop_eh
    goto __label_6
.annotate 'line', 9021
# catch
  __label_5:
    .get_results($P11)
    finalize $P11
    pop_eh
# catch end
  __label_6:
# }
    goto __label_3
  __label_4: # endfor
.annotate 'line', 9028
    $P7 = $P5.'is_closed'()
    if_null $P7, __label_7
    unless $P7 goto __label_7
.const 'Sub' $P12 = 'WSubId_1'
.annotate 'line', 9029
    $P12('File not found', $P1)
  __label_7: # endif
# Constant MACRO_CONST evaluated at compile time
# for loop
.annotate 'line', 9034
# line: $S4
    $P7 = $P5.'readline'()
    null $S4
    if_null $P7, __label_11
    set $S4, $P7
  __label_11:
  __label_10: # for condition
    $P11 = $P5.'eof'()
    isfalse $I4, $P11
    unless $I4 goto __label_9
# {
.annotate 'line', 9035
# predefined substr
    substr $S8, $S4, 0, 12
    ne $S8, '.macro_const', __label_12
# {
.annotate 'line', 9036
# pos: $I1
    set $I1, 12
.annotate 'line', 9037
# c: $S5
    null $S5
  __label_14: # while
.annotate 'line', 9038
# predefined substr
    substr $S5, $S4, $I1, 1
    iseq $I4, $S5, " "
    if $I4 goto __label_15
    iseq $I4, $S5, "\t"
  __label_15:
    unless $I4 goto __label_13
.annotate 'line', 9039
    inc $I1
    goto __label_14
  __label_13: # endwhile
.annotate 'line', 9040
# pos2: $I2
    set $I2, $I1
  __label_17: # while
.annotate 'line', 9041
# predefined substr
    substr $S5, $S4, $I2, 1
    isne $I4, $S5, " "
    unless $I4 goto __label_21
    isne $I4, $S5, "\t"
  __label_21:
    unless $I4 goto __label_20
.annotate 'line', 9042
    isne $I4, $S5, "\n"
  __label_20:
    unless $I4 goto __label_19
    isne $I4, $S5, "\r"
  __label_19:
    unless $I4 goto __label_18
    isne $I4, $S5, ""
  __label_18:
    unless $I4 goto __label_16
.annotate 'line', 9043
    inc $I2
    goto __label_17
  __label_16: # endwhile
.annotate 'line', 9044
    ne $I2, $I1, __label_22
    goto __label_8 # continue
  __label_22: # endif
.annotate 'line', 9046
# name: $S6
    sub $I4, $I2, $I1
# predefined substr
    substr $S6, $S4, $I1, $I4
  __label_24: # while
.annotate 'line', 9047
# predefined substr
    substr $S5, $S4, $I2, 1
    iseq $I4, $S5, " "
    if $I4 goto __label_25
    iseq $I4, $S5, "\t"
  __label_25:
    unless $I4 goto __label_23
.annotate 'line', 9048
    inc $I2
    goto __label_24
  __label_23: # endwhile
.annotate 'line', 9049
    set $I1, $I2
  __label_27: # while
.annotate 'line', 9050
# predefined substr
    substr $S5, $S4, $I2, 1
    isne $I4, $S5, " "
    unless $I4 goto __label_31
    isne $I4, $S5, "\t"
  __label_31:
    unless $I4 goto __label_30
.annotate 'line', 9051
    isne $I4, $S5, "\n"
  __label_30:
    unless $I4 goto __label_29
    isne $I4, $S5, "\r"
  __label_29:
    unless $I4 goto __label_28
    isne $I4, $S5, ""
  __label_28:
    unless $I4 goto __label_26
.annotate 'line', 9052
    inc $I2
    goto __label_27
  __label_26: # endwhile
.annotate 'line', 9053
    ne $I2, $I1, __label_32
    goto __label_8 # continue
  __label_32: # endif
.annotate 'line', 9055
# value: $S7
    sub $I4, $I2, $I1
# predefined substr
    substr $S7, $S4, $I1, $I4
.annotate 'line', 9057
# ivalue: $I3
    null $I3
.annotate 'line', 9058
# predefined substr
    substr $S8, $S7, 0, 2
    iseq $I4, $S8, '0x'
    if $I4 goto __label_35
# predefined substr
    substr $S9, $S7, 0, 2
    iseq $I4, $S9, '0X'
  __label_35:
    unless $I4 goto __label_33
.annotate 'line', 9059
# predefined substr
    substr $S10, $S7, 2
    box $P11, $S10
    $P7 = $P11.'to_int'(16)
    set $I3, $P7
    goto __label_34
  __label_33: # else
.annotate 'line', 9061
    set $I3, $S7
  __label_34: # endif
.annotate 'line', 9062
# var cst: $P6
    $P6 = __ARG_3.'createconst'($S6, 'I', 4)
.annotate 'line', 9063
.const 'Sub' $P13 = 'WSubId_16'
.annotate 'line', 9064
    new $P14, [ 'TokenInteger' ]
    getattribute $P15, __ARG_1, 'file'
    getattribute $P16, __ARG_1, 'line'
    $P14.'TokenInteger'($P15, $P16, $S6)
    set $P11, $P14
.annotate 'line', 9063
    $P7 = $P13(__ARG_3, $P11, $I3)
    $P6.'setvalue'($P7)
# }
  __label_12: # endif
# }
  __label_8: # for iteration
.annotate 'line', 9034
    $P7 = $P5.'readline'()
    set $S4, $P7
    goto __label_10
  __label_9: # for end
.annotate 'line', 9068
    $P5.'close'()
# }
.annotate 'line', 9069

.end # include_parrot


.sub 'parsensUsing' :subid('WSubId_89')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9075
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9076
    $P8 = $P1.'iskeyword'('namespace')
    if_null $P8, __label_1
    unless $P8 goto __label_1
# {
.annotate 'line', 9077
# var nskey: $P2
.const 'Sub' $P9 = 'WSubId_44'
    $P2 = $P9(__ARG_2)
.annotate 'line', 9078
# nelems: $I1
# predefined elements
    elements $I1, $P2
.annotate 'line', 9079
    ge $I1, 1, __label_2
.const 'Sub' $P10 = 'WSubId_1'
.annotate 'line', 9080
    $P10('Unsupported', $P1)
  __label_2: # endif
.const 'Sub' $P11 = 'WSubId_43'
.annotate 'line', 9081
    $P11(';', __ARG_2)
.annotate 'line', 9082
# var nssym: $P3
    $P3 = __ARG_3.'findns'($P2)
.annotate 'line', 9083
    unless_null $P3, __label_3
.const 'Sub' $P12 = 'WSubId_1'
.annotate 'line', 9084
    $P12('unknown namespace', $P1)
  __label_3: # endif
.annotate 'line', 9085
    __ARG_3.'usenamespace'($P3)
.annotate 'line', 9086
    .return()
# }
  __label_1: # endif
.annotate 'line', 9088
    $P8 = $P1.'iskeyword'('extern')
    isfalse $I3, $P8
    unless $I3 goto __label_4
# {
.annotate 'line', 9089
    __ARG_2.'unget'($P1)
.annotate 'line', 9090
# var key: $P4
.const 'Sub' $P13 = 'WSubId_44'
    $P4 = $P13(__ARG_2)
.annotate 'line', 9091
# nelems: $I2
# predefined elements
    elements $I2, $P4
.annotate 'line', 9092
    ge $I2, 1, __label_5
.const 'Sub' $P14 = 'WSubId_1'
.annotate 'line', 9093
    $P14('Unsupported at namespace level', $P1)
  __label_5: # endif
.const 'Sub' $P15 = 'WSubId_43'
.annotate 'line', 9094
    $P15(';', __ARG_2)
.annotate 'line', 9095
    __ARG_3.'use'($P4)
.annotate 'line', 9096
    .return()
# }
  __label_4: # endif
.annotate 'line', 9098
    $P1 = __ARG_2.'get'()
# switch-case
.annotate 'line', 9100
    $I3 = $P1.'isstring'()
    if $I3 goto __label_8
.annotate 'line', 9106
    $I3 = $P1.'isidentifier'()
    if $I3 goto __label_9
    goto __label_7
  __label_8: # case
.annotate 'line', 9102
# reqlib: $S1
    set $P8, $P1
    null $S1
    if_null $P8, __label_10
    set $S1, $P8
  __label_10:
.annotate 'line', 9103
    __ARG_3.'addlib'($S1)
.const 'Sub' $P16 = 'WSubId_43'
.annotate 'line', 9104
    $P16(';', __ARG_2)
    goto __label_6 # break
  __label_9: # case
.annotate 'line', 9107
    __ARG_2.'unget'($P1)
.annotate 'line', 9108
# var module: $P5
.const 'Sub' $P17 = 'WSubId_44'
    $P5 = $P17(__ARG_2)
.annotate 'line', 9109
    $P1 = __ARG_2.'get'()
.annotate 'line', 9110
    $P18 = $P1.'isop'(';')
    isfalse $I4, $P18
    unless $I4 goto __label_11
# {
.annotate 'line', 9111
    __ARG_2.'unget'($P1)
.const 'Sub' $P7 = "WSubId_46"
.annotate 'line', 9113
# var names: $P6
.const 'Sub' $P19 = 'WSubId_27'
    null $P8
    $P6 = $P19(__ARG_2, $P8, $P7, ';')
.annotate 'line', 9114
    __ARG_3.'addextern'($P5, $P6)
# }
  __label_11: # endif
.annotate 'line', 9116
# reqmodule: $S2
# predefined join
    join $S3, '/', $P5
    concat $S2, '"', $S3
    concat $S2, $S2, '.pbc"'
.annotate 'line', 9117
    __ARG_3.'addload'($S2)
    goto __label_6 # break
  __label_7: # default
.annotate 'line', 9118
.const 'Sub' $P20 = 'WSubId_29'
.annotate 'line', 9120
    $P20('string literal or identifier', $P1)
  __label_6: # switch end
# }
.annotate 'line', 9122

.end # parsensUsing

.namespace [ 'External' ]

.sub 'External' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9132
    setattribute self, 'module', __ARG_1
.annotate 'line', 9133
    setattribute self, 'names', __ARG_2
# }
.annotate 'line', 9134

.end # External


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9139
    __ARG_1.'say'(".sub 'importextern' :anon :load :init\n    .local pmc ex, curns, srcns, symbols\n    ex = new ['Exporter']\n    curns = get_namespace\n    symbols = new ['ResizableStringArray']\n")
.annotate 'line', 9147
    __ARG_1.'print'("    srcns = get_root_namespace ['parrot'; '")
.annotate 'line', 9148
    getattribute $P1, self, 'module'
# predefined join
    join $S2, "'; '", $P1
    __ARG_1.'print'($S2)
.annotate 'line', 9149
    __ARG_1.'say'("']")
.annotate 'line', 9150
    getattribute $P1, self, 'names'
    iter $P2, $P1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $S1, $P2
.annotate 'line', 9151
    __ARG_1.'say'("    push symbols, '", $S1, "'")
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9152
    __ARG_1.'say'("    ex.'destination'(curns)\n    ex.'import'(srcns :named('source'), curns :named('destination'), symbols :named('globals'))\n.end\n")
# }
.annotate 'line', 9158

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'External' ]
.annotate 'line', 9128
    addattribute $P0, 'module'
.annotate 'line', 9129
    addattribute $P0, 'names'
.end
.namespace [ 'NamespaceBase' ]

.sub 'NamespaceBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9177
    setattribute self, 'nspath', __ARG_1
.annotate 'line', 9178
    unless_null __ARG_2, __label_1
# {
.annotate 'line', 9179
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'namespaces', $P2
.annotate 'line', 9180
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'usednamespaces', $P2
.annotate 'line', 9181
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'classes', $P2
.annotate 'line', 9182
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'functions', $P2
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 9185
    getattribute $P2, __ARG_2, 'locals'
    setattribute self, 'locals', $P2
.annotate 'line', 9186
    getattribute $P2, __ARG_2, 'namespaces'
    setattribute self, 'namespaces', $P2
.annotate 'line', 9187
    getattribute $P2, __ARG_2, 'usednamespaces'
    setattribute self, 'usednamespaces', $P2
.annotate 'line', 9188
    getattribute $P2, __ARG_2, 'classes'
    setattribute self, 'classes', $P2
.annotate 'line', 9189
    getattribute $P2, __ARG_2, 'functions'
    setattribute self, 'functions', $P2
# }
  __label_2: # endif
.annotate 'line', 9191
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'items', $P2
# }
.annotate 'line', 9192

.end # NamespaceBase


.sub 'fixnamespaces' :method
# Body
# {
.annotate 'line', 9195
# var ns: $P1
    null $P1
.annotate 'line', 9196
    getattribute $P3, self, 'namespaces'
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
.annotate 'line', 9197
    $P1.'fixnamespaces'()
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9198
    getattribute $P3, self, 'usednamespaces'
    iter $P5, $P3
    set $P5, 0
  __label_3: # for iteration
    unless $P5 goto __label_4
    shift $P1, $P5
.annotate 'line', 9199
    getattribute $P6, $P1, 'usednamespaces'
    iter $P7, $P6
    set $P7, 0
  __label_5: # for iteration
    unless $P7 goto __label_6
    shift $P2, $P7
.annotate 'line', 9200
    self.'usenamespace'($P2)
    goto __label_5
  __label_6: # endfor
    goto __label_3
  __label_4: # endfor
# }
.annotate 'line', 9201

.end # fixnamespaces


.sub 'getpath' :method
# Body
# {
.annotate 'line', 9204
    getattribute $P1, self, 'nspath'
    .return($P1)
# }
.annotate 'line', 9205

.end # getpath


.sub 'usenamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9208
    ne_addr __ARG_1, self, __label_1
.annotate 'line', 9209
    .return()
  __label_1: # endif
.annotate 'line', 9210
# var usednamespaces: $P1
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 9211
    iter $P3, $P1
    set $P3, 0
  __label_2: # for iteration
    unless $P3 goto __label_3
    shift $P2, $P3
.annotate 'line', 9212
    ne_addr $P2, __ARG_1, __label_4
.annotate 'line', 9213
    .return()
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
.annotate 'line', 9214
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 9215

.end # usenamespace


.sub 'use' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9218
# var sym: $P1
    $P1 = self.'findsymbol'(__ARG_1)
.annotate 'line', 9219
    if_null $P1, __label_1
# {
.annotate 'line', 9220
    isa $I1, $P1, [ 'FunctionStatement' ]
    unless $I1 goto __label_3
.annotate 'line', 9221
    getattribute $P3, self, 'functions'
# predefined push
    push $P3, $P1
  __label_3: # endif
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 9224
# name: $S1
    $P3 = __ARG_1.'pop'()
    null $S1
    if_null $P3, __label_4
    set $S1, $P3
  __label_4:
.annotate 'line', 9225
# var ns: $P2
    $P2 = self.'findns'(__ARG_1)
.annotate 'line', 9226
    if_null $P2, __label_5
# {
.annotate 'line', 9227
    $P1 = $P2.'getvar'($S1)
.annotate 'line', 9228
    if_null $P1, __label_6
.annotate 'line', 9229
    self.'createvarused'($S1, $P1)
  __label_6: # endif
# }
  __label_5: # endif
# }
  __label_2: # endif
# }
.annotate 'line', 9232

.end # use


.sub 'getusedns' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9235
    getattribute $P2, self, 'usednamespaces'
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 9236
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
.annotate 'line', 9237
    .return($P1)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
    null $P2
.annotate 'line', 9238
    .return($P2)
# }
.annotate 'line', 9239

.end # getusedns


.sub 'getlocalns' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9242
    getattribute $P2, self, 'namespaces'
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 9243
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
.annotate 'line', 9244
    .return($P1)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9245
    .tailcall self.'getusedns'(__ARG_1)
# }
.annotate 'line', 9246

.end # getlocalns


.sub 'addextern' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9250
# var ext: $P1
    new $P1, [ 'External' ]
    $P1.'External'(__ARG_1, __ARG_2)
.annotate 'line', 9251
# var externals: $P2
    getattribute $P2, self, 'externals'
.annotate 'line', 9252
    unless_null $P2, __label_1
.annotate 'line', 9253
    root_new $P4, ['parrot';'ResizablePMCArray']
    push $P4, $P1
    set $P2, $P4
    setattribute self, 'externals', $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 9255
# predefined push
    push $P2, $P1
  __label_2: # endif
# }
.annotate 'line', 9256

.end # addextern


.sub 'checkclass_base' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9260
# var classes: $P1
    getattribute $P1, self, 'classes'
.annotate 'line', 9261
# var cl: $P2
    null $P2
.annotate 'line', 9262
    iter $P4, $P1
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
.annotate 'line', 9263
    getattribute $P5, $P2, 'name'
    set $S1, $P5
    ne $S1, __ARG_1, __label_3
.annotate 'line', 9264
    .return($P2)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9265
    getattribute $P5, self, 'usednamespaces'
    iter $P6, $P5
    set $P6, 0
  __label_4: # for iteration
    unless $P6 goto __label_5
    shift $P3, $P6
.annotate 'line', 9266
    $P2 = $P3.'checkclass_base'(__ARG_1)
    if_null $P2, __label_6
.annotate 'line', 9267
    .return($P2)
  __label_6: # endif
    goto __label_4
  __label_5: # endfor
    null $P5
.annotate 'line', 9268
    .return($P5)
# }
.annotate 'line', 9269

.end # checkclass_base


.sub 'findclasskey_base' :method
        .param pmc __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 9274
# nelems: $I1
# predefined elements
    elements $I1, __ARG_1
# switch
.annotate 'line', 9275
    sub $I2, $I1, __ARG_2
    null $I3
    if $I2 == $I3 goto __label_3
    set $I3, 1
    if $I2 == $I3 goto __label_4
    goto __label_2
  __label_3: # case
    null $P3
.annotate 'line', 9277
    .return($P3)
  __label_4: # case
.annotate 'line', 9280
    sub $I4, $I1, 1
    $P4 = __ARG_1[$I4]
    .tailcall self.'checkclass_base'($P4)
  __label_2: # default
.annotate 'line', 9285
# basename: $S1
    $S1 = __ARG_1[__ARG_2]
.annotate 'line', 9286
# var ns: $P1
    $P1 = self.'getlocalns'($S1)
.annotate 'line', 9287
    if_null $P1, __label_5
# {
.annotate 'line', 9288
# var found: $P2
    add $I5, __ARG_2, 1
    $P2 = $P1.'findclasskey'(__ARG_1, $I5)
.annotate 'line', 9289
    if_null $P2, __label_6
.annotate 'line', 9290
    .return($P2)
  __label_6: # endif
# }
  __label_5: # endif
  __label_1: # switch end
    null $P3
.annotate 'line', 9293
    .return($P3)
# }
.annotate 'line', 9294

.end # findclasskey_base


.sub 'findsymbolbyname' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9297
# var sym: $P1
    $P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 9298
    if_null $P1, __label_1
.annotate 'line', 9299
    .return($P1)
  __label_1: # endif
.annotate 'line', 9300
    getattribute $P2, self, 'functions'
    iter $P3, $P2
    set $P3, 0
  __label_2: # for iteration
    unless $P3 goto __label_3
    shift $P1, $P3
.annotate 'line', 9301
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_4
.annotate 'line', 9302
    .return($P1)
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
    null $P2
.annotate 'line', 9303
    .return($P2)
# }
.annotate 'line', 9304

.end # findsymbolbyname


.sub 'findlocalsymbol' :method
        .param pmc __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 9309
# nelems: $I1
# predefined elements
    elements $I1, __ARG_1
.annotate 'line', 9310
# name: $S1
    null $S1
.annotate 'line', 9311
# var sym: $P1
    null $P1
.annotate 'line', 9312
# var ns: $P2
    null $P2
# switch
.annotate 'line', 9313
    sub $I2, $I1, __ARG_2
    null $I3
    if $I2 == $I3 goto __label_3
    set $I3, 1
    if $I2 == $I3 goto __label_4
    goto __label_2
  __label_3: # case
    null $P3
.annotate 'line', 9315
    .return($P3)
  __label_4: # case
.annotate 'line', 9317
    sub $I4, $I1, 1
    $S1 = __ARG_1[$I4]
.annotate 'line', 9319
    $P1 = self.'findsymbolbyname'($S1)
    if_null $P1, __label_5
.annotate 'line', 9320
    .return($P1)
  __label_5: # endif
.annotate 'line', 9321
    getattribute $P4, self, 'usednamespaces'
    iter $P5, $P4
    set $P5, 0
  __label_6: # for iteration
    unless $P5 goto __label_7
    shift $P2, $P5
.annotate 'line', 9322
    $P1 = $P2.'findsymbolbyname'($S1)
    if_null $P1, __label_8
.annotate 'line', 9323
    .return($P1)
  __label_8: # endif
    goto __label_6
  __label_7: # endfor
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 9329
    $S1 = __ARG_1[__ARG_2]
.annotate 'line', 9330
    $P2 = self.'getlocalns'($S1)
.annotate 'line', 9331
    isnull $I5, $P2
    not $I5
    unless $I5 goto __label_10
.annotate 'line', 9332
    add $I6, __ARG_2, 1
    $P1 = $P2.'findlocalsymbol'(__ARG_1, $I6)
    isnull $I5, $P1
    not $I5
  __label_10:
    unless $I5 goto __label_9
.annotate 'line', 9333
    .return($P1)
  __label_9: # endif
.annotate 'line', 9334
    $P2 = self.'getusedns'($S1)
.annotate 'line', 9335
    isnull $I7, $P2
    not $I7
    unless $I7 goto __label_12
.annotate 'line', 9336
    add $I8, __ARG_2, 1
    $P1 = $P2.'findlocalsymbol'(__ARG_1, $I8)
    isnull $I7, $P1
    not $I7
  __label_12:
    unless $I7 goto __label_11
.annotate 'line', 9337
    .return($P1)
  __label_11: # endif
  __label_1: # switch end
    null $P3
.annotate 'line', 9339
    .return($P3)
# }
.annotate 'line', 9340

.end # findlocalsymbol


.sub 'findlocalns' :method
        .param pmc __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 9343
# nelems: $I1
# predefined elements
    elements $I1, __ARG_1
# switch
.annotate 'line', 9344
    sub $I2, $I1, __ARG_2
    null $I3
    if $I2 == $I3 goto __label_3
    goto __label_2
  __label_3: # case
    null $P2
.annotate 'line', 9346
    .return($P2)
  __label_2: # default
.annotate 'line', 9348
# name: $S1
    $S1 = __ARG_1[__ARG_2]
.annotate 'line', 9349
# var ns: $P1
    $P1 = self.'getlocalns'($S1)
.annotate 'line', 9350
    if_null $P1, __label_4
# {
.annotate 'line', 9351
    sub $I4, $I1, __ARG_2
    ne $I4, 1, __label_5
.annotate 'line', 9352
    .return($P1)
    goto __label_6
  __label_5: # else
.annotate 'line', 9354
    add $I5, __ARG_2, 1
    .tailcall $P1.'findlocalns'(__ARG_1, $I5)
  __label_6: # endif
# }
  __label_4: # endif
  __label_1: # switch end
    null $P2
.annotate 'line', 9357
    .return($P2)
# }
.annotate 'line', 9358

.end # findlocalns


.sub 'declarenamespace' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 9361
# var child: $P1
    new $P1, [ 'NamespaceStatement' ]
    null $P2
    $P1.'NamespaceStatement'(self, __ARG_1, $P2, __ARG_2, $P2)
.annotate 'line', 9362
    getattribute $P2, self, 'namespaces'
# predefined push
    push $P2, $P1
.annotate 'line', 9363
    .return($P1)
# }
.annotate 'line', 9364

.end # declarenamespace


.sub 'childnamespace' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9367
# var existns: $P1
    $P1 = self.'getlocalns'(__ARG_2)
.annotate 'line', 9368
# var child: $P2
    new $P2, [ 'NamespaceStatement' ]
    $P2.'NamespaceStatement'(self, __ARG_1, $P1, __ARG_2, __ARG_3)
.annotate 'line', 9369
    getattribute $P3, self, 'namespaces'
# predefined push
    push $P3, $P2
.annotate 'line', 9370
    getattribute $P3, self, 'items'
# predefined push
    push $P3, $P2
.annotate 'line', 9371
    .return($P2)
# }
.annotate 'line', 9372

.end # childnamespace


.sub 'declareclass' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9375
    getattribute $P1, self, 'classes'
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 9376

.end # declareclass


.sub 'addclass' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9379
    getattribute $P1, self, 'classes'
# predefined push
    push $P1, __ARG_1
.annotate 'line', 9380
    getattribute $P1, self, 'items'
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 9381

.end # addclass


.sub 'parsenamespace' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9384
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9385
# name: $S1
    set $P4, $P1
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 9386
    $P1 = __ARG_2.'get'()
.annotate 'line', 9388
# var modifier: $P2
    null $P2
.annotate 'line', 9389
    $P4 = $P1.'isop'('[')
    if_null $P4, __label_2
    unless $P4 goto __label_2
# {
.annotate 'line', 9390
    new $P5, [ 'ModifierList' ]
    $P5.'ModifierList'(__ARG_2, self)
    set $P2, $P5
.annotate 'line', 9391
    $P1 = __ARG_2.'get'()
# }
  __label_2: # endif
.const 'Sub' $P6 = 'WSubId_4'
.annotate 'line', 9394
    $P6('{', $P1)
.annotate 'line', 9395
# var child: $P3
    $P3 = self.'childnamespace'(__ARG_1, $S1, $P2)
.annotate 'line', 9396
    $P3.'parse'(__ARG_2)
# }
.annotate 'line', 9397

.end # parsenamespace


.sub 'parse' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9400
# var items: $P1
    getattribute $P1, self, 'items'
.annotate 'line', 9401
# var functions: $P2
    getattribute $P2, self, 'functions'
.annotate 'line', 9402
# var classes: $P3
    getattribute $P3, self, 'classes'
.annotate 'line', 9403
# var t: $P4
    null $P4
# for loop
.annotate 'line', 9404
    $P4 = __ARG_1.'get'()
  __label_3: # for condition
    set $I1, $P4
    unless $I1 goto __label_4
    $P7 = $P4.'isop'('}')
    isfalse $I1, $P7
  __label_4:
    unless $I1 goto __label_2
# {
# switch
.annotate 'line', 9406
    $P8 = $P4.'checkkeyword'()
    set $S1, $P8
    set $S2, 'namespace'
    if $S1 == $S2 goto __label_7
    set $S2, 'const'
    if $S1 == $S2 goto __label_8
    set $S2, 'function'
    if $S1 == $S2 goto __label_9
    set $S2, 'class'
    if $S1 == $S2 goto __label_10
    set $S2, 'using'
    if $S1 == $S2 goto __label_11
    set $S2, '$include_const'
    if $S1 == $S2 goto __label_12
    set $S2, '$load'
    if $S1 == $S2 goto __label_13
    set $S2, '$loadlib'
    if $S1 == $S2 goto __label_14
    goto __label_6
  __label_7: # case
.annotate 'line', 9408
    self.'parsenamespace'($P4, __ARG_1)
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 9411
# var cst: $P5
.const 'Sub' $P9 = 'WSubId_34'
    $P5 = $P9($P4, __ARG_1, self)
.annotate 'line', 9412
# predefined push
    push $P1, $P5
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 9415
# var f: $P6
    new $P6, [ 'FunctionStatement' ]
    $P6.'FunctionStatement'($P4, __ARG_1, self)
.annotate 'line', 9416
# predefined push
    push $P2, $P6
.annotate 'line', 9417
# predefined push
    push $P1, $P6
    goto __label_5 # break
  __label_10: # case
.annotate 'line', 9418
.const 'Sub' $P10 = 'WSubId_88'
.annotate 'line', 9420
    $P10($P4, __ARG_1, self)
    goto __label_5 # break
  __label_11: # case
.annotate 'line', 9421
.const 'Sub' $P11 = 'WSubId_89'
.annotate 'line', 9423
    $P11($P4, __ARG_1, self)
    goto __label_5 # break
  __label_12: # case
.annotate 'line', 9424
.const 'Sub' $P12 = 'WSubId_90'
.annotate 'line', 9426
    $P12($P4, __ARG_1, self)
    goto __label_5 # break
  __label_13: # case
.annotate 'line', 9429
    $P4 = __ARG_1.'get'()
.annotate 'line', 9430
    $P13 = $P4.'isstring'()
    isfalse $I2, $P13
    unless $I2 goto __label_15
.const 'Sub' $P14 = 'WSubId_29'
.annotate 'line', 9431
    $P14('string literal', $P4)
  __label_15: # endif
.const 'Sub' $P15 = 'WSubId_43'
.annotate 'line', 9432
    $P15(';', __ARG_1)
.annotate 'line', 9433
    new $P18, [ 'StringLiteral' ]
    $P18.'StringLiteral'(self, $P4)
    set $P17, $P18
    $P16 = $P17.'getPirString'()
    self.'addload'($P16)
    goto __label_5 # break
  __label_14: # case
.annotate 'line', 9436
    $P4 = __ARG_1.'get'()
.annotate 'line', 9437
    $P19 = $P4.'isstring'()
    isfalse $I3, $P19
    unless $I3 goto __label_16
.const 'Sub' $P20 = 'WSubId_29'
.annotate 'line', 9438
    $P20('string literal', $P4)
  __label_16: # endif
.const 'Sub' $P21 = 'WSubId_43'
.annotate 'line', 9439
    $P21(';', __ARG_1)
.annotate 'line', 9440
    new $P24, [ 'StringLiteral' ]
    $P24.'StringLiteral'(self, $P4)
    set $P23, $P24
    $P22 = $P23.'getPirString'()
    self.'addlib'($P22)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 9441
.const 'Sub' $P25 = 'WSubId_31'
.annotate 'line', 9443
    $P25("token", $P4)
  __label_5: # switch end
# }
  __label_1: # for iteration
.annotate 'line', 9404
    $P4 = __ARG_1.'get'()
    goto __label_3
  __label_2: # for end
.annotate 'line', 9446
    if_null $P4, __label_17
    unless $P4 goto __label_17
.annotate 'line', 9447
    self.'close_ns'($P4)
    goto __label_18
  __label_17: # else
.annotate 'line', 9449
    self.'unclosed_ns'()
  __label_18: # endif
# }
.annotate 'line', 9450

.end # parse


.sub 'optimize_base' :method
# Body
# {
.const 'Sub' $P1 = 'WSubId_28'
.annotate 'line', 9453
    getattribute $P2, self, 'items'
    $P1($P2)
# }
.annotate 'line', 9454

.end # optimize_base


.sub 'emit_base' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9457
# var path: $P1
    $P1 = self.'getpath'()
.annotate 'line', 9458
# s: $S1
.const 'Sub' $P5 = 'WSubId_87'
    $P4 = $P5($P1)
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 9460
# activate: $I1
    set $I1, 1
.annotate 'line', 9462
# var externals: $P2
    getattribute $P2, self, 'externals'
.annotate 'line', 9463
    if_null $P2, __label_2
# {
.annotate 'line', 9464
    __ARG_1.'say'($S1)
.annotate 'line', 9465
    null $I1
.const 'Sub' $P6 = 'WSubId_42'
.annotate 'line', 9466
    $P6(__ARG_1, $P2)
# }
  __label_2: # endif
.annotate 'line', 9469
    getattribute $P4, self, 'items'
    iter $P7, $P4
    set $P7, 0
  __label_3: # for iteration
    unless $P7 goto __label_4
    shift $P3, $P7
# {
.annotate 'line', 9470
    isa $I2, $P3, [ 'NamespaceStatement' ]
    if $I2 goto __label_7
.annotate 'line', 9471
    isa $I2, $P3, [ 'ClassStatement' ]
  __label_7:
    unless $I2 goto __label_5
.annotate 'line', 9472
    set $I1, 1
    goto __label_6
  __label_5: # else
.annotate 'line', 9474
    unless $I1 goto __label_8
# {
.annotate 'line', 9475
    __ARG_1.'say'($S1)
.annotate 'line', 9476
    null $I1
# }
  __label_8: # endif
  __label_6: # endif
.annotate 'line', 9478
    $P3.'emit'(__ARG_1)
# }
    goto __label_3
  __label_4: # endfor
# }
.annotate 'line', 9480

.end # emit_base

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NamespaceBase' ]
.annotate 'line', 9165
    get_class $P1, [ 'VarContainer' ]
    addparent $P0, $P1
.annotate 'line', 9167
    addattribute $P0, 'nspath'
.annotate 'line', 9168
    addattribute $P0, 'externals'
.annotate 'line', 9169
    addattribute $P0, 'namespaces'
.annotate 'line', 9170
    addattribute $P0, 'classes'
.annotate 'line', 9171
    addattribute $P0, 'functions'
.annotate 'line', 9172
    addattribute $P0, 'items'
.annotate 'line', 9173
    addattribute $P0, 'owner'
.end
.namespace [ 'NamespaceStatement' ]

.sub 'NamespaceStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 9498
# var nspath: $P1
    $P2 = __ARG_1.'getpath'()
# predefined clone
    clone $P1, $P2
.annotate 'line', 9499
# predefined push
    push $P1, __ARG_4
.annotate 'line', 9500
    self.'NamespaceBase'($P1, __ARG_3)
.annotate 'line', 9502
    setattribute self, 'parent', __ARG_1
.annotate 'line', 9503
    setattribute self, 'start', __ARG_2
.annotate 'line', 9504
    setattribute self, 'owner', __ARG_1
.annotate 'line', 9505
    box $P2, __ARG_4
    setattribute self, 'name', $P2
.annotate 'line', 9506
    setattribute self, 'modifier', __ARG_5
.annotate 'line', 9507
    if_null __ARG_5, __label_1
# {
.annotate 'line', 9508
    $P2 = __ARG_5.'pick'('HLL')
    if_null $P2, __label_2
.annotate 'line', 9509
    getattribute $P4, self, 'name'
    setattribute self, 'hll', $P4
  __label_2: # endif
# }
  __label_1: # endif
# }
.annotate 'line', 9511

.end # NamespaceStatement


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 9514
    getattribute $P1, self, 'parent'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 9515

.end # dowarnings


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 9518
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 9519

.end # generatesubid


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9522
    getattribute $P1, self, 'owner'
    $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 9523

.end # use_predef


.sub 'addlib' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9526
    getattribute $P1, self, 'parent'
    $P1.'addlib'(__ARG_1)
# }
.annotate 'line', 9527

.end # addlib


.sub 'addload' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9530
    getattribute $P1, self, 'parent'
    $P1.'addload'(__ARG_1)
# }
.annotate 'line', 9531

.end # addload


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9534
# var cl: $P1
    $P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 9535
    unless_null $P1, __label_1
.annotate 'line', 9536
    getattribute $P2, self, 'parent'
    .tailcall $P2.'checkclass'(__ARG_1)
  __label_1: # endif
.annotate 'line', 9537
    .return($P1)
# }
.annotate 'line', 9538

.end # checkclass


.sub 'findclasskey' :method
        .param pmc __ARG_1
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 9543
# var cl: $P1
    $P1 = self.'findclasskey_base'(__ARG_1, __ARG_2)
.annotate 'line', 9544
    isnull $I1, $P1
    unless $I1 goto __label_2
    iseq $I1, __ARG_2, 0
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 9545
    getattribute $P2, self, 'parent'
    .tailcall $P2.'findclasskey'(__ARG_1, __ARG_2)
  __label_1: # endif
.annotate 'line', 9546
    .return($P1)
# }
.annotate 'line', 9547

.end # findclasskey


.sub 'findsymbol' :method
        .param pmc __ARG_1
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 9550
# var sym: $P1
    $P1 = self.'findlocalsymbol'(__ARG_1, __ARG_2)
.annotate 'line', 9551
    isnull $I1, $P1
    unless $I1 goto __label_2
    isle $I1, __ARG_2, 0
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 9552
    getattribute $P2, self, 'parent'
    .tailcall $P2.'findsymbol'(__ARG_1, __ARG_2)
  __label_1: # endif
.annotate 'line', 9553
    .return($P1)
# }
.annotate 'line', 9554

.end # findsymbol


.sub 'findns' :method
        .param pmc __ARG_1
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 9557
# var ns: $P1
    $P1 = self.'findlocalns'(__ARG_1, __ARG_2)
.annotate 'line', 9558
    isnull $I1, $P1
    unless $I1 goto __label_2
    isle $I1, __ARG_2, 0
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 9559
    getattribute $P2, self, 'parent'
    .tailcall $P2.'findns'(__ARG_1, __ARG_2)
  __label_1: # endif
.annotate 'line', 9560
    .return($P1)
# }
.annotate 'line', 9561

.end # findns


.sub 'unclosed_ns' :method
# Body
# {
.const 'Sub' $P1 = 'WSubId_1'
.annotate 'line', 9564
    getattribute $P2, self, 'start'
    $P1('unclosed namespace', $P2)
# }
.annotate 'line', 9565

.end # unclosed_ns


.sub 'close_ns' :method
        .param pmc __ARG_1
# Empty body

.end # close_ns


.sub 'optimize' :method
# Body
# {
.annotate 'line', 9572
# var modifier: $P1
    getattribute $P1, self, 'modifier'
.annotate 'line', 9573
    if_null $P1, __label_1
.annotate 'line', 9574
    $P3 = $P1.'optimize'()
    setattribute self, 'modifier', $P3
  __label_1: # endif
.annotate 'line', 9575
    self.'optimize_base'()
.annotate 'line', 9576
    .return(self)
# }
.annotate 'line', 9577

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9580
# var hll: $P1
    getattribute $P1, self, 'hll'
.annotate 'line', 9581
    if_null $P1, __label_1
.annotate 'line', 9582
    __ARG_1.'say'(".HLL '", $P1, "'")
  __label_1: # endif
.annotate 'line', 9584
    self.'emit_base'(__ARG_1)
.annotate 'line', 9586
    if_null $P1, __label_2
.annotate 'line', 9587
    __ARG_1.'say'(".HLL 'parrot'")
  __label_2: # endif
# }
.annotate 'line', 9588

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NamespaceStatement' ]
.annotate 'line', 9487
    get_class $P1, [ 'NamespaceBase' ]
    addparent $P0, $P1
.annotate 'line', 9489
    addattribute $P0, 'parent'
.annotate 'line', 9490
    addattribute $P0, 'start'
.annotate 'line', 9491
    addattribute $P0, 'name'
.annotate 'line', 9492
    addattribute $P0, 'modifier'
.annotate 'line', 9493
    addattribute $P0, 'hll'
.end
.namespace [ 'RootNamespace' ]

.sub 'RootNamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9605
    new $P1, ['ResizableStringArray']
.annotate 'line', 9606
    null $P2
    self.'NamespaceBase'($P1, $P2)
.annotate 'line', 9607
    setattribute self, 'unit', __ARG_1
.annotate 'line', 9608
    root_new $P3, ['parrot';'Hash']
    setattribute self, 'predefs_used', $P3
.annotate 'line', 9609
    box $P2, 0
    setattribute self, 'subidgen', $P2
# }
.annotate 'line', 9610

.end # RootNamespace


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9613
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 9614
    $P1[__ARG_1] = 1
# }
.annotate 'line', 9615

.end # use_predef


.sub 'predef_is_used' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9618
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 9619
    $P2 = $P1[__ARG_1]
    unless_null $P2, __label_2
    null $I1
    goto __label_1
  __label_2:
    set $I1, 1
  __label_1:
    .return($I1)
# }
.annotate 'line', 9620

.end # predef_is_used


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 9624
# idgen: $I1
    getattribute $P2, self, 'subidgen'
    inc $P2
    set $P1, $P2
    set $I1, $P1
# predefined string
.annotate 'line', 9623
    set $S1, $I1
.annotate 'line', 9625
    concat $S2, 'WSubId_', $S1
    .return($S2)
# }
.annotate 'line', 9626

.end # generatesubid


.sub 'addlib' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9630
# var libs: $P1
    getattribute $P1, self, 'libs'
.annotate 'line', 9631
    unless_null $P1, __label_1
.annotate 'line', 9632
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'libs', $P1
  __label_1: # endif
.annotate 'line', 9633
    $P1[__ARG_1] = 1
# }
.annotate 'line', 9634

.end # addlib


.sub 'addload' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9637
# var loads: $P1
    getattribute $P1, self, 'loads'
.annotate 'line', 9638
    unless_null $P1, __label_1
.annotate 'line', 9639
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'loads', $P1
  __label_1: # endif
.annotate 'line', 9640
    $P1[__ARG_1] = 1
# }
.annotate 'line', 9641

.end # addload


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9644
    .tailcall self.'checkclass_base'(__ARG_1)
# }
.annotate 'line', 9645

.end # checkclass


.sub 'findclasskey' :method
        .param pmc __ARG_1
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 9649
    .tailcall self.'findclasskey_base'(__ARG_1, __ARG_2)
# }
.annotate 'line', 9650

.end # findclasskey


.sub 'findsymbol' :method
        .param pmc __ARG_1
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 9653
    .tailcall self.'findlocalsymbol'(__ARG_1, __ARG_2)
# }
.annotate 'line', 9654

.end # findsymbol


.sub 'findns' :method
        .param pmc __ARG_1
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 9657
    .tailcall self.'findlocalns'(__ARG_1, __ARG_2)
# }
.annotate 'line', 9658

.end # findns


.sub 'unclosed_ns' :method
# Empty body

.end # unclosed_ns


.sub 'close_ns' :method
        .param pmc __ARG_1
# Body
# {
.const 'Sub' $P1 = 'WSubId_1'
.annotate 'line', 9665
    $P1('Cannot close root namespace', __ARG_1)
# }
.annotate 'line', 9666

.end # close_ns


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 9669
    getattribute $P1, self, 'unit'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 9670

.end # dowarnings


.sub 'optimize' :method
# Body
# {
.annotate 'line', 9673
    self.'optimize_base'()
.annotate 'line', 9674
    .return(self)
# }
.annotate 'line', 9675

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9678
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 9681
    $P5 = $P1['chomp']
    if_null $P5, __label_1
.annotate 'line', 9682
    self.'addload'('"String/Utils.pbc"')
  __label_1: # endif
.annotate 'line', 9685
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
.annotate 'line', 9688
    iter $P6, $P2
    set $P6, 0
  __label_2: # for iteration
    unless $P6 goto __label_3
    shift $S1, $P6
.annotate 'line', 9689
    $P5 = $P1[$S1]
    if_null $P5, __label_4
# {
.annotate 'line', 9690
    self.'addlib'("'trans_ops'")
    goto __label_3 # break
.annotate 'line', 9691
# }
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
.annotate 'line', 9694
# somelib: $I1
    null $I1
.annotate 'line', 9695
# var libs: $P3
    getattribute $P3, self, 'libs'
.annotate 'line', 9696
    if_null $P3, __label_5
# {
.annotate 'line', 9697
    set $I1, 1
.annotate 'line', 9698
    iter $P7, $P3
    set $P7, 0
  __label_6: # for iteration
    unless $P7 goto __label_7
    shift $S2, $P7
.annotate 'line', 9699
    __ARG_1.'say'('.loadlib ', $S2)
    goto __label_6
  __label_7: # endfor
# }
  __label_5: # endif
.annotate 'line', 9702
# someload: $I2
    null $I2
.annotate 'line', 9703
# var loads: $P4
    getattribute $P4, self, 'loads'
.annotate 'line', 9704
    if_null $P4, __label_8
# {
.annotate 'line', 9705
    set $I2, 1
.annotate 'line', 9706
    __ARG_1.'print'("\n.sub initial_load_bytecode :anon :load :init\n")
.annotate 'line', 9707
    iter $P8, $P4
    set $P8, 0
  __label_9: # for iteration
    unless $P8 goto __label_10
    shift $S3, $P8
.annotate 'line', 9708
    __ARG_1.'say'('    load_bytecode ', $S3)
    goto __label_9
  __label_10: # endfor
.annotate 'line', 9709
    __ARG_1.'print'(".end\n\n")
# }
  __label_8: # endif
.annotate 'line', 9711
    or $I3, $I1, $I2
    unless $I3 goto __label_11
.annotate 'line', 9712
    __ARG_1.'comment'('end libs')
  __label_11: # endif
.annotate 'line', 9714
    self.'emit_base'(__ARG_1)
# }
.annotate 'line', 9715

.end # emit


.sub 'emitinclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9718
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 9719
    iter $P4, $P1
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $S1, $P4
# {
.annotate 'line', 9720
# var data: $P2
    $P2 = $P1[$S1]
.annotate 'line', 9721
    isa $I2, $P2, [ 'VarData' ]
    not $I1, $I2
    if $I1 goto __label_5
.annotate 'line', 9722
    $P5 = $P2.'gettype'()
    set $S2, $P5
    isne $I1, $S2, 'I'
  __label_5:
    if $I1 goto __label_4
.annotate 'line', 9723
    $I3 = $P2.'getflags'()
    band $I1, $I3, 4
  __label_4:
    unless $I1 goto __label_3
    goto __label_1 # continue
  __label_3: # endif
.annotate 'line', 9725
# var value: $P3
    $P3 = $P2.'getvalue'()
.annotate 'line', 9726
    $P5 = $P3.'getIntegerValue'()
    __ARG_1.'say'('.macro_const ', $S1, ' ', $P5)
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 9728

.end # emitinclude

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'RootNamespace' ]
.annotate 'line', 9595
    get_class $P1, [ 'NamespaceBase' ]
    addparent $P0, $P1
.annotate 'line', 9597
    addattribute $P0, 'unit'
.annotate 'line', 9598
    addattribute $P0, 'predefs_used'
.annotate 'line', 9599
    addattribute $P0, 'libs'
.annotate 'line', 9600
    addattribute $P0, 'loads'
.annotate 'line', 9601
    addattribute $P0, 'subidgen'
.end
.namespace [ ]
# Constant EVAL_NAME evaluated at compile time
.namespace [ 'WinxedCompileUnit' ]

.sub 'init' :method :vtable
# Body
# {
.annotate 'line', 9744
    box $P6, 1
    setattribute self, 'warnings', $P6
.annotate 'line', 9745
# var rootns: $P1
    new $P1, [ 'RootNamespace' ]
    $P1.'RootNamespace'(self)
.annotate 'line', 9748
# var taux: $P2
    new $P2, [ 'TokenIdentifier' ]
    $P2.'TokenIdentifier'('__predefconst__', 0, 'predefconst')
.annotate 'line', 9750
# var cfalse: $P3
    $P3 = $P1.'createconst'('false', 'I', 4)
.annotate 'line', 9751
.const 'Sub' $P7 = 'WSubId_16'
.annotate 'line', 9752
    new $P9, [ 'TokenInteger' ]
    getattribute $P10, $P2, 'file'
    getattribute $P11, $P2, 'line'
    $P9.'TokenInteger'($P10, $P11, 'false')
    set $P8, $P9
.annotate 'line', 9751
    $P6 = $P7($P1, $P8, 0)
    $P3.'setvalue'($P6)
.annotate 'line', 9753
# var ctrue: $P4
    $P4 = $P1.'createconst'('true', 'I', 4)
.annotate 'line', 9754
.const 'Sub' $P12 = 'WSubId_16'
.annotate 'line', 9755
    new $P9, [ 'TokenInteger' ]
    getattribute $P10, $P2, 'file'
    getattribute $P11, $P2, 'line'
    $P9.'TokenInteger'($P10, $P11, 'false')
    set $P8, $P9
.annotate 'line', 9754
    $P6 = $P12($P1, $P8, 1)
    $P4.'setvalue'($P6)
.annotate 'line', 9759
# var cstage: $P5
    $P5 = $P1.'createconst'('__STAGE__', 'S', 4)
.annotate 'line', 9760
    new $P8, [ 'StringLiteral' ]
.annotate 'line', 9761
    new $P10, [ 'TokenQuoted' ]
    getattribute $P11, $P2, 'file'
    getattribute $P13, $P2, 'line'
# predefined string
# predefined int
.annotate 'line', 9760
    set $I2, "2"
    add $I1, $I2, 1
    set $S1, $I1
    $P10.'TokenQuoted'($P11, $P13, $S1)
    set $P9, $P10
    $P8.'StringLiteral'($P1, $P9)
    set $P6, $P8
    $P5.'setvalue'($P6)
.annotate 'line', 9763
    setattribute self, 'rootns', $P1
# }
.annotate 'line', 9764

.end # init


.sub 'setwarnmode' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 9767
    getattribute $P1, self, 'warnings'
    assign $P1, __ARG_1
# }
.annotate 'line', 9768

.end # setwarnmode


.sub 'dowarnings' :method
# Body
# {
# predefined int
.annotate 'line', 9771
    getattribute $P1, self, 'warnings'
.annotate 'line', 9770
    set $I1, $P1
.annotate 'line', 9771
    .return($I1)
# }
.annotate 'line', 9772

.end # dowarnings


.sub 'parse' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9775
    getattribute $P1, self, 'rootns'
    $P1.'parse'(__ARG_1)
.annotate 'line', 9776
    getattribute $P1, self, 'rootns'
    $P1.'fixnamespaces'()
# }
.annotate 'line', 9777

.end # parse


.sub 'optimize' :method
# Body
# {
.annotate 'line', 9780
    getattribute $P3, self, 'rootns'
    $P2 = $P3.'optimize'()
    setattribute self, 'rootns', $P2
# }
.annotate 'line', 9781

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9784
    __ARG_1.'comment'('Begin generated code')
.annotate 'line', 9785
    __ARG_1.'say'('')
.annotate 'line', 9787
    getattribute $P1, self, 'rootns'
    $P1.'emit'(__ARG_1)
.annotate 'line', 9789
    __ARG_1.'comment'('End generated code')
# }
.annotate 'line', 9790

.end # emit


.sub 'emitinclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9793
    __ARG_1.'comment'('DO NOT EDIT THIS FILE')
.annotate 'line', 9794
    __ARG_1.'comment'('Generated automatically from Winxed sources')
.annotate 'line', 9796
    getattribute $P1, self, 'rootns'
    $P1.'emitinclude'(__ARG_1)
.annotate 'line', 9798
    __ARG_1.'comment'('End')
# }
.annotate 'line', 9799

.end # emitinclude

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'WinxedCompileUnit' ]
.annotate 'line', 9739
    addattribute $P0, 'rootns'
.annotate 'line', 9740
    addattribute $P0, 'warnings'
.end
.namespace [ 'WinxedHLL' ]

.sub '__private_compile_tail' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9808
    set $S2, __ARG_2
    ne $S2, 'parse', __label_1
.annotate 'line', 9809
    .return(__ARG_1)
  __label_1: # endif
.annotate 'line', 9810
# var handleout: $P1
    new $P1, [ 'StringHandle' ]
.annotate 'line', 9811
    $P1.'open'('__eval__', 'w')
.annotate 'line', 9812
# var emit: $P2
    new $P2, [ 'Emit' ]
    $P2.'Emit'($P1)
.annotate 'line', 9813
    if_null __ARG_3, __label_2
    unless __ARG_3 goto __label_2
.annotate 'line', 9814
    $P2.'disable_annotations'()
  __label_2: # endif
.annotate 'line', 9815
    __ARG_1.'emit'($P2)
.annotate 'line', 9816
    $P2.'close'()
.annotate 'line', 9817
    $P1.'close'()
.annotate 'line', 9818
# pircode: $S1
    $P5 = $P1.'read'(0)
    null $S1
    if_null $P5, __label_3
    set $S1, $P5
  __label_3:
.annotate 'line', 9819
# var object: $P3
    null $P3
# switch
.annotate 'line', 9820
    set $S2, __ARG_2
    set $S3, 'pir'
    if $S2 == $S3 goto __label_6
    set $S3, 'pbc'
    if $S2 == $S3 goto __label_7
    set $S3, ''
    if $S2 == $S3 goto __label_8
    goto __label_5
  __label_6: # case
.annotate 'line', 9822
    new $P3, [ 'String' ]
.annotate 'line', 9823
    assign $P3, $S1
    goto __label_4 # break
  __label_7: # case
  __label_8: # case
.annotate 'line', 9827
# var pircomp: $P4
# predefined compreg
    compreg $P4, 'PIR'
.annotate 'line', 9828
    $P3 = $P4($S1)
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 9829
# predefined string
.annotate 'line', 9831
    set $S4, __ARG_2
    concat $S5, 'Invalid target: ', $S4
# predefined die
    die $S5
  __label_4: # switch end
.annotate 'line', 9833
    .return($P3)
# }
.annotate 'line', 9834

.end # __private_compile_tail


.sub '__private_geninclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9837
# var handleout: $P1
    new $P1, [ 'StringHandle' ]
.annotate 'line', 9838
    $P1.'open'('__eval__', 'w')
.annotate 'line', 9839
# var emit: $P2
    new $P2, [ 'Emit' ]
    $P2.'Emit'($P1)
.annotate 'line', 9840
    __ARG_1.'emitinclude'($P2)
.annotate 'line', 9841
    $P2.'close'()
.annotate 'line', 9842
    $P1.'close'()
.annotate 'line', 9843
    .tailcall $P1.'read'(0)
# }
.annotate 'line', 9844

.end # __private_geninclude


.sub 'compile' :method
        .param string __ARG_1
        .param string __ARG_2 :optional :named('target')
        .param int __ARG_3 :optional :named('noan')
        .param int __ARG_4 :optional :named('nowarn')
# Body
# {
.annotate 'line', 9850
    unless_null __ARG_2, __label_1
.annotate 'line', 9851
    set __ARG_2, ''
  __label_1: # endif
.annotate 'line', 9852
# var handlein: $P1
    new $P1, [ 'StringHandle' ]
.annotate 'line', 9853
    $P1.'open'('__eval__', 'w')
.annotate 'line', 9854
    $P1.'puts'(__ARG_1)
.annotate 'line', 9855
    $P1.'close'()
.annotate 'line', 9856
    $P1.'open'('__eval__', 'r')
.annotate 'line', 9857
# var tk: $P2
    new $P2, [ 'Tokenizer' ]
    $P2.'Tokenizer'($P1, '__eval__')
.annotate 'line', 9858
# var winxed: $P3
    new $P3, [ 'WinxedCompileUnit' ]
.annotate 'line', 9859
    unless __ARG_4 goto __label_2
.annotate 'line', 9860
    $P3.'setwarnmode'(0)
  __label_2: # endif
.annotate 'line', 9861
    $P3.'parse'($P2)
.annotate 'line', 9862
    $P1.'close'()
.annotate 'line', 9863
    $P3.'optimize'()
.annotate 'line', 9864
    ne __ARG_2, 'include', __label_3
.annotate 'line', 9865
    .tailcall self.'__private_geninclude'($P3)
    goto __label_4
  __label_3: # else
.annotate 'line', 9867
    .tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3)
  __label_4: # endif
# }
.annotate 'line', 9868

.end # compile


.sub 'compile_from_file' :method
        .param string __ARG_1
        .param string __ARG_2 :optional :named('target')
        .param int __ARG_3 :optional :named('noan')
        .param int __ARG_4 :optional :named('nowarn')
# Body
# {
.annotate 'line', 9874
    unless_null __ARG_2, __label_1
.annotate 'line', 9875
    set __ARG_2, ''
  __label_1: # endif
.annotate 'line', 9876
# var handlein: $P1
    new $P1, [ 'FileHandle' ]
.annotate 'line', 9877
    $P1.'open'(__ARG_1, 'r')
.annotate 'line', 9878
    $P1.'encoding'('utf8')
.annotate 'line', 9879
# var tk: $P2
    new $P2, [ 'Tokenizer' ]
    $P2.'Tokenizer'($P1, __ARG_1)
.annotate 'line', 9880
# var winxed: $P3
    new $P3, [ 'WinxedCompileUnit' ]
.annotate 'line', 9881
    unless __ARG_4 goto __label_2
.annotate 'line', 9882
    $P3.'setwarnmode'(0)
  __label_2: # endif
.annotate 'line', 9883
    $P3.'parse'($P2)
.annotate 'line', 9884
    $P1.'close'()
.annotate 'line', 9885
    $P3.'optimize'()
.annotate 'line', 9886
    ne __ARG_2, 'include', __label_3
.annotate 'line', 9887
    .tailcall self.'__private_geninclude'($P3)
    goto __label_4
  __label_3: # else
.annotate 'line', 9889
    .tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3)
  __label_4: # endif
# }
.annotate 'line', 9890

.end # compile_from_file

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'WinxedHLL' ]
.end
.namespace [ ]

.sub 'initializer' :init :load
# Body
# {
.annotate 'line', 9899
# var comp: $P1
    new $P1, [ 'WinxedHLL' ]
.annotate 'line', 9900
# predefined compreg
    compreg 'winxed', $P1
# }
.annotate 'line', 9901

.end # initializer

# End generated code
