module TD.Data.TonConnectSessionState
  (TonConnectSessionState(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Describes state of a TON Connect session
data TonConnectSessionState
  = TonConnectSessionStatePending -- ^ The session is pending
  | TonConnectSessionStateReady -- ^ The session is ready
  | TonConnectSessionStateClosing -- ^ The session is being closed
  | TonConnectSessionStateClosed -- ^ The session is closed
  deriving (Eq, Show)

instance I.ShortShow TonConnectSessionState where
  shortShow TonConnectSessionStatePending
      = "TonConnectSessionStatePending"
  shortShow TonConnectSessionStateReady
      = "TonConnectSessionStateReady"
  shortShow TonConnectSessionStateClosing
      = "TonConnectSessionStateClosing"
  shortShow TonConnectSessionStateClosed
      = "TonConnectSessionStateClosed"

instance AT.FromJSON TonConnectSessionState where
  parseJSON (AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "tonConnectSessionStatePending" -> pure TonConnectSessionStatePending
      "tonConnectSessionStateReady"   -> pure TonConnectSessionStateReady
      "tonConnectSessionStateClosing" -> pure TonConnectSessionStateClosing
      "tonConnectSessionStateClosed"  -> pure TonConnectSessionStateClosed
      _                               -> mempty
    
  parseJSON _ = mempty

