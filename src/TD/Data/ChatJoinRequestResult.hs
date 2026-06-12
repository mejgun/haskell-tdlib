module TD.Data.ChatJoinRequestResult
  (ChatJoinRequestResult(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Describes result of a chat join request
data ChatJoinRequestResult
  = ChatJoinRequestResultApproved -- ^ The request was approved
  | ChatJoinRequestResultDeclined -- ^ The request was decline
  | ChatJoinRequestResultQueued -- ^ The request was postponed without a decision
  deriving (Eq, Show)

instance I.ShortShow ChatJoinRequestResult where
  shortShow ChatJoinRequestResultApproved
      = "ChatJoinRequestResultApproved"
  shortShow ChatJoinRequestResultDeclined
      = "ChatJoinRequestResultDeclined"
  shortShow ChatJoinRequestResultQueued
      = "ChatJoinRequestResultQueued"

instance AT.FromJSON ChatJoinRequestResult where
  parseJSON (AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatJoinRequestResultApproved" -> pure ChatJoinRequestResultApproved
      "chatJoinRequestResultDeclined" -> pure ChatJoinRequestResultDeclined
      "chatJoinRequestResultQueued"   -> pure ChatJoinRequestResultQueued
      _                               -> mempty
    
  parseJSON _ = mempty

instance AT.ToJSON ChatJoinRequestResult where
  toJSON ChatJoinRequestResultApproved
      = A.object
        [ "@type" A..= AT.String "chatJoinRequestResultApproved"
        ]
  toJSON ChatJoinRequestResultDeclined
      = A.object
        [ "@type" A..= AT.String "chatJoinRequestResultDeclined"
        ]
  toJSON ChatJoinRequestResultQueued
      = A.object
        [ "@type" A..= AT.String "chatJoinRequestResultQueued"
        ]

