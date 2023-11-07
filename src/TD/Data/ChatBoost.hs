module TD.Data.ChatBoost
  (ChatBoost(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.ChatBoostSource as ChatBoostSource

data ChatBoost
  = ChatBoost -- ^ Describes a boost applied to a chat
    { _id             :: Maybe T.Text                          -- ^ Unique identifier of the boost
    , count           :: Maybe Int                             -- ^ The number of identical boosts applied
    , source          :: Maybe ChatBoostSource.ChatBoostSource -- ^ Source of the boost
    , start_date      :: Maybe Int                             -- ^ Point in time (Unix timestamp) when the chat was boosted
    , expiration_date :: Maybe Int                             -- ^ Point in time (Unix timestamp) when the boost will expire
    }
  deriving (Eq, Show)

instance I.ShortShow ChatBoost where
  shortShow ChatBoost
    { _id             = _id_
    , count           = count_
    , source          = source_
    , start_date      = start_date_
    , expiration_date = expiration_date_
    }
      = "ChatBoost"
        ++ I.cc
        [ "_id"             `I.p` _id_
        , "count"           `I.p` count_
        , "source"          `I.p` source_
        , "start_date"      `I.p` start_date_
        , "expiration_date" `I.p` expiration_date_
        ]

instance AT.FromJSON ChatBoost where
  parseJSON v@(AT.Object obj) = do
    t <- obj A..: "@type" :: AT.Parser String

    case t of
      "chatBoost" -> parseChatBoost v
      _           -> mempty
    
    where
      parseChatBoost :: A.Value -> AT.Parser ChatBoost
      parseChatBoost = A.withObject "ChatBoost" $ \o -> do
        _id_             <- o A..:?  "id"
        count_           <- o A..:?  "count"
        source_          <- o A..:?  "source"
        start_date_      <- o A..:?  "start_date"
        expiration_date_ <- o A..:?  "expiration_date"
        pure $ ChatBoost
          { _id             = _id_
          , count           = count_
          , source          = source_
          , start_date      = start_date_
          , expiration_date = expiration_date_
          }
  parseJSON _ = mempty

