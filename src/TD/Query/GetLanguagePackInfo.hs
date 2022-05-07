{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetLanguagePackInfo where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns information about a language pack. Returned language pack identifier may be different from a provided one. Can be called before authorization @language_pack_id Language pack identifier
data GetLanguagePackInfo = GetLanguagePackInfo
  { -- |
    language_pack_id :: Maybe String
  }
  deriving (Eq)

instance Show GetLanguagePackInfo where
  show
    GetLanguagePackInfo
      { language_pack_id = language_pack_id
      } =
      "GetLanguagePackInfo"
        ++ U.cc
          [ U.p "language_pack_id" language_pack_id
          ]

instance T.ToJSON GetLanguagePackInfo where
  toJSON
    GetLanguagePackInfo
      { language_pack_id = language_pack_id
      } =
      A.object
        [ "@type" A..= T.String "getLanguagePackInfo",
          "language_pack_id" A..= language_pack_id
        ]
