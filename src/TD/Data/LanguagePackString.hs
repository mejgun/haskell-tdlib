{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Data.LanguagePackString where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.LanguagePackStringValue as LanguagePackStringValue
import qualified Utils as U

-- |
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
      { value = value_,
        key = key_
      } =
      "LanguagePackString"
        ++ U.cc
          [ U.p "value" value_,
            U.p "key" key_
          ]

instance T.FromJSON LanguagePackString where
  parseJSON v@(T.Object obj) = do
    t <- obj A..: "@type" :: T.Parser String

    case t of
      "languagePackString" -> parseLanguagePackString v
      _ -> mempty
    where
      parseLanguagePackString :: A.Value -> T.Parser LanguagePackString
      parseLanguagePackString = A.withObject "LanguagePackString" $ \o -> do
        value_ <- o A..:? "value"
        key_ <- o A..:? "key"
        return $ LanguagePackString {value = value_, key = key_}
  parseJSON _ = mempty

instance T.ToJSON LanguagePackString where
  toJSON
    LanguagePackString
      { value = value_,
        key = key_
      } =
      A.object
        [ "@type" A..= T.String "languagePackString",
          "value" A..= value_,
          "key" A..= key_
        ]
