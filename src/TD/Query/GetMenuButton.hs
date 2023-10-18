module TD.Query.GetMenuButton
  (GetMenuButton(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns menu button set by the bot for the given user; for bots only. Returns 'TD.Data.BotMenuButton.BotMenuButton'
data GetMenuButton
  = GetMenuButton
    { user_id :: Maybe Int -- ^ Identifier of the user or 0 to get the default menu button
    }
  deriving (Eq, Show)

instance I.ShortShow GetMenuButton where
  shortShow
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

