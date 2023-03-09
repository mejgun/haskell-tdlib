{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.SearchWebApp where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified Utils as U

-- |
-- Returns information about a Web App by its short name. Returns a 404 error if the Web App is not found
data SearchWebApp = SearchWebApp
  { -- | Short name of the Web App
    web_app_short_name :: Maybe String,
    -- | Identifier of the target bot
    bot_user_id :: Maybe Int
  }
  deriving (Eq)

instance Show SearchWebApp where
  show
    SearchWebApp
      { web_app_short_name = web_app_short_name_,
        bot_user_id = bot_user_id_
      } =
      "SearchWebApp"
        ++ U.cc
          [ U.p "web_app_short_name" web_app_short_name_,
            U.p "bot_user_id" bot_user_id_
          ]

instance T.ToJSON SearchWebApp where
  toJSON
    SearchWebApp
      { web_app_short_name = web_app_short_name_,
        bot_user_id = bot_user_id_
      } =
      A.object
        [ "@type" A..= T.String "searchWebApp",
          "web_app_short_name" A..= web_app_short_name_,
          "bot_user_id" A..= bot_user_id_
        ]
