module TD.Data.SecretChatState where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data SecretChatState -- ^ Describes the current secret chat state
  = SecretChatStatePending -- ^ The secret chat is not yet created; waiting for the other user to get online
  | SecretChatStateReady -- ^ The secret chat is ready to use
  | SecretChatStateClosed -- ^ The secret chat is closed
  deriving (Eq)

instance Show SecretChatState where
  show SecretChatStatePending
      = "SecretChatStatePending"
  show SecretChatStateReady
      = "SecretChatStateReady"
  show SecretChatStateClosed
      = "SecretChatStateClosed"

instance AT.FromJSON SecretChatState where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "secretChatStatePending" -> pure SecretChatStatePending
      "secretChatStateReady"   -> pure SecretChatStateReady
      "secretChatStateClosed"  -> pure SecretChatStateClosed
      _                        -> mempty
    

instance AT.ToJSON SecretChatState where
  toJSON SecretChatStatePending
      = A.object
        [ "@type" A..= AT.String "secretChatStatePending"
        ]
  toJSON SecretChatStateReady
      = A.object
        [ "@type" A..= AT.String "secretChatStateReady"
        ]
  toJSON SecretChatStateClosed
      = A.object
        [ "@type" A..= AT.String "secretChatStateClosed"
        ]
