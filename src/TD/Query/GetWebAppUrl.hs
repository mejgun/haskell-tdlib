{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetWebAppUrl where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ThemeParameters as ThemeParameters
import qualified Utils as U

-- |
-- Returns an HTTPS URL of a Web App to open after keyboardButtonTypeWebApp or inlineQueryResultsButtonTypeWebApp button is pressed
data GetWebAppUrl = GetWebAppUrl
  { -- | Short name of the application; 0-64 English letters, digits, and underscores
    application_name :: Maybe String,
    -- | Preferred Web App theme; pass null to use the default theme
    theme :: Maybe ThemeParameters.ThemeParameters,
    -- | The URL from the keyboardButtonTypeWebApp or inlineQueryResultsButtonTypeWebApp button
    url :: Maybe String,
    -- | Identifier of the target bot
    bot_user_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetWebAppUrl where
  show
    GetWebAppUrl
      { application_name = application_name_,
        theme = theme_,
        url = url_,
        bot_user_id = bot_user_id_
      } =
      "GetWebAppUrl"
        ++ U.cc
          [ U.p "application_name" application_name_,
            U.p "theme" theme_,
            U.p "url" url_,
            U.p "bot_user_id" bot_user_id_
          ]

instance T.ToJSON GetWebAppUrl where
  toJSON
    GetWebAppUrl
      { application_name = application_name_,
        theme = theme_,
        url = url_,
        bot_user_id = bot_user_id_
      } =
      A.object
        [ "@type" A..= T.String "getWebAppUrl",
          "application_name" A..= application_name_,
          "theme" A..= theme_,
          "url" A..= url_,
          "bot_user_id" A..= bot_user_id_
        ]
