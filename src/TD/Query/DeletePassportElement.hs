{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.DeletePassportElement where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.PassportElementType as PassportElementType
import qualified Utils as U

-- |
-- Deletes a Telegram Passport element @type Element type
data DeletePassportElement = DeletePassportElement
  { -- |
    _type :: Maybe PassportElementType.PassportElementType
  }
  deriving (Eq)

instance Show DeletePassportElement where
  show
    DeletePassportElement
      { _type = _type_
      } =
      "DeletePassportElement"
        ++ U.cc
          [ U.p "_type" _type_
          ]

instance T.ToJSON DeletePassportElement where
  toJSON
    DeletePassportElement
      { _type = _type_
      } =
      A.object
        [ "@type" A..= T.String "deletePassportElement",
          "type" A..= _type_
        ]
