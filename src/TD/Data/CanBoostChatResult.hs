module TD.Data.CanBoostChatResult
  (CanBoostChatResult(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Represents result of checking whether the current user can boost the specific chat
data CanBoostChatResult
  = CanBoostChatResultOk -- ^ The chat can be boosted
    { currently_boosted_chat_id :: Maybe Int -- ^ Identifier of the currently boosted chat from which boost will be removed; 0 if none
    }
  | CanBoostChatResultInvalidChat -- ^ The chat can't be boosted
  | CanBoostChatResultAlreadyBoosted -- ^ The chat is already boosted by the user
  | CanBoostChatResultPremiumNeeded -- ^ The user must subscribe to Telegram Premium to be able to boost chats
  | CanBoostChatResultPremiumSubscriptionNeeded -- ^ The user must have Telegram Premium subscription instead of a gifted Telegram Premium
  | CanBoostChatResultWaitNeeded -- ^ The user must wait the specified time before the boost can be moved to another chat
    { retry_after :: Maybe Int -- ^ Time left before the user can boost another chat
    }
  deriving (Eq, Show)

instance I.ShortShow CanBoostChatResult where
  shortShow CanBoostChatResultOk
    { currently_boosted_chat_id = currently_boosted_chat_id_
    }
      = "CanBoostChatResultOk"
        ++ I.cc
        [ "currently_boosted_chat_id" `I.p` currently_boosted_chat_id_
        ]
  shortShow CanBoostChatResultInvalidChat
      = "CanBoostChatResultInvalidChat"
  shortShow CanBoostChatResultAlreadyBoosted
      = "CanBoostChatResultAlreadyBoosted"
  shortShow CanBoostChatResultPremiumNeeded
      = "CanBoostChatResultPremiumNeeded"
  shortShow CanBoostChatResultPremiumSubscriptionNeeded
      = "CanBoostChatResultPremiumSubscriptionNeeded"
  shortShow CanBoostChatResultWaitNeeded
    { retry_after = retry_after_
    }
      = "CanBoostChatResultWaitNeeded"
        ++ I.cc
        [ "retry_after" `I.p` retry_after_
        ]

instance AT.FromJSON CanBoostChatResult where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "canBoostChatResultOk"                        -> parseCanBoostChatResultOk v
      "canBoostChatResultInvalidChat"               -> pure CanBoostChatResultInvalidChat
      "canBoostChatResultAlreadyBoosted"            -> pure CanBoostChatResultAlreadyBoosted
      "canBoostChatResultPremiumNeeded"             -> pure CanBoostChatResultPremiumNeeded
      "canBoostChatResultPremiumSubscriptionNeeded" -> pure CanBoostChatResultPremiumSubscriptionNeeded
      "canBoostChatResultWaitNeeded"                -> parseCanBoostChatResultWaitNeeded v
      _                                             -> mempty
    
    where
      parseCanBoostChatResultOk :: A.Value -> AT.Parser CanBoostChatResult
      parseCanBoostChatResultOk = A.withObject "CanBoostChatResultOk" $ \o -> do
        currently_boosted_chat_id_ <- o A..:?  "currently_boosted_chat_id"
        pure $ CanBoostChatResultOk
          { currently_boosted_chat_id = currently_boosted_chat_id_
          }
      parseCanBoostChatResultWaitNeeded :: A.Value -> AT.Parser CanBoostChatResult
      parseCanBoostChatResultWaitNeeded = A.withObject "CanBoostChatResultWaitNeeded" $ \o -> do
        retry_after_ <- o A..:?  "retry_after"
        pure $ CanBoostChatResultWaitNeeded
          { retry_after = retry_after_
          }
  parseJSON _ = mempty

