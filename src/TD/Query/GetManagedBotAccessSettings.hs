module TD.Query.GetManagedBotAccessSettings
  (GetManagedBotAccessSettings(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns access settings of a managed bot; for bots only. Returns 'TD.Data.BotAccessSettings.BotAccessSettings'
data GetManagedBotAccessSettings
  = GetManagedBotAccessSettings
    { bot_user_id :: Maybe Int -- ^ Identifier of the managed bot
    }
  deriving (Eq, Show)

instance I.ShortShow GetManagedBotAccessSettings where
  shortShow
    GetManagedBotAccessSettings
      { bot_user_id = bot_user_id_
      }
        = "GetManagedBotAccessSettings"
          ++ I.cc
          [ "bot_user_id" `I.p` bot_user_id_
          ]

instance AT.ToJSON GetManagedBotAccessSettings where
  toJSON
    GetManagedBotAccessSettings
      { bot_user_id = bot_user_id_
      }
        = A.object
          [ "@type"       A..= AT.String "getManagedBotAccessSettings"
          , "bot_user_id" A..= bot_user_id_
          ]

