{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.LanguagePackStrings where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.LanguagePackString as LanguagePackString
import qualified Utils as U

data LanguagePackStrings = -- | Contains a list of language pack strings @strings A list of language pack strings
  LanguagePackStrings
  { -- |
    strings :: Maybe [LanguagePackString.LanguagePackString]
  }
  deriving (Eq)

instance Show LanguagePackStrings where
  show
    LanguagePackStrings
      { strings = strings
      } =
      "LanguagePackStrings"
        ++ U.cc
          [ U.p "strings" strings
          ]

instance T.FromJSON LanguagePackStrings where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "languagePackStrings" -> parseLanguagePackStrings v
      _ -> fail ""
    where
      parseLanguagePackStrings :: A.Value -> T.Parser LanguagePackStrings
      parseLanguagePackStrings = A.withObject "LanguagePackStrings" $ \o -> do
        strings_ <- o A..:? "strings"
        return $ LanguagePackStrings {strings = strings_}
  parseJSON _ = fail ""

instance T.ToJSON LanguagePackStrings where
  toJSON
    LanguagePackStrings
      { strings = strings
      } =
      A.object
        [ "@type" A..= T.String "languagePackStrings",
          "strings" A..= strings
        ]
