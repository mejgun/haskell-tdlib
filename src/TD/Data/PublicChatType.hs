module TD.Data.PublicChatType
  (PublicChatType(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Describes type of public chat
data PublicChatType
  = PublicChatTypeHasUsername -- ^ The chat is public, because it has an active username
  | PublicChatTypeIsLocationBased -- ^ The chat is public, because it is a location-based supergroup
  deriving (Eq, Show)

instance I.ShortShow PublicChatType where
  shortShow PublicChatTypeHasUsername
      = "PublicChatTypeHasUsername"
  shortShow PublicChatTypeIsLocationBased
      = "PublicChatTypeIsLocationBased"

instance AT.FromJSON PublicChatType where
  parseJSON (AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "publicChatTypeHasUsername"     -> pure PublicChatTypeHasUsername
      "publicChatTypeIsLocationBased" -> pure PublicChatTypeIsLocationBased
      _                               -> mempty
    
  parseJSON _ = mempty

instance AT.ToJSON PublicChatType where
  toJSON PublicChatTypeHasUsername
      = A.object
        [ "@type" A..= AT.String "publicChatTypeHasUsername"
        ]
  toJSON PublicChatTypeIsLocationBased
      = A.object
        [ "@type" A..= AT.String "publicChatTypeIsLocationBased"
        ]

