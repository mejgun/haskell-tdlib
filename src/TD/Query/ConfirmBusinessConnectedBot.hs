module TD.Query.ConfirmBusinessConnectedBot
  (ConfirmBusinessConnectedBot(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Confirms an unconfirmed business connection of the current user from another device. Returns 'TD.Data.Ok.Ok'
data ConfirmBusinessConnectedBot
  = ConfirmBusinessConnectedBot
    { bot_user_id :: Maybe Int -- ^ User identifier of the bot
    }
  deriving (Eq, Show)

instance I.ShortShow ConfirmBusinessConnectedBot where
  shortShow
    ConfirmBusinessConnectedBot
      { bot_user_id = bot_user_id_
      }
        = "ConfirmBusinessConnectedBot"
          ++ I.cc
          [ "bot_user_id" `I.p` bot_user_id_
          ]

instance AT.ToJSON ConfirmBusinessConnectedBot where
  toJSON
    ConfirmBusinessConnectedBot
      { bot_user_id = bot_user_id_
      }
        = A.object
          [ "@type"       A..= AT.String "confirmBusinessConnectedBot"
          , "bot_user_id" A..= bot_user_id_
          ]

