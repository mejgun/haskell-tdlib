module TD.Data.CanTransferOwnershipResult
  (CanTransferOwnershipResult(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Represents result of checking whether the current session can be used to transfer a chat ownership to another user
data CanTransferOwnershipResult
  = CanTransferOwnershipResultOk -- ^ The session can be used
  | CanTransferOwnershipResultPasswordNeeded -- ^ The 2-step verification needs to be enabled first
  | CanTransferOwnershipResultPasswordTooFresh -- ^ The 2-step verification was enabled recently, user needs to wait
    { retry_after :: Maybe Int -- ^ Time left before the session can be used to transfer ownership of a chat, in seconds
    }
  | CanTransferOwnershipResultSessionTooFresh -- ^ The session was created recently, user needs to wait
    { retry_after :: Maybe Int -- ^ Time left before the session can be used to transfer ownership of a chat, in seconds
    }
  deriving (Eq, Show)

instance I.ShortShow CanTransferOwnershipResult where
  shortShow CanTransferOwnershipResultOk
      = "CanTransferOwnershipResultOk"
  shortShow CanTransferOwnershipResultPasswordNeeded
      = "CanTransferOwnershipResultPasswordNeeded"
  shortShow CanTransferOwnershipResultPasswordTooFresh
    { retry_after = retry_after_
    }
      = "CanTransferOwnershipResultPasswordTooFresh"
        ++ I.cc
        [ "retry_after" `I.p` retry_after_
        ]
  shortShow CanTransferOwnershipResultSessionTooFresh
    { retry_after = retry_after_
    }
      = "CanTransferOwnershipResultSessionTooFresh"
        ++ I.cc
        [ "retry_after" `I.p` retry_after_
        ]

instance AT.FromJSON CanTransferOwnershipResult where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "canTransferOwnershipResultOk"               -> pure CanTransferOwnershipResultOk
      "canTransferOwnershipResultPasswordNeeded"   -> pure CanTransferOwnershipResultPasswordNeeded
      "canTransferOwnershipResultPasswordTooFresh" -> parseCanTransferOwnershipResultPasswordTooFresh v
      "canTransferOwnershipResultSessionTooFresh"  -> parseCanTransferOwnershipResultSessionTooFresh v
      _                                            -> mempty
    
    where
      parseCanTransferOwnershipResultPasswordTooFresh :: A.Value -> AT.Parser CanTransferOwnershipResult
      parseCanTransferOwnershipResultPasswordTooFresh = A.withObject "CanTransferOwnershipResultPasswordTooFresh" $ \o -> do
        retry_after_ <- o A..:?  "retry_after"
        pure $ CanTransferOwnershipResultPasswordTooFresh
          { retry_after = retry_after_
          }
      parseCanTransferOwnershipResultSessionTooFresh :: A.Value -> AT.Parser CanTransferOwnershipResult
      parseCanTransferOwnershipResultSessionTooFresh = A.withObject "CanTransferOwnershipResultSessionTooFresh" $ \o -> do
        retry_after_ <- o A..:?  "retry_after"
        pure $ CanTransferOwnershipResultSessionTooFresh
          { retry_after = retry_after_
          }
  parseJSON _ = mempty

