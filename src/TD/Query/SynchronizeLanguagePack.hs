{-# LANGUAGE OverloadedStrings #-}

module TD.Query.SynchronizeLanguagePack where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Fetches the latest versions of all strings from a language pack in the current localization target from the server. This method doesn't need to be called explicitly for the current used/base language packs. Can be called before authorization @language_pack_id Language pack identifier
data SynchronizeLanguagePack = SynchronizeLanguagePack
  { -- |
    language_pack_id :: Maybe String
  }
  deriving (Eq)

instance Show SynchronizeLanguagePack where
  show
    SynchronizeLanguagePack
      { language_pack_id = language_pack_id
      } =
      "SynchronizeLanguagePack"
        ++ U.cc
          [ U.p "language_pack_id" language_pack_id
          ]

instance T.ToJSON SynchronizeLanguagePack where
  toJSON
    SynchronizeLanguagePack
      { language_pack_id = language_pack_id
      } =
      A.object
        [ "@type" A..= T.String "synchronizeLanguagePack",
          "language_pack_id" A..= language_pack_id
        ]
