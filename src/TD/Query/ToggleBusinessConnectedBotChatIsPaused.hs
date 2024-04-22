module TD.Query.ToggleBusinessConnectedBotChatIsPaused
  (ToggleBusinessConnectedBotChatIsPaused(..)
  , defaultToggleBusinessConnectedBotChatIsPaused
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Pauses or resumes the connected business bot in a specific chat. Returns 'TD.Data.Ok.Ok'
data ToggleBusinessConnectedBotChatIsPaused
  = ToggleBusinessConnectedBotChatIsPaused
    { chat_id   :: Maybe Int  -- ^ Chat identifier
    , is_paused :: Maybe Bool -- ^ Pass true to pause the connected bot in the chat; pass false to resume the bot
    }
  deriving (Eq, Show)

instance I.ShortShow ToggleBusinessConnectedBotChatIsPaused where
  shortShow
    ToggleBusinessConnectedBotChatIsPaused
      { chat_id   = chat_id_
      , is_paused = is_paused_
      }
        = "ToggleBusinessConnectedBotChatIsPaused"
          ++ I.cc
          [ "chat_id"   `I.p` chat_id_
          , "is_paused" `I.p` is_paused_
          ]

instance AT.ToJSON ToggleBusinessConnectedBotChatIsPaused where
  toJSON
    ToggleBusinessConnectedBotChatIsPaused
      { chat_id   = chat_id_
      , is_paused = is_paused_
      }
        = A.object
          [ "@type"     A..= AT.String "toggleBusinessConnectedBotChatIsPaused"
          , "chat_id"   A..= chat_id_
          , "is_paused" A..= is_paused_
          ]

defaultToggleBusinessConnectedBotChatIsPaused :: ToggleBusinessConnectedBotChatIsPaused
defaultToggleBusinessConnectedBotChatIsPaused =
  ToggleBusinessConnectedBotChatIsPaused
    { chat_id   = Nothing
    , is_paused = Nothing
    }

