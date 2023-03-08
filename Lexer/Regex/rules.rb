module Grammar
  Rules = [
    [:IF_KEYWORD,
      /if/
    ],
    [:ELSE_KEYWORD,
      /else/
    ],
    [:EQ,
      /=/
    ],
    [:EQ_EQ,
      /==/
    ],
    [:ID,
      /[a-zA-Z_][a-zA-Z_0-9]*/
    ],
    [:NUM,
      /[0-9]+/
    ],
    [:WHITESPACE,
      /[ \n\t]+/
    ]
  ]
end
