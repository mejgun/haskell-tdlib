{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.TranslateText where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Translates a text to the given language. Returns a 404 error if the translation can't be performed
data TranslateText = TranslateText
  { -- | A two-letter ISO 639-1 language code of the language to which the message is translated
    to_language_code :: Maybe String,
    -- | A two-letter ISO 639-1 language code of the language from which the message is translated. If empty, the language will be detected automatically
    from_language_code :: Maybe String,
    -- | Text to translate
    text :: Maybe String
  }
  deriving (Eq)

instance Show TranslateText where
  show
    TranslateText
      { to_language_code = to_language_code_,
        from_language_code = from_language_code_,
        text = text_
      } =
      "TranslateText"
        ++ U.cc
          [ U.p "to_language_code" to_language_code_,
            U.p "from_language_code" from_language_code_,
            U.p "text" text_
          ]

instance T.ToJSON TranslateText where
  toJSON
    TranslateText
      { to_language_code = to_language_code_,
        from_language_code = from_language_code_,
        text = text_
      } =
      A.object
        [ "@type" A..= T.String "translateText",
          "to_language_code" A..= to_language_code_,
          "from_language_code" A..= from_language_code_,
          "text" A..= text_
        ]
