module TD.Query.GetWebAppUrl where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I
import qualified TD.Data.ThemeParameters as ThemeParameters

data GetWebAppUrl -- ^ Returns an HTTPS URL of a Web App to open after keyboardButtonTypeWebApp or inlineQueryResultsButtonTypeWebApp button is pressed
  = GetWebAppUrl
    { bot_user_id      :: Maybe Int                             -- ^ Identifier of the target bot
    , url              :: Maybe T.Text                          -- ^ The URL from the keyboardButtonTypeWebApp or inlineQueryResultsButtonTypeWebApp button
    , theme            :: Maybe ThemeParameters.ThemeParameters -- ^ Preferred Web App theme; pass null to use the default theme
    , application_name :: Maybe T.Text                          -- ^ Short name of the application; 0-64 English letters, digits, and underscores
    }
  deriving (Eq)

instance Show GetWebAppUrl where
  show
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
