{-# LANGUAGE OverloadedStrings #-}

module TD.Query.GetWebAppUrl where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Reply.ThemeParameters as ThemeParameters
import qualified Utils as U

-- |
-- Returns an HTTPS URL of a web app to open after keyboardButtonTypeWebApp button is pressed
data GetWebAppUrl = GetWebAppUrl
  { -- | Preferred web app theme; pass null to use the default theme
    theme :: Maybe ThemeParameters.ThemeParameters,
    -- | The URL from the keyboardButtonTypeWebApp button
    url :: Maybe String,
    -- | Identifier of the target bot
    bot_user_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetWebAppUrl where
  show
    GetWebAppUrl
      { theme = theme,
        url = url,
        bot_user_id = bot_user_id
      } =
      "GetWebAppUrl"
        ++ U.cc
          [ U.p "theme" theme,
            U.p "url" url,
            U.p "bot_user_id" bot_user_id
          ]

instance T.ToJSON GetWebAppUrl where
  toJSON
    GetWebAppUrl
      { theme = theme,
        url = url,
        bot_user_id = bot_user_id
      } =
      A.object
        [ "@type" A..= T.String "getWebAppUrl",
          "theme" A..= theme,
          "url" A..= url,
          "bot_user_id" A..= bot_user_id
        ]
