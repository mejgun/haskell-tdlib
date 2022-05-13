{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.DeleteLanguagePack where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Deletes all information about a language pack in the current localization target. The language pack which is currently in use (including base language pack) or is being synchronized can't be deleted. Can be called before authorization @language_pack_id Identifier of the language pack to delete
data DeleteLanguagePack = DeleteLanguagePack
  { -- |
    language_pack_id :: Maybe String
  }
  deriving (Eq)

instance Show DeleteLanguagePack where
  show
    DeleteLanguagePack
      { language_pack_id = language_pack_id_
      } =
      "DeleteLanguagePack"
        ++ U.cc
          [ U.p "language_pack_id" language_pack_id_
          ]

instance T.ToJSON DeleteLanguagePack where
  toJSON
    DeleteLanguagePack
      { language_pack_id = language_pack_id_
      } =
      A.object
        [ "@type" A..= T.String "deleteLanguagePack",
          "language_pack_id" A..= language_pack_id_
        ]
