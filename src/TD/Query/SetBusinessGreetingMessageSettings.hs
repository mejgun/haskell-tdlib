module TD.Query.SetBusinessGreetingMessageSettings
  (SetBusinessGreetingMessageSettings(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.BusinessGreetingMessageSettings as BusinessGreetingMessageSettings

-- | Changes the business greeting message settings of the current user. Requires Telegram Business subscription. Returns 'TD.Data.Ok.Ok'
data SetBusinessGreetingMessageSettings
  = SetBusinessGreetingMessageSettings
    { greeting_message_settings :: Maybe BusinessGreetingMessageSettings.BusinessGreetingMessageSettings -- ^ The new settings for the greeting message of the business; pass null to disable the greeting message
    }
  deriving (Eq, Show)

instance I.ShortShow SetBusinessGreetingMessageSettings where
  shortShow
    SetBusinessGreetingMessageSettings
      { greeting_message_settings = greeting_message_settings_
      }
        = "SetBusinessGreetingMessageSettings"
          ++ I.cc
          [ "greeting_message_settings" `I.p` greeting_message_settings_
          ]

instance AT.ToJSON SetBusinessGreetingMessageSettings where
  toJSON
    SetBusinessGreetingMessageSettings
      { greeting_message_settings = greeting_message_settings_
      }
        = A.object
          [ "@type"                     A..= AT.String "setBusinessGreetingMessageSettings"
          , "greeting_message_settings" A..= greeting_message_settings_
          ]

