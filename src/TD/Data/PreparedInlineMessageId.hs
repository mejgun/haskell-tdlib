module TD.Data.PreparedInlineMessageId
  (PreparedInlineMessageId(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

data PreparedInlineMessageId
  = PreparedInlineMessageId -- ^ Represents an inline message that can be sent via the bot
    { _id             :: Maybe T.Text -- ^ Unique identifier for the message
    , expiration_date :: Maybe Int    -- ^ Point in time (Unix timestamp) when the message can't be used anymore
    }
  deriving (Eq, Show)

instance I.ShortShow PreparedInlineMessageId where
  shortShow PreparedInlineMessageId
    { _id             = _id_
    , expiration_date = expiration_date_
    }
      = "PreparedInlineMessageId"
        ++ I.cc
        [ "_id"             `I.p` _id_
        , "expiration_date" `I.p` expiration_date_
        ]

instance AT.FromJSON PreparedInlineMessageId where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "preparedInlineMessageId" -> parsePreparedInlineMessageId v
      _                         -> mempty
    
    where
      parsePreparedInlineMessageId :: A.Value -> AT.Parser PreparedInlineMessageId
      parsePreparedInlineMessageId = A.withObject "PreparedInlineMessageId" $ \o -> do
        _id_             <- o A..:?  "id"
        expiration_date_ <- o A..:?  "expiration_date"
        pure $ PreparedInlineMessageId
          { _id             = _id_
          , expiration_date = expiration_date_
          }
  parseJSON _ = mempty

