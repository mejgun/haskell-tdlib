{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SetCustomLanguagePackString where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.LanguagePackString as LanguagePackString
import qualified Utils as U

-- |
-- Adds, edits or deletes a string in a custom local language pack. Can be called before authorization @language_pack_id Identifier of a previously added custom local language pack in the current localization target @new_string New language pack string
data SetCustomLanguagePackString = SetCustomLanguagePackString
  { -- |
    new_string :: Maybe LanguagePackString.LanguagePackString,
    -- |
    language_pack_id :: Maybe String
  }
  deriving (Eq)

instance Show SetCustomLanguagePackString where
  show
    SetCustomLanguagePackString
      { new_string = new_string_,
        language_pack_id = language_pack_id_
      } =
      "SetCustomLanguagePackString"
        ++ U.cc
          [ U.p "new_string" new_string_,
            U.p "language_pack_id" language_pack_id_
          ]

instance T.ToJSON SetCustomLanguagePackString where
  toJSON
    SetCustomLanguagePackString
      { new_string = new_string_,
        language_pack_id = language_pack_id_
      } =
      A.object
        [ "@type" A..= T.String "setCustomLanguagePackString",
          "new_string" A..= new_string_,
          "language_pack_id" A..= language_pack_id_
        ]
