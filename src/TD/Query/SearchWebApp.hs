module TD.Query.SearchWebApp
  (SearchWebApp(..)
  , defaultSearchWebApp
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Returns information about a Web App by its short name. Returns a 404 error if the Web App is not found. Returns 'TD.Data.FoundWebApp.FoundWebApp'
data SearchWebApp
  = SearchWebApp
    { bot_user_id        :: Maybe Int    -- ^ Identifier of the target bot
    , web_app_short_name :: Maybe T.Text -- ^ Short name of the Web App
    }
  deriving (Eq, Show)

instance I.ShortShow SearchWebApp where
  shortShow
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

defaultSearchWebApp :: SearchWebApp
defaultSearchWebApp =
  SearchWebApp
    { bot_user_id        = Nothing
    , web_app_short_name = Nothing
    }

