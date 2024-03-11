module TD.Query.DeleteBusinessConnectedBot
  (DeleteBusinessConnectedBot(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Deletes the business bot that is connected to the current user account. Returns 'TD.Data.Ok.Ok'
data DeleteBusinessConnectedBot
  = DeleteBusinessConnectedBot
    { bot_user_id :: Maybe Int -- ^ Unique user identifier for the bot
    }
  deriving (Eq, Show)

instance I.ShortShow DeleteBusinessConnectedBot where
  shortShow
    DeleteBusinessConnectedBot
      { bot_user_id = bot_user_id_
      }
        = "DeleteBusinessConnectedBot"
          ++ I.cc
          [ "bot_user_id" `I.p` bot_user_id_
          ]

instance AT.ToJSON DeleteBusinessConnectedBot where
  toJSON
    DeleteBusinessConnectedBot
      { bot_user_id = bot_user_id_
      }
        = A.object
          [ "@type"       A..= AT.String "deleteBusinessConnectedBot"
          , "bot_user_id" A..= bot_user_id_
          ]

