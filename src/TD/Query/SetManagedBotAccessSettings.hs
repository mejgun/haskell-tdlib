module TD.Query.SetManagedBotAccessSettings
  (SetManagedBotAccessSettings(..)
  , defaultSetManagedBotAccessSettings
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.BotAccessSettings as BotAccessSettings

-- | Sets access settings of a managed bot; for bots only. Returns 'TD.Data.Ok.Ok'
data SetManagedBotAccessSettings
  = SetManagedBotAccessSettings
    { bot_user_id :: Maybe Int                                 -- ^ Identifier of the managed bot
    , settings    :: Maybe BotAccessSettings.BotAccessSettings -- ^ New access settings
    }
  deriving (Eq, Show)

instance I.ShortShow SetManagedBotAccessSettings where
  shortShow
    SetManagedBotAccessSettings
      { bot_user_id = bot_user_id_
      , settings    = settings_
      }
        = "SetManagedBotAccessSettings"
          ++ I.cc
          [ "bot_user_id" `I.p` bot_user_id_
          , "settings"    `I.p` settings_
          ]

instance AT.ToJSON SetManagedBotAccessSettings where
  toJSON
    SetManagedBotAccessSettings
      { bot_user_id = bot_user_id_
      , settings    = settings_
      }
        = A.object
          [ "@type"       A..= AT.String "setManagedBotAccessSettings"
          , "bot_user_id" A..= bot_user_id_
          , "settings"    A..= settings_
          ]

defaultSetManagedBotAccessSettings :: SetManagedBotAccessSettings
defaultSetManagedBotAccessSettings =
  SetManagedBotAccessSettings
    { bot_user_id = Nothing
    , settings    = Nothing
    }

