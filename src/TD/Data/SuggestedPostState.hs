module TD.Data.SuggestedPostState
  (SuggestedPostState(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Describes state of a suggested post
data SuggestedPostState
  = SuggestedPostStatePending -- ^ The post must be approved or declined
  | SuggestedPostStateApproved -- ^ The post was approved
  | SuggestedPostStateDeclined -- ^ The post was declined
  deriving (Eq, Show)

instance I.ShortShow SuggestedPostState where
  shortShow SuggestedPostStatePending
      = "SuggestedPostStatePending"
  shortShow SuggestedPostStateApproved
      = "SuggestedPostStateApproved"
  shortShow SuggestedPostStateDeclined
      = "SuggestedPostStateDeclined"

instance AT.FromJSON SuggestedPostState where
  parseJSON (AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "suggestedPostStatePending"  -> pure SuggestedPostStatePending
      "suggestedPostStateApproved" -> pure SuggestedPostStateApproved
      "suggestedPostStateDeclined" -> pure SuggestedPostStateDeclined
      _                            -> mempty
    
  parseJSON _ = mempty

