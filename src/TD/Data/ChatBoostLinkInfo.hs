module TD.Data.ChatBoostLinkInfo
  (ChatBoostLinkInfo(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

data ChatBoostLinkInfo
  = ChatBoostLinkInfo -- ^ Contains information about a link to boost a chat
    { is_public :: Maybe Bool -- ^ True, if the link will work for non-members of the chat
    , chat_id   :: Maybe Int  -- ^ Identifier of the chat to which the link points; 0 if the chat isn't found
    }
  deriving (Eq, Show)

instance I.ShortShow ChatBoostLinkInfo where
  shortShow ChatBoostLinkInfo
    { is_public = is_public_
    , chat_id   = chat_id_
    }
      = "ChatBoostLinkInfo"
        ++ I.cc
        [ "is_public" `I.p` is_public_
        , "chat_id"   `I.p` chat_id_
        ]

instance AT.FromJSON ChatBoostLinkInfo where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatBoostLinkInfo" -> parseChatBoostLinkInfo v
      _                   -> mempty
    
    where
      parseChatBoostLinkInfo :: A.Value -> AT.Parser ChatBoostLinkInfo
      parseChatBoostLinkInfo = A.withObject "ChatBoostLinkInfo" $ \o -> do
        is_public_ <- o A..:?  "is_public"
        chat_id_   <- o A..:?  "chat_id"
        pure $ ChatBoostLinkInfo
          { is_public = is_public_
          , chat_id   = chat_id_
          }
  parseJSON _ = mempty

