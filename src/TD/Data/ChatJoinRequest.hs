module TD.Data.ChatJoinRequest
  ( ChatJoinRequest(..)    
  , defaultChatJoinRequest 
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data ChatJoinRequest
  = ChatJoinRequest -- ^ Describes a user that sent a join request and waits for administrator approval
    { user_id :: Maybe Int    -- ^ User identifier
    , date    :: Maybe Int    -- ^ Point in time (Unix timestamp) when the user sent the join request
    , bio     :: Maybe T.Text -- ^ A short bio of the user
    }
  deriving (Eq, Show)

instance I.ShortShow ChatJoinRequest where
  shortShow ChatJoinRequest
    { user_id = user_id_
    , date    = date_
    , bio     = bio_
    }
      = "ChatJoinRequest"
        ++ I.cc
        [ "user_id" `I.p` user_id_
        , "date"    `I.p` date_
        , "bio"     `I.p` bio_
        ]

instance AT.FromJSON ChatJoinRequest where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatJoinRequest" -> parseChatJoinRequest v
      _                 -> mempty
    
    where
      parseChatJoinRequest :: A.Value -> AT.Parser ChatJoinRequest
      parseChatJoinRequest = A.withObject "ChatJoinRequest" $ \o -> do
        user_id_ <- o A..:?  "user_id"
        date_    <- o A..:?  "date"
        bio_     <- o A..:?  "bio"
        pure $ ChatJoinRequest
          { user_id = user_id_
          , date    = date_
          , bio     = bio_
          }
  parseJSON _ = mempty

instance AT.ToJSON ChatJoinRequest where
  toJSON ChatJoinRequest
    { user_id = user_id_
    , date    = date_
    , bio     = bio_
    }
      = A.object
        [ "@type"   A..= AT.String "chatJoinRequest"
        , "user_id" A..= user_id_
        , "date"    A..= date_
        , "bio"     A..= bio_
        ]

defaultChatJoinRequest :: ChatJoinRequest
defaultChatJoinRequest =
  ChatJoinRequest
    { user_id = Nothing
    , date    = Nothing
    , bio     = Nothing
    }

