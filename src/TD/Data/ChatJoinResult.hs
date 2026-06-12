module TD.Data.ChatJoinResult
  (ChatJoinResult(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.WebAppUrl as WebAppUrl

-- | Describes result of join of a chat by the current user
data ChatJoinResult
  = ChatJoinResultSuccess -- ^ The chat was joined successfully
    { chat_id :: Maybe Int -- ^ Identifier of the chat
    }
  | ChatJoinResultRequestSent -- ^ The join request was sent and have to be approved by administrators of the chat
  | ChatJoinResultGuardBotApprovalRequired -- ^ An approval from a guard bot through a Web App is required to join the chat
    { bot_user_id :: Maybe Int                 -- ^ Identifier of the guard bot
    , url         :: Maybe WebAppUrl.WebAppUrl -- ^ The URL of the Web App to open
    , query_id    :: Maybe Int                 -- ^ Unique identifier of the join request, which will be used in updateChatJoinResult
    }
  | ChatJoinResultDeclined -- ^ The join was declined by the guard bot
  deriving (Eq, Show)

instance I.ShortShow ChatJoinResult where
  shortShow ChatJoinResultSuccess
    { chat_id = chat_id_
    }
      = "ChatJoinResultSuccess"
        ++ I.cc
        [ "chat_id" `I.p` chat_id_
        ]
  shortShow ChatJoinResultRequestSent
      = "ChatJoinResultRequestSent"
  shortShow ChatJoinResultGuardBotApprovalRequired
    { bot_user_id = bot_user_id_
    , url         = url_
    , query_id    = query_id_
    }
      = "ChatJoinResultGuardBotApprovalRequired"
        ++ I.cc
        [ "bot_user_id" `I.p` bot_user_id_
        , "url"         `I.p` url_
        , "query_id"    `I.p` query_id_
        ]
  shortShow ChatJoinResultDeclined
      = "ChatJoinResultDeclined"

instance AT.FromJSON ChatJoinResult where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatJoinResultSuccess"                  -> parseChatJoinResultSuccess v
      "chatJoinResultRequestSent"              -> pure ChatJoinResultRequestSent
      "chatJoinResultGuardBotApprovalRequired" -> parseChatJoinResultGuardBotApprovalRequired v
      "chatJoinResultDeclined"                 -> pure ChatJoinResultDeclined
      _                                        -> mempty
    
    where
      parseChatJoinResultSuccess :: A.Value -> AT.Parser ChatJoinResult
      parseChatJoinResultSuccess = A.withObject "ChatJoinResultSuccess" $ \o -> do
        chat_id_ <- o A..:?  "chat_id"
        pure $ ChatJoinResultSuccess
          { chat_id = chat_id_
          }
      parseChatJoinResultGuardBotApprovalRequired :: A.Value -> AT.Parser ChatJoinResult
      parseChatJoinResultGuardBotApprovalRequired = A.withObject "ChatJoinResultGuardBotApprovalRequired" $ \o -> do
        bot_user_id_ <- o A..:?  "bot_user_id"
        url_         <- o A..:?  "url"
        query_id_    <- o A..:?  "query_id"
        pure $ ChatJoinResultGuardBotApprovalRequired
          { bot_user_id = bot_user_id_
          , url         = url_
          , query_id    = query_id_
          }
  parseJSON _ = mempty

