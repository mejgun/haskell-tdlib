{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetPassportElement where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.PassportElementType as PassportElementType
import qualified Utils as U

-- |
-- Returns one of the available Telegram Passport elements @type Telegram Passport element type @password Password of the current user
data GetPassportElement = GetPassportElement
  { -- |
    password :: Maybe String,
    -- |
    _type :: Maybe PassportElementType.PassportElementType
  }
  deriving (Eq)

instance Show GetPassportElement where
  show
    GetPassportElement
      { password = password_,
        _type = _type_
      } =
      "GetPassportElement"
        ++ U.cc
          [ U.p "password" password_,
            U.p "_type" _type_
          ]

instance T.ToJSON GetPassportElement where
  toJSON
    GetPassportElement
      { password = password_,
        _type = _type_
      } =
      A.object
        [ "@type" A..= T.String "getPassportElement",
          "password" A..= password_,
          "type" A..= _type_
        ]
