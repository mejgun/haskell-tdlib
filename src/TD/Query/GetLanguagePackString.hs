{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetLanguagePackString where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns a string stored in the local database from the specified localization target and language pack by its key. Returns a 404 error if the string is not found. Can be called synchronously
data GetLanguagePackString = GetLanguagePackString
  { -- |
    key :: Maybe String,
    -- |
    language_pack_id :: Maybe String,
    -- |
    localization_target :: Maybe String,
    -- | Path to the language pack database in which strings are stored @localization_target Localization target to which the language pack belongs @language_pack_id Language pack identifier @key Language pack key of the string to be returned
    language_pack_database_path :: Maybe String
  }
  deriving (Eq)

instance Show GetLanguagePackString where
  show
    GetLanguagePackString
      { key = key_,
        language_pack_id = language_pack_id_,
        localization_target = localization_target_,
        language_pack_database_path = language_pack_database_path_
      } =
      "GetLanguagePackString"
        ++ U.cc
          [ U.p "key" key_,
            U.p "language_pack_id" language_pack_id_,
            U.p "localization_target" localization_target_,
            U.p "language_pack_database_path" language_pack_database_path_
          ]

instance T.ToJSON GetLanguagePackString where
  toJSON
    GetLanguagePackString
      { key = key_,
        language_pack_id = language_pack_id_,
        localization_target = localization_target_,
        language_pack_database_path = language_pack_database_path_
      } =
      A.object
        [ "@type" A..= T.String "getLanguagePackString",
          "key" A..= key_,
          "language_pack_id" A..= language_pack_id_,
          "localization_target" A..= localization_target_,
          "language_pack_database_path" A..= language_pack_database_path_
        ]
