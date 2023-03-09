{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.AddCustomServerLanguagePack where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Adds a custom server language pack to the list of installed language packs in current localization target. Can be called before authorization @language_pack_id Identifier of a language pack to be added
data AddCustomServerLanguagePack = AddCustomServerLanguagePack
  { -- |
    language_pack_id :: Maybe String
  }
  deriving (Eq)

instance Show AddCustomServerLanguagePack where
  show
    AddCustomServerLanguagePack
      { language_pack_id = language_pack_id_
      } =
      "AddCustomServerLanguagePack"
        ++ U.cc
          [ U.p "language_pack_id" language_pack_id_
          ]

instance T.ToJSON AddCustomServerLanguagePack where
  toJSON
    AddCustomServerLanguagePack
      { language_pack_id = language_pack_id_
      } =
      A.object
        [ "@type" A..= T.String "addCustomServerLanguagePack",
          "language_pack_id" A..= language_pack_id_
        ]
