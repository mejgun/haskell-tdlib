module TD.Query.GetWebAppLinkUrl
  (GetWebAppLinkUrl(..)
  , defaultGetWebAppLinkUrl
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.WebAppOpenParameters as WebAppOpenParameters

-- | Returns an HTTPS URL of a Web App to open after a link of the type internalLinkTypeWebApp is clicked. Returns 'TD.Data.HttpUrl.HttpUrl'
data GetWebAppLinkUrl
  = GetWebAppLinkUrl
    { chat_id            :: Maybe Int                                       -- ^ Identifier of the chat in which the link was clicked; pass 0 if none
    , bot_user_id        :: Maybe Int                                       -- ^ Identifier of the target bot
    , web_app_short_name :: Maybe T.Text                                    -- ^ Short name of the Web App
    , start_parameter    :: Maybe T.Text                                    -- ^ Start parameter from internalLinkTypeWebApp
    , allow_write_access :: Maybe Bool                                      -- ^ Pass true if the current user allowed the bot to send them messages
    , parameters         :: Maybe WebAppOpenParameters.WebAppOpenParameters -- ^ Parameters to use to open the Web App
    }
  deriving (Eq, Show)

instance I.ShortShow GetWebAppLinkUrl where
  shortShow
    GetWebAppLinkUrl
      { chat_id            = chat_id_
      , bot_user_id        = bot_user_id_
      , web_app_short_name = web_app_short_name_
      , start_parameter    = start_parameter_
      , allow_write_access = allow_write_access_
      , parameters         = parameters_
      }
        = "GetWebAppLinkUrl"
          ++ I.cc
          [ "chat_id"            `I.p` chat_id_
          , "bot_user_id"        `I.p` bot_user_id_
          , "web_app_short_name" `I.p` web_app_short_name_
          , "start_parameter"    `I.p` start_parameter_
          , "allow_write_access" `I.p` allow_write_access_
          , "parameters"         `I.p` parameters_
          ]

instance AT.ToJSON GetWebAppLinkUrl where
  toJSON
    GetWebAppLinkUrl
      { chat_id            = chat_id_
      , bot_user_id        = bot_user_id_
      , web_app_short_name = web_app_short_name_
      , start_parameter    = start_parameter_
      , allow_write_access = allow_write_access_
      , parameters         = parameters_
      }
        = A.object
          [ "@type"              A..= AT.String "getWebAppLinkUrl"
          , "chat_id"            A..= chat_id_
          , "bot_user_id"        A..= bot_user_id_
          , "web_app_short_name" A..= web_app_short_name_
          , "start_parameter"    A..= start_parameter_
          , "allow_write_access" A..= allow_write_access_
          , "parameters"         A..= parameters_
          ]

defaultGetWebAppLinkUrl :: GetWebAppLinkUrl
defaultGetWebAppLinkUrl =
  GetWebAppLinkUrl
    { chat_id            = Nothing
    , bot_user_id        = Nothing
    , web_app_short_name = Nothing
    , start_parameter    = Nothing
    , allow_write_access = Nothing
    , parameters         = Nothing
    }

