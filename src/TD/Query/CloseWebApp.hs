{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.CloseWebApp where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Informs TDLib that a previously opened Web App was closed @web_app_launch_id Identifier of Web App launch, received from openWebApp
data CloseWebApp = CloseWebApp
  { -- |
    web_app_launch_id :: Maybe Int
  }
  deriving (Eq)

instance Show CloseWebApp where
  show
    CloseWebApp
      { web_app_launch_id = web_app_launch_id_
      } =
      "CloseWebApp"
        ++ U.cc
          [ U.p "web_app_launch_id" web_app_launch_id_
          ]

instance T.ToJSON CloseWebApp where
  toJSON
    CloseWebApp
      { web_app_launch_id = web_app_launch_id_
      } =
      A.object
        [ "@type" A..= T.String "closeWebApp",
          "web_app_launch_id" A..= U.toS web_app_launch_id_
        ]
