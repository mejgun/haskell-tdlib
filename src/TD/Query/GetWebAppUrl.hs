{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetWebAppUrl where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ThemeParameters as ThemeParameters
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
      { theme = theme_,
        url = url_,
        bot_user_id = bot_user_id_
      } =
      "GetWebAppUrl"
        ++ U.cc
          [ U.p "theme" theme_,
            U.p "url" url_,
            U.p "bot_user_id" bot_user_id_
          ]

instance T.ToJSON GetWebAppUrl where
  toJSON
    GetWebAppUrl
      { theme = theme_,
        url = url_,
        bot_user_id = bot_user_id_
      } =
      A.object
        [ "@type" A..= T.String "getWebAppUrl",
          "theme" A..= theme_,
          "url" A..= url_,
          "bot_user_id" A..= bot_user_id_
        ]
