module TD.Data.BusinessBotManageBar
  (BusinessBotManageBar(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data BusinessBotManageBar
  = BusinessBotManageBar -- ^ Contains information about a business bot that manages the chat
    { bot_user_id   :: Maybe Int    -- ^ User identifier of the bot
    , manage_url    :: Maybe T.Text -- ^ URL to be opened to manage the bot
    , is_bot_paused :: Maybe Bool   -- ^ True, if the bot is paused. Use toggleBusinessConnectedBotChatIsPaused to change the value of the field
    , can_bot_reply :: Maybe Bool   -- ^ True, if the bot can reply
    }
  deriving (Eq, Show)

instance I.ShortShow BusinessBotManageBar where
  shortShow BusinessBotManageBar
    { bot_user_id   = bot_user_id_
    , manage_url    = manage_url_
    , is_bot_paused = is_bot_paused_
    , can_bot_reply = can_bot_reply_
    }
      = "BusinessBotManageBar"
        ++ I.cc
        [ "bot_user_id"   `I.p` bot_user_id_
        , "manage_url"    `I.p` manage_url_
        , "is_bot_paused" `I.p` is_bot_paused_
        , "can_bot_reply" `I.p` can_bot_reply_
        ]

instance AT.FromJSON BusinessBotManageBar where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "businessBotManageBar" -> parseBusinessBotManageBar v
      _                      -> mempty
    
    where
      parseBusinessBotManageBar :: A.Value -> AT.Parser BusinessBotManageBar
      parseBusinessBotManageBar = A.withObject "BusinessBotManageBar" $ \o -> do
        bot_user_id_   <- o A..:?  "bot_user_id"
        manage_url_    <- o A..:?  "manage_url"
        is_bot_paused_ <- o A..:?  "is_bot_paused"
        can_bot_reply_ <- o A..:?  "can_bot_reply"
        pure $ BusinessBotManageBar
          { bot_user_id   = bot_user_id_
          , manage_url    = manage_url_
          , is_bot_paused = is_bot_paused_
          , can_bot_reply = can_bot_reply_
          }
  parseJSON _ = mempty

