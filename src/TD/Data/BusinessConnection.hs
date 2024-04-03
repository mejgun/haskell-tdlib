module TD.Data.BusinessConnection
  (BusinessConnection(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data BusinessConnection
  = BusinessConnection -- ^ Describes a connection of the bot with a business account
    { _id          :: Maybe T.Text -- ^ Unique identifier of the connection
    , user_id      :: Maybe Int    -- ^ Identifier of the business user that created the connection
    , user_chat_id :: Maybe Int    -- ^ Chat identifier of the private chat with the user
    , date         :: Maybe Int    -- ^ Point in time (Unix timestamp) when the connection was established
    , can_reply    :: Maybe Bool   -- ^ True, if the bot can send messages to the connected user; false otherwise
    , is_enabled   :: Maybe Bool   -- ^ True, if the connection is enabled; false otherwise
    }
  deriving (Eq, Show)

instance I.ShortShow BusinessConnection where
  shortShow BusinessConnection
    { _id          = _id_
    , user_id      = user_id_
    , user_chat_id = user_chat_id_
    , date         = date_
    , can_reply    = can_reply_
    , is_enabled   = is_enabled_
    }
      = "BusinessConnection"
        ++ I.cc
        [ "_id"          `I.p` _id_
        , "user_id"      `I.p` user_id_
        , "user_chat_id" `I.p` user_chat_id_
        , "date"         `I.p` date_
        , "can_reply"    `I.p` can_reply_
        , "is_enabled"   `I.p` is_enabled_
        ]

instance AT.FromJSON BusinessConnection where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "businessConnection" -> parseBusinessConnection v
      _                    -> mempty
    
    where
      parseBusinessConnection :: A.Value -> AT.Parser BusinessConnection
      parseBusinessConnection = A.withObject "BusinessConnection" $ \o -> do
        _id_          <- o A..:?  "id"
        user_id_      <- o A..:?  "user_id"
        user_chat_id_ <- o A..:?  "user_chat_id"
        date_         <- o A..:?  "date"
        can_reply_    <- o A..:?  "can_reply"
        is_enabled_   <- o A..:?  "is_enabled"
        pure $ BusinessConnection
          { _id          = _id_
          , user_id      = user_id_
          , user_chat_id = user_chat_id_
          , date         = date_
          , can_reply    = can_reply_
          , is_enabled   = is_enabled_
          }
  parseJSON _ = mempty

