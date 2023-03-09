{-# LANGUAGE OverloadedStrings #-}

-- |
module TD.Query.GetWebAppLinkUrl where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as T
import qualified TD.Data.ThemeParameters as ThemeParameters
import qualified Utils as U

-- |
-- Returns an HTTPS URL of a Web App to open after a link of the type internalLinkTypeWebApp is clicked
data GetWebAppLinkUrl = GetWebAppLinkUrl
  { -- | Pass true if the current user allowed the bot to send them messages
    allow_write_access :: Maybe Bool,
    -- | Short name of the application; 0-64 English letters, digits, and underscores
    application_name :: Maybe String,
    -- | Preferred Web App theme; pass null to use the default theme
    theme :: Maybe ThemeParameters.ThemeParameters,
    -- | Start parameter from internalLinkTypeWebApp
    start_parameter :: Maybe String,
    -- | Short name of the Web App
    web_app_short_name :: Maybe String,
    -- | Identifier of the target bot
    bot_user_id :: Maybe Int,
    -- | Identifier of the chat in which the link was clicked; pass 0 if none
    chat_id :: Maybe Int
  }
  deriving (Eq)

instance Show GetWebAppLinkUrl where
  show
    GetWebAppLinkUrl
      { allow_write_access = allow_write_access_,
        application_name = application_name_,
        theme = theme_,
        start_parameter = start_parameter_,
        web_app_short_name = web_app_short_name_,
        bot_user_id = bot_user_id_,
        chat_id = chat_id_
      } =
      "GetWebAppLinkUrl"
        ++ U.cc
          [ U.p "allow_write_access" allow_write_access_,
            U.p "application_name" application_name_,
            U.p "theme" theme_,
            U.p "start_parameter" start_parameter_,
            U.p "web_app_short_name" web_app_short_name_,
            U.p "bot_user_id" bot_user_id_,
            U.p "chat_id" chat_id_
          ]

instance T.ToJSON GetWebAppLinkUrl where
  toJSON
    GetWebAppLinkUrl
      { allow_write_access = allow_write_access_,
        application_name = application_name_,
        theme = theme_,
        start_parameter = start_parameter_,
        web_app_short_name = web_app_short_name_,
        bot_user_id = bot_user_id_,
        chat_id = chat_id_
      } =
      A.object
        [ "@type" A..= T.String "getWebAppLinkUrl",
          "allow_write_access" A..= allow_write_access_,
          "application_name" A..= application_name_,
          "theme" A..= theme_,
          "start_parameter" A..= start_parameter_,
          "web_app_short_name" A..= web_app_short_name_,
          "bot_user_id" A..= bot_user_id_,
          "chat_id" A..= chat_id_
        ]
