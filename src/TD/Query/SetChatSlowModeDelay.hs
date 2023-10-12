module TD.Query.SetChatSlowModeDelay where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data SetChatSlowModeDelay -- ^ Changes the slow mode delay of a chat. Available only for supergroups; requires can_restrict_members rights
  = SetChatSlowModeDelay
    { chat_id         :: Maybe Int -- ^ Chat identifier
    , slow_mode_delay :: Maybe Int -- ^ New slow mode delay for the chat, in seconds; must be one of 0, 10, 30, 60, 300, 900, 3600
    }
  deriving (Eq)

instance Show SetChatSlowModeDelay where
  show
    SetChatSlowModeDelay
      { chat_id         = chat_id_
      , slow_mode_delay = slow_mode_delay_
      }
        = "SetChatSlowModeDelay"
          ++ I.cc
          [ "chat_id"         `I.p` chat_id_
          , "slow_mode_delay" `I.p` slow_mode_delay_
          ]

instance AT.ToJSON SetChatSlowModeDelay where
  toJSON
    SetChatSlowModeDelay
      { chat_id         = chat_id_
      , slow_mode_delay = slow_mode_delay_
      }
        = A.object
          [ "@type"           A..= AT.String "setChatSlowModeDelay"
          , "chat_id"         A..= chat_id_
          , "slow_mode_delay" A..= slow_mode_delay_
          ]
