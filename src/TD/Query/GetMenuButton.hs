module TD.Query.GetMenuButton where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data GetMenuButton -- ^ Returns menu button set by the bot for the given user; for bots only
  = GetMenuButton
    { user_id :: Maybe Int -- ^ Identifier of the user or 0 to get the default menu button
    }
  deriving (Eq)

instance Show GetMenuButton where
  show
    GetMenuButton
      { user_id = user_id_
      }
        = "GetMenuButton"
          ++ I.cc
          [ "user_id" `I.p` user_id_
          ]

instance AT.ToJSON GetMenuButton where
  toJSON
    GetMenuButton
      { user_id = user_id_
      }
        = A.object
          [ "@type"   A..= AT.String "getMenuButton"
          , "user_id" A..= user_id_
          ]
