module TD.Data.PublicChatType where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I

data PublicChatType -- ^ Describes a type of public chats
  = PublicChatTypeHasUsername -- ^ The chat is public, because it has an active username
  | PublicChatTypeIsLocationBased -- ^ The chat is public, because it is a location-based supergroup
  deriving (Eq)

instance Show PublicChatType where
  show PublicChatTypeHasUsername
      = "PublicChatTypeHasUsername"
  show PublicChatTypeIsLocationBased
      = "PublicChatTypeIsLocationBased"

instance AT.FromJSON PublicChatType where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "publicChatTypeHasUsername"     -> pure PublicChatTypeHasUsername
      "publicChatTypeIsLocationBased" -> pure PublicChatTypeIsLocationBased
      _                               -> mempty
    

instance AT.ToJSON PublicChatType where
  toJSON PublicChatTypeHasUsername
      = A.object
        [ "@type" A..= AT.String "publicChatTypeHasUsername"
        ]
  toJSON PublicChatTypeIsLocationBased
      = A.object
        [ "@type" A..= AT.String "publicChatTypeIsLocationBased"
        ]
