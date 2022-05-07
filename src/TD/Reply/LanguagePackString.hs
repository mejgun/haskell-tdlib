{-# LANGUAGE OverloadedStrings #-}

module TD.Reply.LanguagePackString where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.LanguagePackStringValue as LanguagePackStringValue
import qualified Utils as U

data LanguagePackString = -- | Represents one language pack string @key String key @value String value; pass null if the string needs to be taken from the built-in English language pack
  LanguagePackString
  { -- |
    value :: Maybe LanguagePackStringValue.LanguagePackStringValue,
    -- |
    key :: Maybe String
  }
  deriving (Eq)

instance Show LanguagePackString where
  show
    LanguagePackString
      { value = value,
        key = key
      } =
      "LanguagePackString"
        ++ U.cc
          [ U.p "value" value,
            U.p "key" key
          ]

instance T.FromJSON LanguagePackString where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "languagePackString" -> parseLanguagePackString v
      _ -> fail ""
    where
      parseLanguagePackString :: A.Value -> T.Parser LanguagePackString
      parseLanguagePackString = A.withObject "LanguagePackString" $ \o -> do
        value_ <- o A..:? "value"
        key_ <- o A..:? "key"
        return $ LanguagePackString {value = value_, key = key_}
  parseJSON _ = fail ""

instance T.ToJSON LanguagePackString where
  toJSON
    LanguagePackString
      { value = value,
        key = key
      } =
      A.object
        [ "@type" A..= T.String "languagePackString",
          "value" A..= value,
          "key" A..= key
        ]
