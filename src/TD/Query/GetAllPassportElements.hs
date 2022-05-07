{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetAllPassportElements where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns all available Telegram Passport elements @password Password of the current user
data GetAllPassportElements = GetAllPassportElements
  { -- |
    password :: Maybe String
  }
  deriving (Eq)

instance Show GetAllPassportElements where
  show
    GetAllPassportElements
      { password = password
      } =
      "GetAllPassportElements"
        ++ U.cc
          [ U.p "password" password
          ]

instance T.ToJSON GetAllPassportElements where
  toJSON
    GetAllPassportElements
      { password = password
      } =
      A.object
        [ "@type" A..= T.String "getAllPassportElements",
          "password" A..= password
        ]
