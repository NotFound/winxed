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

.sub 'Warn' :subid('WSubId_54')
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


.sub 'RequireIdentifier' :subid('WSubId_79')
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


.sub 'ExpectKeyword' :subid('WSubId_81')
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

.namespace [ 'Token' ]

.sub 'Token' :method
        .param string __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 151
    box $P1, __ARG_1
    setattribute self, 'file', $P1
.annotate 'line', 152
    box $P1, __ARG_2
    setattribute self, 'line', $P1
# }
.annotate 'line', 153

.end # Token


.sub 'get_bool' :method :vtable
# Body
# {
.annotate 'line', 156
    .return(1)
# }
.annotate 'line', 157

.end # get_bool


.sub 'get_integer' :method :vtable
# Body
# {
.annotate 'line', 160
    .return(1)
# }
.annotate 'line', 161

.end # get_integer


.sub 'iseof' :method
# Body
# {
.annotate 'line', 163
    .return(0)
# }

.end # iseof


.sub 'iscomment' :method
# Body
# {
.annotate 'line', 164
    .return(0)
# }

.end # iscomment


.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 165
    .return(0)
# }

.end # isidentifier


.sub 'isint' :method
# Body
# {
.annotate 'line', 166
    .return(0)
# }

.end # isint


.sub 'isfloat' :method
# Body
# {
.annotate 'line', 167
    .return(0)
# }

.end # isfloat


.sub 'isstring' :method
# Body
# {
.annotate 'line', 168
    .return(0)
# }

.end # isstring


.sub 'rawstring' :method
# Body
# {
.const 'Sub' $P1 = 'WSubId_6'
.annotate 'line', 172
    $P1('Not a literal string', self)
# }
.annotate 'line', 173

.end # rawstring


.sub 'getidentifier' :method
# Body
# {
.const 'Sub' $P1 = 'WSubId_3'
.annotate 'line', 176
    $P1(self)
# }
.annotate 'line', 177

.end # getidentifier


.sub 'iskeyword' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 178
    .return(0)
# }

.end # iskeyword


.sub 'checkkeyword' :method
# Body
# {
.annotate 'line', 179
    .return(0)
# }

.end # checkkeyword


.sub 'isop' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 180
    .return(0)
# }

.end # isop


.sub 'checkop' :method
# Body
# {
.annotate 'line', 181
    .return('')
# }

.end # checkop


.sub 'viewable' :method
# Body
# {
.annotate 'line', 182
    .return('(unknown)')
# }

.end # viewable


.sub 'show' :method
# Body
# {
.annotate 'line', 185
# r: $S1
    $P1 = self.'viewable'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 186
# predefined string
    getattribute $P1, self, 'file'
.annotate 'line', 184
    set $S2, $P1
# predefined string
.annotate 'line', 186
    getattribute $P2, self, 'line'
.annotate 'line', 184
    set $S3, $P2
.annotate 'line', 186
    concat $S4, $S1, ' at '
    concat $S4, $S4, $S2
    concat $S4, $S4, ' line '
    concat $S4, $S4, $S3
    .return($S4)
# }
.annotate 'line', 187

.end # show

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Token' ]
.annotate 'line', 147
    addattribute $P0, 'file'
.annotate 'line', 148
    addattribute $P0, 'line'
.end
.namespace [ 'TokenEof' ]

.sub 'TokenEof' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 194
    self.'Token'(__ARG_1, 0)
# }
.annotate 'line', 195

.end # TokenEof


.sub 'get_bool' :method :vtable
# Body
# {
.annotate 'line', 198
    .return(0)
# }
.annotate 'line', 199

.end # get_bool


.sub 'get_integer' :method :vtable
# Body
# {
.annotate 'line', 202
    .return(0)
# }
.annotate 'line', 203

.end # get_integer


.sub 'iseof' :method
# Body
# {
.annotate 'line', 204
    .return(1)
# }

.end # iseof


.sub 'viewable' :method
# Body
# {
.annotate 'line', 205
    .return('(End of file)')
# }

.end # viewable

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TokenEof' ]
.annotate 'line', 190
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
.annotate 'line', 213
    self.'Token'(__ARG_1, __ARG_2)
.annotate 'line', 214
    box $P1, __ARG_3
    setattribute self, 'str', $P1
# }
.annotate 'line', 215

.end # TokenWithVal


.sub 'get_string' :method :vtable
# Body
# {
.annotate 'line', 216
    getattribute $P1, self, 'str'
    .return($P1)
# }

.end # get_string


.sub 'viewable' :method
# Body
# {
.annotate 'line', 219
    getattribute $P1, self, 'str'
    .return($P1)
# }
.annotate 'line', 220

.end # viewable

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TokenWithVal' ]
.annotate 'line', 208
    get_class $P1, [ 'Token' ]
    addparent $P0, $P1
.annotate 'line', 210
    addattribute $P0, 'str'
.end
.namespace [ 'TokenComment' ]

.sub 'TokenComment' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 227
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 228

.end # TokenComment


.sub 'iscomment' :method
# Body
# {
.annotate 'line', 229
    .return(1)
# }

.end # iscomment

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TokenComment' ]
.annotate 'line', 223
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
.annotate 'line', 236
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 237

.end # TokenOp


.sub 'isop' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 240
    getattribute $P1, self, 'str'
    set $S1, $P1
    iseq $I1, $S1, __ARG_1
    .return($I1)
# }
.annotate 'line', 241

.end # isop


.sub 'checkop' :method
# Body
# {
# predefined string
.annotate 'line', 244
    getattribute $P1, self, 'str'
.annotate 'line', 243
    set $S1, $P1
.annotate 'line', 244
    .return($S1)
# }
.annotate 'line', 245

.end # checkop

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TokenOp' ]
.annotate 'line', 232
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
.annotate 'line', 252
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 253

.end # TokenIdentifier


.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 254
    .return(1)
# }

.end # isidentifier


.sub 'getidentifier' :method
# Body
# {
.annotate 'line', 257
    getattribute $P1, self, 'str'
    .return($P1)
# }
.annotate 'line', 258

.end # getidentifier


.sub 'checkkeyword' :method
# Body
# {
# predefined string
.annotate 'line', 261
    getattribute $P1, self, 'str'
.annotate 'line', 260
    set $S1, $P1
.annotate 'line', 261
    .return($S1)
# }
.annotate 'line', 262

.end # checkkeyword


.sub 'iskeyword' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 265
    getattribute $P1, self, 'str'
    set $S1, $P1
    iseq $I1, $S1, __ARG_1
    .return($I1)
# }
.annotate 'line', 266

.end # iskeyword

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TokenIdentifier' ]
.annotate 'line', 248
    get_class $P1, [ 'TokenWithVal' ]
    addparent $P0, $P1
.end
.namespace [ 'TokenString' ]

.sub 'isstring' :method
# Body
# {
.annotate 'line', 271
    .return(1)
# }

.end # isstring


.sub 'rawstring' :method
# Body
# {
.annotate 'line', 274
    getattribute $P1, self, 'str'
    .return($P1)
# }
.annotate 'line', 275

.end # rawstring

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TokenString' ]
.annotate 'line', 269
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
.annotate 'line', 282
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 283

.end # TokenQuoted


.sub 'get_string' :method :vtable
# Body
# {
# predefined string
.annotate 'line', 286
    getattribute $P1, self, 'str'
.annotate 'line', 285
    set $S1, $P1
.annotate 'line', 286
    concat $S2, '"', $S1
    concat $S2, $S2, '"'
    .return($S2)
# }
.annotate 'line', 287

.end # get_string


.sub 'viewable' :method
# Body
# {
# predefined string
.annotate 'line', 290
    getattribute $P1, self, 'str'
.annotate 'line', 289
    set $S1, $P1
.annotate 'line', 290
    concat $S2, '"', $S1
    concat $S2, $S2, '"'
    .return($S2)
# }
.annotate 'line', 291

.end # viewable


.sub 'getasquoted' :method
# Body
# {
.annotate 'line', 294
    getattribute $P1, self, 'str'
    .return($P1)
# }
.annotate 'line', 295

.end # getasquoted

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TokenQuoted' ]
.annotate 'line', 278
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
.annotate 'line', 302
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 303

.end # TokenSingleQuoted


.sub 'get_string' :method :vtable
# Body
# {
# predefined string
.annotate 'line', 306
    getattribute $P1, self, 'str'
.annotate 'line', 305
    set $S1, $P1
.annotate 'line', 306
    concat $S2, "'", $S1
    concat $S2, $S2, "'"
    .return($S2)
# }
.annotate 'line', 307

.end # get_string


.sub 'viewable' :method
# Body
# {
# predefined string
.annotate 'line', 310
    getattribute $P1, self, 'str'
.annotate 'line', 309
    set $S1, $P1
.annotate 'line', 310
    concat $S2, "'", $S1
    concat $S2, $S2, "'"
    .return($S2)
# }
.annotate 'line', 311

.end # viewable


.sub 'getasquoted' :method
# Body
# {
.annotate 'line', 314
# s: $S1
    set $S1, ''
.annotate 'line', 315
    getattribute $P1, self, 'str'
    iter $P2, $P1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $S2, $P2
# {
# switch
.annotate 'line', 316
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
.annotate 'line', 320
    concat $S0, '\', $S2
    set $S2, $S0
    goto __label_3 # break
  __label_4: # default
  __label_3: # switch end
.annotate 'line', 323
    concat $S1, $S1, $S2
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 325
    .return($S1)
# }
.annotate 'line', 326

.end # getasquoted

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TokenSingleQuoted' ]
.annotate 'line', 298
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
.annotate 'line', 333
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 334

.end # TokenInteger


.sub 'isint' :method
# Body
# {
.annotate 'line', 335
    .return(1)
# }

.end # isint

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TokenInteger' ]
.annotate 'line', 329
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
.annotate 'line', 342
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 343

.end # TokenFloat


.sub 'isfloat' :method
# Body
# {
.annotate 'line', 344
    .return(1)
# }

.end # isfloat

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TokenFloat' ]
.annotate 'line', 338
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
.annotate 'line', 354
# s: $S1
    set $S1, ''
.annotate 'line', 355
# c: $S2
    null $S2
# for loop
.annotate 'line', 356
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_3: # for condition
    eq $S2, '"', __label_2
# {
# switch
.annotate 'line', 357
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
.annotate 'line', 360
    $P2('Unterminated string', __ARG_1, __ARG_3)
  __label_8: # case
.annotate 'line', 363
# c2: $S3
    $P3 = __ARG_1.'getchar'()
    null $S3
    if_null $P3, __label_9
    set $S3, $P3
  __label_9:
.annotate 'line', 364
    iseq $I1, $S3, ''
    if $I1 goto __label_11
    iseq $I1, $S3, "\n"
  __label_11:
    unless $I1 goto __label_10
.const 'Sub' $P4 = 'WSubId_7'
.annotate 'line', 365
    $P4('Unterminated string', __ARG_1, __ARG_3)
  __label_10: # endif
.annotate 'line', 366
    concat $S1, $S1, $S2
    concat $S1, $S1, $S3
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 369
    concat $S1, $S1, $S2
  __label_4: # switch end
# }
  __label_1: # for iteration
.annotate 'line', 356
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_3
  __label_2: # for end
.annotate 'line', 372
    new $P3, [ 'TokenQuoted' ]
    getattribute $P5, __ARG_1, 'filename'
    $P3.'TokenQuoted'($P5, __ARG_3, $S1)
    set $P1, $P3
    .return($P1)
# }
.annotate 'line', 373

.end # getquoted


.sub 'getsinglequoted'
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 377
# s: $S1
    set $S1, ''
.annotate 'line', 378
# c: $S2
    null $S2
# for loop
.annotate 'line', 379
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_3: # for condition
    eq $S2, "'", __label_2
# {
.annotate 'line', 380
    iseq $I1, $S2, ""
    if $I1 goto __label_5
    iseq $I1, $S2, "\n"
  __label_5:
    unless $I1 goto __label_4
.const 'Sub' $P2 = 'WSubId_7'
.annotate 'line', 381
    $P2('Unterminated string', __ARG_1, __ARG_3)
  __label_4: # endif
.annotate 'line', 382
    concat $S1, $S1, $S2
# }
  __label_1: # for iteration
.annotate 'line', 379
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_3
  __label_2: # for end
.annotate 'line', 384
    new $P3, [ 'TokenSingleQuoted' ]
    getattribute $P4, __ARG_1, 'filename'
    $P3.'TokenSingleQuoted'($P4, __ARG_3, $S1)
    set $P1, $P3
    .return($P1)
# }
.annotate 'line', 385

.end # getsinglequoted


.sub 'getheredoc'
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 389
# mark: $S1
    set $S1, ''
.annotate 'line', 390
# c: $S2
    null $S2
# for loop
.annotate 'line', 391
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_3: # for condition
    eq $S2, "\n", __label_2
# {
# switch
.annotate 'line', 392
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
.annotate 'line', 394
    $P2('Unterminated heredoc', __ARG_1, __ARG_3)
  __label_7: # case
  __label_8: # case
.annotate 'line', 399
    concat $S0, '\', $S2
    set $S2, $S0
    goto __label_4 # break
  __label_5: # default
  __label_4: # switch end
.annotate 'line', 402
    concat $S0, $S1, $S2
    set $S1, $S0
# }
  __label_1: # for iteration
.annotate 'line', 391
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_3
  __label_2: # for end
.annotate 'line', 404
    concat $S0, $S1, ':>>'
    set $S1, $S0
.annotate 'line', 406
# content: $S3
    set $S3, ''
.annotate 'line', 407
# line: $S4
    null $S4
  __label_9: # do
.annotate 'line', 408
# {
.annotate 'line', 409
    set $S4, ''
# for loop
.annotate 'line', 410
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_14: # for condition
    eq $S2, "\n", __label_13
# {
# switch
.annotate 'line', 411
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
.annotate 'line', 413
    $P3('Unterminated heredoc', __ARG_1, __ARG_3)
  __label_18: # case
  __label_19: # case
.annotate 'line', 416
    concat $S0, '\', $S2
    set $S2, $S0
    goto __label_15 # break
  __label_16: # default
  __label_15: # switch end
.annotate 'line', 419
    concat $S4, $S4, $S2
# }
  __label_12: # for iteration
.annotate 'line', 410
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_14
  __label_13: # for end
.annotate 'line', 421
    eq $S4, $S1, __label_20
.annotate 'line', 422
    concat $S3, $S3, $S4
    concat $S3, $S3, '\n'
  __label_20: # endif
# }
  __label_11: # continue
.annotate 'line', 423
    ne $S4, $S1, __label_9
  __label_10: # enddo
.annotate 'line', 424
    new $P4, [ 'TokenQuoted' ]
    getattribute $P5, __ARG_1, 'filename'
    $P4.'TokenQuoted'($P5, __ARG_3, $S3)
    set $P1, $P4
    .return($P1)
# }
.annotate 'line', 425

.end # getheredoc


.sub 'getident' :subid('WSubId_13')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 429
# s: $S1
    set $S1, __ARG_2
.annotate 'line', 430
# c: $S2
    null $S2
# for loop
.annotate 'line', 431
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_3: # for condition
.const 'Sub' $P3 = 'WSubId_8'
    $P2 = $P3($S2)
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 432
    concat $S1, $S1, $S2
  __label_1: # for iteration
.annotate 'line', 431
    $P4 = __ARG_1.'getchar'()
    set $S2, $P4
    goto __label_3
  __label_2: # for end
.annotate 'line', 433
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 434
    new $P2, [ 'TokenIdentifier' ]
    getattribute $P4, __ARG_1, 'filename'
    $P2.'TokenIdentifier'($P4, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 435

.end # getident


.sub 'getnumber' :subid('WSubId_14')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 439
# s: $S1
    null $S1
.annotate 'line', 440
# c: $S2
    set $S2, __ARG_2
  __label_1: # do
.annotate 'line', 441
# {
.annotate 'line', 442
    concat $S1, $S1, $S2
.annotate 'line', 443
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
  __label_3: # continue
.const 'Sub' $P2 = 'WSubId_9'
.annotate 'line', 444
    $P1 = $P2($S2)
    if_null $P1, __label_2
    if $P1 goto __label_1
  __label_2: # enddo
.annotate 'line', 445
    iseq $I3, $S1, '0'
    unless $I3 goto __label_5
    iseq $I3, $S2, 'x'
    if $I3 goto __label_6
    iseq $I3, $S2, 'X'
  __label_6:
  __label_5:
    unless $I3 goto __label_4
# {
.annotate 'line', 446
# hexval: $I1
    null $I1
# h: $I2
    null $I2
# for loop
.annotate 'line', 447
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_9: # for condition
.const 'Sub' $P4 = 'WSubId_10'
    $P3 = $P4($S2)
    set $I2, $P3
    lt $I2, 0, __label_8
# {
.annotate 'line', 448
    mul $I3, $I1, 16
    add $I1, $I3, $I2
.annotate 'line', 449
    concat $S1, $S1, $S2
# }
  __label_7: # for iteration
.annotate 'line', 447
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_9
  __label_8: # for end
.annotate 'line', 451
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 452
    set $S1, $I1
.annotate 'line', 453
    new $P3, [ 'TokenInteger' ]
    getattribute $P5, __ARG_1, 'filename'
    $P3.'TokenInteger'($P5, __ARG_3, $S1)
    set $P1, $P3
    .return($P1)
# }
  __label_4: # endif
.annotate 'line', 455
    ne $S2, '.', __label_10
# {
  __label_12: # do
.annotate 'line', 456
# {
.annotate 'line', 457
    concat $S1, $S1, $S2
.annotate 'line', 458
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
  __label_14: # continue
.const 'Sub' $P6 = 'WSubId_9'
.annotate 'line', 459
    $P1 = $P6($S2)
    if_null $P1, __label_13
    if $P1 goto __label_12
  __label_13: # enddo
.annotate 'line', 460
    iseq $I3, $S2, 'e'
    if $I3 goto __label_16
    iseq $I3, $S2, 'E'
  __label_16:
    unless $I3 goto __label_15
# {
.annotate 'line', 461
    concat $S1, $S1, 'E'
.annotate 'line', 462
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    iseq $I3, $S2, '+'
    if $I3 goto __label_18
    iseq $I3, $S2, '-'
  __label_18:
    unless $I3 goto __label_17
# {
.annotate 'line', 463
    concat $S1, $S1, $S2
.annotate 'line', 464
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
  __label_17: # endif
# for loop
  __label_21: # for condition
.const 'Sub' $P7 = 'WSubId_9'
.annotate 'line', 466
    $P1 = $P7($S2)
    if_null $P1, __label_20
    unless $P1 goto __label_20
.annotate 'line', 467
    concat $S1, $S1, $S2
  __label_19: # for iteration
.annotate 'line', 466
    $P3 = __ARG_1.'getchar'()
    set $S2, $P3
    goto __label_21
  __label_20: # for end
# }
  __label_15: # endif
.annotate 'line', 469
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 470
    new $P3, [ 'TokenFloat' ]
    getattribute $P5, __ARG_1, 'filename'
    $P3.'TokenFloat'($P5, __ARG_3, $S1)
    set $P1, $P3
    .return($P1)
# }
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 473
    iseq $I3, $S2, 'e'
    if $I3 goto __label_24
    iseq $I3, $S2, 'E'
  __label_24:
    unless $I3 goto __label_22
# {
.annotate 'line', 474
    concat $S1, $S1, 'E'
.annotate 'line', 475
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    iseq $I3, $S2, '+'
    if $I3 goto __label_26
    iseq $I3, $S2, '-'
  __label_26:
    unless $I3 goto __label_25
# {
.annotate 'line', 476
    concat $S1, $S1, $S2
.annotate 'line', 477
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
  __label_25: # endif
# for loop
  __label_29: # for condition
.const 'Sub' $P8 = 'WSubId_9'
.annotate 'line', 479
    $P1 = $P8($S2)
    if_null $P1, __label_28
    unless $P1 goto __label_28
.annotate 'line', 480
    concat $S1, $S1, $S2
  __label_27: # for iteration
.annotate 'line', 479
    $P3 = __ARG_1.'getchar'()
    set $S2, $P3
    goto __label_29
  __label_28: # for end
.annotate 'line', 481
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 482
    new $P3, [ 'TokenFloat' ]
    getattribute $P5, __ARG_1, 'filename'
    $P3.'TokenFloat'($P5, __ARG_3, $S1)
    set $P1, $P3
    .return($P1)
# }
    goto __label_23
  __label_22: # else
# {
.annotate 'line', 485
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 486
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
.annotate 'line', 489

.end # getnumber


.sub 'getlinecomment'
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 493
# s: $S1
    set $S1, __ARG_2
# for loop
.annotate 'line', 494
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
.annotate 'line', 495
    concat $S1, $S1, $S2
  __label_1: # for iteration
.annotate 'line', 494
    $P2 = __ARG_1.'getchar'()
    set $S2, $P2
    goto __label_3
  __label_2: # for end
.annotate 'line', 496
    new $P2, [ 'TokenComment' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenComment'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 497

.end # getlinecomment


.sub 'getcomment'
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 501
# s: $S1
    set $S1, __ARG_2
.annotate 'line', 502
# c: $S2
    $P1 = __ARG_1.'getchar'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
  __label_1:
  __label_2: # do
.annotate 'line', 503
# {
# for loop
  __label_7: # for condition
.annotate 'line', 504
    isne $I1, $S2, ''
    unless $I1 goto __label_8
    isne $I1, $S2, '*'
  __label_8:
    unless $I1 goto __label_6
.annotate 'line', 505
    concat $S1, $S1, $S2
  __label_5: # for iteration
.annotate 'line', 504
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_7
  __label_6: # for end
.annotate 'line', 506
    ne $S2, '', __label_9
.const 'Sub' $P2 = 'WSubId_7'
.annotate 'line', 507
    $P2("Unclosed comment", __ARG_1, __ARG_3)
  __label_9: # endif
.annotate 'line', 508
    concat $S1, $S1, $S2
.annotate 'line', 509
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
.annotate 'line', 510
    ne $S2, '', __label_10
.const 'Sub' $P3 = 'WSubId_7'
.annotate 'line', 511
    $P3("Unclosed comment", __ARG_1, __ARG_3)
  __label_10: # endif
# }
  __label_4: # continue
.annotate 'line', 512
    ne $S2, '/', __label_2
  __label_3: # enddo
.annotate 'line', 513
    concat $S1, $S1, '/'
.annotate 'line', 514
    new $P4, [ 'TokenComment' ]
    getattribute $P5, __ARG_1, 'filename'
    $P4.'TokenComment'($P5, __ARG_3, $S1)
    set $P1, $P4
    .return($P1)
# }
.annotate 'line', 515

.end # getcomment


.sub 'getop' :subid('WSubId_15')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 519
# s: $S1
    set $S1, __ARG_2
.annotate 'line', 520
    new $P2, [ 'TokenOp' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenOp'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 521

.end # getop

.namespace [ 'Tokenizer' ]

.sub 'Tokenizer' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 537
.const 'Sub' $P2 = 'getop'
.annotate 'line', 539
    setattribute self, 'h', __ARG_1
.annotate 'line', 540
    box $P3, ''
    setattribute self, 'pending', $P3
.annotate 'line', 541
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'stacked', $P4
.annotate 'line', 542
    box $P3, __ARG_2
    setattribute self, 'filename', $P3
.annotate 'line', 543
    box $P3, 1
    setattribute self, 'line', $P3
.annotate 'line', 544
# var select: $P1
    root_new $P1, ['parrot';'Hash']
.annotate 'line', 545
    root_new $P3, ['parrot';'Hash']
    get_hll_global $P4, 'getident'
    $P3[''] = $P4
    $P3['{'] = $P2
    $P1['$'] = $P3
    get_hll_global $P5, 'getquoted'
    $P1['"'] = $P5
    get_hll_global $P6, 'getsinglequoted'
    $P1["'"] = $P6
.annotate 'line', 548
    root_new $P7, ['parrot';'Hash']
.annotate 'line', 549
    root_new $P8, ['parrot';'Hash']
    $P8[''] = $P2
    $P8['='] = $P2
    $P7['='] = $P8
    $P7[':'] = $P2
    $P1['='] = $P7
.annotate 'line', 552
    root_new $P9, ['parrot';'Hash']
    $P9['+'] = $P2
    $P9['='] = $P2
    $P1['+'] = $P9
.annotate 'line', 553
    root_new $P10, ['parrot';'Hash']
    $P10['-'] = $P2
    $P10['='] = $P2
    $P1['-'] = $P10
.annotate 'line', 554
    root_new $P11, ['parrot';'Hash']
    $P11['='] = $P2
    $P1['*'] = $P11
.annotate 'line', 555
    root_new $P12, ['parrot';'Hash']
    $P12['|'] = $P2
    $P1['|'] = $P12
.annotate 'line', 556
    root_new $P13, ['parrot';'Hash']
    $P13['&'] = $P2
    $P1['&'] = $P13
.annotate 'line', 557
    root_new $P14, ['parrot';'Hash']
.annotate 'line', 558
    root_new $P15, ['parrot';'Hash']
    $P15[''] = $P2
    get_hll_global $P16, 'getheredoc'
    $P15[':'] = $P16
    $P14['<'] = $P15
    $P14['='] = $P2
    $P1['<'] = $P14
.annotate 'line', 561
    root_new $P17, ['parrot';'Hash']
    $P17['>'] = $P2
    $P17['='] = $P2
    $P1['>'] = $P17
.annotate 'line', 562
    root_new $P18, ['parrot';'Hash']
.annotate 'line', 563
    root_new $P19, ['parrot';'Hash']
    $P19[''] = $P2
    $P19['='] = $P2
    $P18['='] = $P19
    $P1['!'] = $P18
.annotate 'line', 565
    root_new $P20, ['parrot';'Hash']
    $P20['%'] = $P2
    $P20['='] = $P2
    $P1['%'] = $P20
.annotate 'line', 566
    root_new $P21, ['parrot';'Hash']
    $P21['='] = $P2
    get_hll_global $P22, 'getlinecomment'
    $P21['/'] = $P22
    get_hll_global $P23, 'getcomment'
    $P21['*'] = $P23
    $P1['/'] = $P21
    get_hll_global $P24, 'getlinecomment'
    $P1['#'] = $P24
.annotate 'line', 569
    setattribute self, 'select', $P1
# }
.annotate 'line', 570

.end # Tokenizer


.sub 'getchar' :method
# Body
# {
.annotate 'line', 573
# var pending: $P1
    getattribute $P1, self, 'pending'
.annotate 'line', 574
# c: $S1
    set $P3, $P1
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 575
    eq $S1, '', __label_2
.annotate 'line', 576
    assign $P1, ''
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 578
# var h: $P2
    getattribute $P2, self, 'h'
.annotate 'line', 579
    $P3 = $P2.'read'(1)
    set $S1, $P3
.annotate 'line', 580
    ne $S1, "\n", __label_4
.annotate 'line', 581
    getattribute $P3, self, 'line'
    inc $P3
  __label_4: # endif
# }
  __label_3: # endif
.annotate 'line', 583
    .return($S1)
# }
.annotate 'line', 584

.end # getchar


.sub 'ungetchar' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 587
    getattribute $P1, self, 'pending'
    assign $P1, __ARG_1
# }
.annotate 'line', 588

.end # ungetchar


.sub 'get_token' :method
# Body
# {
.annotate 'line', 591
.const 'Sub' $P3 = 'isspace'
.const 'Sub' $P4 = 'isidentstart'
.const 'Sub' $P5 = 'isdigit'
.const 'Sub' $P6 = 'getop'
.const 'Sub' $P7 = 'getident'
.const 'Sub' $P8 = 'getnumber'
.annotate 'line', 594
    getattribute $P9, self, 'stacked'
    if_null $P9, __label_1
    unless $P9 goto __label_1
.annotate 'line', 595
    getattribute $P10, self, 'stacked'
    .tailcall $P10.'pop'()
  __label_1: # endif
.annotate 'line', 597
# c: $S1
    $P9 = self.'getchar'()
    null $S1
    if_null $P9, __label_2
    set $S1, $P9
  __label_2:
  __label_4: # while
.annotate 'line', 598
.const 'Sub' $P11 = 'WSubId_11'
    $P9 = $P11($S1)
    if_null $P9, __label_3
    unless $P9 goto __label_3
.annotate 'line', 599
    $P10 = self.'getchar'()
    set $S1, $P10
    goto __label_4
  __label_3: # endwhile
.annotate 'line', 600
# line: $I1
    getattribute $P9, self, 'line'
    set $I1, $P9
.annotate 'line', 601
    ne $S1, '', __label_5
.annotate 'line', 602
    new $P10, [ 'TokenEof' ]
    getattribute $P12, self, 'filename'
    $P10.'TokenEof'($P12)
    set $P9, $P10
    .return($P9)
  __label_5: # endif
.annotate 'line', 603
.const 'Sub' $P13 = 'WSubId_12'
    $P9 = $P13($S1)
    if_null $P9, __label_6
    unless $P9 goto __label_6
.annotate 'line', 604
.const 'Sub' $P14 = 'WSubId_13'
    .tailcall $P14(self, $S1, $I1)
  __label_6: # endif
.annotate 'line', 605
.const 'Sub' $P15 = 'WSubId_9'
    $P9 = $P15($S1)
    if_null $P9, __label_7
    unless $P9 goto __label_7
.annotate 'line', 606
.const 'Sub' $P16 = 'WSubId_14'
    .tailcall $P16(self, $S1, $I1)
  __label_7: # endif
.annotate 'line', 608
# op: $S2
    set $S2, $S1
.annotate 'line', 609
# var select: $P1
    getattribute $P1, self, 'select'
.annotate 'line', 610
# var current: $P2
    $P2 = $P1[$S1]
  __label_9: # while
.annotate 'line', 612
    isnull $I2, $P2
    not $I2
    unless $I2 goto __label_10
    isa $I2, $P2, 'Hash'
  __label_10:
    unless $I2 goto __label_8
# {
.annotate 'line', 613
    $P9 = self.'getchar'()
    set $S1, $P9
.annotate 'line', 614
    set $P1, $P2
.annotate 'line', 615
    $P2 = $P1[$S1]
.annotate 'line', 616
    unless_null $P2, __label_11
# {
.annotate 'line', 617
    self.'ungetchar'($S1)
.annotate 'line', 618
    $P2 = $P1['']
# }
    goto __label_12
  __label_11: # else
.annotate 'line', 621
    concat $S2, $S2, $S1
  __label_12: # endif
# }
    goto __label_9
  __label_8: # endwhile
.annotate 'line', 623
    if_null $P2, __label_13
    unless $P2 goto __label_13
.annotate 'line', 624
    .tailcall $P2(self, $S2, $I1)
  __label_13: # endif
.annotate 'line', 625
.const 'Sub' $P17 = 'WSubId_15'
    .tailcall $P17(self, $S2, $I1)
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
  __label_2: # while
.annotate 'line', 630
    $P2 = $P1.'iseof'()
    isfalse $I1, $P2
    unless $I1 goto __label_4
    not $I1, __ARG_1
  __label_4:
    unless $I1 goto __label_3
    $I1 = $P1.'iscomment'()
  __label_3:
    unless $I1 goto __label_1
.annotate 'line', 631
    $P1 = self.'get_token'()
    goto __label_2
  __label_1: # endwhile
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
.annotate 'line', 529
    addattribute $P0, 'h'
.annotate 'line', 530
    addattribute $P0, 'pending'
.annotate 'line', 531
    addattribute $P0, 'select'
.annotate 'line', 532
    addattribute $P0, 'stacked'
.annotate 'line', 533
    addattribute $P0, 'filename'
.annotate 'line', 534
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

.sub 'typetoregcheck' :subid('WSubId_82')
        .param string __ARG_1
# Body
# {
# switch
.annotate 'line', 658
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
.annotate 'line', 659
    .return('I')
  __label_4: # case
.annotate 'line', 660
    .return('N')
  __label_5: # case
.annotate 'line', 661
    .return('S')
  __label_6: # case
.annotate 'line', 662
    .return('P')
  __label_2: # default
.annotate 'line', 663
    .return('')
  __label_1: # switch end
# }
.annotate 'line', 665

.end # typetoregcheck


.sub 'typetopirname' :subid('WSubId_85')
        .param string __ARG_1
# Body
# {
# switch
.annotate 'line', 669
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
.annotate 'line', 670
    .return('int')
  __label_4: # case
.annotate 'line', 671
    .return('num')
  __label_5: # case
.annotate 'line', 672
    .return('string')
  __label_6: # case
.annotate 'line', 673
    .return('pmc')
  __label_2: # default
.const 'Sub' $P1 = 'WSubId_6'
.annotate 'line', 674
    $P1('Invalid reg type')
  __label_1: # switch end
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
    if_null $P1, __label_1
    unless $P1 goto __label_1
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
  __label_1: # endif
.annotate 'line', 720
    getattribute $P1, self, 'pendingl'
    if_null $P1, __label_2
    unless $P1 goto __label_2
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
  __label_2: # endif
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
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $P1, $P2
.annotate 'line', 732
    getattribute $P3, self, 'handle'
    $P3.'print'($P1)
    goto __label_1
  __label_2: # endfor
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
    unless_null $P3, __label_1
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
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
.annotate 'line', 752
# tline: $I1
    getattribute $P3, __ARG_1, 'line'
    set $I1, $P3
.annotate 'line', 753
    set $S2, $P1
    eq $S2, $S1, __label_3
# {
.annotate 'line', 754
    assign $P1, $S1
.annotate 'line', 755
    getattribute $P3, self, 'pendingf'
    assign $P3, 1
.annotate 'line', 756
    assign $P2, 0
# }
  __label_3: # endif
.annotate 'line', 758
    set $I2, $P2
    eq $I2, $I1, __label_4
# {
.annotate 'line', 759
    assign $P2, $I1
.annotate 'line', 760
    getattribute $P3, self, 'pendingl'
    assign $P3, 1
# }
  __label_4: # endif
# }
  __label_1: # endif
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
    if_null __ARG_2, __label_1
.annotate 'line', 776
    concat $S1, ' # ', __ARG_2
    $P1.'print'($S1)
  __label_1: # endif
.annotate 'line', 777
    $P1.'print'("\n")
# }
.annotate 'line', 778

.end # emitlabel


.sub 'emitgoto' :method
        .param string __ARG_1
        .param string __ARG_2 :optional
# Body
# {
.annotate 'line', 781
# var handle: $P1
    getattribute $P1, self, 'handle'
.annotate 'line', 782
    $P1.'print'('    goto ')
.annotate 'line', 783
    $P1.'print'(__ARG_1)
.annotate 'line', 784
    if_null __ARG_2, __label_1
.annotate 'line', 785
    concat $S1, ' # ', __ARG_2
    $P1.'print'($S1)
  __label_1: # endif
.annotate 'line', 786
    $P1.'print'("\n")
# }
.annotate 'line', 787

.end # emitgoto


.sub 'emitarg1' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 791
    concat $S1, '    ', __ARG_1
    concat $S1, $S1, ' '
    concat $S1, $S1, __ARG_2
    self.'say'($S1)
# }
.annotate 'line', 792

.end # emitarg1


.sub 'emitarg2' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 795
    concat $S1, '    ', __ARG_1
    concat $S1, $S1, ' '
    concat $S1, $S1, __ARG_2
    concat $S1, $S1, ', '
    concat $S1, $S1, __ARG_3
    self.'say'($S1)
# }
.annotate 'line', 796

.end # emitarg2


.sub 'emitcompare' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 799
    concat $S1, '    ', __ARG_1
    concat $S1, $S1, ' '
    concat $S1, $S1, __ARG_2
    concat $S1, $S1, ', '
    concat $S1, $S1, __ARG_3
    concat $S1, $S1, ', '
    concat $S1, $S1, __ARG_4
    self.'say'($S1)
# }
.annotate 'line', 800

.end # emitcompare


.sub 'emitif' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 803
    self.'say'('    if ', __ARG_1, ' goto ', __ARG_2)
# }
.annotate 'line', 804

.end # emitif


.sub 'emitunless' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 807
    self.'say'('    unless ', __ARG_1, ' goto ', __ARG_2)
# }
.annotate 'line', 808

.end # emitunless


.sub 'emitif_null' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 811
    self.'say'('    if_null ', __ARG_1, ', ', __ARG_2)
# }
.annotate 'line', 812

.end # emitif_null


.sub 'emitnull' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 815
    self.'say'("    null ", __ARG_1)
# }
.annotate 'line', 816

.end # emitnull


.sub 'emitinc' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 820
    self.'say'('    inc ', __ARG_1)
# }
.annotate 'line', 821

.end # emitinc


.sub 'emitdec' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 824
    self.'say'('    dec ', __ARG_1)
# }
.annotate 'line', 825

.end # emitdec


.sub 'emitset' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 828
    self.'say'("    set ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 829

.end # emitset


.sub 'emitassign' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 832
    self.'say'("    assign ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 833

.end # emitassign


.sub 'emitbox' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 836
    self.'say'("    box ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 837

.end # emitbox


.sub 'emitunbox' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 840
    self.'say'("    unbox ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 841

.end # emitunbox


.sub 'emitbinop' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 844
    self.'say'('    ', __ARG_1, " ", __ARG_2, ", ", __ARG_3, ", ", __ARG_4)
# }
.annotate 'line', 845

.end # emitbinop


.sub 'emitaddto' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 848
    self.'say'("    add ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 849

.end # emitaddto


.sub 'emitsubto' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 852
    self.'say'("    sub ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 853

.end # emitsubto


.sub 'emitadd' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 856
    self.'say'("    add ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 857

.end # emitadd


.sub 'emitsub' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 860
    self.'say'("    sub ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 861

.end # emitsub


.sub 'emitmul' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 864
    self.'say'("    mul ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 865

.end # emitmul


.sub 'emitdiv' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 868
    self.'say'("    div ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 869

.end # emitdiv


.sub 'emitconcat1' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 872
    self.'say'("    concat ", __ARG_1, ", ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 873

.end # emitconcat1


.sub 'emitconcat' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 876
    self.'say'("    concat ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 877

.end # emitconcat


.sub 'emitrepeat' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 880
    self.'say'("    repeat ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 881

.end # emitrepeat


.sub 'emitprint' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 884
    self.'say'('    print ', __ARG_1)
# }
.annotate 'line', 885

.end # emitprint


.sub 'emitsay' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 888
    self.'say'('    say ', __ARG_1)
# }
.annotate 'line', 889

.end # emitsay


.sub 'emitfind_lex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 892
    concat $S1, "    find_lex ", __ARG_1
    concat $S1, $S1, ", '"
    concat $S1, $S1, __ARG_2
    concat $S1, $S1, "'"
    self.'say'($S1)
# }
.annotate 'line', 893

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

.sub 'integerValue' :subid('WSubId_16')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 902
    new $P2, [ 'IntegerLiteral' ]
    $P2.'IntegerLiteral'(__ARG_1, __ARG_2, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 903

.end # integerValue


.sub 'floatValue' :subid('WSubId_49')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param num __ARG_3
# Body
# {
.annotate 'line', 907
# var t: $P1
    new $P1, [ 'TokenFloat' ]
    getattribute $P2, __ARG_2, 'file'
    getattribute $P3, __ARG_2, 'line'
    $P1.'TokenFloat'($P2, $P3, __ARG_3)
.annotate 'line', 908
    new $P3, [ 'FloatLiteral' ]
    $P3.'FloatLiteral'(__ARG_1, $P1)
    set $P2, $P3
    .return($P2)
# }
.annotate 'line', 909

.end # floatValue


.sub 'floatresult' :subid('WSubId_50')
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 917
# result: $I1
    iseq $I1, __ARG_1, 'N'
    unless $I1 goto __label_2
    iseq $I1, __ARG_2, 'N'
    if $I1 goto __label_3
    iseq $I1, __ARG_2, 'I'
  __label_3:
  __label_2:
    if $I1 goto __label_1
.annotate 'line', 918
    iseq $I1, __ARG_2, 'N'
    unless $I1 goto __label_4
    iseq $I1, __ARG_1, 'N'
    if $I1 goto __label_5
    iseq $I1, __ARG_1, 'I'
  __label_5:
  __label_4:
  __label_1:
.annotate 'line', 919
    .return($I1)
# }
.annotate 'line', 920

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
.annotate 'line', 957
# l: $I2
# predefined length
    length $I3, __ARG_2
    sub $I2, $I3, 1
.annotate 'line', 958
# predefined substr
    substr $S1, __ARG_2, $I2, 1
    ne $S1, "\n", __label_1
.annotate 'line', 959
# predefined substr
    substr __ARG_2, __ARG_2, 0, $I2
  __label_1: # endif
.annotate 'line', 960
# predefined split
    split $P1, "\n", __ARG_2
# predefined join
    join $S1, "\n    ", $P1
    concat $S0, '    ', $S1
    set __ARG_2, $S0
.annotate 'line', 961
    box $P1, __ARG_2
    setattribute self, 'body', $P1
.annotate 'line', 962
    box $P1, __ARG_1
    setattribute self, 'typeresult', $P1
# }
.annotate 'line', 963

.end # Predef_frombody


.sub 'invoke' :method :vtable
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 966
# typeresult: $S1
    getattribute $P2, self, 'typeresult'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 968
    ne $S1, 'v', __label_2
# {
.annotate 'line', 969
    isnull $I1, __ARG_3
    not $I1
    unless $I1 goto __label_5
    isne $I1, __ARG_3, ''
  __label_5:
    unless $I1 goto __label_4
.const 'Sub' $P3 = 'WSubId_1'
.annotate 'line', 970
    $P3('using return value from void predef')
  __label_4: # endif
# }
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 973
    isnull $I1, __ARG_3
    if $I1 goto __label_7
    iseq $I1, __ARG_3, ''
  __label_7:
    unless $I1 goto __label_6
.const 'Sub' $P4 = 'WSubId_6'
.annotate 'line', 974
    $P4('Bad result in non void predef')
  __label_6: # endif
# }
  __label_3: # endif
.annotate 'line', 977
# var builder: $P1
    new $P1, [ 'StringBuilder' ]
.annotate 'line', 978
    getattribute $P2, self, 'body'
    $P1.'append_format'($P2, __ARG_3, __ARG_4 :flat)
.annotate 'line', 979
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 980
# predefined string
    set $S2, $P1
    __ARG_1.'say'($S2)
# }
.annotate 'line', 981

.end # invoke

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Predef_frombody' ]
.annotate 'line', 943
    addattribute $P0, 'body'
.annotate 'line', 944
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
.annotate 'line', 1002
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 1003
    isa $I2, __ARG_2, 'String'
    unless $I2 goto __label_1
.annotate 'line', 1004
    new $P3, [ 'Predef_frombody' ]
    $P3.'Predef_frombody'(__ARG_3, __ARG_2)
    set $P2, $P3
    setattribute self, 'body', $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 1006
    setattribute self, 'body', __ARG_2
  __label_2: # endif
.annotate 'line', 1007
    box $P1, __ARG_3
    setattribute self, 'typeresult', $P1
.annotate 'line', 1008
# n: $I1
    null $I1
.annotate 'line', 1009
    if_null __ARG_4, __label_3
# {
.annotate 'line', 1010
    box $P1, __ARG_4
    setattribute self, 'type0', $P1
# switch
.annotate 'line', 1011
    set $S1, __ARG_4
    set $S2, '*'
    if $S1 == $S2 goto __label_6
    set $S2, '!'
    if $S1 == $S2 goto __label_7
    goto __label_5
  __label_6: # case
.annotate 'line', 1013
    set $I1, -1
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 1016
    set $I1, -2
.annotate 'line', 1017
    if_null __ARG_5, __label_8
.const 'Sub' $P5 = 'WSubId_6'
.annotate 'line', 1018
    concat $S3, "Invalid predef '", __ARG_1
    concat $S3, $S3, '"'
    $P5($S3)
  __label_8: # endif
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 1021
    set $I1, 1
.annotate 'line', 1022
    if_null __ARG_5, __label_9
# {
.annotate 'line', 1023
    box $P1, __ARG_5
    setattribute self, 'type1', $P1
.annotate 'line', 1024
    inc $I1
# }
  __label_9: # endif
.annotate 'line', 1026
    if_null __ARG_6, __label_10
# {
.annotate 'line', 1027
    box $P1, __ARG_6
    setattribute self, 'type2', $P1
.annotate 'line', 1028
    inc $I1
# }
  __label_10: # endif
.annotate 'line', 1030
    if_null __ARG_7, __label_11
# {
.annotate 'line', 1031
    box $P1, __ARG_7
    setattribute self, 'type3', $P1
.annotate 'line', 1032
    inc $I1
# }
  __label_11: # endif
  __label_4: # switch end
# }
  __label_3: # endif
.annotate 'line', 1036
    box $P1, $I1
    setattribute self, 'nparams', $P1
# }
.annotate 'line', 1037

.end # PredefBase


.sub 'name' :method
# Body
# {
.annotate 'line', 1040
# name: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 1041
    .return($S1)
# }
.annotate 'line', 1042

.end # name


.sub 'result' :method
# Body
# {
.annotate 'line', 1045
    getattribute $P1, self, 'typeresult'
    .return($P1)
# }
.annotate 'line', 1046

.end # result


.sub 'params' :method
# Body
# {
.annotate 'line', 1047
    getattribute $P1, self, 'nparams'
    .return($P1)
# }

.end # params


.sub 'paramtype' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 1050
# type: $S1
    null $S1
# switch
.annotate 'line', 1051
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
.annotate 'line', 1052
    getattribute $P1, self, 'type0'
    set $S1, $P1
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 1053
    getattribute $P2, self, 'type1'
    set $S1, $P2
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 1054
    getattribute $P3, self, 'type2'
    set $S1, $P3
    goto __label_1 # break
  __label_6: # case
.annotate 'line', 1055
    getattribute $P4, self, 'type3'
    set $S1, $P4
    goto __label_1 # break
  __label_2: # default
.const 'Sub' $P5 = 'WSubId_6'
.annotate 'line', 1057
    $P5('Invalid predef arg')
  __label_1: # switch end
.annotate 'line', 1059
    .return($S1)
# }
.annotate 'line', 1060

.end # paramtype


.sub 'expand' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 1063
# predefined string
    getattribute $P2, self, 'name'
    set $S2, $P2
    concat $S3, 'predefined ', $S2
    __ARG_1.'comment'($S3)
.annotate 'line', 1064
# typeresult: $S1
    getattribute $P2, self, 'typeresult'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1065
    isne $I1, $S1, 'v'
    unless $I1 goto __label_3
    iseq $I1, __ARG_4, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 1066
    $P2 = __ARG_2.'tempreg'($S1)
    set __ARG_4, $P2
  __label_2: # endif
.annotate 'line', 1067
# var fun: $P1
    getattribute $P1, self, 'body'
.annotate 'line', 1068
    $P1(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
# }
.annotate 'line', 1069

.end # expand

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'PredefBase' ]
.annotate 'line', 986
    addattribute $P0, 'name'
.annotate 'line', 987
    addattribute $P0, 'body'
.annotate 'line', 988
    addattribute $P0, 'typeresult'
.annotate 'line', 989
    addattribute $P0, 'type0'
.annotate 'line', 990
    addattribute $P0, 'type1'
.annotate 'line', 991
    addattribute $P0, 'type2'
.annotate 'line', 992
    addattribute $P0, 'type3'
.annotate 'line', 993
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
.annotate 'line', 1081
    self.'PredefBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7)
# }
.annotate 'line', 1082

.end # PredefFunction

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'PredefFunction' ]
.annotate 'line', 1072
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
.annotate 'line', 1095
    self.'PredefBase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7, __ARG_8)
.annotate 'line', 1096
    setattribute self, 'evalfun', __ARG_2
# }
.annotate 'line', 1097

.end # PredefFunctionEval

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'PredefFunctionEval' ]
.annotate 'line', 1085
    get_class $P1, [ 'PredefBase' ]
    addparent $P0, $P1
.annotate 'line', 1087
    addattribute $P0, 'evalfun'
.end
.namespace [ 'Predef_typecast' ]

.sub 'Predef_typecast' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1105
    box $P1, __ARG_1
    setattribute self, 'type', $P1
# }
.annotate 'line', 1106

.end # Predef_typecast


.sub 'invoke' :method :vtable
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 1109
# type: $S1
    getattribute $P2, self, 'type'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1110
# predefined elements
    elements $I1, __ARG_4
    eq $I1, 1, __label_2
.const 'Sub' $P3 = 'WSubId_6'
.annotate 'line', 1111
    $P3("Invalid Predef_typecast.invoke call")
  __label_2: # endif
.annotate 'line', 1112
# var rawarg: $P1
    $P1 = __ARG_4[0]
.annotate 'line', 1113
# argtype: $S2
    $P2 = $P1.'checkresult'()
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
# switch-case
.annotate 'line', 1115
    iseq $I1, $S2, $S1
    if $I1 goto __label_6
.annotate 'line', 1116
    isa $I1, $P1, [ 'IndexExpr' ]
    if $I1 goto __label_7
    goto __label_5
  __label_6: # case
  __label_7: # case
.annotate 'line', 1117
    $P1.'emit'(__ARG_1, __ARG_3)
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 1120
# arg: $S3
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P2, __label_8
    set $S3, $P2
  __label_8:
.annotate 'line', 1121
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1123
    ne $S3, 'null', __label_9
.annotate 'line', 1124
    __ARG_1.'emitnull'(__ARG_3)
    goto __label_10
  __label_9: # else
.annotate 'line', 1126
    __ARG_1.'emitset'(__ARG_3, $S3)
  __label_10: # endif
  __label_4: # switch end
# }
.annotate 'line', 1128

.end # invoke

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Predef_typecast' ]
.annotate 'line', 1102
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
.annotate 'line', 1133
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1134
# n: $I1
# predefined elements
    elements $I3, __ARG_4
    sub $I1, $I3, 1
.annotate 'line', 1135
    lt $I1, 0, __label_1
# {
# for loop
.annotate 'line', 1136
# i: $I2
    null $I2
  __label_5: # for condition
    ge $I2, $I1, __label_4
.annotate 'line', 1137
    $P1 = __ARG_4[$I2]
    __ARG_1.'emitprint'($P1)
  __label_3: # for iteration
.annotate 'line', 1136
    inc $I2
    goto __label_5
  __label_4: # for end
.annotate 'line', 1138
    $P1 = __ARG_4[$I1]
    __ARG_1.'emitsay'($P1)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 1141
    __ARG_1.'emitsay'("''")
  __label_2: # endif
# }
.annotate 'line', 1142

.end # Predef_say


.sub 'Predef_cry'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 1146
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1147
    __ARG_1.'say'('    ', "getstderr $P0")
.annotate 'line', 1148
    iter $P1, __ARG_4
    set $P1, 0
  __label_1: # for iteration
    unless $P1 goto __label_2
    shift $S1, $P1
.annotate 'line', 1149
    __ARG_1.'say'('    ', "print $P0, ", $S1)
    goto __label_1
  __label_2: # endfor
.annotate 'line', 1150
    __ARG_1.'say'('    ', "print $P0, \"\\n\"")
# }
.annotate 'line', 1151

.end # Predef_cry


.sub 'Predef_print'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 1155
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1156
    iter $P1, __ARG_4
    set $P1, 0
  __label_1: # for iteration
    unless $P1 goto __label_2
    shift $S1, $P1
.annotate 'line', 1157
    __ARG_1.'emitprint'($S1)
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 1158

.end # Predef_print


.sub 'Predef_invoke'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 1164
# var arg: $P1
    $P1 = __ARG_4[0]
.annotate 'line', 1165
    isa $I2, $P1, [ 'CallExpr' ]
    not $I1, $I2
    unless $I1 goto __label_1
.const 'Sub' $P2 = 'WSubId_1'
.annotate 'line', 1166
    $P2("invoke argument must be callable", __ARG_2)
  __label_1: # endif
.annotate 'line', 1167
    concat $S1, "(", __ARG_3
    concat $S1, $S1, " :call_sig)"
    $P1.'emit'(__ARG_1, $S1)
# }
.annotate 'line', 1168

.end # Predef_invoke


.sub 'predefeval_length' :subid('WSubId_17')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1172
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1173
# s: $S1
    $P2 = $P1.'get_value'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1174
.const 'Sub' $P3 = 'WSubId_16'
# predefined length
.annotate 'line', 1171
    length $I1, $S1
.annotate 'line', 1174
    .tailcall $P3(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1175

.end # predefeval_length


.sub 'predefeval_bytelength' :subid('WSubId_18')
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
# predefined bytelength
.annotate 'line', 1178
    bytelength $I1, $S1
.annotate 'line', 1181
    .tailcall $P3(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1182

.end # predefeval_bytelength


.sub 'predefeval_ord' :subid('WSubId_20')
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
# predefined ord
.annotate 'line', 1185
    ord $I1, $S1
.annotate 'line', 1188
    .tailcall $P3(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1189

.end # predefeval_ord


.sub 'predefeval_ord_n' :subid('WSubId_21')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1193
# var arg: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1194
# s: $S1
    $P3 = $P1.'get_value'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 1195
# var argn: $P2
    $P3 = __ARG_3[1]
    getattribute $P2, $P3, 'arg'
.annotate 'line', 1196
# n: $I1
    getattribute $P3, $P2, 'numval'
    set $I1, $P3
.annotate 'line', 1197
.const 'Sub' $P4 = 'WSubId_16'
# predefined ord
.annotate 'line', 1192
    ord $I2, $S1, $I1
.annotate 'line', 1197
    .tailcall $P4(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 1198

.end # predefeval_ord_n


.sub 'predefeval_chr' :subid('WSubId_19')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1202
# var arg: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1204
# n: $I1
    getattribute $P3, $P1, 'numval'
    set $I1, $P3
.annotate 'line', 1205
# s: $S1
# predefined chr
    chr $S0, $I1
    find_encoding $I0, 'utf8'
    trans_encoding $S1, $S0, $I0
.annotate 'line', 1207
# var t: $P2
    new $P2, [ 'TokenQuoted' ]
    getattribute $P3, __ARG_2, 'file'
    getattribute $P4, __ARG_2, 'line'
    $P2.'TokenQuoted'($P3, $P4, $S1)
.annotate 'line', 1208
    new $P4, [ 'StringLiteral' ]
    $P4.'StringLiteral'(__ARG_1, $P2)
    set $P3, $P4
    .return($P3)
# }
.annotate 'line', 1209

.end # predefeval_chr


.sub 'predefeval_substr' :subid('WSubId_22')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1213
# var argstr: $P1
    $P4 = __ARG_3[0]
    getattribute $P1, $P4, 'arg'
.annotate 'line', 1214
# var argpos: $P2
    $P4 = __ARG_3[1]
    getattribute $P2, $P4, 'arg'
.annotate 'line', 1215
# str: $S1
    $P4 = $P1.'get_value'()
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 1216
# pos: $I1
    getattribute $P4, $P2, 'numval'
    set $I1, $P4
.annotate 'line', 1218
# var t: $P3
    new $P3, [ 'TokenQuoted' ]
    getattribute $P4, __ARG_2, 'file'
    getattribute $P5, __ARG_2, 'line'
# predefined substr
    substr $S2, $S1, $I1
    $P3.'TokenQuoted'($P4, $P5, $S2)
.annotate 'line', 1219
    new $P5, [ 'StringLiteral' ]
    $P5.'StringLiteral'(__ARG_1, $P3)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 1220

.end # predefeval_substr


.sub 'predefeval_substr_l' :subid('WSubId_23')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1224
# var argstr: $P1
    $P5 = __ARG_3[0]
    getattribute $P1, $P5, 'arg'
.annotate 'line', 1225
# var argpos: $P2
    $P5 = __ARG_3[1]
    getattribute $P2, $P5, 'arg'
.annotate 'line', 1226
# var arglen: $P3
    $P5 = __ARG_3[2]
    getattribute $P3, $P5, 'arg'
.annotate 'line', 1227
# str: $S1
    $P5 = $P1.'get_value'()
    null $S1
    if_null $P5, __label_1
    set $S1, $P5
  __label_1:
.annotate 'line', 1228
# pos: $I1
    getattribute $P5, $P2, 'numval'
    set $I1, $P5
.annotate 'line', 1229
# len: $I2
    getattribute $P5, $P3, 'numval'
    set $I2, $P5
.annotate 'line', 1231
# var t: $P4
    new $P4, [ 'TokenQuoted' ]
    getattribute $P5, __ARG_2, 'file'
    getattribute $P6, __ARG_2, 'line'
# predefined substr
    substr $S2, $S1, $I1, $I2
    $P4.'TokenQuoted'($P5, $P6, $S2)
.annotate 'line', 1232
    new $P6, [ 'StringLiteral' ]
    $P6.'StringLiteral'(__ARG_1, $P4)
    set $P5, $P6
    .return($P5)
# }
.annotate 'line', 1233

.end # predefeval_substr_l


.sub 'predefeval_indexof' :subid('WSubId_24')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1237
# var argstrfrom: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1238
# var argstrsearch: $P2
    $P3 = __ARG_3[1]
    getattribute $P2, $P3, 'arg'
.annotate 'line', 1239
# strfrom: $S1
    $P3 = $P1.'get_value'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 1240
# strsearch: $S2
    $P3 = $P2.'get_value'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 1241
.const 'Sub' $P4 = 'WSubId_16'
# predefined indexof
.annotate 'line', 1236
    index $I1, $S1, $S2
.annotate 'line', 1241
    .tailcall $P4(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1242

.end # predefeval_indexof


.sub 'predefeval_indexof_pos' :subid('WSubId_25')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1246
# var argstrfrom: $P1
    $P4 = __ARG_3[0]
    getattribute $P1, $P4, 'arg'
.annotate 'line', 1247
# var argstrsearch: $P2
    $P4 = __ARG_3[1]
    getattribute $P2, $P4, 'arg'
.annotate 'line', 1248
# var argpos: $P3
    $P4 = __ARG_3[2]
    getattribute $P3, $P4, 'arg'
.annotate 'line', 1249
# strfrom: $S1
    $P4 = $P1.'get_value'()
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 1250
# strsearch: $S2
    $P4 = $P2.'get_value'()
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 1251
# pos: $I1
    getattribute $P4, $P3, 'numval'
    set $I1, $P4
.annotate 'line', 1252
.const 'Sub' $P5 = 'WSubId_16'
# predefined indexof
.annotate 'line', 1245
    index $I2, $S1, $S2, $I1
.annotate 'line', 1252
    .tailcall $P5(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 1253

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
.annotate 'line', 1266
.const 'Sub' $P11 = 'Predef_print'
.const 'Sub' $P12 = 'Predef_say'
.const 'Sub' $P13 = 'Predef_cry'
.const 'Sub' $P14 = 'Predef_invoke'
.annotate 'line', 1268
# var predefs: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1269
    new $P17, [ 'PredefFunction' ]
.annotate 'line', 1270
    new $P19, [ 'Predef_typecast' ]
    $P19.'Predef_typecast'('I')
    set $P18, $P19
    $P17.'PredefFunction'('int', $P18, 'I', '!')
    set $P16, $P17
.annotate 'line', 1268
    push $P1, $P16
.annotate 'line', 1273
    new $P21, [ 'PredefFunction' ]
.annotate 'line', 1274
    new $P23, [ 'Predef_typecast' ]
    $P23.'Predef_typecast'('N')
    set $P22, $P23
    $P21.'PredefFunction'('float', $P22, 'N', '!')
    set $P20, $P21
.annotate 'line', 1268
    push $P1, $P20
.annotate 'line', 1277
    new $P25, [ 'PredefFunction' ]
.annotate 'line', 1278
    new $P27, [ 'Predef_typecast' ]
    $P27.'Predef_typecast'('S')
    set $P26, $P27
    $P25.'PredefFunction'('string', $P26, 'S', '!')
    set $P24, $P25
.annotate 'line', 1268
    push $P1, $P24
.annotate 'line', 1281
    new $P29, [ 'PredefFunction' ]
    $P29.'PredefFunction'('die', 'die %1', 'v', 'S')
    set $P28, $P29
.annotate 'line', 1268
    push $P1, $P28
.annotate 'line', 1285
    new $P31, [ 'PredefFunction' ]
    $P31.'PredefFunction'('exit', 'exit %1', 'v', 'I')
    set $P30, $P31
.annotate 'line', 1268
    push $P1, $P30
.annotate 'line', 1289
    new $P33, [ 'PredefFunction' ]
    $P33.'PredefFunction'('time', 'time %0', 'I')
    set $P32, $P33
.annotate 'line', 1268
    push $P1, $P32
.annotate 'line', 1293
    new $P35, [ 'PredefFunction' ]
    $P35.'PredefFunction'('floattime', 'time %0', 'N')
    set $P34, $P35
.annotate 'line', 1268
    push $P1, $P34
.annotate 'line', 1297
    new $P37, [ 'PredefFunction' ]
    $P37.'PredefFunction'('spawnw', 'spawnw %0, %1', 'I', 'P')
    set $P36, $P37
.annotate 'line', 1268
    push $P1, $P36
.annotate 'line', 1301
    new $P39, [ 'PredefFunction' ]
    $P39.'PredefFunction'('getstdin', 'getstdin %0', 'P')
    set $P38, $P39
.annotate 'line', 1268
    push $P1, $P38
.annotate 'line', 1305
    new $P41, [ 'PredefFunction' ]
    $P41.'PredefFunction'('getstdout', 'getstdout %0', 'P')
    set $P40, $P41
.annotate 'line', 1268
    push $P1, $P40
.annotate 'line', 1309
    new $P43, [ 'PredefFunction' ]
    $P43.'PredefFunction'('getstderr', 'getstderr %0', 'P')
    set $P42, $P43
.annotate 'line', 1268
    push $P1, $P42
.annotate 'line', 1313
    new $P45, [ 'PredefFunction' ]
    $P45.'PredefFunction'('open', "root_new %0, ['parrot';'FileHandle']\n%0.'open'(%1)\n", 'P', 'S')
    set $P44, $P45
.annotate 'line', 1268
    push $P1, $P44
.annotate 'line', 1320
    new $P47, [ 'PredefFunction' ]
    $P47.'PredefFunction'('open', "root_new %0, ['parrot';'FileHandle']\n%0.'open'(%1,%2)\n", 'P', 'S', 'S')
    set $P46, $P47
.annotate 'line', 1268
    push $P1, $P46
.annotate 'line', 1327
    new $P49, [ 'PredefFunction' ]
    $P49.'PredefFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n", 'P', 'S')
    set $P48, $P49
.annotate 'line', 1268
    push $P1, $P48
.annotate 'line', 1334
    new $P51, [ 'PredefFunction' ]
    $P51.'PredefFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n", 'P', 'S', 'I')
    set $P50, $P51
.annotate 'line', 1268
    push $P1, $P50
.annotate 'line', 1342
    new $P53, [ 'PredefFunction' ]
    $P53.'PredefFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n%0['type'] = %3\n", 'P', 'S', 'I', 'I')
    set $P52, $P53
.annotate 'line', 1268
    push $P1, $P52
.annotate 'line', 1351
    new $P55, [ 'PredefFunction' ]
    $P55.'PredefFunction'('elements', 'elements %0, %1', 'I', 'P')
    set $P54, $P55
.annotate 'line', 1268
    push $P1, $P54
.annotate 'line', 1355
    new $P57, [ 'PredefFunctionEval' ]
.annotate 'line', 1356
    $P57.'PredefFunctionEval'('length', $P2, 'length %0, %1', 'I', 'S')
    set $P56, $P57
.annotate 'line', 1268
    push $P1, $P56
.annotate 'line', 1360
    new $P59, [ 'PredefFunctionEval' ]
.annotate 'line', 1361
    $P59.'PredefFunctionEval'('bytelength', $P3, 'bytelength %0, %1', 'I', 'S')
    set $P58, $P59
.annotate 'line', 1268
    push $P1, $P58
.annotate 'line', 1365
    new $P61, [ 'PredefFunctionEval' ]
.annotate 'line', 1366
    $P61.'PredefFunctionEval'('chr', $P4, "chr $S0, %1\nfind_encoding $I0, 'utf8'\ntrans_encoding %0, $S0, $I0\n", 'S', 'I')
    set $P60, $P61
.annotate 'line', 1268
    push $P1, $P60
.annotate 'line', 1374
    new $P63, [ 'PredefFunctionEval' ]
.annotate 'line', 1375
    $P63.'PredefFunctionEval'('ord', $P5, 'ord %0, %1', 'I', 'S')
    set $P62, $P63
.annotate 'line', 1268
    push $P1, $P62
.annotate 'line', 1379
    new $P65, [ 'PredefFunctionEval' ]
.annotate 'line', 1380
    $P65.'PredefFunctionEval'('ord', $P6, 'ord %0, %1, %2', 'I', 'S', 'I')
    set $P64, $P65
.annotate 'line', 1268
    push $P1, $P64
.annotate 'line', 1384
    new $P67, [ 'PredefFunctionEval' ]
.annotate 'line', 1385
    $P67.'PredefFunctionEval'('substr', $P7, 'substr %0, %1, %2', 'S', 'S', 'I')
    set $P66, $P67
.annotate 'line', 1268
    push $P1, $P66
.annotate 'line', 1389
    new $P69, [ 'PredefFunctionEval' ]
.annotate 'line', 1390
    $P69.'PredefFunctionEval'('substr', $P8, 'substr %0, %1, %2, %3', 'S', 'S', 'I', 'I')
    set $P68, $P69
.annotate 'line', 1268
    push $P1, $P68
.annotate 'line', 1394
    new $P71, [ 'PredefFunction' ]
    $P71.'PredefFunction'('replace', 'replace %0, %1, %2, %3, %4', 'S', 'S', 'I', 'I', 'S')
    set $P70, $P71
.annotate 'line', 1268
    push $P1, $P70
.annotate 'line', 1398
    new $P73, [ 'PredefFunctionEval' ]
.annotate 'line', 1399
    $P73.'PredefFunctionEval'('indexof', $P9, 'index %0, %1, %2', 'I', 'S', 'S')
    set $P72, $P73
.annotate 'line', 1268
    push $P1, $P72
.annotate 'line', 1403
    new $P75, [ 'PredefFunctionEval' ]
.annotate 'line', 1404
    $P75.'PredefFunctionEval'('indexof', $P10, 'index %0, %1, %2, %3', 'I', 'S', 'S', 'I')
    set $P74, $P75
.annotate 'line', 1268
    push $P1, $P74
.annotate 'line', 1408
    new $P77, [ 'PredefFunction' ]
    $P77.'PredefFunction'('join', 'join %0, %1, %2', 'S', 'S', 'P')
    set $P76, $P77
.annotate 'line', 1268
    push $P1, $P76
.annotate 'line', 1412
    new $P79, [ 'PredefFunction' ]
    $P79.'PredefFunction'('upcase', 'upcase %0, %1', 'S', 'S')
    set $P78, $P79
.annotate 'line', 1268
    push $P1, $P78
.annotate 'line', 1416
    new $P81, [ 'PredefFunction' ]
    $P81.'PredefFunction'('downcase', 'downcase %0, %1', 'S', 'S')
    set $P80, $P81
.annotate 'line', 1268
    push $P1, $P80
.annotate 'line', 1420
    new $P83, [ 'PredefFunction' ]
    $P83.'PredefFunction'('titlecase', 'titlecase %0, %1', 'S', 'S')
    set $P82, $P83
.annotate 'line', 1268
    push $P1, $P82
.annotate 'line', 1424
    new $P85, [ 'PredefFunction' ]
    $P85.'PredefFunction'('split', 'split %0, %1, %2', 'P', 'S', 'S')
    set $P84, $P85
.annotate 'line', 1268
    push $P1, $P84
.annotate 'line', 1428
    new $P87, [ 'PredefFunction' ]
    $P87.'PredefFunction'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n%0 = $P0(%1)\n", 'S', 'S')
    set $P86, $P87
.annotate 'line', 1268
    push $P1, $P86
.annotate 'line', 1435
    new $P89, [ 'PredefFunction' ]
    $P89.'PredefFunction'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n%0 = $P0(%1, %2)\n", 'S', 'S', 'S')
    set $P88, $P89
.annotate 'line', 1268
    push $P1, $P88
.annotate 'line', 1442
    new $P91, [ 'PredefFunction' ]
    $P91.'PredefFunction'('push', 'push %1, %2', 'v', 'P', '?')
    set $P90, $P91
.annotate 'line', 1268
    push $P1, $P90
.annotate 'line', 1446
    new $P93, [ 'PredefFunction' ]
    $P93.'PredefFunction'('sqrt', 'sqrt %0, %1', 'N', 'N')
    set $P92, $P93
.annotate 'line', 1268
    push $P1, $P92
.annotate 'line', 1450
    new $P95, [ 'PredefFunction' ]
    $P95.'PredefFunction'('pow', 'pow %0, %1, %2', 'N', 'N', 'N')
    set $P94, $P95
.annotate 'line', 1268
    push $P1, $P94
.annotate 'line', 1454
    new $P97, [ 'PredefFunction' ]
    $P97.'PredefFunction'('exp', 'exp %0, %1', 'N', 'N')
    set $P96, $P97
.annotate 'line', 1268
    push $P1, $P96
.annotate 'line', 1458
    new $P99, [ 'PredefFunction' ]
    $P99.'PredefFunction'('ln', 'ln %0, %1', 'N', 'N')
    set $P98, $P99
.annotate 'line', 1268
    push $P1, $P98
.annotate 'line', 1462
    new $P101, [ 'PredefFunction' ]
    $P101.'PredefFunction'('sin', 'sin %0, %1', 'N', 'N')
    set $P100, $P101
.annotate 'line', 1268
    push $P1, $P100
.annotate 'line', 1466
    new $P103, [ 'PredefFunction' ]
    $P103.'PredefFunction'('cos', 'cos %0, %1', 'N', 'N')
    set $P102, $P103
.annotate 'line', 1268
    push $P1, $P102
.annotate 'line', 1470
    new $P105, [ 'PredefFunction' ]
    $P105.'PredefFunction'('tan', 'tan %0, %1', 'N', 'N')
    set $P104, $P105
.annotate 'line', 1268
    push $P1, $P104
.annotate 'line', 1474
    new $P107, [ 'PredefFunction' ]
    $P107.'PredefFunction'('asin', 'asin %0, %1', 'N', 'N')
    set $P106, $P107
.annotate 'line', 1268
    push $P1, $P106
.annotate 'line', 1478
    new $P109, [ 'PredefFunction' ]
    $P109.'PredefFunction'('acos', 'acos %0, %1', 'N', 'N')
    set $P108, $P109
.annotate 'line', 1268
    push $P1, $P108
.annotate 'line', 1482
    new $P111, [ 'PredefFunction' ]
    $P111.'PredefFunction'('atan', 'atan %0, %1', 'N', 'N')
    set $P110, $P111
.annotate 'line', 1268
    push $P1, $P110
.annotate 'line', 1486
    new $P113, [ 'PredefFunction' ]
    $P113.'PredefFunction'('atan', 'atan %0, %1, %2', 'N', 'N', 'N')
    set $P112, $P113
.annotate 'line', 1268
    push $P1, $P112
.annotate 'line', 1490
    new $P115, [ 'PredefFunction' ]
    $P115.'PredefFunction'('getinterp', 'getinterp %0', 'P')
    set $P114, $P115
.annotate 'line', 1268
    push $P1, $P114
.annotate 'line', 1494
    new $P117, [ 'PredefFunction' ]
    $P117.'PredefFunction'('get_class', 'get_class %0, %1', 'P', 'S')
    set $P116, $P117
.annotate 'line', 1268
    push $P1, $P116
.annotate 'line', 1498
    new $P119, [ 'PredefFunction' ]
    $P119.'PredefFunction'('typeof', 'typeof %0, %1', 'P', 'P')
    set $P118, $P119
.annotate 'line', 1268
    push $P1, $P118
.annotate 'line', 1502
    new $P121, [ 'PredefFunction' ]
    $P121.'PredefFunction'('getattribute', 'getattribute %0, %1, %2', 'P', 'P', 'S')
    set $P120, $P121
.annotate 'line', 1268
    push $P1, $P120
.annotate 'line', 1506
    new $P123, [ 'PredefFunction' ]
    $P123.'PredefFunction'('find_method', 'find_method %0, %1, %2', 'P', 'P', 'S')
    set $P122, $P123
.annotate 'line', 1268
    push $P1, $P122
.annotate 'line', 1510
    new $P125, [ 'PredefFunction' ]
    $P125.'PredefFunction'('callmethodwithargs', '%0 = %1.%2(%3 :flat)', 'P', 'P', 'P', 'P')
    set $P124, $P125
.annotate 'line', 1268
    push $P1, $P124
.annotate 'line', 1514
    new $P127, [ 'PredefFunction' ]
    $P127.'PredefFunction'('clone', 'clone %0, %1', 'P', 'P')
    set $P126, $P127
.annotate 'line', 1268
    push $P1, $P126
.annotate 'line', 1518
    new $P129, [ 'PredefFunction' ]
    $P129.'PredefFunction'('compreg', 'compreg %0, %1', 'P', 'S')
    set $P128, $P129
.annotate 'line', 1268
    push $P1, $P128
.annotate 'line', 1522
    new $P131, [ 'PredefFunction' ]
    $P131.'PredefFunction'('compreg', 'compreg %1, %2', 'v', 'S', 'P')
    set $P130, $P131
.annotate 'line', 1268
    push $P1, $P130
.annotate 'line', 1526
    new $P133, [ 'PredefFunction' ]
    $P133.'PredefFunction'('load_language', "load_language %1\ncompreg %0, %1\n", 'P', 'S')
    set $P132, $P133
.annotate 'line', 1268
    push $P1, $P132
.annotate 'line', 1533
    new $P135, [ 'PredefFunction' ]
    $P135.'PredefFunction'('load_language', "load_language %1\ncompreg %0, %2\n", 'P', 'S', 'S')
    set $P134, $P135
.annotate 'line', 1268
    push $P1, $P134
.annotate 'line', 1540
    new $P137, [ 'PredefFunction' ]
    $P137.'PredefFunction'('loadlib', 'loadlib %0, %1', 'P', 'S')
    set $P136, $P137
.annotate 'line', 1268
    push $P1, $P136
.annotate 'line', 1544
    new $P139, [ 'PredefFunction' ]
    $P139.'PredefFunction'('load_bytecode', 'load_bytecode %1', 'v', 'S')
    set $P138, $P139
.annotate 'line', 1268
    push $P1, $P138
.annotate 'line', 1548
    new $P141, [ 'PredefFunction' ]
    $P141.'PredefFunction'('dlfunc', 'dlfunc %0, %1, %2, %3', 'P', 'P', 'S', 'S')
    set $P140, $P141
.annotate 'line', 1268
    push $P1, $P140
.annotate 'line', 1552
    new $P143, [ 'PredefFunction' ]
    $P143.'PredefFunction'('sprintf', 'sprintf %0, %1, %2', 'S', 'S', 'P')
    set $P142, $P143
.annotate 'line', 1268
    push $P1, $P142
.annotate 'line', 1556
    new $P145, [ 'PredefFunction' ]
    $P145.'PredefFunction'('sprintf', 'sprintf %0, %1, %2', 'P', 'P', 'P')
    set $P144, $P145
.annotate 'line', 1268
    push $P1, $P144
.annotate 'line', 1560
    new $P147, [ 'PredefFunction' ]
.annotate 'line', 1561
    $P147.'PredefFunction'('print', $P11, 'v', '*')
    set $P146, $P147
.annotate 'line', 1268
    push $P1, $P146
.annotate 'line', 1564
    new $P149, [ 'PredefFunction' ]
.annotate 'line', 1565
    $P149.'PredefFunction'('say', $P12, 'v', '*')
    set $P148, $P149
.annotate 'line', 1268
    push $P1, $P148
.annotate 'line', 1568
    new $P151, [ 'PredefFunction' ]
.annotate 'line', 1569
    $P151.'PredefFunction'('cry', $P13, 'v', '*')
    set $P150, $P151
.annotate 'line', 1268
    push $P1, $P150
.annotate 'line', 1572
    new $P153, [ 'PredefFunction' ]
.annotate 'line', 1573
    $P153.'PredefFunction'('invoke', $P14, 'P', '!')
    set $P152, $P153
.annotate 'line', 1268
    push $P1, $P152
  __label_2: # Infinite loop
.annotate 'line', 1578
    .yield($P1)
    goto __label_2
  __label_1: # Infinite loop end
# }
.annotate 'line', 1579

.end # getpredefs


.sub 'findpredef' :subid('WSubId_52')
        .param string __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 1583
.const 'Sub' $P3 = 'WSubId_26'
    $P2 = $P3()
    iter $P4, $P2
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
.annotate 'line', 1584
    getattribute $P5, $P1, 'name'
    set $S1, $P5
    ne $S1, __ARG_1, __label_3
# {
.annotate 'line', 1585
# pargs: $I1
    getattribute $P6, $P1, 'nparams'
    set $I1, $P6
.annotate 'line', 1586
    iseq $I2, $I1, __ARG_2
    if $I2 goto __label_6
.annotate 'line', 1587
    iseq $I2, $I1, -1
  __label_6:
    if $I2 goto __label_5
.annotate 'line', 1588
    iseq $I2, $I1, -2
    unless $I2 goto __label_7
    iseq $I2, __ARG_2, 1
  __label_7:
  __label_5:
    unless $I2 goto __label_4
.annotate 'line', 1589
    .return($P1)
  __label_4: # endif
# }
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
    null $P2
.annotate 'line', 1591
    .return($P2)
# }
.annotate 'line', 1592

.end # findpredef


.sub 'optimize_array' :subid('WSubId_28')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1600
    if_null __ARG_1, __label_1
# {
.annotate 'line', 1601
# n: $I1
# predefined elements
    elements $I1, __ARG_1
# for loop
.annotate 'line', 1602
# i: $I2
    null $I2
  __label_4: # for condition
    ge $I2, $I1, __label_3
.annotate 'line', 1603
    $P2 = __ARG_1[$I2]
    $P1 = $P2.'optimize'()
    __ARG_1[$I2] = $P1
  __label_2: # for iteration
.annotate 'line', 1602
    inc $I2
    goto __label_4
  __label_3: # for end
# }
  __label_1: # endif
# }
.annotate 'line', 1605

.end # optimize_array


.sub 'emit_array' :subid('WSubId_42')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1609
    if_null __ARG_2, __label_1
# {
.annotate 'line', 1610
    iter $P2, __ARG_2
    set $P2, 0
  __label_2: # for iteration
    unless $P2 goto __label_3
    shift $P1, $P2
.annotate 'line', 1611
    $P1.'emit'(__ARG_1)
    goto __label_2
  __label_3: # endfor
# }
  __label_1: # endif
# }
.annotate 'line', 1613

.end # emit_array


.sub 'parseDotted' :subid('WSubId_44')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1617
# var list: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1618
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 1619
    $P3 = $P2.'isidentifier'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 1620
# predefined push
    push $P1, $P2
  __label_3: # while
.annotate 'line', 1621
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_2
    unless $P3 goto __label_2
# {
.annotate 'line', 1622
    $P2 = __ARG_1.'get'()
.annotate 'line', 1623
# predefined push
    push $P1, $P2
# }
    goto __label_3
  __label_2: # endwhile
# }
  __label_1: # endif
.annotate 'line', 1626
    __ARG_1.'unget'($P2)
.annotate 'line', 1627
    .return($P1)
# }
.annotate 'line', 1628

.end # parseDotted


.sub 'parseList' :subid('WSubId_27')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4 :optional
# Body
# {
.annotate 'line', 1636
# var list: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1637
# var t: $P2
    null $P2
  __label_1: # do
.annotate 'line', 1638
# {
.annotate 'line', 1639
# var value: $P3
    $P3 = __ARG_3(__ARG_1, __ARG_2)
.annotate 'line', 1640
# predefined push
    push $P1, $P3
# }
  __label_3: # continue
.annotate 'line', 1641
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'(',')
    if_null $P4, __label_2
    if $P4 goto __label_1
  __label_2: # enddo
.annotate 'line', 1642
    unless_null __ARG_4, __label_4
.annotate 'line', 1643
    __ARG_1.'unget'($P2)
    goto __label_5
  __label_4: # else
.annotate 'line', 1645
    $P4 = $P2.'isop'(__ARG_4)
    isfalse $I1, $P4
    unless $I1 goto __label_6
.const 'Sub' $P5 = 'WSubId_1'
.annotate 'line', 1646
    $P5("Unfinished argument list", $P2)
  __label_6: # endif
  __label_5: # endif
.annotate 'line', 1647
    .return($P1)
# }
.annotate 'line', 1648

.end # parseList


.sub 'parseIdentifier' :subid('WSubId_46')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1653
    $P1 = __ARG_1.'get'()
    .tailcall $P1.'getidentifier'()
# }
.annotate 'line', 1654

.end # parseIdentifier


.sub 'toIdentifierList' :subid('WSubId_45')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1658
    new $P1, ['ResizableStringArray']
.annotate 'line', 1659
    iter $P3, __ARG_1
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P2, $P3
.annotate 'line', 1660
    $P4 = $P2.'getidentifier'()
# predefined push
    push $P1, $P4
    goto __label_1
  __label_2: # endfor
.annotate 'line', 1661
    .return($P1)
# }
.annotate 'line', 1662

.end # toIdentifierList

.namespace [ 'CommonBase' ]

.sub 'initbase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1675
    setattribute self, 'start', __ARG_1
.annotate 'line', 1676
    setattribute self, 'owner', __ARG_2
# }
.annotate 'line', 1677

.end # initbase


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1680
    getattribute $P1, self, 'start'
    __ARG_1.'annotate'($P1)
# }
.annotate 'line', 1681

.end # annotate


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1684
    getattribute $P1, self, 'owner'
    $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 1685

.end # use_predef


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 1688
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 1689

.end # generatesubid


.sub 'addlocalfunction' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1692
    getattribute $P1, self, 'owner'
    .tailcall $P1.'addlocalfunction'(__ARG_1)
# }
.annotate 'line', 1693

.end # addlocalfunction


.sub 'findsymbol' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1696
    getattribute $P1, self, 'owner'
    .tailcall $P1.'findsymbol'(__ARG_1)
# }
.annotate 'line', 1697

.end # findsymbol


.sub 'findclasskey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1700
    getattribute $P1, self, 'owner'
    .tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 1701

.end # findclasskey


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 1704
    getattribute $P1, self, 'owner'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 1705

.end # dowarnings

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CommonBase' ]
.annotate 'line', 1670
    addattribute $P0, 'start'
.annotate 'line', 1671
    addattribute $P0, 'owner'
.end
.namespace [ 'SimpleArgList' ]

.sub 'SimpleArgList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 1720
.const 'Sub' $P1 = 'parseExpr'
.annotate 'line', 1721
.const 'Sub' $P4 = 'WSubId_27'
    $P3 = $P4(__ARG_1, __ARG_2, $P1, __ARG_3)
    setattribute self, 'args', $P3
# }
.annotate 'line', 1722

.end # SimpleArgList


.sub 'numargs' :method
# Body
# {
.annotate 'line', 1726
    getattribute $P1, self, 'args'
# predefined elements
.annotate 'line', 1725
    elements $I1, $P1
.annotate 'line', 1726
    .return($I1)
# }
.annotate 'line', 1727

.end # numargs


.sub 'getarg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 1730
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 1731
    $P2 = $P1[__ARG_1]
    .return($P2)
# }
.annotate 'line', 1732

.end # getarg


.sub 'optimizeargs' :method
# Body
# {
.const 'Sub' $P1 = 'WSubId_28'
.annotate 'line', 1736
    getattribute $P2, self, 'args'
    $P1($P2)
# }
.annotate 'line', 1737

.end # optimizeargs


.sub 'getargvalues' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1740
# var argreg: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1741
    getattribute $P3, self, 'args'
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
.annotate 'line', 1742
    $P5 = $P2.'emit_get'(__ARG_1)
# predefined push
    push $P1, $P5
    goto __label_1
  __label_2: # endfor
.annotate 'line', 1743
    .return($P1)
# }
.annotate 'line', 1744

.end # getargvalues


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1747
    $P1 = self.'getargvalues'(__ARG_1)
# predefined join
    join $S1, ', ', $P1
    __ARG_1.'print'($S1)
# }
.annotate 'line', 1748

.end # emitargs

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'SimpleArgList' ]
.annotate 'line', 1716
    addattribute $P0, 'args'
.end
.namespace [ 'Modifier' ]

.sub 'getname' :method
# Body
# {
.annotate 'line', 1760
    getattribute $P1, self, 'name'
    .return($P1)
# }

.end # getname


.sub 'numargs' :method
# Body
# {
.annotate 'line', 1763
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 1764
# nargs: $I1
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
    $I1 = $P1.'numargs'()
  __label_1:
.annotate 'line', 1765
    .return($I1)
# }
.annotate 'line', 1766

.end # numargs


.sub 'getarg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 1769
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 1770
    $P2 = $P1.'numargs'()
    set $I1, $P2
    lt __ARG_1, $I1, __label_1
.const 'Sub' $P3 = 'WSubId_6'
.annotate 'line', 1771
    $P3('Wrong modifier arg number')
  __label_1: # endif
.annotate 'line', 1772
    .tailcall $P1.'getarg'(__ARG_1)
# }
.annotate 'line', 1773

.end # getarg


.sub 'Modifier' :method
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1776
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 1777
    if_null __ARG_2, __label_1
.annotate 'line', 1778
    setattribute self, 'args', __ARG_2
  __label_1: # endif
# }
.annotate 'line', 1779

.end # Modifier


.sub 'optimize' :method
# Body
# {
.annotate 'line', 1782
    getattribute $P1, self, 'args'
    $P1.'optimizeargs'()
.annotate 'line', 1783
    .return(self)
# }
.annotate 'line', 1784

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Modifier' ]
.annotate 'line', 1757
    addattribute $P0, 'name'
.annotate 'line', 1758
    addattribute $P0, 'args'
.end
.namespace [ ]

.sub 'parseModifier'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1789
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 1790
# name: $S1
    $P3 = $P1.'getidentifier'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 1791
    $P1 = __ARG_1.'get'()
.annotate 'line', 1792
# var args: $P2
    null $P2
.annotate 'line', 1793
    $P3 = $P1.'isop'('(')
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 1794
    new $P4, [ 'SimpleArgList' ]
    $P4.'SimpleArgList'(__ARG_1, __ARG_2, ')')
    set $P2, $P4
    goto __label_3
  __label_2: # else
.annotate 'line', 1796
    __ARG_1.'unget'($P1)
  __label_3: # endif
.annotate 'line', 1797
    new $P4, [ 'Modifier' ]
    $P4.'Modifier'($S1, $P2)
    set $P3, $P4
    .return($P3)
# }
.annotate 'line', 1798

.end # parseModifier

.namespace [ 'ModifierList' ]

.sub 'ModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1807
.const 'Sub' $P1 = 'parseModifier'
.annotate 'line', 1808
.const 'Sub' $P4 = 'WSubId_27'
    $P3 = $P4(__ARG_1, __ARG_2, $P1, ']')
    setattribute self, 'list', $P3
# }
.annotate 'line', 1809

.end # ModifierList


.sub 'optimize' :method
# Body
# {
.const 'Sub' $P1 = 'WSubId_28'
.annotate 'line', 1812
    getattribute $P2, self, 'list'
    $P1($P2)
# }
.annotate 'line', 1813

.end # optimize


.sub 'getlist' :method
# Body
# {
.annotate 'line', 1814
    getattribute $P1, self, 'list'
    .return($P1)
# }

.end # getlist


.sub 'pick' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1817
    getattribute $P2, self, 'list'
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
# {
.annotate 'line', 1818
    $P4 = $P1.'getname'()
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
.annotate 'line', 1819
    .return($P1)
  __label_3: # endif
# }
    goto __label_1
  __label_2: # endfor
    null $P2
.annotate 'line', 1821
    .return($P2)
# }
.annotate 'line', 1822

.end # pick

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ModifierList' ]
.annotate 'line', 1803
    addattribute $P0, 'list'
.end
.namespace [ ]

.sub 'getparrotkey' :subid('WSubId_47')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1831
# s: $S1
# predefined join
    join $S1, "'; '", __ARG_1
.annotate 'line', 1832
    concat $S2, "[ '", $S1
    concat $S2, $S2, "' ]"
    .return($S2)
# }
.annotate 'line', 1833

.end # getparrotkey


.sub 'getparrotnamespacekey' :subid('WSubId_86')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1837
# predefined elements
    elements $I1, __ARG_1
    ne $I1, 0, __label_1
.annotate 'line', 1838
    .return(".namespace [ ]")
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 1840
# s: $S1
# predefined join
    join $S1, "'; '", __ARG_1
.annotate 'line', 1841
    concat $S2, ".namespace [ '", $S1
    concat $S2, $S2, "' ]"
    .return($S2)
# }
  __label_2: # endif
# }
.annotate 'line', 1843

.end # getparrotnamespacekey


.sub 'parseUsing' :subid('WSubId_33')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1847
# var taux: $P1
    $P1 = __ARG_2.'get'()
# switch-case
.annotate 'line', 1849
    $I1 = $P1.'iskeyword'('extern')
    if $I1 goto __label_3
.annotate 'line', 1851
    $I1 = $P1.'iskeyword'('static')
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 1850
    new $P3, [ 'ExternStatement' ]
    $P3.'ExternStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P2, $P3
    .return($P2)
  __label_4: # case
.annotate 'line', 1852
    new $P5, [ 'StaticStatement' ]
    $P5.'StaticStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P4, $P5
    .return($P4)
  __label_2: # default
.annotate 'line', 1854
    __ARG_2.'unget'($P1)
.annotate 'line', 1855
    new $P7, [ 'UsingStatement' ]
    $P7.'UsingStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P6, $P7
    .return($P6)
  __label_1: # switch end
# }
.annotate 'line', 1857

.end # parseUsing


.sub 'parseSig' :subid('WSubId_32')
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
    unless $I1 goto __label_1
.const 'Sub' $P5 = 'WSubId_29'
.annotate 'line', 1864
    $P5("'='", $P2)
  __label_1: # endif
.annotate 'line', 1865
# var expr: $P3
.const 'Sub' $P6 = 'WSubId_30'
    $P3 = $P6(__ARG_2, __ARG_3)
.annotate 'line', 1866
    new $P7, [ 'MultiAssignStatement' ]
    $P7.'MultiAssignStatement'($P1, $P3)
    set $P4, $P7
    .return($P4)
# }
.annotate 'line', 1867

.end # parseSig


.sub 'parseStatement' :subid('WSubId_80')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1871
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 1872
    $P4 = $P1.'isop'(';')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 1873
    new $P5, [ 'EmptyStatement' ]
    .return($P5)
  __label_1: # endif
.annotate 'line', 1874
    $P4 = $P1.'isop'('{')
    if_null $P4, __label_2
    unless $P4 goto __label_2
.annotate 'line', 1875
    new $P6, [ 'CompoundStatement' ]
    $P6.'CompoundStatement'($P1, __ARG_1, __ARG_2)
    set $P5, $P6
    .return($P5)
  __label_2: # endif
.annotate 'line', 1876
    $P4 = $P1.'isop'('${')
    if_null $P4, __label_3
    unless $P4 goto __label_3
.annotate 'line', 1877
    new $P6, [ 'PiropStatement' ]
    $P6.'PiropStatement'($P1, __ARG_1, __ARG_2)
    set $P5, $P6
    .return($P5)
  __label_3: # endif
.annotate 'line', 1878
    $P4 = $P1.'isop'(':')
    if_null $P4, __label_4
    unless $P4 goto __label_4
# {
.annotate 'line', 1879
# var open: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 1880
    $P4 = $P2.'isop'('(')
    isfalse $I1, $P4
    unless $I1 goto __label_5
.const 'Sub' $P7 = 'WSubId_31'
.annotate 'line', 1881
    $P7("':'", $P1)
  __label_5: # endif
.annotate 'line', 1882
.const 'Sub' $P8 = 'WSubId_32'
    .tailcall $P8($P1, __ARG_1, __ARG_2)
# }
  __label_4: # endif
# switch
.annotate 'line', 1885
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
.annotate 'line', 1887
.const 'Sub' $P9 = 'WSubId_33'
    .tailcall $P9($P1, __ARG_1, __ARG_2)
  __label_9: # case
.annotate 'line', 1889
.const 'Sub' $P10 = 'WSubId_34'
    .tailcall $P10($P1, __ARG_1, __ARG_2)
    goto __label_6 # break
  __label_10: # case
.annotate 'line', 1892
.const 'Sub' $P11 = 'WSubId_35'
    .tailcall $P11($P1, __ARG_1, __ARG_2)
    goto __label_6 # break
  __label_11: # case
.annotate 'line', 1895
.const 'Sub' $P12 = 'WSubId_36'
    .tailcall $P12($P1, __ARG_1, __ARG_2)
  __label_12: # case
.annotate 'line', 1897
.const 'Sub' $P13 = 'WSubId_37'
    .tailcall $P13($P1, __ARG_1, __ARG_2)
  __label_13: # case
.annotate 'line', 1899
.const 'Sub' $P14 = 'WSubId_38'
    .tailcall $P14($P1, __ARG_1, __ARG_2)
  __label_14: # case
.annotate 'line', 1901
.const 'Sub' $P15 = 'WSubId_39'
    .tailcall $P15($P1, __ARG_1, __ARG_2)
  __label_15: # case
.annotate 'line', 1903
    new $P6, [ 'ReturnStatement' ]
    $P6.'ReturnStatement'($P1, __ARG_1, __ARG_2)
    set $P5, $P6
    .return($P5)
  __label_16: # case
.annotate 'line', 1905
    new $P17, [ 'YieldStatement' ]
    $P17.'YieldStatement'($P1, __ARG_1, __ARG_2)
    set $P16, $P17
    .return($P16)
  __label_17: # case
.annotate 'line', 1907
    new $P19, [ 'GotoStatement' ]
    $P19.'GotoStatement'($P1, __ARG_1, __ARG_2)
    set $P18, $P19
    .return($P18)
  __label_18: # case
.annotate 'line', 1909
    new $P21, [ 'IfStatement' ]
    $P21.'IfStatement'($P1, __ARG_1, __ARG_2)
    set $P20, $P21
    .return($P20)
  __label_19: # case
.annotate 'line', 1911
    new $P23, [ 'WhileStatement' ]
    $P23.'WhileStatement'($P1, __ARG_1, __ARG_2)
    set $P22, $P23
    .return($P22)
  __label_20: # case
.annotate 'line', 1913
    new $P25, [ 'DoStatement' ]
    $P25.'DoStatement'($P1, __ARG_1, __ARG_2)
    set $P24, $P25
    .return($P24)
  __label_21: # case
.annotate 'line', 1915
    new $P27, [ 'ContinueStatement' ]
    $P27.'ContinueStatement'($P1, __ARG_1, __ARG_2)
    set $P26, $P27
    .return($P26)
  __label_22: # case
.annotate 'line', 1917
    new $P29, [ 'BreakStatement' ]
    $P29.'BreakStatement'($P1, __ARG_1, __ARG_2)
    set $P28, $P29
    .return($P28)
  __label_23: # case
.annotate 'line', 1919
.const 'Sub' $P30 = 'WSubId_40'
    .tailcall $P30($P1, __ARG_1, __ARG_2)
  __label_24: # case
.annotate 'line', 1921
.const 'Sub' $P31 = 'WSubId_41'
    .tailcall $P31($P1, __ARG_1, __ARG_2)
  __label_25: # case
.annotate 'line', 1923
    new $P33, [ 'ThrowStatement' ]
    $P33.'ThrowStatement'($P1, __ARG_1, __ARG_2)
    set $P32, $P33
    .return($P32)
  __label_26: # case
.annotate 'line', 1925
    new $P35, [ 'TryStatement' ]
    $P35.'TryStatement'($P1, __ARG_1, __ARG_2)
    set $P34, $P35
    .return($P34)
  __label_7: # default
.annotate 'line', 1927
    $P36 = $P1.'isidentifier'()
    if_null $P36, __label_27
    unless $P36 goto __label_27
# {
.annotate 'line', 1928
# var t2: $P3
    $P3 = __ARG_1.'get'()
.annotate 'line', 1929
    $P4 = $P3.'isop'(':')
    if_null $P4, __label_28
    unless $P4 goto __label_28
.annotate 'line', 1930
    new $P6, [ 'LabelStatement' ]
    $P6.'LabelStatement'($P1, __ARG_2)
    set $P5, $P6
    .return($P5)
  __label_28: # endif
.annotate 'line', 1931
    __ARG_1.'unget'($P3)
# }
  __label_27: # endif
.annotate 'line', 1933
    __ARG_1.'unget'($P1)
.annotate 'line', 1934
    new $P5, [ 'ExprStatement' ]
    $P5.'ExprStatement'($P1, __ARG_1, __ARG_2)
    set $P4, $P5
    .return($P4)
  __label_6: # switch end
.const 'Sub' $P37 = 'WSubId_6'
.annotate 'line', 1936
    $P37('parseStatement failure', $P1)
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
.const 'Sub' $P1 = 'WSubId_6'
.annotate 'line', 2009
    getattribute $P2, self, 'start'
    $P1('**checking**', $P2)
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
.const 'Sub' $P1 = 'WSubId_6'
.annotate 'line', 2020
    $P1('Attempt to annotate empty statement')
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
  __label_3: # for condition
    ge $I3, $I1, __label_2
# {
.annotate 'line', 2039
# var st: $P2
    $P3 = $P1[$I3]
    $P2 = $P3.'optimize'()
.annotate 'line', 2040
    set $I4, $I2
    unless $I4 goto __label_5
    $P3 = $P2.'isempty'()
    isfalse $I4, $P3
  __label_5:
    unless $I4 goto __label_4
.annotate 'line', 2041
    null $I2
  __label_4: # endif
.annotate 'line', 2042
    $P1[$I3] = $P2
# }
  __label_1: # for iteration
.annotate 'line', 2038
    inc $I3
    goto __label_3
  __label_2: # for end
.annotate 'line', 2044
    unless $I2 goto __label_6
.annotate 'line', 2045
    new $P3, [ 'EmptyStatement' ]
    .return($P3)
    goto __label_7
  __label_6: # else
.annotate 'line', 2047
    .return(self)
  __label_7: # endif
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
.const 'Sub' $P1 = 'WSubId_42'
.annotate 'line', 2066
    getattribute $P2, self, 'statements'
    $P1(__ARG_1, $P2)
# }
.annotate 'line', 2067

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MultiStatement' ]
.annotate 'line', 2051
    get_class $P1, [ 'MultiStatementBase' ]
    addparent $P0, $P1
.end
.namespace [ ]

.sub 'addtomulti' :subid('WSubId_83')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2072
    unless_null __ARG_1, __label_1
.annotate 'line', 2073
    .return(__ARG_2)
    goto __label_2
  __label_1: # else
.annotate 'line', 2074
    isa $I1, __ARG_1, [ 'MultiStatement' ]
    unless $I1 goto __label_3
.annotate 'line', 2075
    .tailcall __ARG_1.'push'(__ARG_2)
    goto __label_4
  __label_3: # else
.annotate 'line', 2077
    new $P2, [ 'MultiStatement' ]
    $P2.'MultiStatement'(__ARG_1, __ARG_2)
    set $P1, $P2
    .return($P1)
  __label_4: # endif
  __label_2: # endif
# }
.annotate 'line', 2078

.end # addtomulti


.sub 'parsePiropArg'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2086
# var arg: $P1
    null $P1
.annotate 'line', 2087
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 2088
    $P3 = $P2.'isop'(':')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 2089
    $P2 = __ARG_1.'get'()
.annotate 'line', 2090
# label: $S1
    $P3 = $P2.'getidentifier'()
    null $S1
    if_null $P3, __label_3
    set $S1, $P3
  __label_3:
.annotate 'line', 2091
    new $P3, [ 'Reflabel' ]
    $P3.'Reflabel'(__ARG_2, $S1)
    set $P1, $P3
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2094
    __ARG_1.'unget'($P2)
.annotate 'line', 2095
.const 'Sub' $P4 = 'WSubId_30'
    $P1 = $P4(__ARG_1, __ARG_2)
# }
  __label_2: # endif
.annotate 'line', 2097
    .return($P1)
# }
.annotate 'line', 2098

.end # parsePiropArg

.namespace [ 'PiropStatement' ]

.sub 'PiropStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2107
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2108
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 2109
# dotted: $I1
    $P2 = $P1.'isop'('.')
    set $I1, $P2
.annotate 'line', 2110
    unless $I1 goto __label_1
.annotate 'line', 2111
    $P1 = __ARG_2.'get'()
  __label_1: # endif
.annotate 'line', 2112
# opname: $S1
    $P2 = $P1.'getidentifier'()
    null $S1
    if_null $P2, __label_2
    set $S1, $P2
  __label_2:
.annotate 'line', 2113
    unless $I1 goto __label_4
    set $S2, '.'
    goto __label_3
  __label_4:
    set $S2, ''
  __label_3:
    concat $S3, $S2, $S1
    box $P2, $S3
    setattribute self, 'opname', $P2
.annotate 'line', 2114
    $P1 = __ARG_2.'get'()
.annotate 'line', 2115
    $P2 = $P1.'isop'('}')
    isfalse $I2, $P2
    unless $I2 goto __label_5
# {
.annotate 'line', 2116
    __ARG_2.'unget'($P1)
.annotate 'line', 2117
.const 'Sub' $P3 = 'parsePiropArg'
.annotate 'line', 2118
.const 'Sub' $P5 = 'WSubId_27'
    $P4 = $P5(__ARG_2, __ARG_3, $P3, '}')
    setattribute self, 'args', $P4
# }
  __label_5: # endif
.const 'Sub' $P6 = 'WSubId_43'
.annotate 'line', 2120
    $P6(';', __ARG_2)
# }
.annotate 'line', 2121

.end # PiropStatement


.sub 'optimize' :method
# Body
# {
.const 'Sub' $P1 = 'WSubId_28'
.annotate 'line', 2124
    getattribute $P2, self, 'args'
    $P1($P2)
.annotate 'line', 2125
    .return(self)
# }
.annotate 'line', 2126

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2129
# opname: $S1
    getattribute $P4, self, 'opname'
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 2130
    self.'annotate'(__ARG_1)
.annotate 'line', 2131
    concat $S2, 'pirop ', $S1
    __ARG_1.'comment'($S2)
.annotate 'line', 2132
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 2133
    __ARG_1.'print'('    ')
.annotate 'line', 2134
    unless_null $P1, __label_2
.annotate 'line', 2135
    __ARG_1.'say'($S1)
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 2137
# var argreg: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 2138
    iter $P5, $P1
    set $P5, 0
  __label_4: # for iteration
    unless $P5 goto __label_5
    shift $P3, $P5
.annotate 'line', 2139
    $P4 = $P3.'emit_get'(__ARG_1)
# predefined push
    push $P2, $P4
    goto __label_4
  __label_5: # endfor
.annotate 'line', 2140
# predefined join
    join $S2, ', ', $P2
    __ARG_1.'say'($S1, ' ', $S2)
# }
  __label_3: # endif
# }
.annotate 'line', 2142

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'PiropStatement' ]
.annotate 'line', 2100
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2102
    addattribute $P0, 'opname'
.annotate 'line', 2103
    addattribute $P0, 'args'
.end
.namespace [ 'ExternStatement' ]

.sub 'ExternStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2154
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2155
# var path: $P1
.const 'Sub' $P2 = 'WSubId_44'
    $P1 = $P2(__ARG_2)
.annotate 'line', 2156
# predefined elements
    elements $I1, $P1
    ne $I1, 0, __label_1
.const 'Sub' $P3 = 'WSubId_3'
.annotate 'line', 2157
    $P4 = __ARG_2.'get'()
    $P3($P4)
  __label_1: # endif
.const 'Sub' $P5 = 'WSubId_43'
.annotate 'line', 2158
    $P5(';', __ARG_2)
.annotate 'line', 2159
.const 'Sub' $P7 = 'WSubId_45'
    $P6 = $P7($P1)
    setattribute self, 'path', $P6
.annotate 'line', 2160
    .return(self)
# }
.annotate 'line', 2161

.end # ExternStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2162
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2165
    self.'annotate'(__ARG_1)
.annotate 'line', 2166
    getattribute $P1, self, 'path'
# predefined join
    join $S1, '/', $P1
    __ARG_1.'say'('    ', "load_bytecode '", $S1, ".pbc'")
# }
.annotate 'line', 2167

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ExternStatement' ]
.annotate 'line', 2149
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2151
    addattribute $P0, 'path'
.end
.namespace [ 'StaticStatement' ]

.sub 'StaticStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2179
    self.'Statement'(__ARG_1, __ARG_3)
.const 'Sub' $P1 = "WSubId_46"
.annotate 'line', 2181
.const 'Sub' $P4 = 'WSubId_27'
    null $P5
    $P3 = $P4(__ARG_2, $P5, $P1, ';')
    setattribute self, 'names', $P3
# }
.annotate 'line', 2182

.end # StaticStatement


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
    getattribute $P2, self, 'names'
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $S1, $P3
# {
.annotate 'line', 2188
# var v: $P1
    $P1 = self.'createvar'($S1, 'P')
.annotate 'line', 2189
    $P2 = $P1.'getreg'()
    __ARG_1.'say'(".const 'Sub' ", $P2, " = '", $S1, "'")
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 2191

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'StaticStatement' ]
.annotate 'line', 2174
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2176
    addattribute $P0, 'names'
.end
.namespace [ 'UsingStatement' ]

.sub 'UsingStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2205
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2206
# var path: $P1
.const 'Sub' $P2 = 'WSubId_44'
    $P1 = $P2(__ARG_2)
.annotate 'line', 2207
# predefined elements
    elements $I1, $P1
    ne $I1, 0, __label_1
.const 'Sub' $P3 = 'WSubId_3'
.annotate 'line', 2208
    $P4 = __ARG_2.'get'()
    $P3($P4)
  __label_1: # endif
.const 'Sub' $P5 = 'WSubId_43'
.annotate 'line', 2209
    $P5(';', __ARG_2)
.annotate 'line', 2210
.const 'Sub' $P7 = 'WSubId_45'
    $P6 = $P7($P1)
    setattribute self, 'path', $P6
# }
.annotate 'line', 2211

.end # UsingStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2214
# var path: $P1
    getattribute $P1, self, 'path'
.annotate 'line', 2215
# name: $S1
    $S1 = $P1[-1]
.annotate 'line', 2216
# var vdata: $P2
    $P2 = self.'createvar'($S1, 'P')
.annotate 'line', 2218
# var symbol: $P3
    $P3 = self.'findsymbol'($P1)
# switch-case
.annotate 'line', 2220
    isnull $I1, $P3
    if $I1 goto __label_3
.annotate 'line', 2222
    isa $I1, $P3, [ 'FunctionStatement' ]
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 2223
# subid: $S2
    $P4 = $P3.'makesubid'()
    null $S2
    if_null $P4, __label_5
    set $S2, $P4
  __label_5:
.annotate 'line', 2224
    box $P5, $S2
    setattribute self, 'subid', $P5
    goto __label_1 # break
  __label_2: # default
  __label_1: # switch end
.annotate 'line', 2227
    .return(self)
# }
.annotate 'line', 2228

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2231
# var path: $P1
    getattribute $P1, self, 'path'
.annotate 'line', 2232
# name: $S1
    $S1 = $P1[-1]
.annotate 'line', 2233
# var vdata: $P2
    $P2 = self.'getvar'($S1)
.annotate 'line', 2234
    getattribute $P3, self, 'subid'
    if_null $P3, __label_1
# {
.annotate 'line', 2235
# subid: $S2
    getattribute $P4, self, 'subid'
    null $S2
    if_null $P4, __label_3
    set $S2, $P4
  __label_3:
.annotate 'line', 2236
    $P3 = $P2.'getreg'()
    __ARG_1.'say'(".const 'Sub' ", $P3, ' = "', $S2, '"')
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2239
    self.'annotate'(__ARG_1)
.annotate 'line', 2240
    $P3 = $P2.'getreg'()
    __ARG_1.'print'('    get_hll_global ', $P3, ', ')
.annotate 'line', 2241
    $P1.'pop'()
# switch
.annotate 'line', 2242
# predefined elements
    elements $I1, $P1
    null $I2
    if $I1 == $I2 goto __label_6
    goto __label_5
  __label_6: # case
.annotate 'line', 2244
    __ARG_1.'say'("'", $S1, "'")
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 2247
.const 'Sub' $P5 = 'WSubId_47'
    $P3 = $P5($P1)
    __ARG_1.'say'($P3, " , '", $S1, "'")
  __label_4: # switch end
# }
  __label_2: # endif
# }
.annotate 'line', 2250

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'UsingStatement' ]
.annotate 'line', 2198
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2200
    addattribute $P0, 'path'
.annotate 'line', 2201
    addattribute $P0, 'subid'
.end
.namespace [ 'ExprStatement' ]

.sub 'ExprStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2262
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2263
.const 'Sub' $P3 = 'WSubId_30'
    $P2 = $P3(__ARG_2, self)
    setattribute self, 'expr', $P2
.const 'Sub' $P4 = 'WSubId_43'
.annotate 'line', 2264
    $P4(';', __ARG_2)
# }
.annotate 'line', 2265

.end # ExprStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2268
    getattribute $P3, self, 'expr'
    $P2 = $P3.'optimize'()
    setattribute self, 'expr', $P2
.annotate 'line', 2269
    .return(self)
# }
.annotate 'line', 2270

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2273
    getattribute $P1, self, 'expr'
    $P1.'emit'(__ARG_1, '')
# }
.annotate 'line', 2274

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ExprStatement' ]
.annotate 'line', 2257
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2259
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
.annotate 'line', 2293
    setattribute self, 'type', __ARG_1
.annotate 'line', 2294
    setattribute self, 'reg', __ARG_2
.annotate 'line', 2295
    setattribute self, 'scope', __ARG_3
.annotate 'line', 2296
    box $P1, __ARG_4
    setattribute self, 'flags', $P1
.annotate 'line', 2297
    setattribute self, 'value', __ARG_5
# }
.annotate 'line', 2298

.end # VarData


.sub 'setid' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2301
    box $P1, __ARG_1
    setattribute self, 'id', $P1
# }
.annotate 'line', 2302

.end # setid


.sub 'setlex' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2305
    box $P1, __ARG_1
    setattribute self, 'lexname', $P1
# }
.annotate 'line', 2306

.end # setlex


.sub 'gettype' :method
# Body
# {
.annotate 'line', 2307
    getattribute $P1, self, 'type'
    .return($P1)
# }

.end # gettype


.sub 'getreg' :method
# Body
# {
.annotate 'line', 2308
    getattribute $P1, self, 'reg'
    .return($P1)
# }

.end # getreg


.sub 'getscope' :method
# Body
# {
.annotate 'line', 2309
    getattribute $P1, self, 'scope'
    .return($P1)
# }

.end # getscope


.sub 'getvalue' :method
# Body
# {
.annotate 'line', 2310
    getattribute $P1, self, 'value'
    .return($P1)
# }

.end # getvalue


.sub 'isconst' :method
# Body
# {
.annotate 'line', 2311
    getattribute $P1, self, 'value'
    isnull $I1, $P1
    not $I1
    .return($I1)
# }

.end # isconst


.sub 'getid' :method
# Body
# {
.annotate 'line', 2312
    getattribute $P1, self, 'id'
    .return($P1)
# }

.end # getid


.sub 'getlex' :method
# Body
# {
.annotate 'line', 2313
    getattribute $P1, self, 'lexname'
    .return($P1)
# }

.end # getlex


.sub 'getflags' :method
# Body
# {
.annotate 'line', 2314
    getattribute $P1, self, 'flags'
    .return($P1)
# }

.end # getflags

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'VarData' ]
.annotate 'line', 2283
    addattribute $P0, 'type'
.annotate 'line', 2284
    addattribute $P0, 'reg'
.annotate 'line', 2285
    addattribute $P0, 'scope'
.annotate 'line', 2286
    addattribute $P0, 'flags'
.annotate 'line', 2287
    addattribute $P0, 'value'
.annotate 'line', 2288
    addattribute $P0, 'id'
.annotate 'line', 2289
    addattribute $P0, 'lexname'
.end
.namespace [ 'ConstantInternalFail' ]

.sub 'ConstantInternalFail' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2322
    setattribute self, 'name', __ARG_1
# }
.annotate 'line', 2323

.end # ConstantInternalFail


.sub 'get_string' :method :vtable
# Body
# {
.const 'Sub' $P1 = 'WSubId_6'
.annotate 'line', 2326
    $P1('Attempt to use unexpanded constant!!!')
# }
.annotate 'line', 2327

.end # get_string

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ConstantInternalFail' ]
.annotate 'line', 2319
    addattribute $P0, 'name'
.end
.namespace [ 'VarContainer' ]

.sub 'init' :method :vtable
# Body
# {
.annotate 'line', 2336
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'locals', $P2
# }
.annotate 'line', 2337

.end # init


.sub 'createvar' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 2340
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2341
# sname: $S1
    set $P4, __ARG_1
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 2342
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2343
    if_null $P2, __label_2
.const 'Sub' $P5 = 'WSubId_1'
.annotate 'line', 2344
    concat $S3, "Redeclared '", $S1
    concat $S3, $S3, "'"
    $P5($S3, __ARG_1)
  __label_2: # endif
.annotate 'line', 2345
# reg: $S2
    $P4 = self.'createreg'(__ARG_2)
    null $S2
    if_null $P4, __label_3
    set $S2, $P4
  __label_3:
.annotate 'line', 2346
# var data: $P3
    new $P3, [ 'VarData' ]
    $P3.'VarData'(__ARG_2, $S2, self, __ARG_3)
.annotate 'line', 2347
    $P1[$S1] = $P3
.annotate 'line', 2348
    .return($P3)
# }
.annotate 'line', 2349

.end # createvar


.sub 'createvarnamed' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 2352
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2353
# sname: $S1
    set $P3, __ARG_1
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 2354
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2355
    if_null $P2, __label_2
.const 'Sub' $P4 = 'WSubId_1'
.annotate 'line', 2356
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    $P4($S2, __ARG_1)
  __label_2: # endif
.annotate 'line', 2357
    new $P5, [ 'VarData' ]
    $P5.'VarData'(__ARG_2, __ARG_3, self, 0)
    set $P3, $P5
    $P1[$S1] = $P3
# }
.annotate 'line', 2358

.end # createvarnamed


.sub 'createconst' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param int __ARG_5 :optional
# Body
# {
.annotate 'line', 2362
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2363
# sname: $S1
    set $P4, __ARG_1
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 2364
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2365
    if_null $P2, __label_2
.const 'Sub' $P5 = 'WSubId_1'
.annotate 'line', 2366
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    $P5($S2, __ARG_1)
  __label_2: # endif
.annotate 'line', 2367
# var data: $P3
    new $P3, [ 'VarData' ]
    new $P6, [ 'ConstantInternalFail' ]
    $P6.'ConstantInternalFail'(__ARG_1)
    set $P4, $P6
.annotate 'line', 2368
    $P3.'VarData'(__ARG_2, $P4, self, __ARG_5, __ARG_3)
.annotate 'line', 2369
    isnull $I1, __ARG_4
    not $I1
    unless $I1 goto __label_4
    isne $I1, __ARG_4, ''
  __label_4:
    unless $I1 goto __label_3
.annotate 'line', 2370
    $P3.'setid'(__ARG_4)
  __label_3: # endif
.annotate 'line', 2371
    $P1[$S1] = $P3
# }
.annotate 'line', 2372

.end # createconst


.sub 'getvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2375
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2376
# sname: $S1
    set $P3, __ARG_1
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 2377
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2378
    isnull $I1, $P2
    unless $I1 goto __label_3
    getattribute $P3, self, 'owner'
    isnull $I1, $P3
    not $I1
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 2379
    getattribute $P4, self, 'owner'
    $P2 = $P4.'getvar'(__ARG_1)
  __label_2: # endif
.annotate 'line', 2380
    isnull $I1, $P2
    not $I1
    unless $I1 goto __label_5
    isa $I2, $P2, [ 'VarData' ]
    not $I1, $I2
  __label_5:
    unless $I1 goto __label_4
.const 'Sub' $P5 = 'WSubId_6'
.annotate 'line', 2381
    $P5('Incorrect data for Variable', __ARG_1)
  __label_4: # endif
.annotate 'line', 2382
    .return($P2)
# }
.annotate 'line', 2383

.end # getvar


.sub 'getlocalvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2386
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2387
# sname: $S1
    set $P3, __ARG_1
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 2388
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2389
    .return($P2)
# }
.annotate 'line', 2390

.end # getlocalvar


.sub 'makelexical' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2393
# var lexowner: $P1
    $P1 = self.'getouter'()
.annotate 'line', 2394
# lexname: $S1
    $P2 = $P1.'createlex'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 2395
    .return($S1)
# }
.annotate 'line', 2396

.end # makelexical


.sub 'makelexicalself' :method
# Body
# {
.annotate 'line', 2399
# var lexowner: $P1
    set $P1, self
# Constant lexname evaluated at compile time
.annotate 'line', 2401
    self.'setlex'('__WLEX_self', 'self')
.annotate 'line', 2402
    .return('__WLEX_self')
# }
.annotate 'line', 2403

.end # makelexicalself

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'VarContainer' ]
.annotate 'line', 2333
    addattribute $P0, 'locals'
.end
.namespace [ 'BlockStatement' ]
.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'BlockStatement' ]
.annotate 'line', 2412
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
.annotate 'line', 2424
    self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 2425

.end # Expr


.sub 'issimple' :method
# Body
# {
.annotate 'line', 2426
    .return(0)
# }

.end # issimple


.sub 'isliteral' :method
# Body
# {
.annotate 'line', 2427
    .return(0)
# }

.end # isliteral


.sub 'isintegerliteral' :method
# Body
# {
.annotate 'line', 2428
    .return(0)
# }

.end # isintegerliteral


.sub 'isfloatliteral' :method
# Body
# {
.annotate 'line', 2429
    .return(0)
# }

.end # isfloatliteral


.sub 'isstringliteral' :method
# Body
# {
.annotate 'line', 2430
    .return(0)
# }

.end # isstringliteral


.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 2431
    .return(0)
# }

.end # isidentifier


.sub 'isnull' :method
# Body
# {
.annotate 'line', 2432
    .return(0)
# }

.end # isnull


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 2433
    .return(0)
# }

.end # hascompilevalue


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 2434
    .return(0)
# }

.end # isnegable


.sub 'tempreg' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2437
    getattribute $P1, self, 'owner'
    .tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 2438

.end # tempreg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2442
    .return(self)
# }
.annotate 'line', 2443

.end # optimize


.sub 'cantailcall' :method
# Body
# {
.annotate 'line', 2444
    .return(0)
# }

.end # cantailcall


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2447
# type: $S1
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 2448
# reg: $S2
    ne $S1, 'v', __label_3
    set $S2, ''
    goto __label_2
  __label_3:
    $S2 = self.'tempreg'($S1)
  __label_2:
.annotate 'line', 2449
    self.'emit'(__ARG_1, $S2)
.annotate 'line', 2450
    .return($S2)
# }
.annotate 'line', 2451

.end # emit_get


.sub 'emit_getint' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2454
# reg: $S1
    null $S1
.annotate 'line', 2455
    $P1 = self.'checkresult'()
    set $S2, $P1
    ne $S2, 'I', __label_1
.annotate 'line', 2456
    $P2 = self.'emit_get'(__ARG_1)
    set $S1, $P2
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2458
    $P3 = self.'tempreg'('I')
    set $S1, $P3
.annotate 'line', 2459
    self.'emit'(__ARG_1, $S1)
# }
  __label_2: # endif
.annotate 'line', 2461
    .return($S1)
# }
.annotate 'line', 2462

.end # emit_getint


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.const 'Sub' $P1 = 'WSubId_1'
.annotate 'line', 2465
    getattribute $P2, self, 'start'
    $P1('Not a left-side expression', $P2)
# }
.annotate 'line', 2466

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Expr' ]
.annotate 'line', 2420
    get_class $P1, [ 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'SimpleExpr' ]

.sub 'issimple' :method
# Body
# {
.annotate 'line', 2471
    .return(1)
# }

.end # issimple

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'SimpleExpr' ]
.annotate 'line', 2469
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
.annotate 'line', 2481
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 2482
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 2483
    $P2 = $P1.'isop'('(')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.const 'Sub' $P3 = 'WSubId_29'
.annotate 'line', 2484
    $P3('anonymous function', $P1)
  __label_1: # endif
.annotate 'line', 2485
    new $P5, [ 'LocalFunctionStatement' ]
    $P5.'LocalFunctionStatement'(__ARG_3, __ARG_1, __ARG_2)
    set $P4, $P5
    setattribute self, 'fn', $P4
# }
.annotate 'line', 2486

.end # FunctionExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2487
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2490
    getattribute $P3, self, 'fn'
    $P2 = $P3.'optimize'()
    setattribute self, 'fn', $P2
.annotate 'line', 2491
    .return(self)
# }
.annotate 'line', 2492

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2495
# var fn: $P1
    getattribute $P1, self, 'fn'
.annotate 'line', 2496
# reg: $S1
    $P2 = self.'tempreg'('P')
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 2497
    self.'annotate'(__ARG_1)
.annotate 'line', 2498
    $P2 = $P1.'getsubid'()
    __ARG_1.'say'(".const 'Sub' ", $S1, " = '", $P2, "'")
.annotate 'line', 2499
    set $S2, __ARG_2
    eq $S2, '', __label_2
.annotate 'line', 2500
    __ARG_1.'emitarg2'('newclosure', __ARG_2, $S1)
  __label_2: # endif
# }
.annotate 'line', 2501

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FunctionExpr' ]
.annotate 'line', 2476
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 2478
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
.annotate 'line', 2516
    setattribute self, 'condexpr', __ARG_1
.annotate 'line', 2517
    .return(self)
# }
.annotate 'line', 2518

.end # set


.sub 'optimize_condition' :method
# Body
# {
.annotate 'line', 2521
    getattribute $P3, self, 'condexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'condexpr', $P2
# }
.annotate 'line', 2522

.end # optimize_condition


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2525
    getattribute $P3, self, 'condexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'condexpr', $P2
.annotate 'line', 2526
    .return(self)
# }
.annotate 'line', 2527

.end # optimize


.sub 'getvalue' :method
# Body
# {
.annotate 'line', 2530
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 2531
    $P2 = $P1.'isliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
# switch
.annotate 'line', 2532
    $P3 = $P1.'checkresult'()
    set $S1, $P3
    set $S2, 'I'
    if $S1 == $S2 goto __label_4
    goto __label_3
  __label_4: # case
.annotate 'line', 2534
# n: $I1
    $P4 = $P1.'getIntegerValue'()
    set $I1, $P4
.annotate 'line', 2535
    ne $I1, 0, __label_5
.annotate 'line', 2536
    .return(2)
    goto __label_6
  __label_5: # else
.annotate 'line', 2538
    .return(1)
  __label_6: # endif
  __label_3: # default
  __label_2: # switch end
# }
  __label_1: # endif
.annotate 'line', 2541
    .return(0)
# }
.annotate 'line', 2542

.end # getvalue


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 2545
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 2547
    isa $I1, $P1, [ 'ComparatorBaseExpr' ]
    if $I1 goto __label_3
.annotate 'line', 2548
    isa $I1, $P1, [ 'NullCheckerExpr' ]
  __label_3:
    unless $I1 goto __label_1
.annotate 'line', 2549
    $P1.'emit_if'(__ARG_1, __ARG_2)
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2551
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
# switch
.annotate 'line', 2552
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
.annotate 'line', 2555
    __ARG_1.'emitif_null'($S1, __ARG_3)
  __label_9: # case
  __label_10: # case
.annotate 'line', 2558
    __ARG_1.'emitif'($S1, __ARG_2)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 2559
.const 'Sub' $P3 = 'WSubId_6'
.annotate 'line', 2561
    $P3('Invalid if condition')
  __label_5: # switch end
# }
  __label_2: # endif
# }
.annotate 'line', 2564

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 2567
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 2569
    isa $I1, $P1, [ 'ComparatorBaseExpr' ]
    if $I1 goto __label_3
.annotate 'line', 2570
    isa $I1, $P1, [ 'NullCheckerExpr' ]
  __label_3:
    unless $I1 goto __label_1
.annotate 'line', 2571
    $P1.'emit_else'(__ARG_1, __ARG_2)
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2573
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
# switch
.annotate 'line', 2574
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
.annotate 'line', 2577
    __ARG_1.'emitif_null'($S1, __ARG_2)
  __label_9: # case
  __label_10: # case
.annotate 'line', 2580
    __ARG_1.'emitunless'($S1, __ARG_2)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 2581
.const 'Sub' $P3 = 'WSubId_6'
.annotate 'line', 2583
    $P3('Invalid if condition')
  __label_5: # switch end
# }
  __label_2: # endif
# }
.annotate 'line', 2586

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Condition' ]
.annotate 'line', 2513
    addattribute $P0, 'condexpr'
.end
.namespace [ 'Literal' ]

.sub 'isliteral' :method
# Body
# {
.annotate 'line', 2593
    .return(1)
# }

.end # isliteral


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 2594
    .return(1)
# }

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Literal' ]
.annotate 'line', 2591
    get_class $P1, [ 'SimpleExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'StringLiteral' ]

.sub 'StringLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2604
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2605
    setattribute self, 'strval', __ARG_2
# }
.annotate 'line', 2606

.end # StringLiteral


.sub 'isstringliteral' :method
# Body
# {
.annotate 'line', 2607
    .return(1)
# }

.end # isstringliteral


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2608
    .return('S')
# }

.end # checkresult


.sub 'getPirString' :method
# Body
# {
.annotate 'line', 2611
# var strtok: $P1
    getattribute $P1, self, 'strval'
.annotate 'line', 2612
# str: $S1
    getattribute $P2, $P1, 'str'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 2613
# typesinglequoted: $I1
    isa $I1, $P1, [ 'TokenSingleQuoted' ]
.annotate 'line', 2614
# need_unicode: $I2
    null $I2
.annotate 'line', 2615
    box $P2, $S1
    iter $P3, $P2
    set $P3, 0
  __label_2: # for iteration
    unless $P3 goto __label_3
    shift $I3, $P3
# {
.annotate 'line', 2616
    le $I3, 127, __label_4
# {
.annotate 'line', 2617
    set $I2, 1
    goto __label_3 # break
.annotate 'line', 2618
# }
  __label_4: # endif
# }
    goto __label_2
  __label_3: # endfor
.annotate 'line', 2621
    unless $I2 goto __label_5
# {
.annotate 'line', 2622
    unless $I1 goto __label_6
# {
.annotate 'line', 2623
    null $I1
.annotate 'line', 2624
# saux: $S2
    set $S2, $S1
.annotate 'line', 2625
    set $S1, ''
.annotate 'line', 2626
    box $P2, $S2
    iter $P4, $P2
    set $P4, 0
  __label_7: # for iteration
    unless $P4 goto __label_8
    shift $S3, $P4
# {
.annotate 'line', 2627
    ne $S3, '\', __label_9
.annotate 'line', 2628
    set $S3, '\\'
  __label_9: # endif
.annotate 'line', 2629
    concat $S1, $S1, $S3
# }
    goto __label_7
  __label_8: # endfor
# }
  __label_6: # endif
.annotate 'line', 2632
# result: $S4
    set $S4, ''
.annotate 'line', 2633
    box $P2, $S1
    iter $P5, $P2
    set $P5, 0
  __label_10: # for iteration
    unless $P5 goto __label_11
    shift $S5, $P5
# {
.annotate 'line', 2634
# n: $I4
# predefined ord
    ord $I4, $S5
.annotate 'line', 2635
    le $I4, 127, __label_12
# {
.annotate 'line', 2636
# h: $S6
    box $P6, $I4
    $P2 = $P6.'get_as_base'(16)
    null $S6
    if_null $P2, __label_14
    set $S6, $P2
  __label_14:
.annotate 'line', 2637
    concat $S4, $S4, '\x{'
    concat $S4, $S4, $S6
    concat $S4, $S4, '}'
# }
    goto __label_13
  __label_12: # else
.annotate 'line', 2640
    concat $S4, $S4, $S5
  __label_13: # endif
# }
    goto __label_10
  __label_11: # endfor
.annotate 'line', 2642
    set $S1, $S4
# }
  __label_5: # endif
.annotate 'line', 2644
# q: $S7
    unless $I1 goto __label_16
    set $S7, "'"
    goto __label_15
  __label_16:
    set $S7, '"'
  __label_15:
.annotate 'line', 2645
    concat $S0, $S7, $S1
    concat $S0, $S0, $S7
    set $S1, $S0
.annotate 'line', 2646
    unless $I2 goto __label_17
.annotate 'line', 2647
    concat $S0, 'unicode:', $S1
    set $S1, $S0
  __label_17: # endif
.annotate 'line', 2648
    .return($S1)
# }
.annotate 'line', 2649

.end # getPirString


.sub 'get_value' :method
# Body
# {
.annotate 'line', 2652
# var strtok: $P1
    getattribute $P1, self, 'strval'
.annotate 'line', 2653
# str: $S1
    getattribute $P3, $P1, 'str'
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 2654
    isa $I1, $P1, [ 'TokenQuoted' ]
    unless $I1 goto __label_2
# {
.annotate 'line', 2655
# var s: $P2
    box $P2, $S1
.annotate 'line', 2656
    $P3 = $P2.'unescape'('utf8')
    set $S1, $P3
# }
  __label_2: # endif
.annotate 'line', 2658
    .return($S1)
# }
.annotate 'line', 2659

.end # get_value


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2662
    set $S1, __ARG_2
    eq $S1, '', __label_1
.annotate 'line', 2663
    $P1 = self.'getPirString'()
    __ARG_1.'emitset'(__ARG_2, $P1)
  __label_1: # endif
# }
.annotate 'line', 2664

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2667
    .tailcall self.'getPirString'()
# }
.annotate 'line', 2668

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'StringLiteral' ]
.annotate 'line', 2599
    get_class $P1, [ 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 2601
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
.annotate 'line', 2680
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2681
    setattribute self, 'pos', __ARG_2
.annotate 'line', 2682
# n: $I1
    null $I1
.annotate 'line', 2683
    unless __ARG_4 goto __label_1
.annotate 'line', 2684
    set $I1, __ARG_3
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2686
# aux: $S1
    set $P1, __ARG_2
    null $S1
    if_null $P1, __label_3
    set $S1, $P1
  __label_3:
.annotate 'line', 2687
    set $I1, $S1
# }
  __label_2: # endif
.annotate 'line', 2689
    box $P1, $I1
    setattribute self, 'numval', $P1
# }
.annotate 'line', 2690

.end # IntegerLiteral


.sub 'isintegerliteral' :method
# Body
# {
.annotate 'line', 2691
    .return(1)
# }

.end # isintegerliteral


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2692
    .return('I')
# }

.end # checkresult


.sub 'getIntegerValue' :method
# Body
# {
.annotate 'line', 2695
# aux: $S1
    getattribute $P1, self, 'numval'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
# predefined int
.annotate 'line', 2694
    set $I1, $S1
.annotate 'line', 2696
    .return($I1)
# }
.annotate 'line', 2697

.end # getIntegerValue


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2700
    set $S1, __ARG_2
    eq $S1, '', __label_1
# {
.annotate 'line', 2701
# value: $I1
    $P1 = self.'getIntegerValue'()
    set $I1, $P1
.annotate 'line', 2702
    ne $I1, 0, __label_2
.annotate 'line', 2703
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_3
  __label_2: # else
.annotate 'line', 2705
    __ARG_1.'emitset'(__ARG_2, $I1)
  __label_3: # endif
# }
  __label_1: # endif
# }
.annotate 'line', 2707

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2710
    .tailcall self.'getIntegerValue'()
# }
.annotate 'line', 2711

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IntegerLiteral' ]
.annotate 'line', 2673
    get_class $P1, [ 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 2675
    addattribute $P0, 'pos'
.annotate 'line', 2676
    addattribute $P0, 'numval'
.end
.namespace [ 'FloatLiteral' ]

.sub 'FloatLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2721
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2722
    setattribute self, 'numval', __ARG_2
# }
.annotate 'line', 2723

.end # FloatLiteral


.sub 'isfloatliteral' :method
# Body
# {
.annotate 'line', 2724
    .return(1)
# }

.end # isfloatliteral


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2725
    .return('N')
# }

.end # checkresult


.sub 'getFloatValue' :method
# Body
# {
.annotate 'line', 2728
# aux: $S1
    getattribute $P2, self, 'numval'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 2729
# var n: $P1
    new $P1, [ 'Float' ]
.annotate 'line', 2730
    assign $P1, $S1
.annotate 'line', 2731
    .return($P1)
# }
.annotate 'line', 2732

.end # getFloatValue


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2735
    set $S1, __ARG_2
    eq $S1, '', __label_1
# {
.annotate 'line', 2736
# var n: $P1
    $P1 = self.'getFloatValue'()
.annotate 'line', 2737
    __ARG_1.'emitset'(__ARG_2, $P1)
# }
  __label_1: # endif
# }
.annotate 'line', 2739

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2744
# aux: $S1
    getattribute $P1, self, 'numval'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 2745
# predefined indexof
    index $I1, $S1, '.'
    ge $I1, 0, __label_2
.annotate 'line', 2746
    concat $S1, $S1, '.0'
  __label_2: # endif
.annotate 'line', 2747
    .return($S1)
# }
.annotate 'line', 2748

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FloatLiteral' ]
.annotate 'line', 2716
    get_class $P1, [ 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 2718
    addattribute $P0, 'numval'
.end
.namespace [ 'IdentifierExpr' ]

.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 2756
    .return(1)
# }

.end # isidentifier


.sub 'IdentifierExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2759
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2760
    setattribute self, 'name', __ARG_2
# }
.annotate 'line', 2761

.end # IdentifierExpr


.sub 'isnull' :method
# Body
# {
.annotate 'line', 2764
    getattribute $P1, self, 'name'
    .tailcall $P1.'iskeyword'('null')
# }
.annotate 'line', 2765

.end # isnull


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2768
# var desc: $P1
    getattribute $P2, self, 'owner'
    getattribute $P3, self, 'name'
    $P1 = $P2.'getvar'($P3)
.annotate 'line', 2769
    if_null $P1, __label_1
.annotate 'line', 2770
    .tailcall $P1.'gettype'()
    goto __label_2
  __label_1: # else
# {
# switch
.annotate 'line', 2772
    getattribute $P2, self, 'name'
    set $S1, $P2
    set $S2, 'self'
    if $S1 == $S2 goto __label_5
    set $S2, 'null'
    if $S1 == $S2 goto __label_6
    goto __label_4
  __label_5: # case
  __label_6: # case
.annotate 'line', 2775
    .return('P')
  __label_4: # default
.annotate 'line', 2777
    .return('')
  __label_3: # switch end
# }
  __label_2: # endif
# }
.annotate 'line', 2780

.end # checkresult


.sub 'getName' :method
# Body
# {
.annotate 'line', 2783
# s: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 2784
    .return($S1)
# }
.annotate 'line', 2785

.end # getName


.sub 'checkIdentifier' :method
# Body
# {
.annotate 'line', 2788
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 2789
    unless_null $P1, __label_1
.const 'Sub' $P3 = 'WSubId_6'
.annotate 'line', 2790
    $P3('Bad thing')
  __label_1: # endif
.annotate 'line', 2791
# var desc: $P2
    getattribute $P4, self, 'owner'
    $P2 = $P4.'getvar'($P1)
.annotate 'line', 2792
# s: $S1
    null $S1
.annotate 'line', 2793
    unless_null $P2, __label_2
# {
.annotate 'line', 2794
# sname: $S2
    set $P4, $P1
    null $S2
    if_null $P4, __label_4
    set $S2, $P4
  __label_4:
# switch
.annotate 'line', 2795
    set $S3, $S2
    set $S4, 'self'
    if $S3 == $S4 goto __label_7
    set $S4, 'null'
    if $S3 == $S4 goto __label_8
    goto __label_6
  __label_7: # case
.annotate 'line', 2797
    set $S1, 'self'
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 2799
    set $S1, 'null'
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 2801
    set $S1, ''
  __label_5: # switch end
# }
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 2805
    $P4 = $P2.'getid'()
    if_null $P4, __label_9
.annotate 'line', 2806
    .tailcall $P2.'getid'()
    goto __label_10
  __label_9: # else
.annotate 'line', 2808
    $P5 = $P2.'getreg'()
    set $S1, $P5
  __label_10: # endif
# }
  __label_3: # endif
.annotate 'line', 2810
    .return($S1)
# }
.annotate 'line', 2811

.end # checkIdentifier


.sub 'getIdentifier' :method
# Body
# {
.annotate 'line', 2814
# var value: $P1
    $P1 = self.'checkIdentifier'()
.annotate 'line', 2815
    set $S2, $P1
    ne $S2, '', __label_1
# {
.annotate 'line', 2816
# name: $S1
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_2
    set $S1, $P2
  __label_2:
.const 'Sub' $P3 = 'WSubId_1'
.annotate 'line', 2817
    concat $S2, "Variable '", $S1
    concat $S2, $S2, "' is not defined"
    getattribute $P2, self, 'name'
    $P3($S2, $P2)
# }
  __label_1: # endif
.annotate 'line', 2819
    .return($P1)
# }
.annotate 'line', 2820

.end # getIdentifier


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2823
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 2824
# var desc: $P2
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
.annotate 'line', 2825
    if_null $P2, __label_1
# {
.annotate 'line', 2826
    $I2 = $P2.'isconst'()
    unless $I2 goto __label_3
    $P3 = $P2.'getid'()
    isnull $I2, $P3
  __label_3:
    unless $I2 goto __label_2
.annotate 'line', 2827
    .tailcall $P2.'getvalue'()
  __label_2: # endif
.annotate 'line', 2828
# flags: $I1
    $P3 = $P2.'getflags'()
    set $I1, $P3
.annotate 'line', 2829
    band $I2, $I1, 1
    unless $I2 goto __label_4
# {
.annotate 'line', 2830
    band $I3, $I1, 2
    unless $I3 goto __label_5
.annotate 'line', 2831
    new $P4, [ 'LexicalVolatileExpr' ]
    $P4.'LexicalVolatileExpr'(self, $P2)
    set $P3, $P4
    .return($P3)
  __label_5: # endif
# }
  __label_4: # endif
# }
  __label_1: # endif
.annotate 'line', 2834
    .return(self)
# }
.annotate 'line', 2835

.end # optimize


.sub 'emit_getid' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2838
# id: $S1
    $P2 = self.'getIdentifier'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 2839
# var desc: $P1
    getattribute $P2, self, 'owner'
    getattribute $P3, self, 'name'
    $P1 = $P2.'getvar'($P3)
.annotate 'line', 2840
# flags: $I1
    unless_null $P1, __label_3
    null $I1
    goto __label_2
  __label_3:
    $I1 = $P1.'getflags'()
  __label_2:
.annotate 'line', 2841
    band $I2, $I1, 1
    unless $I2 goto __label_4
# {
.annotate 'line', 2842
    band $I3, $I1, 2
    unless $I3 goto __label_5
# {
.annotate 'line', 2843
# lexname: $S2
    $P2 = $P1.'getlex'()
    null $S2
    if_null $P2, __label_6
    set $S2, $P2
  __label_6:
.annotate 'line', 2844
    isnull $I2, $S2
    not $I2
    unless $I2 goto __label_8
    isne $I2, $S2, ''
  __label_8:
    unless $I2 goto __label_7
.annotate 'line', 2845
    __ARG_1.'emitfind_lex'($S1, $S2)
  __label_7: # endif
# }
  __label_5: # endif
# }
  __label_4: # endif
.annotate 'line', 2848
    .return($S1)
# }
.annotate 'line', 2849

.end # emit_getid


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2852
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 2853
    self.'annotate'(__ARG_1)
.annotate 'line', 2854
# id: $S1
    $P1 = self.'emit_getid'(__ARG_1)
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 2855
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_1: # endif
# }
.annotate 'line', 2857

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2860
    self.'annotate'(__ARG_1)
.annotate 'line', 2861
    .tailcall self.'emit_getid'(__ARG_1)
# }
.annotate 'line', 2862

.end # emit_get


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2865
    self.'annotate'(__ARG_1)
.annotate 'line', 2866
    $P1 = self.'isnull'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
# predefined die
.annotate 'line', 2867
    die "NO"
  __label_1: # endif
.annotate 'line', 2868
# typeleft: $S1
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 2869
# lreg: $S2
    $P1 = self.'getIdentifier'()
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
  __label_3:
.annotate 'line', 2870
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_4
    unless $P1 goto __label_4
# {
# switch
.annotate 'line', 2871
    set $S5, $S1
    set $S6, 'S'
    if $S5 == $S6 goto __label_8
    set $S6, 'P'
    if $S5 == $S6 goto __label_9
    goto __label_7
  __label_8: # case
  __label_9: # case
.annotate 'line', 2874
    __ARG_1.'emitnull'($S2)
    goto __label_6 # break
  __label_7: # default
.annotate 'line', 2875
.const 'Sub' $P2 = 'WSubId_1'
.annotate 'line', 2877
    getattribute $P3, self, 'start'
    $P2("Can't assign null to that type", $P3)
  __label_6: # switch end
# }
    goto __label_5
  __label_4: # else
.annotate 'line', 2880
    isa $I1, __ARG_2, [ 'IndexExpr' ]
    unless $I1 goto __label_10
.annotate 'line', 2881
    __ARG_2.'emit'(__ARG_1, $S2)
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 2883
# typeright: $S3
    $P1 = __ARG_2.'checkresult'()
    null $S3
    if_null $P1, __label_12
    set $S3, $P1
  __label_12:
.annotate 'line', 2884
    ne $S3, 'v', __label_13
.const 'Sub' $P4 = 'WSubId_1'
.annotate 'line', 2885
    getattribute $P1, self, 'start'
    $P4("Can't assign from void expression", $P1)
  __label_13: # endif
.annotate 'line', 2886
    ne $S1, $S3, __label_14
# {
.annotate 'line', 2887
    __ARG_2.'emit'(__ARG_1, $S2)
# }
    goto __label_15
  __label_14: # else
# {
.annotate 'line', 2890
# rreg: $S4
    $P1 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P1, __label_16
    set $S4, $P1
  __label_16:
.annotate 'line', 2891
    self.'annotate'(__ARG_1)
.annotate 'line', 2892
    iseq $I1, $S1, 'P'
    unless $I1 goto __label_19
    isne $I1, $S3, 'P'
  __label_19:
    unless $I1 goto __label_17
.annotate 'line', 2893
    __ARG_1.'emitbox'($S2, $S4)
    goto __label_18
  __label_17: # else
.annotate 'line', 2895
    __ARG_1.'emitset'($S2, $S4)
  __label_18: # endif
# }
  __label_15: # endif
# }
  __label_11: # endif
  __label_5: # endif
.annotate 'line', 2898
    .return($S2)
# }
.annotate 'line', 2899

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IdentifierExpr' ]
.annotate 'line', 2753
    get_class $P1, [ 'SimpleExpr' ]
    addparent $P0, $P1
.annotate 'line', 2755
    addattribute $P0, 'name'
.end
.namespace [ 'LexicalVolatileExpr' ]

.sub 'LexicalVolatileExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2909
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 2910
    setattribute self, 'desc', __ARG_2
# }
.annotate 'line', 2911

.end # LexicalVolatileExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2912
    .return('P')
# }

.end # checkresult


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2915
# var desc: $P1
    getattribute $P1, self, 'desc'
.annotate 'line', 2916
# lexname: $S1
    $P2 = $P1.'getlex'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 2917
# reg: $S2
    getattribute $P3, self, 'owner'
    $P2 = $P3.'tempreg'('P')
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 2918
    __ARG_1.'emitfind_lex'($S2, $S1)
.annotate 'line', 2919
    .return($S2)
# }
.annotate 'line', 2920

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2923
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 2924
    self.'annotate'(__ARG_1)
.annotate 'line', 2925
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 2926
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_1: # endif
# }
.annotate 'line', 2928

.end # emit


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2931
# lreg: $S1
    getattribute $P3, self, 'owner'
    $P2 = $P3.'tempreg'('P')
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
# switch-case
.annotate 'line', 2933
    $I1 = __ARG_2.'isnull'()
    if $I1 goto __label_4
.annotate 'line', 2936
    isa $I1, __ARG_2, [ 'IndexExpr' ]
    if $I1 goto __label_5
    goto __label_3
  __label_4: # case
.annotate 'line', 2934
    __ARG_1.'emitnull'($S1)
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 2937
    __ARG_2.'emit'(__ARG_1, $S1)
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 2940
# typeright: $S2
    $P2 = __ARG_2.'checkresult'()
    null $S2
    if_null $P2, __label_6
    set $S2, $P2
  __label_6:
.annotate 'line', 2941
    ne 'P', $S2, __label_7
.annotate 'line', 2942
    __ARG_2.'emit'(__ARG_1, $S1)
    goto __label_8
  __label_7: # else
# {
.annotate 'line', 2944
# rreg: $S3
    $P3 = __ARG_2.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_9
    set $S3, $P3
  __label_9:
.annotate 'line', 2945
    self.'annotate'(__ARG_1)
.annotate 'line', 2946
    __ARG_1.'emitbox'($S1, $S3)
# }
  __label_8: # endif
  __label_2: # switch end
.annotate 'line', 2950
# var desc: $P1
    getattribute $P1, self, 'desc'
.annotate 'line', 2951
# lexname: $S4
    $P2 = $P1.'getlex'()
    null $S4
    if_null $P2, __label_10
    set $S4, $P2
  __label_10:
.annotate 'line', 2952
    __ARG_1.'say'("store_lex '", $S4, "', ", $S1)
# }
.annotate 'line', 2953

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'LexicalVolatileExpr' ]
.annotate 'line', 2904
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 2906
    addattribute $P0, 'desc'
.end
.namespace [ 'OpExpr' ]

.sub 'initop' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2962
    self.'Expr'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2963

.end # initop

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpExpr' ]
.annotate 'line', 2958
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
.annotate 'line', 2974
    self.'initop'(__ARG_2, __ARG_3)
.annotate 'line', 2975
.const 'Sub' $P3 = 'WSubId_48'
    $P2 = $P3(__ARG_1, __ARG_2)
    setattribute self, 'clspec', $P2
# }
.annotate 'line', 2976

.end # OpClassExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2977
    .return('P')
# }

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2980
# var clspec: $P1
    getattribute $P1, self, 'clspec'
.annotate 'line', 2983
    set $S1, __ARG_2
    ne $S1, '', __label_1
.annotate 'line', 2984
    getattribute $P2, self, 'owner'
    __ARG_2 = $P2.'tempreg'('P')
  __label_1: # endif
.annotate 'line', 2985
    __ARG_1.'print'('    get_class ', __ARG_2, ', ')
.annotate 'line', 2986
    getattribute $P2, self, 'owner'
    $P1.'emit'(__ARG_1, $P2)
.annotate 'line', 2987
    __ARG_1.'say'()
# }
.annotate 'line', 2988

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpClassExpr' ]
.annotate 'line', 2968
    get_class $P1, [ 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 2970
    addattribute $P0, 'clspec'
.end
.namespace [ 'OpUnaryExpr' ]

.sub 'OpUnaryExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2998
    self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 2999
    setattribute self, 'subexpr', __ARG_3
# }
.annotate 'line', 3000

.end # OpUnaryExpr


.sub 'optimizearg' :method
# Body
# {
.annotate 'line', 3003
    getattribute $P3, self, 'subexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'subexpr', $P2
# }
.annotate 'line', 3004

.end # optimizearg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3007
    self.'optimizearg'()
.annotate 'line', 3008
    .return(self)
# }
.annotate 'line', 3009

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpUnaryExpr' ]
.annotate 'line', 2993
    get_class $P1, [ 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 2995
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
.annotate 'line', 3020
    self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 3021
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 3022
    setattribute self, 'rexpr', __ARG_4
# }
.annotate 'line', 3023

.end # initbinary


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 3026
    self.'initbinary'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 3027
    .return(self)
# }
.annotate 'line', 3028

.end # set


.sub 'setfrom' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3031
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    getattribute $P3, __ARG_1, 'lexpr'
    getattribute $P4, __ARG_1, 'rexpr'
    .tailcall self.'set'($P1, $P2, $P3, $P4)
# }
.annotate 'line', 3032

.end # setfrom


.sub 'optimizearg' :method
# Body
# {
.annotate 'line', 3035
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 3036
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'rexpr', $P2
# }
.annotate 'line', 3037

.end # optimizearg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3040
    self.'optimizearg'()
.annotate 'line', 3041
    .return(self)
# }
.annotate 'line', 3042

.end # optimize


.sub 'emit_intleft' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3045
    getattribute $P1, self, 'lexpr'
    .tailcall $P1.'emit_getint'(__ARG_1)
# }
.annotate 'line', 3046

.end # emit_intleft


.sub 'emit_intright' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3049
    getattribute $P1, self, 'rexpr'
    .tailcall $P1.'emit_getint'(__ARG_1)
# }
.annotate 'line', 3050

.end # emit_intright

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBinaryExpr' ]
.annotate 'line', 3014
    get_class $P1, [ 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3016
    addattribute $P0, 'lexpr'
.annotate 'line', 3017
    addattribute $P0, 'rexpr'
.end
.namespace [ 'OpBinaryIntExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3059
    .return('I')
# }
.annotate 'line', 3060

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3063
    self.'optimizearg'()
.annotate 'line', 3064
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3065
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3066
    $I3 = $P1.'isintegerliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isintegerliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 3067
# li: $I1
# predefined int
    getattribute $P3, $P1, 'numval'
    set $I1, $P3
.annotate 'line', 3068
# ri: $I2
# predefined int
    getattribute $P3, $P2, 'numval'
    set $I2, $P3
.annotate 'line', 3069
.const 'Sub' $P4 = 'WSubId_16'
    getattribute $P3, self, 'owner'
    getattribute $P5, self, 'start'
    $P6 = self.'do_op'($I1, $I2)
    .tailcall $P4($P3, $P5, $P6)
# }
  __label_1: # endif
.annotate 'line', 3071
    .return(self)
# }
.annotate 'line', 3072

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBinaryIntExpr' ]
.annotate 'line', 3055
    get_class $P1, [ 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpDelExBase' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3081
    .return('I')
# }
.annotate 'line', 3082

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpDelExBase' ]
.annotate 'line', 3077
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
.annotate 'line', 3090
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3091

.end # OpDeleteExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3094
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3095
    isa $I1, $P1, [ 'IndexExpr' ]
    unless $I1 goto __label_3
    $P2 = $P1.'checkresult'()
    set $S1, $P2
    isne $I1, $S1, 'S'
  __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 3096
    $P1.'emit_prep'(__ARG_1)
.annotate 'line', 3097
    self.'annotate'(__ARG_1)
.annotate 'line', 3098
    __ARG_1.'print'('    delete ')
.annotate 'line', 3099
    $P1.'emit_aux'(__ARG_1)
.annotate 'line', 3100
    __ARG_1.'say'()
.annotate 'line', 3101
    set $S1, __ARG_2
    eq $S1, '', __label_4
.annotate 'line', 3102
    __ARG_1.'emitset'(__ARG_2, '1')
  __label_4: # endif
# }
    goto __label_2
  __label_1: # else
.const 'Sub' $P3 = 'WSubId_1'
.annotate 'line', 3105
    getattribute $P2, self, 'start'
    $P3("delete with invalid operator", $P2)
  __label_2: # endif
# }
.annotate 'line', 3106

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpDeleteExpr' ]
.annotate 'line', 3086
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
.annotate 'line', 3113
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3114

.end # OpExistsExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3117
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3118
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
.annotate 'line', 3119
    isa $I1, $P1, [ 'IndexExpr' ]
    unless $I1 goto __label_6
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    isne $I1, $S2, 'S'
  __label_6:
    unless $I1 goto __label_4
# {
.annotate 'line', 3120
    $P1.'emit_prep'(__ARG_1)
.annotate 'line', 3121
    self.'annotate'(__ARG_1)
.annotate 'line', 3122
    __ARG_1.'print'('    exists ', $S1, ', ')
.annotate 'line', 3123
    $P1.'emit_aux'(__ARG_1)
.annotate 'line', 3124
    __ARG_1.'say'()
# }
    goto __label_5
  __label_4: # else
.const 'Sub' $P3 = 'WSubId_1'
.annotate 'line', 3127
    getattribute $P2, self, 'start'
    $P3("exists with invalid operator", $P2)
  __label_5: # endif
# }
.annotate 'line', 3128

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpExistsExpr' ]
.annotate 'line', 3109
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
.annotate 'line', 3137
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3138

.end # OpUnaryMinusExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3141
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3142

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3145
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3146
    .return(self)
# }
.annotate 'line', 3147

.end # set


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3150
    self.'optimizearg'()
.annotate 'line', 3151
    getattribute $P4, self, 'subexpr'
    $P3 = $P4.'isintegerliteral'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 3152
# var numval: $P1
    getattribute $P5, self, 'subexpr'
    getattribute $P1, $P5, 'numval'
.annotate 'line', 3153
# i: $I1
    set $P3, $P1
    set $I1, $P3
.annotate 'line', 3154
.const 'Sub' $P6 = 'WSubId_16'
    getattribute $P3, self, 'owner'
    getattribute $P5, self, 'subexpr'
    getattribute $P4, $P5, 'start'
    neg $I2, $I1
    .tailcall $P6($P3, $P4, $I2)
# }
  __label_1: # endif
# {
.annotate 'line', 3157
    getattribute $P4, self, 'subexpr'
    $P3 = $P4.'isfloatliteral'()
    if_null $P3, __label_2
    unless $P3 goto __label_2
# {
.annotate 'line', 3158
# var numval: $P2
    getattribute $P5, self, 'subexpr'
    getattribute $P2, $P5, 'numval'
.annotate 'line', 3159
# n: $N1
# predefined string
    set $S1, $P2
    set $N1, $S1
.annotate 'line', 3160
.const 'Sub' $P7 = 'WSubId_49'
    getattribute $P3, self, 'owner'
    getattribute $P5, self, 'subexpr'
    getattribute $P4, $P5, 'start'
    neg $N2, $N1
    .tailcall $P7($P3, $P4, $N2)
# }
  __label_2: # endif
# }
.annotate 'line', 3163
    .return(self)
# }
.annotate 'line', 3164

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3167
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3168
    self.'annotate'(__ARG_1)
.annotate 'line', 3169
    __ARG_1.'emitarg2'('neg', __ARG_2, $S1)
# }
.annotate 'line', 3170

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpUnaryMinusExpr' ]
.annotate 'line', 3133
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
.annotate 'line', 3179
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3180

.end # OpNotExpr


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3181
    .return(1)
# }

.end # isnegable


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3184
    .return('I')
# }
.annotate 'line', 3185

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3188
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3189
    .return(self)
# }
.annotate 'line', 3190

.end # set


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3193
    self.'optimizearg'()
.annotate 'line', 3194
# var subexpr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3195
    $P3 = $P1.'isintegerliteral'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 3196
# var numval: $P2
    getattribute $P2, $P1, 'numval'
.annotate 'line', 3197
# n: $I1
    set $P3, $P2
    set $I1, $P3
.annotate 'line', 3198
.const 'Sub' $P4 = 'WSubId_16'
    getattribute $P3, self, 'owner'
    getattribute $P5, $P1, 'start'
    not $I2, $I1
    .tailcall $P4($P3, $P5, $I2)
# }
  __label_1: # endif
.annotate 'line', 3200
    $P3 = $P1.'isnegable'()
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 3201
    .tailcall $P1.'negated'()
  __label_2: # endif
.annotate 'line', 3202
    .return(self)
# }
.annotate 'line', 3203

.end # optimize


.sub 'negated' :method
# Body
# {
.annotate 'line', 3206
    getattribute $P1, self, 'subexpr'
    .return($P1)
# }
.annotate 'line', 3207

.end # negated


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3210
# var subexpr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3211
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3212
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 3213
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    set $S3, 'I'
    if $S2 == $S3 goto __label_4
    set $S3, 'P'
    if $S2 == $S3 goto __label_5
    goto __label_3
  __label_4: # case
.annotate 'line', 3215
    __ARG_1.'emitarg2'('not', __ARG_2, $S1)
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 3218
    __ARG_1.'emitarg2'('isfalse', __ARG_2, $S1)
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 3221
    __ARG_1.'emitarg2'('isfalse', __ARG_2, $S1)
  __label_2: # switch end
# }
.annotate 'line', 3223

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpNotExpr' ]
.annotate 'line', 3175
    get_class $P1, [ 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpIncDec' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3232
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3233

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpIncDec' ]
.annotate 'line', 3228
    get_class $P1, [ 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpPreIncDec' ]

.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3242
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3243
    set $S2, __ARG_2
    eq $S2, '', __label_2
.annotate 'line', 3244
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_2: # endif
# }
.annotate 'line', 3245

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpPreIncDec' ]
.annotate 'line', 3238
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
.annotate 'line', 3252
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3253

.end # OpPreIncExpr


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3256
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3257
    self.'annotate'(__ARG_1)
.annotate 'line', 3258
    __ARG_1.'emitinc'($S1)
.annotate 'line', 3259
    .return($S1)
# }
.annotate 'line', 3260

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpPreIncExpr' ]
.annotate 'line', 3248
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
.annotate 'line', 3267
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3268

.end # OpPreDecExpr


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3271
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3272
    self.'annotate'(__ARG_1)
.annotate 'line', 3273
    __ARG_1.'emitdec'($S1)
.annotate 'line', 3274
    .return($S1)
# }
.annotate 'line', 3275

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpPreDecExpr' ]
.annotate 'line', 3263
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
.annotate 'line', 3284
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3285

.end # OpPostIncExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3288
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3289
    self.'annotate'(__ARG_1)
.annotate 'line', 3290
    set $S2, __ARG_2
    eq $S2, '', __label_2
.annotate 'line', 3291
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_2: # endif
.annotate 'line', 3292
    __ARG_1.'emitinc'($S1)
.annotate 'line', 3293
    .return($S1)
# }
.annotate 'line', 3294

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpPostIncExpr' ]
.annotate 'line', 3280
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
.annotate 'line', 3301
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3302

.end # OpPostDecExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3305
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3306
    self.'annotate'(__ARG_1)
.annotate 'line', 3307
    set $S2, __ARG_2
    eq $S2, '', __label_2
.annotate 'line', 3308
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_2: # endif
.annotate 'line', 3309
    __ARG_1.'emitdec'($S1)
.annotate 'line', 3310
    .return($S1)
# }
.annotate 'line', 3311

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpPostDecExpr' ]
.annotate 'line', 3297
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
.annotate 'line', 3322
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3323
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 3324
    setattribute self, 'rexpr', __ARG_4
.annotate 'line', 3325
    .return(self)
# }
.annotate 'line', 3326

.end # set


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3329
    getattribute $P1, self, 'lexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3330

.end # checkresult


.sub 'optimize_base' :method
# Body
# {
.annotate 'line', 3333
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 3334
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'rexpr', $P2
.annotate 'line', 3335
    .return(self)
# }
.annotate 'line', 3336

.end # optimize_base


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3339
    .tailcall self.'optimize_base'()
# }
.annotate 'line', 3340

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3343
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3344
    set $S2, __ARG_2
    eq $S2, '', __label_2
# {
.annotate 'line', 3345
    self.'annotate'(__ARG_1)
.annotate 'line', 3346
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_2: # endif
# }
.annotate 'line', 3348

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBaseAssignExpr' ]
.annotate 'line', 3316
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3318
    addattribute $P0, 'lexpr'
.annotate 'line', 3319
    addattribute $P0, 'rexpr'
.end
.namespace [ 'OpAssignExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3357
    self.'annotate'(__ARG_1)
.annotate 'line', 3358
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3359
    getattribute $P2, self, 'rexpr'
    .tailcall $P1.'emit_assign_get'(__ARG_1, $P2)
# }
.annotate 'line', 3360

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpAssignExpr' ]
.annotate 'line', 3353
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpAssignToExpr' ]

.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3369
    self.'annotate'(__ARG_1)
.annotate 'line', 3370
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3371
    isnull $I1, __ARG_2
    not $I1
    unless $I1 goto __label_3
    set $S2, __ARG_2
    isne $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 3372
    __ARG_1.'emitassign'(__ARG_2, $S1)
  __label_2: # endif
# }
.annotate 'line', 3373

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3376
    self.'annotate'(__ARG_1)
.annotate 'line', 3377
# reg: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3378
# reg2: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3379
    __ARG_1.'emitassign'($S1, $S2)
.annotate 'line', 3380
    .return($S1)
# }
.annotate 'line', 3381

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpAssignToExpr' ]
.annotate 'line', 3365
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpAddToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3390
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3391
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3392
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 3393
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 3394
# reg: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 3395
    iseq $I1, $S1, 'S'
    unless $I1 goto __label_6
    isa $I1, $P2, [ 'ConcatString' ]
  __label_6:
    unless $I1 goto __label_4
.annotate 'line', 3396
    $P2.'emit_concat_to'(__ARG_1, $S3)
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 3398
# reg2: $S4
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_7
    set $S4, $P3
  __label_7:
.annotate 'line', 3399
# aux: $S5
    null $S5
.annotate 'line', 3400
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 3401
    set $S6, $S1
    set $S7, 'S'
    if $S6 == $S7 goto __label_10
    set $S7, 'I'
    if $S6 == $S7 goto __label_11
    set $S7, 'N'
    if $S6 == $S7 goto __label_12
    goto __label_9
  __label_10: # case
.annotate 'line', 3403
    eq $S2, 'S', __label_13
# {
.annotate 'line', 3404
    $P3 = self.'tempreg'('S')
    set $S5, $P3
.annotate 'line', 3405
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3406
    set $S4, $S5
# }
  __label_13: # endif
.annotate 'line', 3408
    __ARG_1.'emitconcat1'($S3, $S4)
    goto __label_8 # break
  __label_11: # case
  __label_12: # case
.annotate 'line', 3412
    eq $S1, $S2, __label_14
# {
.annotate 'line', 3413
    $P3 = self.'tempreg'($S1)
    set $S5, $P3
.annotate 'line', 3414
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3415
    set $S4, $S5
# }
  __label_14: # endif
.annotate 'line', 3417
    __ARG_1.'emitaddto'($S3, $S4)
    goto __label_8 # break
  __label_9: # default
.annotate 'line', 3420
    __ARG_1.'emitaddto'($S3, $S4)
  __label_8: # switch end
# }
  __label_5: # endif
.annotate 'line', 3423
    .return($S3)
# }
.annotate 'line', 3424

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpAddToExpr' ]
.annotate 'line', 3386
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpSubToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3433
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3434
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3435
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 3436
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 3437
# reg: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 3438
# reg2: $S4
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_4
    set $S4, $P3
  __label_4:
.annotate 'line', 3439
# aux: $S5
    null $S5
.annotate 'line', 3440
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 3441
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
.annotate 'line', 3443
    getattribute $P3, self, 'start'
    $P4("-= can't be applied to string", $P3)
  __label_8: # case
  __label_9: # case
.annotate 'line', 3446
    eq $S1, $S2, __label_10
# {
.annotate 'line', 3447
    $P5 = self.'tempreg'($S1)
    set $S5, $P5
.annotate 'line', 3448
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3449
    set $S4, $S5
# }
  __label_10: # endif
.annotate 'line', 3451
    __ARG_1.'emitsubto'($S3, $S4)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 3454
    __ARG_1.'emitsubto'($S3, $S4)
  __label_5: # switch end
.annotate 'line', 3456
    .return($S3)
# }
.annotate 'line', 3457

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpSubToExpr' ]
.annotate 'line', 3429
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpMulToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3466
# ltype: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3467
# rtype: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3468
# lreg: $S3
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 3469
# rreg: $S4
    null $S4
# switch
.annotate 'line', 3470
    set $S5, $S1
    set $S6, 'S'
    if $S5 == $S6 goto __label_6
    goto __label_5
  __label_6: # case
.annotate 'line', 3472
    ne $S2, 'I', __label_7
.annotate 'line', 3473
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    set $S4, $P1
    goto __label_8
  __label_7: # else
# {
.annotate 'line', 3475
    $P3 = self.'tempreg'('I')
    set $S4, $P3
.annotate 'line', 3476
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S4)
# }
  __label_8: # endif
.annotate 'line', 3478
    self.'annotate'(__ARG_1)
.annotate 'line', 3479
    __ARG_1.'emitrepeat'($S3, $S3, $S4)
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 3482
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    set $S4, $P1
.annotate 'line', 3483
    self.'annotate'(__ARG_1)
.annotate 'line', 3484
    __ARG_1.'emitarg2'('mul', $S3, $S4)
  __label_4: # switch end
.annotate 'line', 3486
    .return($S3)
# }
.annotate 'line', 3487

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpMulToExpr' ]
.annotate 'line', 3462
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpDivToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3496
# type: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3497
# reg: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3498
# reg2: $S3
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 3499
    self.'annotate'(__ARG_1)
.annotate 'line', 3500
    __ARG_1.'emitarg2'('div', $S2, $S3)
.annotate 'line', 3501
    .return($S2)
# }
.annotate 'line', 3502

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpDivToExpr' ]
.annotate 'line', 3492
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpModToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3511
# type: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3512
# reg: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3513
# reg2: $S3
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 3514
    self.'annotate'(__ARG_1)
.annotate 'line', 3515
    __ARG_1.'emitarg2'('mod', $S2, $S3)
.annotate 'line', 3516
    .return($S2)
# }
.annotate 'line', 3517

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpModToExpr' ]
.annotate 'line', 3507
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'ComparatorBaseExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3524
    .return('I')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3527
    self.'optimizearg'()
.annotate 'line', 3528
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3529
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3530
    $I3 = $P1.'isintegerliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isintegerliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 3531
# li: $I1
# predefined int
    getattribute $P3, $P1, 'numval'
    set $I1, $P3
.annotate 'line', 3532
# ri: $I2
# predefined int
    getattribute $P3, $P2, 'numval'
    set $I2, $P3
.annotate 'line', 3533
.const 'Sub' $P4 = 'WSubId_16'
    getattribute $P3, self, 'owner'
    getattribute $P5, self, 'start'
    $P6 = self.'int_op'($I1, $I2)
    .tailcall $P4($P3, $P5, $P6)
# }
  __label_1: # endif
.annotate 'line', 3535
    .return(self)
# }
.annotate 'line', 3536

.end # optimize


.sub 'emit_comparator' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 3539
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3540
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3541
# regl: $S3
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 3542
# regr: $S4
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P1, __label_4
    set $S4, $P1
  __label_4:
.annotate 'line', 3543
    self.'annotate'(__ARG_1)
.annotate 'line', 3544
# aux: $S5
    null $S5
# switch-case
.annotate 'line', 3546
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_8
    iseq $I1, $S2, 'N'
  __label_8:
    if $I1 goto __label_7
.annotate 'line', 3551
    iseq $I1, $S1, 'N'
    unless $I1 goto __label_10
    iseq $I1, $S2, 'I'
  __label_10:
    if $I1 goto __label_9
.annotate 'line', 3556
    iseq $I1, $S2, 'I'
    unless $I1 goto __label_12
    iseq $I1, $S1, 'P'
  __label_12:
    if $I1 goto __label_11
.annotate 'line', 3561
    iseq $I1, $S2, 'P'
    unless $I1 goto __label_14
    iseq $I1, $S1, 'I'
  __label_14:
    if $I1 goto __label_13
.annotate 'line', 3566
    iseq $I1, $S2, 'S'
    unless $I1 goto __label_16
    iseq $I1, $S1, 'P'
  __label_16:
    if $I1 goto __label_15
.annotate 'line', 3571
    iseq $I1, $S2, 'P'
    unless $I1 goto __label_18
    iseq $I1, $S1, 'S'
  __label_18:
    if $I1 goto __label_17
    goto __label_6
  __label_7: # case
.annotate 'line', 3547
    $P1 = self.'tempreg'('N')
    set $S5, $P1
.annotate 'line', 3548
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3549
    set $S3, $S5
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 3552
    $P2 = self.'tempreg'('N')
    set $S5, $P2
.annotate 'line', 3553
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3554
    set $S4, $S5
    goto __label_5 # break
  __label_11: # case
.annotate 'line', 3557
    $P3 = self.'tempreg'('I')
    set $S5, $P3
.annotate 'line', 3558
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3559
    set $S3, $S5
    goto __label_5 # break
  __label_13: # case
.annotate 'line', 3562
    $P4 = self.'tempreg'('I')
    set $S5, $P4
.annotate 'line', 3563
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3564
    set $S4, $S5
    goto __label_5 # break
  __label_15: # case
.annotate 'line', 3567
    $P5 = self.'tempreg'('S')
    set $S5, $P5
.annotate 'line', 3568
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3569
    set $S3, $S5
    goto __label_5 # break
  __label_17: # case
.annotate 'line', 3572
    $P6 = self.'tempreg'('S')
    set $S5, $P6
.annotate 'line', 3573
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3574
    set $S4, $S5
    goto __label_5 # break
  __label_6: # default
  __label_5: # switch end
.annotate 'line', 3575
# switch
.annotate 'line', 3578
    set $I1, __ARG_3
    null $I2
    if $I1 == $I2 goto __label_21
    set $I2, 1
    if $I1 == $I2 goto __label_22
    set $I2, 2
    if $I1 == $I2 goto __label_23
    goto __label_20
  __label_21: # case
.annotate 'line', 3580
    self.'emitop'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_19 # break
  __label_22: # case
.annotate 'line', 3583
    self.'emitop_if'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_19 # break
  __label_23: # case
.annotate 'line', 3586
    self.'emitop_else'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_19 # break
  __label_20: # default
  __label_19: # switch end
.annotate 'line', 3587
# }
.annotate 'line', 3589

.end # emit_comparator


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3592
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3593

.end # emit


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 3596
    self.'emit_comparator'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 3597

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 3600
    self.'emit_comparator'(__ARG_1, __ARG_2, 2)
# }
.annotate 'line', 3601

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ComparatorBaseExpr' ]
.annotate 'line', 3522
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
.annotate 'line', 3616
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 3617
    setattribute self, 'expr', __ARG_2
.annotate 'line', 3618
    box $P1, __ARG_3
    setattribute self, 'checknull', $P1
# }
.annotate 'line', 3619

.end # NullCheckerExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3620
    .return('I')
# }

.end # checkresult


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3621
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3624
# checkneg: $I1
    getattribute $P1, self, 'checknull'
    isfalse $I1, $P1
.annotate 'line', 3625
    box $P1, $I1
    setattribute self, 'checknull', $P1
.annotate 'line', 3626
    .return(self)
# }
.annotate 'line', 3627

.end # negated


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3630
# reg: $S1
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3631
    self.'annotate'(__ARG_1)
.annotate 'line', 3632
    __ARG_1.'emitarg2'('isnull', __ARG_2, $S1)
.annotate 'line', 3633
    getattribute $P1, self, 'checknull'
    isfalse $I1, $P1
    unless $I1 goto __label_2
.annotate 'line', 3634
    __ARG_1.'emitarg1'('not', __ARG_2)
  __label_2: # endif
# }
.annotate 'line', 3635

.end # emit


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 3638
# reg: $S1
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3639
    self.'annotate'(__ARG_1)
.annotate 'line', 3640
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
.annotate 'line', 3641

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NullCheckerExpr' ]
.annotate 'line', 3609
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3611
    addattribute $P0, 'expr'
.annotate 'line', 3612
    addattribute $P0, 'checknull'
.end
.namespace [ 'OpEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3648
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3651
    new $P1, [ 'OpNotEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3652

.end # negated


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3655
    self.'optimizearg'()
.annotate 'line', 3656
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3657
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3658
# lnull: $I1
    $P3 = $P1.'isnull'()
    set $I1, $P3
.annotate 'line', 3659
# rnull: $I2
    $P3 = $P2.'isnull'()
    set $I2, $P3
.annotate 'line', 3660
    unless $I1 goto __label_1
# {
.annotate 'line', 3661
    unless $I2 goto __label_2
.annotate 'line', 3662
.const 'Sub' $P4 = 'WSubId_16'
    getattribute $P3, self, 'owner'
    getattribute $P5, self, 'start'
    .tailcall $P4($P3, $P5, 1)
    goto __label_3
  __label_2: # else
.annotate 'line', 3664
    new $P7, [ 'NullCheckerExpr' ]
    getattribute $P8, self, 'rexpr'
    $P7.'NullCheckerExpr'(self, $P8, 1)
    set $P6, $P7
    .return($P6)
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 3666
    unless $I2 goto __label_4
.annotate 'line', 3667
    new $P5, [ 'NullCheckerExpr' ]
    getattribute $P6, self, 'lexpr'
    $P5.'NullCheckerExpr'(self, $P6, 1)
    set $P3, $P5
    .return($P3)
  __label_4: # endif
.annotate 'line', 3668
    $I5 = $P1.'isliteral'()
    unless $I5 goto __label_6
    $I5 = $P2.'isliteral'()
  __label_6:
    unless $I5 goto __label_5
# {
.annotate 'line', 3669
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_7
    set $S1, $P3
  __label_7:
.annotate 'line', 3670
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_8
    set $S2, $P3
  __label_8:
.annotate 'line', 3671
    ne $S1, $S2, __label_9
# {
# switch
.annotate 'line', 3672
    set $S5, $S1
    set $S6, 'I'
    if $S5 == $S6 goto __label_12
    set $S6, 'S'
    if $S5 == $S6 goto __label_13
    goto __label_11
  __label_12: # case
.annotate 'line', 3674
# li: $I3
# predefined int
    getattribute $P3, $P1, 'numval'
    set $I3, $P3
.annotate 'line', 3675
# ri: $I4
# predefined int
    getattribute $P5, $P2, 'numval'
    set $I4, $P5
.annotate 'line', 3676
.const 'Sub' $P9 = 'WSubId_16'
    getattribute $P6, self, 'owner'
    getattribute $P7, self, 'start'
    iseq $I5, $I3, $I4
    .tailcall $P9($P6, $P7, $I5)
  __label_13: # case
.annotate 'line', 3678
# ls: $S3
    getattribute $P10, $P1, 'strval'
    getattribute $P8, $P10, 'str'
    null $S3
    if_null $P8, __label_14
    set $S3, $P8
  __label_14:
.annotate 'line', 3679
# rs: $S4
    getattribute $P12, $P2, 'strval'
    getattribute $P11, $P12, 'str'
    null $S4
    if_null $P11, __label_15
    set $S4, $P11
  __label_15:
.annotate 'line', 3680
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
.annotate 'line', 3684
    .return(self)
# }
.annotate 'line', 3685

.end # optimize


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3688
    __ARG_1.'emitbinop'('iseq', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3689

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3692
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3693

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3696
    __ARG_1.'emitcompare'('eq', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3697

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3700
    __ARG_1.'emitcompare'('ne', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3701

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpEqualExpr' ]
.annotate 'line', 3646
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpNotEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3708
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3711
    new $P1, [ 'OpEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3712

.end # negated


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3715
    self.'optimizearg'()
.annotate 'line', 3716
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3717
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3718
# lnull: $I1
    $P3 = $P1.'isnull'()
    set $I1, $P3
.annotate 'line', 3719
# rnull: $I2
    $P3 = $P2.'isnull'()
    set $I2, $P3
.annotate 'line', 3720
    unless $I1 goto __label_1
# {
.annotate 'line', 3721
    unless $I2 goto __label_2
.annotate 'line', 3722
.const 'Sub' $P4 = 'WSubId_16'
    getattribute $P3, self, 'owner'
    getattribute $P5, self, 'start'
    .tailcall $P4($P3, $P5, 0)
    goto __label_3
  __label_2: # else
.annotate 'line', 3724
    new $P7, [ 'NullCheckerExpr' ]
    getattribute $P8, self, 'rexpr'
    $P7.'NullCheckerExpr'(self, $P8, 0)
    set $P6, $P7
    .return($P6)
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 3726
    unless $I2 goto __label_4
.annotate 'line', 3727
    new $P5, [ 'NullCheckerExpr' ]
    getattribute $P6, self, 'lexpr'
    $P5.'NullCheckerExpr'(self, $P6, 0)
    set $P3, $P5
    .return($P3)
  __label_4: # endif
.annotate 'line', 3728
    $I5 = $P1.'isliteral'()
    unless $I5 goto __label_6
    $I5 = $P2.'isliteral'()
  __label_6:
    unless $I5 goto __label_5
# {
.annotate 'line', 3729
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_7
    set $S1, $P3
  __label_7:
.annotate 'line', 3730
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_8
    set $S2, $P3
  __label_8:
.annotate 'line', 3731
    ne $S1, $S2, __label_9
# {
# switch
.annotate 'line', 3732
    set $S5, $S1
    set $S6, 'I'
    if $S5 == $S6 goto __label_12
    set $S6, 'S'
    if $S5 == $S6 goto __label_13
    goto __label_11
  __label_12: # case
.annotate 'line', 3734
# li: $I3
# predefined int
    getattribute $P3, $P1, 'numval'
    set $I3, $P3
.annotate 'line', 3735
# ri: $I4
# predefined int
    getattribute $P5, $P2, 'numval'
    set $I4, $P5
.annotate 'line', 3736
.const 'Sub' $P9 = 'WSubId_16'
    getattribute $P6, self, 'owner'
    getattribute $P7, self, 'start'
    isne $I5, $I3, $I4
    .tailcall $P9($P6, $P7, $I5)
  __label_13: # case
.annotate 'line', 3738
# ls: $S3
    getattribute $P10, $P1, 'strval'
    getattribute $P8, $P10, 'str'
    null $S3
    if_null $P8, __label_14
    set $S3, $P8
  __label_14:
.annotate 'line', 3739
# rs: $S4
    getattribute $P12, $P2, 'strval'
    getattribute $P11, $P12, 'str'
    null $S4
    if_null $P11, __label_15
    set $S4, $P11
  __label_15:
.annotate 'line', 3740
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
.annotate 'line', 3744
    .return(self)
# }
.annotate 'line', 3745

.end # optimize


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3748
    __ARG_1.'emitbinop'('isne', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3749

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3752
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3753

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3756
    __ARG_1.'emitcompare'('ne', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3757

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3760
    __ARG_1.'emitcompare'('eq', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3761

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpNotEqualExpr' ]
.annotate 'line', 3706
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
.annotate 'line', 3771
    self.'initbinary'(__ARG_2, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 3772
    box $P1, __ARG_1
    setattribute self, 'positive', $P1
# }
.annotate 'line', 3773

.end # OpSameExpr


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3774
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3777
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 3778
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
.annotate 'line', 3779

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 3782
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
.annotate 'line', 3783

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3786
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 3787
# op: $S1
    unless $I1 goto __label_2
    set $S1, 'issame'
    goto __label_1
  __label_2:
    set $S1, 'isntsame'
  __label_1:
.annotate 'line', 3788
    __ARG_1.'emitbinop'($S1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3789

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3792
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3793

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3796
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 3797
# op: $S1
    unless $I1 goto __label_2
    set $S1, 'eq_addr'
    goto __label_1
  __label_2:
    set $S1, 'ne_addr'
  __label_1:
.annotate 'line', 3798
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3799

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3802
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 3803
# op: $S1
    unless $I1 goto __label_2
    set $S1, 'ne_addr'
    goto __label_1
  __label_2:
    set $S1, 'eq_addr'
  __label_1:
.annotate 'line', 3804
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3805

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpSameExpr' ]
.annotate 'line', 3766
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 3768
    addattribute $P0, 'positive'
.end
.namespace [ 'OpLessExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3812
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3815
    new $P1, [ 'OpGreaterEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3816

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 3819
    islt $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 3820

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3823
    __ARG_1.'emitbinop'('islt', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3824

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3827
    __ARG_1.'emitcompare'('lt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3828

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3831
    __ARG_1.'emitcompare'('ge', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3832

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpLessExpr' ]
.annotate 'line', 3810
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpGreaterExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3839
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3842
    new $P1, [ 'OpLessEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3843

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 3846
    isgt $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 3847

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3850
    __ARG_1.'emitbinop'('isgt', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3851

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3854
    __ARG_1.'emitcompare'('gt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3855

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3858
    __ARG_1.'emitcompare'('le', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3859

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpGreaterExpr' ]
.annotate 'line', 3837
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpLessEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3866
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3869
    new $P1, [ 'OpGreaterExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3870

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 3873
    isle $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 3874

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3877
    __ARG_1.'emitbinop'('isle', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3878

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3881
    __ARG_1.'emitcompare'('le', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3882

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3885
    __ARG_1.'emitcompare'('gt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3886

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpLessEqualExpr' ]
.annotate 'line', 3864
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpGreaterEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3893
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3896
    new $P1, [ 'OpLessExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3897

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 3900
    isge $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 3901

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3904
    __ARG_1.'emitbinop'('isge', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3905

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3908
    __ARG_1.'emitcompare'('ge', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3909

.end # emitop_if


.sub 'emitop_else' :method
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

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpGreaterEqualExpr' ]
.annotate 'line', 3891
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpBaseBoolExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3922
    .return('I')
# }
.annotate 'line', 3923

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBaseBoolExpr' ]
.annotate 'line', 3918
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
.annotate 'line', 3932
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3933

.end # OpBoolAndExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3936
    self.'optimizearg'()
.annotate 'line', 3937
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 3938
# var lval: $P1
    getattribute $P4, self, 'lexpr'
    getattribute $P1, $P4, 'numval'
.annotate 'line', 3939
# ln: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 3940
    eq $I1, 0, __label_2
.annotate 'line', 3941
    getattribute $P2, self, 'rexpr'
    .return($P2)
    goto __label_3
  __label_2: # else
.annotate 'line', 3943
.const 'Sub' $P5 = 'WSubId_16'
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall $P5($P3, $P4, $I1)
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 3945
    .return(self)
# }
.annotate 'line', 3946

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3949
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
.annotate 'line', 3950
    getattribute $P1, self, 'lexpr'
    $I1 = $P1.'issimple'()
    unless $I1 goto __label_6
    getattribute $P2, self, 'rexpr'
    $I1 = $P2.'issimple'()
  __label_6:
    unless $I1 goto __label_4
# {
.annotate 'line', 3951
# lreg: $S2
    $P3 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P3, __label_7
    set $S2, $P3
  __label_7:
.annotate 'line', 3952
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_8
    set $S3, $P1
  __label_8:
.annotate 'line', 3953
    __ARG_1.'emitbinop'('and', $S1, $S2, $S3)
# }
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 3956
# l: $S4
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S4
    if_null $P1, __label_9
    set $S4, $P1
  __label_9:
.annotate 'line', 3957
    getattribute $P1, self, 'lexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 3958
    __ARG_1.'emitunless'($S1, $S4)
.annotate 'line', 3959
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 3960
    __ARG_1.'emitlabel'($S4)
# }
  __label_5: # endif
# }
.annotate 'line', 3962

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBoolAndExpr' ]
.annotate 'line', 3928
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
.annotate 'line', 3971
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3972

.end # OpBoolOrExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3975
    self.'optimizearg'()
.annotate 'line', 3976
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 3977
# var lval: $P1
    getattribute $P4, self, 'lexpr'
    getattribute $P1, $P4, 'numval'
.annotate 'line', 3978
# ln: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 3979
    ne $I1, 0, __label_2
.annotate 'line', 3980
    getattribute $P2, self, 'rexpr'
    .return($P2)
    goto __label_3
  __label_2: # else
.annotate 'line', 3982
.const 'Sub' $P5 = 'WSubId_16'
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall $P5($P3, $P4, $I1)
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 3984
    .return(self)
# }
.annotate 'line', 3985

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3988
# res: $S1
    null $S1
.annotate 'line', 3989
    if_null __ARG_2, __label_1
.annotate 'line', 3990
    set $S1, __ARG_2
    goto __label_2
  __label_1: # else
.annotate 'line', 3992
    $P1 = self.'tempreg'('I')
    set $S1, $P1
  __label_2: # endif
.annotate 'line', 3993
    getattribute $P1, self, 'lexpr'
    $I1 = $P1.'issimple'()
    unless $I1 goto __label_5
    getattribute $P2, self, 'rexpr'
    $I1 = $P2.'issimple'()
  __label_5:
    unless $I1 goto __label_3
# {
.annotate 'line', 3994
# lreg: $S2
    $P3 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P3, __label_6
    set $S2, $P3
  __label_6:
.annotate 'line', 3995
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_7
    set $S3, $P1
  __label_7:
.annotate 'line', 3996
    __ARG_1.'emitbinop'('or', $S1, $S2, $S3)
# }
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 3999
# l: $S4
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S4
    if_null $P1, __label_8
    set $S4, $P1
  __label_8:
.annotate 'line', 4000
    getattribute $P1, self, 'lexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4001
    __ARG_1.'emitif'($S1, $S4)
.annotate 'line', 4002
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4003
    __ARG_1.'emitlabel'($S4)
# }
  __label_4: # endif
# }
.annotate 'line', 4005

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBoolOrExpr' ]
.annotate 'line', 3967
    get_class $P1, [ 'OpBaseBoolExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpBaseBinExpr' ]
.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBaseBinExpr' ]
.annotate 'line', 4010
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
.annotate 'line', 4020
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4021

.end # OpBinAndExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4024
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
.annotate 'line', 4025
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4026
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4027
    self.'annotate'(__ARG_1)
.annotate 'line', 4028
    __ARG_1.'emitbinop'('band', $S1, $S2, $S3)
# }
.annotate 'line', 4029

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4032
    band $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4033

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBinAndExpr' ]
.annotate 'line', 4016
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
.annotate 'line', 4042
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4043

.end # OpBinOrExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4046
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
.annotate 'line', 4047
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4048
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4049
    self.'annotate'(__ARG_1)
.annotate 'line', 4050
    __ARG_1.'emitbinop'('bor', $S1, $S2, $S3)
# }
.annotate 'line', 4051

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4054
    bor $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4055

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBinOrExpr' ]
.annotate 'line', 4038
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
.annotate 'line', 4064
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4065

.end # OpBinXorExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4068
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
.annotate 'line', 4069
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4070
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4071
    self.'annotate'(__ARG_1)
.annotate 'line', 4072
    __ARG_1.'emitbinop'('bxor', $S1, $S2, $S3)
# }
.annotate 'line', 4073

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4076
    bxor $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4077

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBinXorExpr' ]
.annotate 'line', 4060
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
.annotate 'line', 4087
    self.'Expr'(__ARG_1, __ARG_2)
# switch-case
.annotate 'line', 4089
    isa $I1, __ARG_3, [ 'ConcatString' ]
    if $I1 goto __label_3
.annotate 'line', 4096
    isa $I1, __ARG_4, [ 'ConcatString' ]
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 4090
    getattribute $P2, __ARG_3, 'values'
    setattribute self, 'values', $P2
.annotate 'line', 4091
    isa $I2, __ARG_4, [ 'ConcatString' ]
    unless $I2 goto __label_5
.annotate 'line', 4092
    getattribute $P3, self, 'values'
    getattribute $P4, __ARG_4, 'values'
    $P3.'append'($P4)
    goto __label_6
  __label_5: # else
.annotate 'line', 4094
    getattribute $P5, self, 'values'
# predefined push
    push $P5, __ARG_4
  __label_6: # endif
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 4097
    getattribute $P7, __ARG_4, 'values'
    setattribute self, 'values', $P7
.annotate 'line', 4098
    getattribute $P8, self, 'values'
    $P8.'unshift'(__ARG_3)
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 4101
    root_new $P10, ['parrot';'ResizablePMCArray']
    push $P10, __ARG_3
    push $P10, __ARG_4
    setattribute self, 'values', $P10
  __label_1: # switch end
# }
.annotate 'line', 4103

.end # ConcatString


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4104
    .return('S')
# }

.end # checkresult


.sub 'getregs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4107
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 4108
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4109
    new $P2, ['FixedStringArray'], $I1
.annotate 'line', 4110
# i: $I2
    null $I2
# for loop
.annotate 'line', 4111
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 4112
# predefined string
    $P4 = $P1[$I2]
    $P3 = $P4.'emit_get'(__ARG_1)
    set $S1, $P3
    $P2[$I2] = $S1
  __label_1: # for iteration
.annotate 'line', 4111
    inc $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 4113
    .return($P2)
# }
.annotate 'line', 4114

.end # getregs


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4117
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4118
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4119
# auxreg: $S1
    set $S1, '$S0'
.annotate 'line', 4120
    self.'annotate'(__ARG_1)
.annotate 'line', 4121
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 4122
# i: $I2
    set $I2, 2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 4123
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'($S1, $P2)
  __label_1: # for iteration
.annotate 'line', 4122
    inc $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 4124
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
.annotate 'line', 4125

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4128
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4129
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4130
# auxreg: $S1
    $P2 = self.'tempreg'('S')
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4131
    self.'annotate'(__ARG_1)
.annotate 'line', 4132
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 4133
# i: $I2
    set $I2, 2
  __label_4: # for condition
    ge $I2, $I1, __label_3
.annotate 'line', 4134
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'($S1, $P2)
  __label_2: # for iteration
.annotate 'line', 4133
    inc $I2
    goto __label_4
  __label_3: # for end
.annotate 'line', 4135
    .return($S1)
# }
.annotate 'line', 4136

.end # emit_get


.sub 'emit_concat_to' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4139
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4140
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4141
    self.'annotate'(__ARG_1)
# for loop
.annotate 'line', 4142
# i: $I2
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 4143
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'(__ARG_2, $P2)
  __label_1: # for iteration
.annotate 'line', 4142
    inc $I2
    goto __label_3
  __label_2: # for end
# }
.annotate 'line', 4144

.end # emit_concat_to


.sub 'emit_concat_set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4147
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4148
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4149
    self.'annotate'(__ARG_1)
.annotate 'line', 4150
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'(__ARG_2, $P2, $P3)
# for loop
.annotate 'line', 4151
# i: $I2
    set $I2, 2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 4152
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'(__ARG_2, $P2)
  __label_1: # for iteration
.annotate 'line', 4151
    inc $I2
    goto __label_3
  __label_2: # for end
# }
.annotate 'line', 4153

.end # emit_concat_set

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ConcatString' ]
.annotate 'line', 4082
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 4084
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
.annotate 'line', 4162
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4163

.end # OpAddExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4166
    self.'optimizearg'()
.annotate 'line', 4167
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4168
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4169
# ltype: $S1
    $P10 = $P1.'checkresult'()
    null $S1
    if_null $P10, __label_1
    set $S1, $P10
  __label_1:
.annotate 'line', 4170
# rtype: $S2
    $P10 = $P2.'checkresult'()
    null $S2
    if_null $P10, __label_2
    set $S2, $P10
  __label_2:
.annotate 'line', 4171
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_4
    $I3 = $P2.'isliteral'()
  __label_4:
    unless $I3 goto __label_3
# {
.annotate 'line', 4172
    iseq $I4, $S1, 'S'
    unless $I4 goto __label_6
    iseq $I4, $S2, 'S'
  __label_6:
    unless $I4 goto __label_5
# {
.annotate 'line', 4177
# var etok: $P3
    getattribute $P3, $P1, 'strval'
.annotate 'line', 4178
# var rtok: $P4
    getattribute $P4, $P2, 'strval'
.annotate 'line', 4179
# var t: $P5
    isa $I3, $P3, [ 'TokenSingleQuoted' ]
    unless $I3 goto __label_9
.annotate 'line', 4180
    isa $I3, $P4, [ 'TokenSingleQuoted' ]
  __label_9:
    unless $I3 goto __label_8
.annotate 'line', 4182
    new $P10, [ 'TokenSingleQuoted' ]
    getattribute $P11, $P3, 'file'
    getattribute $P12, $P3, 'line'
# predefined string
.annotate 'line', 4183
    getattribute $P13, $P3, 'str'
.annotate 'line', 4179
    set $S3, $P13
# predefined string
.annotate 'line', 4183
    getattribute $P14, $P4, 'str'
.annotate 'line', 4179
    set $S4, $P14
.annotate 'line', 4183
    concat $S5, $S3, $S4
    $P10.'TokenSingleQuoted'($P11, $P12, $S5)
    set $P5, $P10
    goto __label_7
  __label_8:
.annotate 'line', 4185
    new $P15, [ 'TokenQuoted' ]
    getattribute $P16, $P3, 'file'
    getattribute $P17, $P3, 'line'
# predefined string
.annotate 'line', 4186
    $P18 = $P3.'getasquoted'()
.annotate 'line', 4179
    set $S6, $P18
# predefined string
.annotate 'line', 4186
    $P19 = $P4.'getasquoted'()
.annotate 'line', 4179
    set $S7, $P19
.annotate 'line', 4186
    concat $S8, $S6, $S7
    $P15.'TokenQuoted'($P16, $P17, $S8)
    set $P5, $P15
  __label_7:
.annotate 'line', 4187
    new $P11, [ 'StringLiteral' ]
    getattribute $P12, self, 'owner'
    $P11.'StringLiteral'($P12, $P5)
    set $P10, $P11
    .return($P10)
# }
  __label_5: # endif
.annotate 'line', 4189
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_11
    iseq $I3, $S2, 'I'
  __label_11:
    unless $I3 goto __label_10
# {
.annotate 'line', 4190
# var lval: $P6
    getattribute $P6, $P1, 'numval'
.annotate 'line', 4191
# ln: $I1
    set $P10, $P6
    set $I1, $P10
.annotate 'line', 4192
# var rval: $P7
    getattribute $P7, $P2, 'numval'
.annotate 'line', 4193
# rn: $I2
    set $P10, $P7
    set $I2, $P10
.annotate 'line', 4194
.const 'Sub' $P20 = 'WSubId_16'
    getattribute $P10, self, 'owner'
    getattribute $P11, self, 'start'
    add $I3, $I1, $I2
    .tailcall $P20($P10, $P11, $I3)
# }
  __label_10: # endif
# {
.annotate 'line', 4197
.const 'Sub' $P21 = 'WSubId_50'
    $P10 = $P21($S1, $S2)
    if_null $P10, __label_12
    unless $P10 goto __label_12
# {
.annotate 'line', 4198
# var lvalf: $P8
    getattribute $P8, $P1, 'numval'
.annotate 'line', 4199
# lf: $N1
# predefined string
    set $S3, $P8
    set $N1, $S3
.annotate 'line', 4200
# var rvalf: $P9
    getattribute $P9, $P2, 'numval'
.annotate 'line', 4201
# rf: $N2
# predefined string
    set $S3, $P9
    set $N2, $S3
.annotate 'line', 4202
.const 'Sub' $P22 = 'WSubId_49'
    getattribute $P10, self, 'owner'
    getattribute $P11, self, 'start'
    add $N3, $N1, $N2
    .tailcall $P22($P10, $P11, $N3)
# }
  __label_12: # endif
# }
# }
  __label_3: # endif
.annotate 'line', 4206
    iseq $I3, $S1, 'S'
    unless $I3 goto __label_14
    iseq $I3, $S2, 'S'
  __label_14:
    unless $I3 goto __label_13
# {
.annotate 'line', 4207
    new $P11, [ 'ConcatString' ]
    getattribute $P12, self, 'owner'
    getattribute $P13, self, 'start'
    $P11.'ConcatString'($P12, $P13, $P1, $P2)
    set $P10, $P11
    .return($P10)
# }
  __label_13: # endif
.annotate 'line', 4209
    .return(self)
# }
.annotate 'line', 4210

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4213
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4214
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4215
    ne $S1, $S2, __label_3
.annotate 'line', 4216
    .return($S1)
  __label_3: # endif
.annotate 'line', 4217
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_5
    iseq $I1, $S2, 'S'
  __label_5:
    unless $I1 goto __label_4
.annotate 'line', 4218
    .return('S')
  __label_4: # endif
.annotate 'line', 4219
    iseq $I1, $S1, 'S'
    unless $I1 goto __label_7
    iseq $I1, $S2, 'I'
  __label_7:
    unless $I1 goto __label_6
.annotate 'line', 4220
    .return('S')
  __label_6: # endif
.annotate 'line', 4221
.const 'Sub' $P3 = 'WSubId_50'
    $P1 = $P3($S1, $S2)
    if_null $P1, __label_8
    unless $P1 goto __label_8
.annotate 'line', 4222
    .return('N')
  __label_8: # endif
.annotate 'line', 4223
    .return('I')
# }
.annotate 'line', 4224

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4227
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4228
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4229
# restype: $S1
    $P3 = self.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4230
# ltype: $S2
    $P3 = $P1.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 4231
# rtype: $S3
    $P3 = $P2.'checkresult'()
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 4233
# rleft: $S4
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_4
    set $S4, $P3
  __label_4:
.annotate 'line', 4234
# rright: $S5
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S5
    if_null $P3, __label_5
    set $S5, $P3
  __label_5:
.annotate 'line', 4235
    ne $S1, 'S', __label_6
# {
.annotate 'line', 4236
    isne $I1, $S2, 'S'
    if $I1 goto __label_9
    isne $I1, $S3, 'S'
  __label_9:
    unless $I1 goto __label_8
# {
.annotate 'line', 4237
# aux: $S6
    $P3 = self.'tempreg'('S')
    null $S6
    if_null $P3, __label_10
    set $S6, $P3
  __label_10:
.annotate 'line', 4238
    eq $S2, 'S', __label_11
# {
.annotate 'line', 4239
    __ARG_1.'emitset'($S6, $S4)
.annotate 'line', 4240
    set $S4, $S6
# }
    goto __label_12
  __label_11: # else
# {
.annotate 'line', 4243
    __ARG_1.'emitset'($S6, $S5)
.annotate 'line', 4244
    set $S5, $S6
# }
  __label_12: # endif
# }
  __label_8: # endif
.annotate 'line', 4247
    __ARG_1.'emitconcat'(__ARG_2, $S4, $S5)
# }
    goto __label_7
  __label_6: # else
# {
.annotate 'line', 4250
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_15
    isne $I1, $S2, 'I'
    if $I1 goto __label_16
    isne $I1, $S3, 'I'
  __label_16:
  __label_15:
    unless $I1 goto __label_13
# {
.annotate 'line', 4251
# l: $S7
    null $S7
.annotate 'line', 4252
    ne $S2, 'I', __label_17
    set $S7, $S4
    goto __label_18
  __label_17: # else
# {
.annotate 'line', 4254
    $P3 = self.'tempreg'('I')
    set $S7, $P3
.annotate 'line', 4255
    __ARG_1.'emitset'($S7, $S4)
# }
  __label_18: # endif
.annotate 'line', 4257
# r: $S8
    null $S8
.annotate 'line', 4258
    ne $S3, 'I', __label_19
    set $S8, $S5
    goto __label_20
  __label_19: # else
# {
.annotate 'line', 4260
    $P3 = self.'tempreg'('I')
    set $S8, $P3
.annotate 'line', 4261
    __ARG_1.'emitset'($S8, $S5)
# }
  __label_20: # endif
.annotate 'line', 4263
    __ARG_1.'emitadd'(__ARG_2, $S7, $S8)
# }
    goto __label_14
  __label_13: # else
.annotate 'line', 4266
    __ARG_1.'emitadd'(__ARG_2, $S4, $S5)
  __label_14: # endif
# }
  __label_7: # endif
# }
.annotate 'line', 4268

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpAddExpr' ]
.annotate 'line', 4158
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
.annotate 'line', 4277
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4278

.end # OpSubExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4281
    self.'optimizearg'()
.annotate 'line', 4282
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4283
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4284
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 4285
# ltype: $S1
    $P5 = $P1.'checkresult'()
    null $S1
    if_null $P5, __label_3
    set $S1, $P5
  __label_3:
.annotate 'line', 4286
# rtype: $S2
    $P5 = $P2.'checkresult'()
    null $S2
    if_null $P5, __label_4
    set $S2, $P5
  __label_4:
.annotate 'line', 4287
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_6
    iseq $I3, $S2, 'I'
  __label_6:
    unless $I3 goto __label_5
# {
.annotate 'line', 4288
# var lval: $P3
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4289
# ln: $I1
    set $P5, $P3
    set $I1, $P5
.annotate 'line', 4290
# var rval: $P4
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4291
# rn: $I2
    set $P5, $P4
    set $I2, $P5
.annotate 'line', 4292
.const 'Sub' $P6 = 'WSubId_16'
    getattribute $P5, self, 'owner'
    getattribute $P7, self, 'start'
    sub $I3, $I1, $I2
    .tailcall $P6($P5, $P7, $I3)
# }
  __label_5: # endif
# }
  __label_1: # endif
.annotate 'line', 4295
    .return(self)
# }
.annotate 'line', 4296

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4299
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4300
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4301
    ne $S1, $S2, __label_3
.annotate 'line', 4302
    .return($S1)
  __label_3: # endif
.annotate 'line', 4303
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_5
    iseq $I1, $S2, 'N'
  __label_5:
    unless $I1 goto __label_4
.annotate 'line', 4304
    .return('N')
  __label_4: # endif
.annotate 'line', 4305
    iseq $I1, $S1, 'N'
    unless $I1 goto __label_7
    iseq $I1, $S2, 'I'
  __label_7:
    unless $I1 goto __label_6
.annotate 'line', 4306
    .return('N')
  __label_6: # endif
.annotate 'line', 4307
    .return('I')
# }
.annotate 'line', 4308

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4311
# lreg: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4312
# rreg: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4313
    __ARG_1.'emitsub'(__ARG_2, $S1, $S2)
# }
.annotate 'line', 4314

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpSubExpr' ]
.annotate 'line', 4273
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
.annotate 'line', 4323
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4324

.end # OpMulExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4327
    self.'optimizearg'()
.annotate 'line', 4328
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4329
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4330
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 4331
# ltype: $S1
    $P7 = $P1.'checkresult'()
    null $S1
    if_null $P7, __label_3
    set $S1, $P7
  __label_3:
.annotate 'line', 4332
# rtype: $S2
    $P7 = $P2.'checkresult'()
    null $S2
    if_null $P7, __label_4
    set $S2, $P7
  __label_4:
.annotate 'line', 4333
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_6
    iseq $I3, $S2, 'I'
  __label_6:
    unless $I3 goto __label_5
# {
.annotate 'line', 4334
# var lval: $P3
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4335
# ln: $I1
    set $P7, $P3
    set $I1, $P7
.annotate 'line', 4336
# var rval: $P4
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4337
# rn: $I2
    set $P7, $P4
    set $I2, $P7
.annotate 'line', 4338
.const 'Sub' $P8 = 'WSubId_16'
    getattribute $P7, self, 'owner'
    getattribute $P9, self, 'start'
    mul $I3, $I1, $I2
    .tailcall $P8($P7, $P9, $I3)
# }
  __label_5: # endif
# {
.annotate 'line', 4341
.const 'Sub' $P10 = 'WSubId_50'
    $P7 = $P10($S1, $S2)
    if_null $P7, __label_7
    unless $P7 goto __label_7
# {
.annotate 'line', 4342
# var lvalf: $P5
    getattribute $P5, $P1, 'numval'
.annotate 'line', 4343
# lf: $N1
# predefined string
    set $S3, $P5
    set $N1, $S3
.annotate 'line', 4344
# var rvalf: $P6
    getattribute $P6, $P2, 'numval'
.annotate 'line', 4345
# rf: $N2
# predefined string
    set $S3, $P6
    set $N2, $S3
.annotate 'line', 4346
.const 'Sub' $P11 = 'WSubId_49'
    getattribute $P7, self, 'owner'
    getattribute $P9, self, 'start'
    mul $N3, $N1, $N2
    .tailcall $P11($P7, $P9, $N3)
# }
  __label_7: # endif
# }
# }
  __label_1: # endif
.annotate 'line', 4350
    .return(self)
# }
.annotate 'line', 4351

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4354
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4355
# rl: $S1
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'checkresult'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4356
# rr: $S2
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'checkresult'()
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 4357
    ne $S1, $S2, __label_3
.annotate 'line', 4358
    .return($S1)
  __label_3: # endif
.annotate 'line', 4359
    ne $S1, 'S', __label_4
.annotate 'line', 4360
    .return('S')
    goto __label_5
  __label_4: # else
.annotate 'line', 4362
    .return('N')
  __label_5: # endif
# }
.annotate 'line', 4363

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4366
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4367
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4368
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4369
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 4370
# lreg: $S3
    null $S3
# rreg: $S4
    null $S4
.annotate 'line', 4371
    ne $S1, 'S', __label_3
# {
.annotate 'line', 4372
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 4373
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 4374
# rval: $S5
    null $S5
# switch
.annotate 'line', 4375
    set $S7, $S2
    set $S8, 'I'
    if $S7 == $S8 goto __label_6
    goto __label_5
  __label_6: # case
.annotate 'line', 4377
    set $S5, $S4
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 4380
    $P3 = self.'tempreg'('I')
    set $S5, $P3
.annotate 'line', 4381
    __ARG_1.'emitset'($S5, $S4)
  __label_4: # switch end
.annotate 'line', 4383
    self.'annotate'(__ARG_1)
.annotate 'line', 4384
    __ARG_1.'emitrepeat'(__ARG_2, $S3, $S5)
.annotate 'line', 4385
    .return()
# }
  __label_3: # endif
.annotate 'line', 4387
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
.annotate 'line', 4388
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 4389
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 4390
    __ARG_1.'emitmul'(__ARG_2, $S3, $S4)
.annotate 'line', 4391
    .return()
# }
  __label_7: # endif
.annotate 'line', 4396
    ne $S1, 'N', __label_11
# {
.annotate 'line', 4397
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 4398
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 4399
# rval: $S6
    null $S6
# switch
.annotate 'line', 4400
    set $S7, $S2
    set $S8, 'I'
    if $S7 == $S8 goto __label_14
    set $S8, 'N'
    if $S7 == $S8 goto __label_15
    goto __label_13
  __label_14: # case
.annotate 'line', 4402
    $P3 = self.'tempreg'('N')
    set $S6, $P3
.annotate 'line', 4403
    __ARG_1.'emitset'($S6, $S4)
.annotate 'line', 4404
    set $S6, $S4
    goto __label_12 # break
  __label_15: # case
.annotate 'line', 4407
    set $S6, $S4
    goto __label_12 # break
  __label_13: # default
.annotate 'line', 4410
    $P4 = self.'tempreg'('N')
    set $S6, $P4
.annotate 'line', 4411
    __ARG_1.'emitset'($S6, $S4)
  __label_12: # switch end
.annotate 'line', 4413
    set $S7, __ARG_2
    eq $S7, '', __label_16
# {
.annotate 'line', 4414
    self.'annotate'(__ARG_1)
.annotate 'line', 4415
    __ARG_1.'emitmul'(__ARG_2, $S3, $S6)
# }
  __label_16: # endif
.annotate 'line', 4417
    .return()
# }
  __label_11: # endif
.annotate 'line', 4420
# nleft: $I1
    null $I1
# nright: $I2
    null $I2
.annotate 'line', 4421
    $P3 = $P1.'issimple'()
    isfalse $I3, $P3
    if $I3 goto __label_19
    $I3 = $P1.'isidentifier'()
  __label_19:
    unless $I3 goto __label_17
# {
.annotate 'line', 4422
    $P5 = self.'checkresult'()
    $P4 = self.'tempreg'($P5)
    set $S3, $P4
.annotate 'line', 4423
    $P1.'emit'(__ARG_1, $S3)
# }
    goto __label_18
  __label_17: # else
# {
.annotate 'line', 4426
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4427
    set $S3, $I1
# }
  __label_18: # endif
.annotate 'line', 4429
    $P3 = $P2.'issimple'()
    isfalse $I3, $P3
    if $I3 goto __label_22
    $I3 = $P2.'isidentifier'()
  __label_22:
    unless $I3 goto __label_20
# {
.annotate 'line', 4430
    $P5 = self.'checkresult'()
    $P4 = self.'tempreg'($P5)
    set $S4, $P4
.annotate 'line', 4431
    $P2.'emit'(__ARG_1, $S4)
# }
    goto __label_21
  __label_20: # else
# {
# switch
.annotate 'line', 4434
    set $S7, $S2
    set $S8, 'S'
    if $S7 == $S8 goto __label_25
    set $S8, 'N'
    if $S7 == $S8 goto __label_26
    set $S8, 'I'
    if $S7 == $S8 goto __label_27
    goto __label_24
  __label_25: # case
.annotate 'line', 4436
    $P4 = self.'checkresult'()
    $P3 = self.'tempreg'($P4)
    set $S4, $P3
.annotate 'line', 4437
    $P2.'emit'(__ARG_1, $S4)
    goto __label_23 # break
  __label_26: # case
.annotate 'line', 4440
    $P5 = $P2.'emit_get'(__ARG_1)
    set $S4, $P5
    goto __label_23 # break
  __label_27: # case
  __label_24: # default
.annotate 'line', 4444
    $P6 = $P2.'getIntegerValue'()
    set $I2, $P6
.annotate 'line', 4445
    set $S4, $I2
    goto __label_23 # break
  __label_23: # switch end
.annotate 'line', 4446
# }
  __label_21: # endif
.annotate 'line', 4449
    self.'annotate'(__ARG_1)
.annotate 'line', 4450
    set $S7, __ARG_2
    ne $S7, '', __label_28
.annotate 'line', 4451
    $P3 = self.'checkresult'()
    __ARG_2 = self.'tempreg'($P3)
  __label_28: # endif
.annotate 'line', 4452
    __ARG_1.'emitmul'(__ARG_2, $S3, $S4)
# }
.annotate 'line', 4453

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpMulExpr' ]
.annotate 'line', 4319
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
.annotate 'line', 4462
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4463

.end # OpDivExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4466
    self.'optimizearg'()
.annotate 'line', 4467
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4468
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4469
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 4470
# ltype: $S1
    $P5 = $P1.'checkresult'()
    null $S1
    if_null $P5, __label_3
    set $S1, $P5
  __label_3:
.annotate 'line', 4471
# rtype: $S2
    $P5 = $P2.'checkresult'()
    null $S2
    if_null $P5, __label_4
    set $S2, $P5
  __label_4:
.annotate 'line', 4472
# var lval: $P3
    null $P3
.annotate 'line', 4473
# var rval: $P4
    null $P4
.annotate 'line', 4474
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_6
    iseq $I3, $S2, 'I'
  __label_6:
    unless $I3 goto __label_5
# {
.annotate 'line', 4475
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4476
# ln: $I1
    set $P5, $P3
    set $I1, $P5
.annotate 'line', 4477
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4478
# rn: $I2
    set $P5, $P4
    set $I2, $P5
.annotate 'line', 4479
    eq $I2, 0, __label_7
.annotate 'line', 4480
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
.annotate 'line', 4483
.const 'Sub' $P8 = 'WSubId_50'
    $P5 = $P8($S1, $S2)
    if_null $P5, __label_8
    unless $P5 goto __label_8
# {
.annotate 'line', 4484
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4485
# lf: $N1
# predefined string
    set $S3, $P3
    set $N1, $S3
.annotate 'line', 4486
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4487
# rf: $N2
# predefined string
    set $S3, $P4
    set $N2, $S3
.annotate 'line', 4488
    set $N3, 0
    eq $N2, $N3, __label_9
.annotate 'line', 4489
.const 'Sub' $P9 = 'WSubId_49'
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
.annotate 'line', 4493
    .return(self)
# }
.annotate 'line', 4494

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4497
    .return('N')
# }
.annotate 'line', 4498

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4501
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4502
# var aux: $P2
    null $P2
.annotate 'line', 4503
# var lreg: $P3
    $P3 = $P1.'emit_get'(__ARG_1)
.annotate 'line', 4504
    $P6 = $P1.'checkresult'()
    set $S1, $P6
    eq $S1, 'N', __label_1
# {
.annotate 'line', 4505
    $P2 = self.'tempreg'('N')
.annotate 'line', 4506
    __ARG_1.'emitset'($P2, $P3)
.annotate 'line', 4507
    set $P3, $P2
# }
  __label_1: # endif
.annotate 'line', 4509
# var rexpr: $P4
    getattribute $P4, self, 'rexpr'
.annotate 'line', 4510
# var rreg: $P5
    $P5 = $P4.'emit_get'(__ARG_1)
.annotate 'line', 4511
    $P6 = $P4.'checkresult'()
    set $S1, $P6
    eq $S1, 'N', __label_2
# {
.annotate 'line', 4512
    $P2 = self.'tempreg'('N')
.annotate 'line', 4513
    __ARG_1.'emitset'($P2, $P5)
.annotate 'line', 4514
    set $P5, $P2
# }
  __label_2: # endif
.annotate 'line', 4516
    self.'annotate'(__ARG_1)
.annotate 'line', 4517
    __ARG_1.'emitdiv'(__ARG_2, $P3, $P5)
# }
.annotate 'line', 4518

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpDivExpr' ]
.annotate 'line', 4458
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
.annotate 'line', 4527
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4528

.end # OpModExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4531
# lreg: $S1
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4532
# rreg: $S2
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4533
    self.'annotate'(__ARG_1)
.annotate 'line', 4534
    __ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
# }
.annotate 'line', 4535

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4538
    mod $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4539

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpModExpr' ]
.annotate 'line', 4523
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
.annotate 'line', 4548
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4549

.end # OpCModExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4552
    .return('I')
# }
.annotate 'line', 4553

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4556
# lreg: $S1
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4557
# rreg: $S2
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4558
    self.'annotate'(__ARG_1)
.annotate 'line', 4563
    __ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
# }
.annotate 'line', 4564

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpCModExpr' ]
.annotate 'line', 4544
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
.annotate 'line', 4573
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4574

.end # OpShiftleftExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4577
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
.annotate 'line', 4578
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4579
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4580
    self.'annotate'(__ARG_1)
.annotate 'line', 4581
    __ARG_1.'emitbinop'('shl', $S1, $S2, $S3)
# }
.annotate 'line', 4582

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4585
    shl $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4586

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpShiftleftExpr' ]
.annotate 'line', 4569
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
.annotate 'line', 4595
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4596

.end # OpShiftrightExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4599
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
.annotate 'line', 4600
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4601
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4602
    self.'annotate'(__ARG_1)
.annotate 'line', 4603
    __ARG_1.'emitbinop'('shr', $S1, $S2, $S3)
# }
.annotate 'line', 4604

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4607
    shr $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4608

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpShiftrightExpr' ]
.annotate 'line', 4591
    get_class $P1, [ 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'ArgumentModifierList' ]

.sub 'ArgumentModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4617
    self.'ModifierList'(__ARG_1, __ARG_2)
# }
.annotate 'line', 4618

.end # ArgumentModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4621
# isflat: $I1
    null $I1
# isnamed: $I2
    null $I2
.annotate 'line', 4622
# setname: $S1
    set $S1, ''
.annotate 'line', 4623
    $P3 = self.'getlist'()
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
# {
# switch
.annotate 'line', 4624
    $P5 = $P1.'getname'()
    set $S2, $P5
    set $S3, 'flat'
    if $S2 == $S3 goto __label_5
    set $S3, 'named'
    if $S2 == $S3 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 4626
    set $I1, 1
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 4629
    set $I2, 1
# switch
.annotate 'line', 4630
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
.annotate 'line', 4634
# var argmod: $P2
    $P2 = $P1.'getarg'(0)
.annotate 'line', 4635
    $P7 = $P2.'isstringliteral'()
    isfalse $I5, $P7
    unless $I5 goto __label_11
.const 'Sub' $P8 = 'WSubId_1'
.annotate 'line', 4636
    getattribute $P9, self, 'start'
    $P8('Invalid modifier', $P9)
  __label_11: # endif
.annotate 'line', 4637
    $P10 = $P2.'getPirString'()
    set $S1, $P10
    goto __label_7 # break
  __label_8: # default
.annotate 'line', 4638
.const 'Sub' $P11 = 'WSubId_1'
.annotate 'line', 4640
    getattribute $P12, self, 'start'
    $P11('Invalid modifier', $P12)
  __label_7: # switch end
  __label_4: # default
  __label_3: # switch end
# }
    goto __label_1
  __label_2: # endfor
# switch-case
.annotate 'line', 4645
    and $I3, $I1, $I2
    if $I3 goto __label_14
.annotate 'line', 4648
    set $I3, $I1
    if $I3 goto __label_15
.annotate 'line', 4651
    set $I3, $I2
    if $I3 goto __label_16
    goto __label_13
  __label_14: # case
.annotate 'line', 4646
    __ARG_1.'print'(' :flat :named')
    goto __label_12 # break
  __label_15: # case
.annotate 'line', 4649
    __ARG_1.'print'(' :flat')
    goto __label_12 # break
  __label_16: # case
.annotate 'line', 4652
    __ARG_1.'print'(' :named')
.annotate 'line', 4653
    eq $S1, '', __label_17
.annotate 'line', 4654
    __ARG_1.'print'("(", $S1, ")")
  __label_17: # endif
    goto __label_12 # break
  __label_13: # default
  __label_12: # switch end
.annotate 'line', 4655
# }
.annotate 'line', 4657

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ArgumentModifierList' ]
.annotate 'line', 4613
    get_class $P1, [ 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'Argument' ]

.sub 'Argument' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4666
    setattribute self, 'arg', __ARG_1
.annotate 'line', 4667
    setattribute self, 'modifiers', __ARG_2
# }
.annotate 'line', 4668

.end # Argument


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4671
    getattribute $P3, self, 'arg'
    $P2 = $P3.'optimize'()
    setattribute self, 'arg', $P2
.annotate 'line', 4672
    .return(self)
# }
.annotate 'line', 4673

.end # optimize


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 4676
    getattribute $P1, self, 'arg'
    .tailcall $P1.'hascompilevalue'()
# }
.annotate 'line', 4677

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Argument' ]
.annotate 'line', 4662
    addattribute $P0, 'arg'
.annotate 'line', 4663
    addattribute $P0, 'modifiers'
.end
.namespace [ ]

.sub 'parseArgument'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4682
# var modifier: $P1
    null $P1
.annotate 'line', 4683
# var expr: $P2
.const 'Sub' $P4 = 'WSubId_30'
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 4684
# var t: $P3
    $P3 = __ARG_1.'get'()
.annotate 'line', 4685
    $P5 = $P3.'isop'(':')
    if_null $P5, __label_1
    unless $P5 goto __label_1
# {
.annotate 'line', 4686
    $P3 = __ARG_1.'get'()
.annotate 'line', 4687
    $P5 = $P3.'isop'('[')
    if_null $P5, __label_3
    unless $P5 goto __label_3
# {
.annotate 'line', 4688
    new $P6, [ 'ArgumentModifierList' ]
    $P6.'ArgumentModifierList'(__ARG_1, __ARG_2)
    set $P1, $P6
# }
    goto __label_4
  __label_3: # else
.const 'Sub' $P7 = 'WSubId_29'
.annotate 'line', 4691
    $P7('modifier list', $P3)
  __label_4: # endif
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 4694
    __ARG_1.'unget'($P3)
  __label_2: # endif
.annotate 'line', 4695
    new $P6, [ 'Argument' ]
    $P6.'Argument'($P2, $P1)
    set $P5, $P6
    .return($P5)
# }
.annotate 'line', 4696

.end # parseArgument

.namespace [ 'ArgumentList' ]

.sub 'ArgumentList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4707
    setattribute self, 'owner', __ARG_1
.annotate 'line', 4708
    setattribute self, 'start', __ARG_2
.annotate 'line', 4709
# var t: $P1
    $P1 = __ARG_3.'get'()
.annotate 'line', 4710
    $P2 = $P1.'isop'(__ARG_4)
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 4711
    __ARG_3.'unget'($P1)
.annotate 'line', 4712
.const 'Sub' $P3 = 'parseArgument'
.annotate 'line', 4713
.const 'Sub' $P5 = 'WSubId_27'
    $P4 = $P5(__ARG_3, __ARG_1, $P3, __ARG_4)
    setattribute self, 'args', $P4
# }
  __label_1: # endif
# }
.annotate 'line', 4715

.end # ArgumentList


.sub 'numargs' :method
# Body
# {
.annotate 'line', 4718
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4719
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
# predefined elements
.annotate 'line', 4717
    elements $I1, $P1
  __label_1:
.annotate 'line', 4719
    .return($I1)
# }
.annotate 'line', 4720

.end # numargs


.sub 'getrawargs' :method
# Body
# {
.annotate 'line', 4723
    getattribute $P1, self, 'args'
    .return($P1)
# }
.annotate 'line', 4724

.end # getrawargs


.sub 'getarg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 4727
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4728
    $P2 = $P1[__ARG_1]
    .return($P2)
# }
.annotate 'line', 4729

.end # getarg


.sub 'getfreearg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 4732
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4733
    $P3 = $P1[__ARG_1]
    getattribute $P2, $P3, 'arg'
    .return($P2)
# }
.annotate 'line', 4734

.end # getfreearg


.sub 'optimize' :method
# Body
# {
.const 'Sub' $P1 = 'WSubId_28'
.annotate 'line', 4737
    getattribute $P2, self, 'args'
    $P1($P2)
.annotate 'line', 4738
    .return(self)
# }
.annotate 'line', 4739

.end # optimize


.sub 'getargvalues' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4742
# var argregs: $P1
    getattribute $P1, self, 'argregs'
.annotate 'line', 4743
    unless_null $P1, __label_1
# {
.annotate 'line', 4744
    new $P2, ['ResizableStringArray']
.annotate 'line', 4745
# pnull: $S1
    set $S1, ''
.annotate 'line', 4746
# var args: $P3
    getattribute $P3, self, 'args'
.annotate 'line', 4747
    if_null $P3, __label_2
# {
.annotate 'line', 4748
    iter $P6, $P3
    set $P6, 0
  __label_3: # for iteration
    unless $P6 goto __label_4
    shift $P4, $P6
# {
.annotate 'line', 4749
# var arg: $P5
    getattribute $P5, $P4, 'arg'
.annotate 'line', 4750
# reg: $S2
    null $S2
.annotate 'line', 4751
    $P7 = $P5.'isnull'()
    if_null $P7, __label_5
    unless $P7 goto __label_5
# {
.annotate 'line', 4752
    ne $S1, '', __label_7
# {
.annotate 'line', 4753
    getattribute $P9, self, 'owner'
    $P8 = $P9.'tempreg'('P')
    set $S1, $P8
.annotate 'line', 4754
    __ARG_1.'emitnull'($S1)
# }
  __label_7: # endif
.annotate 'line', 4756
    set $S2, $S1
# }
    goto __label_6
  __label_5: # else
.annotate 'line', 4759
    $P7 = $P5.'emit_get'(__ARG_1)
    set $S2, $P7
  __label_6: # endif
.annotate 'line', 4760
# predefined push
    push $P2, $S2
# }
    goto __label_3
  __label_4: # endfor
# }
  __label_2: # endif
.annotate 'line', 4763
    setattribute self, 'argregs', $P2
# }
  __label_1: # endif
.annotate 'line', 4765
    .return($P1)
# }
.annotate 'line', 4766

.end # getargvalues


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4769
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4770
# var argreg: $P2
    $P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 4772
# sep: $S1
    set $S1, ''
.annotate 'line', 4773
# n: $I1
    $P4 = self.'numargs'()
    set $I1, $P4
# for loop
.annotate 'line', 4774
# i: $I2
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
# {
.annotate 'line', 4775
    $P4 = $P2[$I2]
    __ARG_1.'print'($S1, $P4)
.annotate 'line', 4776
# var modifiers: $P3
    $P4 = $P1[$I2]
    getattribute $P3, $P4, 'modifiers'
.annotate 'line', 4777
    if_null $P3, __label_4
.annotate 'line', 4778
    $P3.'emitmodifiers'(__ARG_1)
  __label_4: # endif
.annotate 'line', 4779
    set $S1, ', '
# }
  __label_1: # for iteration
.annotate 'line', 4774
    inc $I2
    goto __label_3
  __label_2: # for end
# }
.annotate 'line', 4781

.end # emitargs

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ArgumentList' ]
.annotate 'line', 4700
    addattribute $P0, 'owner'
.annotate 'line', 4701
    addattribute $P0, 'start'
.annotate 'line', 4702
    addattribute $P0, 'args'
.annotate 'line', 4703
    addattribute $P0, 'argregs'
.end
.namespace [ ]

.sub 'arglist_hascompilevalue' :subid('WSubId_51')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4786
    iter $P2, __ARG_1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $P1, $P2
.annotate 'line', 4787
    $P3 = $P1.'hascompilevalue'()
    isfalse $I1, $P3
    unless $I1 goto __label_3
.annotate 'line', 4788
    .return(0)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 4789
    .return(1)
# }
.annotate 'line', 4790

.end # arglist_hascompilevalue

.namespace [ 'CallPredefExpr' ]

.sub 'CallPredefExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4801
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 4802
    setattribute self, 'predef', __ARG_3
.annotate 'line', 4803
    setattribute self, 'args', __ARG_4
# }
.annotate 'line', 4804

.end # CallPredefExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4807
    getattribute $P1, self, 'predef'
    .tailcall $P1.'result'()
# }
.annotate 'line', 4808

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4811
# var predef: $P1
    getattribute $P1, self, 'predef'
.annotate 'line', 4812
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 4813
    new $P3, ['ResizableStringArray']
.annotate 'line', 4814
# var arg: $P4
    null $P4
.annotate 'line', 4815
# pnull: $S1
    set $S1, ''
# switch
.annotate 'line', 4816
    $P6 = $P1.'params'()
    set $I3, $P6
    set $I4, -1
    if $I3 == $I4 goto __label_3
    set $I4, -2
    if $I3 == $I4 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 4818
    iter $P7, $P2
    set $P7, 0
  __label_5: # for iteration
    unless $P7 goto __label_6
    shift $P4, $P7
# {
.annotate 'line', 4819
# reg: $S2
    getattribute $P9, $P4, 'arg'
    $P8 = $P9.'emit_get'(__ARG_1)
    null $S2
    if_null $P8, __label_7
    set $S2, $P8
  __label_7:
.annotate 'line', 4821
    ne $S2, 'null', __label_8
# {
.annotate 'line', 4822
    ne $S1, '', __label_9
# {
.annotate 'line', 4823
    $P6 = self.'tempreg'('P')
    set $S1, $P6
.annotate 'line', 4824
    __ARG_1.'emitnull'($S1)
# }
  __label_9: # endif
.annotate 'line', 4826
    set $S2, $S1
# }
  __label_8: # endif
.annotate 'line', 4828
# predefined push
    push $P3, $S2
# }
    goto __label_5
  __label_6: # endfor
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 4832
# var rawargs: $P5
    root_new $P5, ['parrot';'ResizablePMCArray']
.annotate 'line', 4833
    iter $P10, $P2
    set $P10, 0
  __label_10: # for iteration
    unless $P10 goto __label_11
    shift $P4, $P10
.annotate 'line', 4834
    getattribute $P8, $P4, 'arg'
# predefined push
    push $P5, $P8
    goto __label_10
  __label_11: # endfor
.annotate 'line', 4835
    getattribute $P9, self, 'predef'
    getattribute $P11, self, 'start'
    $P9.'expand'(__ARG_1, self, $P11, __ARG_2, $P5)
.annotate 'line', 4836
    .return()
  __label_2: # default
.annotate 'line', 4838
# n: $I1
    getattribute $P12, self, 'args'
    set $I1, $P12
# for loop
.annotate 'line', 4839
# i: $I2
    null $I2
  __label_14: # for condition
    ge $I2, $I1, __label_13
# {
.annotate 'line', 4840
    $P13 = $P2[$I2]
    getattribute $P4, $P13, 'arg'
.annotate 'line', 4841
# argtype: $S3
    $P6 = $P4.'checkresult'()
    null $S3
    if_null $P6, __label_15
    set $S3, $P6
  __label_15:
.annotate 'line', 4842
# paramtype: $S4
    $P6 = $P1.'paramtype'($I2)
    null $S4
    if_null $P6, __label_16
    set $S4, $P6
  __label_16:
.annotate 'line', 4843
# argr: $S5
    null $S5
.annotate 'line', 4844
    $P6 = $P4.'isnull'()
    if_null $P6, __label_17
    unless $P6 goto __label_17
# {
# switch
.annotate 'line', 4845
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
.annotate 'line', 4849
    $P8 = self.'tempreg'($S4)
    set $S5, $P8
.annotate 'line', 4850
    __ARG_1.'emitnull'($S5)
    goto __label_19 # break
  __label_20: # default
.annotate 'line', 4853
    ne $S1, '', __label_24
# {
.annotate 'line', 4854
    $P9 = self.'tempreg'('P')
    set $S1, $P9
.annotate 'line', 4855
    __ARG_1.'emitnull'($S1)
# }
  __label_24: # endif
.annotate 'line', 4857
    set $S5, $S1
  __label_19: # switch end
# }
    goto __label_18
  __label_17: # else
# {
.annotate 'line', 4861
    iseq $I3, $S3, $S4
    if $I3 goto __label_27
    iseq $I3, $S4, '?'
  __label_27:
    unless $I3 goto __label_25
.annotate 'line', 4862
    $P6 = $P4.'emit_get'(__ARG_1)
    set $S5, $P6
    goto __label_26
  __label_25: # else
# {
.annotate 'line', 4864
# aux: $S6
    null $S6
.annotate 'line', 4865
    $P6 = self.'tempreg'($S4)
    set $S5, $P6
# switch
.annotate 'line', 4866
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
.annotate 'line', 4868
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
.annotate 'line', 4872
    $P6 = $P4.'emit_get'(__ARG_1)
    set $S6, $P6
.annotate 'line', 4873
    __ARG_1.'emitbox'($S5, $S6)
    goto __label_34 # break
  __label_35: # default
.annotate 'line', 4876
    $P4.'emit'(__ARG_1, $S5)
  __label_34: # switch end
    goto __label_28 # break
  __label_31: # case
  __label_32: # case
  __label_33: # case
.annotate 'line', 4882
    $P8 = $P4.'emit_get'(__ARG_1)
    set $S6, $P8
.annotate 'line', 4883
    __ARG_1.'emitset'($S5, $S6)
    goto __label_28 # break
  __label_29: # default
.annotate 'line', 4886
    $P4.'emit'(__ARG_1, $S5)
  __label_28: # switch end
# }
  __label_26: # endif
# }
  __label_18: # endif
.annotate 'line', 4890
# predefined push
    push $P3, $S5
# }
  __label_12: # for iteration
.annotate 'line', 4839
    inc $I2
    goto __label_14
  __label_13: # for end
  __label_1: # switch end
.annotate 'line', 4893
    getattribute $P6, self, 'predef'
    getattribute $P8, self, 'start'
    $P6.'expand'(__ARG_1, self, $P8, __ARG_2, $P3)
# }
.annotate 'line', 4894

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CallPredefExpr' ]
.annotate 'line', 4794
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 4796
    addattribute $P0, 'predef'
.annotate 'line', 4797
    addattribute $P0, 'args'
.end
.namespace [ ]

.sub 'genpredefcallexpr' :subid('WSubId_53')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 4901
# callname: $S1
    $P3 = __ARG_2.'name'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4902
    __ARG_1.'use_predef'($S1)
.annotate 'line', 4903
# nargs: $I1
    unless_null __ARG_3, __label_3
    null $I1
    goto __label_2
  __label_3:
    $I1 = __ARG_3.'numargs'()
  __label_2:
.annotate 'line', 4904
# var rawargs: $P1
    ne $I1, 0, __label_5
    root_new $P3, ['parrot';'ResizablePMCArray']
    set $P1, $P3
    goto __label_4
  __label_5:
    $P1 = __ARG_3.'getrawargs'()
  __label_4:
.annotate 'line', 4907
    isa $I2, __ARG_2, [ 'PredefFunctionEval' ]
    unless $I2 goto __label_6
# {
.annotate 'line', 4908
.const 'Sub' $P5 = 'WSubId_51'
    $P3 = $P5($P1)
    if_null $P3, __label_7
    unless $P3 goto __label_7
# {
.annotate 'line', 4909
# var evalfun: $P2
    getattribute $P2, __ARG_2, 'evalfun'
.annotate 'line', 4910
    getattribute $P3, __ARG_1, 'owner'
    getattribute $P4, __ARG_1, 'start'
    .tailcall $P2($P3, $P4, $P1)
# }
  __label_7: # endif
# }
  __label_6: # endif
.annotate 'line', 4914
    new $P4, [ 'CallPredefExpr' ]
    getattribute $P6, __ARG_1, 'owner'
    getattribute $P7, __ARG_1, 'start'
    $P4.'CallPredefExpr'($P6, $P7, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
# }
.annotate 'line', 4915

.end # genpredefcallexpr

.namespace [ 'CallExpr' ]

.sub 'CallExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4925
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 4926
    setattribute self, 'funref', __ARG_4
.annotate 'line', 4927
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 4928
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 4929
    __ARG_1.'unget'($P1)
.annotate 'line', 4930
    new $P4, [ 'ArgumentList' ]
    $P4.'ArgumentList'(__ARG_2, __ARG_3, __ARG_1, ')')
    set $P3, $P4
    setattribute self, 'args', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 4932

.end # CallExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4933
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4936
# var funref: $P1
    getattribute $P6, self, 'funref'
    $P1 = $P6.'optimize'()
.annotate 'line', 4937
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 4938
# nargs: $I1
    null $I1
.annotate 'line', 4939
    if_null $P2, __label_1
# {
.annotate 'line', 4940
    $P2 = $P2.'optimize'()
.annotate 'line', 4941
    $P6 = $P2.'numargs'()
    set $I1, $P6
# }
  __label_1: # endif
.annotate 'line', 4944
    isa $I2, $P1, [ 'MemberExpr' ]
    unless $I2 goto __label_2
.annotate 'line', 4945
    new $P7, [ 'CallMemberExpr' ]
    $P7.'CallMemberExpr'(self, $P1, $P2)
    set $P6, $P7
    .return($P6)
  __label_2: # endif
.annotate 'line', 4946
    isa $I2, $P1, [ 'MemberRefExpr' ]
    unless $I2 goto __label_3
.annotate 'line', 4947
    new $P7, [ 'CallMemberRefExpr' ]
    $P7.'CallMemberRefExpr'(self, $P1, $P2)
    set $P6, $P7
    .return($P6)
  __label_3: # endif
.annotate 'line', 4950
    $P6 = $P1.'isidentifier'()
    if_null $P6, __label_4
    unless $P6 goto __label_4
# {
.annotate 'line', 4951
# callname: $S1
    $P7 = $P1.'getName'()
    null $S1
    if_null $P7, __label_5
    set $S1, $P7
  __label_5:
.annotate 'line', 4952
# var predef: $P3
.const 'Sub' $P8 = 'WSubId_52'
    $P3 = $P8($S1, $I1)
.annotate 'line', 4953
    if_null $P3, __label_6
.annotate 'line', 4954
.const 'Sub' $P9 = 'WSubId_53'
    getattribute $P6, self, 'owner'
    .tailcall $P9($P6, $P3, $P2)
  __label_6: # endif
.annotate 'line', 4955
# call: $S2
    $P6 = $P1.'checkIdentifier'()
    null $S2
    if_null $P6, __label_7
    set $S2, $P6
  __label_7:
.annotate 'line', 4956
    ne $S2, '', __label_8
# {
.annotate 'line', 4957
    new $P4, ['ResizableStringArray']
    set $P4, 1
    set $S4, $S1
    $P4[0] = $S4
.annotate 'line', 4958
# var sym: $P5
    $P5 = self.'findsymbol'($P4)
.annotate 'line', 4959
    if_null $P5, __label_9
# {
.annotate 'line', 4960
# id: $S3
    $P6 = $P5.'makesubid'()
    null $S3
    if_null $P6, __label_10
    set $S3, $P6
  __label_10:
.annotate 'line', 4961
    box $P6, $S3
    setattribute self, 'subid', $P6
# }
  __label_9: # endif
# }
  __label_8: # endif
# }
  __label_4: # endif
.annotate 'line', 4966
    setattribute self, 'funref', $P1
.annotate 'line', 4967
    setattribute self, 'args', $P2
.annotate 'line', 4968
    .return(self)
# }
.annotate 'line', 4969

.end # optimize


.sub 'cantailcall' :method
# Body
# {
.annotate 'line', 4972
    .return(1)
# }
.annotate 'line', 4973

.end # cantailcall


.sub 'emitcall' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4976
    getattribute $P2, self, 'subid'
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 4977
# reg: $S1
    getattribute $P4, self, 'owner'
    $P3 = $P4.'createreg'('P')
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
.annotate 'line', 4978
# predefined string
    getattribute $P2, self, 'subid'
    set $S3, $P2
    concat $S4, ".const 'Sub' ", $S1
    concat $S4, $S4, " = '"
    concat $S4, $S4, $S3
    concat $S4, $S4, "'"
    __ARG_1.'say'($S4)
.annotate 'line', 4979
    .return($S1)
# }
  __label_1: # endif
.annotate 'line', 4981
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 4982
# call: $S2
    null $S2
.annotate 'line', 4983
    $P2 = $P1.'isidentifier'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
# {
.annotate 'line', 4984
    $P3 = $P1.'checkIdentifier'()
    set $S2, $P3
.annotate 'line', 4985
    ne $S2, '', __label_5
.annotate 'line', 4986
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
.annotate 'line', 4989
    $P2 = $P1.'emit_get'(__ARG_1)
    set $S2, $P2
  __label_4: # endif
.annotate 'line', 4990
    .return($S2)
# }
.annotate 'line', 4991

.end # emitcall


.sub 'prepareargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4994
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4995
    if_null $P1, __label_1
.annotate 'line', 4996
    $P1.'getargvalues'(__ARG_1)
  __label_1: # endif
# }
.annotate 'line', 4997

.end # prepareargs


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5000
    __ARG_1.'print'('(')
.annotate 'line', 5001
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5002
    if_null $P1, __label_1
.annotate 'line', 5003
    $P1.'emitargs'(__ARG_1)
  __label_1: # endif
.annotate 'line', 5004
    __ARG_1.'say'(')')
# }
.annotate 'line', 5005

.end # emitargs


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5008
# call: $S1
    $P1 = self.'emitcall'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5009
    self.'prepareargs'(__ARG_1)
.annotate 'line', 5011
    self.'annotate'(__ARG_1)
.annotate 'line', 5013
    __ARG_1.'print'('    ')
.annotate 'line', 5014
    isnull $I1, __ARG_2
    not $I1
    unless $I1 goto __label_3
    set $S2, __ARG_2
    isne $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
# {
.annotate 'line', 5015
    set $S3, __ARG_2
    ne $S3, '.tailcall', __label_4
.annotate 'line', 5016
    __ARG_1.'print'('.tailcall ')
    goto __label_5
  __label_4: # else
.annotate 'line', 5018
    __ARG_1.'print'(__ARG_2, ' = ')
  __label_5: # endif
# }
  __label_2: # endif
.annotate 'line', 5021
    __ARG_1.'print'($S1)
.annotate 'line', 5022
    self.'emitargs'(__ARG_1)
# }
.annotate 'line', 5023

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CallExpr' ]
.annotate 'line', 4917
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 4919
    addattribute $P0, 'funref'
.annotate 'line', 4920
    addattribute $P0, 'args'
.annotate 'line', 4921
    addattribute $P0, 'subid'
.end
.namespace [ 'CallMemberExpr' ]

.sub 'CallMemberExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5035
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 5036
    setattribute self, 'funref', __ARG_2
.annotate 'line', 5037
    setattribute self, 'args', __ARG_3
# }
.annotate 'line', 5038

.end # CallMemberExpr


.sub 'emitcall' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5041
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 5042
# var first: $P2
    getattribute $P2, $P1, 'left'
  __label_2: # while
.annotate 'line', 5047
    isa $I1, $P2, [ 'MemberExpr' ]
    unless $I1 goto __label_1
.annotate 'line', 5048
    getattribute $P2, $P2, 'left'
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 5049
    isa $I1, $P2, [ 'IdentifierExpr' ]
    unless $I1 goto __label_3
# {
.annotate 'line', 5050
# var idfirst: $P3
    $P3 = $P2.'checkIdentifier'()
.annotate 'line', 5051
    isnull $I1, $P3
    if $I1 goto __label_5
    set $S3, $P3
    iseq $I1, $S3, ''
  __label_5:
    unless $I1 goto __label_4
# {
.annotate 'line', 5052
# var key: $P4
    root_new $P4, ['parrot';'ResizablePMCArray']
.annotate 'line', 5053
    $P1.'buildkey'($P4)
.annotate 'line', 5054
# var sym: $P5
    $P5 = self.'findsymbol'($P4)
.annotate 'line', 5055
    if_null $P5, __label_6
# {
.annotate 'line', 5056
# reg: $S1
    getattribute $P7, self, 'owner'
    $P6 = $P7.'createreg'('P')
    null $S1
    if_null $P6, __label_7
    set $S1, $P6
  __label_7:
.annotate 'line', 5057
# id: $S2
    $P6 = $P5.'makesubid'()
    null $S2
    if_null $P6, __label_8
    set $S2, $P6
  __label_8:
.annotate 'line', 5058
    concat $S3, ".const 'Sub' ", $S1
    concat $S3, $S3, " = '"
    concat $S3, $S3, $S2
    concat $S3, $S3, "'"
    __ARG_1.'say'($S3)
.annotate 'line', 5059
    .return($S1)
# }
  __label_6: # endif
# }
  __label_4: # endif
# }
  __label_3: # endif
.annotate 'line', 5063
    root_new $P6, ['parrot';'ResizablePMCArray']
    $P8 = $P1.'emit_left_get'(__ARG_1)
    push $P6, $P8
    box $P7, ".'"
    push $P6, $P7
.annotate 'line', 5064
    $P9 = $P1.'get_member'()
.annotate 'line', 5063
    push $P6, $P9
    box $P7, "'"
    push $P6, $P7
# predefined join
.annotate 'line', 5040
    join $S3, "", $P6
.annotate 'line', 5063
    .return($S3)
# }
.annotate 'line', 5065

.end # emitcall

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CallMemberExpr' ]
.annotate 'line', 5031
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
.annotate 'line', 5075
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 5076
    setattribute self, 'funref', __ARG_2
.annotate 'line', 5077
    setattribute self, 'args', __ARG_3
# }
.annotate 'line', 5078

.end # CallMemberRefExpr


.sub 'emitcall' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5081
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 5082
# var right: $P2
    getattribute $P2, $P1, 'right'
.annotate 'line', 5083
# var type: $P3
    $P3 = $P2.'checkresult'()
.annotate 'line', 5084
    set $S3, $P3
    isne $I1, $S3, 'P'
    unless $I1 goto __label_2
    set $S4, $P3
    isne $I1, $S4, 'S'
  __label_2:
    unless $I1 goto __label_1
.const 'Sub' $P4 = 'WSubId_1'
.annotate 'line', 5085
    getattribute $P5, $P1, 'start'
    $P4("Invalid expression type in '.*'", $P5)
  __label_1: # endif
.annotate 'line', 5088
# lreg: $S1
    $P5 = $P1.'emit_left_get'(__ARG_1)
    null $S1
    if_null $P5, __label_3
    set $S1, $P5
  __label_3:
.annotate 'line', 5089
# rreg: $S2
    $P5 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P5, __label_4
    set $S2, $P5
  __label_4:
.annotate 'line', 5090
    concat $S3, $S1, '.'
    concat $S3, $S3, $S2
    .return($S3)
# }
.annotate 'line', 5091

.end # emitcall

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CallMemberRefExpr' ]
.annotate 'line', 5071
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
.annotate 'line', 5101
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5102
    setattribute self, 'left', __ARG_3
# }
.annotate 'line', 5103

.end # MemberExprBase


.sub 'emit_left_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5106
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5107
# type: $S1
    $P2 = $P1.'checkresult'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 5108
# reg: $S2
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 5109
    eq $S1, 'P', __label_3
# {
.annotate 'line', 5110
# auxreg: $S3
    set $S3, $S2
.annotate 'line', 5111
    $P2 = self.'tempreg'('P')
    set $S2, $P2
.annotate 'line', 5112
    __ARG_1.'emitbox'($S2, $S3)
# }
  __label_3: # endif
.annotate 'line', 5114
    .return($S2)
# }
.annotate 'line', 5115

.end # emit_left_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MemberExprBase' ]
.annotate 'line', 5096
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5098
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
.annotate 'line', 5124
    self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5125
    setattribute self, 'right', __ARG_4
# }
.annotate 'line', 5126

.end # MemberExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5127
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5130
    getattribute $P3, self, 'left'
    $P2 = $P3.'optimize'()
    setattribute self, 'left', $P2
.annotate 'line', 5131
    .return(self)
# }
.annotate 'line', 5132

.end # optimize


.sub 'buildkey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5135
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5136
    isa $I1, $P1, [ 'IdentifierExpr' ]
    unless $I1 goto __label_1
.annotate 'line', 5137
    $P2 = $P1.'getName'()
# predefined push
    push __ARG_1, $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 5139
    $P1.'buildkey'(__ARG_1)
  __label_2: # endif
.annotate 'line', 5140
    getattribute $P3, self, 'right'
    $P2 = $P3.'getidentifier'()
# predefined push
    push __ARG_1, $P2
# }
.annotate 'line', 5141

.end # buildkey


.sub 'get_member' :method
# Body
# {
.annotate 'line', 5144
    getattribute $P1, self, 'right'
    .return($P1)
# }
.annotate 'line', 5145

.end # get_member


.sub '__emit_assign_aux' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5148
# ident: $S1
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5149
    self.'annotate'(__ARG_1)
.annotate 'line', 5150
    __ARG_1.'say'('    ', "setattribute ", __ARG_2, ", '", $S1, "', ", __ARG_3)
# }
.annotate 'line', 5151

.end # __emit_assign_aux


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5154
# result: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5155
    self.'emit'(__ARG_1, $S1)
.annotate 'line', 5156
    .return($S1)
# }
.annotate 'line', 5157

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5160
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5161
# ident: $S2
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5162
    self.'annotate'(__ARG_1)
.annotate 'line', 5163
    __ARG_1.'say'('    ', 'getattribute ', __ARG_2, ', ', $S1, ", '", $S2, "'")
# }
.annotate 'line', 5164

.end # emit


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5167
    self.'emit'(__ARG_1, __ARG_2)
# }
.annotate 'line', 5168

.end # emit_init


.sub 'emit_assign' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5171
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5172
# value: $S2
    null $S2
.annotate 'line', 5173
    ne __ARG_2, 'P', __label_2
# {
.annotate 'line', 5175
    ne __ARG_3, 'null', __label_4
# {
.annotate 'line', 5176
    $P1 = self.'tempreg'('P')
    set __ARG_3, $P1
.annotate 'line', 5177
    __ARG_1.'emitnull'(__ARG_3)
# }
  __label_4: # endif
.annotate 'line', 5179
    set $S2, __ARG_3
# }
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 5182
    $P1 = self.'tempreg'('P')
    set $S2, $P1
.annotate 'line', 5183
    __ARG_1.'emitbox'($S2, __ARG_3)
# }
  __label_3: # endif
.annotate 'line', 5185
    self.'__emit_assign_aux'(__ARG_1, $S1, $S2)
# }
.annotate 'line', 5186

.end # emit_assign


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5189
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5190
# value: $S2
    $P1 = self.'tempreg'('P')
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5191
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_3
    unless $P1 goto __label_3
.annotate 'line', 5192
    __ARG_1.'emitnull'($S2)
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 5194
# rreg: $S3
    $P2 = __ARG_2.'emit_get'(__ARG_1)
    null $S3
    if_null $P2, __label_5
    set $S3, $P2
  __label_5:
.annotate 'line', 5195
    $P1 = __ARG_2.'checkresult'()
    set $S4, $P1
    eq $S4, 'P', __label_6
.annotate 'line', 5196
    __ARG_1.'emitbox'($S2, $S3)
    goto __label_7
  __label_6: # else
.annotate 'line', 5198
    set $S2, $S3
  __label_7: # endif
# }
  __label_4: # endif
.annotate 'line', 5200
    self.'__emit_assign_aux'(__ARG_1, $S1, $S2)
.annotate 'line', 5201
    .return($S2)
# }
.annotate 'line', 5202

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MemberExpr' ]
.annotate 'line', 5118
    get_class $P1, [ 'MemberExprBase' ]
    addparent $P0, $P1
.annotate 'line', 5120
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
.annotate 'line', 5212
    self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5213
    setattribute self, 'right', __ARG_4
# }
.annotate 'line', 5214

.end # MemberRefExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5215
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5218
    getattribute $P3, self, 'left'
    $P2 = $P3.'optimize'()
    setattribute self, 'left', $P2
.annotate 'line', 5219
    getattribute $P3, self, 'right'
    $P2 = $P3.'optimize'()
    setattribute self, 'right', $P2
.annotate 'line', 5220
    .return(self)
# }
.annotate 'line', 5221

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.const 'Sub' $P1 = 'WSubId_1'
.annotate 'line', 5225
    getattribute $P2, self, 'start'
.annotate 'line', 5224
    $P1('Member reference can be used only for method calls', $P2)
# }
.annotate 'line', 5226

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MemberRefExpr' ]
.annotate 'line', 5207
    get_class $P1, [ 'MemberExprBase' ]
    addparent $P0, $P1
.annotate 'line', 5209
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
.annotate 'line', 5240
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5241
    setattribute self, 'left', __ARG_4
.annotate 'line', 5242
    new $P3, [ 'SimpleArgList' ]
    $P3.'SimpleArgList'(__ARG_1, __ARG_2, ']')
    set $P2, $P3
    setattribute self, 'args', $P2
# }
.annotate 'line', 5243

.end # IndexExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5246
    getattribute $P2, self, 'left'
    $P1 = $P2.'checkresult'()
    set $S1, $P1
    ne $S1, 'S', __label_1
.annotate 'line', 5247
    .return('S')
    goto __label_2
  __label_1: # else
.annotate 'line', 5249
    .return('P')
  __label_2: # endif
# }
.annotate 'line', 5250

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5253
# var left: $P1
    getattribute $P5, self, 'left'
    $P1 = $P5.'optimize'()
.annotate 'line', 5254
    setattribute self, 'left', $P1
.annotate 'line', 5255
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 5256
    $P2.'optimizeargs'()
.annotate 'line', 5260
    $I2 = $P1.'isstringliteral'()
    unless $I2 goto __label_2
    $P5 = $P2.'numargs'()
    set $I3, $P5
    iseq $I2, $I3, 1
  __label_2:
    unless $I2 goto __label_1
# {
.annotate 'line', 5261
# var arg: $P3
    $P3 = $P2.'getarg'(0)
.annotate 'line', 5262
    $P5 = $P3.'isintegerliteral'()
    if_null $P5, __label_3
    unless $P5 goto __label_3
# {
.annotate 'line', 5263
# ival: $I1
    $P6 = $P3.'getIntegerValue'()
    set $I1, $P6
.annotate 'line', 5264
# sval: $S1
    $P5 = $P1.'get_value'()
    null $S1
    if_null $P5, __label_4
    set $S1, $P5
  __label_4:
.annotate 'line', 5265
# var t: $P4
    new $P4, [ 'TokenQuoted' ]
    getattribute $P6, self, 'start'
    getattribute $P5, $P6, 'file'
    getattribute $P8, self, 'start'
    getattribute $P7, $P8, 'line'
.annotate 'line', 5266
# predefined substr
.annotate 'line', 5265
    substr $S2, $S1, $I1, 1
    $P4.'TokenQuoted'($P5, $P7, $S2)
.annotate 'line', 5267
    new $P6, [ 'StringLiteral' ]
    getattribute $P7, self, 'owner'
    $P6.'StringLiteral'($P7, $P4)
    set $P5, $P6
    .return($P5)
# }
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 5270
    .return(self)
# }
.annotate 'line', 5271

.end # optimize


.sub 'emit_prep' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5274
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
.annotate 'line', 5275
    getattribute $P5, self, 'start'
    $P4('wrong call to IndexExpr.emit_args', $P5)
  __label_1: # endif
.annotate 'line', 5276
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5277
    $P5 = $P1.'isidentifier'()
    if_null $P5, __label_4
    unless $P5 goto __label_4
.annotate 'line', 5278
    $P3 = $P1.'getIdentifier'()
    goto __label_3
  __label_4:
.annotate 'line', 5279
    $P3 = $P1.'emit_get'(__ARG_1)
  __label_3:
.annotate 'line', 5277
    setattribute self, 'regleft', $P3
.annotate 'line', 5280
    getattribute $P5, self, 'args'
    $P3 = $P5.'getargvalues'(__ARG_1)
    setattribute self, 'argregs', $P3
# }
.annotate 'line', 5281

.end # emit_prep


.sub 'emit_aux' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5284
# var regleft: $P1
    getattribute $P1, self, 'regleft'
.annotate 'line', 5285
# var argregs: $P2
    getattribute $P2, self, 'argregs'
.annotate 'line', 5286
    isnull $I1, $P1
    if $I1 goto __label_2
    isnull $I1, $P2
  __label_2:
    unless $I1 goto __label_1
.const 'Sub' $P3 = 'WSubId_6'
.annotate 'line', 5287
    getattribute $P4, self, 'start'
    $P3('wrong call to IndexExpr.emit_aux', $P4)
  __label_1: # endif
.annotate 'line', 5288
    getattribute $P4, self, 'regleft'
    __ARG_1.'print'($P4, '[')
.annotate 'line', 5289
# predefined join
    join $S1, '; ', $P2
    __ARG_1.'print'($S1)
.annotate 'line', 5290
    __ARG_1.'print'(']')
# }
.annotate 'line', 5291

.end # emit_aux


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5294
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5295
# type: $S1
    $P2 = self.'checkresult'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 5296
    ne $S1, 'S', __label_2
# {
.annotate 'line', 5297
# var argregs: $P1
    getattribute $P1, self, 'argregs'
.annotate 'line', 5298
# nargs: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 5299
    eq $I1, 1, __label_4
.const 'Sub' $P3 = 'WSubId_1'
.annotate 'line', 5300
    getattribute $P2, self, 'start'
    $P3('Bad string index', $P2)
  __label_4: # endif
.annotate 'line', 5301
    set $S2, __ARG_2
    ne $S2, '', __label_5
.annotate 'line', 5302
    __ARG_2 = self.'tempreg'('S')
  __label_5: # endif
.annotate 'line', 5303
    getattribute $P2, self, 'regleft'
    $P4 = $P1[0]
    __ARG_1.'say'('    ', 'substr ', __ARG_2, ', ', $P2, ', ', $P4, ', ', 1)
# }
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 5306
    self.'annotate'(__ARG_1)
.annotate 'line', 5307
    __ARG_1.'print'('    ', __ARG_2, ' = ')
.annotate 'line', 5308
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5309
    __ARG_1.'say'('')
# }
  __label_3: # endif
# }
.annotate 'line', 5311

.end # emit


.sub 'emit_assign' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5314
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5315
    self.'annotate'(__ARG_1)
.annotate 'line', 5316
    __ARG_1.'print'('    ')
.annotate 'line', 5317
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5318
    __ARG_1.'say'(' = ', __ARG_3)
# }
.annotate 'line', 5319

.end # emit_assign


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5322
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5323
# rreg: $S1
    null $S1
.annotate 'line', 5324
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
# {
.annotate 'line', 5325
    $P2 = self.'tempreg'('P')
    set $S1, $P2
.annotate 'line', 5326
    __ARG_1.'emitnull'($S1)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 5329
    $P1 = __ARG_2.'emit_get'(__ARG_1)
    set $S1, $P1
  __label_2: # endif
.annotate 'line', 5330
    self.'annotate'(__ARG_1)
.annotate 'line', 5331
    __ARG_1.'print'('    ')
.annotate 'line', 5332
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5333
    __ARG_1.'say'(' = ', $S1)
.annotate 'line', 5334
    .return($S1)
# }
.annotate 'line', 5335

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IndexExpr' ]
.annotate 'line', 5231
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5233
    addattribute $P0, 'left'
.annotate 'line', 5234
    addattribute $P0, 'regleft'
.annotate 'line', 5235
    addattribute $P0, 'args'
.annotate 'line', 5236
    addattribute $P0, 'argregs'
.end
.namespace [ 'ArrayExpr' ]

.sub 'ArrayExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5346
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5347
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5348
    $P2 = $P1.'isop'(']')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 5349
    __ARG_1.'unget'($P1)
.annotate 'line', 5350
.const 'Sub' $P3 = 'parseExpr'
.annotate 'line', 5351
.const 'Sub' $P5 = 'WSubId_27'
    $P4 = $P5(__ARG_1, __ARG_2, $P3, ']')
    setattribute self, 'values', $P4
# }
  __label_1: # endif
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
.const 'Sub' $P1 = 'WSubId_28'
.annotate 'line', 5357
    getattribute $P2, self, 'values'
    $P1($P2)
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
    eq $S2, '', __label_1
# {
.annotate 'line', 5363
# value: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_3
    set $S1, $P1
  __label_3:
.annotate 'line', 5364
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 5370
    self.'emit_init'(__ARG_1, '')
# }
  __label_2: # endif
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
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
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
    eq __ARG_2, '', __label_1
# {
.annotate 'line', 5385
    __ARG_1.'say'('    ', 'root_new ', __ARG_2, ", ['parrot';'ResizablePMCArray']")
.annotate 'line', 5386
    $P3 = self.'tempreg'('P')
    set $S2, $P3
# }
  __label_1: # endif
.annotate 'line', 5388
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 5389
    if_null $P1, __label_2
# {
.annotate 'line', 5390
    iter $P4, $P1
    set $P4, 0
  __label_3: # for iteration
    unless $P4 goto __label_4
    shift $P2, $P4
# {
# switch
.annotate 'line', 5391
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
.annotate 'line', 5393
# aux: $S3
    $P5 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P5, __label_10
    set $S3, $P5
  __label_10:
.annotate 'line', 5394
    eq __ARG_2, '', __label_11
# {
.annotate 'line', 5395
    __ARG_1.'emitbox'($S2, $S3)
.annotate 'line', 5396
    set $S1, $S2
# }
  __label_11: # endif
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 5400
    $P3 = $P2.'isnull'()
    if_null $P3, __label_12
    unless $P3 goto __label_12
# {
.annotate 'line', 5401
    eq __ARG_2, '', __label_14
# {
.annotate 'line', 5402
    $P5 = self.'tempreg'('P')
    set $S1, $P5
.annotate 'line', 5403
    __ARG_1.'emitnull'($S1)
# }
  __label_14: # endif
# }
    goto __label_13
  __label_12: # else
.annotate 'line', 5407
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S1, $P3
  __label_13: # endif
  __label_5: # switch end
.annotate 'line', 5409
    eq __ARG_2, '', __label_15
# {
.annotate 'line', 5410
    self.'annotate'(__ARG_1)
.annotate 'line', 5411
    __ARG_1.'emitarg2'('push', __ARG_2, $S1)
# }
  __label_15: # endif
# }
    goto __label_3
  __label_4: # endfor
# }
  __label_2: # endif
# }
.annotate 'line', 5415

.end # emit_init

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ArrayExpr' ]
.annotate 'line', 5340
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5342
    addattribute $P0, 'values'
.end
.namespace [ 'HashExpr' ]

.sub 'HashExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5427
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5428
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5429
# var keys: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 5430
# var values: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 5431
    $P6 = $P1.'isop'('}')
    isfalse $I1, $P6
    unless $I1 goto __label_1
# {
.annotate 'line', 5432
    __ARG_1.'unget'($P1)
  __label_2: # do
.annotate 'line', 5433
# {
.annotate 'line', 5434
# var key: $P4
.const 'Sub' $P7 = 'WSubId_30'
    $P4 = $P7(__ARG_1, __ARG_2)
.const 'Sub' $P8 = 'WSubId_43'
.annotate 'line', 5435
    $P8(':', __ARG_1)
.annotate 'line', 5436
# var value: $P5
.const 'Sub' $P9 = 'WSubId_30'
    $P5 = $P9(__ARG_1, __ARG_2)
.annotate 'line', 5437
# predefined push
    push $P2, $P4
.annotate 'line', 5438
# predefined push
    push $P3, $P5
# }
  __label_4: # continue
.annotate 'line', 5440
    $P1 = __ARG_1.'get'()
    $P6 = $P1.'isop'(',')
    if_null $P6, __label_3
    if $P6 goto __label_2
  __label_3: # enddo
.annotate 'line', 5441
    $P6 = $P1.'isop'('}')
    isfalse $I1, $P6
    unless $I1 goto __label_5
.const 'Sub' $P10 = 'WSubId_29'
.annotate 'line', 5442
    $P10("',' or '}'", $P1)
  __label_5: # endif
# }
  __label_1: # endif
.annotate 'line', 5444
    setattribute self, 'keys', $P2
.annotate 'line', 5445
    setattribute self, 'values', $P3
# }
.annotate 'line', 5446

.end # HashExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5447
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.const 'Sub' $P1 = 'WSubId_28'
.annotate 'line', 5450
    getattribute $P2, self, 'keys'
    $P1($P2)
.const 'Sub' $P3 = 'WSubId_28'
.annotate 'line', 5451
    getattribute $P2, self, 'values'
    $P3($P2)
.annotate 'line', 5452
    .return(self)
# }
.annotate 'line', 5453

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5456
    self.'annotate'(__ARG_1)
.annotate 'line', 5461
    set $S6, __ARG_2
    eq $S6, '', __label_1
.annotate 'line', 5462
    __ARG_1.'say'('    ', 'root_new ', __ARG_2, ", ['parrot';'Hash']")
  __label_1: # endif
.annotate 'line', 5464
# var keys: $P1
    getattribute $P1, self, 'keys'
.annotate 'line', 5465
# var values: $P2
    getattribute $P2, self, 'values'
.annotate 'line', 5466
# n: $I1
    set $P5, $P1
    set $I1, $P5
# for loop
.annotate 'line', 5467
# i: $I2
    null $I2
  __label_4: # for condition
    ge $I2, $I1, __label_3
# {
.annotate 'line', 5468
# var key: $P3
    $P3 = $P1[$I2]
.annotate 'line', 5469
# item: $S1
    null $S1
.annotate 'line', 5470
    $P5 = $P3.'isidentifier'()
    if_null $P5, __label_5
    unless $P5 goto __label_5
# {
.annotate 'line', 5471
# id: $S2
    $P6 = $P3.'getName'()
    null $S2
    if_null $P6, __label_7
    set $S2, $P6
  __label_7:
.annotate 'line', 5472
    $P5 = self.'tempreg'('P')
    set $S1, $P5
.annotate 'line', 5473
    __ARG_1.'say'('    ', 'get_hll_global ', $S1, ", '", $S2, "'")
# }
    goto __label_6
  __label_5: # else
.annotate 'line', 5476
    $P5 = $P3.'emit_get'(__ARG_1)
    set $S1, $P5
  __label_6: # endif
.annotate 'line', 5478
# var value: $P4
    $P4 = $P2[$I2]
.annotate 'line', 5479
# itemreg: $S3
    null $S3
# switch-case
.annotate 'line', 5481
    $I3 = $P4.'isnull'()
    if $I3 goto __label_10
.annotate 'line', 5487
    $I3 = $P4.'isidentifier'()
    if $I3 goto __label_11
    goto __label_9
  __label_10: # case
.annotate 'line', 5482
    set $S6, __ARG_2
    eq $S6, '', __label_12
# {
.annotate 'line', 5483
    $P5 = self.'tempreg'('P')
    set $S3, $P5
.annotate 'line', 5484
    __ARG_1.'emitnull'($S3)
# }
  __label_12: # endif
    goto __label_8 # break
  __label_11: # case
.annotate 'line', 5488
# s: $S4
    $P5 = $P4.'checkIdentifier'()
    null $S4
    if_null $P5, __label_13
    set $S4, $P5
  __label_13:
.annotate 'line', 5489
    isnull $I3, $S4
    not $I3
    unless $I3 goto __label_16
    isne $I3, $S4, ''
  __label_16:
    unless $I3 goto __label_14
.annotate 'line', 5490
    set $S3, $S4
    goto __label_15
  __label_14: # else
# {
.annotate 'line', 5492
# id: $S5
    $P6 = $P4.'getName'()
    null $S5
    if_null $P6, __label_17
    set $S5, $P6
  __label_17:
.annotate 'line', 5493
    getattribute $P6, self, 'owner'
    $P5 = $P6.'getvar'($S5)
    unless_null $P5, __label_18
# {
.annotate 'line', 5494
    $P7 = self.'tempreg'('P')
    set $S3, $P7
.annotate 'line', 5495
    __ARG_1.'say'('    ', 'get_hll_global ', $S3, ", '", $S5, "'")
# }
    goto __label_19
  __label_18: # else
.annotate 'line', 5498
    $P5 = $P4.'emit_get'(__ARG_1)
    set $S3, $P5
  __label_19: # endif
# }
  __label_15: # endif
    goto __label_8 # break
  __label_9: # default
.annotate 'line', 5502
    $P5 = $P4.'emit_get'(__ARG_1)
    set $S3, $P5
  __label_8: # switch end
.annotate 'line', 5504
    set $S6, __ARG_2
    eq $S6, '', __label_20
.annotate 'line', 5505
    __ARG_1.'say'('    ', __ARG_2, '[', $S1, '] = ', $S3)
  __label_20: # endif
# }
  __label_2: # for iteration
.annotate 'line', 5467
    inc $I2
    goto __label_4
  __label_3: # for end
# }
.annotate 'line', 5507

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5510
# container: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5511
    self.'emit'(__ARG_1, $S1)
.annotate 'line', 5512
    .return($S1)
# }
.annotate 'line', 5513

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'HashExpr' ]
.annotate 'line', 5420
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5422
    addattribute $P0, 'keys'
.annotate 'line', 5423
    addattribute $P0, 'values'
.end
.namespace [ 'NewBaseExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5526
    .return('P')
# }

.end # checkresult


.sub 'parseinitializer' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5531
    new $P3, [ 'ArgumentList' ]
    getattribute $P4, self, 'owner'
    getattribute $P5, self, 'start'
    $P3.'ArgumentList'($P4, $P5, __ARG_1, ')')
    set $P2, $P3
    setattribute self, 'initializer', $P2
# }
.annotate 'line', 5532

.end # parseinitializer


.sub 'optimize_initializer' :method
# Body
# {
.annotate 'line', 5535
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5536
    if_null $P1, __label_1
.annotate 'line', 5537
    $P3 = $P1.'optimize'()
    setattribute self, 'initializer', $P3
  __label_1: # endif
# }
.annotate 'line', 5538

.end # optimize_initializer


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5541
    self.'optimize_initializer'()
.annotate 'line', 5542
    .return(self)
# }
.annotate 'line', 5543

.end # optimize


.sub 'emit_constructor' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5546
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5547
    if_null $P1, __label_1
.annotate 'line', 5548
    $P1.'getargvalues'(__ARG_1)
  __label_1: # endif
.annotate 'line', 5549
    __ARG_1.'print'('    ', __ARG_2, ".'", __ARG_3, "'(")
.annotate 'line', 5550
    if_null $P1, __label_2
.annotate 'line', 5551
    $P1.'emitargs'(__ARG_1)
  __label_2: # endif
.annotate 'line', 5552
    __ARG_1.'say'(")")
# }
.annotate 'line', 5553

.end # emit_constructor

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NewBaseExpr' ]
.annotate 'line', 5518
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5520
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
.annotate 'line', 5564
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5566
    $I2 = __ARG_4.'isstring'()
    if $I2 goto __label_2
    $I2 = __ARG_4.'isidentifier'()
  __label_2:
    not $I1, $I2
    unless $I1 goto __label_1
.const 'Sub' $P2 = 'WSubId_1'
.annotate 'line', 5567
    $P2("Unimplemented", __ARG_4)
  __label_1: # endif
.annotate 'line', 5568
    setattribute self, 'value', __ARG_4
.annotate 'line', 5569
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5571
    $P3 = $P1.'isop'('(')
    if_null $P3, __label_3
    unless $P3 goto __label_3
.annotate 'line', 5572
    self.'parseinitializer'(__ARG_1)
    goto __label_4
  __label_3: # else
.annotate 'line', 5574
    __ARG_1.'unget'($P1)
  __label_4: # endif
# }
.annotate 'line', 5575

.end # NewExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5578
# var value: $P1
    getattribute $P1, self, 'value'
.annotate 'line', 5579
    isa $I1, $P1, [ 'Token' ]
    unless $I1 goto __label_2
    $I1 = $P1.'isidentifier'()
  __label_2:
    unless $I1 goto __label_1
# {
.annotate 'line', 5582
# var desc: $P2
    getattribute $P3, self, 'owner'
    $P4 = $P1.'getidentifier'()
    $P2 = $P3.'getvar'($P4)
.annotate 'line', 5583
    isnull $I1, $P2
    not $I1
    unless $I1 goto __label_4
    $I1 = $P2.'isconst'()
  __label_4:
    unless $I1 goto __label_3
# {
.annotate 'line', 5584
    $P3 = $P2.'getid'()
    unless_null $P3, __label_5
# {
.annotate 'line', 5585
    $P1 = $P2.'getvalue'()
.annotate 'line', 5586
    isa $I2, $P1, [ 'StringLiteral' ]
    not $I1, $I2
    unless $I1 goto __label_7
.const 'Sub' $P5 = 'WSubId_1'
.annotate 'line', 5587
    $P5('Constant value must evaluate to a string', $P1)
  __label_7: # endif
.annotate 'line', 5588
    getattribute $P4, $P1, 'strval'
    setattribute self, 'value', $P4
# }
    goto __label_6
  __label_5: # else
.const 'Sub' $P6 = 'WSubId_1'
.annotate 'line', 5591
    $P6('*Constant value must evaluate to a string', $P1)
  __label_6: # endif
# }
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 5594
    self.'optimize_initializer'()
.annotate 'line', 5595
    .return(self)
# }
.annotate 'line', 5596

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 5599
    self.'annotate'(__ARG_1)
.annotate 'line', 5601
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5602
# numinits: $I1
    unless_null $P1, __label_2
    set $I1, -1
    goto __label_1
  __label_2:
    $I1 = $P1.'numargs'()
  __label_1:
# Constant BYNAME evaluated at compile time
# Constant BYIDENT evaluated at compile time
.annotate 'line', 5605
# type: $I2
    getattribute $P7, self, 'value'
    $P6 = $P7.'isstring'()
    if_null $P6, __label_4
    unless $P6 goto __label_4
    null $I2
    goto __label_3
  __label_4:
.annotate 'line', 5606
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
.annotate 'line', 5608
# reginit: $S1
    set $S1, ''
.annotate 'line', 5609
# regnew: $S2
    set $P6, __ARG_2
    null $S2
    if_null $P6, __label_7
    set $S2, $P6
  __label_7:
.annotate 'line', 5610
# constructor: $S3
    null $S3
# switch
.annotate 'line', 5611
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
.annotate 'line', 5616
    ne $I2, 1, __label_13
# {
.annotate 'line', 5617
    not $I5, __ARG_3
    unless $I5 goto __label_15
.annotate 'line', 5618
    $P6 = self.'tempreg'('P')
    set $S2, $P6
  __label_15: # endif
# }
    goto __label_14
  __label_13: # else
# {
.annotate 'line', 5621
# var initval: $P2
    $P2 = $P1.'getfreearg'(0)
.annotate 'line', 5622
    $P6 = $P2.'emit_get'(__ARG_1)
    set $S1, $P6
.annotate 'line', 5623
    concat $S0, ', ', $S1
    set $S1, $S0
# }
  __label_14: # endif
    goto __label_8 # break
  __label_9: # default
.annotate 'line', 5627
    eq $I2, 1, __label_16
.const 'Sub' $P10 = 'WSubId_1'
.annotate 'line', 5628
    getattribute $P6, self, 'start'
    $P10('Multiple init arguments not allowed here', $P6)
  __label_16: # endif
.annotate 'line', 5629
    not $I3, __ARG_3
    unless $I3 goto __label_17
.annotate 'line', 5630
    $P7 = self.'tempreg'('P')
    set $S2, $P7
  __label_17: # endif
  __label_8: # switch end
# switch
.annotate 'line', 5633
    set $I3, $I2
    null $I4
    if $I3 == $I4 goto __label_20
    set $I4, 1
    if $I3 == $I4 goto __label_21
    goto __label_19
  __label_20: # case
.annotate 'line', 5636
# name: $S4
    getattribute $P7, self, 'value'
    $P6 = $P7.'rawstring'()
    null $S4
    if_null $P6, __label_22
    set $S4, $P6
  __label_22:
.annotate 'line', 5637
# var aux: $P3
# predefined get_class
    get_class $P3, $S4
.annotate 'line', 5638
    isnull $I5, $P3
    unless $I5 goto __label_24
    $I5 = self.'dowarnings'()
  __label_24:
    unless $I5 goto __label_23
.const 'Sub' $P11 = 'WSubId_54'
.annotate 'line', 5639
    concat $S5, "Can't locate class ", $S4
    concat $S5, $S5, " at compile time"
    getattribute $P8, self, 'value'
    $P11($S5, $P8)
  __label_23: # endif
.annotate 'line', 5643
    getattribute $P9, self, 'value'
    __ARG_1.'say'('    ', 'new ', $S2, ", [ ", $P9, " ]", $S1)
.annotate 'line', 5644
    le $I1, 1, __label_25
# {
.annotate 'line', 5645
    getattribute $P12, self, 'value'
    __ARG_1.'say'($S2, ".'", $P12, "'()")
# }
  __label_25: # endif
    goto __label_18 # break
  __label_21: # case
.annotate 'line', 5649
# var id: $P4
    getattribute $P6, self, 'owner'
    getattribute $P7, self, 'value'
    $P4 = $P6.'getvar'($P7)
.annotate 'line', 5650
    unless_null $P4, __label_26
# {
.annotate 'line', 5652
# var cl: $P5
    getattribute $P8, self, 'owner'
    getattribute $P9, self, 'value'
    $P5 = $P8.'checkclass'($P9)
.annotate 'line', 5653
    if_null $P5, __label_28
# {
.annotate 'line', 5654
    $P6 = $P5.'getclasskey'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P6, $S1)
# }
    goto __label_29
  __label_28: # else
# {
.annotate 'line', 5657
    $P6 = self.'dowarnings'()
    if_null $P6, __label_30
    unless $P6 goto __label_30
.const 'Sub' $P13 = 'WSubId_54'
.annotate 'line', 5658
    $P13('Checking: new unknown type')
  __label_30: # endif
.annotate 'line', 5659
    getattribute $P6, self, 'value'
    __ARG_1.'say'('    ', 'new ', $S2, ", ['", $P6, "']", $S1)
# }
  __label_29: # endif
.annotate 'line', 5661
    getattribute $P6, self, 'value'
    set $S3, $P6
# }
    goto __label_27
  __label_26: # else
# {
.annotate 'line', 5665
    $P6 = $P4.'getreg'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P6, "", $S1)
# }
  __label_27: # endif
    goto __label_18 # break
  __label_19: # default
.annotate 'line', 5667
.const 'Sub' $P14 = 'WSubId_6'
.annotate 'line', 5669
    $P14('Unexpected type in new')
  __label_18: # switch end
.annotate 'line', 5671
    isgt $I3, $I1, 1
    if $I3 goto __label_32
    isge $I3, $I1, 0
    unless $I3 goto __label_33
    iseq $I3, $I2, 1
  __label_33:
  __label_32:
    unless $I3 goto __label_31
# {
.annotate 'line', 5672
    self.'emit_constructor'(__ARG_1, $S2, $S3)
.annotate 'line', 5673
    not $I3, __ARG_3
    unless $I3 goto __label_34
.annotate 'line', 5674
    __ARG_1.'emitset'(__ARG_2, $S2)
  __label_34: # endif
# }
  __label_31: # endif
# }
.annotate 'line', 5676

.end # emit


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5679
    .tailcall self.'emit'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 5680

.end # emit_init

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NewExpr' ]
.annotate 'line', 5558
    get_class $P1, [ 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 5560
    addattribute $P0, 'value'
.end
.namespace [ 'NewIndexedExpr' ]

.sub 'NewIndexedExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5691
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5692
    setattribute self, 'owner', __ARG_2
.annotate 'line', 5693
# var nskey: $P1
    new $P1, [ 'ClassSpecifierParrotKey' ]
    $P1.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5694
    setattribute self, 'nskey', $P1
.annotate 'line', 5695
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 5696
    $P3 = $P2.'isop'('(')
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 5697
    self.'parseinitializer'(__ARG_1)
    goto __label_2
  __label_1: # else
.annotate 'line', 5699
    __ARG_1.'unget'($P2)
  __label_2: # endif
# }
.annotate 'line', 5700

.end # NewIndexedExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5703
# reginit: $S1
    null $S1
.annotate 'line', 5704
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5705
# numinits: $I1
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
    $I1 = $P1.'numargs'()
  __label_1:
# switch
.annotate 'line', 5706
    set $I2, $I1
    null $I3
    if $I2 == $I3 goto __label_5
    set $I3, 1
    if $I2 == $I3 goto __label_6
    goto __label_4
  __label_5: # case
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 5710
# var initval: $P2
    $P2 = $P1.'getfreearg'(0)
.annotate 'line', 5711
    $P4 = $P2.'emit_get'(__ARG_1)
    set $S1, $P4
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 5712
.const 'Sub' $P5 = 'WSubId_1'
.annotate 'line', 5714
    getattribute $P6, self, 'start'
    $P5('Multiple init arguments not allowed here', $P6)
  __label_3: # switch end
.annotate 'line', 5716
# var nskey: $P3
    getattribute $P3, self, 'nskey'
.annotate 'line', 5717
    __ARG_1.'print'('    ')
.annotate 'line', 5718
    $P4 = $P3.'hasHLL'()
    if_null $P4, __label_7
    unless $P4 goto __label_7
.annotate 'line', 5719
    __ARG_1.'print'("root_")
  __label_7: # endif
.annotate 'line', 5720
    __ARG_1.'print'("new ", __ARG_2, ", ")
.annotate 'line', 5721
    null $P4
    $P3.'emit'(__ARG_1, $P4)
.annotate 'line', 5722
    if_null $S1, __label_8
.annotate 'line', 5723
    __ARG_1.'print'(', ', $S1)
  __label_8: # endif
.annotate 'line', 5724
    __ARG_1.'say'()
# }
.annotate 'line', 5725

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NewIndexedExpr' ]
.annotate 'line', 5685
    get_class $P1, [ 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 5687
    addattribute $P0, 'nskey'
.end
.namespace [ 'NewQualifiedExpr' ]

.sub 'NewQualifiedExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5736
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5737
    setattribute self, 'owner', __ARG_2
.annotate 'line', 5738
# var nskey: $P1
    new $P1, [ 'ClassSpecifierId' ]
    $P1.'ClassSpecifierId'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5739
    setattribute self, 'nskey', $P1
.annotate 'line', 5740
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 5741
    $P3 = $P2.'isop'('(')
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 5742
    self.'parseinitializer'(__ARG_1)
    goto __label_2
  __label_1: # else
.annotate 'line', 5744
    __ARG_1.'unget'($P2)
  __label_2: # endif
# }
.annotate 'line', 5745

.end # NewQualifiedExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5748
# reginit: $S1
    null $S1
.annotate 'line', 5749
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5751
# numinits: $I1
    unless_null $P1, __label_2
    set $I1, -1
    goto __label_1
  __label_2:
    $I1 = $P1.'numargs'()
  __label_1:
.annotate 'line', 5752
# regnew: $S2
    set $P3, __ARG_2
    null $S2
    if_null $P3, __label_3
    set $S2, $P3
  __label_3:
.annotate 'line', 5753
    le $I1, 0, __label_4
.annotate 'line', 5754
    $P3 = self.'tempreg'('P')
    set $S2, $P3
  __label_4: # endif
.annotate 'line', 5755
# var nskey: $P2
    getattribute $P2, self, 'nskey'
.annotate 'line', 5756
    __ARG_1.'print'('    ', 'new ', $S2, ", ")
.annotate 'line', 5757
    getattribute $P3, self, 'owner'
    $P2.'emit'(__ARG_1, $P3)
.annotate 'line', 5758
    __ARG_1.'say'()
.annotate 'line', 5760
    lt $I1, 0, __label_5
# {
.annotate 'line', 5761
# constructor: $S3
    $P3 = $P2.'last'()
    null $S3
    if_null $P3, __label_6
    set $S3, $P3
  __label_6:
.annotate 'line', 5762
    self.'emit_constructor'(__ARG_1, $S2, $S3)
.annotate 'line', 5763
    __ARG_1.'emitset'(__ARG_2, $S2)
# }
  __label_5: # endif
# }
.annotate 'line', 5765

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NewQualifiedExpr' ]
.annotate 'line', 5730
    get_class $P1, [ 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 5732
    addattribute $P0, 'nskey'
.end
.namespace [ ]

.sub 'parseNew' :subid('WSubId_55')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5772
# var t: $P1
    $P1 = __ARG_1.'get'()
# switch-case
.annotate 'line', 5775
    $I1 = $P1.'isop'('(')
    if $I1 goto __label_3
.annotate 'line', 5779
    $I1 = $P1.'isop'('[')
    if $I1 goto __label_4
.annotate 'line', 5782
    $I1 = $P1.'isidentifier'()
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 5777
    new $P4, [ 'CallExpr' ]
.annotate 'line', 5778
    new $P6, [ 'StringLiteral' ]
    $P6.'StringLiteral'(__ARG_2, __ARG_3)
    set $P5, $P6
    $P4.'CallExpr'(__ARG_1, __ARG_2, __ARG_3, $P5)
    set $P3, $P4
.annotate 'line', 5777
    .return($P3)
  __label_4: # case
.annotate 'line', 5781
    new $P8, [ 'NewIndexedExpr' ]
    $P8.'NewIndexedExpr'(__ARG_1, __ARG_2, __ARG_3)
    set $P7, $P8
    .return($P7)
  __label_5: # case
.annotate 'line', 5785
# var t2: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 5786
    __ARG_1.'unget'($P2)
.annotate 'line', 5787
    $P9 = $P2.'isop'('.')
    if_null $P9, __label_6
    unless $P9 goto __label_6
# {
.annotate 'line', 5789
    new $P11, [ 'NewQualifiedExpr' ]
    $P11.'NewQualifiedExpr'(__ARG_1, __ARG_2, $P1)
    set $P10, $P11
    .return($P10)
# }
  __label_6: # endif
  __label_2: # default
.annotate 'line', 5794
    new $P4, [ 'NewExpr' ]
    $P4.'NewExpr'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P3, $P4
    .return($P3)
  __label_1: # switch end
# }
.annotate 'line', 5796

.end # parseNew

.namespace [ 'OpInstanceOfExpr' ]

.sub 'OpInstanceOfExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 5807
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5808
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 5809
.const 'Sub' $P3 = 'WSubId_48'
    $P2 = $P3(__ARG_4, self)
    setattribute self, 'checked', $P2
# }
.annotate 'line', 5810

.end # OpInstanceOfExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5813
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 5814
    .return(self)
# }
.annotate 'line', 5815

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5816
    .return('I')
# }

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5819
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5820
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 5821
    eq $S1, 'P', __label_2
.const 'Sub' $P4 = 'WSubId_1'
.annotate 'line', 5822
    getattribute $P3, $P1, 'start'
    $P4('Invalid instanceof left operand', $P3)
  __label_2: # endif
.annotate 'line', 5823
# var checked: $P2
    getattribute $P2, self, 'checked'
.annotate 'line', 5825
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
.annotate 'line', 5826
# check: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_6
    set $S3, $P3
  __label_6:
.annotate 'line', 5827
    self.'annotate'(__ARG_1)
.annotate 'line', 5828
    __ARG_1.'print'('    isa ', $S2, ', ', $S3, ', ')
.annotate 'line', 5829
    getattribute $P3, self, 'owner'
    $P2.'emit'(__ARG_1, $P3)
.annotate 'line', 5830
    __ARG_1.'say'()
# }
.annotate 'line', 5831

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpInstanceOfExpr' ]
.annotate 'line', 5800
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5802
    addattribute $P0, 'lexpr'
.annotate 'line', 5803
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
.annotate 'line', 5848
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5849
    new $P3, [ 'Condition' ]
    $P2 = $P3.'set'(__ARG_3)
    setattribute self, 'condition', $P2
.annotate 'line', 5850
    setattribute self, 'etrue', __ARG_4
.annotate 'line', 5851
    setattribute self, 'efalse', __ARG_5
.annotate 'line', 5852
    .return(self)
# }
.annotate 'line', 5853

.end # OpConditionalExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5856
    getattribute $P3, self, 'condition'
    $P2 = $P3.'optimize'()
    setattribute self, 'condition', $P2
# switch
.annotate 'line', 5857
    getattribute $P2, self, 'condition'
    $P1 = $P2.'getvalue'()
    set $I1, $P1
    set $I2, 1
    if $I1 == $I2 goto __label_3
    set $I2, 2
    if $I1 == $I2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 5859
    getattribute $P3, self, 'etrue'
    .tailcall $P3.'optimize'()
  __label_4: # case
.annotate 'line', 5861
    getattribute $P4, self, 'efalse'
    .tailcall $P4.'optimize'()
  __label_2: # default
.annotate 'line', 5863
    getattribute $P7, self, 'etrue'
    $P6 = $P7.'optimize'()
    setattribute self, 'etrue', $P6
.annotate 'line', 5864
    getattribute $P10, self, 'efalse'
    $P9 = $P10.'optimize'()
    setattribute self, 'efalse', $P9
.annotate 'line', 5865
    .return(self)
  __label_1: # switch end
# }
.annotate 'line', 5867

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5870
# var etrue: $P1
    getattribute $P1, self, 'etrue'
.annotate 'line', 5871
    $P2 = $P1.'isnull'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 5872
    getattribute $P3, self, 'efalse'
    .tailcall $P3.'checkresult'()
    goto __label_2
  __label_1: # else
.annotate 'line', 5874
    .tailcall $P1.'checkresult'()
  __label_2: # endif
# }
.annotate 'line', 5875

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5878
# cond_end: $S1
    getattribute $P4, self, 'owner'
    $P3 = $P4.'genlabel'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 5879
# cond_false: $S2
    getattribute $P4, self, 'owner'
    $P3 = $P4.'genlabel'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 5880
    getattribute $P3, self, 'condition'
    $P3.'emit_else'(__ARG_1, $S2)
.annotate 'line', 5881
# var etrue: $P1
    getattribute $P1, self, 'etrue'
.annotate 'line', 5882
    $P3 = $P1.'isnull'()
    if_null $P3, __label_3
    unless $P3 goto __label_3
.annotate 'line', 5883
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_4
  __label_3: # else
.annotate 'line', 5885
    $P1.'emit'(__ARG_1, __ARG_2)
  __label_4: # endif
.annotate 'line', 5886
    __ARG_1.'emitgoto'($S1)
.annotate 'line', 5887
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 5888
# var efalse: $P2
    getattribute $P2, self, 'efalse'
.annotate 'line', 5889
    $P3 = $P2.'isnull'()
    if_null $P3, __label_5
    unless $P3 goto __label_5
.annotate 'line', 5890
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_6
  __label_5: # else
.annotate 'line', 5892
    $P2.'emit'(__ARG_1, __ARG_2)
  __label_6: # endif
.annotate 'line', 5893
    __ARG_1.'emitlabel'($S1)
# }
.annotate 'line', 5894

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpConditionalExpr' ]
.annotate 'line', 5836
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5842
    addattribute $P0, 'condition'
.annotate 'line', 5843
    addattribute $P0, 'etrue'
.annotate 'line', 5844
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

.sub 'getOpCode_2' :subid('WSubId_57')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 5938
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
.annotate 'line', 5939
    .return(1)
  __label_4: # case
.annotate 'line', 5940
    .return(2)
  __label_5: # case
.annotate 'line', 5941
    .return(3)
  __label_2: # default
.annotate 'line', 5942
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 5944

.end # getOpCode_2


.sub 'getOpCode_4' :subid('WSubId_59')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 5948
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
.annotate 'line', 5949
    .return(8)
  __label_4: # case
.annotate 'line', 5950
    .return(11)
  __label_5: # case
.annotate 'line', 5951
    .return(9)
  __label_6: # case
.annotate 'line', 5952
    .return(10)
  __label_2: # default
.annotate 'line', 5954
    $P2 = __ARG_1.'iskeyword'('delete')
    if_null $P2, __label_7
    unless $P2 goto __label_7
    .return(31)
    goto __label_8
  __label_7: # else
.annotate 'line', 5955
    $P3 = __ARG_1.'iskeyword'('exists')
    if_null $P3, __label_9
    unless $P3 goto __label_9
    .return(32)
    goto __label_10
  __label_9: # else
.annotate 'line', 5956
    .return(0)
  __label_10: # endif
  __label_8: # endif
  __label_1: # switch end
# }
.annotate 'line', 5958

.end # getOpCode_4


.sub 'getOpCode_5' :subid('WSubId_62')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 5962
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
.annotate 'line', 5963
    .return(19)
  __label_4: # case
.annotate 'line', 5964
    .return(20)
  __label_5: # case
.annotate 'line', 5965
    .return(21)
  __label_6: # case
.annotate 'line', 5966
    .return(22)
  __label_2: # default
.annotate 'line', 5967
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 5969

.end # getOpCode_5


.sub 'getOpCode_7' :subid('WSubId_65')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 5973
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    set $S2, '<<'
    if $S1 == $S2 goto __label_3
    set $S2, '>>'
    if $S1 == $S2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 5974
    .return(28)
  __label_4: # case
.annotate 'line', 5975
    .return(29)
  __label_2: # default
.annotate 'line', 5976
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 5978

.end # getOpCode_7


.sub 'getOpCode_8' :subid('WSubId_67')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 5982
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
.annotate 'line', 5983
    .return(14)
  __label_4: # case
.annotate 'line', 5984
    .return(16)
  __label_5: # case
.annotate 'line', 5985
    .return(15)
  __label_6: # case
.annotate 'line', 5986
    .return(17)
  __label_2: # default
.annotate 'line', 5988
    $P2 = __ARG_1.'iskeyword'('instanceof')
    if_null $P2, __label_7
    unless $P2 goto __label_7
    .return(27)
    goto __label_8
  __label_7: # else
.annotate 'line', 5989
    .return(0)
  __label_8: # endif
  __label_1: # switch end
# }
.annotate 'line', 5991

.end # getOpCode_8


.sub 'getOpCode_9' :subid('WSubId_69')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 5995
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
.annotate 'line', 5996
    .return(12)
  __label_4: # case
.annotate 'line', 5997
    .return(13)
  __label_5: # case
.annotate 'line', 5998
    .return(25)
  __label_6: # case
.annotate 'line', 5999
    .return(26)
  __label_2: # default
.annotate 'line', 6000
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6002

.end # getOpCode_9


.sub 'getOpCode_16' :subid('WSubId_78')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6006
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
.annotate 'line', 6007
    .return(4)
  __label_4: # case
.annotate 'line', 6008
    .return(5)
  __label_5: # case
.annotate 'line', 6009
    .return(6)
  __label_6: # case
.annotate 'line', 6010
    .return(18)
  __label_7: # case
.annotate 'line', 6011
    .return(23)
  __label_8: # case
.annotate 'line', 6012
    .return(24)
  __label_9: # case
.annotate 'line', 6013
    .return(30)
  __label_2: # default
.annotate 'line', 6014
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6016

.end # getOpCode_16


.sub 'parseExpr_0' :subid('WSubId_56')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6020
.const 'Sub' $P3 = 'parseExpr'
.annotate 'line', 6022
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 6023
# var expr: $P2
    null $P2
# switch-case
.annotate 'line', 6026
    $I1 = $P1.'isop'('(')
    if $I1 goto __label_3
.annotate 'line', 6030
    $I1 = $P1.'isop'('[')
    if $I1 goto __label_4
.annotate 'line', 6032
    $I1 = $P1.'isop'('{')
    if $I1 goto __label_5
.annotate 'line', 6034
    $I1 = $P1.'isstring'()
    if $I1 goto __label_6
.annotate 'line', 6036
    $I1 = $P1.'isint'()
    if $I1 goto __label_7
.annotate 'line', 6038
    $I1 = $P1.'isfloat'()
    if $I1 goto __label_8
.annotate 'line', 6040
    $I1 = $P1.'iskeyword'('new')
    if $I1 goto __label_9
.annotate 'line', 6042
    $I1 = $P1.'iskeyword'('function')
    if $I1 goto __label_10
.annotate 'line', 6044
    $I1 = $P1.'iskeyword'('class')
    if $I1 goto __label_11
.annotate 'line', 6046
    $I1 = $P1.'isidentifier'()
    if $I1 goto __label_12
    goto __label_2
  __label_3: # case
.annotate 'line', 6027
.const 'Sub' $P4 = 'WSubId_30'
    $P2 = $P4(__ARG_1, __ARG_2)
.const 'Sub' $P5 = 'WSubId_43'
.annotate 'line', 6028
    $P5(')', __ARG_1)
.annotate 'line', 6029
    .return($P2)
  __label_4: # case
.annotate 'line', 6031
    new $P7, [ 'ArrayExpr' ]
    $P7.'ArrayExpr'(__ARG_1, __ARG_2, $P1)
    set $P6, $P7
    .return($P6)
  __label_5: # case
.annotate 'line', 6033
    new $P9, [ 'HashExpr' ]
    $P9.'HashExpr'(__ARG_1, __ARG_2, $P1)
    set $P8, $P9
    .return($P8)
  __label_6: # case
.annotate 'line', 6035
    new $P11, [ 'StringLiteral' ]
    $P11.'StringLiteral'(__ARG_2, $P1)
    set $P10, $P11
    .return($P10)
  __label_7: # case
.annotate 'line', 6037
    new $P13, [ 'IntegerLiteral' ]
    $P13.'IntegerLiteral'(__ARG_2, $P1)
    set $P12, $P13
    .return($P12)
  __label_8: # case
.annotate 'line', 6039
    new $P15, [ 'FloatLiteral' ]
    $P15.'FloatLiteral'(__ARG_2, $P1)
    set $P14, $P15
    .return($P14)
  __label_9: # case
.annotate 'line', 6041
.const 'Sub' $P16 = 'WSubId_55'
    .tailcall $P16(__ARG_1, __ARG_2, $P1)
  __label_10: # case
.annotate 'line', 6043
    new $P18, [ 'FunctionExpr' ]
    $P18.'FunctionExpr'(__ARG_1, __ARG_2, $P1)
    set $P17, $P18
    .return($P17)
  __label_11: # case
.annotate 'line', 6045
    new $P20, [ 'OpClassExpr' ]
    $P20.'OpClassExpr'(__ARG_1, __ARG_2, $P1)
    set $P19, $P20
    .return($P19)
  __label_12: # case
.annotate 'line', 6047
    new $P22, [ 'IdentifierExpr' ]
    $P22.'IdentifierExpr'(__ARG_2, $P1)
    set $P21, $P22
    .return($P21)
  __label_2: # default
.const 'Sub' $P23 = 'WSubId_29'
.annotate 'line', 6049
    $P23('expression', $P1)
  __label_1: # switch end
# }
.annotate 'line', 6051

.end # parseExpr_0


.sub 'parseExpr_2' :subid('WSubId_58')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6055
.const 'Sub' $P5 = 'parseExpr_0'
.const 'Sub' $P6 = 'getOpCode_2'
.annotate 'line', 6057
# var subexp: $P1
.const 'Sub' $P7 = 'WSubId_56'
    $P1 = $P7(__ARG_1, __ARG_2)
.annotate 'line', 6058
# var t: $P2
    null $P2
.annotate 'line', 6059
# var start: $P3
    null $P3
.annotate 'line', 6060
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6061
.const 'Sub' $P9 = 'WSubId_57'
    $P2 = __ARG_1.'get'()
    $P8 = $P9($P2)
    set $I1, $P8
    eq $I1, 0, __label_1
# {
# switch
.annotate 'line', 6062
    set $I2, $I1
    set $I3, 1
    if $I2 == $I3 goto __label_5
    set $I3, 2
    if $I2 == $I3 goto __label_6
    set $I3, 3
    if $I2 == $I3 goto __label_7
    goto __label_4
  __label_5: # case
.annotate 'line', 6064
    new $P10, [ 'CallExpr' ]
    $P10.'CallExpr'(__ARG_1, __ARG_2, $P2, $P1)
    set $P1, $P10
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6067
    new $P11, [ 'IndexExpr' ]
    $P11.'IndexExpr'(__ARG_1, __ARG_2, $P2, $P1)
    set $P1, $P11
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6070
    set $P3, $P2
.annotate 'line', 6071
    $P2 = __ARG_1.'get'()
.annotate 'line', 6072
    $P12 = $P2.'isop'('*')
    if_null $P12, __label_8
    unless $P12 goto __label_8
# {
.annotate 'line', 6073
# var right: $P4
.const 'Sub' $P13 = 'WSubId_56'
    $P4 = $P13(__ARG_1, __ARG_2)
.annotate 'line', 6074
    new $P8, [ 'MemberRefExpr' ]
    $P8.'MemberRefExpr'(__ARG_2, $P2, $P1, $P4)
    set $P1, $P8
# }
    goto __label_9
  __label_8: # else
.annotate 'line', 6077
    new $P8, [ 'MemberExpr' ]
    $P8.'MemberExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P8
  __label_9: # endif
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6078
.const 'Sub' $P14 = 'WSubId_6'
.annotate 'line', 6080
    $P14('Unexpected code in parseExpr_2')
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6083
    __ARG_1.'unget'($P2)
.annotate 'line', 6084
    .return($P1)
# }
.annotate 'line', 6085

.end # parseExpr_2


.sub 'parseExpr_3' :subid('WSubId_61')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6089
.const 'Sub' $P3 = 'parseExpr_2'
.annotate 'line', 6091
# var subexp: $P1
.const 'Sub' $P4 = 'WSubId_58'
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6092
# var t: $P2
    $P2 = __ARG_1.'get'()
# switch-case
.annotate 'line', 6094
    $I1 = $P2.'isop'('++')
    if $I1 goto __label_3
.annotate 'line', 6096
    $I1 = $P2.'isop'('--')
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6095
    new $P6, [ 'OpPostIncExpr' ]
    $P6.'OpPostIncExpr'(__ARG_2, $P2, $P1)
    set $P5, $P6
    .return($P5)
  __label_4: # case
.annotate 'line', 6097
    new $P8, [ 'OpPostDecExpr' ]
    $P8.'OpPostDecExpr'(__ARG_2, $P2, $P1)
    set $P7, $P8
    .return($P7)
  __label_2: # default
.annotate 'line', 6099
    __ARG_1.'unget'($P2)
.annotate 'line', 6100
    .return($P1)
  __label_1: # switch end
# }
.annotate 'line', 6102

.end # parseExpr_3


.sub 'parseExpr_4' :subid('WSubId_60')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6106
.const 'Sub' $P3 = 'parseExpr_4'
.const 'Sub' $P4 = 'parseExpr_3'
.const 'Sub' $P5 = 'getOpCode_4'
.annotate 'line', 6108
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 6109
# code: $I1
.const 'Sub' $P7 = 'WSubId_59'
    $P6 = $P7($P1)
    set $I1, $P6
.annotate 'line', 6110
    eq $I1, 0, __label_1
# {
.annotate 'line', 6111
# var subexpr: $P2
.const 'Sub' $P8 = 'WSubId_60'
    $P2 = $P8(__ARG_1, __ARG_2)
# switch
.annotate 'line', 6112
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
.annotate 'line', 6114
    new $P9, [ 'OpUnaryMinusExpr' ]
    $P9.'OpUnaryMinusExpr'(__ARG_2, $P1, $P2)
    set $P6, $P9
    .return($P6)
  __label_6: # case
.annotate 'line', 6116
    new $P11, [ 'OpNotExpr' ]
    $P11.'OpNotExpr'(__ARG_2, $P1, $P2)
    set $P10, $P11
    .return($P10)
  __label_7: # case
.annotate 'line', 6118
    new $P13, [ 'OpPreIncExpr' ]
    $P13.'OpPreIncExpr'(__ARG_2, $P1, $P2)
    set $P12, $P13
    .return($P12)
  __label_8: # case
.annotate 'line', 6120
    new $P15, [ 'OpPreDecExpr' ]
    $P15.'OpPreDecExpr'(__ARG_2, $P1, $P2)
    set $P14, $P15
    .return($P14)
  __label_9: # case
.annotate 'line', 6122
    new $P17, [ 'OpDeleteExpr' ]
    $P17.'OpDeleteExpr'(__ARG_2, $P1, $P2)
    set $P16, $P17
    .return($P16)
  __label_10: # case
.annotate 'line', 6124
    new $P19, [ 'OpExistsExpr' ]
    $P19.'OpExistsExpr'(__ARG_2, $P1, $P2)
    set $P18, $P19
    .return($P18)
  __label_4: # default
.const 'Sub' $P20 = 'WSubId_6'
.annotate 'line', 6126
    $P20('Invalid code in parseExpr_4', $P1)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 6130
    __ARG_1.'unget'($P1)
.annotate 'line', 6131
.const 'Sub' $P21 = 'WSubId_61'
    .tailcall $P21(__ARG_1, __ARG_2)
# }
  __label_2: # endif
# }
.annotate 'line', 6133

.end # parseExpr_4


.sub 'parseExpr_5' :subid('WSubId_63')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6137
.const 'Sub' $P4 = 'parseExpr_4'
.const 'Sub' $P5 = 'getOpCode_5'
.annotate 'line', 6139
# var lexpr: $P1
.const 'Sub' $P6 = 'WSubId_60'
    $P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 6140
# var t: $P2
    null $P2
.annotate 'line', 6141
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6142
.const 'Sub' $P8 = 'WSubId_62'
    $P2 = __ARG_1.'get'()
    $P7 = $P8($P2)
    set $I1, $P7
    eq $I1, 0, __label_1
# {
.annotate 'line', 6143
# var rexpr: $P3
.const 'Sub' $P9 = 'WSubId_60'
    $P3 = $P9(__ARG_1, __ARG_2)
# switch
.annotate 'line', 6144
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
.annotate 'line', 6146
    new $P7, [ 'OpMulExpr' ]
    $P7.'OpMulExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P7
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6149
    new $P10, [ 'OpDivExpr' ]
    $P10.'OpDivExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P10
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6152
    new $P11, [ 'OpModExpr' ]
    $P11.'OpModExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P11
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 6155
    new $P12, [ 'OpCModExpr' ]
    $P12.'OpCModExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P12
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6156
.const 'Sub' $P13 = 'WSubId_6'
.annotate 'line', 6158
    $P13('Invalid code in parseExpr_5', $P2)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6161
    __ARG_1.'unget'($P2)
.annotate 'line', 6162
    .return($P1)
# }
.annotate 'line', 6163

.end # parseExpr_5


.sub 'parseExpr_6' :subid('WSubId_64')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6167
.const 'Sub' $P5 = 'parseExpr_5'
.annotate 'line', 6169
# var lexpr: $P1
.const 'Sub' $P6 = 'WSubId_63'
    $P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 6170
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6171
    $P2 = __ARG_1.'get'()
    $I1 = $P2.'isop'('+')
    if $I1 goto __label_3
    $I1 = $P2.'isop'('-')
  __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 6172
# var rexpr: $P3
.const 'Sub' $P7 = 'WSubId_63'
    $P3 = $P7(__ARG_1, __ARG_2)
.annotate 'line', 6173
# var expr: $P4
    null $P4
.annotate 'line', 6174
    $P8 = $P2.'isop'('+')
    if_null $P8, __label_4
    unless $P8 goto __label_4
.annotate 'line', 6175
    new $P9, [ 'OpAddExpr' ]
    $P9.'OpAddExpr'(__ARG_2, $P2, $P1, $P3)
    set $P4, $P9
    goto __label_5
  __label_4: # else
.annotate 'line', 6177
    new $P10, [ 'OpSubExpr' ]
    $P10.'OpSubExpr'(__ARG_2, $P2, $P1, $P3)
    set $P4, $P10
  __label_5: # endif
.annotate 'line', 6178
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6180
    __ARG_1.'unget'($P2)
.annotate 'line', 6181
    .return($P1)
# }
.annotate 'line', 6182

.end # parseExpr_6


.sub 'parseExpr_7' :subid('WSubId_66')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6186
.const 'Sub' $P4 = 'parseExpr_6'
.annotate 'line', 6188
# var lexpr: $P1
.const 'Sub' $P5 = 'WSubId_64'
    $P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6189
# var rexpr: $P2
    null $P2
.annotate 'line', 6190
# var t: $P3
    null $P3
.annotate 'line', 6191
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6192
.const 'Sub' $P7 = 'WSubId_65'
    $P3 = __ARG_1.'get'()
    $P6 = $P7($P3)
    set $I1, $P6
    eq $I1, 0, __label_1
# {
# switch
.annotate 'line', 6193
    set $I2, $I1
    set $I3, 28
    if $I2 == $I3 goto __label_5
    set $I3, 29
    if $I2 == $I3 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 6195
.const 'Sub' $P8 = 'WSubId_64'
    $P2 = $P8(__ARG_1, __ARG_2)
.annotate 'line', 6196
    new $P9, [ 'OpShiftleftExpr' ]
    $P9.'OpShiftleftExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P9
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6199
.const 'Sub' $P10 = 'WSubId_64'
    $P2 = $P10(__ARG_1, __ARG_2)
.annotate 'line', 6200
    new $P11, [ 'OpShiftrightExpr' ]
    $P11.'OpShiftrightExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P11
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6201
.const 'Sub' $P12 = 'WSubId_6'
.annotate 'line', 6203
    $P12('Invalid code in parseExpr_7', $P3)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6206
    __ARG_1.'unget'($P3)
.annotate 'line', 6207
    .return($P1)
# }
.annotate 'line', 6208

.end # parseExpr_7


.sub 'parseExpr_8' :subid('WSubId_68')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6212
.const 'Sub' $P4 = 'parseExpr_7'
.const 'Sub' $P5 = 'getOpCode_8'
.annotate 'line', 6214
# var lexpr: $P1
.const 'Sub' $P6 = 'WSubId_66'
    $P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 6215
# var rexpr: $P2
    null $P2
.annotate 'line', 6216
# var t: $P3
    null $P3
.annotate 'line', 6217
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6218
.const 'Sub' $P8 = 'WSubId_67'
    $P3 = __ARG_1.'get'()
    $P7 = $P8($P3)
    set $I1, $P7
    eq $I1, 0, __label_1
# {
# switch
.annotate 'line', 6219
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
.annotate 'line', 6221
.const 'Sub' $P9 = 'WSubId_66'
    $P2 = $P9(__ARG_1, __ARG_2)
.annotate 'line', 6222
    new $P10, [ 'OpLessExpr' ]
    $P1 = $P10.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6225
.const 'Sub' $P11 = 'WSubId_66'
    $P2 = $P11(__ARG_1, __ARG_2)
.annotate 'line', 6226
    new $P12, [ 'OpGreaterExpr' ]
    $P1 = $P12.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6229
.const 'Sub' $P13 = 'WSubId_66'
    $P2 = $P13(__ARG_1, __ARG_2)
.annotate 'line', 6230
    new $P14, [ 'OpLessEqualExpr' ]
    $P1 = $P14.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 6233
.const 'Sub' $P15 = 'WSubId_66'
    $P2 = $P15(__ARG_1, __ARG_2)
.annotate 'line', 6234
    new $P16, [ 'OpGreaterEqualExpr' ]
    $P1 = $P16.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_9: # case
.annotate 'line', 6237
    new $P17, [ 'OpInstanceOfExpr' ]
    $P17.'OpInstanceOfExpr'(__ARG_2, $P3, $P1, __ARG_1)
    set $P1, $P17
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6238
.const 'Sub' $P18 = 'WSubId_6'
.annotate 'line', 6240
    $P18('Invalid code in parseExpr_9', $P3)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6243
    __ARG_1.'unget'($P3)
.annotate 'line', 6244
    .return($P1)
# }
.annotate 'line', 6245

.end # parseExpr_8


.sub 'parseExpr_9' :subid('WSubId_70')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6249
.const 'Sub' $P4 = 'parseExpr_8'
.const 'Sub' $P5 = 'getOpCode_9'
.annotate 'line', 6251
# var lexpr: $P1
.const 'Sub' $P6 = 'WSubId_68'
    $P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 6252
# var rexpr: $P2
    null $P2
.annotate 'line', 6253
# var t: $P3
    null $P3
.annotate 'line', 6254
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6255
.const 'Sub' $P8 = 'WSubId_69'
    $P3 = __ARG_1.'get'()
    $P7 = $P8($P3)
    set $I1, $P7
    eq $I1, 0, __label_1
# {
# switch
.annotate 'line', 6256
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
.annotate 'line', 6258
.const 'Sub' $P9 = 'WSubId_68'
    $P2 = $P9(__ARG_1, __ARG_2)
.annotate 'line', 6259
    new $P10, [ 'OpEqualExpr' ]
    $P1 = $P10.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6262
.const 'Sub' $P11 = 'WSubId_68'
    $P2 = $P11(__ARG_1, __ARG_2)
.annotate 'line', 6263
    new $P12, [ 'OpNotEqualExpr' ]
    $P1 = $P12.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6266
.const 'Sub' $P13 = 'WSubId_68'
    $P2 = $P13(__ARG_1, __ARG_2)
.annotate 'line', 6267
    new $P14, [ 'OpSameExpr' ]
    $P14.'OpSameExpr'(1, __ARG_2, $P3, $P1, $P2)
    set $P1, $P14
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 6270
.const 'Sub' $P15 = 'WSubId_68'
    $P2 = $P15(__ARG_1, __ARG_2)
.annotate 'line', 6271
    new $P16, [ 'OpSameExpr' ]
    $P16.'OpSameExpr'(0, __ARG_2, $P3, $P1, $P2)
    set $P1, $P16
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6272
.const 'Sub' $P17 = 'WSubId_6'
.annotate 'line', 6274
    $P17('Invalid code in parseExpr_8', $P3)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6277
    __ARG_1.'unget'($P3)
.annotate 'line', 6278
    .return($P1)
# }
.annotate 'line', 6279

.end # parseExpr_9


.sub 'parseExpr_10' :subid('WSubId_71')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6283
.const 'Sub' $P4 = 'parseExpr_9'
.annotate 'line', 6285
# var lexpr: $P1
.const 'Sub' $P5 = 'WSubId_70'
    $P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6286
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6287
    $P2 = __ARG_1.'get'()
    $P6 = $P2.'isop'('&')
    if_null $P6, __label_1
    unless $P6 goto __label_1
# {
.annotate 'line', 6288
# var rexpr: $P3
.const 'Sub' $P7 = 'WSubId_70'
    $P3 = $P7(__ARG_1, __ARG_2)
.annotate 'line', 6289
    new $P6, [ 'OpBinAndExpr' ]
    $P6.'OpBinAndExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P6
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6291
    __ARG_1.'unget'($P2)
.annotate 'line', 6292
    .return($P1)
# }
.annotate 'line', 6293

.end # parseExpr_10


.sub 'parseExpr_11' :subid('WSubId_72')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6297
.const 'Sub' $P4 = 'parseExpr_10'
.annotate 'line', 6299
# var lexpr: $P1
.const 'Sub' $P5 = 'WSubId_71'
    $P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6300
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6301
    $P2 = __ARG_1.'get'()
    $P6 = $P2.'isop'('^')
    if_null $P6, __label_1
    unless $P6 goto __label_1
# {
.annotate 'line', 6302
# var rexpr: $P3
.const 'Sub' $P7 = 'WSubId_71'
    $P3 = $P7(__ARG_1, __ARG_2)
.annotate 'line', 6303
    new $P6, [ 'OpBinXorExpr' ]
    $P6.'OpBinXorExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P6
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6305
    __ARG_1.'unget'($P2)
.annotate 'line', 6306
    .return($P1)
# }
.annotate 'line', 6307

.end # parseExpr_11


.sub 'parseExpr_12' :subid('WSubId_73')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6311
.const 'Sub' $P4 = 'parseExpr_11'
.annotate 'line', 6313
# var lexpr: $P1
.const 'Sub' $P5 = 'WSubId_72'
    $P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6314
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6315
    $P2 = __ARG_1.'get'()
    $P6 = $P2.'isop'('|')
    if_null $P6, __label_1
    unless $P6 goto __label_1
# {
.annotate 'line', 6316
# var rexpr: $P3
.const 'Sub' $P7 = 'WSubId_72'
    $P3 = $P7(__ARG_1, __ARG_2)
.annotate 'line', 6317
    new $P6, [ 'OpBinOrExpr' ]
    $P6.'OpBinOrExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P6
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6319
    __ARG_1.'unget'($P2)
.annotate 'line', 6320
    .return($P1)
# }
.annotate 'line', 6321

.end # parseExpr_12


.sub 'parseExpr_13' :subid('WSubId_74')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6325
.const 'Sub' $P4 = 'parseExpr_12'
.annotate 'line', 6327
# var lexpr: $P1
.const 'Sub' $P5 = 'WSubId_73'
    $P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6328
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6329
    $P2 = __ARG_1.'get'()
    $P6 = $P2.'isop'('&&')
    if_null $P6, __label_1
    unless $P6 goto __label_1
# {
.annotate 'line', 6330
# var rexpr: $P3
.const 'Sub' $P7 = 'WSubId_73'
    $P3 = $P7(__ARG_1, __ARG_2)
.annotate 'line', 6331
    new $P6, [ 'OpBoolAndExpr' ]
    $P6.'OpBoolAndExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P6
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6333
    __ARG_1.'unget'($P2)
.annotate 'line', 6334
    .return($P1)
# }
.annotate 'line', 6335

.end # parseExpr_13


.sub 'parseExpr_14' :subid('WSubId_75')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6339
.const 'Sub' $P4 = 'parseExpr_13'
.annotate 'line', 6341
# var lexpr: $P1
.const 'Sub' $P5 = 'WSubId_74'
    $P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6342
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6343
    $P2 = __ARG_1.'get'()
    $P6 = $P2.'isop'('||')
    if_null $P6, __label_1
    unless $P6 goto __label_1
# {
.annotate 'line', 6344
# var rexpr: $P3
.const 'Sub' $P7 = 'WSubId_73'
    $P3 = $P7(__ARG_1, __ARG_2)
.annotate 'line', 6345
    new $P6, [ 'OpBoolOrExpr' ]
    $P6.'OpBoolOrExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P6
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6347
    __ARG_1.'unget'($P2)
.annotate 'line', 6348
    .return($P1)
# }
.annotate 'line', 6349

.end # parseExpr_14


.sub 'parseExpr_15' :subid('WSubId_77')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6353
.const 'Sub' $P5 = 'parseExpr_16'
.const 'Sub' $P6 = 'parseExpr_14'
.annotate 'line', 6355
# var econd: $P1
.const 'Sub' $P7 = 'WSubId_75'
    $P1 = $P7(__ARG_1, __ARG_2)
.annotate 'line', 6356
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 6357
    $P8 = $P2.'isop'('?')
    if_null $P8, __label_1
    unless $P8 goto __label_1
# {
.annotate 'line', 6358
# var etrue: $P3
.const 'Sub' $P9 = 'WSubId_76'
    $P3 = $P9(__ARG_1, __ARG_2)
.const 'Sub' $P10 = 'WSubId_43'
.annotate 'line', 6359
    $P10(':', __ARG_1)
.annotate 'line', 6360
# var efalse: $P4
.const 'Sub' $P11 = 'WSubId_76'
    $P4 = $P11(__ARG_1, __ARG_2)
.annotate 'line', 6361
    new $P12, [ 'OpConditionalExpr' ]
    $P12.'OpConditionalExpr'(__ARG_2, $P2, $P1, $P3, $P4)
    set $P8, $P12
    .return($P8)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 6364
    __ARG_1.'unget'($P2)
.annotate 'line', 6365
    .return($P1)
# }
  __label_2: # endif
# }
.annotate 'line', 6367

.end # parseExpr_15


.sub 'parseExpr_16' :subid('WSubId_76')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6371
.const 'Sub' $P5 = 'parseExpr_16'
.const 'Sub' $P6 = 'parseExpr_15'
.const 'Sub' $P7 = 'getOpCode_16'
.annotate 'line', 6373
# var lexpr: $P1
.const 'Sub' $P8 = 'WSubId_77'
    $P1 = $P8(__ARG_1, __ARG_2)
.annotate 'line', 6374
# var t: $P2
    null $P2
.annotate 'line', 6375
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6376
.const 'Sub' $P10 = 'WSubId_78'
    $P2 = __ARG_1.'get'()
    $P9 = $P10($P2)
    set $I1, $P9
    eq $I1, 0, __label_1
# {
.annotate 'line', 6377
# var rexpr: $P3
.const 'Sub' $P11 = 'WSubId_76'
    $P3 = $P11(__ARG_1, __ARG_2)
.annotate 'line', 6378
# var expr: $P4
    null $P4
# switch
.annotate 'line', 6379
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
.annotate 'line', 6381
    new $P4, [ 'OpAssignExpr' ]
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6384
    new $P4, [ 'OpAssignToExpr' ]
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6387
    new $P4, [ 'OpAddToExpr' ]
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 6390
    new $P4, [ 'OpSubToExpr' ]
    goto __label_3 # break
  __label_9: # case
.annotate 'line', 6393
    new $P4, [ 'OpMulToExpr' ]
    goto __label_3 # break
  __label_10: # case
.annotate 'line', 6396
    new $P4, [ 'OpDivToExpr' ]
    goto __label_3 # break
  __label_11: # case
.annotate 'line', 6399
    new $P4, [ 'OpModToExpr' ]
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6400
.const 'Sub' $P12 = 'WSubId_6'
.annotate 'line', 6402
    $P12('Unexpected code in parseExpr_16', $P2)
  __label_3: # switch end
.annotate 'line', 6404
    $P4.'set'(__ARG_2, $P2, $P1, $P3)
.annotate 'line', 6405
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6407
    __ARG_1.'unget'($P2)
.annotate 'line', 6408
    .return($P1)
# }
.annotate 'line', 6409

.end # parseExpr_16


.sub 'parseExpr' :subid('WSubId_30')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6413
.const 'Sub' $P1 = 'parseExpr_16'
.annotate 'line', 6415
.const 'Sub' $P2 = 'WSubId_76'
    .tailcall $P2(__ARG_1, __ARG_2)
# }
.annotate 'line', 6416

.end # parseExpr

.namespace [ 'Breakable' ]

.sub 'genbreaklabel' :method
# Body
# {
.annotate 'line', 6431
    getattribute $P1, self, 'brlabel'
    if_null $P1, __label_1
.const 'Sub' $P2 = 'WSubId_6'
.annotate 'line', 6432
    $P2('attempt to generate break label twice')
  __label_1: # endif
.annotate 'line', 6433
# label: $S1
    $P1 = self.'genlabel'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 6434
    box $P1, $S1
    setattribute self, 'brlabel', $P1
.annotate 'line', 6435
    .return($S1)
# }
.annotate 'line', 6436

.end # genbreaklabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6439
# var label: $P1
    getattribute $P1, self, 'brlabel'
.annotate 'line', 6440
    unless_null $P1, __label_1
.const 'Sub' $P2 = 'WSubId_6'
.annotate 'line', 6441
    $P2('attempt to get break label before creating it')
  __label_1: # endif
.annotate 'line', 6442
    .return($P1)
# }
.annotate 'line', 6443

.end # getbreaklabel

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Breakable' ]
.annotate 'line', 6427
    addattribute $P0, 'brlabel'
.end
.namespace [ 'Continuable' ]

.sub 'gencontinuelabel' :method
# Body
# {
.annotate 'line', 6452
    getattribute $P1, self, 'cntlabel'
    if_null $P1, __label_1
.const 'Sub' $P2 = 'WSubId_6'
.annotate 'line', 6453
    $P2('attempt to generate continue label twice')
  __label_1: # endif
.annotate 'line', 6454
# label: $S1
    $P1 = self.'genlabel'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 6455
    box $P1, $S1
    setattribute self, 'cntlabel', $P1
.annotate 'line', 6456
    .return($S1)
# }
.annotate 'line', 6457

.end # gencontinuelabel


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6460
# var label: $P1
    getattribute $P1, self, 'cntlabel'
.annotate 'line', 6461
    unless_null $P1, __label_1
.const 'Sub' $P2 = 'WSubId_6'
.annotate 'line', 6462
    $P2('attempt to get continue label before creating it')
  __label_1: # endif
.annotate 'line', 6463
    .return($P1)
# }
.annotate 'line', 6464

.end # getcontinuelabel

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Continuable' ]
.annotate 'line', 6446
    get_class $P1, [ 'Breakable' ]
    addparent $P0, $P1
.annotate 'line', 6448
    addattribute $P0, 'cntlabel'
.end
.namespace [ 'ReturnYieldStatement' ]

.sub 'parse' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6480
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6481
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6482
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 6483
    __ARG_2.'unget'($P1)
.annotate 'line', 6484
    new $P4, [ 'ArgumentList' ]
    $P4.'ArgumentList'(__ARG_3, __ARG_1, __ARG_2, ";")
    set $P3, $P4
    setattribute self, 'values', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 6486

.end # parse


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6489
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 6490
    if_null $P1, __label_1
.annotate 'line', 6491
    $P1 = $P1.'optimize'()
  __label_1: # endif
.annotate 'line', 6492
    .return(self)
# }
.annotate 'line', 6493

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6497
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 6498
# n: $I1
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
# predefined int
    $P3 = $P1.'numargs'()
    set $I1, $P3
  __label_1:
.annotate 'line', 6501
    iseq $I2, $I1, 1
    unless $I2 goto __label_4
    isa $I2, self, [ 'ReturnStatement' ]
  __label_4:
    unless $I2 goto __label_3
# {
.annotate 'line', 6502
# var func: $P2
    $P2 = $P1.'getfreearg'(0)
.annotate 'line', 6503
    $P3 = $P2.'cantailcall'()
    if_null $P3, __label_5
    unless $P3 goto __label_5
# {
.annotate 'line', 6504
    self.'annotate'(__ARG_1)
.annotate 'line', 6505
    .tailcall $P2.'emit'(__ARG_1, '.tailcall')
# }
  __label_5: # endif
# }
  __label_3: # endif
.annotate 'line', 6509
    le $I1, 0, __label_6
.annotate 'line', 6510
    $P1.'getargvalues'(__ARG_1)
  __label_6: # endif
.annotate 'line', 6512
    self.'annotate'(__ARG_1)
.annotate 'line', 6513
    self.'emitret'(__ARG_1)
.annotate 'line', 6514
    le $I1, 0, __label_7
.annotate 'line', 6515
    $P1.'emitargs'(__ARG_1)
  __label_7: # endif
.annotate 'line', 6516
    __ARG_1.'say'(')')
# }
.annotate 'line', 6517

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ReturnYieldStatement' ]
.annotate 'line', 6474
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 6476
    addattribute $P0, 'values'
.end
.namespace [ 'ReturnStatement' ]

.sub 'ReturnStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6524
    self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6525

.end # ReturnStatement


.sub 'emitret' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6528
    __ARG_1.'print'('    ', '.return(')
# }
.annotate 'line', 6529

.end # emitret

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ReturnStatement' ]
.annotate 'line', 6520
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
.annotate 'line', 6536
    self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6537

.end # YieldStatement


.sub 'emitret' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6540
    __ARG_1.'print'('    ', '.yield(')
# }
.annotate 'line', 6541

.end # emitret

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'YieldStatement' ]
.annotate 'line', 6532
    get_class $P1, [ 'ReturnYieldStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'LabelStatement' ]

.sub 'LabelStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6554
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 6555
    setattribute self, 'name', __ARG_1
.annotate 'line', 6556
    getattribute $P3, self, 'owner'
    $P2 = $P3.'createlabel'(__ARG_1)
    setattribute self, 'value', $P2
# }
.annotate 'line', 6557

.end # LabelStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6558
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6561
    self.'annotate'(__ARG_1)
.annotate 'line', 6562
    getattribute $P1, self, 'value'
# predefined string
    getattribute $P2, self, 'name'
    set $S1, $P2
    concat $S2, 'label ', $S1
    __ARG_1.'emitlabel'($P1, $S2)
# }
.annotate 'line', 6563

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'LabelStatement' ]
.annotate 'line', 6548
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 6550
    addattribute $P0, 'name'
.annotate 'line', 6551
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
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6584
# value: $S2
    getattribute $P2, self, 'owner'
    $P1 = $P2.'getlabel'($S1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
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
.const 'Sub' $P2 = 'WSubId_79'
.annotate 'line', 6601
    $P2($P1)
.annotate 'line', 6602
    setattribute self, 'label', $P1
.const 'Sub' $P4 = 'WSubId_43'
.annotate 'line', 6603
    $P4(';', __ARG_2)
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
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6610
# value: $S2
    $P1 = self.'getlabel'($S1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
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
.const 'Sub' $P2 = 'WSubId_30'
    $P1 = $P2(__ARG_1, self)
    self.'set'($P1)
# }
.annotate 'line', 6624

.end # parseconditionshort


.sub 'parsecondition' :method
        .param pmc __ARG_1
# Body
# {
.const 'Sub' $P1 = 'WSubId_43'
.annotate 'line', 6627
    $P1('(', __ARG_1)
.annotate 'line', 6628
.const 'Sub' $P3 = 'WSubId_30'
    $P2 = $P3(__ARG_1, self)
    self.'set'($P2)
.const 'Sub' $P4 = 'WSubId_43'
.annotate 'line', 6629
    $P4(')', __ARG_1)
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
.const 'Sub' $P4 = 'WSubId_80'
    $P3 = $P4(__ARG_2, self)
    setattribute self, 'truebranch', $P3
.annotate 'line', 6646
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6647
    $P2 = $P1.'iskeyword'("else")
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 6648
.const 'Sub' $P6 = 'WSubId_80'
    $P5 = $P6(__ARG_2, self)
    setattribute self, 'falsebranch', $P5
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 6650
    new $P8, [ 'EmptyStatement' ]
    setattribute self, 'falsebranch', $P8
.annotate 'line', 6651
    __ARG_2.'unget'($P1)
# }
  __label_2: # endif
# }
.annotate 'line', 6653

.end # IfStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6656
    self.'optimize_condition'()
.annotate 'line', 6657
    getattribute $P3, self, 'truebranch'
    $P2 = $P3.'optimize'()
    setattribute self, 'truebranch', $P2
.annotate 'line', 6658
    getattribute $P3, self, 'falsebranch'
    $P2 = $P3.'optimize'()
    setattribute self, 'falsebranch', $P2
# switch
.annotate 'line', 6659
    $P1 = self.'getvalue'()
    set $I1, $P1
    set $I2, 1
    if $I1 == $I2 goto __label_3
    set $I2, 2
    if $I1 == $I2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6661
    getattribute $P2, self, 'truebranch'
    .return($P2)
  __label_4: # case
.annotate 'line', 6663
    getattribute $P3, self, 'falsebranch'
    .return($P3)
  __label_2: # default
  __label_1: # switch end
.annotate 'line', 6665
    .return(self)
# }
.annotate 'line', 6666

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6669
# var truebranch: $P1
    getattribute $P1, self, 'truebranch'
.annotate 'line', 6670
# var falsebranch: $P2
    getattribute $P2, self, 'falsebranch'
.annotate 'line', 6671
# t_empty: $I1
    $P3 = $P1.'isempty'()
    set $I1, $P3
.annotate 'line', 6672
# f_empty: $I2
    $P3 = $P2.'isempty'()
    set $I2, $P3
.annotate 'line', 6673
# elselabel: $S1
    set $S1, ''
.annotate 'line', 6674
    not $I3, $I2
    unless $I3 goto __label_1
.annotate 'line', 6675
    $P3 = self.'genlabel'()
    set $S1, $P3
  __label_1: # endif
.annotate 'line', 6676
# endlabel: $S2
    $P3 = self.'genlabel'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 6677
# cond_false: $S3
    unless $I2 goto __label_4
    set $S3, $S2
    goto __label_3
  __label_4:
    set $S3, $S1
  __label_3:
.annotate 'line', 6678
    self.'annotate'(__ARG_1)
.annotate 'line', 6679
    self.'emit_else'(__ARG_1, $S3)
.annotate 'line', 6680
    $P1.'emit'(__ARG_1)
.annotate 'line', 6682
    not $I3, $I2
    unless $I3 goto __label_5
# {
.annotate 'line', 6683
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 6684
    __ARG_1.'emitlabel'($S1, 'else')
.annotate 'line', 6685
    $P2.'emit'(__ARG_1)
# }
  __label_5: # endif
.annotate 'line', 6687
    __ARG_1.'emitlabel'($S2, 'endif')
# }
.annotate 'line', 6688

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
.annotate 'line', 6700
.const 'Sub' $P3 = 'WSubId_80'
    $P2 = $P3(__ARG_1, self)
    setattribute self, 'body', $P2
# }
.annotate 'line', 6701

.end # parsebody


.sub 'emit_infinite' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6704
# breaklabel: $S1
    $P1 = self.'genbreaklabel'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6705
# continuelabel: $S2
    $P1 = self.'gencontinuelabel'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 6707
    self.'annotate'(__ARG_1)
.annotate 'line', 6708
    __ARG_1.'emitlabel'($S2, 'Infinite loop')
.annotate 'line', 6709
    getattribute $P1, self, 'body'
    $P1.'emit'(__ARG_1)
.annotate 'line', 6710
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 6711
    __ARG_1.'emitlabel'($S1, 'Infinite loop end')
# }
.annotate 'line', 6712

.end # emit_infinite

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'LoopStatement' ]
.annotate 'line', 6695
    get_class $P1, [ 'Continuable' ]
    addparent $P0, $P1
.annotate 'line', 6697
    addattribute $P0, 'body'
.end
.namespace [ 'WhileStatement' ]

.sub 'WhileStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6723
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6724
    self.'parsecondition'(__ARG_2)
.annotate 'line', 6725
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 6726

.end # WhileStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6729
    self.'optimize_condition'()
.annotate 'line', 6730
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 6731
    .return(self)
# }
.annotate 'line', 6732

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6735
    $P1 = self.'getvalue'()
    set $I1, $P1
    set $I2, 1
    if $I1 == $I2 goto __label_3
    set $I2, 2
    if $I1 == $I2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6737
    self.'emit_infinite'(__ARG_1)
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 6740
    __ARG_1.'comment'('while(false) optimized out')
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 6743
# breaklabel: $S1
    $P2 = self.'genbreaklabel'()
    null $S1
    if_null $P2, __label_5
    set $S1, $P2
  __label_5:
.annotate 'line', 6744
# continuelabel: $S2
    $P3 = self.'gencontinuelabel'()
    null $S2
    if_null $P3, __label_6
    set $S2, $P3
  __label_6:
.annotate 'line', 6746
    self.'annotate'(__ARG_1)
.annotate 'line', 6747
    __ARG_1.'emitlabel'($S2, 'while')
.annotate 'line', 6748
    self.'emit_else'(__ARG_1, $S1)
.annotate 'line', 6749
    getattribute $P4, self, 'body'
    $P4.'emit'(__ARG_1)
.annotate 'line', 6750
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 6751
    __ARG_1.'emitlabel'($S1, 'endwhile')
  __label_1: # switch end
# }
.annotate 'line', 6753

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'WhileStatement' ]
.annotate 'line', 6719
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
.annotate 'line', 6764
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6765
    self.'parsebody'(__ARG_2)
.const 'Sub' $P1 = 'WSubId_81'
.annotate 'line', 6766
    $P1('while', __ARG_2)
.annotate 'line', 6767
    self.'parsecondition'(__ARG_2)
# }
.annotate 'line', 6768

.end # DoStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6771
    self.'optimize_condition'()
.annotate 'line', 6772
# var body: $P1
    getattribute $P2, self, 'body'
    $P1 = $P2.'optimize'()
.annotate 'line', 6773
    $I1 = $P1.'isempty'()
    unless $I1 goto __label_2
    $P2 = self.'getvalue'()
    set $I2, $P2
    iseq $I1, $I2, 2
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 6774
    new $P3, [ 'EmptyStatement' ]
    .return($P3)
  __label_1: # endif
.annotate 'line', 6775
    setattribute self, 'body', $P1
.annotate 'line', 6776
    .return(self)
# }
.annotate 'line', 6777

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6780
# var body: $P1
    getattribute $P1, self, 'body'
.annotate 'line', 6781
# condvalue: $I1
    $P2 = self.'getvalue'()
    set $I1, $P2
# switch
.annotate 'line', 6782
    set $I2, $I1
    set $I3, 1
    if $I2 == $I3 goto __label_3
    goto __label_2
  __label_3: # case
.annotate 'line', 6784
    self.'emit_infinite'(__ARG_1)
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 6787
# looplabel: $S1
    $P2 = self.'genlabel'()
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
.annotate 'line', 6788
# breaklabel: $S2
    $P3 = self.'genbreaklabel'()
    null $S2
    if_null $P3, __label_5
    set $S2, $P3
  __label_5:
.annotate 'line', 6789
# continuelabel: $S3
    $P4 = self.'gencontinuelabel'()
    null $S3
    if_null $P4, __label_6
    set $S3, $P4
  __label_6:
.annotate 'line', 6791
    self.'annotate'(__ARG_1)
.annotate 'line', 6792
    __ARG_1.'emitlabel'($S1, 'do')
.annotate 'line', 6794
    $P1.'emit'(__ARG_1)
.annotate 'line', 6795
    __ARG_1.'emitlabel'($S3, 'continue')
.annotate 'line', 6796
    eq $I1, 2, __label_7
.annotate 'line', 6797
    self.'emit_if'(__ARG_1, $S1, $S2)
  __label_7: # endif
.annotate 'line', 6798
    __ARG_1.'emitlabel'($S2, 'enddo')
  __label_1: # switch end
# }
.annotate 'line', 6800

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'DoStatement' ]
.annotate 'line', 6760
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
.annotate 'line', 6811
    self.'Statement'(__ARG_1, __ARG_3)
.const 'Sub' $P1 = 'WSubId_43'
.annotate 'line', 6812
    $P1(';', __ARG_2)
# }
.annotate 'line', 6813

.end # ContinueStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6814
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6817
    self.'annotate'(__ARG_1)
.annotate 'line', 6818
# label: $S1
    getattribute $P2, self, 'start'
    $P1 = self.'getcontinuelabel'($P2)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6819
    __ARG_1.'emitgoto'($S1, 'continue')
# }
.annotate 'line', 6820

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ContinueStatement' ]
.annotate 'line', 6807
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
.annotate 'line', 6831
    self.'Statement'(__ARG_1, __ARG_3)
.const 'Sub' $P1 = 'WSubId_43'
.annotate 'line', 6832
    $P1(';', __ARG_2)
# }
.annotate 'line', 6833

.end # BreakStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6834
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6837
    self.'annotate'(__ARG_1)
.annotate 'line', 6838
# label: $S1
    getattribute $P2, self, 'start'
    $P1 = self.'getbreaklabel'($P2)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6839
    __ARG_1.'emitgoto'($S1, 'break')
# }
.annotate 'line', 6840

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'BreakStatement' ]
.annotate 'line', 6827
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'SwitchBaseStatement' ]

.sub 'SwitchBaseStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6855
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 6856
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'case_value', $P2
.annotate 'line', 6857
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'case_st', $P2
.annotate 'line', 6858
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'default_st', $P2
# }
.annotate 'line', 6859

.end # SwitchBaseStatement


.sub 'parse_cases' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6862
# var t: $P1
    null $P1
  __label_2: # while
.annotate 'line', 6863
    $P1 = __ARG_1.'get'()
    $I1 = $P1.'iskeyword'('case')
    if $I1 goto __label_3
    $I1 = $P1.'iskeyword'('default')
  __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 6864
    $P3 = $P1.'iskeyword'('case')
    if_null $P3, __label_4
    unless $P3 goto __label_4
# {
.annotate 'line', 6865
    getattribute $P4, self, 'case_value'
.const 'Sub' $P6 = 'WSubId_30'
    $P5 = $P6(__ARG_1, self)
# predefined push
    push $P4, $P5
.annotate 'line', 6866
    $P1 = __ARG_1.'get'()
.annotate 'line', 6867
    $P3 = $P1.'isop'(':')
    isfalse $I1, $P3
    unless $I1 goto __label_6
.const 'Sub' $P7 = 'WSubId_29'
.annotate 'line', 6868
    $P7("':' in case", $P1)
  __label_6: # endif
.annotate 'line', 6869
# var st: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
  __label_8: # while
.annotate 'line', 6870
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
.annotate 'line', 6871
    __ARG_1.'unget'($P1)
.annotate 'line', 6872
.const 'Sub' $P8 = 'WSubId_80'
    $P3 = $P8(__ARG_1, self)
# predefined push
    push $P2, $P3
# }
    goto __label_8
  __label_7: # endwhile
.annotate 'line', 6874
    getattribute $P3, self, 'case_st'
# predefined push
    push $P3, $P2
.annotate 'line', 6875
    __ARG_1.'unget'($P1)
# }
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 6878
    $P1 = __ARG_1.'get'()
.annotate 'line', 6879
    $P3 = $P1.'isop'(':')
    isfalse $I1, $P3
    unless $I1 goto __label_11
.const 'Sub' $P9 = 'WSubId_29'
.annotate 'line', 6880
    $P9("':' in default", $P1)
  __label_11: # endif
  __label_13: # while
.annotate 'line', 6881
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
.annotate 'line', 6882
    __ARG_1.'unget'($P1)
.annotate 'line', 6883
    getattribute $P3, self, 'default_st'
.const 'Sub' $P10 = 'WSubId_80'
    $P4 = $P10(__ARG_1, self)
# predefined push
    push $P3, $P4
# }
    goto __label_13
  __label_12: # endwhile
.annotate 'line', 6885
    __ARG_1.'unget'($P1)
# }
  __label_5: # endif
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6888
    $P3 = $P1.'isop'('}')
    isfalse $I1, $P3
    unless $I1 goto __label_16
.const 'Sub' $P11 = 'WSubId_29'
.annotate 'line', 6889
    $P11("'}' in switch", $P1)
  __label_16: # endif
# }
.annotate 'line', 6890

.end # parse_cases


.sub 'optimize_cases' :method
# Body
# {
.const 'Sub' $P2 = 'WSubId_28'
.annotate 'line', 6893
    getattribute $P3, self, 'case_value'
    $P2($P3)
.annotate 'line', 6894
    getattribute $P3, self, 'case_st'
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
.const 'Sub' $P5 = 'WSubId_28'
.annotate 'line', 6895
    $P5($P1)
    goto __label_1
  __label_2: # endfor
.const 'Sub' $P6 = 'WSubId_28'
.annotate 'line', 6896
    getattribute $P3, self, 'default_st'
    $P6($P3)
# }
.annotate 'line', 6897

.end # optimize_cases

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'SwitchBaseStatement' ]
.annotate 'line', 6847
    get_class $P1, [ 'Breakable' ]
    addparent $P0, $P1
    get_class $P2, [ 'Statement' ]
    addparent $P0, $P2
.annotate 'line', 6849
    addattribute $P0, 'case_value'
.annotate 'line', 6850
    addattribute $P0, 'case_st'
.annotate 'line', 6851
    addattribute $P0, 'default_st'
.end
.namespace [ 'SwitchStatement' ]

.sub 'SwitchStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6910
    self.'SwitchBaseStatement'(__ARG_1, __ARG_3)
.annotate 'line', 6911
.const 'Sub' $P4 = 'WSubId_30'
    $P3 = $P4(__ARG_2, self)
    setattribute self, 'condition', $P3
.annotate 'line', 6912
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6913
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.const 'Sub' $P5 = 'WSubId_29'
.annotate 'line', 6914
    $P5("')' in switch", $P1)
  __label_1: # endif
.annotate 'line', 6915
    $P1 = __ARG_2.'get'()
.annotate 'line', 6916
    $P2 = $P1.'isop'('{')
    isfalse $I1, $P2
    unless $I1 goto __label_2
.const 'Sub' $P6 = 'WSubId_29'
.annotate 'line', 6917
    $P6("'{' in switch", $P1)
  __label_2: # endif
.annotate 'line', 6918
    self.'parse_cases'(__ARG_2)
# }
.annotate 'line', 6919

.end # SwitchStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6922
    getattribute $P3, self, 'condition'
    $P2 = $P3.'optimize'()
    setattribute self, 'condition', $P2
.annotate 'line', 6923
    self.'optimize_cases'()
.annotate 'line', 6924
    .return(self)
# }
.annotate 'line', 6925

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6929
# type: $S1
    set $S1, ''
.annotate 'line', 6930
    getattribute $P7, self, 'case_value'
    iter $P8, $P7
    set $P8, 0
  __label_1: # for iteration
    unless $P8 goto __label_2
    shift $P1, $P8
# {
.annotate 'line', 6931
# t: $S2
    $P9 = $P1.'checkresult'()
    null $S2
    if_null $P9, __label_3
    set $S2, $P9
  __label_3:
.annotate 'line', 6932
    ne $S2, 'N', __label_4
.const 'Sub' $P10 = 'WSubId_1'
.annotate 'line', 6933
    getattribute $P7, self, 'start'
    $P10("Invalid type in case", $P7)
  __label_4: # endif
.annotate 'line', 6934
    ne $S1, '', __label_5
.annotate 'line', 6935
    set $S1, $S2
    goto __label_6
  __label_5: # else
.annotate 'line', 6936
    eq $S1, $S2, __label_7
.annotate 'line', 6937
    set $S1, 'P'
  __label_7: # endif
  __label_6: # endif
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 6940
# var condition: $P2
    getattribute $P2, self, 'condition'
.annotate 'line', 6941
# var condtype: $P3
    $P3 = $P2.'checkresult'()
.annotate 'line', 6945
    ne $S1, '', __label_8
.annotate 'line', 6946
    set $S1, $P3
  __label_8: # endif
.annotate 'line', 6948
    __ARG_1.'comment'('switch')
.annotate 'line', 6949
# reg: $S3
    $P7 = self.'tempreg'($S1)
    null $S3
    if_null $P7, __label_9
    set $S3, $P7
  __label_9:
.annotate 'line', 6950
    set $S8, $P3
    ne $S8, $S1, __label_10
.annotate 'line', 6951
    $P2.'emit'(__ARG_1, $S3)
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 6953
# regcond: $S4
    $P7 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P7, __label_12
    set $S4, $P7
  __label_12:
.annotate 'line', 6954
    __ARG_1.'emitset'($S3, $S4)
# }
  __label_11: # endif
.annotate 'line', 6958
    self.'genbreaklabel'()
.annotate 'line', 6959
# defaultlabel: $S5
    $P7 = self.'genlabel'()
    null $S5
    if_null $P7, __label_13
    set $S5, $P7
  __label_13:
.annotate 'line', 6960
    new $P4, ['ResizableStringArray']
.annotate 'line', 6961
# regval: $S6
    $P7 = self.'tempreg'($S1)
    null $S6
    if_null $P7, __label_14
    set $S6, $P7
  __label_14:
.annotate 'line', 6962
    getattribute $P7, self, 'case_value'
    iter $P11, $P7
    set $P11, 0
  __label_15: # for iteration
    unless $P11 goto __label_16
    shift $P5, $P11
# {
.annotate 'line', 6963
# label: $S7
    $P9 = self.'genlabel'()
    null $S7
    if_null $P9, __label_17
    set $S7, $P9
  __label_17:
.annotate 'line', 6964
# predefined push
    push $P4, $S7
.annotate 'line', 6965
    $P5.'emit'(__ARG_1, $S6)
.annotate 'line', 6966
    __ARG_1.'say'('    ', 'if ', $S3, ' == ', $S6, ' goto ', $S7)
# }
    goto __label_15
  __label_16: # endfor
.annotate 'line', 6968
    __ARG_1.'emitgoto'($S5)
.annotate 'line', 6971
    self.'annotate'(__ARG_1)
.annotate 'line', 6972
# var case_st: $P6
    getattribute $P6, self, 'case_st'
.annotate 'line', 6973
# n: $I1
    set $P7, $P6
    set $I1, $P7
# for loop
.annotate 'line', 6974
# i: $I2
    null $I2
  __label_20: # for condition
    ge $I2, $I1, __label_19
# {
.annotate 'line', 6975
    $P7 = $P4[$I2]
    __ARG_1.'emitlabel'($P7, 'case')
.const 'Sub' $P12 = 'WSubId_42'
.annotate 'line', 6976
    $P7 = $P6[$I2]
    $P12(__ARG_1, $P7)
# }
  __label_18: # for iteration
.annotate 'line', 6974
    inc $I2
    goto __label_20
  __label_19: # for end
.annotate 'line', 6979
    __ARG_1.'emitlabel'($S5, 'default')
.const 'Sub' $P13 = 'WSubId_42'
.annotate 'line', 6980
    getattribute $P7, self, 'default_st'
    $P13(__ARG_1, $P7)
.annotate 'line', 6982
    getattribute $P9, self, 'start'
    $P7 = self.'getbreaklabel'($P9)
    __ARG_1.'emitlabel'($P7, 'switch end')
# }
.annotate 'line', 6983

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'SwitchStatement' ]
.annotate 'line', 6904
    get_class $P1, [ 'SwitchBaseStatement' ]
    addparent $P0, $P1
.annotate 'line', 6906
    addattribute $P0, 'condition'
.end
.namespace [ 'SwitchCaseStatement' ]

.sub 'SwitchCaseStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6995
    self.'SwitchBaseStatement'(__ARG_1, __ARG_3)
.annotate 'line', 6996
    self.'parse_cases'(__ARG_2)
# }
.annotate 'line', 6997

.end # SwitchCaseStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7000
    self.'optimize_cases'()
.annotate 'line', 7001
    .return(self)
# }
.annotate 'line', 7002

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7006
    self.'genbreaklabel'()
.annotate 'line', 7007
# defaultlabel: $S1
    $P4 = self.'genlabel'()
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 7008
    new $P1, ['ResizableStringArray']
.annotate 'line', 7010
    __ARG_1.'comment'('switch-case')
.annotate 'line', 7011
# reg: $S2
    $P4 = self.'tempreg'('I')
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 7012
    getattribute $P4, self, 'case_value'
    iter $P5, $P4
    set $P5, 0
  __label_3: # for iteration
    unless $P5 goto __label_4
    shift $P2, $P5
# {
.annotate 'line', 7013
# label: $S3
    $P6 = self.'genlabel'()
    null $S3
    if_null $P6, __label_5
    set $S3, $P6
  __label_5:
.annotate 'line', 7014
# predefined push
    push $P1, $S3
.annotate 'line', 7015
    $P2.'emit'(__ARG_1, $S2)
.annotate 'line', 7016
    __ARG_1.'say'('    ', 'if ', $S2, ' goto ', $S3)
# }
    goto __label_3
  __label_4: # endfor
.annotate 'line', 7018
    __ARG_1.'emitgoto'($S1)
.annotate 'line', 7021
    self.'annotate'(__ARG_1)
.annotate 'line', 7022
# var case_st: $P3
    getattribute $P3, self, 'case_st'
.annotate 'line', 7023
# n: $I1
    set $P4, $P3
    set $I1, $P4
# for loop
.annotate 'line', 7024
# i: $I2
    null $I2
  __label_8: # for condition
    ge $I2, $I1, __label_7
# {
.annotate 'line', 7025
    $P4 = $P1[$I2]
    __ARG_1.'emitlabel'($P4, 'case')
.const 'Sub' $P7 = 'WSubId_42'
.annotate 'line', 7026
    $P4 = $P3[$I2]
    $P7(__ARG_1, $P4)
# }
  __label_6: # for iteration
.annotate 'line', 7024
    inc $I2
    goto __label_8
  __label_7: # for end
.annotate 'line', 7029
    __ARG_1.'emitlabel'($S1, 'default')
.const 'Sub' $P8 = 'WSubId_42'
.annotate 'line', 7030
    getattribute $P4, self, 'default_st'
    $P8(__ARG_1, $P4)
.annotate 'line', 7032
    getattribute $P6, self, 'start'
    $P4 = self.'getbreaklabel'($P6)
    __ARG_1.'emitlabel'($P4, 'switch end')
# }
.annotate 'line', 7033

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'SwitchCaseStatement' ]
.annotate 'line', 6990
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
.annotate 'line', 7040
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7041
    $P2 = $P1.'isop'('(')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 7042
    new $P4, [ 'SwitchStatement' ]
    $P4.'SwitchStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P3, $P4
    .return($P3)
  __label_1: # endif
.annotate 'line', 7043
    $P2 = $P1.'isop'('{')
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 7044
    new $P4, [ 'SwitchCaseStatement' ]
    $P4.'SwitchCaseStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P3, $P4
    .return($P3)
  __label_2: # endif
.const 'Sub' $P5 = 'WSubId_29'
.annotate 'line', 7045
    $P5("'(' in switch", $P1)
# }
.annotate 'line', 7046

.end # parseSwitch

.namespace [ 'ForStatement' ]

.sub 'ForStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7059
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7060
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7061
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 7062
    __ARG_2.'unget'($P1)
.annotate 'line', 7063
.const 'Sub' $P4 = 'WSubId_80'
    $P3 = $P4(__ARG_2, self)
    setattribute self, 'initializer', $P3
# }
  __label_1: # endif
.annotate 'line', 7065
    $P1 = __ARG_2.'get'()
.annotate 'line', 7066
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_2
# {
.annotate 'line', 7067
    __ARG_2.'unget'($P1)
.annotate 'line', 7068
    self.'parseconditionshort'(__ARG_2)
.const 'Sub' $P5 = 'WSubId_43'
.annotate 'line', 7069
    $P5(';', __ARG_2)
# }
  __label_2: # endif
.annotate 'line', 7071
    $P1 = __ARG_2.'get'()
.annotate 'line', 7072
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_3
# {
.annotate 'line', 7073
    __ARG_2.'unget'($P1)
.annotate 'line', 7074
.const 'Sub' $P6 = 'WSubId_30'
    $P3 = $P6(__ARG_2, self)
    setattribute self, 'iteration', $P3
.const 'Sub' $P7 = 'WSubId_43'
.annotate 'line', 7075
    $P7(')', __ARG_2)
# }
  __label_3: # endif
.annotate 'line', 7077
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 7078

.end # ForStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7081
    getattribute $P1, self, 'initializer'
    if_null $P1, __label_1
.annotate 'line', 7082
    getattribute $P4, self, 'initializer'
    $P3 = $P4.'optimize'()
    setattribute self, 'initializer', $P3
  __label_1: # endif
.annotate 'line', 7083
    getattribute $P1, self, 'condexpr'
    if_null $P1, __label_2
.annotate 'line', 7084
    self.'optimize_condition'()
  __label_2: # endif
.annotate 'line', 7085
    getattribute $P1, self, 'iteration'
    if_null $P1, __label_3
.annotate 'line', 7086
    getattribute $P4, self, 'iteration'
    $P3 = $P4.'optimize'()
    setattribute self, 'iteration', $P3
  __label_3: # endif
.annotate 'line', 7087
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 7088
    .return(self)
# }
.annotate 'line', 7089

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7092
    getattribute $P1, self, 'initializer'
    isnull $I1, $P1
    unless $I1 goto __label_3
.annotate 'line', 7093
    getattribute $P2, self, 'condexpr'
    isnull $I1, $P2
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 7094
    getattribute $P3, self, 'iteration'
    isnull $I1, $P3
  __label_2:
    unless $I1 goto __label_1
# {
.annotate 'line', 7095
    self.'emit_infinite'(__ARG_1)
.annotate 'line', 7096
    .return()
# }
  __label_1: # endif
.annotate 'line', 7098
    __ARG_1.'comment'('for loop')
.annotate 'line', 7099
# continuelabel: $S1
    $P1 = self.'gencontinuelabel'()
    null $S1
    if_null $P1, __label_4
    set $S1, $P1
  __label_4:
.annotate 'line', 7100
# breaklabel: $S2
    $P1 = self.'genbreaklabel'()
    null $S2
    if_null $P1, __label_5
    set $S2, $P1
  __label_5:
.annotate 'line', 7101
# condlabel: $S3
    $P1 = self.'genlabel'()
    null $S3
    if_null $P1, __label_6
    set $S3, $P1
  __label_6:
.annotate 'line', 7102
    getattribute $P1, self, 'initializer'
    if_null $P1, __label_7
.annotate 'line', 7103
    getattribute $P2, self, 'initializer'
    $P2.'emit'(__ARG_1)
  __label_7: # endif
.annotate 'line', 7105
    __ARG_1.'emitlabel'($S3, 'for condition')
.annotate 'line', 7106
    getattribute $P1, self, 'condexpr'
    if_null $P1, __label_8
.annotate 'line', 7107
    self.'emit_else'(__ARG_1, $S2)
  __label_8: # endif
.annotate 'line', 7109
    getattribute $P1, self, 'body'
    $P1.'emit'(__ARG_1)
.annotate 'line', 7110
    __ARG_1.'emitlabel'($S1, 'for iteration')
.annotate 'line', 7111
    getattribute $P1, self, 'iteration'
    if_null $P1, __label_9
.annotate 'line', 7112
# unused: $S4
    getattribute $P3, self, 'iteration'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S4
    if_null $P2, __label_10
    set $S4, $P2
  __label_10:
  __label_9: # endif
.annotate 'line', 7113
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 7115
    __ARG_1.'emitlabel'($S2, 'for end')
# }
.annotate 'line', 7116

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ForStatement' ]
.annotate 'line', 7052
    get_class $P1, [ 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'BlockStatement' ]
    addparent $P0, $P2
    get_class $P3, [ 'ConditionalStatement' ]
    addparent $P0, $P3
.annotate 'line', 7054
    addattribute $P0, 'initializer'
.annotate 'line', 7055
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
.annotate 'line', 7131
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7132
# sname: $S1
    set $P1, __ARG_4
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7133
    eq __ARG_5, '', __label_2
# {
.annotate 'line', 7134
# deftype: $S2
.const 'Sub' $P2 = 'WSubId_82'
    $P1 = $P2(__ARG_5)
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
  __label_3:
.annotate 'line', 7135
    self.'createvar'($S1, $S2)
.annotate 'line', 7136
    box $P1, $S2
    setattribute self, 'deftype', $P1
# }
  __label_2: # endif
.annotate 'line', 7138
    setattribute self, 'varname', __ARG_4
.annotate 'line', 7139
.const 'Sub' $P4 = 'WSubId_30'
    $P3 = $P4(__ARG_2, self)
    setattribute self, 'container', $P3
.const 'Sub' $P5 = 'WSubId_43'
.annotate 'line', 7140
    $P5(')', __ARG_2)
.annotate 'line', 7141
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 7142

.end # ForeachStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7145
    getattribute $P3, self, 'container'
    $P2 = $P3.'optimize'()
    setattribute self, 'container', $P2
.annotate 'line', 7146
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 7147
    .return(self)
# }
.annotate 'line', 7148

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7151
    self.'annotate'(__ARG_1)
.annotate 'line', 7152
# regcont: $S1
    null $S1
.annotate 'line', 7153
    getattribute $P3, self, 'container'
    $P2 = $P3.'checkresult'()
    set $S6, $P2
    ne $S6, 'S', __label_1
# {
.annotate 'line', 7154
# value: $S2
    getattribute $P5, self, 'container'
    $P4 = $P5.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_3
    set $S2, $P4
  __label_3:
.annotate 'line', 7155
    $P2 = self.'tempreg'('P')
    set $S1, $P2
.annotate 'line', 7156
    __ARG_1.'emitbox'($S1, $S2)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 7159
    getattribute $P3, self, 'container'
    $P2 = $P3.'emit_get'(__ARG_1)
    set $S1, $P2
  __label_2: # endif
.annotate 'line', 7160
# var itvar: $P1
    getattribute $P2, self, 'varname'
    $P1 = self.'getvar'($P2)
.annotate 'line', 7161
# iterator: $S3
    $P2 = self.'createreg'('P')
    null $S3
    if_null $P2, __label_4
    set $S3, $P2
  __label_4:
.annotate 'line', 7162
# continuelabel: $S4
    $P2 = self.'gencontinuelabel'()
    null $S4
    if_null $P2, __label_5
    set $S4, $P2
  __label_5:
.annotate 'line', 7163
# breaklabel: $S5
    $P2 = self.'genbreaklabel'()
    null $S5
    if_null $P2, __label_6
    set $S5, $P2
  __label_6:
.annotate 'line', 7164
    __ARG_1.'emitarg2'('iter', $S3, $S1)
.annotate 'line', 7165
    __ARG_1.'emitset'($S3, '0')
.annotate 'line', 7166
    __ARG_1.'emitlabel'($S4, 'for iteration')
.annotate 'line', 7167
    __ARG_1.'emitunless'($S3, $S5)
.annotate 'line', 7168
    $P2 = $P1.'getreg'()
    __ARG_1.'emitarg2'('shift', $P2, $S3)
.annotate 'line', 7169
    getattribute $P2, self, 'body'
    $P2.'emit'(__ARG_1)
.annotate 'line', 7170
    __ARG_1.'emitgoto'($S4)
.annotate 'line', 7171
    __ARG_1.'emitlabel'($S5, 'endfor')
# }
.annotate 'line', 7172

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ForeachStatement' ]
.annotate 'line', 7123
    get_class $P1, [ 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'BlockStatement' ]
    addparent $P0, $P2
.annotate 'line', 7125
    addattribute $P0, 'deftype'
.annotate 'line', 7126
    addattribute $P0, 'varname'
.annotate 'line', 7127
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
.annotate 'line', 7179
    $P4('(', __ARG_2)
.annotate 'line', 7180
# var aux: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7181
# var in1: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 7182
    $P5 = $P2.'iskeyword'('in')
    if_null $P5, __label_1
    unless $P5 goto __label_1
.annotate 'line', 7183
    new $P7, [ 'ForeachStatement' ]
    $P7.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, '')
    set $P6, $P7
    .return($P6)
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 7185
# var in2: $P3
    $P3 = __ARG_2.'get'()
.annotate 'line', 7186
    $P5 = $P3.'iskeyword'('in')
    if_null $P5, __label_3
    unless $P5 goto __label_3
.annotate 'line', 7187
    new $P7, [ 'ForeachStatement' ]
    $P7.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P2, $P1)
    set $P6, $P7
    .return($P6)
  __label_3: # endif
.annotate 'line', 7188
    __ARG_2.'unget'($P3)
.annotate 'line', 7189
    __ARG_2.'unget'($P2)
.annotate 'line', 7190
    __ARG_2.'unget'($P1)
# }
  __label_2: # endif
.annotate 'line', 7192
    new $P6, [ 'ForStatement' ]
    $P6.'ForStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P5, $P6
    .return($P5)
# }
.annotate 'line', 7193

.end # parseFor

.namespace [ 'ThrowStatement' ]

.sub 'ThrowStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7205
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7206
.const 'Sub' $P3 = 'WSubId_30'
    $P2 = $P3(__ARG_2, self)
    setattribute self, 'excep', $P2
# }
.annotate 'line', 7207

.end # ThrowStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7210
    getattribute $P3, self, 'excep'
    $P2 = $P3.'optimize'()
    setattribute self, 'excep', $P2
.annotate 'line', 7211
    .return(self)
# }
.annotate 'line', 7212

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7215
# var excep: $P1
    getattribute $P1, self, 'excep'
.annotate 'line', 7216
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 7217
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 7218
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    set $S3, 'P'
    if $S2 == $S3 goto __label_4
    set $S3, 'S'
    if $S2 == $S3 goto __label_5
    goto __label_3
  __label_4: # case
.annotate 'line', 7220
    __ARG_1.'emitarg1'('throw', $S1)
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 7223
    __ARG_1.'emitarg1'('die', $S1)
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 7224
.const 'Sub' $P3 = 'WSubId_1'
.annotate 'line', 7226
    getattribute $P4, self, 'start'
    $P3("Invalid throw argument", $P4)
  __label_2: # switch end
# }
.annotate 'line', 7228

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ThrowStatement' ]
.annotate 'line', 7199
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7201
    addattribute $P0, 'excep'
.end
.namespace [ 'TryModifierList' ]

.sub 'TryModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7240
    setattribute self, 'start', __ARG_1
.annotate 'line', 7241
    self.'ModifierList'(__ARG_2, __ARG_3)
# }
.annotate 'line', 7242

.end # TryModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 7245
# var modiflist: $P1
    $P1 = self.'getlist'()
.annotate 'line', 7246
    iter $P6, $P1
    set $P6, 0
  __label_1: # for iteration
    unless $P6 goto __label_2
    shift $P2, $P6
# {
.annotate 'line', 7247
# modifname: $S1
    $P7 = $P2.'getname'()
    null $S1
    if_null $P7, __label_3
    set $S1, $P7
  __label_3:
.annotate 'line', 7248
# nargs: $I1
    $P7 = $P2.'numargs'()
    set $I1, $P7
# switch
.annotate 'line', 7249
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
.annotate 'line', 7252
    eq $I1, 1, __label_10
.const 'Sub' $P8 = 'WSubId_1'
.annotate 'line', 7253
    getattribute $P7, self, 'start'
    $P8('Wrong modifier args', $P7)
  __label_10: # endif
.annotate 'line', 7254
# var arg: $P3
    $P3 = $P2.'getarg'(0)
.annotate 'line', 7255
# argreg: $S2
    $P9 = $P3.'emit_get'(__ARG_1)
    null $S2
    if_null $P9, __label_11
    set $S2, $P9
  __label_11:
.annotate 'line', 7256
    __ARG_1.'say'('    ', __ARG_2, ".'", $S1, "'(", $S2, ")")
    goto __label_4 # break
  __label_8: # case
  __label_9: # case
.annotate 'line', 7260
    new $P4, ['ResizableStringArray']
# for loop
.annotate 'line', 7261
# i: $I2
    null $I2
  __label_14: # for condition
    ge $I2, $I1, __label_13
# {
.annotate 'line', 7262
# var arg: $P5
    $P5 = $P2.'getarg'($I2)
.annotate 'line', 7263
    $P7 = $P5.'emit_get'(__ARG_1)
# predefined push
    push $P4, $P7
# }
  __label_12: # for iteration
.annotate 'line', 7261
    inc $I2
    goto __label_14
  __label_13: # for end
.annotate 'line', 7266
# predefined join
.annotate 'line', 7265
    join $S3, ', ', $P4
    __ARG_1.'say'('    ', __ARG_2, ".'", $S1, "'(", $S3, ")")
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 7267
.const 'Sub' $P10 = 'WSubId_1'
.annotate 'line', 7269
    concat $S4, "Modifier '", $S1
    concat $S4, $S4, "' not valid for try"
    getattribute $P7, self, 'start'
    $P10($S4, $P7)
  __label_4: # switch end
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 7272

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TryModifierList' ]
.annotate 'line', 7235
    get_class $P1, [ 'ModifierList' ]
    addparent $P0, $P1
.annotate 'line', 7237
    addattribute $P0, 'start'
.end
.namespace [ 'TryStatement' ]

.sub 'TryStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7284
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7285
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7286
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 7287
    new $P5, [ 'TryModifierList' ]
    $P5.'TryModifierList'($P1, __ARG_2, self)
    set $P4, $P5
    setattribute self, 'modifiers', $P4
    goto __label_2
  __label_1: # else
.annotate 'line', 7289
    __ARG_2.'unget'($P1)
  __label_2: # endif
.annotate 'line', 7291
.const 'Sub' $P6 = 'WSubId_80'
    $P3 = $P6(__ARG_2, self)
    setattribute self, 'stry', $P3
.annotate 'line', 7292
    $P1 = __ARG_2.'get'()
.annotate 'line', 7293
    $P2 = $P1.'iskeyword'('catch')
    isfalse $I1, $P2
    unless $I1 goto __label_3
.const 'Sub' $P7 = 'WSubId_2'
.annotate 'line', 7294
    $P7('catch', $P1)
  __label_3: # endif
.annotate 'line', 7295
    $P1 = __ARG_2.'get'()
.annotate 'line', 7296
    $P2 = $P1.'isop'('(')
    isfalse $I1, $P2
    unless $I1 goto __label_4
.const 'Sub' $P8 = 'WSubId_29'
.annotate 'line', 7297
    $P8("'(' after 'catch'", $P1)
  __label_4: # endif
.annotate 'line', 7298
    $P1 = __ARG_2.'get'()
.annotate 'line', 7299
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_5
# {
.annotate 'line', 7300
# exname: $S1
    $P3 = $P1.'getidentifier'()
    null $S1
    if_null $P3, __label_6
    set $S1, $P3
  __label_6:
.annotate 'line', 7301
    setattribute self, 'exname', $P1
.annotate 'line', 7302
    self.'createvar'($S1, 'P')
.annotate 'line', 7303
    $P1 = __ARG_2.'get'()
.annotate 'line', 7304
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_7
.const 'Sub' $P9 = 'WSubId_29'
.annotate 'line', 7305
    $P9("')' in 'catch'", $P1)
  __label_7: # endif
# }
  __label_5: # endif
.annotate 'line', 7307
.const 'Sub' $P10 = 'WSubId_80'
    $P3 = $P10(__ARG_2, self)
    setattribute self, 'scatch', $P3
# }
.annotate 'line', 7308

.end # TryStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7311
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_1
.annotate 'line', 7312
    getattribute $P2, self, 'modifiers'
    $P2.'optimize'()
  __label_1: # endif
.annotate 'line', 7313
    getattribute $P3, self, 'stry'
    $P2 = $P3.'optimize'()
    setattribute self, 'stry', $P2
.annotate 'line', 7314
    getattribute $P3, self, 'scatch'
    $P2 = $P3.'optimize'()
    setattribute self, 'scatch', $P2
.annotate 'line', 7315
    .return(self)
# }
.annotate 'line', 7316

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7319
# reghandler: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7320
# labelhandler: $S2
    $P1 = self.'genlabel'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 7321
# labelpasthandler: $S3
    $P1 = self.'genlabel'()
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 7322
# exreg: $S4
    getattribute $P2, self, 'exname'
    if_null $P2, __label_5
.annotate 'line', 7323
    getattribute $P4, self, 'exname'
    $P3 = self.'getvar'($P4)
    $P1 = $P3.'getreg'()
    goto __label_4
  __label_5:
.annotate 'line', 7324
    $P1 = self.'tempreg'('P')
  __label_4:
    null $S4
    if_null $P1, __label_6
    set $S4, $P1
  __label_6:
.annotate 'line', 7326
    self.'annotate'(__ARG_1)
.annotate 'line', 7327
    __ARG_1.'comment'('try: create handler')
.annotate 'line', 7329
    __ARG_1.'say'('    ', 'new ', $S1, ", 'ExceptionHandler'")
.annotate 'line', 7330
    __ARG_1.'say'('    ', 'set_label ', $S1, ', ', $S2)
.annotate 'line', 7332
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_7
.annotate 'line', 7333
    getattribute $P2, self, 'modifiers'
    $P2.'emitmodifiers'(__ARG_1, $S1)
  __label_7: # endif
.annotate 'line', 7335
    __ARG_1.'emitarg1'('push_eh', $S1)
.annotate 'line', 7336
    __ARG_1.'comment'('try: begin')
.annotate 'line', 7337
    getattribute $P1, self, 'stry'
    $P1.'emit'(__ARG_1)
.annotate 'line', 7338
    __ARG_1.'comment'('try: end')
.annotate 'line', 7339
    __ARG_1.'say'('    ', 'pop_eh')
.annotate 'line', 7341
    self.'annotate'(__ARG_1)
.annotate 'line', 7342
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 7344
    __ARG_1.'comment'('catch')
.annotate 'line', 7345
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 7346
    __ARG_1.'say'('    ', '.get_results(', $S4, ')')
.annotate 'line', 7347
    __ARG_1.'emitarg1'('finalize', $S4)
.annotate 'line', 7348
    __ARG_1.'say'('    ', 'pop_eh')
.annotate 'line', 7349
    getattribute $P1, self, 'scatch'
    $P1.'emit'(__ARG_1)
.annotate 'line', 7351
    __ARG_1.'comment'('catch end')
.annotate 'line', 7352
    __ARG_1.'emitlabel'($S3)
# }
.annotate 'line', 7353

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TryStatement' ]
.annotate 'line', 7275
    get_class $P1, [ 'BlockStatement' ]
    addparent $P0, $P1
.annotate 'line', 7277
    addattribute $P0, 'stry'
.annotate 'line', 7278
    addattribute $P0, 'modifiers'
.annotate 'line', 7279
    addattribute $P0, 'exname'
.annotate 'line', 7280
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
.annotate 'line', 7366
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7367
    setattribute self, 'name', __ARG_3
.annotate 'line', 7368
# var vdata: $P1
    $P1 = self.'createvar'(__ARG_3, 'P', __ARG_4)
.annotate 'line', 7369
    $P3 = $P1.'getreg'()
    setattribute self, 'reg', $P3
# }
.annotate 'line', 7370

.end # initvarbase

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'VarBaseStatement' ]
.annotate 'line', 7360
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7362
    addattribute $P0, 'name'
.annotate 'line', 7363
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
.annotate 'line', 7385
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7386
    setattribute self, 'name', __ARG_3
.annotate 'line', 7387
    box $P1, __ARG_4
    setattribute self, 'basetype', $P1
# }
.annotate 'line', 7388

.end # DeclareBase

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'DeclareBase' ]
.annotate 'line', 7377
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7379
    addattribute $P0, 'name'
.annotate 'line', 7380
    addattribute $P0, 'basetype'
.annotate 'line', 7381
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
.annotate 'line', 7399
    self.'DeclareBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 7400
# var vdata: $P1
    getattribute $P3, self, 'name'
    getattribute $P4, self, 'basetype'
    $P1 = self.'createvar'($P3, $P4)
.annotate 'line', 7401
    $P4 = $P1.'getreg'()
    setattribute self, 'reg', $P4
.annotate 'line', 7402
# var t: $P2
    $P2 = __ARG_5.'get'()
.annotate 'line', 7403
    $P3 = $P2.'isop'('=')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 7405
.const 'Sub' $P6 = 'WSubId_30'
    $P5 = $P6(__ARG_5, self)
    setattribute self, 'init', $P5
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 7408
    __ARG_5.'unget'($P2)
  __label_2: # endif
# }
.annotate 'line', 7409

.end # DeclareSingleStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7412
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 7413
    if_null $P1, __label_1
.annotate 'line', 7414
    $P3 = $P1.'optimize'()
    setattribute self, 'init', $P3
  __label_1: # endif
.annotate 'line', 7415
    .return(self)
# }
.annotate 'line', 7416

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7419
    self.'annotate'(__ARG_1)
.annotate 'line', 7420
# name: $S1
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 7421
# reg: $S2
    getattribute $P2, self, 'reg'
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 7422
# basetype: $S3
    getattribute $P2, self, 'basetype'
    null $S3
    if_null $P2, __label_3
    set $S3, $P2
  __label_3:
.annotate 'line', 7423
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 7424
    concat $S7, $S1, ': '
    concat $S7, $S7, $S2
    __ARG_1.'comment'($S7)
.annotate 'line', 7426
    isnull $I1, $P1
    if $I1 goto __label_6
    $I1 = $P1.'isnull'()
  __label_6:
    unless $I1 goto __label_4
.annotate 'line', 7427
    __ARG_1.'emitnull'($S2)
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 7429
# itype: $S4
    $P2 = $P1.'checkresult'()
    null $S4
    if_null $P2, __label_7
    set $S4, $P2
  __label_7:
.annotate 'line', 7430
    ne $S4, $S3, __label_8
# {
.annotate 'line', 7431
    iseq $I1, $S4, 'S'
    unless $I1 goto __label_12
    isa $I1, $P1, [ 'ConcatString' ]
  __label_12:
    unless $I1 goto __label_10
.annotate 'line', 7432
    $P1.'emit_concat_set'(__ARG_1, $S2)
    goto __label_11
  __label_10: # else
.annotate 'line', 7434
    $P1.'emit'(__ARG_1, $S2)
  __label_11: # endif
# }
    goto __label_9
  __label_8: # else
# {
.annotate 'line', 7437
    isa $I1, $P1, [ 'IndexExpr' ]
    unless $I1 goto __label_13
# {
.annotate 'line', 7439
    $P1.'emit'(__ARG_1, $S2)
# }
    goto __label_14
  __label_13: # else
# {
.annotate 'line', 7442
# ireg: $S5
    null $S5
# switch
.annotate 'line', 7443
    set $S7, $S4
    set $S8, 'v'
    if $S7 == $S8 goto __label_17
    set $S8, ''
    if $S7 == $S8 goto __label_18
    goto __label_16
  __label_17: # case
.const 'Sub' $P3 = 'WSubId_1'
.annotate 'line', 7445
    getattribute $P2, self, 'start'
    $P3('Invalid initialization from void value', $P2)
  __label_18: # case
.annotate 'line', 7447
    $P4 = $P1.'emit_get'(__ARG_1)
    set $S5, $P4
    goto __label_15 # break
  __label_16: # default
.annotate 'line', 7450
    $P5 = self.'tempreg'($S4)
    set $S5, $P5
.annotate 'line', 7451
    $P1.'emit'(__ARG_1, $S5)
  __label_15: # switch end
.annotate 'line', 7453
    iseq $I1, $S3, 'S'
    unless $I1 goto __label_21
    iseq $I1, $S4, 'P'
  __label_21:
    unless $I1 goto __label_19
# {
.annotate 'line', 7454
# auxlabel: $S6
    $P2 = self.'genlabel'()
    null $S6
    if_null $P2, __label_22
    set $S6, $P2
  __label_22:
.annotate 'line', 7455
    __ARG_1.'emitnull'($S2)
.annotate 'line', 7456
    __ARG_1.'emitif_null'($S5, $S6)
.annotate 'line', 7457
    __ARG_1.'emitset'($S2, $S5)
.annotate 'line', 7458
    __ARG_1.'emitlabel'($S6)
# }
    goto __label_20
  __label_19: # else
.annotate 'line', 7461
    __ARG_1.'emitset'($S2, $S5)
  __label_20: # endif
# }
  __label_14: # endif
# }
  __label_9: # endif
# }
  __label_5: # endif
# }
.annotate 'line', 7465

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'DeclareSingleStatement' ]
.annotate 'line', 7393
    get_class $P1, [ 'DeclareBase' ]
    addparent $P0, $P1
.annotate 'line', 7395
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
.annotate 'line', 7480
    self.'DeclareBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 7481
    box $P3, __ARG_5
    setattribute self, 'arraytype', $P3
.annotate 'line', 7482
# var vdata: $P1
    getattribute $P3, self, 'name'
    $P1 = self.'createvar'($P3, 'P')
.annotate 'line', 7483
    $P4 = $P1.'getreg'()
    setattribute self, 'reg', $P4
.annotate 'line', 7484
# var t: $P2
    $P2 = __ARG_6.'get'()
.annotate 'line', 7485
    $P3 = $P2.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_1
# {
.annotate 'line', 7487
    __ARG_6.'unget'($P2)
.annotate 'line', 7488
.const 'Sub' $P5 = 'WSubId_30'
    $P4 = $P5(__ARG_6, self)
    setattribute self, 'size', $P4
.const 'Sub' $P6 = 'WSubId_43'
.annotate 'line', 7489
    $P6(']', __ARG_6)
# }
  __label_1: # endif
.annotate 'line', 7491
    $P2 = __ARG_6.'get'()
.annotate 'line', 7492
    $P3 = $P2.'isop'('=')
    if_null $P3, __label_2
    unless $P3 goto __label_2
# {
.annotate 'line', 7493
    $P2 = __ARG_6.'get'()
.annotate 'line', 7494
    $P3 = $P2.'isop'('[')
    isfalse $I1, $P3
    unless $I1 goto __label_4
.const 'Sub' $P7 = 'WSubId_29'
.annotate 'line', 7495
    $P7("array initializer", $P2)
  __label_4: # endif
.annotate 'line', 7496
    $P2 = __ARG_6.'get'()
.annotate 'line', 7497
    $P3 = $P2.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_5
# {
.annotate 'line', 7498
    __ARG_6.'unget'($P2)
.annotate 'line', 7499
.const 'Sub' $P8 = 'parseExpr'
.annotate 'line', 7500
.const 'Sub' $P9 = 'WSubId_27'
    $P4 = $P9(__ARG_6, self, $P8, ']')
    setattribute self, 'initarray', $P4
# }
  __label_5: # endif
# }
    goto __label_3
  __label_2: # else
.annotate 'line', 7504
    __ARG_6.'unget'($P2)
  __label_3: # endif
# }
.annotate 'line', 7505

.end # DeclareArrayStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7508
    getattribute $P1, self, 'size'
    if_null $P1, __label_1
.annotate 'line', 7509
    getattribute $P4, self, 'size'
    $P3 = $P4.'optimize'()
    setattribute self, 'size', $P3
  __label_1: # endif
.const 'Sub' $P5 = 'WSubId_28'
.annotate 'line', 7510
    getattribute $P1, self, 'initarray'
    $P5($P1)
.annotate 'line', 7511
    .return(self)
# }
.annotate 'line', 7512

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7515
    self.'annotate'(__ARG_1)
.annotate 'line', 7517
# var reg: $P1
    getattribute $P1, self, 'reg'
.annotate 'line', 7518
# var size: $P2
    getattribute $P2, self, 'size'
.annotate 'line', 7519
# var init: $P3
    getattribute $P3, self, 'initarray'
.annotate 'line', 7520
# var basetype: $P4
    getattribute $P4, self, 'basetype'
.annotate 'line', 7521
# arraytype: $S1
# predefined string
    getattribute $P6, self, 'arraytype'
    set $S4, $P6
    concat $S1, $S4, 'Array'
.annotate 'line', 7522
    if_null $P2, __label_1
# {
.annotate 'line', 7524
# regsize: $S2
    $P6 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P6, __label_3
    set $S2, $P6
  __label_3:
.annotate 'line', 7525
    __ARG_1.'say'('    ', 'new ', $P1, ", ['Fixed", $S1, "'], ", $S2)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 7529
    __ARG_1.'say'('    ', 'new ', $P1, ", ['Resizable", $S1, "']")
# }
  __label_2: # endif
.annotate 'line', 7531
    if_null $P3, __label_4
# {
.annotate 'line', 7532
# itemreg: $S3
    $P6 = self.'tempreg'($P4)
    null $S3
    if_null $P6, __label_5
    set $S3, $P6
  __label_5:
.annotate 'line', 7533
# n: $I1
# predefined elements
    elements $I1, $P3
.annotate 'line', 7534
    unless_null $P2, __label_6
# {
.annotate 'line', 7535
    le $I1, 0, __label_7
# {
.annotate 'line', 7537
    __ARG_1.'emitset'($P1, $I1)
# }
  __label_7: # endif
# }
  __label_6: # endif
.annotate 'line', 7540
# i: $I2
    null $I2
.annotate 'line', 7541
    iter $P7, $P3
    set $P7, 0
  __label_8: # for iteration
    unless $P7 goto __label_9
    shift $P5, $P7
# {
.annotate 'line', 7542
    $P5.'emit'(__ARG_1, $S3)
.annotate 'line', 7543
    __ARG_1.'say'('    ', $P1, '[', $I2, '] = ', $S3)
.annotate 'line', 7544
    inc $I2
# }
    goto __label_8
  __label_9: # endfor
# }
  __label_4: # endif
# }
.annotate 'line', 7547

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'DeclareArrayStatement' ]
.annotate 'line', 7470
    get_class $P1, [ 'DeclareBase' ]
    addparent $P0, $P1
.annotate 'line', 7472
    addattribute $P0, 'size'
.annotate 'line', 7473
    addattribute $P0, 'initarray'
.annotate 'line', 7474
    addattribute $P0, 'arraytype'
.end
.namespace [ ]

.sub 'parseDeclareHelper' :subid('WSubId_84')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 7554
# var next: $P1
    null $P1
.annotate 'line', 7555
# var r: $P2
    null $P2
  __label_1: # do
.annotate 'line', 7556
# {
.annotate 'line', 7557
# var name: $P3
    $P3 = __ARG_4.'get'()
.const 'Sub' $P6 = 'WSubId_79'
.annotate 'line', 7558
    $P6($P3)
.annotate 'line', 7559
# var t: $P4
    $P4 = __ARG_4.'get'()
.annotate 'line', 7560
# var item: $P5
    null $P5
.annotate 'line', 7561
    $P7 = $P4.'isop'('[')
    if_null $P7, __label_4
    unless $P7 goto __label_4
.annotate 'line', 7562
    $P5 = __ARG_2(__ARG_3, __ARG_5, __ARG_4, $P3)
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 7564
    __ARG_4.'unget'($P4)
.annotate 'line', 7565
    $P5 = __ARG_1(__ARG_3, __ARG_5, $P3, __ARG_4)
# }
  __label_5: # endif
.annotate 'line', 7567
.const 'Sub' $P8 = 'WSubId_83'
    $P2 = $P8($P2, $P5)
.annotate 'line', 7568
    $P1 = __ARG_4.'get'()
# }
  __label_3: # continue
.annotate 'line', 7569
    $P7 = $P1.'isop'(',')
    if_null $P7, __label_2
    if $P7 goto __label_1
  __label_2: # enddo
.const 'Sub' $P9 = 'WSubId_4'
.annotate 'line', 7570
    $P9(';', $P1)
.annotate 'line', 7571
    .return($P2)
# }
.annotate 'line', 7572

.end # parseDeclareHelper

.namespace [ 'IntStatement' ]

.sub 'IntStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7580
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'I', __ARG_4)
# }
.annotate 'line', 7581

.end # IntStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IntStatement' ]
.annotate 'line', 7576
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
.annotate 'line', 7588
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'I', 'Integer', __ARG_4)
# }
.annotate 'line', 7589

.end # IntArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IntArrayStatement' ]
.annotate 'line', 7584
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
.annotate 'line', 7595
    new $P2, [ 'IntStatement' ]
    $P2.'IntStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7596

.end # newIntSingle


.sub 'newIntArray'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7600
    new $P2, [ 'IntArrayStatement' ]
    $P2.'IntArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7601

.end # newIntArray


.sub 'parseInt' :subid('WSubId_38')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7605
.const 'Sub' $P1 = 'newIntSingle'
.const 'Sub' $P2 = 'newIntArray'
.annotate 'line', 7606
.const 'Sub' $P3 = 'WSubId_84'
    .tailcall $P3($P1, $P2, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7607

.end # parseInt

.namespace [ 'FloatStatement' ]

.sub 'FloatStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7615
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'N', __ARG_4)
# }
.annotate 'line', 7616

.end # FloatStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FloatStatement' ]
.annotate 'line', 7611
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
.annotate 'line', 7623
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'N', 'Float', __ARG_4)
# }
.annotate 'line', 7624

.end # FloatArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FloatArrayStatement' ]
.annotate 'line', 7619
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
.annotate 'line', 7630
    new $P2, [ 'FloatStatement' ]
    $P2.'FloatStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7631

.end # newFloatSingle


.sub 'newFloatArray'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7635
    new $P2, [ 'FloatArrayStatement' ]
    $P2.'FloatArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7636

.end # newFloatArray


.sub 'parseFloat' :subid('WSubId_39')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7640
.const 'Sub' $P1 = 'newFloatSingle'
.const 'Sub' $P2 = 'newFloatArray'
.annotate 'line', 7641
.const 'Sub' $P3 = 'WSubId_84'
    .tailcall $P3($P1, $P2, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7642

.end # parseFloat

.namespace [ 'StringStatement' ]

.sub 'StringStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7650
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'S', __ARG_4)
# }
.annotate 'line', 7651

.end # StringStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'StringStatement' ]
.annotate 'line', 7646
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
.annotate 'line', 7658
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'S', 'String', __ARG_4)
# }
.annotate 'line', 7659

.end # StringArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'StringArrayStatement' ]
.annotate 'line', 7654
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
.annotate 'line', 7665
    new $P2, [ 'StringStatement' ]
    $P2.'StringStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7666

.end # newStringSingle


.sub 'newStringArray'
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7670
    new $P2, [ 'StringArrayStatement' ]
    $P2.'StringArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7671

.end # newStringArray


.sub 'parseString' :subid('WSubId_37')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7675
.const 'Sub' $P1 = 'newStringSingle'
.const 'Sub' $P2 = 'newStringArray'
.annotate 'line', 7676
.const 'Sub' $P3 = 'WSubId_84'
    .tailcall $P3($P1, $P2, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7677

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
.annotate 'line', 7692
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7693
    box $P1, __ARG_3
    setattribute self, 'type', $P1
.annotate 'line', 7694
    setattribute self, 'name', __ARG_4
.annotate 'line', 7695
    setattribute self, 'value', __ARG_5
# }
.annotate 'line', 7696

.end # ConstStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7699
# var value: $P1
    getattribute $P1, self, 'value'
.annotate 'line', 7700
# var name: $P2
    getattribute $P2, self, 'name'
.annotate 'line', 7701
# type: $S1
    getattribute $P3, self, 'type'
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 7702
    $P1 = $P1.'optimize'()
.annotate 'line', 7703
    $P3 = $P1.'hascompilevalue'()
    isfalse $I1, $P3
    unless $I1 goto __label_2
# {
.const 'Sub' $P4 = 'WSubId_1'
.annotate 'line', 7705
    getattribute $P5, self, 'start'
.annotate 'line', 7704
    $P4('Value for const is not evaluable at compile time', $P5)
# }
  __label_2: # endif
.annotate 'line', 7707
    self.'createconst'($P2, $S1, $P1, '')
.annotate 'line', 7708
    setattribute self, 'value', $P1
.annotate 'line', 7709
    .return(self)
# }
.annotate 'line', 7710

.end # optimize


.sub 'checkresult' :method
# Body
# {
.const 'Sub' $P1 = 'WSubId_6'
.annotate 'line', 7713
    getattribute $P2, self, 'start'
    $P1('Direct use of const', $P2)
# }
.annotate 'line', 7714

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7717
# predefined string
    getattribute $P1, self, 'name'
    set $S1, $P1
    concat $S2, 'Constant ', $S1
    concat $S2, $S2, ' evaluated at compile time'
    __ARG_1.'comment'($S2)
# }
.annotate 'line', 7718

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ConstStatement' ]
.annotate 'line', 7683
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7685
    addattribute $P0, 'type'
.annotate 'line', 7686
    addattribute $P0, 'name'
.annotate 'line', 7687
    addattribute $P0, 'value'
.end
.namespace [ ]

.sub 'parseConst' :subid('WSubId_34')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7723
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7724
# type: $S1
.const 'Sub' $P6 = 'WSubId_82'
    $P5 = $P6($P1)
    null $S1
    if_null $P5, __label_1
    set $S1, $P5
  __label_1:
.annotate 'line', 7725
    isne $I1, $S1, 'I'
    unless $I1 goto __label_4
    isne $I1, $S1, 'N'
  __label_4:
    unless $I1 goto __label_3
    isne $I1, $S1, 'S'
  __label_3:
    unless $I1 goto __label_2
.const 'Sub' $P7 = 'WSubId_1'
.annotate 'line', 7726
    $P7('Invalid type for const', __ARG_1)
  __label_2: # endif
.annotate 'line', 7728
# var multi: $P2
    null $P2
  __label_5: # do
.annotate 'line', 7729
# {
.annotate 'line', 7730
    $P1 = __ARG_2.'get'()
.annotate 'line', 7731
# var name: $P3
    set $P3, $P1
.const 'Sub' $P8 = 'WSubId_43'
.annotate 'line', 7732
    $P8('=', __ARG_2)
.annotate 'line', 7733
# var value: $P4
.const 'Sub' $P9 = 'WSubId_30'
    $P4 = $P9(__ARG_2, __ARG_3)
.annotate 'line', 7734
.const 'Sub' $P10 = 'WSubId_83'
.annotate 'line', 7735
    new $P11, [ 'ConstStatement' ]
    $P11.'ConstStatement'($P1, __ARG_3, $S1, $P3, $P4)
    set $P5, $P11
.annotate 'line', 7734
    $P2 = $P10($P2, $P5)
# }
  __label_7: # continue
.annotate 'line', 7736
    $P1 = __ARG_2.'get'()
    $P5 = $P1.'isop'(',')
    if_null $P5, __label_6
    if $P5 goto __label_5
  __label_6: # enddo
.annotate 'line', 7737
    .return($P2)
# }
.annotate 'line', 7738

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
.annotate 'line', 7749
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 7750
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7751
    $P2 = $P1.'isop'('=')
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 7752
.const 'Sub' $P5 = 'WSubId_30'
    $P4 = $P5(__ARG_2, self)
    setattribute self, 'init', $P4
.annotate 'line', 7753
    $P1 = __ARG_2.'get'()
# }
  __label_1: # endif
.const 'Sub' $P6 = 'WSubId_4'
.annotate 'line', 7755
    $P6(';', $P1)
# }
.annotate 'line', 7756

.end # VarStatement


.sub 'optimize_init' :method
# Body
# {
.annotate 'line', 7759
    getattribute $P1, self, 'init'
    if_null $P1, __label_1
.annotate 'line', 7760
    getattribute $P4, self, 'init'
    $P3 = $P4.'optimize'()
    setattribute self, 'init', $P3
  __label_1: # endif
.annotate 'line', 7761
    .return(self)
# }
.annotate 'line', 7762

.end # optimize_init


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7765
    .tailcall self.'optimize_init'()
# }
.annotate 'line', 7766

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7769
    self.'annotate'(__ARG_1)
.annotate 'line', 7770
# name: $S1
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 7771
# reg: $S2
    getattribute $P2, self, 'reg'
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 7772
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 7773
    concat $S4, 'var ', $S1
    concat $S4, $S4, ': '
    concat $S4, $S4, $S2
    __ARG_1.'comment'($S4)
.annotate 'line', 7774
    if_null $P1, __label_3
.annotate 'line', 7775
    $P2 = $P1.'isnull'()
    if_null $P2, __label_4
    unless $P2 goto __label_4
.annotate 'line', 7776
    null $P1
  __label_4: # endif
  __label_3: # endif
.annotate 'line', 7777
    if_null $P1, __label_5
# {
# switch
.annotate 'line', 7778
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
# value: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_18
    set $S3, $P3
  __label_18:
.annotate 'line', 7789
    __ARG_1.'emitbox'($S2, $S3)
    goto __label_7 # break
  __label_13: # case
.annotate 'line', 7790
.const 'Sub' $P4 = 'WSubId_1'
.annotate 'line', 7792
    getattribute $P5, self, 'name'
    $P4("Can't use void function as initializer", $P5)
  __label_8: # default
.const 'Sub' $P6 = 'WSubId_1'
.annotate 'line', 7794
    getattribute $P7, self, 'name'
    $P6("Invalid var initializer", $P7)
  __label_7: # switch end
# }
    goto __label_6
  __label_5: # else
.annotate 'line', 7798
    __ARG_1.'emitnull'($S2)
  __label_6: # endif
# }
.annotate 'line', 7799

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'VarStatement' ]
.annotate 'line', 7744
    get_class $P1, [ 'VarBaseStatement' ]
    addparent $P0, $P1
.annotate 'line', 7746
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
.const 'Sub' $P1 = 'WSubId_43'
.annotate 'line', 7807
    $P1(';', __ARG_2)
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
# reg: $S1
    getattribute $P1, self, 'reg'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7813
# predefined string
    getattribute $P1, self, 'name'
    set $S2, $P1
    concat $S3, 'var ', $S2
    concat $S3, $S3, '[] : '
    concat $S3, $S3, $S1
    __ARG_1.'comment'($S3)
.annotate 'line', 7814
    __ARG_1.'say'('    ', 'new ', $S1, ", 'ResizablePMCArray'")
# }
.annotate 'line', 7815

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
.annotate 'line', 7824
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 7825
.const 'Sub' $P3 = 'WSubId_30'
    $P2 = $P3(__ARG_2, self)
    setattribute self, 'exprsize', $P2
.const 'Sub' $P4 = 'WSubId_43'
.annotate 'line', 7826
    $P4(']', __ARG_2)
.const 'Sub' $P5 = 'WSubId_43'
.annotate 'line', 7827
    $P5(';', __ARG_2)
# }
.annotate 'line', 7828

.end # FixedVarStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7831
    getattribute $P3, self, 'exprsize'
    $P2 = $P3.'optimize'()
    setattribute self, 'exprsize', $P2
.annotate 'line', 7832
    .tailcall self.'optimize_init'()
# }
.annotate 'line', 7833

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7836
# regsize: $S1
    getattribute $P2, self, 'exprsize'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7837
    self.'annotate'(__ARG_1)
.annotate 'line', 7838
# reg: $S2
    getattribute $P1, self, 'reg'
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 7839
# predefined string
    getattribute $P1, self, 'name'
    set $S3, $P1
    concat $S4, 'var ', $S3
    concat $S4, $S4, '[] : '
    concat $S4, $S4, $S2
    __ARG_1.'comment'($S4)
.annotate 'line', 7840
    __ARG_1.'say'('    ', 'new ', $S2, ", 'FixedPMCArray', ", $S1)
# }
.annotate 'line', 7841

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FixedVarStatement' ]
.annotate 'line', 7818
    get_class $P1, [ 'VarStatement' ]
    addparent $P0, $P1
.annotate 'line', 7820
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
.annotate 'line', 7846
# var name: $P1
    $P1 = __ARG_2.'get'()
.const 'Sub' $P3 = 'WSubId_79'
.annotate 'line', 7847
    $P3($P1)
.annotate 'line', 7848
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 7849
    $P4 = $P2.'isop'('[')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 7850
    $P2 = __ARG_2.'get'()
.annotate 'line', 7851
    $P4 = $P2.'isop'(']')
    if_null $P4, __label_3
    unless $P4 goto __label_3
.annotate 'line', 7852
    new $P6, [ 'ResizableVarStatement' ]
    $P6.'ResizableVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P5, $P6
    .return($P5)
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 7854
    __ARG_2.'unget'($P2)
.annotate 'line', 7855
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
.annotate 'line', 7859
    __ARG_2.'unget'($P2)
.annotate 'line', 7860
    new $P5, [ 'VarStatement' ]
    $P5.'VarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, __ARG_4)
    set $P4, $P5
    .return($P4)
# }
  __label_2: # endif
# }
.annotate 'line', 7862

.end # parseVar


.sub 'parseVolatile' :subid('WSubId_35')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7866
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7867
    $P2 = $P1.'iskeyword'('var')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.const 'Sub' $P3 = 'WSubId_1'
.annotate 'line', 7868
    $P3("invalid volatile type", $P1)
  __label_1: # endif
.annotate 'line', 7869
.const 'Sub' $P4 = 'WSubId_36'
    .tailcall $P4(__ARG_1, __ARG_2, __ARG_3, 1)
# }
.annotate 'line', 7870

.end # parseVolatile

.namespace [ 'CompoundStatement' ]

.sub 'CompoundStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7883
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7884
    root_new $P4, ['parrot';'Hash']
    setattribute self, 'labels', $P4
.annotate 'line', 7885
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'statements', $P4
.annotate 'line', 7886
# var t: $P1
    null $P1
  __label_2: # while
.annotate 'line', 7887
    $P1 = __ARG_2.'get'()
    $P3 = $P1.'isop'('}')
    isfalse $I1, $P3
    unless $I1 goto __label_1
# {
.annotate 'line', 7888
    __ARG_2.'unget'($P1)
.annotate 'line', 7889
# var c: $P2
.const 'Sub' $P6 = 'WSubId_80'
    $P2 = $P6(__ARG_2, self)
.annotate 'line', 7890
    unless_null $P2, __label_3
.const 'Sub' $P7 = 'WSubId_6'
.annotate 'line', 7891
    $P7('Unexpected null statement')
  __label_3: # endif
.annotate 'line', 7892
    getattribute $P3, self, 'statements'
# predefined push
    push $P3, $P2
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7894
    setattribute self, 'end', $P1
# }
.annotate 'line', 7895

.end # CompoundStatement


.sub 'getlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7898
# s: $S1
    set $P2, __ARG_1
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 7899
# var labels: $P1
    getattribute $P1, self, 'labels'
.annotate 'line', 7900
# exist: $S2
    $S2 = $P1[$S1]
.annotate 'line', 7901
    isnull $I1, $S2
    if $I1 goto __label_3
    iseq $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 7902
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getlabel'(__ARG_1)
    set $S2, $P2
  __label_2: # endif
.annotate 'line', 7903
    .return($S2)
# }
.annotate 'line', 7904

.end # getlabel


.sub 'createlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7907
# s: $S1
    set $P2, __ARG_1
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 7908
# var labels: $P1
    getattribute $P1, self, 'labels'
.annotate 'line', 7909
# exist: $S2
    $S2 = $P1[$S1]
.annotate 'line', 7910
    isnull $I1, $S2
    not $I1
    unless $I1 goto __label_3
    isne $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
.const 'Sub' $P3 = 'WSubId_1'
.annotate 'line', 7911
    $P3('Label already defined', __ARG_1)
  __label_2: # endif
.annotate 'line', 7912
# value: $S3
    $P2 = self.'genlabel'()
    null $S3
    if_null $P2, __label_4
    set $S3, $P2
  __label_4:
.annotate 'line', 7913
    $P1[$S1] = $S3
.annotate 'line', 7914
    .return($S3)
# }
.annotate 'line', 7915

.end # createlabel


.sub 'getend' :method
# Body
# {
.annotate 'line', 7916
    getattribute $P1, self, 'end'
    .return($P1)
# }

.end # getend


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7919
    __ARG_1.'comment'('{')
.annotate 'line', 7920
    getattribute $P2, self, 'statements'
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
# {
.annotate 'line', 7921
    $P1.'emit'(__ARG_1)
.annotate 'line', 7922
    self.'freetemps'()
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 7924
    __ARG_1.'comment'('}')
# }
.annotate 'line', 7925

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CompoundStatement' ]
.annotate 'line', 7876
    get_class $P1, [ 'MultiStatementBase' ]
    addparent $P0, $P1
    get_class $P2, [ 'BlockStatement' ]
    addparent $P0, $P2
.annotate 'line', 7878
    addattribute $P0, 'end'
.annotate 'line', 7879
    addattribute $P0, 'labels'
.end
.namespace [ 'RegisterStore' ]

.sub 'RegisterStore' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 7940
    box $P3, __ARG_1
    setattribute self, 'type', $P3
.annotate 'line', 7942
    box $P3, 1
    setattribute self, 'nreg', $P3
.annotate 'line', 7943
    new $P1, ['ResizableStringArray']
.annotate 'line', 7944
    new $P2, ['ResizableStringArray']
.annotate 'line', 7945
    setattribute self, 'tempreg', $P1
.annotate 'line', 7946
    setattribute self, 'freereg', $P2
# }
.annotate 'line', 7947

.end # RegisterStore


.sub 'createreg' :method
# Body
# {
.annotate 'line', 7950
# var n: $P1
    getattribute $P1, self, 'nreg'
.annotate 'line', 7951
# i: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 7952
# reg: $S1
    set $I2, $I1
    inc $I1
    set $S1, $I2
.annotate 'line', 7953
    assign $P1, $I1
# predefined string
.annotate 'line', 7954
    getattribute $P2, self, 'type'
.annotate 'line', 7949
    set $S2, $P2
.annotate 'line', 7954
    concat $S3, '$', $S2
    concat $S3, $S3, $S1
    .return($S3)
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
    le $I1, 0, __label_1
.annotate 'line', 7962
    $P3 = $P1.'pop'()
    set $S1, $P3
    goto __label_2
  __label_1: # else
.annotate 'line', 7964
    $P4 = self.'createreg'()
    set $S1, $P4
  __label_2: # endif
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
  __label_3: # for condition
    lt $I2, 0, __label_2
# {
.annotate 'line', 7974
# s: $S1
    $S1 = $P2[$I2]
.annotate 'line', 7975
# predefined push
    push $P1, $S1
# }
  __label_1: # for iteration
.annotate 'line', 7973
    dec $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 7977
    assign $P2, 0
# }
.annotate 'line', 7978

.end # freetemps

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'RegisterStore' ]
.annotate 'line', 7934
    addattribute $P0, 'type'
.annotate 'line', 7935
    addattribute $P0, 'nreg'
.annotate 'line', 7936
    addattribute $P0, 'tempreg'
.annotate 'line', 7937
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
  __label_1: # for iteration
    unless $P6 goto __label_2
    shift $P4, $P6
# {
.annotate 'line', 7997
# modname: $S1
    $P7 = $P4.'getname'()
    null $S1
    if_null $P7, __label_3
    set $S1, $P7
  __label_3:
# switch
.annotate 'line', 7998
    set $S3, $S1
    set $S4, 'named'
    if $S3 == $S4 goto __label_6
    set $S4, 'slurpy'
    if $S3 == $S4 goto __label_7
    goto __label_5
  __label_6: # case
.annotate 'line', 8000
    set $P1, $P4
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 8003
    set $P2, $P4
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 8006
    __ARG_1.'print'(' :', $S1)
  __label_4: # switch end
# }
    goto __label_1
  __label_2: # endfor
# switch-case
.annotate 'line', 8010
    isnull $I1, $P1
    not $I1
    unless $I1 goto __label_11
    isnull $I1, $P2
    not $I1
  __label_11:
    if $I1 goto __label_10
.annotate 'line', 8017
    isnull $I1, $P1
    not $I1
    if $I1 goto __label_12
.annotate 'line', 8034
    isnull $I1, $P2
    not $I1
    if $I1 goto __label_13
    goto __label_9
  __label_10: # case
.annotate 'line', 8015
    __ARG_1.'print'(" :named :slurpy")
    goto __label_8 # break
  __label_12: # case
.annotate 'line', 8018
# setname: $S2
    null $S2
# switch
.annotate 'line', 8019
    $P7 = $P1.'numargs'()
    set $I2, $P7
    null $I3
    if $I2 == $I3 goto __label_16
    set $I3, 1
    if $I2 == $I3 goto __label_17
    goto __label_15
  __label_16: # case
.annotate 'line', 8021
    concat $S0, "'", __ARG_3
    concat $S0, $S0, "'"
    set $S2, $S0
    goto __label_14 # break
  __label_17: # case
.annotate 'line', 8024
# var argmod: $P5
    $P5 = $P1.'getarg'(0)
.annotate 'line', 8025
    $P8 = $P5.'isstringliteral'()
    isfalse $I4, $P8
    unless $I4 goto __label_18
.const 'Sub' $P9 = 'WSubId_1'
.annotate 'line', 8026
    $P9('Invalid modifier', __ARG_2)
  __label_18: # endif
.annotate 'line', 8027
    $P10 = $P5.'getPirString'()
    set $S2, $P10
    goto __label_14 # break
  __label_15: # default
.annotate 'line', 8028
.const 'Sub' $P11 = 'WSubId_1'
.annotate 'line', 8030
    $P11('Invalid modifier', __ARG_2)
  __label_14: # switch end
.annotate 'line', 8032
    __ARG_1.'print'(" :named(", $S2, ")")
    goto __label_8 # break
  __label_13: # case
.annotate 'line', 8035
    __ARG_1.'print'(" :slurpy")
    goto __label_8 # break
  __label_9: # default
  __label_8: # switch end
.annotate 'line', 8036
# }
.annotate 'line', 8038

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
    setattribute self, 'func', __ARG_1
.annotate 'line', 8049
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8050
# type: $S1
.const 'Sub' $P3 = 'WSubId_82'
    $P4 = $P1.'checkkeyword'()
    $P2 = $P3($P4)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8051
    eq $S1, '', __label_2
.annotate 'line', 8052
    $P1 = __ARG_2.'get'()
    goto __label_3
  __label_2: # else
.annotate 'line', 8054
    set $S1, 'P'
  __label_3: # endif
.annotate 'line', 8055
# argname: $S2
# predefined string
    $P2 = __ARG_1.'getparamnum'()
    set $S3, $P2
    concat $S2, '__ARG_', $S3
.annotate 'line', 8056
    __ARG_1.'createvarnamed'($P1, $S1, $S2)
.annotate 'line', 8058
# predefined string
    set $S3, $P1
    box $P2, $S3
    setattribute self, 'name', $P2
.annotate 'line', 8059
    $P1 = __ARG_2.'get'()
.annotate 'line', 8060
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_4
    unless $P2 goto __label_4
.annotate 'line', 8061
    new $P6, [ 'ParameterModifierList' ]
    $P6.'ParameterModifierList'(__ARG_2, self)
    set $P5, $P6
    setattribute self, 'modifiers', $P5
    goto __label_5
  __label_4: # else
.annotate 'line', 8063
    __ARG_2.'unget'($P1)
  __label_5: # endif
# }
.annotate 'line', 8064

.end # FunctionParameter


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8067
# var func: $P1
    getattribute $P1, self, 'func'
.annotate 'line', 8068
# paramname: $S1
    getattribute $P4, self, 'name'
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 8069
# var param: $P2
    $P2 = $P1.'getvar'($S1)
.annotate 'line', 8070
# ptype: $S2
.const 'Sub' $P5 = 'WSubId_85'
    $P6 = $P2.'gettype'()
    $P4 = $P5($P6)
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 8071
    $P4 = $P2.'getreg'()
    __ARG_1.'print'('        .param ', $S2, ' ', $P4)
.annotate 'line', 8072
# var modarg: $P3
    getattribute $P3, self, 'modifiers'
.annotate 'line', 8073
    if_null $P3, __label_3
.annotate 'line', 8074
    getattribute $P4, $P1, 'start'
    $P3.'emitmodifiers'(__ARG_1, $P4, $S1)
  __label_3: # endif
.annotate 'line', 8075
    __ARG_1.'say'('')
# }
.annotate 'line', 8076

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FunctionParameter' ]
.annotate 'line', 8043
    addattribute $P0, 'func'
.annotate 'line', 8044
    addattribute $P0, 'name'
.annotate 'line', 8045
    addattribute $P0, 'modifiers'
.end
.namespace [ ]

.sub 'parseParameter'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8081
    new $P2, [ 'FunctionParameter' ]
    $P2.'FunctionParameter'(__ARG_2, __ARG_1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8082

.end # parseParameter

.namespace [ 'FunctionModifierList' ]

.sub 'FunctionModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8092
    self.'ModifierList'(__ARG_1, __ARG_2)
# }
.annotate 'line', 8093

.end # FunctionModifierList


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8096
    $P3 = self.'getlist'()
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
# {
.annotate 'line', 8097
# nargmods: $I1
    $P5 = $P1.'numargs'()
    set $I1, $P5
.annotate 'line', 8098
    $P3 = $P1.'getname'()
    __ARG_1.'print'(' :', $P3)
.annotate 'line', 8099
    le $I1, 0, __label_3
# {
.annotate 'line', 8100
    __ARG_1.'print'('(')
# for loop
.annotate 'line', 8101
# iargmod: $I2
    null $I2
  __label_6: # for condition
    ge $I2, $I1, __label_5
# {
.annotate 'line', 8102
# var argmod: $P2
    $P2 = $P1.'getarg'($I2)
.annotate 'line', 8103
    $P3 = $P2.'isstringliteral'()
    isfalse $I3, $P3
    unless $I3 goto __label_7
.const 'Sub' $P6 = 'WSubId_1'
.annotate 'line', 8104
    getattribute $P5, $P2, 'start'
    $P6('Invalid modifier', $P5)
  __label_7: # endif
.annotate 'line', 8105
    $P3 = $P2.'getPirString'()
    __ARG_1.'print'($P3)
# }
  __label_4: # for iteration
.annotate 'line', 8101
    inc $I2
    goto __label_6
  __label_5: # for end
.annotate 'line', 8107
    __ARG_1.'print'(')')
# }
  __label_3: # endif
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 8110

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FunctionModifierList' ]
.annotate 'line', 8088
    get_class $P1, [ 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'FunctionBase' ]

.sub 'FunctionBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8132
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 8133
    box $P1, 0
    setattribute self, 'nlabel', $P1
.annotate 'line', 8134
    new $P3, [ 'RegisterStore' ]
    $P3.'RegisterStore'('I')
    set $P2, $P3
    setattribute self, 'regstI', $P2
.annotate 'line', 8135
    new $P3, [ 'RegisterStore' ]
    $P3.'RegisterStore'('N')
    set $P2, $P3
    setattribute self, 'regstN', $P2
.annotate 'line', 8136
    new $P3, [ 'RegisterStore' ]
    $P3.'RegisterStore'('S')
    set $P2, $P3
    setattribute self, 'regstS', $P2
.annotate 'line', 8137
    new $P3, [ 'RegisterStore' ]
    $P3.'RegisterStore'('P')
    set $P2, $P3
    setattribute self, 'regstP', $P2
# }
.annotate 'line', 8138

.end # FunctionBase


.sub 'getouter' :method
# Body
# {
.annotate 'line', 8140
    .return(self)
# }

.end # getouter


.sub 'makesubid' :method
# Body
# {
.annotate 'line', 8144
# var subid: $P1
    getattribute $P1, self, 'subid'
.annotate 'line', 8145
    unless_null $P1, __label_1
.annotate 'line', 8146
    $P1 = self.'generatesubid'()
    setattribute self, 'subid', $P1
  __label_1: # endif
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
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8158
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 8159
    __ARG_1.'unget'($P1)
.annotate 'line', 8160
.const 'Sub' $P3 = 'parseParameter'
.annotate 'line', 8161
.const 'Sub' $P5 = 'WSubId_27'
    $P4 = $P5(__ARG_1, self, $P3, ')')
    setattribute self, 'params', $P4
# }
  __label_1: # endif
# }
.annotate 'line', 8163

.end # parse_parameters


.sub 'addlocalfunction' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8167
# var localfun: $P1
    getattribute $P1, self, 'localfun'
.annotate 'line', 8168
    unless_null $P1, __label_1
.annotate 'line', 8169
    root_new $P3, ['parrot';'ResizablePMCArray']
    push $P3, __ARG_1
    setattribute self, 'localfun', $P3
    goto __label_2
  __label_1: # else
.annotate 'line', 8171
# predefined push
    push $P1, __ARG_1
  __label_2: # endif
# }
.annotate 'line', 8172

.end # addlocalfunction


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8176
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 8177
    .return(self)
# }
.annotate 'line', 8178

.end # optimize


.sub 'setusedlex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 8182
# var lexicals: $P1
    getattribute $P1, self, 'usedlexicals'
.annotate 'line', 8183
    unless_null $P1, __label_1
.annotate 'line', 8184
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'usedlexicals', $P1
  __label_1: # endif
.annotate 'line', 8185
    $P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 8186

.end # setusedlex


.sub 'setlex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 8189
# var lexicals: $P1
    getattribute $P1, self, 'lexicals'
.annotate 'line', 8190
    unless_null $P1, __label_1
.annotate 'line', 8191
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'lexicals', $P1
  __label_1: # endif
.annotate 'line', 8192
    $P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 8193

.end # setlex


.sub 'createlex' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8198
# var lex: $P1
    $P1 = __ARG_1.'getlex'()
.annotate 'line', 8199
# lexname: $S1
    null $S1
.annotate 'line', 8200
    if_null $P1, __label_1
.annotate 'line', 8201
    set $S1, $P1
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 8203
# reg: $S2
    $P2 = __ARG_1.'getreg'()
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
.annotate 'line', 8204
# lexnum: $I1
    $P2 = self.'getlexnum'()
    set $I1, $P2
.annotate 'line', 8205
# predefined string
    set $S3, $I1
    concat $S0, '__WLEX_', $S3
    set $S1, $S0
.annotate 'line', 8206
    self.'setlex'($S1, $S2)
.annotate 'line', 8207
    __ARG_1.'setlex'($S1)
# }
  __label_2: # endif
.annotate 'line', 8209
    .return($S1)
# }
.annotate 'line', 8210

.end # createlex


.sub 'createreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8214
# var store: $P1
    null $P1
# switch
.annotate 'line', 8215
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
.annotate 'line', 8217
    getattribute $P1, self, 'regstI'
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 8219
    getattribute $P1, self, 'regstN'
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 8221
    getattribute $P1, self, 'regstS'
    goto __label_1 # break
  __label_6: # case
.annotate 'line', 8223
    getattribute $P1, self, 'regstP'
    goto __label_1 # break
  __label_2: # default
.const 'Sub' $P2 = 'WSubId_6'
.annotate 'line', 8225
    concat $S4, 'Invalid type in createreg: ', __ARG_1
    $P2($S4)
  __label_1: # switch end
.annotate 'line', 8227
# reg: $S1
    $P3 = $P1.'createreg'()
    null $S1
    if_null $P3, __label_7
    set $S1, $P3
  __label_7:
.annotate 'line', 8228
    .return($S1)
# }
.annotate 'line', 8229

.end # createreg


.sub 'tempreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8232
# var store: $P1
    null $P1
# switch
.annotate 'line', 8233
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
.annotate 'line', 8235
    getattribute $P1, self, 'regstI'
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 8237
    getattribute $P1, self, 'regstN'
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 8239
    getattribute $P1, self, 'regstS'
    goto __label_1 # break
  __label_6: # case
.annotate 'line', 8241
    getattribute $P1, self, 'regstP'
    goto __label_1 # break
  __label_2: # default
.const 'Sub' $P2 = 'WSubId_6'
.annotate 'line', 8243
    concat $S4, "Invalid type '", __ARG_1
    concat $S4, $S4, "' in tempreg"
    $P2($S4)
  __label_1: # switch end
.annotate 'line', 8245
# reg: $S1
    $P3 = $P1.'tempreg'()
    null $S1
    if_null $P3, __label_7
    set $S1, $P3
  __label_7:
.annotate 'line', 8246
    .return($S1)
# }
.annotate 'line', 8247

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 8250
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
.annotate 'line', 8251
    $P1.'freetemps'()
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 8252

.end # freetemps


.sub 'genlabel' :method
# Body
# {
.annotate 'line', 8255
# n: $I1
    getattribute $P2, self, 'nlabel'
    inc $P2
    set $P1, $P2
    set $I1, $P1
# predefined string
.annotate 'line', 8254
    set $S1, $I1
.annotate 'line', 8256
    concat $S2, '__label_', $S1
    .return($S2)
# }
.annotate 'line', 8257

.end # genlabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
# Body
# {
.const 'Sub' $P1 = 'WSubId_1'
.annotate 'line', 8260
    $P1('break not allowed here', __ARG_1)
# }
.annotate 'line', 8261

.end # getbreaklabel


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
# Body
# {
.const 'Sub' $P1 = 'WSubId_1'
.annotate 'line', 8264
    $P1('continue not allowed here', __ARG_1)
# }
.annotate 'line', 8265

.end # getcontinuelabel


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8269
# name: $S1
    getattribute $P9, self, 'name'
    null $S1
    if_null $P9, __label_1
    set $S1, $P9
  __label_1:
.annotate 'line', 8270
    __ARG_1.'say'()
.annotate 'line', 8271
    __ARG_1.'print'(".sub ")
.annotate 'line', 8272
    $P9 = self.'isanonymous'()
    if_null $P9, __label_2
    unless $P9 goto __label_2
.annotate 'line', 8273
    __ARG_1.'print'("'' :anon")
    goto __label_3
  __label_2: # else
.annotate 'line', 8275
    __ARG_1.'print'("'", $S1, "'")
  __label_3: # endif
.annotate 'line', 8276
    getattribute $P9, self, 'subid'
    if_null $P9, __label_4
.annotate 'line', 8277
    getattribute $P10, self, 'subid'
    __ARG_1.'print'(" :subid('", $P10, "')")
  __label_4: # endif
.annotate 'line', 8278
    getattribute $P9, self, 'outer'
    if_null $P9, __label_5
# {
.annotate 'line', 8279
# var outer: $P1
    getattribute $P1, self, 'outer'
.annotate 'line', 8280
# var outerid: $P2
    getattribute $P2, $P1, 'subid'
.annotate 'line', 8281
    if_null $P2, __label_6
.annotate 'line', 8282
    __ARG_1.'print'(" :outer('", $P2, "')")
  __label_6: # endif
# }
  __label_5: # endif
.annotate 'line', 8286
    $P9 = self.'ismethod'()
    if_null $P9, __label_7
    unless $P9 goto __label_7
.annotate 'line', 8287
    __ARG_1.'print'(' :method')
  __label_7: # endif
.annotate 'line', 8288
# var modifiers: $P3
    getattribute $P3, self, 'modifiers'
.annotate 'line', 8289
    if_null $P3, __label_8
.annotate 'line', 8290
    $P3.'emit'(__ARG_1)
    goto __label_9
  __label_8: # else
# {
.annotate 'line', 8292
    ne $S1, 'main', __label_10
.annotate 'line', 8293
    __ARG_1.'print'(' :main')
  __label_10: # endif
# }
  __label_9: # endif
.annotate 'line', 8295
    __ARG_1.'say'()
.const 'Sub' $P11 = 'WSubId_42'
.annotate 'line', 8298
    getattribute $P9, self, 'params'
    $P11(__ARG_1, $P9)
.annotate 'line', 8300
# var lexicals: $P4
    getattribute $P4, self, 'lexicals'
.annotate 'line', 8301
# var usedlexicals: $P5
    getattribute $P5, self, 'usedlexicals'
.annotate 'line', 8302
    isnull $I1, $P4
    not $I1
    if $I1 goto __label_12
    isnull $I1, $P5
    not $I1
  __label_12:
    unless $I1 goto __label_11
# {
.annotate 'line', 8303
    getattribute $P9, self, 'start'
    __ARG_1.'annotate'($P9)
.annotate 'line', 8305
    if_null $P4, __label_13
# {
.annotate 'line', 8306
    iter $P12, $P4
    set $P12, 0
  __label_14: # for iteration
    unless $P12 goto __label_15
    shift $S2, $P12
.annotate 'line', 8307
    $P9 = $P4[$S2]
    __ARG_1.'say'(".lex '", $P9, "', ", $S2)
    goto __label_14
  __label_15: # endfor
# }
  __label_13: # endif
.annotate 'line', 8310
    if_null $P5, __label_16
# {
.annotate 'line', 8311
    iter $P13, $P5
    set $P13, 0
  __label_17: # for iteration
    unless $P13 goto __label_18
    shift $S3, $P13
.annotate 'line', 8312
    $P9 = $P5[$S3]
    __ARG_1.'emitfind_lex'($S3, $P9)
    goto __label_17
  __label_18: # endfor
# }
  __label_16: # endif
# }
  __label_11: # endif
.annotate 'line', 8316
# var body: $P6
    getattribute $P6, self, 'body'
.annotate 'line', 8317
    $P9 = $P6.'isempty'()
    if_null $P9, __label_19
    unless $P9 goto __label_19
.annotate 'line', 8318
    __ARG_1.'comment'('Empty body')
    goto __label_20
  __label_19: # else
# {
.annotate 'line', 8320
    __ARG_1.'comment'('Body')
.annotate 'line', 8321
    $P6.'emit'(__ARG_1)
.annotate 'line', 8322
    $P9 = $P6.'getend'()
    __ARG_1.'annotate'($P9)
# }
  __label_20: # endif
.annotate 'line', 8324
    __ARG_1.'say'("\n.end # ", $S1, "\n")
.annotate 'line', 8327
# var localfun: $P7
    getattribute $P7, self, 'localfun'
.annotate 'line', 8328
    if_null $P7, __label_21
# {
.annotate 'line', 8329
    iter $P14, $P7
    set $P14, 0
  __label_22: # for iteration
    unless $P14 goto __label_23
    shift $P8, $P14
.annotate 'line', 8330
    $P8.'emit'(__ARG_1)
    goto __label_22
  __label_23: # endfor
# }
  __label_21: # endif
# }
.annotate 'line', 8332

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FunctionBase' ]
.annotate 'line', 8113
    get_class $P1, [ 'BlockStatement' ]
    addparent $P0, $P1
.annotate 'line', 8115
    addattribute $P0, 'name'
.annotate 'line', 8116
    addattribute $P0, 'subid'
.annotate 'line', 8117
    addattribute $P0, 'modifiers'
.annotate 'line', 8118
    addattribute $P0, 'params'
.annotate 'line', 8119
    addattribute $P0, 'body'
.annotate 'line', 8120
    addattribute $P0, 'regstI'
.annotate 'line', 8121
    addattribute $P0, 'regstN'
.annotate 'line', 8122
    addattribute $P0, 'regstS'
.annotate 'line', 8123
    addattribute $P0, 'regstP'
.annotate 'line', 8124
    addattribute $P0, 'nlabel'
.annotate 'line', 8125
    addattribute $P0, 'localfun'
.annotate 'line', 8126
    addattribute $P0, 'lexicals'
.annotate 'line', 8127
    addattribute $P0, 'usedlexicals'
.annotate 'line', 8128
    addattribute $P0, 'outer'
.end
.namespace [ 'FunctionStatement' ]

.sub 'FunctionStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8346
    self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 8347
    box $P1, 0
    setattribute self, 'paramnum', $P1
.annotate 'line', 8348
    box $P1, 0
    setattribute self, 'lexnum', $P1
.annotate 'line', 8349
    self.'parse'(__ARG_2)
# }
.annotate 'line', 8350

.end # FunctionStatement


.sub 'isanonymous' :method
# Body
# {
.annotate 'line', 8352
    .return(0)
# }

.end # isanonymous


.sub 'getparamnum' :method
# Body
# {
# predefined int
.annotate 'line', 8356
    getattribute $P1, self, 'paramnum'
    inc $P1
.annotate 'line', 8354
    set $I1, $P1
.annotate 'line', 8356
    .return($I1)
# }
.annotate 'line', 8357

.end # getparamnum


.sub 'getlexnum' :method
# Body
# {
# predefined int
.annotate 'line', 8361
    getattribute $P1, self, 'lexnum'
    inc $P1
.annotate 'line', 8359
    set $I1, $P1
.annotate 'line', 8361
    .return($I1)
# }
.annotate 'line', 8362

.end # getlexnum


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 8363
    .return(0)
# }

.end # ismethod


.sub 'parse' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8367
# var name: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8368
    setattribute self, 'name', $P1
.annotate 'line', 8369
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 8370
    $P4 = $P2.'isop'('[')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 8371
    new $P7, [ 'FunctionModifierList' ]
    $P7.'FunctionModifierList'(__ARG_1, self)
    set $P6, $P7
    setattribute self, 'modifiers', $P6
.annotate 'line', 8372
    $P2 = __ARG_1.'get'()
# }
  __label_1: # endif
.const 'Sub' $P8 = 'WSubId_4'
.annotate 'line', 8374
    $P8('(', $P2)
.annotate 'line', 8375
    self.'parse_parameters'(__ARG_1)
.annotate 'line', 8377
# var fullname: $P3
    getattribute $P5, self, 'owner'
    $P4 = $P5.'getpath'()
# predefined clone
    clone $P3, $P4
.annotate 'line', 8378
    $P4 = $P1.'getidentifier'()
# predefined push
    push $P3, $P4
.annotate 'line', 8380
    new $P5, [ 'StringLiteral' ]
.annotate 'line', 8381
    new $P7, [ 'TokenQuoted' ]
    getattribute $P9, $P1, 'file'
    getattribute $P10, $P1, 'line'
# predefined join
.annotate 'line', 8379
    join $S1, '.', $P3
    $P7.'TokenQuoted'($P9, $P10, $S1)
    set $P6, $P7
    $P5.'StringLiteral'(self, $P6)
    set $P4, $P5
    self.'createconst'('__FUNCTION__', 'S', $P4, '')
.annotate 'line', 8384
    $P2 = __ARG_1.'get'()
.annotate 'line', 8385
    $P4 = $P2.'isop'('{')
    isfalse $I1, $P4
    unless $I1 goto __label_2
.const 'Sub' $P11 = 'WSubId_2'
.annotate 'line', 8386
    $P11('{', $P2)
  __label_2: # endif
.annotate 'line', 8387
    new $P6, [ 'CompoundStatement' ]
    $P6.'CompoundStatement'($P2, __ARG_1, self)
    set $P5, $P6
    setattribute self, 'body', $P5
.annotate 'line', 8388
    .return(self)
# }
.annotate 'line', 8389

.end # parse

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FunctionStatement' ]
.annotate 'line', 8339
    get_class $P1, [ 'FunctionBase' ]
    addparent $P0, $P1
.annotate 'line', 8341
    addattribute $P0, 'paramnum'
.annotate 'line', 8342
    addattribute $P0, 'lexnum'
.end
.namespace [ 'LocalFunctionStatement' ]

.sub 'LocalFunctionStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8400
    self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 8401
    $P4 = __ARG_3.'getouter'()
    setattribute self, 'outer', $P4
.annotate 'line', 8402
    getattribute $P3, self, 'outer'
    $P3.'makesubid'()
.annotate 'line', 8403
# var subid: $P1
    $P1 = self.'makesubid'()
.annotate 'line', 8404
    setattribute self, 'name', $P1
.annotate 'line', 8405
    self.'parse_parameters'(__ARG_2)
.annotate 'line', 8406
# var t: $P2
    $P2 = __ARG_2.'get'()
.const 'Sub' $P5 = 'WSubId_4'
.annotate 'line', 8407
    $P5('{', $P2)
.annotate 'line', 8408
    new $P6, [ 'CompoundStatement' ]
    $P6.'CompoundStatement'($P2, __ARG_2, self)
    set $P4, $P6
    setattribute self, 'body', $P4
.annotate 'line', 8409
    __ARG_3.'addlocalfunction'(self)
# }
.annotate 'line', 8410

.end # LocalFunctionStatement


.sub 'isanonymous' :method
# Body
# {
.annotate 'line', 8411
    .return(1)
# }

.end # isanonymous


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 8412
    .return(0)
# }

.end # ismethod


.sub 'getsubid' :method
# Body
# {
.annotate 'line', 8415
    getattribute $P1, self, 'subid'
    .return($P1)
# }
.annotate 'line', 8416

.end # getsubid


.sub 'getparamnum' :method
# Body
# {
.annotate 'line', 8420
    getattribute $P1, self, 'outer'
    .tailcall $P1.'getparamnum'()
# }
.annotate 'line', 8421

.end # getparamnum


.sub 'getlexnum' :method
# Body
# {
.annotate 'line', 8425
    getattribute $P1, self, 'outer'
    .tailcall $P1.'getlexnum'()
# }
.annotate 'line', 8426

.end # getlexnum


.sub 'getvar' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8429
# var r: $P1
    $P1 = self.'getlocalvar'(__ARG_1)
.annotate 'line', 8430
    unless_null $P1, __label_1
# {
.annotate 'line', 8433
    getattribute $P6, self, 'owner'
    $P1 = $P6.'getvar'(__ARG_1)
.annotate 'line', 8434
    unless_null $P1, __label_2
# {
.annotate 'line', 8436
    ne __ARG_1, 'self', __label_4
# {
.annotate 'line', 8437
# var ownerscope: $P2
    getattribute $P2, self, 'outer'
.annotate 'line', 8438
    getattribute $P7, self, 'outer'
    $P6 = $P7.'ismethod'()
    if_null $P6, __label_5
    unless $P6 goto __label_5
# {
.annotate 'line', 8439
# lexself: $S1
    $P8 = $P2.'makelexicalself'()
    null $S1
    if_null $P8, __label_6
    set $S1, $P8
  __label_6:
.annotate 'line', 8440
    $P1 = self.'createvar'(__ARG_1, 'P')
.annotate 'line', 8441
# reg: $S2
    $P6 = $P1.'getreg'()
    null $S2
    if_null $P6, __label_7
    set $S2, $P6
  __label_7:
.annotate 'line', 8442
    self.'setusedlex'($S1, $S2)
# }
  __label_5: # endif
# }
  __label_4: # endif
# }
    goto __label_3
  __label_2: # else
.annotate 'line', 8446
    $P6 = $P1.'gettype'()
    set $S5, $P6
    iseq $I2, $S5, 'P'
    unless $I2 goto __label_9
    $P7 = $P1.'isconst'()
    isfalse $I2, $P7
  __label_9:
    unless $I2 goto __label_8
# {
.annotate 'line', 8447
# var scope: $P3
    $P3 = $P1.'getscope'()
.annotate 'line', 8448
# var ownerscope: $P4
    $P4 = $P3.'getouter'()
.annotate 'line', 8449
# var outer: $P5
    getattribute $P5, self, 'outer'
.annotate 'line', 8450
    isa $I2, $P4, [ 'FunctionBase' ]
    unless $I2 goto __label_10
# {
.annotate 'line', 8451
    $P6 = $P4.'same_scope_as'($P5)
    if_null $P6, __label_11
    unless $P6 goto __label_11
# {
.annotate 'line', 8452
# lexname: $S3
    $P7 = $P3.'makelexical'($P1)
    null $S3
    if_null $P7, __label_12
    set $S3, $P7
  __label_12:
.annotate 'line', 8453
# flags: $I1
    $I2 = $P1.'getflags'()
    bor $I1, $I2, 2
.annotate 'line', 8454
    $P1 = self.'createvar'(__ARG_1, 'P', $I1)
.annotate 'line', 8455
    box $P6, $S3
    setattribute $P1, 'lexname', $P6
.annotate 'line', 8456
# reg: $S4
    $P6 = $P1.'getreg'()
    null $S4
    if_null $P6, __label_13
    set $S4, $P6
  __label_13:
.annotate 'line', 8457
    self.'setusedlex'($S3, $S4)
# }
  __label_11: # endif
# }
  __label_10: # endif
# }
  __label_8: # endif
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 8462
    isnull $I2, $P1
    not $I2
    unless $I2 goto __label_15
    isa $I3, $P1, [ 'VarData' ]
    not $I2, $I3
  __label_15:
    unless $I2 goto __label_14
.const 'Sub' $P9 = 'WSubId_6'
.annotate 'line', 8463
    $P9('Incorrect data for variable in LocalFunction')
  __label_14: # endif
.annotate 'line', 8464
    .return($P1)
# }
.annotate 'line', 8465

.end # getvar

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'LocalFunctionStatement' ]
.annotate 'line', 8396
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
.annotate 'line', 8476
    self.'FunctionStatement'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 8477

.end # MethodStatement


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 8478
    .return(1)
# }

.end # ismethod

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MethodStatement' ]
.annotate 'line', 8472
    get_class $P1, [ 'FunctionStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'SigParameter' ]

.sub 'SigParameter' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8492
# var name: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8493
    $P4 = $P1.'isidentifier'()
    isfalse $I1, $P4
    unless $I1 goto __label_1
.const 'Sub' $P5 = 'WSubId_3'
.annotate 'line', 8494
    $P5($P1)
  __label_1: # endif
.annotate 'line', 8495
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 8496
    $P4 = $P2.'isidentifier'()
    if_null $P4, __label_2
    unless $P4 goto __label_2
# {
.annotate 'line', 8497
# type: $S1
.const 'Sub' $P7 = 'WSubId_82'
    $P8 = $P1.'checkkeyword'()
    $P6 = $P7($P8)
    null $S1
    if_null $P6, __label_3
    set $S1, $P6
  __label_3:
.annotate 'line', 8498
    set $P1, $P2
.annotate 'line', 8499
    __ARG_2.'createvar'($P1, $S1)
.annotate 'line', 8500
    $P2 = __ARG_1.'get'()
# }
  __label_2: # endif
.annotate 'line', 8502
    setattribute self, 'name', $P1
.annotate 'line', 8503
# var data: $P3
    $P4 = $P1.'getidentifier'()
    $P3 = __ARG_2.'getvar'($P4)
.annotate 'line', 8504
    $P6 = $P3.'getreg'()
    setattribute self, 'reg', $P6
.annotate 'line', 8505
    $P4 = $P2.'isop'('[')
    if_null $P4, __label_4
    unless $P4 goto __label_4
.annotate 'line', 8506
    new $P9, [ 'ParameterModifierList' ]
    $P9.'ParameterModifierList'(__ARG_1, self)
    set $P8, $P9
    setattribute self, 'modifiers', $P8
    goto __label_5
  __label_4: # else
.annotate 'line', 8508
    __ARG_1.'unget'($P2)
  __label_5: # endif
# }
.annotate 'line', 8509

.end # SigParameter


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8512
    getattribute $P3, self, 'reg'
    __ARG_1.'print'($P3)
.annotate 'line', 8513
# var modifiers: $P1
    getattribute $P1, self, 'modifiers'
.annotate 'line', 8514
    if_null $P1, __label_1
# {
.annotate 'line', 8515
# var name: $P2
    getattribute $P2, self, 'name'
.annotate 'line', 8516
    $P1.'emitmodifiers'(__ARG_1, $P2, $P2)
# }
  __label_1: # endif
# }
.annotate 'line', 8518

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'SigParameter' ]
.annotate 'line', 8487
    addattribute $P0, 'name'
.annotate 'line', 8488
    addattribute $P0, 'modifiers'
.annotate 'line', 8489
    addattribute $P0, 'reg'
.end
.namespace [ ]

.sub 'parseSigParameter'
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8523
    new $P2, [ 'SigParameter' ]
    $P2.'SigParameter'(__ARG_1, __ARG_2)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8524

.end # parseSigParameter

.namespace [ 'SigParameterList' ]

.sub 'SigParameterList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8531
.const 'Sub' $P1 = 'parseSigParameter'
.annotate 'line', 8532
.const 'Sub' $P4 = 'WSubId_27'
    $P3 = $P4(__ARG_1, __ARG_2, $P1, ')')
    setattribute self, 'params', $P3
# }
.annotate 'line', 8533

.end # SigParameterList


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8536
    __ARG_1.'print'('(')
.annotate 'line', 8537
# sep: $S1
    set $S1, ''
.annotate 'line', 8538
    getattribute $P2, self, 'params'
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
# {
.annotate 'line', 8539
    __ARG_1.'print'($S1)
.annotate 'line', 8540
    $P1.'emit'(__ARG_1)
.annotate 'line', 8541
    set $S1, ', '
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 8543
    __ARG_1.'print'(')')
# }
.annotate 'line', 8544

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'SigParameterList' ]
.annotate 'line', 8528
    addattribute $P0, 'params'
.end
.namespace [ 'MultiAssignStatement' ]

.sub 'MultiAssignStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8553
    setattribute self, 'params', __ARG_1
.annotate 'line', 8554
    setattribute self, 'expr', __ARG_2
# }
.annotate 'line', 8555

.end # MultiAssignStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8558
    getattribute $P3, self, 'expr'
    $P2 = $P3.'optimize'()
    setattribute self, 'expr', $P2
.annotate 'line', 8559
    .return(self)
# }
.annotate 'line', 8560

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8563
# var expr: $P1
    getattribute $P1, self, 'expr'
.annotate 'line', 8564
# var call: $P2
    $P2 = $P1.'emitcall'(__ARG_1)
.annotate 'line', 8565
    $P1.'prepareargs'(__ARG_1)
.annotate 'line', 8566
    __ARG_1.'print'('    ')
.annotate 'line', 8567
    getattribute $P3, self, 'params'
    $P3.'emit'(__ARG_1)
.annotate 'line', 8568
    __ARG_1.'print'(' = ', $P2)
.annotate 'line', 8569
    $P1.'emitargs'(__ARG_1)
.annotate 'line', 8570
    __ARG_1.'say'()
# }
.annotate 'line', 8571

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MultiAssignStatement' ]
.annotate 'line', 8549
    addattribute $P0, 'params'
.annotate 'line', 8550
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
.annotate 'line', 8588
    self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 8589

.end # ClassSpecifier


.sub 'reftype' :method
# Body
# {
.annotate 'line', 8590
    .return(0)
# }

.end # reftype


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8594
    getattribute $P1, self, 'start'
    __ARG_1.'annotate'($P1)
# }
.annotate 'line', 8595

.end # annotate

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassSpecifier' ]
.annotate 'line', 8584
    get_class $P1, [ 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'ClassSpecifierStr' ]

.sub 'ClassSpecifierStr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8603
    self.'ClassSpecifier'(__ARG_1, __ARG_2)
.annotate 'line', 8604
    setattribute self, 'name', __ARG_2
# }
.annotate 'line', 8605

.end # ClassSpecifierStr


.sub 'reftype' :method
# Body
# {
.annotate 'line', 8606
    .return(1)
# }

.end # reftype


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8610
# basestr: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 8611
    __ARG_1.'print'($S1)
# }
.annotate 'line', 8612

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassSpecifierStr' ]
.annotate 'line', 8598
    get_class $P1, [ 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 8600
    addattribute $P0, 'name'
.end
.namespace [ 'ClassSpecifierParrotKey' ]

.sub 'ClassSpecifierParrotKey' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8621
    self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 8622
# var key: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 8623
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 8624
    $P3 = $P2.'isstring'()
    isfalse $I1, $P3
    unless $I1 goto __label_1
.const 'Sub' $P4 = 'WSubId_29'
.annotate 'line', 8625
    $P4('literal string', $P2)
  __label_1: # endif
.annotate 'line', 8626
    $P3 = $P2.'rawstring'()
# predefined push
    push $P1, $P3
.annotate 'line', 8627
    $P2 = __ARG_1.'get'()
.annotate 'line', 8628
    $P3 = $P2.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_2
# {
# switch
.annotate 'line', 8629
    $P5 = $P2.'checkop'()
    set $S1, $P5
    set $S2, ':'
    if $S1 == $S2 goto __label_5
    set $S2, ','
    if $S1 == $S2 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 8631
    box $P6, 1
    setattribute self, 'hll', $P6
  __label_6: # case
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 8633
.const 'Sub' $P7 = 'WSubId_31'
.annotate 'line', 8635
    $P7('token in class key', $P2)
  __label_3: # switch end
  __label_7: # do
.annotate 'line', 8637
# {
.annotate 'line', 8638
    $P2 = __ARG_1.'get'()
.annotate 'line', 8639
    $P3 = $P2.'isstring'()
    isfalse $I1, $P3
    unless $I1 goto __label_10
.const 'Sub' $P8 = 'WSubId_29'
.annotate 'line', 8640
    $P8('literal string', $P2)
  __label_10: # endif
.annotate 'line', 8641
    $P3 = $P2.'rawstring'()
# predefined push
    push $P1, $P3
# }
  __label_9: # continue
.annotate 'line', 8642
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'(',')
    if_null $P3, __label_8
    if $P3 goto __label_7
  __label_8: # enddo
.const 'Sub' $P9 = 'WSubId_4'
.annotate 'line', 8643
    $P9(']', $P2)
# }
  __label_2: # endif
.annotate 'line', 8645
    setattribute self, 'key', $P1
# }
.annotate 'line', 8646

.end # ClassSpecifierParrotKey


.sub 'reftype' :method
# Body
# {
.annotate 'line', 8647
    .return(2)
# }

.end # reftype


.sub 'hasHLL' :method
# Body
# {
# predefined int
.annotate 'line', 8650
    getattribute $P1, self, 'hll'
    isnull $I1, $P1
    not $I1
    .return($I1)
# }
.annotate 'line', 8651

.end # hasHLL


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8655
.const 'Sub' $P2 = 'WSubId_47'
    getattribute $P3, self, 'key'
    $P1 = $P2($P3)
    __ARG_1.'print'($P1)
# }
.annotate 'line', 8656

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassSpecifierParrotKey' ]
.annotate 'line', 8615
    get_class $P1, [ 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 8617
    addattribute $P0, 'key'
.annotate 'line', 8618
    addattribute $P0, 'hll'
.end
.namespace [ 'ClassSpecifierId' ]

.sub 'ClassSpecifierId' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8664
    self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 8665
# var key: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
# predefined string
    set $S1, __ARG_3
    box $P3, $S1
    push $P1, $P3
.annotate 'line', 8666
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 8667
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 8668
    $P2 = __ARG_1.'get'()
.annotate 'line', 8669
# predefined string
    set $S1, $P2
# predefined push
    push $P1, $S1
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 8671
    __ARG_1.'unget'($P2)
.annotate 'line', 8672
    setattribute self, 'key', $P1
# }
.annotate 'line', 8673

.end # ClassSpecifierId


.sub 'reftype' :method
# Body
# {
.annotate 'line', 8674
    .return(3)
# }

.end # reftype


.sub 'last' :method
# Body
# {
.annotate 'line', 8678
# var key: $P1
    getattribute $P1, self, 'key'
.annotate 'line', 8679
    $P2 = $P1[-1]
    .return($P2)
# }
.annotate 'line', 8680

.end # last


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8684
# var key: $P1
    getattribute $P2, self, 'key'
    $P1 = __ARG_2.'findclasskey'($P2)
.annotate 'line', 8685
    unless_null $P1, __label_1
# {
.annotate 'line', 8686
    $P2 = self.'dowarnings'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.const 'Sub' $P3 = 'WSubId_54'
.annotate 'line', 8687
    getattribute $P4, self, 'key'
# predefined join
    join $S1, ".", $P4
    concat $S2, "class ", $S1
    concat $S2, $S2, " not found at compile time"
    $P3($S2)
  __label_3: # endif
.annotate 'line', 8688
.const 'Sub' $P5 = 'WSubId_47'
    getattribute $P4, self, 'key'
    $P2 = $P5($P4)
    __ARG_1.'print'($P2)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 8690
    $P2 = $P1.'getclasskey'()
    __ARG_1.'print'($P2)
  __label_2: # endif
# }
.annotate 'line', 8691

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassSpecifierId' ]
.annotate 'line', 8659
    get_class $P1, [ 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 8661
    addattribute $P0, 'key'
.end
.namespace [ ]

.sub 'parseClassSpecifier' :subid('WSubId_48')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8696
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8697
    $P2 = $P1.'isstring'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 8698
    new $P4, [ 'ClassSpecifierStr' ]
    $P4.'ClassSpecifierStr'(__ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_1: # endif
.annotate 'line', 8699
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 8700
    new $P4, [ 'ClassSpecifierParrotKey' ]
    $P4.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_2: # endif
.annotate 'line', 8701
    $P2 = $P1.'isidentifier'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 8702
    new $P4, [ 'ClassSpecifierId' ]
    $P4.'ClassSpecifierId'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_3: # endif
.const 'Sub' $P5 = 'WSubId_1'
.annotate 'line', 8703
    $P5('Invalid class', $P1)
# }
.annotate 'line', 8704

.end # parseClassSpecifier

.namespace [ 'ClassBase' ]

.sub 'ClassBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8716
    self.'initbase'(__ARG_1, __ARG_3)
.annotate 'line', 8717
    setattribute self, 'name', __ARG_2
.annotate 'line', 8718
# var classns: $P1
    $P2 = __ARG_3.'getpath'()
# predefined clone
    clone $P1, $P2
.annotate 'line', 8719
    getattribute $P2, self, 'name'
# predefined push
    push $P1, $P2
.annotate 'line', 8720
    setattribute self, 'classns', $P1
# }
.annotate 'line', 8721

.end # ClassBase


.sub 'getclasskey' :method
# Body
# {
.annotate 'line', 8724
.const 'Sub' $P1 = 'WSubId_47'
    getattribute $P2, self, 'classns'
    .tailcall $P1($P2)
# }
.annotate 'line', 8725

.end # getclasskey

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassBase' ]
.annotate 'line', 8710
    get_class $P1, [ 'CommonBase' ]
    addparent $P0, $P1
.annotate 'line', 8712
    addattribute $P0, 'name'
.annotate 'line', 8713
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
.annotate 'line', 8738
    self.'ClassBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 8739
    setattribute self, 'parent', __ARG_3
.annotate 'line', 8740
# var functions: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 8741
    setattribute self, 'functions', $P1
.annotate 'line', 8742
# var members: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 8743
    setattribute self, 'members', $P2
.annotate 'line', 8744
# var constants: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 8745
    setattribute self, 'constants', $P3
.annotate 'line', 8747
# var t: $P4
    $P4 = __ARG_4.'get'()
.annotate 'line', 8748
    $P9 = $P4.'isop'(':')
    if_null $P9, __label_1
    unless $P9 goto __label_1
# {
.const 'Sub' $P8 = "WSubId_48"
.annotate 'line', 8750
.const 'Sub' $P11 = 'WSubId_27'
    $P10 = $P11(__ARG_4, self, $P8)
    setattribute self, 'bases', $P10
.annotate 'line', 8751
    $P4 = __ARG_4.'get'()
# }
  __label_1: # endif
.const 'Sub' $P12 = 'WSubId_4'
.annotate 'line', 8753
    $P12('{', $P4)
# for loop
.annotate 'line', 8754
    $P4 = __ARG_4.'get'()
  __label_4: # for condition
    $P9 = $P4.'isop'('}')
    isfalse $I1, $P9
    unless $I1 goto __label_3
# {
# switch
.annotate 'line', 8755
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
.annotate 'line', 8757
# var f: $P5
    new $P5, [ 'MethodStatement' ]
    $P5.'MethodStatement'($P4, __ARG_4, self)
.annotate 'line', 8758
# predefined push
    push $P1, $P5
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 8761
# var name: $P6
    $P6 = __ARG_4.'get'()
.annotate 'line', 8762
    $P13 = $P6.'isidentifier'()
    isfalse $I2, $P13
    unless $I2 goto __label_10
.const 'Sub' $P14 = 'WSubId_29'
.annotate 'line', 8763
    $P14("member identifier", $P6)
  __label_10: # endif
.annotate 'line', 8764
# predefined push
    push $P2, $P6
.annotate 'line', 8765
    $P4 = __ARG_4.'get'()
.annotate 'line', 8766
    $P15 = $P4.'isop'(';')
    isfalse $I3, $P15
    unless $I3 goto __label_11
.const 'Sub' $P16 = 'WSubId_29'
.annotate 'line', 8767
    $P16("';' in member declaration", $P4)
  __label_11: # endif
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 8770
# var cst: $P7
.const 'Sub' $P17 = 'WSubId_34'
    $P7 = $P17($P4, __ARG_4, self)
.annotate 'line', 8771
# predefined push
    push $P3, $P7
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 8772
.const 'Sub' $P18 = 'WSubId_31'
.annotate 'line', 8774
    $P18("item in class", $P4)
  __label_5: # switch end
# }
  __label_2: # for iteration
.annotate 'line', 8754
    $P4 = __ARG_4.'get'()
    goto __label_4
  __label_3: # for end
# }
.annotate 'line', 8777

.end # ClassStatement


.sub 'getpath' :method
# Body
# {
.annotate 'line', 8780
    getattribute $P1, self, 'classns'
    .return($P1)
# }
.annotate 'line', 8781

.end # getpath


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 8784
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 8785

.end # generatesubid


.sub 'findsymbol' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8788
    getattribute $P1, self, 'parent'
    .tailcall $P1.'findsymbol'(__ARG_1)
# }
.annotate 'line', 8789

.end # findsymbol


.sub 'findclasskey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8792
    getattribute $P1, self, 'parent'
    .tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 8793

.end # findclasskey


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8796
    getattribute $P1, self, 'parent'
    .tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 8797

.end # checkclass


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8800
    getattribute $P1, self, 'owner'
    .tailcall $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 8801

.end # use_predef


.sub 'optimize' :method
# Body
# {
.const 'Sub' $P1 = 'WSubId_28'
.annotate 'line', 8804
    getattribute $P2, self, 'constants'
    $P1($P2)
.const 'Sub' $P3 = 'WSubId_28'
.annotate 'line', 8805
    getattribute $P2, self, 'functions'
    $P3($P2)
.annotate 'line', 8806
    .return(self)
# }
.annotate 'line', 8807

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8810
# var classns: $P1
    getattribute $P1, self, 'classns'
.annotate 'line', 8811
.const 'Sub' $P6 = 'WSubId_86'
    $P5 = $P6($P1)
    __ARG_1.'say'($P5)
.const 'Sub' $P7 = 'WSubId_42'
.annotate 'line', 8812
    getattribute $P5, self, 'functions'
    $P7(__ARG_1, $P5)
.annotate 'line', 8814
    __ARG_1.'say'('.sub Winxed_class_init :anon :load :init')
.annotate 'line', 8816
    $P5 = self.'getclasskey'()
    __ARG_1.'say'('    ', 'newclass $P0, ', $P5)
.annotate 'line', 8817
# n: $I1
    set $I1, 1
.annotate 'line', 8818
# var bases: $P2
    getattribute $P2, self, 'bases'
.annotate 'line', 8819
    if_null $P2, __label_1
# {
.annotate 'line', 8820
    getattribute $P5, self, 'bases'
    iter $P8, $P5
    set $P8, 0
  __label_2: # for iteration
    unless $P8 goto __label_3
    shift $P3, $P8
# {
.annotate 'line', 8821
    $P3.'annotate'(__ARG_1)
.annotate 'line', 8822
# reg: $S1
    set $I2, $I1
    inc $I1
    set $S2, $I2
    concat $S1, "$P", $S2
.annotate 'line', 8823
    __ARG_1.'print'('    ', 'get_class ', $S1, ', ')
.annotate 'line', 8824
    getattribute $P5, self, 'parent'
    $P3.'emit'(__ARG_1, $P5)
.annotate 'line', 8825
    __ARG_1.'say'()
.annotate 'line', 8826
    __ARG_1.'say'('    ', 'addparent $P0, ', $S1)
# }
    goto __label_2
  __label_3: # endfor
# }
  __label_1: # endif
.annotate 'line', 8829
    getattribute $P5, self, 'members'
    iter $P9, $P5
    set $P9, 0
  __label_4: # for iteration
    unless $P9 goto __label_5
    shift $P4, $P9
# {
.annotate 'line', 8830
    __ARG_1.'annotate'($P4)
.annotate 'line', 8831
    __ARG_1.'say'('    ', "addattribute $P0, '", $P4, "'")
# }
    goto __label_4
  __label_5: # endfor
.annotate 'line', 8834
    __ARG_1.'say'('.end')
# }
.annotate 'line', 8835

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassStatement' ]
.annotate 'line', 8728
    get_class $P1, [ 'ClassBase' ]
    addparent $P0, $P1
    get_class $P2, [ 'VarContainer' ]
    addparent $P0, $P2
.annotate 'line', 8730
    addattribute $P0, 'parent'
.annotate 'line', 8731
    addattribute $P0, 'bases'
.annotate 'line', 8732
    addattribute $P0, 'constants'
.annotate 'line', 8733
    addattribute $P0, 'functions'
.annotate 'line', 8734
    addattribute $P0, 'members'
.end
.namespace [ 'DeclareClassStatement' ]

.sub 'DeclareClassStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8842
    self.'ClassBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 8843
    setattribute self, 'name', __ARG_2
# }
.annotate 'line', 8844

.end # DeclareClassStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8847
    .return(self)
# }
.annotate 'line', 8848

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'DeclareClassStatement' ]
.annotate 'line', 8838
    get_class $P1, [ 'ClassBase' ]
    addparent $P0, $P1
.end
.namespace [ ]

.sub 'parseClass' :subid('WSubId_87')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8856
# var name: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8857
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 8858
    $I1 = $P2.'isop'(';')
    if $I1 goto __label_3
    $I1 = $P2.'isop'('.')
  __label_3:
    unless $I1 goto __label_1
# {
# for loop
  __label_6: # for condition
.annotate 'line', 8859
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_5
    unless $P3 goto __label_5
# {
.annotate 'line', 8860
# predefined string
    set $S1, $P1
    __ARG_3 = __ARG_3.'declarenamespace'($P1, $S1)
.annotate 'line', 8861
    $P1 = __ARG_2.'get'()
# }
  __label_4: # for iteration
.annotate 'line', 8859
    $P2 = __ARG_2.'get'()
    goto __label_6
  __label_5: # for end
.const 'Sub' $P4 = 'WSubId_4'
.annotate 'line', 8863
    $P4(';', $P2)
.annotate 'line', 8864
    new $P5, [ 'DeclareClassStatement' ]
    $P5.'DeclareClassStatement'(__ARG_1, $P1, __ARG_3)
    set $P3, $P5
    __ARG_3.'declareclass'($P3)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 8867
    __ARG_2.'unget'($P2)
.annotate 'line', 8868
    new $P5, [ 'ClassStatement' ]
    $P5.'ClassStatement'(__ARG_1, $P1, __ARG_3, __ARG_2)
    set $P3, $P5
    __ARG_3.'addclass'($P3)
# }
  __label_2: # endif
# }
.annotate 'line', 8870

.end # parseClass


.sub 'include_parrot' :subid('WSubId_89')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8878
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8879
    $P6 = $P1.'isstring'()
    isfalse $I4, $P6
    unless $I4 goto __label_1
.const 'Sub' $P7 = 'WSubId_29'
.annotate 'line', 8880
    $P7('literal string', $P1)
  __label_1: # endif
.const 'Sub' $P8 = 'WSubId_43'
.annotate 'line', 8881
    $P8(';', __ARG_2)
.annotate 'line', 8882
# filename: $S1
    $P6 = $P1.'rawstring'()
    null $S1
    if_null $P6, __label_2
    set $S1, $P6
  __label_2:
.annotate 'line', 8883
# var interp: $P2
# predefined getinterp
    getinterp $P2
# Constant IGLOBALS_LIB_PATHS evaluated at compile time
# Constant PARROT_LIB_PATH_INCLUDE evaluated at compile time
.annotate 'line', 8888
# var libpaths: $P3
    $P3 = $P2[9]
.annotate 'line', 8889
# var paths: $P4
    $P4 = $P3[0]
.annotate 'line', 8890
# var file: $P5
    new $P5, [ 'FileHandle' ]
.annotate 'line', 8891
    iter $P9, $P4
    set $P9, 0
  __label_3: # for iteration
    unless $P9 goto __label_4
    shift $S2, $P9
# {
.annotate 'line', 8892
# filepath: $S3
    concat $S3, $S2, $S1
.annotate 'line', 8893
# try: create handler
    new $P6, 'ExceptionHandler'
    set_label $P6, __label_5
    push_eh $P6
# try: begin
# {
.annotate 'line', 8894
    $P5.'open'($S3, 'r')
    goto __label_4 # break
.annotate 'line', 8895
# }
# try: end
    pop_eh
    goto __label_6
.annotate 'line', 8893
# catch
  __label_5:
    .get_results($P10)
    finalize $P10
    pop_eh
# catch end
  __label_6:
# }
    goto __label_3
  __label_4: # endfor
.annotate 'line', 8900
    $P6 = $P5.'is_closed'()
    if_null $P6, __label_7
    unless $P6 goto __label_7
.const 'Sub' $P11 = 'WSubId_1'
.annotate 'line', 8901
    $P11('File not found', $P1)
  __label_7: # endif
# Constant MACRO_CONST evaluated at compile time
# for loop
.annotate 'line', 8906
# line: $S4
    $P6 = $P5.'readline'()
    null $S4
    if_null $P6, __label_11
    set $S4, $P6
  __label_11:
  __label_10: # for condition
    $P10 = $P5.'eof'()
    isfalse $I4, $P10
    unless $I4 goto __label_9
# {
.annotate 'line', 8907
# predefined substr
    substr $S8, $S4, 0, 12
    ne $S8, '.macro_const', __label_12
# {
.annotate 'line', 8908
# pos: $I1
    set $I1, 12
.annotate 'line', 8909
# c: $S5
    null $S5
  __label_14: # while
.annotate 'line', 8910
# predefined substr
    substr $S5, $S4, $I1, 1
    iseq $I4, $S5, " "
    if $I4 goto __label_15
    iseq $I4, $S5, "\t"
  __label_15:
    unless $I4 goto __label_13
.annotate 'line', 8911
    inc $I1
    goto __label_14
  __label_13: # endwhile
.annotate 'line', 8912
# pos2: $I2
    set $I2, $I1
  __label_17: # while
.annotate 'line', 8913
# predefined substr
    substr $S5, $S4, $I2, 1
    isne $I4, $S5, " "
    unless $I4 goto __label_21
    isne $I4, $S5, "\t"
  __label_21:
    unless $I4 goto __label_20
.annotate 'line', 8914
    isne $I4, $S5, "\n"
  __label_20:
    unless $I4 goto __label_19
    isne $I4, $S5, "\r"
  __label_19:
    unless $I4 goto __label_18
    isne $I4, $S5, ""
  __label_18:
    unless $I4 goto __label_16
.annotate 'line', 8915
    inc $I2
    goto __label_17
  __label_16: # endwhile
.annotate 'line', 8916
    ne $I2, $I1, __label_22
    goto __label_8 # continue
  __label_22: # endif
.annotate 'line', 8918
# name: $S6
    sub $I4, $I2, $I1
# predefined substr
    substr $S6, $S4, $I1, $I4
  __label_24: # while
.annotate 'line', 8919
# predefined substr
    substr $S5, $S4, $I2, 1
    iseq $I4, $S5, " "
    if $I4 goto __label_25
    iseq $I4, $S5, "\t"
  __label_25:
    unless $I4 goto __label_23
.annotate 'line', 8920
    inc $I2
    goto __label_24
  __label_23: # endwhile
.annotate 'line', 8921
    set $I1, $I2
  __label_27: # while
.annotate 'line', 8922
# predefined substr
    substr $S5, $S4, $I2, 1
    isne $I4, $S5, " "
    unless $I4 goto __label_31
    isne $I4, $S5, "\t"
  __label_31:
    unless $I4 goto __label_30
.annotate 'line', 8923
    isne $I4, $S5, "\n"
  __label_30:
    unless $I4 goto __label_29
    isne $I4, $S5, "\r"
  __label_29:
    unless $I4 goto __label_28
    isne $I4, $S5, ""
  __label_28:
    unless $I4 goto __label_26
.annotate 'line', 8924
    inc $I2
    goto __label_27
  __label_26: # endwhile
.annotate 'line', 8925
    ne $I2, $I1, __label_32
    goto __label_8 # continue
  __label_32: # endif
.annotate 'line', 8927
# value: $S7
    sub $I4, $I2, $I1
# predefined substr
    substr $S7, $S4, $I1, $I4
.annotate 'line', 8929
# ivalue: $I3
    null $I3
.annotate 'line', 8930
# predefined substr
    substr $S8, $S7, 0, 2
    iseq $I4, $S8, '0x'
    if $I4 goto __label_35
# predefined substr
    substr $S9, $S7, 0, 2
    iseq $I4, $S9, '0X'
  __label_35:
    unless $I4 goto __label_33
.annotate 'line', 8931
# predefined substr
    substr $S10, $S7, 2
    box $P10, $S10
    $P6 = $P10.'to_int'(16)
    set $I3, $P6
    goto __label_34
  __label_33: # else
.annotate 'line', 8933
    set $I3, $S7
  __label_34: # endif
.annotate 'line', 8934
.const 'Sub' $P12 = 'WSubId_16'
.annotate 'line', 8936
    new $P13, [ 'TokenInteger' ]
    getattribute $P14, __ARG_1, 'file'
    getattribute $P15, __ARG_1, 'line'
    $P13.'TokenInteger'($P14, $P15, $S6)
    set $P10, $P13
.annotate 'line', 8935
    $P6 = $P12(__ARG_3, $P10, $I3)
.annotate 'line', 8934
    __ARG_3.'createconst'($S6, 'I', $P6, '', 4)
# }
  __label_12: # endif
# }
  __label_8: # for iteration
.annotate 'line', 8906
    $P6 = $P5.'readline'()
    set $S4, $P6
    goto __label_10
  __label_9: # for end
.annotate 'line', 8941
    $P5.'close'()
# }
.annotate 'line', 8942

.end # include_parrot


.sub 'parsensUsing' :subid('WSubId_88')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8948
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8949
    $P5 = $P1.'iskeyword'('extern')
    isfalse $I1, $P5
    unless $I1 goto __label_1
.const 'Sub' $P6 = 'WSubId_1'
.annotate 'line', 8950
    $P6('Unsupported at namespace level', $P1)
  __label_1: # endif
.annotate 'line', 8951
    $P1 = __ARG_2.'get'()
# switch-case
.annotate 'line', 8953
    $I1 = $P1.'isstring'()
    if $I1 goto __label_4
.annotate 'line', 8959
    $I1 = $P1.'isidentifier'()
    if $I1 goto __label_5
    goto __label_3
  __label_4: # case
.annotate 'line', 8955
# reqlib: $S1
    set $P5, $P1
    null $S1
    if_null $P5, __label_6
    set $S1, $P5
  __label_6:
.annotate 'line', 8956
    __ARG_3.'addlib'($S1)
.const 'Sub' $P7 = 'WSubId_43'
.annotate 'line', 8957
    $P7(';', __ARG_2)
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 8960
    __ARG_2.'unget'($P1)
.annotate 'line', 8961
# var module: $P2
.const 'Sub' $P8 = 'WSubId_44'
    $P2 = $P8(__ARG_2)
.annotate 'line', 8962
    $P1 = __ARG_2.'get'()
.annotate 'line', 8963
    $P9 = $P1.'isop'(';')
    isfalse $I2, $P9
    unless $I2 goto __label_7
# {
.annotate 'line', 8964
    __ARG_2.'unget'($P1)
.const 'Sub' $P4 = "WSubId_46"
.annotate 'line', 8966
# var names: $P3
.const 'Sub' $P10 = 'WSubId_27'
    null $P5
    $P3 = $P10(__ARG_2, $P5, $P4, ';')
.annotate 'line', 8967
    __ARG_3.'addextern'($P2, $P3)
# }
  __label_7: # endif
.annotate 'line', 8969
# reqmodule: $S2
# predefined join
    join $S3, '/', $P2
    concat $S2, '"', $S3
    concat $S2, $S2, '.pbc"'
.annotate 'line', 8970
    __ARG_3.'addload'($S2)
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 8971
.const 'Sub' $P11 = 'WSubId_29'
.annotate 'line', 8973
    $P11('string literal or identifier', $P1)
  __label_2: # switch end
# }
.annotate 'line', 8975

.end # parsensUsing

.namespace [ 'External' ]

.sub 'External' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8985
    setattribute self, 'module', __ARG_1
.annotate 'line', 8986
    setattribute self, 'names', __ARG_2
# }
.annotate 'line', 8987

.end # External


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8992
    __ARG_1.'say'(".sub 'importextern' :anon :load :init\n    .local pmc ex, curns, srcns, symbols\n    ex = new ['Exporter']\n    curns = get_namespace\n    symbols = new ['ResizableStringArray']\n")
.annotate 'line', 9000
    __ARG_1.'print'("    srcns = get_root_namespace ['parrot'; '")
.annotate 'line', 9001
    getattribute $P1, self, 'module'
# predefined join
    join $S2, "'; '", $P1
    __ARG_1.'print'($S2)
.annotate 'line', 9002
    __ARG_1.'say'("']")
.annotate 'line', 9003
    getattribute $P1, self, 'names'
    iter $P2, $P1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $S1, $P2
.annotate 'line', 9004
    __ARG_1.'say'("    push symbols, '", $S1, "'")
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9005
    __ARG_1.'say'("    ex.'destination'(curns)\n    ex.'import'(srcns :named('source'), curns :named('destination'), symbols :named('globals'))\n.end\n")
# }
.annotate 'line', 9011

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'External' ]
.annotate 'line', 8981
    addattribute $P0, 'module'
.annotate 'line', 8982
    addattribute $P0, 'names'
.end
.namespace [ 'NamespaceBase' ]

.sub 'NamespaceBase' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9028
    setattribute self, 'nspath', __ARG_1
.annotate 'line', 9029
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'namespaces', $P2
.annotate 'line', 9030
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'classes', $P2
.annotate 'line', 9031
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'functions', $P2
.annotate 'line', 9032
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'items', $P2
# }
.annotate 'line', 9033

.end # NamespaceBase


.sub 'getpath' :method
# Body
# {
.annotate 'line', 9036
    getattribute $P1, self, 'nspath'
    .return($P1)
# }
.annotate 'line', 9037

.end # getpath


.sub 'addextern' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9041
# var ext: $P1
    new $P1, [ 'External' ]
    $P1.'External'(__ARG_1, __ARG_2)
.annotate 'line', 9042
# var externals: $P2
    getattribute $P2, self, 'externals'
.annotate 'line', 9043
    unless_null $P2, __label_1
.annotate 'line', 9044
    root_new $P4, ['parrot';'ResizablePMCArray']
    push $P4, $P1
    set $P2, $P4
    setattribute self, 'externals', $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 9046
# predefined push
    push $P2, $P1
  __label_2: # endif
# }
.annotate 'line', 9047

.end # addextern


.sub 'checkclass_base' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9051
# var classes: $P1
    getattribute $P1, self, 'classes'
.annotate 'line', 9052
    iter $P3, $P1
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P2, $P3
.annotate 'line', 9053
    getattribute $P4, $P2, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
.annotate 'line', 9054
    .return($P2)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
    null $P4
.annotate 'line', 9055
    .return($P4)
# }
.annotate 'line', 9056

.end # checkclass_base


.sub 'findclasskey_base' :method
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 9061
# predefined elements
    elements $I1, __ARG_1
    null $I2
    if $I1 == $I2 goto __label_3
    set $I2, 1
    if $I1 == $I2 goto __label_4
    goto __label_2
  __label_3: # case
    null $P5
.annotate 'line', 9063
    .return($P5)
  __label_4: # case
.annotate 'line', 9066
    $P6 = __ARG_1[0]
    .tailcall self.'checkclass_base'($P6)
  __label_2: # default
.annotate 'line', 9071
# var namespaces: $P1
    getattribute $P1, self, 'namespaces'
.annotate 'line', 9072
# var childkey: $P2
# predefined clone
    clone $P2, __ARG_1
.annotate 'line', 9073
# basename: $S1
    $P7 = $P2.'shift'()
    null $S1
    if_null $P7, __label_5
    set $S1, $P7
  __label_5:
.annotate 'line', 9074
    iter $P8, $P1
    set $P8, 0
  __label_6: # for iteration
    unless $P8 goto __label_7
    shift $P3, $P8
# {
.annotate 'line', 9075
    getattribute $P9, $P3, 'name'
    set $S2, $P9
    ne $S2, $S1, __label_8
# {
.annotate 'line', 9076
# var found: $P4
    $P4 = $P3.'findclasskey'($P2)
.annotate 'line', 9077
    if_null $P4, __label_9
.annotate 'line', 9078
    .return($P4)
  __label_9: # endif
# }
  __label_8: # endif
# }
    goto __label_6
  __label_7: # endfor
  __label_1: # switch end
    null $P5
.annotate 'line', 9082
    .return($P5)
# }
.annotate 'line', 9083

.end # findclasskey_base


.sub 'findsymbol' :method
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 9088
# predefined elements
    elements $I1, __ARG_1
    null $I2
    if $I1 == $I2 goto __label_3
    set $I2, 1
    if $I1 == $I2 goto __label_4
    goto __label_2
  __label_3: # case
    null $P7
.annotate 'line', 9090
    .return($P7)
  __label_4: # case
.annotate 'line', 9092
# name: $S1
    $S1 = __ARG_1[0]
.annotate 'line', 9094
# var sym: $P1
    $P1 = self.'checkclass_base'($S1)
.annotate 'line', 9095
    if_null $P1, __label_5
.annotate 'line', 9096
    .return($P1)
  __label_5: # endif
.annotate 'line', 9097
    getattribute $P8, self, 'functions'
    iter $P9, $P8
    set $P9, 0
  __label_6: # for iteration
    unless $P9 goto __label_7
    shift $P2, $P9
.annotate 'line', 9098
    getattribute $P10, $P2, 'name'
    set $S3, $P10
    ne $S3, $S1, __label_8
.annotate 'line', 9099
    .return($P2)
  __label_8: # endif
    goto __label_6
  __label_7: # endfor
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 9105
# var namespaces: $P3
    getattribute $P3, self, 'namespaces'
.annotate 'line', 9106
# var childkey: $P4
# predefined clone
    clone $P4, __ARG_1
.annotate 'line', 9107
# basename: $S2
    $P11 = $P4.'shift'()
    null $S2
    if_null $P11, __label_9
    set $S2, $P11
  __label_9:
.annotate 'line', 9108
    iter $P12, $P3
    set $P12, 0
  __label_10: # for iteration
    unless $P12 goto __label_11
    shift $P5, $P12
# {
.annotate 'line', 9109
    getattribute $P13, $P5, 'name'
    set $S4, $P13
    ne $S4, $S2, __label_12
# {
.annotate 'line', 9110
# var found: $P6
    $P6 = $P5.'findsymbol'($P4)
.annotate 'line', 9111
    if_null $P6, __label_13
.annotate 'line', 9112
    .return($P6)
  __label_13: # endif
# }
  __label_12: # endif
# }
    goto __label_10
  __label_11: # endfor
  __label_1: # switch end
.annotate 'line', 9117
    getattribute $P7, self, 'owner'
    if_null $P7, __label_14
.annotate 'line', 9118
    getattribute $P8, self, 'owner'
    .tailcall $P8.'findsymbol'(__ARG_1)
  __label_14: # endif
    null $P7
.annotate 'line', 9119
    .return($P7)
# }
.annotate 'line', 9120

.end # findsymbol


.sub 'declarenamespace' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 9123
# var child: $P1
    new $P1, [ 'NamespaceStatement' ]
    null $P2
    $P1.'NamespaceStatement'(self, __ARG_1, __ARG_2, $P2)
.annotate 'line', 9124
    getattribute $P2, self, 'namespaces'
# predefined push
    push $P2, $P1
.annotate 'line', 9125
    .return($P1)
# }
.annotate 'line', 9126

.end # declarenamespace


.sub 'childnamespace' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9129
# var child: $P1
    new $P1, [ 'NamespaceStatement' ]
    $P1.'NamespaceStatement'(self, __ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 9130
    getattribute $P2, self, 'namespaces'
# predefined push
    push $P2, $P1
.annotate 'line', 9131
    getattribute $P2, self, 'items'
# predefined push
    push $P2, $P1
.annotate 'line', 9132
    .return($P1)
# }
.annotate 'line', 9133

.end # childnamespace


.sub 'declareclass' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9136
    getattribute $P1, self, 'classes'
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 9137

.end # declareclass


.sub 'addclass' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9140
    getattribute $P1, self, 'classes'
# predefined push
    push $P1, __ARG_1
.annotate 'line', 9141
    getattribute $P1, self, 'items'
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 9142

.end # addclass


.sub 'parsenamespace' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9145
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9146
# name: $S1
    set $P4, $P1
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 9147
    $P1 = __ARG_2.'get'()
.annotate 'line', 9149
# var modifier: $P2
    null $P2
.annotate 'line', 9150
    $P4 = $P1.'isop'('[')
    if_null $P4, __label_2
    unless $P4 goto __label_2
# {
.annotate 'line', 9151
    new $P5, [ 'ModifierList' ]
    $P5.'ModifierList'(__ARG_2, self)
    set $P2, $P5
.annotate 'line', 9152
    $P1 = __ARG_2.'get'()
# }
  __label_2: # endif
.const 'Sub' $P6 = 'WSubId_4'
.annotate 'line', 9155
    $P6('{', $P1)
.annotate 'line', 9156
# var child: $P3
    $P3 = self.'childnamespace'(__ARG_1, $S1, $P2)
.annotate 'line', 9157
    $P3.'parse'(__ARG_2)
# }
.annotate 'line', 9158

.end # parsenamespace


.sub 'parse' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9161
# var items: $P1
    getattribute $P1, self, 'items'
.annotate 'line', 9162
# var functions: $P2
    getattribute $P2, self, 'functions'
.annotate 'line', 9163
# var classes: $P3
    getattribute $P3, self, 'classes'
.annotate 'line', 9164
# var t: $P4
    null $P4
# for loop
.annotate 'line', 9165
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
.annotate 'line', 9167
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
.annotate 'line', 9169
    self.'parsenamespace'($P4, __ARG_1)
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 9172
# var cst: $P5
.const 'Sub' $P9 = 'WSubId_34'
    $P5 = $P9($P4, __ARG_1, self)
.annotate 'line', 9173
# predefined push
    push $P1, $P5
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 9176
# var f: $P6
    new $P6, [ 'FunctionStatement' ]
    $P6.'FunctionStatement'($P4, __ARG_1, self)
.annotate 'line', 9177
# predefined push
    push $P2, $P6
.annotate 'line', 9178
# predefined push
    push $P1, $P6
    goto __label_5 # break
  __label_10: # case
.annotate 'line', 9179
.const 'Sub' $P10 = 'WSubId_87'
.annotate 'line', 9181
    $P10($P4, __ARG_1, self)
    goto __label_5 # break
  __label_11: # case
.annotate 'line', 9182
.const 'Sub' $P11 = 'WSubId_88'
.annotate 'line', 9184
    $P11($P4, __ARG_1, self)
    goto __label_5 # break
  __label_12: # case
.annotate 'line', 9185
.const 'Sub' $P12 = 'WSubId_89'
.annotate 'line', 9187
    $P12($P4, __ARG_1, self)
    goto __label_5 # break
  __label_13: # case
.annotate 'line', 9190
    $P4 = __ARG_1.'get'()
.annotate 'line', 9191
    $P13 = $P4.'isstring'()
    isfalse $I2, $P13
    unless $I2 goto __label_15
.const 'Sub' $P14 = 'WSubId_29'
.annotate 'line', 9192
    $P14('string literal', $P4)
  __label_15: # endif
.const 'Sub' $P15 = 'WSubId_43'
.annotate 'line', 9193
    $P15(';', __ARG_1)
.annotate 'line', 9194
    new $P18, [ 'StringLiteral' ]
    $P18.'StringLiteral'(self, $P4)
    set $P17, $P18
    $P16 = $P17.'getPirString'()
    self.'addload'($P16)
    goto __label_5 # break
  __label_14: # case
.annotate 'line', 9197
    $P4 = __ARG_1.'get'()
.annotate 'line', 9198
    $P19 = $P4.'isstring'()
    isfalse $I3, $P19
    unless $I3 goto __label_16
.const 'Sub' $P20 = 'WSubId_29'
.annotate 'line', 9199
    $P20('string literal', $P4)
  __label_16: # endif
.const 'Sub' $P21 = 'WSubId_43'
.annotate 'line', 9200
    $P21(';', __ARG_1)
.annotate 'line', 9201
    new $P24, [ 'StringLiteral' ]
    $P24.'StringLiteral'(self, $P4)
    set $P23, $P24
    $P22 = $P23.'getPirString'()
    self.'addlib'($P22)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 9202
.const 'Sub' $P25 = 'WSubId_31'
.annotate 'line', 9204
    $P25("token", $P4)
  __label_5: # switch end
# }
  __label_1: # for iteration
.annotate 'line', 9165
    $P4 = __ARG_1.'get'()
    goto __label_3
  __label_2: # for end
.annotate 'line', 9207
    if_null $P4, __label_17
    unless $P4 goto __label_17
.annotate 'line', 9208
    self.'close_ns'($P4)
    goto __label_18
  __label_17: # else
.annotate 'line', 9210
    self.'unclosed_ns'()
  __label_18: # endif
# }
.annotate 'line', 9211

.end # parse


.sub 'optimize_base' :method
# Body
# {
.const 'Sub' $P1 = 'WSubId_28'
.annotate 'line', 9214
    getattribute $P2, self, 'items'
    $P1($P2)
# }
.annotate 'line', 9215

.end # optimize_base


.sub 'emit_base' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9218
# var path: $P1
    $P1 = self.'getpath'()
.annotate 'line', 9219
# s: $S1
.const 'Sub' $P5 = 'WSubId_86'
    $P4 = $P5($P1)
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 9221
# activate: $I1
    set $I1, 1
.annotate 'line', 9223
# var externals: $P2
    getattribute $P2, self, 'externals'
.annotate 'line', 9224
    if_null $P2, __label_2
# {
.annotate 'line', 9225
    __ARG_1.'say'($S1)
.annotate 'line', 9226
    null $I1
.const 'Sub' $P6 = 'WSubId_42'
.annotate 'line', 9227
    $P6(__ARG_1, $P2)
# }
  __label_2: # endif
.annotate 'line', 9230
    getattribute $P4, self, 'items'
    iter $P7, $P4
    set $P7, 0
  __label_3: # for iteration
    unless $P7 goto __label_4
    shift $P3, $P7
# {
.annotate 'line', 9231
    isa $I2, $P3, [ 'NamespaceStatement' ]
    if $I2 goto __label_7
.annotate 'line', 9232
    isa $I2, $P3, [ 'ClassStatement' ]
  __label_7:
    unless $I2 goto __label_5
.annotate 'line', 9233
    set $I1, 1
    goto __label_6
  __label_5: # else
.annotate 'line', 9235
    unless $I1 goto __label_8
# {
.annotate 'line', 9236
    __ARG_1.'say'($S1)
.annotate 'line', 9237
    null $I1
# }
  __label_8: # endif
  __label_6: # endif
.annotate 'line', 9239
    $P3.'emit'(__ARG_1)
# }
    goto __label_3
  __label_4: # endfor
# }
.annotate 'line', 9241

.end # emit_base

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NamespaceBase' ]
.annotate 'line', 9016
    get_class $P1, [ 'VarContainer' ]
    addparent $P0, $P1
.annotate 'line', 9018
    addattribute $P0, 'nspath'
.annotate 'line', 9019
    addattribute $P0, 'externals'
.annotate 'line', 9020
    addattribute $P0, 'namespaces'
.annotate 'line', 9021
    addattribute $P0, 'classes'
.annotate 'line', 9022
    addattribute $P0, 'functions'
.annotate 'line', 9023
    addattribute $P0, 'items'
.annotate 'line', 9024
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
.annotate 'line', 9259
# var nspath: $P1
    $P2 = __ARG_1.'getpath'()
# predefined clone
    clone $P1, $P2
.annotate 'line', 9260
# predefined push
    push $P1, __ARG_3
.annotate 'line', 9261
    self.'NamespaceBase'($P1)
.annotate 'line', 9263
    setattribute self, 'parent', __ARG_1
.annotate 'line', 9264
    setattribute self, 'start', __ARG_2
.annotate 'line', 9265
    setattribute self, 'owner', __ARG_1
.annotate 'line', 9266
    box $P2, __ARG_3
    setattribute self, 'name', $P2
.annotate 'line', 9267
    setattribute self, 'modifier', __ARG_4
.annotate 'line', 9268
    if_null __ARG_4, __label_1
# {
.annotate 'line', 9269
    $P2 = __ARG_4.'pick'('HLL')
    if_null $P2, __label_2
.annotate 'line', 9270
    getattribute $P4, self, 'name'
    setattribute self, 'hll', $P4
  __label_2: # endif
# }
  __label_1: # endif
# }
.annotate 'line', 9272

.end # NamespaceStatement


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 9275
    getattribute $P1, self, 'parent'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 9276

.end # dowarnings


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 9279
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 9280

.end # generatesubid


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9283
    getattribute $P1, self, 'owner'
    $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 9284

.end # use_predef


.sub 'addlib' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9287
    getattribute $P1, self, 'parent'
    $P1.'addlib'(__ARG_1)
# }
.annotate 'line', 9288

.end # addlib


.sub 'addload' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9291
    getattribute $P1, self, 'parent'
    $P1.'addload'(__ARG_1)
# }
.annotate 'line', 9292

.end # addload


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9295
# var cl: $P1
    $P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 9296
    unless_null $P1, __label_1
.annotate 'line', 9297
    getattribute $P2, self, 'parent'
    .tailcall $P2.'checkclass'(__ARG_1)
    goto __label_2
  __label_1: # else
.annotate 'line', 9299
    .return($P1)
  __label_2: # endif
# }
.annotate 'line', 9300

.end # checkclass


.sub 'findclasskey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9305
# var cl: $P1
    $P1 = self.'findclasskey_base'(__ARG_1)
.annotate 'line', 9306
    unless_null $P1, __label_1
.annotate 'line', 9307
    getattribute $P2, self, 'parent'
    $P1 = $P2.'findclasskey'(__ARG_1)
  __label_1: # endif
.annotate 'line', 9308
    .return($P1)
# }
.annotate 'line', 9309

.end # findclasskey


.sub 'unclosed_ns' :method
# Body
# {
.const 'Sub' $P1 = 'WSubId_1'
.annotate 'line', 9312
    getattribute $P2, self, 'start'
    $P1('unclosed namespace', $P2)
# }
.annotate 'line', 9313

.end # unclosed_ns


.sub 'close_ns' :method
        .param pmc __ARG_1
# Empty body

.end # close_ns


.sub 'optimize' :method
# Body
# {
.annotate 'line', 9320
# var modifier: $P1
    getattribute $P1, self, 'modifier'
.annotate 'line', 9321
    if_null $P1, __label_1
.annotate 'line', 9322
    $P3 = $P1.'optimize'()
    setattribute self, 'modifier', $P3
  __label_1: # endif
.annotate 'line', 9323
    self.'optimize_base'()
.annotate 'line', 9324
    .return(self)
# }
.annotate 'line', 9325

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9328
# var hll: $P1
    getattribute $P1, self, 'hll'
.annotate 'line', 9329
    if_null $P1, __label_1
.annotate 'line', 9330
    __ARG_1.'say'(".HLL '", $P1, "'")
  __label_1: # endif
.annotate 'line', 9332
    self.'emit_base'(__ARG_1)
.annotate 'line', 9334
    if_null $P1, __label_2
.annotate 'line', 9335
    __ARG_1.'say'(".HLL 'parrot'")
  __label_2: # endif
# }
.annotate 'line', 9336

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NamespaceStatement' ]
.annotate 'line', 9248
    get_class $P1, [ 'NamespaceBase' ]
    addparent $P0, $P1
.annotate 'line', 9250
    addattribute $P0, 'parent'
.annotate 'line', 9251
    addattribute $P0, 'start'
.annotate 'line', 9252
    addattribute $P0, 'name'
.annotate 'line', 9253
    addattribute $P0, 'modifier'
.annotate 'line', 9254
    addattribute $P0, 'hll'
.end
.namespace [ 'RootNamespace' ]

.sub 'RootNamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9353
    new $P1, ['ResizableStringArray']
.annotate 'line', 9354
    self.'NamespaceBase'($P1)
.annotate 'line', 9355
    setattribute self, 'unit', __ARG_1
.annotate 'line', 9356
    root_new $P3, ['parrot';'Hash']
    setattribute self, 'predefs_used', $P3
.annotate 'line', 9357
    box $P2, 0
    setattribute self, 'subidgen', $P2
# }
.annotate 'line', 9358

.end # RootNamespace


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9361
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 9362
    $P1[__ARG_1] = 1
# }
.annotate 'line', 9363

.end # use_predef


.sub 'predef_is_used' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9366
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 9367
    $P2 = $P1[__ARG_1]
    unless_null $P2, __label_2
    null $I1
    goto __label_1
  __label_2:
    set $I1, 1
  __label_1:
    .return($I1)
# }
.annotate 'line', 9368

.end # predef_is_used


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 9372
# idgen: $I1
    getattribute $P2, self, 'subidgen'
    inc $P2
    set $P1, $P2
    set $I1, $P1
# predefined string
.annotate 'line', 9371
    set $S1, $I1
.annotate 'line', 9373
    concat $S2, 'WSubId_', $S1
    .return($S2)
# }
.annotate 'line', 9374

.end # generatesubid


.sub 'addlib' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9378
# var libs: $P1
    getattribute $P1, self, 'libs'
.annotate 'line', 9379
    unless_null $P1, __label_1
.annotate 'line', 9380
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'libs', $P1
  __label_1: # endif
.annotate 'line', 9381
    $P1[__ARG_1] = 1
# }
.annotate 'line', 9382

.end # addlib


.sub 'addload' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9385
# var loads: $P1
    getattribute $P1, self, 'loads'
.annotate 'line', 9386
    unless_null $P1, __label_1
.annotate 'line', 9387
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'loads', $P1
  __label_1: # endif
.annotate 'line', 9388
    $P1[__ARG_1] = 1
# }
.annotate 'line', 9389

.end # addload


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9392
    .tailcall self.'checkclass_base'(__ARG_1)
# }
.annotate 'line', 9393

.end # checkclass


.sub 'findclasskey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9397
    .tailcall self.'findclasskey_base'(__ARG_1)
# }
.annotate 'line', 9398

.end # findclasskey


.sub 'unclosed_ns' :method
# Empty body

.end # unclosed_ns


.sub 'close_ns' :method
        .param pmc __ARG_1
# Body
# {
.const 'Sub' $P1 = 'WSubId_1'
.annotate 'line', 9405
    $P1('Cannot close root namespace', __ARG_1)
# }
.annotate 'line', 9406

.end # close_ns


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 9409
    getattribute $P1, self, 'unit'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 9410

.end # dowarnings


.sub 'optimize' :method
# Body
# {
.annotate 'line', 9413
    self.'optimize_base'()
.annotate 'line', 9414
    .return(self)
# }
.annotate 'line', 9415

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9418
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 9421
    $P5 = $P1['chomp']
    if_null $P5, __label_1
.annotate 'line', 9422
    self.'addload'('"String/Utils.pbc"')
  __label_1: # endif
.annotate 'line', 9425
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
.annotate 'line', 9428
    iter $P6, $P2
    set $P6, 0
  __label_2: # for iteration
    unless $P6 goto __label_3
    shift $S1, $P6
.annotate 'line', 9429
    $P5 = $P1[$S1]
    if_null $P5, __label_4
# {
.annotate 'line', 9430
    self.'addlib'("'trans_ops'")
    goto __label_3 # break
.annotate 'line', 9431
# }
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
.annotate 'line', 9434
# somelib: $I1
    null $I1
.annotate 'line', 9435
# var libs: $P3
    getattribute $P3, self, 'libs'
.annotate 'line', 9436
    if_null $P3, __label_5
# {
.annotate 'line', 9437
    set $I1, 1
.annotate 'line', 9438
    iter $P7, $P3
    set $P7, 0
  __label_6: # for iteration
    unless $P7 goto __label_7
    shift $S2, $P7
.annotate 'line', 9439
    __ARG_1.'say'('.loadlib ', $S2)
    goto __label_6
  __label_7: # endfor
# }
  __label_5: # endif
.annotate 'line', 9442
# someload: $I2
    null $I2
.annotate 'line', 9443
# var loads: $P4
    getattribute $P4, self, 'loads'
.annotate 'line', 9444
    if_null $P4, __label_8
# {
.annotate 'line', 9445
    set $I2, 1
.annotate 'line', 9446
    __ARG_1.'print'("\n.sub initial_load_bytecode :anon :load :init\n")
.annotate 'line', 9447
    iter $P8, $P4
    set $P8, 0
  __label_9: # for iteration
    unless $P8 goto __label_10
    shift $S3, $P8
.annotate 'line', 9448
    __ARG_1.'say'('    load_bytecode ', $S3)
    goto __label_9
  __label_10: # endfor
.annotate 'line', 9449
    __ARG_1.'print'(".end\n\n")
# }
  __label_8: # endif
.annotate 'line', 9451
    or $I3, $I1, $I2
    unless $I3 goto __label_11
.annotate 'line', 9452
    __ARG_1.'comment'('end libs')
  __label_11: # endif
.annotate 'line', 9454
    self.'emit_base'(__ARG_1)
# }
.annotate 'line', 9455

.end # emit


.sub 'emitinclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9458
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 9459
    iter $P4, $P1
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $S1, $P4
# {
.annotate 'line', 9460
# var data: $P2
    $P2 = $P1[$S1]
.annotate 'line', 9461
    isa $I2, $P2, [ 'VarData' ]
    not $I1, $I2
    if $I1 goto __label_5
.annotate 'line', 9462
    $P5 = $P2.'gettype'()
    set $S2, $P5
    isne $I1, $S2, 'I'
  __label_5:
    if $I1 goto __label_4
.annotate 'line', 9463
    $I3 = $P2.'getflags'()
    band $I1, $I3, 4
  __label_4:
    unless $I1 goto __label_3
    goto __label_1 # continue
  __label_3: # endif
.annotate 'line', 9465
# var value: $P3
    $P3 = $P2.'getvalue'()
.annotate 'line', 9466
    $P5 = $P3.'getIntegerValue'()
    __ARG_1.'say'('.macro_const ', $S1, ' ', $P5)
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 9468

.end # emitinclude

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'RootNamespace' ]
.annotate 'line', 9343
    get_class $P1, [ 'NamespaceBase' ]
    addparent $P0, $P1
.annotate 'line', 9345
    addattribute $P0, 'unit'
.annotate 'line', 9346
    addattribute $P0, 'predefs_used'
.annotate 'line', 9347
    addattribute $P0, 'libs'
.annotate 'line', 9348
    addattribute $P0, 'loads'
.annotate 'line', 9349
    addattribute $P0, 'subidgen'
.end
.namespace [ ]
# Constant EVAL_NAME evaluated at compile time
.namespace [ 'WinxedCompileUnit' ]

.sub 'init' :method :vtable
# Body
# {
.annotate 'line', 9484
    box $P3, 1
    setattribute self, 'warnings', $P3
.annotate 'line', 9485
# var rootns: $P1
    new $P1, [ 'RootNamespace' ]
    $P1.'RootNamespace'(self)
.annotate 'line', 9488
# var taux: $P2
    new $P2, [ 'TokenIdentifier' ]
    $P2.'TokenIdentifier'('__predefconst__', 0, 'predefconst')
.annotate 'line', 9490
.const 'Sub' $P4 = 'WSubId_16'
.annotate 'line', 9492
    new $P6, [ 'TokenInteger' ]
    getattribute $P7, $P2, 'file'
    getattribute $P8, $P2, 'line'
    $P6.'TokenInteger'($P7, $P8, 'false')
    set $P5, $P6
.annotate 'line', 9491
    $P3 = $P4($P1, $P5, 0)
.annotate 'line', 9490
    $P1.'createconst'('false', 'I', $P3, '', 4)
.annotate 'line', 9494
.const 'Sub' $P9 = 'WSubId_16'
.annotate 'line', 9496
    new $P6, [ 'TokenInteger' ]
    getattribute $P7, $P2, 'file'
    getattribute $P8, $P2, 'line'
    $P6.'TokenInteger'($P7, $P8, 'false')
    set $P5, $P6
.annotate 'line', 9495
    $P3 = $P9($P1, $P5, 1)
.annotate 'line', 9494
    $P1.'createconst'('true', 'I', $P3, '', 4)
.annotate 'line', 9502
    new $P5, [ 'StringLiteral' ]
.annotate 'line', 9503
    new $P7, [ 'TokenQuoted' ]
    getattribute $P8, $P2, 'file'
    getattribute $P10, $P2, 'line'
# predefined string
# predefined int
.annotate 'line', 9501
    set $I2, "2"
    add $I1, $I2, 1
    set $S1, $I1
    $P7.'TokenQuoted'($P8, $P10, $S1)
    set $P6, $P7
    $P5.'StringLiteral'($P1, $P6)
    set $P3, $P5
    $P1.'createconst'('__STAGE__', 'S', $P3, '', 4)
.annotate 'line', 9506
    setattribute self, 'rootns', $P1
# }
.annotate 'line', 9507

.end # init


.sub 'setwarnmode' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 9510
    getattribute $P1, self, 'warnings'
    assign $P1, __ARG_1
# }
.annotate 'line', 9511

.end # setwarnmode


.sub 'dowarnings' :method
# Body
# {
# predefined int
.annotate 'line', 9514
    getattribute $P1, self, 'warnings'
.annotate 'line', 9513
    set $I1, $P1
.annotate 'line', 9514
    .return($I1)
# }
.annotate 'line', 9515

.end # dowarnings


.sub 'parse' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9518
    getattribute $P1, self, 'rootns'
    $P1.'parse'(__ARG_1)
# }
.annotate 'line', 9519

.end # parse


.sub 'optimize' :method
# Body
# {
.annotate 'line', 9522
    getattribute $P3, self, 'rootns'
    $P2 = $P3.'optimize'()
    setattribute self, 'rootns', $P2
# }
.annotate 'line', 9523

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9526
    __ARG_1.'comment'('Begin generated code')
.annotate 'line', 9527
    __ARG_1.'say'('')
.annotate 'line', 9529
    getattribute $P1, self, 'rootns'
    $P1.'emit'(__ARG_1)
.annotate 'line', 9531
    __ARG_1.'comment'('End generated code')
# }
.annotate 'line', 9532

.end # emit


.sub 'emitinclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9535
    __ARG_1.'comment'('DO NOT EDIT THIS FILE')
.annotate 'line', 9536
    __ARG_1.'comment'('Generated automatically from Winxed sources')
.annotate 'line', 9538
    getattribute $P1, self, 'rootns'
    $P1.'emitinclude'(__ARG_1)
.annotate 'line', 9540
    __ARG_1.'comment'('End')
# }
.annotate 'line', 9541

.end # emitinclude

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'WinxedCompileUnit' ]
.annotate 'line', 9479
    addattribute $P0, 'rootns'
.annotate 'line', 9480
    addattribute $P0, 'warnings'
.end
.namespace [ 'WinxedHLL' ]

.sub '__private_compile_tail' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9550
    set $S2, __ARG_2
    ne $S2, 'parse', __label_1
.annotate 'line', 9551
    .return(__ARG_1)
  __label_1: # endif
.annotate 'line', 9552
# var handleout: $P1
    new $P1, [ 'StringHandle' ]
.annotate 'line', 9553
    $P1.'open'('__eval__', 'w')
.annotate 'line', 9554
# var emit: $P2
    new $P2, [ 'Emit' ]
    $P2.'Emit'($P1)
.annotate 'line', 9555
    if_null __ARG_3, __label_2
    unless __ARG_3 goto __label_2
.annotate 'line', 9556
    $P2.'disable_annotations'()
  __label_2: # endif
.annotate 'line', 9557
    __ARG_1.'emit'($P2)
.annotate 'line', 9558
    $P2.'close'()
.annotate 'line', 9559
    $P1.'close'()
.annotate 'line', 9560
# pircode: $S1
    $P5 = $P1.'read'(0)
    null $S1
    if_null $P5, __label_3
    set $S1, $P5
  __label_3:
.annotate 'line', 9561
# var object: $P3
    null $P3
# switch
.annotate 'line', 9562
    set $S2, __ARG_2
    set $S3, 'pir'
    if $S2 == $S3 goto __label_6
    set $S3, 'pbc'
    if $S2 == $S3 goto __label_7
    set $S3, ''
    if $S2 == $S3 goto __label_8
    goto __label_5
  __label_6: # case
.annotate 'line', 9564
    new $P3, [ 'String' ]
.annotate 'line', 9565
    assign $P3, $S1
    goto __label_4 # break
  __label_7: # case
  __label_8: # case
.annotate 'line', 9569
# var pircomp: $P4
# predefined compreg
    compreg $P4, 'PIR'
.annotate 'line', 9570
    $P3 = $P4($S1)
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 9571
# predefined string
.annotate 'line', 9573
    set $S4, __ARG_2
    concat $S5, 'Invalid target: ', $S4
# predefined die
    die $S5
  __label_4: # switch end
.annotate 'line', 9575
    .return($P3)
# }
.annotate 'line', 9576

.end # __private_compile_tail


.sub '__private_geninclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9579
# var handleout: $P1
    new $P1, [ 'StringHandle' ]
.annotate 'line', 9580
    $P1.'open'('__eval__', 'w')
.annotate 'line', 9581
# var emit: $P2
    new $P2, [ 'Emit' ]
    $P2.'Emit'($P1)
.annotate 'line', 9582
    __ARG_1.'emitinclude'($P2)
.annotate 'line', 9583
    $P2.'close'()
.annotate 'line', 9584
    $P1.'close'()
.annotate 'line', 9585
    .tailcall $P1.'read'(0)
# }
.annotate 'line', 9586

.end # __private_geninclude


.sub 'compile' :method
        .param string __ARG_1
        .param string __ARG_2 :optional :named('target')
        .param int __ARG_3 :optional :named('noan')
        .param int __ARG_4 :optional :named('nowarn')
# Body
# {
.annotate 'line', 9592
    unless_null __ARG_2, __label_1
.annotate 'line', 9593
    set __ARG_2, ''
  __label_1: # endif
.annotate 'line', 9594
# var handlein: $P1
    new $P1, [ 'StringHandle' ]
.annotate 'line', 9595
    $P1.'open'('__eval__', 'w')
.annotate 'line', 9596
    $P1.'puts'(__ARG_1)
.annotate 'line', 9597
    $P1.'close'()
.annotate 'line', 9598
    $P1.'open'('__eval__', 'r')
.annotate 'line', 9599
# var tk: $P2
    new $P2, [ 'Tokenizer' ]
    $P2.'Tokenizer'($P1, '__eval__')
.annotate 'line', 9600
# var winxed: $P3
    new $P3, [ 'WinxedCompileUnit' ]
.annotate 'line', 9601
    unless __ARG_4 goto __label_2
.annotate 'line', 9602
    $P3.'setwarnmode'(0)
  __label_2: # endif
.annotate 'line', 9603
    $P3.'parse'($P2)
.annotate 'line', 9604
    $P1.'close'()
.annotate 'line', 9605
    $P3.'optimize'()
.annotate 'line', 9606
    ne __ARG_2, 'include', __label_3
.annotate 'line', 9607
    .tailcall self.'__private_geninclude'($P3)
    goto __label_4
  __label_3: # else
.annotate 'line', 9609
    .tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3)
  __label_4: # endif
# }
.annotate 'line', 9610

.end # compile


.sub 'compile_from_file' :method
        .param string __ARG_1
        .param string __ARG_2 :optional :named('target')
        .param int __ARG_3 :optional :named('noan')
        .param int __ARG_4 :optional :named('nowarn')
# Body
# {
.annotate 'line', 9616
    unless_null __ARG_2, __label_1
.annotate 'line', 9617
    set __ARG_2, ''
  __label_1: # endif
.annotate 'line', 9618
# var handlein: $P1
    new $P1, [ 'FileHandle' ]
.annotate 'line', 9619
    $P1.'open'(__ARG_1, 'r')
.annotate 'line', 9620
    $P1.'encoding'('utf8')
.annotate 'line', 9621
# var tk: $P2
    new $P2, [ 'Tokenizer' ]
    $P2.'Tokenizer'($P1, __ARG_1)
.annotate 'line', 9622
# var winxed: $P3
    new $P3, [ 'WinxedCompileUnit' ]
.annotate 'line', 9623
    unless __ARG_4 goto __label_2
.annotate 'line', 9624
    $P3.'setwarnmode'(0)
  __label_2: # endif
.annotate 'line', 9625
    $P3.'parse'($P2)
.annotate 'line', 9626
    $P1.'close'()
.annotate 'line', 9627
    $P3.'optimize'()
.annotate 'line', 9628
    ne __ARG_2, 'include', __label_3
.annotate 'line', 9629
    .tailcall self.'__private_geninclude'($P3)
    goto __label_4
  __label_3: # else
.annotate 'line', 9631
    .tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3)
  __label_4: # endif
# }
.annotate 'line', 9632

.end # compile_from_file

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'WinxedHLL' ]
.end
.namespace [ ]

.sub 'initializer' :init :load
# Body
# {
.annotate 'line', 9641
# var comp: $P1
    new $P1, [ 'WinxedHLL' ]
.annotate 'line', 9642
# predefined compreg
    compreg 'winxed', $P1
# }
.annotate 'line', 9643

.end # initializer

# End generated code
