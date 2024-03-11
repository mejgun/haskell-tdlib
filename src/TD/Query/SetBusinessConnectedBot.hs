module TD.Query.SetBusinessConnectedBot
  (SetBusinessConnectedBot(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.BusinessConnectedBot as BusinessConnectedBot

-- | Adds or changes business bot that is connected to the current user account. Returns 'TD.Data.Ok.Ok'
data SetBusinessConnectedBot
  = SetBusinessConnectedBot
    { bot :: Maybe BusinessConnectedBot.BusinessConnectedBot -- ^ Connection settings for the bot
    }
  deriving (Eq, Show)

instance I.ShortShow SetBusinessConnectedBot where
  shortShow
    SetBusinessConnectedBot
      { bot = bot_
      }
        = "SetBusinessConnectedBot"
          ++ I.cc
          [ "bot" `I.p` bot_
          ]

instance AT.ToJSON SetBusinessConnectedBot where
  toJSON
    SetBusinessConnectedBot
      { bot = bot_
      }
        = A.object
          [ "@type" A..= AT.String "setBusinessConnectedBot"
          , "bot"   A..= bot_
          ]

