module TD.Query.SetChatSlowModeDelay
  (SetChatSlowModeDelay(..)
  , defaultSetChatSlowModeDelay
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Changes the slow mode delay of a chat. Available only for supergroups; requires can_restrict_members right. Returns 'TD.Data.Ok.Ok'
data SetChatSlowModeDelay
  = SetChatSlowModeDelay
    { chat_id         :: Maybe Int -- ^ Chat identifier
    , slow_mode_delay :: Maybe Int -- ^ New slow mode delay for the chat, in seconds; must be one of 0, 10, 30, 60, 300, 900, 3600
    }
  deriving (Eq, Show)

instance I.ShortShow SetChatSlowModeDelay where
  shortShow
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

defaultSetChatSlowModeDelay :: SetChatSlowModeDelay
defaultSetChatSlowModeDelay =
  SetChatSlowModeDelay
    { chat_id         = Nothing
    , slow_mode_delay = Nothing
    }

