module TD.Data.SecretChatState
  (SecretChatState(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Describes the current secret chat state
data SecretChatState
  = SecretChatStatePending -- ^ The secret chat is not yet created; waiting for the other user to get online
  | SecretChatStateReady -- ^ The secret chat is ready to use
  | SecretChatStateClosed -- ^ The secret chat is closed
  deriving (Eq, Show)

instance I.ShortShow SecretChatState where
  shortShow SecretChatStatePending
      = "SecretChatStatePending"
  shortShow SecretChatStateReady
      = "SecretChatStateReady"
  shortShow SecretChatStateClosed
      = "SecretChatStateClosed"

instance AT.FromJSON SecretChatState where
  parseJSON (AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "secretChatStatePending" -> pure SecretChatStatePending
      "secretChatStateReady"   -> pure SecretChatStateReady
      "secretChatStateClosed"  -> pure SecretChatStateClosed
      _                        -> mempty
    
  parseJSON _ = mempty

