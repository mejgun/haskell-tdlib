{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetLanguagePackStrings where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns strings from a language pack in the current localization target by their keys. Can be called before authorization
data GetLanguagePackStrings = GetLanguagePackStrings
  { -- | Language pack keys of the strings to be returned; leave empty to request all available strings
    keys :: Maybe [String],
    -- | Language pack identifier of the strings to be returned
    language_pack_id :: Maybe String
  }
  deriving (Eq)

instance Show GetLanguagePackStrings where
  show
    GetLanguagePackStrings
      { keys = keys_,
        language_pack_id = language_pack_id_
      } =
      "GetLanguagePackStrings"
        ++ U.cc
          [ U.p "keys" keys_,
            U.p "language_pack_id" language_pack_id_
          ]

instance T.ToJSON GetLanguagePackStrings where
  toJSON
    GetLanguagePackStrings
      { keys = keys_,
        language_pack_id = language_pack_id_
      } =
      A.object
        [ "@type" A..= T.String "getLanguagePackStrings",
          "keys" A..= keys_,
          "language_pack_id" A..= language_pack_id_
        ]
