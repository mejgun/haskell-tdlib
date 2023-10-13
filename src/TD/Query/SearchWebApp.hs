module TD.Query.SearchWebApp(SearchWebApp(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data SearchWebApp -- ^ Returns information about a Web App by its short name. Returns a 404 error if the Web App is not found
  = SearchWebApp
    { bot_user_id        :: Maybe Int    -- ^ Identifier of the target bot
    , web_app_short_name :: Maybe T.Text -- ^ Short name of the Web App
    }
  deriving (Eq)

instance Show SearchWebApp where
  show
    SearchWebApp
      { bot_user_id        = bot_user_id_
      , web_app_short_name = web_app_short_name_
      }
        = "SearchWebApp"
          ++ I.cc
          [ "bot_user_id"        `I.p` bot_user_id_
          , "web_app_short_name" `I.p` web_app_short_name_
          ]

instance AT.ToJSON SearchWebApp where
  toJSON
    SearchWebApp
      { bot_user_id        = bot_user_id_
      , web_app_short_name = web_app_short_name_
      }
        = A.object
          [ "@type"              A..= AT.String "searchWebApp"
          , "bot_user_id"        A..= bot_user_id_
          , "web_app_short_name" A..= web_app_short_name_
          ]
