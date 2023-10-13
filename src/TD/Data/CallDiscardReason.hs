module TD.Data.CallDiscardReason
  ( CallDiscardReason(..) 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT

data CallDiscardReason -- ^ Describes the reason why a call was discarded
  = CallDiscardReasonEmpty -- ^ The call wasn't discarded, or the reason is unknown
  | CallDiscardReasonMissed -- ^ The call was ended before the conversation started. It was canceled by the caller or missed by the other party
  | CallDiscardReasonDeclined -- ^ The call was ended before the conversation started. It was declined by the other party
  | CallDiscardReasonDisconnected -- ^ The call was ended during the conversation because the users were disconnected
  | CallDiscardReasonHungUp -- ^ The call was ended because one of the parties hung up
  deriving (Eq)

instance Show CallDiscardReason where
  show CallDiscardReasonEmpty
      = "CallDiscardReasonEmpty"
  show CallDiscardReasonMissed
      = "CallDiscardReasonMissed"
  show CallDiscardReasonDeclined
      = "CallDiscardReasonDeclined"
  show CallDiscardReasonDisconnected
      = "CallDiscardReasonDisconnected"
  show CallDiscardReasonHungUp
      = "CallDiscardReasonHungUp"

instance AT.FromJSON CallDiscardReason where
  parseJSON (AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "callDiscardReasonEmpty"        -> pure CallDiscardReasonEmpty
      "callDiscardReasonMissed"       -> pure CallDiscardReasonMissed
      "callDiscardReasonDeclined"     -> pure CallDiscardReasonDeclined
      "callDiscardReasonDisconnected" -> pure CallDiscardReasonDisconnected
      "callDiscardReasonHungUp"       -> pure CallDiscardReasonHungUp
      _                               -> mempty
    
  parseJSON _ = mempty

instance AT.ToJSON CallDiscardReason where
  toJSON CallDiscardReasonEmpty
      = A.object
        [ "@type" A..= AT.String "callDiscardReasonEmpty"
        ]
  toJSON CallDiscardReasonMissed
      = A.object
        [ "@type" A..= AT.String "callDiscardReasonMissed"
        ]
  toJSON CallDiscardReasonDeclined
      = A.object
        [ "@type" A..= AT.String "callDiscardReasonDeclined"
        ]
  toJSON CallDiscardReasonDisconnected
      = A.object
        [ "@type" A..= AT.String "callDiscardReasonDisconnected"
        ]
  toJSON CallDiscardReasonHungUp
      = A.object
        [ "@type" A..= AT.String "callDiscardReasonHungUp"
        ]

