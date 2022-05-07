{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetPassportElement where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.PassportElementType as PassportElementType
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
      { password = password,
        _type = _type
      } =
      "GetPassportElement"
        ++ U.cc
          [ U.p "password" password,
            U.p "_type" _type
          ]

instance T.ToJSON GetPassportElement where
  toJSON
    GetPassportElement
      { password = password,
        _type = _type
      } =
      A.object
        [ "@type" A..= T.String "getPassportElement",
          "password" A..= password,
          "type" A..= _type
        ]
