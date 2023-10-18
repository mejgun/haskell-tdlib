module TD.Query.GetWebAppUrl
  (GetWebAppUrl(..)
  , defaultGetWebAppUrl
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.ThemeParameters as ThemeParameters

-- | Returns an HTTPS URL of a Web App to open from the side menu, a keyboardButtonTypeWebApp button, an inlineQueryResultsButtonTypeWebApp button, or an internalLinkTypeSideMenuBot link. Returns 'TD.Data.HttpUrl.HttpUrl'
data GetWebAppUrl
  = GetWebAppUrl
    { bot_user_id      :: Maybe Int                             -- ^ Identifier of the target bot
    , url              :: Maybe T.Text                          -- ^ The URL from a keyboardButtonTypeWebApp button, inlineQueryResultsButtonTypeWebApp button, an internalLinkTypeSideMenuBot link, or an empty when the bot is opened from the side menu
    , theme            :: Maybe ThemeParameters.ThemeParameters -- ^ Preferred Web App theme; pass null to use the default theme
    , application_name :: Maybe T.Text                          -- ^ Short name of the application; 0-64 English letters, digits, and underscores
    }
  deriving (Eq, Show)

instance I.ShortShow GetWebAppUrl where
  shortShow
    GetWebAppUrl
      { bot_user_id      = bot_user_id_
      , url              = url_
      , theme            = theme_
      , application_name = application_name_
      }
        = "GetWebAppUrl"
          ++ I.cc
          [ "bot_user_id"      `I.p` bot_user_id_
          , "url"              `I.p` url_
          , "theme"            `I.p` theme_
          , "application_name" `I.p` application_name_
          ]

instance AT.ToJSON GetWebAppUrl where
  toJSON
    GetWebAppUrl
      { bot_user_id      = bot_user_id_
      , url              = url_
      , theme            = theme_
      , application_name = application_name_
      }
        = A.object
          [ "@type"            A..= AT.String "getWebAppUrl"
          , "bot_user_id"      A..= bot_user_id_
          , "url"              A..= url_
          , "theme"            A..= theme_
          , "application_name" A..= application_name_
          ]

defaultGetWebAppUrl :: GetWebAppUrl
defaultGetWebAppUrl =
  GetWebAppUrl
    { bot_user_id      = Nothing
    , url              = Nothing
    , theme            = Nothing
    , application_name = Nothing
    }

