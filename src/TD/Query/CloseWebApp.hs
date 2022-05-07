{-# LANGUAGE OverloadedStrings #-}

module TD.Query.CloseWebApp where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Informs TDLib that a previously opened web app was closed @web_app_launch_id Identifier of web app launch, received from openWebApp
data CloseWebApp = CloseWebApp
  { -- |
    web_app_launch_id :: Maybe Int
  }
  deriving (Eq)

instance Show CloseWebApp where
  show
    CloseWebApp
      { web_app_launch_id = web_app_launch_id
      } =
      "CloseWebApp"
        ++ U.cc
          [ U.p "web_app_launch_id" web_app_launch_id
          ]

instance T.ToJSON CloseWebApp where
  toJSON
    CloseWebApp
      { web_app_launch_id = web_app_launch_id
      } =
      A.object
        [ "@type" A..= T.String "closeWebApp",
          "web_app_launch_id" A..= web_app_launch_id
        ]
