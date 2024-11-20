module TD.Query.GetWebAppUrl
  (GetWebAppUrl(..)
  , defaultGetWebAppUrl
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.WebAppOpenParameters as WebAppOpenParameters

-- | Returns an HTTPS URL of a Web App to open from the side menu, a keyboardButtonTypeWebApp button, or an inlineQueryResultsButtonTypeWebApp button. Returns 'TD.Data.HttpUrl.HttpUrl'
data GetWebAppUrl
  = GetWebAppUrl
    { bot_user_id :: Maybe Int                                       -- ^ Identifier of the target bot
    , url         :: Maybe T.Text                                    -- ^ The URL from a keyboardButtonTypeWebApp button, inlineQueryResultsButtonTypeWebApp button, or an empty string when the bot is opened from the side menu
    , parameters  :: Maybe WebAppOpenParameters.WebAppOpenParameters -- ^ Parameters to use to open the Web App
    }
  deriving (Eq, Show)

instance I.ShortShow GetWebAppUrl where
  shortShow
    GetWebAppUrl
      { bot_user_id = bot_user_id_
      , url         = url_
      , parameters  = parameters_
      }
        = "GetWebAppUrl"
          ++ I.cc
          [ "bot_user_id" `I.p` bot_user_id_
          , "url"         `I.p` url_
          , "parameters"  `I.p` parameters_
          ]

instance AT.ToJSON GetWebAppUrl where
  toJSON
    GetWebAppUrl
      { bot_user_id = bot_user_id_
      , url         = url_
      , parameters  = parameters_
      }
        = A.object
          [ "@type"       A..= AT.String "getWebAppUrl"
          , "bot_user_id" A..= bot_user_id_
          , "url"         A..= url_
          , "parameters"  A..= parameters_
          ]

defaultGetWebAppUrl :: GetWebAppUrl
defaultGetWebAppUrl =
  GetWebAppUrl
    { bot_user_id = Nothing
    , url         = Nothing
    , parameters  = Nothing
    }

